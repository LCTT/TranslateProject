[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12187-1.html)
[#]: subject: (10 ways to analyze binary files on Linux)
[#]: via: (https://opensource.com/article/20/4/linux-binary-analysis)
[#]: author: (Gaurav Kamathe https://opensource.com/users/gkamathe)

在 Linux 上分析二进制文件的 10 种方法
======

> 这些简单的命令和工具可以帮助你轻松完成分析二进制文件的任务。

![](https://img.linux.net.cn/data/attachment/album/202005/05/232115nn0oduodo4oztv0a.jpg)

“这个世界上有 10 种人：懂二进制的人和不懂二进制的人。”

我们每天都在与二进制文件打交道，但我们对二进制文件却知之甚少。我所说的二进制，是指你每天运行的可执行文件，从命令行工具到成熟的应用程序都是。

Linux 提供了一套丰富的工具，让分析二进制文件变得轻而易举。无论你的工作角色是什么，如果你在 Linux 上工作，了解这些工具的基本知识将帮助你更好地理解你的系统。

在这篇文章中，我们将介绍其中一些最流行的 Linux 工具和命令，其中大部分都是 Linux 发行版的一部分。如果没有找到，你可以随时使用你的软件包管理器来安装和探索它们。请记住：学习在正确的场合使用正确的工具需要大量的耐心和练习。

### file

它的作用：帮助确定文件类型。

这将是你进行二进制分析的起点。我们每天都在与文件打交道，并非所有的文件都是可执行类型，除此之外还有各种各样的文件类型。在你开始之前，你需要了解要分析的文件类型。是二进制文件、库文件、ASCII 文本文件、视频文件、图片文件、PDF、数据文件等文件吗？

`file` 命令将帮助你确定你所处理的文件类型。

```
$ file /bin/ls
/bin/ls: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.32, BuildID[sha1]=94943a89d17e9d373b2794dcb1f7e38c95b66c86, stripped
$
$ file /etc/passwd
/etc/passwd: ASCII text
$
```

### ldd

它的作用：打印共享对象依赖关系。

如果你已经在一个可执行的二进制文件上使用了上面的 `file` 命令，你肯定会看到输出中的“<ruby>动态链接<rt>dynamically linked</rt></ruby>”信息。它是什么意思呢？

在开发软件的时候，我们尽量不要重造轮子。有一组常见的任务是大多数软件程序需要的，比如打印输出或从标准输入/打开的文件中读取等。所有这些常见的任务都被抽象成一组通用的函数，然后每个人都可以使用，而不是写出自己的变体。这些常用的函数被放在一个叫 `libc` 或 `glibc` 的库中。

如何找到可执行程序所依赖的库？这就是 `ldd` 命令的作用了。对动态链接的二进制文件运行该命令会显示出所有依赖库和它们的路径。

```
$ ldd /bin/ls
        linux-vdso.so.1 =>  (0x00007ffef5ba1000)
        libselinux.so.1 => /lib64/libselinux.so.1 (0x00007fea9f854000)
        libcap.so.2 => /lib64/libcap.so.2 (0x00007fea9f64f000)
        libacl.so.1 => /lib64/libacl.so.1 (0x00007fea9f446000)
        libc.so.6 => /lib64/libc.so.6 (0x00007fea9f079000)
        libpcre.so.1 => /lib64/libpcre.so.1 (0x00007fea9ee17000)
        libdl.so.2 => /lib64/libdl.so.2 (0x00007fea9ec13000)
        /lib64/ld-linux-x86-64.so.2 (0x00007fea9fa7b000)
        libattr.so.1 => /lib64/libattr.so.1 (0x00007fea9ea0e000)
        libpthread.so.0 => /lib64/libpthread.so.0 (0x00007fea9e7f2000)
$
```

### ltrace

它的作用：库调用跟踪器。

我们现在知道如何使用 `ldd` 命令找到一个可执行程序所依赖的库。然而，一个库可以包含数百个函数。在这几百个函数中，哪些是我们的二进制程序正在使用的实际函数？

`ltrace` 命令可以显示运行时从库中调用的所有函数。在下面的例子中，你可以看到被调用的函数名称，以及传递给该函数的参数。你也可以在输出的最右边看到这些函数返回的内容。

```
$ ltrace ls
__libc_start_main(0x4028c0, 1, 0x7ffd94023b88, 0x412950 <unfinished ...>
strrchr("ls", '/')                                                                  = nil
setlocale(LC_ALL, "")                                                               = "en_US.UTF-8"
bindtextdomain("coreutils", "/usr/share/locale")                                    = "/usr/share/locale"
textdomain("coreutils")                                                             = "coreutils"
__cxa_atexit(0x40a930, 0, 0, 0x736c6974756572)                                      = 0
isatty(1)                                                                           = 1
getenv("QUOTING_STYLE")                                                             = nil
getenv("COLUMNS")                                                                   = nil
ioctl(1, 21523, 0x7ffd94023a50)                                                     = 0
<< snip >>
fflush(0x7ff7baae61c0)                                                              = 0
fclose(0x7ff7baae61c0)                                                              = 0
+++ exited (status 0) +++
$
```

### hexdump

它的作用：以 ASCII、十进制、十六进制或八进制显示文件内容。

通常情况下，当你用一个应用程序打开一个文件，而它不知道如何处理该文件时，就会出现这种情况。尝试用 `vim` 打开一个可执行文件或视频文件，你屏幕上会看到的只是抛出的乱码。

在 `hexdump` 中打开未知文件，可以帮助你看到文件的具体内容。你也可以选择使用一些命令行选项来查看用 ASCII 表示的文件数据。这可能会帮助你了解到它是什么类型的文件。

```
$ hexdump -C /bin/ls | head
00000000  7f 45 4c 46 02 01 01 00  00 00 00 00 00 00 00 00  |.ELF............|
00000010  02 00 3e 00 01 00 00 00  d4 42 40 00 00 00 00 00  |..>......B@.....|
00000020  40 00 00 00 00 00 00 00  f0 c3 01 00 00 00 00 00  |@...............|
00000030  00 00 00 00 40 00 38 00  09 00 40 00 1f 00 1e 00  |....@.8...@.....|
00000040  06 00 00 00 05 00 00 00  40 00 00 00 00 00 00 00  |........@.......|
00000050  40 00 40 00 00 00 00 00  40 00 40 00 00 00 00 00  |@.@.....@.@.....|
00000060  f8 01 00 00 00 00 00 00  f8 01 00 00 00 00 00 00  |................|
00000070  08 00 00 00 00 00 00 00  03 00 00 00 04 00 00 00  |................|
00000080  38 02 00 00 00 00 00 00  38 02 40 00 00 00 00 00  |8.......8.@.....|
00000090  38 02 40 00 00 00 00 00  1c 00 00 00 00 00 00 00  |8.@.............|
$
```

### strings

它的作用：打印文件中的可打印字符的字符串。

如果你只是在二进制中寻找可打印的字符，那么 `hexdump` 对于你的使用场景来说似乎有点矫枉过正，你可以使用 `strings` 命令。

在开发软件的时候，各种文本/ASCII 信息会被添加到其中，比如打印信息、调试信息、帮助信息、错误等。只要这些信息都存在于二进制文件中，就可以用 `strings` 命令将其转储到屏幕上。

```
$ strings /bin/ls
```

### readelf

它的作用：显示有关 ELF 文件的信息。

ELF（<ruby>可执行和可链接文件格式<rt>Executable and Linkable File Format</rt></ruby>）是可执行文件或二进制文件的主流格式，不仅是 Linux 系统，也是各种 UNIX 系统的主流文件格式。如果你已经使用了像 `file` 命令这样的工具，它告诉你文件是 ELF 格式，那么下一步就是使用 `readelf` 命令和它的各种选项来进一步分析文件。

在使用 `readelf` 命令时，有一份实际的 ELF 规范的参考是非常有用的。你可以在[这里][2]找到该规范。 

```
$ readelf -h /bin/ls
ELF Header:
  Magic:   7f 45 4c 46 02 01 01 00 00 00 00 00 00 00 00 00
  Class:                             ELF64
  Data:                              2's complement, little endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - System V
  ABI Version:                       0
  Type:                              EXEC (Executable file)
  Machine:                           Advanced Micro Devices X86-64
  Version:                           0x1
  Entry point address:               0x4042d4
  Start of program headers:          64 (bytes into file)
  Start of section headers:          115696 (bytes into file)
  Flags:                             0x0
  Size of this header:               64 (bytes)
  Size of program headers:           56 (bytes)
  Number of program headers:         9
  Size of section headers:           64 (bytes)
  Number of section headers:         31
  Section header string table index: 30
$
```

### objdump

它的作用：从对象文件中显示信息。

二进制文件是通过你编写的源码创建的，这些源码会通过一个叫做编译器的工具进行编译。这个编译器会生成相对于源代码的机器语言指令，然后由 CPU 执行特定的任务。这些机器语言代码可以通过被称为汇编语言的助记词来解读。汇编语言是一组指令，它可以帮助你理解由程序所进行并最终在 CPU 上执行的操作。

`objdump` 实用程序读取二进制或可执行文件，并将汇编语言指令转储到屏幕上。汇编语言知识对于理解 `objdump` 命令的输出至关重要。

请记住：汇编语言是特定于体系结构的。

```
$ objdump -d /bin/ls | head

/bin/ls:     file format elf64-x86-64

Disassembly of section .init:

0000000000402150 <_init@@Base>:
  402150:       48 83 ec 08             sub    $0x8,%rsp
  402154:       48 8b 05 6d 8e 21 00    mov    0x218e6d(%rip),%rax        # 61afc8 <__gmon_start__>
  40215b:       48 85 c0                test   %rax,%rax
$
```

### strace

它的作用：跟踪系统调用和信号。

如果你用过前面提到的 `ltrace`，那就把 `strace` 想成是类似的。唯一的区别是，`strace` 工具不是追踪调用的库，而是追踪系统调用。系统调用是你与内核对接来完成工作的。

举个例子，如果你想把一些东西打印到屏幕上，你会使用标准库 `libc` 中的 `printf` 或 `puts` 函数；但是，在底层，最终会有一个名为 `write` 的系统调用来实际把东西打印到屏幕上。

```
$ strace -f /bin/ls
execve("/bin/ls", ["/bin/ls"], [/* 17 vars */]) = 0
brk(NULL)                               = 0x686000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f967956a000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=40661, ...}) = 0
mmap(NULL, 40661, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f9679560000
close(3)                                = 0
<< snip >>
fstat(1, {st_mode=S_IFCHR|0620, st_rdev=makedev(136, 1), ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f9679569000
write(1, "R2  RH\n", 7R2  RH
)                 = 7
close(1)                                = 0
munmap(0x7f9679569000, 4096)            = 0
close(2)                                = 0
exit_group(0)                           = ?
+++ exited with 0 +++
$
```

### nm

它的作用：列出对象文件中的符号。

如果你所使用的二进制文件没有被剥离，`nm` 命令将为你提供在编译过程中嵌入到二进制文件中的有价值的信息。`nm` 可以帮助你从二进制文件中识别变量和函数。你可以想象一下，如果你无法访问二进制文件的源代码时，这将是多么有用。

为了展示 `nm`，我们快速编写了一个小程序，用 `-g` 选项编译，我们会看到这个二进制文件没有被剥离。

```
$ cat hello.c
#include <stdio.h>

int main() {
    printf("Hello world!");
    return 0;
}
$
$ gcc -g hello.c -o hello
$
$ file hello
hello: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.32, BuildID[sha1]=3de46c8efb98bce4ad525d3328121568ba3d8a5d, not stripped
$
$ ./hello
Hello world!$
$


$ nm hello | tail
0000000000600e20 d __JCR_END__
0000000000600e20 d __JCR_LIST__
00000000004005b0 T __libc_csu_fini
0000000000400540 T __libc_csu_init
                 U __libc_start_main@@GLIBC_2.2.5
000000000040051d T main
                 U printf@@GLIBC_2.2.5
0000000000400490 t register_tm_clones
0000000000400430 T _start
0000000000601030 D __TMC_END__
$
```

### gdb

它的作用：GNU 调试器。

好吧，不是所有的二进制文件中的东西都可以进行静态分析。我们确实执行了一些运行二进制文件（进行分析）的命令，比如 `ltrace` 和 `strace`；然而，软件由各种条件组成，这些条件可能会导致执行不同的替代路径。

分析这些路径的唯一方法是在运行时环境，在任何给定的位置停止或暂停程序，并能够分析信息，然后再往下执行。

这就是调试器的作用，在 Linux 上，`gdb` 就是调试器的事实标准。它可以帮助你加载程序，在特定的地方设置断点，分析内存和 CPU 的寄存器，以及更多的功能。它是对上面提到的其他工具的补充，可以让你做更多的运行时分析。

有一点需要注意的是，一旦你使用 `gdb` 加载一个程序，你会看到它自己的 `(gdb)` 提示符。所有进一步的命令都将在这个 `gdb` 命令提示符中运行，直到你退出。

我们将使用我们之前编译的 `hello` 程序，使用 `gdb` 来看看它的工作原理。

```
$ gdb -q ./hello
Reading symbols from /home/flash/hello...done.
(gdb) break main
Breakpoint 1 at 0x400521: file hello.c, line 4.
(gdb) info break
Num     Type           Disp Enb Address            What
1       breakpoint     keep y   0x0000000000400521 in main at hello.c:4
(gdb) run
Starting program: /home/flash/./hello

Breakpoint 1, main () at hello.c:4
4           printf("Hello world!");
Missing separate debuginfos, use: debuginfo-install glibc-2.17-260.el7_6.6.x86_64
(gdb) bt
#0  main () at hello.c:4
(gdb) c
Continuing.
Hello world![Inferior 1 (process 29620) exited normally]
(gdb) q
$
```

### 结语

一旦你习惯了使用这些原生的 Linux 二进制分析工具，并理解了它们提供的输出，你就可以转向更高级和专业的开源二进制分析工具，比如 [radare2][3]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/linux-binary-analysis

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tux_linux_penguin_code_binary.jpg?itok=TxGxW0KY (Tux with binary code background)
[2]: http://www.skyfree.org/linux/references/ELF_Format.pdf
[3]: https://github.com/radareorg/radare2
