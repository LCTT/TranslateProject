[#]: subject: "Behind \"Hello World\" on Linux"
[#]: via: "https://jvns.ca/blog/2023/08/03/behind--hello-world/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16138-1.html"

Linux 下“Hello World”的幕后发生了什么
======

![][0]

今天我在想 —— 当你在 Linux 上运行一个简单的 “Hello World” Python 程序时，发生了什么，就像下面这个？

```
print("hello world")
```

这就是在命令行下的情况：

```
$ python3 hello.py
hello world
```

但是在幕后，实际上有更多的事情在发生。我将描述一些发生的情况，并且（更重要的是）解释一些你可以用来查看幕后情况的工具。我们将用 `readelf`、`strace`、`ldd`、`debugfs`、`/proc`、`ltrace`、`dd` 和 `stat`。我不会讨论任何只针对 Python 的部分 —— 只研究一下当你运行任何动态链接的可执行文件时发生的事情。

### 0、在执行 execve 之前

要启动 Python 解释器，很多步骤都需要先行完成。那么，我们究竟在运行哪一个可执行文件呢？它在何处呢？

### 1、解析 python3 hello.py

Shell 将 `python3 hello.py` 解析成一条命令和一组参数：`python3` 和 `['hello.py']`。

在此过程中，可能会进行一些如全局扩展等操作。举例来说，如果你执行 `python3 *.py` ，Shell 会将其扩展到 `python3 hello.py`。

### 2、确认 python3 的完整路径

现在，我们了解到需要执行 `python3`。但是，这个二进制文件的完整路径是什么呢？解决办法是使用一个名为 `PATH` 的特殊环境变量。

**自行验证**：在你的 Shell 中执行 `echo $PATH`。对我来说，它的输出如下：

```
$ echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
```

当执行一个命令时，Shell 将会依序在 `PATH` 列表中的每个目录里搜索匹配的文件。

对于 `fish`（我的 Shell），你可以在 [这里][11] 查看路径解析的逻辑。它使用 `stat` 系统调用去检验是否存在文件。

**自行验证**：执行 `strace -e stat bash`，然后运行像 `python3` 这样的命令。你应该会看到如下输出：

```
stat("/usr/local/sbin/python3", 0x7ffcdd871f40) = -1 ENOENT (No such file or directory)
stat("/usr/local/bin/python3", 0x7ffcdd871f40) = -1 ENOENT (No such file or directory)
stat("/usr/sbin/python3", 0x7ffcdd871f40) = -1 ENOENT (No such file or directory)
stat("/usr/bin/python3", {st_mode=S_IFREG|0755, st_size=5479736, ...}) = 0
```

你可以观察到，一旦在 `/usr/bin/python3` 找到了二进制文件，搜索就会立即终止：它不会继续去 `/sbin` 或 `/bin` 中查找。

#### 对 execvp 的补充说明

如果你想要不用自己重新实现，而运行和 Shell 同样的 `PATH` 搜索逻辑，你可以使用 libc 函数 `execvp`（或其它一些函数名中含有 `p` 的 `exec*` 函数）。

### 3、stat 的背后运作机制

你可能在思考，Julia，`stat` 到底做了什么？当你的操作系统要打开一个文件时，主要分为两个步骤：

1. 它将 **文件名** 映射到一个包含该文件元数据的 **inode**
2. 它利用这个 **inode** 来获取文件的实际内容

`stat` 系统调用只是返回文件的 inode 内容 —— 它并不读取任何的文件内容。好处在于这样做速度非常快。接下来让我们一起来快速了解一下 inode。（在 Dmitry Mazin 的这篇精彩文章 《[磁盘就是一堆比特][12]》中有更多的详细内容）

```
$ stat /usr/bin/python3
  File: /usr/bin/python3 -> python3.9
  Size: 9           Blocks: 0          IO Block: 4096   symbolic link
Device: fe01h/65025d    Inode: 6206        Links: 1
Access: (0777/lrwxrwxrwx)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2023-08-03 14:17:28.890364214 +0000
Modify: 2021-04-05 12:00:48.000000000 +0000
Change: 2021-06-22 04:22:50.936969560 +0000
 Birth: 2021-06-22 04:22:50.924969237 +0000
```

**自行验证**：我们来实际查看一下硬盘上 inode 的确切位置。

首先，我们需要找出硬盘的设备名称：

```
$ df
...
tmpfs             100016      604     99412   1% /run
/dev/vda1       25630792 14488736  10062712  60% /
...
```

看起来它是 `/dev/vda1`。接着，让我们寻找 `/usr/bin/python3` 的 inode 在我们硬盘上的确切位置（在 debugfs 提示符下输入 `imap` 命令）：

```
$ sudo debugfs /dev/vda1
debugfs 1.46.2 (28-Feb-2021)
debugfs:  imap /usr/bin/python3
Inode 6206 is part of block group 0
    located at block 658, offset 0x0d00
```

我不清楚 `debugfs` 是如何确定文件名对应的 inode 的位置，但我们暂时不需要深入研究这个。

现在，我们需要计算硬盘中 “块 658，偏移量 0x0d00” 处是多少个字节，这个大的字节数组就是你的硬盘。每个块有 4096 个字节，所以我们需要到 `4096 * 658 + 0x0d00` 字节。使用计算器可以得到，这个值是 `2698496`。

```
$ sudo dd if=/dev/vda1 bs=1 skip=2698496 count=256 2>/dev/null | hexdump -C
00000000  ff a1 00 00 09 00 00 00  f8 b6 cb 64 9a 65 d1 60  |...........d.e.`|
00000010  f0 fb 6a 60 00 00 00 00  00 00 01 00 00 00 00 00  |..j`............|
00000020  00 00 00 00 01 00 00 00  70 79 74 68 6f 6e 33 2e  |........python3.|
00000030  39 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |9...............|
00000040  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00000060  00 00 00 00 12 4a 95 8c  00 00 00 00 00 00 00 00  |.....J..........|
00000070  00 00 00 00 00 00 00 00  00 00 00 00 2d cb 00 00  |............-...|
00000080  20 00 bd e7 60 15 64 df  00 00 00 00 d8 84 47 d4  | ...`.d.......G.|
00000090  9a 65 d1 60 54 a4 87 dc  00 00 00 00 00 00 00 00  |.e.`T...........|
000000a0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
```

好极了！我们找到了 inode！你可以在里面看到 `python3`，这是一个很好的迹象。我们并不打算深入了解所有这些，但是 [Linux 内核的 ext4 inode 结构][13] 指出，前 16 位是 “模式”，即权限。所以现在我们将看一下 `ffa1` 如何对应到文件权限。

* `ffa1` 对应的数字是 `0xa1ff`，或者 41471（因为 x86 是小端表示）
* 41471 用八进制表示就是 `0120777`
* 这有些奇怪 - 那个文件的权限肯定可以是 `777`，但前三位是什么呢？我以前没见过这些！你可以在 [inode 手册页][14] 中找到 `012` 的含义（向下滚动到“文件类型和模式”）。这里有一个小的表格说 `012` 表示 “符号链接”。

我们查看一下这个文件，确实是一个权限为 `777` 的符号链接：

```
$ ls -l /usr/bin/python3
lrwxrwxrwx 1 root root 9 Apr  5  2021 /usr/bin/python3 -> python3.9
```

它确实是！耶，我们正确地解码了它。

### 4、准备复刻

我们尚未准备好启动 `python3`。首先，Shell 需要创建一个新的子进程来进行运行。在 Unix 上，新的进程启动的方式有些特殊 - 首先进程克隆自己，然后运行 `execve`，这会将克隆的进程替换为新的进程。

**自行验证：** 运行 `strace -e clone bash`，然后运行 `python3`。你应该会看到类似下面的输出：

```
clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x7f03788f1a10) = 3708100
```

`3708100` 是新进程的 PID，这是 Shell 进程的子进程。

这里有些工具可以查看进程的相关信息：

  * `pstree` 会展示你的系统中所有进程的树状图
  * `cat /proc/PID/stat` 会显示一些关于该进程的信息。你可以在 `man proc` 中找到这个文件的内容说明。例如，第四个字段是父进程的PID。

#### 新进程的继承

新的进程（即将变为 `python3` 的）从 Shell 中继承了很多内容。例如，它继承了：

  1. **环境变量**：你可以通过 `cat /proc/PID/environ | tr '\0' '\n'` 查看
  2. **标准输出和标准错误的文件描述符**：通过 `ls -l /proc/PID/fd` 查看
  3. **工作目录**（也就是当前目录）
  4. **命名空间和控制组**（如果它在一个容器内）
  5. 运行它的**用户**以及**群组**
  6. 还有可能是我此刻未能列举出来的更多东西

### 5、Shell 调用 execve

现在我们准备好启动 Python 解释器了！

**自行验证**：运行 `strace -f -e execve bash`，接着运行 `python3`。其中的 `-f` 参数非常重要，因为我们想要跟踪任何可能产生的子进程。你应该可以看到如下的输出：

```
[pid 3708381] execve("/usr/bin/python3", ["python3"], 0x560397748300 /* 21 vars */) = 0
```

第一个参数是这个二进制文件，而第二个参数是命令行参数列表。这些命令行参数被放置在程序内存的特定位置，以便在运行时可以访问。

那么，`execve` 内部到底发生了什么呢？

### 6、获取该二进制文件的内容

我们首先需要打开 `python3` 的二进制文件并读取其内容。直到目前为止，我们只使用了 `stat` 系统调用来获取其元数据，但现在我们需要获取它的内容。

让我们再次查看 `stat` 的输出：

```
$ stat /usr/bin/python3
  File: /usr/bin/python3 -> python3.9
  Size: 9           Blocks: 0          IO Block: 4096   symbolic link
Device: fe01h/65025d    Inode: 6206        Links: 1
...
```

该文件在磁盘上占用 0 个块的空间。这是因为符号链接（`python3.9`）的内容实际上是存储在 inode 自身中：在下面显示你可以看到（来自上述 inode 的二进制内容，以 `hexdump` 格式分为两行输出）。

```
00000020  00 00 00 00 01 00 00 00  70 79 74 68 6f 6e 33 2e  |........python3.|
00000030  39 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |9...............|
```

因此，我们将需要打开 `/usr/bin/python3.9` 。所有这些操作都在内核内部进行，所以你并不会看到其他的系统调用。

每个文件都由硬盘上的一系列的 **块** 构成。我知道我系统中的每个块是 4096 字节，所以一个文件的最小大小是 4096 字节 —— 甚至如果文件只有 5 字节，它在磁盘上仍然占用 4KB。

**自行验证**：我们可以通过 `debugfs` 找到块号，如下所示：（再次说明，我从 Dmitry Mazin 的《[磁盘就是一堆比特][12]》文章中得知这些步骤）。

```
$ debugfs /dev/vda1
debugfs:  blocks /usr/bin/python3.9
145408 145409 145410 145411 145412 145413 145414 145415 145416 145417 145418 145419 145420 145421 145422 145423 145424 145425 145426 145427 145428 145429 145430 145431 145432 145433 145434 145435 145436 145437
```

接下来，我们可以使用 `dd` 来读取文件的第一个块。我们将块大小设定为 4096 字节，跳过 `145408` 个块，然后读取 1 个块。

```
$ dd if=/dev/vda1 bs=4096 skip=145408 count=1 2>/dev/null | hexdump -C | head
00000000  7f 45 4c 46 02 01 01 00  00 00 00 00 00 00 00 00  |.ELF............|
00000010  02 00 3e 00 01 00 00 00  c0 a5 5e 00 00 00 00 00  |..>.......^.....|
00000020  40 00 00 00 00 00 00 00  b8 95 53 00 00 00 00 00  |@.........S.....|
00000030  00 00 00 00 40 00 38 00  0b 00 40 00 1e 00 1d 00  |....@.8...@.....|
00000040  06 00 00 00 04 00 00 00  40 00 00 00 00 00 00 00  |........@.......|
00000050  40 00 40 00 00 00 00 00  40 00 40 00 00 00 00 00  |@.@.....@.@.....|
00000060  68 02 00 00 00 00 00 00  68 02 00 00 00 00 00 00  |h.......h.......|
00000070  08 00 00 00 00 00 00 00  03 00 00 00 04 00 00 00  |................|
00000080  a8 02 00 00 00 00 00 00  a8 02 40 00 00 00 00 00  |..........@.....|
00000090  a8 02 40 00 00 00 00 00  1c 00 00 00 00 00 00 00  |..@.............|
```

你会发现，这样我们得到的输出结果与直接使用 `cat` 读取文件所获得的结果完全一致。

```
$ cat /usr/bin/python3.9 | hexdump -C | head
00000000  7f 45 4c 46 02 01 01 00  00 00 00 00 00 00 00 00  |.ELF............|
00000010  02 00 3e 00 01 00 00 00  c0 a5 5e 00 00 00 00 00  |..>.......^.....|
00000020  40 00 00 00 00 00 00 00  b8 95 53 00 00 00 00 00  |@.........S.....|
00000030  00 00 00 00 40 00 38 00  0b 00 40 00 1e 00 1d 00  |....@.8...@.....|
00000040  06 00 00 00 04 00 00 00  40 00 00 00 00 00 00 00  |........@.......|
00000050  40 00 40 00 00 00 00 00  40 00 40 00 00 00 00 00  |@.@.....@.@.....|
00000060  68 02 00 00 00 00 00 00  68 02 00 00 00 00 00 00  |h.......h.......|
00000070  08 00 00 00 00 00 00 00  03 00 00 00 04 00 00 00  |................|
00000080  a8 02 00 00 00 00 00 00  a8 02 40 00 00 00 00 00  |..........@.....|
00000090  a8 02 40 00 00 00 00 00  1c 00 00 00 00 00 00 00  |..@.............|
```

#### 关于魔术数字的额外说明

这个文件以 `ELF` 开头，这是一个被称为“<ruby>魔术数字<rt>magic number</rt></ruby>”的标识符，它是一种字节序列，告诉我们这是一个 ELF 文件。在 Linux 上，ELF 是二进制文件的格式。

不同的文件格式有不同的魔术数字。例如，gzip 的魔数是 `1f8b`。文件开头的魔术数字就是 `file blah.gz` 如何识别出它是一个 gzip 文件的方式。

我认为 `file` 命令使用了各种启发式方法来确定文件的类型，而其中，魔术数字是一个重要的特征。

### 7、寻找解释器

我们来解析这个 ELF 文件，看看里面都有什么内容。

**自行验证**：运行 `readelf -a /usr/bin/python3.9`。我得到的结果是这样的（但是我删减了大量的内容）：

```
$ readelf -a /usr/bin/python3.9
ELF Header:
    Class:                             ELF64
    Machine:                           Advanced Micro Devices X86-64
...
->  Entry point address:               0x5ea5c0
...
Program Headers:
  Type           Offset             VirtAddr           PhysAddr
  INTERP         0x00000000000002a8 0x00000000004002a8 0x00000000004002a8
                 0x000000000000001c 0x000000000000001c  R      0x1
->      [Requesting program interpreter: /lib64/ld-linux-x86-64.so.2]
        ...
->        1238: 00000000005ea5c0    43 FUNC    GLOBAL DEFAULT   13 _start

```

从这段内容中，我理解到：

  1. 请求内核运行 `/lib64/ld-linux-x86-64.so.2` 来启动这个程序。这就是所谓的**动态链接器**，我们将在随后的部分对其进行讨论。
  2. 该程序制定了一个入口点（位于 `0x5ea5c0`），那里是这个程序代码开始的地方。

接下来，让我们一起来聊聊动态链接器。

### 8、动态链接

好的！我们已从磁盘读取了字节数据，并启动了这个“解释器”。那么，接下来会发生什么呢？如果你执行 `strace -o out.strace python3`，你会在 `execve` 系统调用之后观察到一系列的信息：

```
execve("/usr/bin/python3", ["python3"], 0x560af13472f0 /* 21 vars */) = 0
brk(NULL)                       = 0xfcc000
access("/etc/ld.so.preload", R_OK) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=32091, ...}) = 0
mmap(NULL, 32091, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f718a1e3000
close(3)                        = 0
openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libpthread.so.0", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0 l\0\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=149520, ...}) = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f718a1e1000
...
close(3)                        = 0
openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libdl.so.2", O_RDONLY|O_CLOEXEC) = 3
```

这些内容初看可能让人望而生畏，但我希望你能重点关注这一部分：`openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libpthread.so.0" ...`。这里正在打开一个被称为 `pthread` 的 C 语言线程库，运行 Python 解释器时需要这个库。

**自行验证**：如果你想知道一个二进制文件在运行时需要加载哪些库，你可以使用 `ldd` 命令。下面展示的是我运行后的效果：

```
$ ldd /usr/bin/python3.9
    linux-vdso.so.1 (0x00007ffc2aad7000)
    libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007f2fd6554000)
    libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f2fd654e000)
    libutil.so.1 => /lib/x86_64-linux-gnu/libutil.so.1 (0x00007f2fd6549000)
    libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007f2fd6405000)
    libexpat.so.1 => /lib/x86_64-linux-gnu/libexpat.so.1 (0x00007f2fd63d6000)
    libz.so.1 => /lib/x86_64-linux-gnu/libz.so.1 (0x00007f2fd63b9000)
    libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f2fd61e3000)
    /lib64/ld-linux-x86-64.so.2 (0x00007f2fd6580000)
```

你可以看到，第一个列出的库就是 `/lib/x86_64-linux-gnu/libpthread.so.0`，这就是它被第一个加载的原因。

#### 关于 LD_LIBRARY_PATH

说实话，我关于动态链接的理解还有些模糊，以下是我所了解的一些内容：

  * 动态链接发生在用户空间，我的系统上的动态链接器位于 `/lib64/ld-linux-x86-64.so.2`. 如果你缺少动态链接器，可能会遇到一些奇怪的问题，比如这种 [奇怪的“文件未找到”错误][15]
  * 动态链接器使用 `LD_LIBRARY_PATH` 环境变量来查找库
  * 动态链接器也会使用 `LD_PRELOAD` 环境变量来覆盖你想要的任何动态链接函数（你可以使用它来进行 [有趣的魔改][16]，或者使用像 jemalloc 这样的替代品来替换默认内存分配器）
  * `strace` 的输出中有一些 `mprotect`，因为安全原因将库代码标记为只读
  * 在 Mac 上，不是使用 `LD_LIBRARY_PATH`（Linux），而是 `DYLD_LIBRARY_PATH`

你可能会有疑问，如果动态链接发生在用户空间，我们为什么没有看到大量的 `stat` 系统调用在 `LD_LIBRARY_PATH` 中搜索这些库，就像 Bash 在 `PATH` 中搜索那样？

这是因为 `ld` 在 `/etc/ld.so.cache` 中有一个缓存，因此所有之前已经找到的库都会被记录在这里。你可以在 `strace` 的输出中看到它正在打开缓存 - `openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3`。

在 [完整的 strace 输出][17] 中，我仍然对动态链接之后出现的一些系统调用感到困惑（什么是 `prlimit64`？本地环境的内容是如何介入的？`gconv-modules.cache` 是什么？`rt_sigaction` 做了什么？`arch_prctl` 是什么？以及 `set_tid_address` 和 `set_robust_list` 是什么？）。尽管如此，我觉得已经有了一个不错的开头。

#### 旁注：ldd 实际上是一个简单的 Shell 脚本！

在 Mastodon 上，有人 [指出][18]，`ldd` 实际上是一个 Shell 脚本，它设置了  `LD_TRACE_LOADED_OBJECTS=1` 环境变量，然后启动程序。因此，你也可以通过以下方式实现相同的功能：

```
$ LD_TRACE_LOADED_OBJECTS=1 python3
    linux-vdso.so.1 (0x00007ffe13b0a000)
    libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0 (0x00007f01a5a47000)
    libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f01a5a41000)
    libutil.so.1 => /lib/x86_64-linux-gnu/libutil.so.1 (0x00007f2fd6549000)
    libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007f2fd6405000)
    libexpat.so.1 => /lib/x86_64-linux-gnu/libexpat.so.1 (0x00007f2fd63d6000)
    libz.so.1 => /lib/x86_64-linux-gnu/libz.so.1 (0x00007f2fd63b9000)
    libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f2fd61e3000)
    /lib64/ld-linux-x86-64.so.2 (0x00007f2fd6580000)
```

事实上，`ld` 也是一个可以直接运行的二进制文件，所以你也可以通过 `/lib64/ld-linux-x86-64.so.2 --list /usr/bin/python3.9` 来达到相同的效果。

#### 关于 init 和 fini

让我们来谈谈这行 `strace` 输出中的内容：

```
set_tid_address(0x7f58880dca10) = 3709103
```

这似乎与线程有关，我认为这可能是因为 `pthread` 库（以及所有其他动态加载的库）在加载时得以运行初始化代码。在库加载时运行的代码位于 `init` 区域（或者也可能是 `.ctors` 区域）。

**自行验证**：让我们使用 `readelf` 来看看这个：

```
$ readelf -a /lib/x86_64-linux-gnu/libpthread.so.0
...
  [10] .rela.plt         RELA             00000000000051f0  000051f0
       00000000000007f8  0000000000000018  AI       4    26     8
  [11] .init             PROGBITS         0000000000006000  00006000
       000000000000000e  0000000000000000  AX       0     0     4
  [12] .plt              PROGBITS         0000000000006010  00006010
       0000000000000560  0000000000000010  AX       0     0     16
...
```

这个库没有 `.ctors` 区域，只有一个 `.init`。但是，`.init` 区域都有些什么内容呢？我们可以使用 `objdump` 来反汇编这段代码：

```
$ objdump -d /lib/x86_64-linux-gnu/libpthread.so.0
Disassembly of section .init:

0000000000006000 <_init>:
    6000:       48 83 ec 08             sub    $0x8,%rsp
    6004:       e8 57 08 00 00          callq  6860 <__pthread_initialize_minimal>
    6009:       48 83 c4 08             add    $0x8,%rsp
    600d:       c3
```

所以它在调用 `__pthread_initialize_minimal`。我在 glibc 中找到了 [这个函数的代码][18A]，尽管我不得不找到一个较早版本的 glibc，因为在更近的版本中，libpthread [不再是一个独立的库][18B]。

我不确定这个 `set_tid_address` 系统调用是否实际上来自 `__pthread_initialize_minimal`，但至少我们知道了库可以通过 `.init` 区域在启动时运行代码。

这里有一份关于 .init 区域的 elf 手册的笔记：

```
$ man elf
```

`.init` 这个区域保存着对进程初始化代码有贡献的可执行指令。当程序开始运行时，系统会安排在调用主程序入口点之前执行该区域中的代码。

在 ELF 文件中也有一个在结束时运行的 `.fini` 区域，以及其他可以存在的区域 `.ctors` / `.dtors`（构造器和析构器）。

好的，关于动态链接就说这么多。

### 9、转到 _start

在动态链接完成后，我们进入到 Python 解释器中的 `_start`。然后，它将执行所有正常的 Python 解析器会做的事情。

我不打算深入讨论这个，因为我在这里关心的是关于如何在 Linux 上运行二进制文件的一般性知识，而不是特别针对 Python 解释器。

### 10、写入字符串

不过，我们仍然需要打印出 “hello world”。在底层，Python 的 `print` 函数调用了 libc 中的某个函数。但是，它调用了哪一个呢？让我们来找出答案！

**自行验证**：运行 `ltrace -o out python3 hello.py`：

```
$ ltrace -o out python3 hello.py
$ grep hello out
write(1, "hello world\n", 12) = 12
```

看起来它确实在调用 `write` 函数。

我必须承认，我对 `ltrace` 总是有一些疑虑 —— 与我深信不疑的 `strace` 不同，我总是不完全确定 `ltrace` 是否准确地报告了库调用。但在这个情况下，它似乎有效。并且，如果我们查阅 [cpython 的源代码][19]，它似乎在一些地方确实调用了 `write()` 函数，所以我倾向于相信这个结果。

#### 什么是 libc？

我们刚刚提到，Python 调用了 libc 中的 `write` 函数。那么，libc 是什么呢？它是 C 的标准库，负责许多基本操作，例如：

  * 用 `malloc` 分配内存
  * 文件 I/O（打开/关闭文件）
  * 执行程序（像我们之前提到的 `execvp`）
  * 使用 `getaddrinfo` 查找 DNS 记录
  * 使用 `pthread` 管理线程

在 Linux 上，程序不一定需要使用 libc（例如 Go 就广为人知地未使用它，而是直接调用了 Linux 系统调用），但是我常用的大多数其他编程语言（如 node、Python、Ruby、Rust）都使用了 libc。我不确定 Java 是否也使用了。

你能通过在你的二进制文件上执行 `ldd` 命令，检查你是否正在使用 libc：如果你看到了 `libc.so.6` 这样的信息，那么你就在使用 libc。

#### 为什么 libc 重要？

你也许在思考 —— 为何重要的是 Python 调用 libc 的 `write` 函数，然后 libc 再调用 `write` 系统调用？为何我要着重提及 `libc` 是调用过程的一环？

我认为，在这个案例中，这并不真的很重要（根据我所知，libc 的 `write` 函数与 `write` 系统调用的映射相当直接）。

然而，存在不同的 libc 实现，有时它们的行为会有所不同。两个主要的实现是 glibc（GNU libc）和 musl libc。

例如，直到最近，[musl 的 `getaddrinfo` 并不支持 TCP DNS][20]，[这是一篇关于这个问题引发的错误的博客文章][21]。

#### 关于 stdout 和终端的小插曲

在我们的程序中，stdout（`1` 文件描述符）是一个终端。你可以在终端上做一些有趣的事情！例如：

  1. 在终端中运行 `ls -l /proc/self/fd/1`。我得到了 `/dev/pts/2` 的结果。
  2. 在另一个终端窗口中，运行 `echo hello > /dev/pts/2`。
  3. 返回到原始终端窗口。你应会看到 `hello` 被打印出来了！

### 暂时就到这儿吧!

希望通过上文，你对 `hello world` 是如何打印出来的有了更深的了解！我暂时不再添加更多的细节，因为这篇文章已经足够长了，但显然还有更多的细节可以探讨，如果大家能提供更多的细节，我可能会添加更多的内容。如果你有关于我在这里没提到的程序内部调用过程的任何工具推荐，我会特别高兴。

### 我很期待看到一份 Mac 版的解析

我对 Mac OS 的一个懊恼是，我不知道如何在这个级别上解读我的系统——当我打印 “hello world”，我无法像在 Linux 上那样，窥视背后的运作机制。我很希望看到一个深度的解析。

我所知道的一些在 Mac 下的对应工具：

  * `ldd` -> `otool -L`
  * `readelf` -> `otool`
  * 有人说你可以在 Mac 上使用 `dtruss` 或 `dtrace` 来代替 `strace`，但我尚未有足够的勇气关闭系统完整性保护来让它工作。
  * `strace` -> `sc_usage` 似乎能够收集关于系统调用使用情况的统计信息，`fs_usage` 则可以收集文件使用情况的信息。

### 延伸阅读

一些附加的链接：

* [快速教程：如何在 Linux 上创建超小型 ELF 可执行文件][22]
* [在 FreeBSD 上探索 “hello world”][23]
* [微观视角下的 Windows 中 “Hello World”][23A]
* 来自 LWN 的文章：[如何运行程序][24] （[以及第二部分][25]）详尽介绍了 `execve` 的内部机制
* Lexi Mattick 的文章，[赋予 CPU “你” 的存在][26]
* [从零开始在 6502 上实现 “Hello, World”][26A] （来自 Ben Eater 的视频）

*（题图：MJ/b87ed0a2-80d6-49cd-b2bf-1ef822485e3f）*

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2023/08/03/behind--hello-world/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：ChatGPT
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: tmp.jwyQxZQiCF#1-the-shell-parses-the-string-python3-hello-py-into-a-command-to-run-and-a-list-of-arguments-python3-and-hello-py
[2]: tmp.jwyQxZQiCF#2-the-shell-figures-out-the-full-path-to-python3
[3]: tmp.jwyQxZQiCF#3-stat-under-the-hood
[4]: tmp.jwyQxZQiCF#4-time-to-fork
[5]: tmp.jwyQxZQiCF#5-the-shell-calls-execve
[6]: tmp.jwyQxZQiCF#6-get-the-binary-s-contents
[7]: tmp.jwyQxZQiCF#7-find-the-interpreter
[8]: tmp.jwyQxZQiCF#8-dynamic-linking
[9]: tmp.jwyQxZQiCF#9-go-to-start
[10]: tmp.jwyQxZQiCF#10-write-a-string
[11]: https://github.com/fish-shell/fish-shell/blob/900a0487443f10caa6539634ca8c49fb6e3ce5ba/src/path.cpp#L31-L45
[12]: https://www.cyberdemon.org/2023/07/19/bunch-of-bits.html
[13]: https://github.com/torvalds/linux/blob/fdf0eaf11452d72945af31804e2a1048ee1b574c/fs/ext4/ext4.h#L769
[14]: https://man7.org/linux/man-pages/man7/inode.7.html
[15]: https://jvns.ca/blog/2021/11/17/debugging-a-weird--file-not-found--error/
[16]: https://jvns.ca/blog/2014/11/27/ld-preload-is-super-fun-and-easy/
[17]: https://gist.github.com/jvns/4254251bea219568df9f43a2efd8d0f5
[18]: https://octodon.social/@lkundrak/110832640058459399
[18A]: https://github.com/bminor/glibc/blob/a78e5979a92c7985eadad7246740f3874271303f/nptl/nptl-init.c#L100
[18B]: https://developers.redhat.com/articles/2021/12/17/why-glibc-234-removed-libpthread
[19]: https://github.com/python/cpython/blob/400835ea1626c8c6dcd967c7eabe0dad4a923182/Python/fileutils.c#L1955
[20]: https://www.openwall.com/lists/musl/2023/05/02/1
[21]: https://christoph.luppri.ch/fixing-dns-resolution-for-ruby-on-alpine-linux
[22]: https://www.muppetlabs.com/~breadbox/software/tiny/teensy.html
[23]: https://people.freebsd.org/~brooks/talks/asiabsdcon2017-helloworld/helloworld.pdf
[24]: https://lwn.net/Articles/630727/
[25]: https://lwn.net/Articles/631631/
[26]: https://cpu.land/how-to-run-a-program
[26A]: https://www.youtube.com/watch?v=LnzuMJLZRdU
[0]: https://img.linux.net.cn/data/attachment/album/202308/29/143604o5o22os0h20d4lz5.jpg