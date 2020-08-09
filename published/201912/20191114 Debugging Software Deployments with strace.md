[#]: collector: (lujun9972)
[#]: translator: (hanwckf)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11667-1.html)
[#]: subject: (Debugging Software Deployments with strace)
[#]: via: (https://theartofmachinery.com/2019/11/14/deployment_debugging_strace.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)

在软件部署中使用 strace 进行调试
======

![](https://img.linux.net.cn/data/attachment/album/201912/12/130413poennny2pbrgy9ot.jpg)

我的大部分工作都涉及到部署软件系统，这意味着我需要花费很多时间来解决以下问题：

* 这个软件可以在原开发者的机器上工作，但是为什么不能在我这里运行？
* 这个软件昨天可以在我的机器上工作，但是为什么今天就不行？

这是一种调试的类型，但是与一般的软件调试有所不同。一般的调试通常只关心代码的逻辑，但是在软件部署中的调试关注的是程序的代码和它所在的运行环境之间的相互影响。即便问题的根源是代码的逻辑错误，但软件显然可以在别的机器上运行的事实意味着这类问题与运行环境密切相关。

所以，在软件部署过程中，我没有使用传统的调试工具（例如 `gdb`），而是选择了其它工具进行调试。我最喜欢的用来解决“为什么这个软件无法在这台机器上运行？”这类问题的工具就是 `strace`。

### 什么是 strace？

[strace][1] 是一个用来“追踪系统调用”的工具。它主要是一个 Linux 工具，但是你也可以在其它系统上使用类似的工具（例如 [DTrace][2] 和 [ktrace][3]）。

它的基本用法非常简单。只需要在 `strace` 后面跟上你需要运行的命令，它就会显示出该命令触发的所有系统调用（你可能需要先安装好 `strace`）：

```
$ strace echo Hello
...Snip lots of stuff...
write(1, "Hello\n", 6)                  = 6
close(1)                                = 0
close(2)                                = 0
exit_group(0)                           = ?
+++ exited with 0 +++
```

这些系统调用都是什么？它们就像是操作系统内核提供的 API。很久以前，软件拥有直接访问硬件的权限。如果软件需要在屏幕上显示一些东西，它将会与视频硬件的端口和内存映射寄存器纠缠不清。当多任务操作系统变得流行以后，这就导致了混乱的局面，因为不同的应用程序将“争夺”硬件，并且一个应用程序的错误可能致使其它应用程序崩溃，甚至导致整个系统崩溃。所以 CPU 开始支持多种不同的特权模式（或者称为“保护环”）。它们让操作系统内核在具有完全硬件访问权限的最高特权模式下运行，于此同时，其它在低特权模式下运行的应用程序必须通过向内核发起系统调用才能够与硬件进行交互。

在二进制级别上，发起系统调用相比简单的函数调用有一些区别，但是大部分程序都使用标准库提供的封装函数。例如，POSIX C 标准库包含一个 `write()` 函数，该函数包含用于进行 `write` 系统调用的所有与硬件体系结构相关的代码。

![][4]

简单来说，一个应用程序与其环境（计算机系统）的交互都是通过系统调用来完成的。所以当软件在一台机器上可以工作但是在另一台机器无法工作的时候，追踪系统调用是一个很好的查错方法。具体地说，你可以通过追踪系统调用分析以下典型操作：

  * 控制台输入与输出 (IO)
  * 网络 IO
  * 文件系统访问以及文件 IO
  * 进程/线程生命周期管理
  * 原始内存管理
  * 访问特定的设备驱动

### 什么时候可以使用 strace？

理论上，`strace` 适用于任何用户空间程序，因为所有的用户空间程序都需要进行系统调用。`strace` 对于已编译的低级程序最有效果，但如果你可以避免运行时环境和解释器带来的大量额外输出，则仍然可以与 Python 等高级语言程序一起使用。

当软件在一台机器上正常工作，但在另一台机器上却不能正常工作，同时抛出了有关文件、权限或者不能运行某某命令等模糊的错误信息时，`strace` 往往能大显身手。不幸的是，它不能诊断高等级的问题，例如数字证书验证错误等。这些问题通常需要组合使用 `strace`（有时候是 [`ltrace`][5]）和其它高级工具（例如使用 `openssl` 命令行工具调试数字证书错误）。

本文中的示例基于独立的服务器，但是对系统调用的追踪通常也可以在更复杂的部署平台上完成，仅需要找到合适的工具。

### 一个简单的例子

假设你正在尝试运行一个叫做 `foo` 的服务器应用程序，但是发生了以下情况：

```
$ foo
Error opening configuration file: No such file or directory
```

显然，它没有找到你已经写好的配置文件。之所以会发生这种情况，是因为包管理工具有时候在编译应用程序时指定了自定义的路径，所以你应当遵循特定发行版提供的安装指南。如果错误信息告诉你正确的配置文件应该在什么地方，你就可以在几秒钟内解决这个问题，但如果没有告诉你呢？你该如何找到正确的路径？

如果你有权访问源代码，则可以通过阅读源代码来解决问题。这是一个好的备用计划，但不是最快的解决方案。你还可以使用类似 `gdb` 的单步调试器来观察程序的行为，但使用专门用于展示程序与系统环境交互作用的工具 `strace` 更加有效。

一开始， `strace` 产生的大量输出可能会让你不知所措，幸好你可以忽略其中大部分的无用信息。我经常使用 `-o` 参数把输出的追踪结果保存到单独的文件里：

```
$ strace -o /tmp/trace foo
Error opening configuration file: No such file or directory
$ cat /tmp/trace
execve("foo", ["foo"], 0x7ffce98dc010 /* 16 vars */) = 0
brk(NULL)                               = 0x56363b3fb000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=25186, ...}) = 0
mmap(NULL, 25186, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f2f12cf1000
close(3)                                = 0
openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\260A\2\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=1824496, ...}) = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f2f12cef000
mmap(NULL, 1837056, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f2f12b2e000
mprotect(0x7f2f12b50000, 1658880, PROT_NONE) = 0
mmap(0x7f2f12b50000, 1343488, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x22000) = 0x7f2f12b50000
mmap(0x7f2f12c98000, 311296, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x16a000) = 0x7f2f12c98000
mmap(0x7f2f12ce5000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1b6000) = 0x7f2f12ce5000
mmap(0x7f2f12ceb000, 14336, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f2f12ceb000
close(3)                                = 0
arch_prctl(ARCH_SET_FS, 0x7f2f12cf0500) = 0
mprotect(0x7f2f12ce5000, 16384, PROT_READ) = 0
mprotect(0x56363b08b000, 4096, PROT_READ) = 0
mprotect(0x7f2f12d1f000, 4096, PROT_READ) = 0
munmap(0x7f2f12cf1000, 25186)           = 0
openat(AT_FDCWD, "/etc/foo/config.json", O_RDONLY) = -1 ENOENT (No such file or directory)
dup(2)                                  = 3
fcntl(3, F_GETFL)                       = 0x2 (flags O_RDWR)
brk(NULL)                               = 0x56363b3fb000
brk(0x56363b41c000)                     = 0x56363b41c000
fstat(3, {st_mode=S_IFCHR|0620, st_rdev=makedev(0x88, 0x8), ...}) = 0
write(3, "Error opening configuration file"..., 60) = 60
close(3)                                = 0
exit_group(1)                           = ?
+++ exited with 1 +++
```

`strace` 输出的第一页通常是低级的进程启动过程。（你可以看到很多 `mmap`、`mprotect`、`brk` 调用，这是用来分配原始内存和映射动态链接库的。）实际上，在查找错误时，最好从下往上阅读 `strace` 的输出。你可以看到 `write` 调用在最后返回了错误信息。如果你向上找，你将会看到第一个失败的系统调用是 `openat`，它在尝试打开 `/etc/foo/config.json` 时抛出了 `ENOENT` (“No such file or directory”)的错误。现在我们已经知道了配置文件应该放在哪里。

这是一个简单的例子，但我敢说在 90% 的情况下，使用 `strace` 进行调试不需要更多复杂的工作。以下是完整的调试步骤：

1. 从程序中获得含糊不清的错误信息
2. 使用 `strace` 运行程序
3. 在输出中找到错误信息
4. 往前追溯并找到第一个失败的系统调用

第四步中的系统调用很可能向你显示出问题所在。

### 小技巧

在开始更加复杂的调试之前，这里有一些有用的调试技巧帮助你高效使用 `strace`：

#### man 是你的朋友

在很多 *nix 操作系统中，你可以通过 `man syscalls` 查看系统调用的列表。你将会看到类似于 `brk(2)` 之类的东西，这意味着你可以通过运行 `man 2 brk` 得到与此相关的更多信息。

一个小问题：`man 2 fork` 会显示出在 GNU `libc` 里封装的 `fork()` 手册页，而 `fork()` 现在实际上是由 `clone` 系统调用实现的。`fork` 的语义与 `clone` 相同，但是如果我写了一个含有 `fork()` 的程序并使用 `strace` 去调试它，我将找不到任何关于 `fork` 调用的信息，只能看到 `clone` 调用。如果将源代码与 `strace` 的输出进行比较的时候，像这种问题会让人感到困惑。

#### 使用 -o 将输出保存到文件

`strace` 可以生成很多输出，所以将输出保存到单独的文件是很有帮助的（就像上面的例子一样）。它还能够在控制台中避免程序自身的输出与 `strace` 的输出发生混淆。

#### 使用 -s 查看更多的参数

你可能已经注意到，错误信息的第二部分没有出现在上面的例子中。这是因为 `strace` 默认仅显示字符串参数的前 32 个字节。如果你需要捕获更多参数，请向 `strace` 追加类似于 `-s 128` 之类的参数。

#### -y 使得追踪文件或套接字更加容易

“一切皆文件”意味着 *nix 系统通过文件描述符进行所有 IO 操作，不管是真实的文件还是通过网络或者进程间管道。这对于编程而言是很方便的，但是在追踪系统调用时，你将很难分辨出 `read` 和 `write` 的真实行为。

`-y` 参数使 `strace` 在注释中注明每个文件描述符的具体指向。

#### 使用 -p 附加到正在运行的进程中

正如我们将在后面的例子中看到的，有时候你想追踪一个正在运行的程序。如果你知道这个程序的进程号为 1337 （可以通过 `ps` 查询），则可以这样操作：

```
$ strace -p 1337
...system call trace output...
```

你可能需要 root 权限才能运行。

#### 使用 -f 追踪子进程

`strace` 默认只追踪一个进程。如果这个进程产生了一个子进程，你将会看到创建子进程的系统调用（一般是 `clone`），但是你看不到子进程内触发的任何调用。

如果你认为在子进程中存在错误，则需要使用 `-f` 参数启用子进程追踪功能。这样做的缺点是输出的内容会让人更加困惑。当追踪一个进程时，`strace` 显示的是单个调用事件流。当追踪多个进程的时候，你将会看到以 `<unfinished ...>` 开始的初始调用，接着是一系列针对其它线程的调用，最后才出现以 `<... foocall resumed>` 结束的初始调用。此外，你可以使用 `-ff` 参数将所有的调用分离到不同的文件中（查看 [strace 手册][6] 获取更多信息）。

#### 使用 -e 进行过滤

正如你所看到的，默认的追踪输出是所有的系统调用。你可以使用 `-e` 参数过滤你需要追踪的调用（查看 [strace 手册][6]）。这样做的好处是运行过滤后的 `strace` 比起使用 `grep` 进行二次过滤要更快。老实说，我大部分时间都不会被打扰。

#### 并非所有的错误都是不好的

一个简单而常用的例子是一个程序在多个位置搜索文件，例如 shell 搜索哪个 `bin/` 目录包含可执行文件：

```
$ strace sh -c uname
...
stat("/home/user/bin/uname", 0x7ffceb817820) = -1 ENOENT (No such file or directory)
stat("/usr/local/bin/uname", 0x7ffceb817820) = -1 ENOENT (No such file or directory)
stat("/usr/bin/uname", {st_mode=S_IFREG|0755, st_size=39584, ...}) = 0
...
```

“错误信息之前的最后一次失败调用”这种启发式方法非常适合于查找错误。无论如何，自下而上地查找是有道理的。

#### C 编程指南非常有助于理解系统调用

标准 C 库函数调用不属于系统调用，但它们仅是系统调用之上的唯一一个薄层。所以如果你了解（甚至只是略知一二）如何使用 C 语言，那么阅读系统调用追踪信息就非常容易。例如，如果你在调试网络系统调用，你可以尝试略读 [Beej 经典的《网络编程指南》][7]。

### 一个更复杂的调试例子

就像我说的那样，简单的调试例子表现了我在大部分情况下如何使用 `strace`。然而，有时候需要一些更加细致的工作，所以这里有一个稍微复杂（且真实）的例子。

[bcron][8] 是一个任务调度器，它是经典 *nix `cron` 守护程序的另一种实现。它已经被安装到一台服务器上，但是当有人尝试编辑作业时间表时，发生了以下情况：

```
# crontab -e -u logs
bcrontab: Fatal: Could not create temporary file
```

好的，现在 bcron 尝试写入一些文件，但是它失败了，也没有告诉我们原因。以下是 `strace` 的输出：

```
# strace -o /tmp/trace crontab -e -u logs
bcrontab: Fatal: Could not create temporary file
# cat /tmp/trace
...
openat(AT_FDCWD, "bcrontab.14779.1573691864.847933", O_RDONLY) = 3
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f82049b4000
read(3, "#Ansible: logsagg\n20 14 * * * lo"..., 8192) = 150
read(3, "", 8192)                       = 0
munmap(0x7f82049b4000, 8192)            = 0
close(3)                                = 0
socket(AF_UNIX, SOCK_STREAM, 0)         = 3
connect(3, {sa_family=AF_UNIX, sun_path="/var/run/bcron-spool"}, 110) = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f82049b4000
write(3, "156:Slogs\0#Ansible: logsagg\n20 1"..., 161) = 161
read(3, "32:ZCould not create temporary f"..., 8192) = 36
munmap(0x7f82049b4000, 8192)            = 0
close(3)                                = 0
write(2, "bcrontab: Fatal: Could not creat"..., 49) = 49
unlink("bcrontab.14779.1573691864.847933") = 0
exit_group(111)                         = ?
+++ exited with 111 +++
```

在程序结束之前有一个 `write` 的错误信息，但是这次有些不同。首先，在此之前没有任何相关的失败系统调用。其次，我们看到这个错误信息是由 `read` 从别的地方读取而来的。这看起来像是真正的错误发生在别的地方，而 `bcrontab` 只是在转播这些信息。

如果你查阅了 `man 2 read`，你将会看到 `read` 的第一个参数 (`3`) 是一个文件描述符，这是 *nix 操作系统用于所有 IO 操作的句柄。你该如何知道文件描述符 3 代表什么？在这种情况下，你可以使用 `-y` 参数运行 `strace`（如上文所述），它将会在注释里告诉你文件描述符的具体指向，但是了解如何从上面这种输出中分析追踪结果是很有用的。

一个文件描述符可以来自于许多系统调用之一（这取决于它是用于控制台、网络套接字还是真实文件等的描述符），但不论如何，我们都可以搜索返回值为 `3` 的系统调用（例如，在 `strace` 的输出中查找 `=3`）。在这次 `strace` 中可以看到有两个这样的调用：最上面的 `openat` 以及中间的 `socket`。`openat` 打开一个文件，但是紧接着的 `close(3)` 表明其已经被关闭。（注意：文件描述符可以在打开并关闭后重复使用。）所以 `socket` 调用才是与此相关的（它是在 `read` 之前的最后一个），这告诉我们 `brcontab` 正在与一个网络套接字通信。在下一行，`connect` 表明文件描述符 3 是一个连接到 `/var/run/bcron-spool` 的 Unix 域套接字。

因此，我们需要弄清楚 Unix 套接字的另一侧是哪个进程在监听。有两个巧妙的技巧适用于在服务器部署中调试。一个是使用 `netstat` 或者较新的 `ss`。这两个命令都描述了当前系统中活跃的网络套接字，使用 `-l` 参数可以显示出处于监听状态的套接字，而使用 `-p` 参数可以得到正在使用该套接字的程序信息。（它们还有更多有用的选项，但是这两个已经足够完成工作了。）

```
# ss -pl | grep /var/run/bcron-spool
u_str LISTEN 0   128   /var/run/bcron-spool 1466637   * 0   users:(("unixserver",pid=20629,fd=3))
```

这告诉我们 `/var/run/bcron-spool` 套接字的监听程序是 `unixserver` 这个命令，它的进程 ID 为 20629。（巧合的是，这个程序也使用文件描述符 `3` 去连接这个套接字。）

第二个常用的工具就是使用 `lsof` 查找相同的信息。它可以列出当前系统中打开的所有文件（或文件描述符）。或者，我们可以得到一个具体文件的信息：

```
# lsof /var/run/bcron-spool
COMMAND   PID   USER  FD  TYPE  DEVICE              SIZE/OFF  NODE    NAME
unixserve 20629 cron  3u  unix  0x000000005ac4bd83  0t0       1466637 /var/run/bcron-spool type=STREAM
```

进程 20629 是一个常驻进程，所以我们可以使用 `strace -o /tmp/trace -p 20629` 去查看该进程的系统调用。如果我们在另一个终端尝试编辑 cron 的计划任务表，就可以在错误发生时捕获到以下信息：

```
accept(3, NULL, NULL)                   = 4
clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x7faa47c44810) = 21181
close(4)                                = 0
accept(3, NULL, NULL)                   = ? ERESTARTSYS (To be restarted if SA_RESTART is set)
--- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=21181, si_uid=998, si_status=0, si_utime=0, si_stime=0} ---
wait4(0, [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], WNOHANG|WSTOPPED, NULL) = 21181
wait4(0, 0x7ffe6bc36764, WNOHANG|WSTOPPED, NULL) = -1 ECHILD (No child processes)
rt_sigaction(SIGCHLD, {sa_handler=0x55d244bdb690, sa_mask=[CHLD], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7faa47ab9840}, {sa_handler=0x55d244bdb690, sa_mask=[CHLD], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7faa47ab9840}, 8) = 0
rt_sigreturn({mask=[]})                 = 43
accept(3, NULL, NULL)                   = 4
clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x7faa47c44810) = 21200
close(4)                                = 0
accept(3, NULL, NULL)                   = ? ERESTARTSYS (To be restarted if SA_RESTART is set)
--- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=21200, si_uid=998, si_status=111, si_utime=0, si_stime=0} ---
wait4(0, [{WIFEXITED(s) && WEXITSTATUS(s) == 111}], WNOHANG|WSTOPPED, NULL) = 21200
wait4(0, 0x7ffe6bc36764, WNOHANG|WSTOPPED, NULL) = -1 ECHILD (No child processes)
rt_sigaction(SIGCHLD, {sa_handler=0x55d244bdb690, sa_mask=[CHLD], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7faa47ab9840}, {sa_handler=0x55d244bdb690, sa_mask=[CHLD], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7faa47ab9840}, 8) = 0
rt_sigreturn({mask=[]})                 = 43
accept(3, NULL, NULL
```

（最后一个 `accept` 调用没有在追踪期间完成。）不幸的是，这次追踪没有包含我们想要的错误信息。我们没有观察到 `bcrontan` 往套接字发送或接受的任何信息。然而，我们看到了很多进程管理操作（`clone`、`wait4`、`SIGCHLD`，等等）。这个进程产生了子进程，我们猜测真实的工作是由子进程完成的。如果我们想捕获子进程的追踪信息，就必须往 `strace` 追加 `-f` 参数。以下是我们最终使用 `strace -f -o /tmp/trace -p 20629` 找到的错误信息：

```
21470 openat(AT_FDCWD, "tmp/spool.21470.1573692319.854640", O_RDWR|O_CREAT|O_EXCL, 0600) = -1 EACCES (Permission denied)
21470 write(1, "32:ZCould not create temporary f"..., 36) = 36
21470 write(2, "bcron-spool[21470]: Fatal: logs:"..., 84) = 84
21470 unlink("tmp/spool.21470.1573692319.854640") = -1 ENOENT (No such file or directory)
21470 exit_group(111)                   = ?
21470 +++ exited with 111 +++
```

现在我们知道了进程 ID 21470 在尝试创建文件 `tmp/spool.21470.1573692319.854640` （相对于当前的工作目录）时得到了一个没有权限的错误。如果我们知道当前的工作目录，就可以得到完整路径并能指出为什么该进程无法在此处创建临时文件。不幸的是，这个进程已经退出了，所以我们不能使用 `lsof -p 21470` 去找出当前的工作目录，但是我们可以往前追溯，查找进程 ID 21470 使用哪个系统调用改变了它的工作目录。这个系统调用是 `chdir`（可以在搜索引擎很轻松地找到）。以下是一直往前追溯到服务器进程 ID 20629 的结果：

```
20629 clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x7faa47c44810) = 21470
...
21470 execve("/usr/sbin/bcron-spool", ["bcron-spool"], 0x55d2460807e0 /* 27 vars */) = 0
...
21470 chdir("/var/spool/cron")          = 0
...
21470 openat(AT_FDCWD, "tmp/spool.21470.1573692319.854640", O_RDWR|O_CREAT|O_EXCL, 0600) = -1 EACCES (Permission denied)
21470 write(1, "32:ZCould not create temporary f"..., 36) = 36
21470 write(2, "bcron-spool[21470]: Fatal: logs:"..., 84) = 84
21470 unlink("tmp/spool.21470.1573692319.854640") = -1 ENOENT (No such file or directory)
21470 exit_group(111)                   = ?
21470 +++ exited with 111 +++
```

（如果你在这里迷糊了，你可能需要阅读 [我之前有关 \*nix 进程管理和 shell 的文章][9]）

现在 PID 为 20629 的服务器进程没有权限在 `/var/spool/cron/tmp/spool.21470.1573692319.854640` 创建文件。最可能的原因就是典型的 *nix 文件系统权限设置。让我们检查一下：

```
# ls -ld /var/spool/cron/tmp/
drwxr-xr-x 2 root root 4096 Nov  6 05:33 /var/spool/cron/tmp/
# ps u -p 20629
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
cron     20629  0.0  0.0   2276   752 ?        Ss   Nov14   0:00 unixserver -U /var/run/bcron-spool -- bcron-spool
```

这就是问题所在！这个服务进程以 `cron` 用户运行，但是只有 `root` 用户才有向 `/var/spool/cron/tmp/` 目录写入的权限。一个简单 `chown cron /var/spool/cron/tmp/` 命令就能让 `bcron` 正常工作。（如果不是这个问题，那么下一个最有可能的怀疑对象是诸如 SELinux 或者 AppArmor 之类的内核安全模块，因此我将会使用 `dmesg` 检查内核日志。）

### 总结

最初，系统调用追踪可能会让人不知所措，但是我希望我已经证明它们是调试一整套常见部署问题的快速方法。你可以设想一下尝试用单步调试器去调试多进程的 `bcron` 问题。

通过一连串的系统调用解决问题是需要练习的，但正如我说的那样，在大多数情况下，我只需要使用 `strace` 从下往上追踪并查找错误。不管怎样，`strace` 节省了我很多的调试时间。我希望这也对你有所帮助。

--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2019/11/14/deployment_debugging_strace.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[hanwckf](https://github.com/hanwckf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
[1]: https://strace.io/
[2]: http://dtrace.org/blogs/about/
[3]: https://man.openbsd.org/ktrace
[4]: https://theartofmachinery.com/images/strace/system_calls.svg
[5]: https://linux.die.net/man/1/ltrace
[6]: https://linux.die.net/man/1/strace
[7]: https://beej.us/guide/bgnet/html/index.html
[8]: https://untroubled.org/bcron/
[9]: https://theartofmachinery.com/2018/11/07/writing_a_nix_shell.html
