[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11441-1.html)
[#]: subject: (9 essential GNU binutils tools)
[#]: via: (https://opensource.com/article/19/10/gnu-binutils)
[#]: author: (Gaurav Kamathe https://opensource.com/users/gkamathe)

GNU binutils 里的九种武器
======

> 二进制分析是计算机行业中最被低估的技能。

![](https://img.linux.net.cn/data/attachment/album/201910/10/115409g9nkdm2omutduw7u.jpg)

想象一下，在无法访问软件的源代码时，但仍然能够理解软件的实现方式，在其中找到漏洞，并且更厉害的是还能修复错误。所有这些都是在只有二进制文件时做到的。这听起来就像是超能力，对吧？

你也可以拥有这样的超能力，GNU 二进制实用程序（binutils）就是一个很好的起点。[GNU binutils] [2] 是一个二进制工具集，默认情况下所有 Linux 发行版中都会安装这些二进制工具。

二进制分析是计算机行业中最被低估的技能。它主要由恶意软件分析师、反向工程师和使用底层软件的人使用。

本文探讨了 binutils 可用的一些工具。我使用的是 RHEL，但是这些示例应该在任何 Linux 发行版上可以运行。

```
[~]# cat /etc/redhat-release 
Red Hat Enterprise Linux Server release 7.6 (Maipo)
[~]# 
[~]# uname -r
3.10.0-957.el7.x86_64
[~]# 
```

请注意，某些打包命令（例如 `rpm`）在基于 Debian 的发行版中可能不可用，因此请使用等效的 `dpkg` 命令替代。

### 软件开发的基础知识

在开源世界中，我们很多人都专注于源代码形式的软件。当软件的源代码随时可用时，很容易获得源代码的副本，打开喜欢的编辑器，喝杯咖啡，然后就可以开始探索了。

但是源代码不是在 CPU 上执行的代码，在 CPU 上执行的是二进制或者说是机器语言指令。二进制或可执行文件是编译源代码时获得的。熟练的调试人员深谙通常这种差异。

### 编译的基础知识

在深入研究 binutils 软件包本身之前，最好先了解编译的基础知识。

编译是将程序从某种编程语言（如 C/C++）的源代码（文本形式）转换为机器代码的过程。

机器代码是 CPU（或一般而言，硬件）可以理解的 1 和 0 的序列，因此可以由 CPU 执行或运行。该机器码以特定格式保存到文件，通常称为可执行文件或二进制文件。在 Linux（和使用 [Linux 兼容二进制][3]的 BSD）上，这称为 [ELF][4]（<ruby>可执行和可链接格式<rt>Executable and Linkable Format</rt></ruby>）。

在生成给定的源文件的可执行文件或二进制文件之前，编译过程将经历一系列复杂的步骤。以这个源程序（C 代码）为例。打开你喜欢的编辑器，然后键入以下程序：

```
#include <stdio.h>

int main(void)
{
  printf("Hello World\n");
  return 0;
}
```

#### 步骤 1：用 cpp 预处理

[C 预处理程序（cpp）][5]用于扩展所有宏并将头文件包含进来。在此示例中，头文件 `stdio.h` 将被包含在源代码中。`stdio.h` 是一个头文件，其中包含有关程序内使用的 `printf` 函数的信息。对源代码运行 `cpp`，其结果指令保存在名为 `hello.i` 的文件中。可以使用文本编辑器打开该文件以查看其内容。打印 “hello world” 的源代码在该文件的底部。

```
[testdir]# cat hello.c
#include <stdio.h>

int main(void)
{
  printf("Hello World\n");
  return 0;
}
[testdir]#
[testdir]# cpp hello.c > hello.i
[testdir]#
[testdir]# ls -lrt
total 24
-rw-r--r--. 1 root root 76 Sep 13 03:20 hello.c
-rw-r--r--. 1 root root 16877 Sep 13 03:22 hello.i
[testdir]#
```

#### 步骤 2：用 gcc 编译

在此阶段，无需创建目标文件就将步骤 1 中生成的预处理源代码转换为汇编语言指令。这个阶段使用 [GNU 编译器集合（gcc）][6]。对 `hello.i` 文件运行带有 `-S` 选项的 `gcc` 命令后，它将创建一个名为 `hello.s` 的新文件。该文件包含该 C 程序的汇编语言指令。

你可以使用任何编辑器或 `cat` 命令查看其内容。

```
[testdir]#
[testdir]# gcc -Wall -S hello.i
[testdir]#
[testdir]# ls -l
total 28
-rw-r--r--. 1 root root 76 Sep 13 03:20 hello.c
-rw-r--r--. 1 root root 16877 Sep 13 03:22 hello.i
-rw-r--r--. 1 root root 448 Sep 13 03:25 hello.s
[testdir]#
[testdir]# cat hello.s
.file "hello.c"
.section .rodata
.LC0:
.string "Hello World"
.text
.globl main
.type main, @function
main:
.LFB0:
.cfi_startproc
pushq %rbp
.cfi_def_cfa_offset 16
.cfi_offset 6, -16
movq %rsp, %rbp
.cfi_def_cfa_register 6
movl $.LC0, %edi
call puts
movl $0, %eax
popq %rbp
.cfi_def_cfa 7, 8
ret
.cfi_endproc
.LFE0:
.size main, .-main
.ident "GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-36)"
.section .note.GNU-stack,"",@progbits
[testdir]#
```

#### 步骤 3：用 as 汇编

汇编器的目的是将汇编语言指令转换为机器语言代码，并生成扩展名为 `.o` 的目标文件。此阶段使用默认情况下在所有 Linux 平台上都可用的 GNU 汇编器。

```
testdir]# as hello.s -o hello.o
[testdir]#
[testdir]# ls -l
total 32
-rw-r--r--. 1 root root 76 Sep 13 03:20 hello.c
-rw-r--r--. 1 root root 16877 Sep 13 03:22 hello.i
-rw-r--r--. 1 root root 1496 Sep 13 03:39 hello.o
-rw-r--r--. 1 root root 448 Sep 13 03:25 hello.s
[testdir]#
```

现在，你有了第一个 ELF 格式的文件；但是，还不能执行它。稍后，你将看到“<ruby>目标文件<rt>object file</rt></ruby>”和“<ruby>可执行文件<rt>executable file</rt></ruby>”之间的区别。

```
[testdir]# file hello.o
hello.o: ELF 64-bit LSB relocatable, x86-64, version 1 (SYSV), not stripped
```

#### 步骤 4：用 ld 链接

这是编译的最后阶段，将目标文件链接以创建可执行文件。可执行文件通常需要外部函数，这些外部函数通常来自系统库（`libc`）。

你可以使用 `ld` 命令直接调用链接器；但是，此命令有些复杂。相反，你可以使用带有 `-v`（详细）标志的 `gcc` 编译器，以了解链接是如何发生的。（使用 `ld` 命令进行链接作为一个练习，你可以自行探索。）

```
[testdir]# gcc -v hello.o
Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/libexec/gcc/x86_64-redhat-linux/4.8.5/lto-wrapper
Target: x86_64-redhat-linux
Configured with: ../configure --prefix=/usr --mandir=/usr/share/man [...] --build=x86_64-redhat-linux
Thread model: posix
gcc version 4.8.5 20150623 (Red Hat 4.8.5-36) (GCC)
COMPILER_PATH=/usr/libexec/gcc/x86_64-redhat-linux/4.8.5/:/usr/libexec/gcc/x86_64-redhat-linux/4.8.5/:[...]:/usr/lib/gcc/x86_64-redhat-linux/
LIBRARY_PATH=/usr/lib/gcc/x86_64-redhat-linux/4.8.5/:/usr/lib/gcc/x86_64-redhat-linux/4.8.5/../../../../lib64/:/lib/../lib64/:/usr/lib/../lib64/:/usr/lib/gcc/x86_64-redhat-linux/4.8.5/../../../:/lib/:/usr/lib/
COLLECT_GCC_OPTIONS='-v' '-mtune=generic' '-march=x86-64'
/usr/libexec/gcc/x86_64-redhat-linux/4.8.5/collect2 --build-id --no-add-needed --eh-frame-hdr --hash-style=gnu [...]/../../../../lib64/crtn.o
[testdir]#
```

运行此命令后，你应该看到一个名为 `a.out` 的可执行文件：

```
[testdir]# ls -l
total 44
-rwxr-xr-x. 1 root root 8440 Sep 13 03:45 a.out
-rw-r--r--. 1 root root 76 Sep 13 03:20 hello.c
-rw-r--r--. 1 root root 16877 Sep 13 03:22 hello.i
-rw-r--r--. 1 root root 1496 Sep 13 03:39 hello.o
-rw-r--r--. 1 root root 448 Sep 13 03:25 hello.s
```

对 `a.out` 运行 `file` 命令，结果表明它确实是 ELF 可执行文件：

```
[testdir]# file a.out
a.out: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.32, BuildID[sha1]=48e4c11901d54d4bf1b6e3826baf18215e4255e5, not stripped
```

运行该可执行文件，看看它是否如源代码所示工作：

```
[testdir]# ./a.out Hello World
```

工作了！在幕后发生了很多事情它才在屏幕上打印了 “Hello World”。想象一下在更复杂的程序中会发生什么。

### 探索 binutils 工具

上面这个练习为使用 binutils 软件包中的工具提供了良好的背景。我的系统带有 binutils 版本 2.27-34；你的 Linux 发行版上的版本可能有所不同。

```
[~]# rpm -qa | grep binutils 
binutils-2.27-34.base.el7.x86_64
```

binutils 软件包中提供了以下工具：

```
[~]# rpm -ql binutils-2.27-34.base.el7.x86_64 | grep bin/
/usr/bin/addr2line
/usr/bin/ar
/usr/bin/as
/usr/bin/c++filt
/usr/bin/dwp
/usr/bin/elfedit
/usr/bin/gprof
/usr/bin/ld
/usr/bin/ld.bfd
/usr/bin/ld.gold
/usr/bin/nm
/usr/bin/objcopy
/usr/bin/objdump
/usr/bin/ranlib
/usr/bin/readelf
/usr/bin/size
/usr/bin/strings
/usr/bin/strip
```

上面的编译练习已经探索了其中的两个工具：用作汇编器的 `as` 命令，用作链接器的 `ld` 命令。继续阅读以了解上述 GNU binutils 软件包工具中的其他七个。

#### readelf：显示 ELF 文件信息

上面的练习提到了术语“目标文件”和“可执行文件”。使用该练习中的文件，通过带有 `-h`（标题）选项的 `readelf` 命令，以将文件的 ELF 标题转储到屏幕上。请注意，以 `.o` 扩展名结尾的目标文件显示为 `Type: REL (Relocatable file)`（可重定位文件）：

```
[testdir]# readelf -h hello.o
ELF Header:
Magic: 7f 45 4c 46 02 01 01 00 [...]
[...]
Type: REL (Relocatable file)
[...]
```

如果尝试执行此目标文件，会收到一条错误消息，指出无法执行。这仅表示它尚不具备在 CPU 上执行所需的信息。

请记住，你首先需要使用 `chmod` 命令在对象文件上添加 `x`（可执行位），否则你将得到“权限被拒绝”的错误。

```
[testdir]# ./hello.o
bash: ./hello.o: Permission denied
[testdir]# chmod +x ./hello.o
[testdir]#
[testdir]# ./hello.o
bash: ./hello.o: cannot execute binary file
```

如果对 `a.out` 文件尝试相同的命令，则会看到其类型为 `EXEC (Executable file)`（可执行文件）。

```
[testdir]# readelf -h a.out
ELF Header:
Magic: 7f 45 4c 46 02 01 01 00 00 00 00 00 00 00 00 00
Class: ELF64
[...] Type: EXEC (Executable file)
```

如上所示，该文件可以直接由 CPU 执行：

```
[testdir]# ./a.out Hello World
```

`readelf` 命令可提供有关二进制文件的大量信息。在这里，它会告诉你它是 ELF 64 位格式，这意味着它只能在 64 位 CPU 上执行，而不能在 32 位 CPU 上运行。它还告诉你它应在 X86-64（Intel/AMD）架构上执行。该二进制文件的入口点是地址 `0x400430`，它就是 C 源程序中 `main` 函数的地址。

在你知道的其他系统二进制文件上尝试一下 `readelf` 命令，例如 `ls`。请注意，在 RHEL 8 或 Fedora 30 及更高版本的系统上，由于安全原因改用了<ruby>位置无关可执行文件<rt>position independent executable</rt></ruby>（[PIE][7]），因此你的输出（尤其是 `Type:`）可能会有所不同。

```
[testdir]# readelf -h /bin/ls
ELF Header:
Magic: 7f 45 4c 46 02 01 01 00 00 00 00 00 00 00 00 00
Class: ELF64
Data: 2's complement, little endian
Version: 1 (current)
OS/ABI: UNIX - System V
ABI Version: 0
Type: EXEC (Executable file)
```

使用 `ldd` 命令了解 `ls` 命令所依赖的系统库，如下所示：

```
[testdir]# ldd /bin/ls
linux-vdso.so.1 => (0x00007ffd7d746000)
libselinux.so.1 => /lib64/libselinux.so.1 (0x00007f060daca000)
libcap.so.2 => /lib64/libcap.so.2 (0x00007f060d8c5000)
libacl.so.1 => /lib64/libacl.so.1 (0x00007f060d6bc000)
libc.so.6 => /lib64/libc.so.6 (0x00007f060d2ef000)
libpcre.so.1 => /lib64/libpcre.so.1 (0x00007f060d08d000)
libdl.so.2 => /lib64/libdl.so.2 (0x00007f060ce89000)
/lib64/ld-linux-x86-64.so.2 (0x00007f060dcf1000)
libattr.so.1 => /lib64/libattr.so.1 (0x00007f060cc84000)
libpthread.so.0 => /lib64/libpthread.so.0 (0x00007f060ca68000)
```

对 `libc` 库文件运行 `readelf` 以查看它是哪种文件。正如它指出的那样，它是一个 `DYN (Shared object file)`（共享对象文件），这意味着它不能直接执行；必须由内部使用了该库提供的任何函数的可执行文件使用它。

```
[testdir]# readelf -h /lib64/libc.so.6
ELF Header:
Magic: 7f 45 4c 46 02 01 01 03 00 00 00 00 00 00 00 00
Class: ELF64
Data: 2's complement, little endian
Version: 1 (current)
OS/ABI: UNIX - GNU
ABI Version: 0
Type: DYN (Shared object file)
```

#### size：列出节的大小和全部大小

`size` 命令仅适用于目标文件和可执行文件，因此，如果尝试在简单的 ASCII 文件上运行它，则会抛出错误，提示“文件格式无法识别”。

```
[testdir]# echo "test" > file1
[testdir]# cat file1
test
[testdir]# file file1
file1: ASCII text
[testdir]# size file1
size: file1: File format not recognized
```

现在，在上面的练习中，对目标文件和可执行文件运行 `size` 命令。请注意，根据 `size` 命令的输出可以看出，可执行文件（`a.out`）的信息要比目标文件（`hello.o`）多得多：

```
[testdir]# size hello.o
text data bss dec hex filename
89 0 0 89 59 hello.o
[testdir]# size a.out
text data bss dec hex filename
1194 540 4 1738 6ca a.out
```

但是这里的 `text`、`data` 和 `bss` 节是什么意思？

`text` 节是指二进制文件的代码部分，其中包含所有可执行指令。`data` 节是所有初始化数据所在的位置，`bss` 节是所有未初始化数据的存储位置。（LCTT 译注：一般来说，在静态的映像文件中，各个部分称之为<ruby>节<rt>section</rt></ruby>，而在运行时的各个部分称之为<ruby>段<rt>segment</rt></ruby>，有时统称为段。）

比较其他一些可用的系统二进制文件的 `size` 结果。

对于 `ls` 命令：

```
[testdir]# size /bin/ls
text data bss dec hex filename
103119 4768 3360 111247 1b28f /bin/ls
```

只需查看 `size` 命令的输出，你就可以看到 `gcc` 和 `gdb` 是比 `ls` 大得多的程序：

```
[testdir]# size /bin/gcc
text data bss dec hex filename
755549 8464 81856 845869 ce82d /bin/gcc
[testdir]# size /bin/gdb
text data bss dec hex filename
6650433 90842 152280 6893555 692ff3 /bin/gdb
```

#### strings：打印文件中的可打印字符串

在 `strings` 命令中添加 `-d` 标志以仅显示 `data` 节中的可打印字符通常很有用。

`hello.o` 是一个目标文件，其中包含打印出 `Hello World` 文本的指令。因此，`strings` 命令的唯一输出是 `Hello World`。

```
[testdir]# strings -d hello.o 
Hello World
```

另一方面，在 `a.out`（可执行文件）上运行 `strings` 会显示在链接阶段该二进制文件中包含的其他信息：

```
[testdir]# strings -d a.out
/lib64/ld-linux-x86-64.so.2
!^BU
libc.so.6
puts
__libc_start_main
__gmon_start__
GLIBC_2.2.5
UH-0
UH-0
=(
[]A\A]A^A_
Hello World
;*3$"
```

#### objdump：显示目标文件信息

另一个可以从二进制文件中转储机器语言指令的 binutils 工具称为 `objdump`。使用 `-d` 选项，可从二进制文件中反汇编出所有汇编指令。

回想一下，编译是将源代码指令转换为机器代码的过程。机器代码仅由 1 和 0 组成，人类难以阅读。因此，它有助于将机器代码表示为汇编语言指令。汇编语言是什么样的？请记住，汇编语言是特定于体系结构的；由于我使用的是 Intel（x86-64）架构，因此如果你使用 ARM 架构编译相同的程序，指令将有所不同。

```
[testdir]# objdump -d hello.o
hello.o: file format elf64-x86-64
Disassembly of section .text:
0000000000000000
:
0:  55              push %rbp
1:  48 89 e5        mov %rsp,%rbp
4:  bf 00 00 00 00  mov $0x0,%edi
9:  e8 00 00 00 00  callq e

e:  b8 00 00 00 00  mov $0x0,%eax
13: 5d              pop %rbp
14: c3              retq
```

该输出乍一看似乎令人生畏，但请花一点时间来理解它，然后再继续。回想一下，`.text` 节包含所有的机器代码指令。汇编指令可以在第四列中看到（即 `push`、`mov`、`callq`、`pop`、`retq` 等）。这些指令作用于寄存器，寄存器是 CPU 内置的存储器位置。本示例中的寄存器是 `rbp`、`rsp`、`edi`、`eax` 等，并且每个寄存器都有特殊的含义。

现在对可执行文件（`a.out`）运行 `objdump` 并查看得到的内容。可执行文件的 `objdump` 的输出可能很大，因此我使用 `grep` 命令将其缩小到 `main` 函数：

```
[testdir]# objdump -d a.out | grep -A 9 main\>
000000000040051d
:
40051d: 55              push %rbp
40051e: 48 89 e5        mov %rsp,%rbp
400521: bf d0 05 40 00  mov $0x4005d0,%edi
400526: e8 d5 fe ff ff  callq 400400
40052b: b8 00 00 00 00  mov $0x0,%eax
400530: 5d              pop %rbp
400531: c3              retq
```

请注意，这些指令与目标文件 `hello.o` 相似，但是其中包含一些其他信息：

* 目标文件 `hello.o` 具有以下指令：`callq e`
* 可执行文件 `a.out` 由以下指令组成，该指令带有一个地址和函数：`callq 400400 <puts@plt>`
   
上面的汇编指令正在调用 `puts` 函数。请记住，你在源代码中使用了一个 `printf` 函数。编译器插入了对 `puts` 库函数的调用，以将 `Hello World` 输出到屏幕。

查看 `put` 上方一行的说明：

* 目标文件 `hello.o` 有个指令 `mov`：`mov $0x0,%edi`
* 可执行文件 `a.out` 的 `mov` 指令带有实际地址（`$0x4005d0`）而不是 `$0x0`：`mov $0x4005d0,%edi`

该指令将二进制文件中地址 `$0x4005d0` 处存在的内容移动到名为 `edi` 的寄存器中。

这个存储位置的内容中还能是别的什么吗？是的，你猜对了：它就是文本 `Hello, World`。你是如何确定的？

`readelf` 命令使你可以将二进制文件（`a.out`）的任何节转储到屏幕上。以下要求它将 `.rodata`（这是只读数据）转储到屏幕上：

```
[testdir]# readelf -x .rodata a.out

Hex dump of section '.rodata':
0x004005c0 01000200 00000000 00000000 00000000 ....
0x004005d0 48656c6c 6f20576f 726c6400 Hello World.
```

你可以在右侧看到文本 `Hello World`，在左侧可以看到其二进制格式的地址。它是否与你在上面的 `mov` 指令中看到的地址匹配？是的，确实匹配。

#### strip：从目标文件中剥离符号

该命令通常用于在将二进制文件交付给客户之前减小二进制文件的大小。

请记住，由于重要信息已从二进制文件中删除，因此它会妨碍调试。但是，这个二进制文件可以完美地执行。

对 `a.out` 可执行文件运行该命令，并注意会发生什么。首先，通过运行以下命令确保二进制文件没有被剥离（`not stripped`）：

```
[testdir]# file a.out
a.out: ELF 64-bit LSB executable, x86-64, [......] not stripped
```

另外，在运行 `strip` 命令之前，请记下二进制文件中最初的字节数：

```
[testdir]# du -b a.out
8440 a.out
```

现在对该可执行文件运行 `strip` 命令，并使用 `file` 命令以确保正常完成：

```
[testdir]# strip a.out
[testdir]# file a.out a.out: ELF 64-bit LSB executable, x86-64, [......] stripped

```

剥离该二进制文件后，此小程序的大小从之前的 `8440` 字节减小为 `6296` 字节。对于这样小的一个程序都能有这么大的空间节省，难怪大型程序经常被剥离。

```
[testdir]# du -b a.out 
6296 a.out
```

#### addr2line：转换地址到文件名和行号

`addr2line` 工具只是在二进制文件中查找地址，并将其与 C 源代码程序中的行进行匹配。很酷，不是吗？

为此编写另一个测试程序；只是这一次确保使用 `gcc` 的 `-g` 标志进行编译，这将为二进制文件添加其它调试信息，并包含有助于调试的行号（由源代码中提供）：

```
[testdir]# cat -n atest.c
1  #include <stdio.h>
2
3  int globalvar = 100;
4
5  int function1(void)
6  {
7    printf("Within function1\n");
8    return 0;
9  }
10
11 int function2(void)
12 {
13   printf("Within function2\n");
14   return 0;
15 }
16
17 int main(void)
18 {
19   function1();
20   function2();
21   printf("Within main\n");
22   return 0;
23 }
```

用 `-g` 标志编译并执行它。正如预期：

```
[testdir]# gcc -g atest.c
[testdir]# ./a.out
Within function1
Within function2
Within main
```

现在使用 `objdump` 来标识函数开始的内存地址。你可以使用 `grep` 命令来过滤出所需的特定行。函数的地址在下面突出显示（`55 push %rbp` 前的地址）：

```
[testdir]# objdump -d a.out | grep -A 2 -E 'main>:|function1>:|function2>:'
000000000040051d :
40051d: 55 push %rbp
40051e: 48 89 e5 mov %rsp,%rbp
--
0000000000400532 :
400532: 55 push %rbp
400533: 48 89 e5 mov %rsp,%rbp
--
0000000000400547
:
400547: 55 push %rbp
400548: 48 89 e5 mov %rsp,%rbp
```

现在，使用 `addr2line` 工具从二进制文件中的这些地址映射到 C 源代码匹配的地址：

```
[testdir]# addr2line -e a.out 40051d
/tmp/testdir/atest.c:6
[testdir]#
[testdir]# addr2line -e a.out 400532
/tmp/testdir/atest.c:12
[testdir]#
[testdir]# addr2line -e a.out 400547
/tmp/testdir/atest.c:18
```

它说 `40051d` 从源文件 `atest.c` 中的第 `6` 行开始，这是 `function1` 的起始大括号（`{`）开始的行。`function2` 和 `main` 的输出也匹配。

#### nm：列出目标文件的符号

使用上面的 C 程序测试 `nm` 工具。使用 `gcc` 快速编译并执行它。

```
[testdir]# gcc atest.c
[testdir]# ./a.out
Within function1
Within function2
Within main
```

现在运行 `nm` 和 `grep` 获取有关函数和变量的信息：

```
[testdir]# nm a.out | grep -Ei 'function|main|globalvar'
000000000040051d T function1
0000000000400532 T function2
000000000060102c D globalvar
U __libc_start_main@@GLIBC_2.2.5
0000000000400547 T main
```

你可以看到函数被标记为 `T`，它表示 `text` 节中的符号，而变量标记为 `D`，表示初始化的 `data` 节中的符号。

想象一下在没有源代码的二进制文件上运行此命令有多大用处？这使你可以窥视内部并了解使用了哪些函数和变量。当然，除非二进制文件已被剥离，这种情况下它们将不包含任何符号，因此 `nm` 就命令不会很有用，如你在此处看到的：

```
[testdir]# strip a.out
[testdir]# nm a.out | grep -Ei 'function|main|globalvar'
nm: a.out: no symbols
```

### 结论

GNU binutils 工具为有兴趣分析二进制文件的人提供了许多选项，这只是它们可以为你做的事情的冰山一角。请阅读每种工具的手册页，以了解有关它们以及如何使用它们的更多信息。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/gnu-binutils

作者：[Gaurav Kamathe][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/gkamathe
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tools_sysadmin_cloud.png?itok=sUciG0Cn (Tools for the sysadmin)
[2]: https://en.wikipedia.org/wiki/GNU_Binutils
[3]: https://www.freebsd.org/doc/handbook/linuxemu.html
[4]: https://en.wikipedia.org/wiki/Executable_and_Linkable_Format
[5]: https://en.wikipedia.org/wiki/C_preprocessor
[6]: https://gcc.gnu.org/onlinedocs/gcc/
[7]: https://en.wikipedia.org/wiki/Position-independent_code#Position-independent_executables
