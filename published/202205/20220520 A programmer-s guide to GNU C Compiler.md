[#]: subject: "A programmer's guide to GNU C Compiler"
[#]: via: "https://opensource.com/article/22/5/gnu-c-compiler"
[#]: author: "Jayashree Huttanagoudar https://opensource.com/users/jayashree-huttanagoudar"
[#]: collector: "lkxed"
[#]: translator: "robsean"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14653-1.html"

GNU C 编译器的程序员入门指南
======

![](https://img.linux.net.cn/data/attachment/album/202205/30/111925gbh7yldbolroheqy.jpg)

> 带你一窥生成二进制文件步骤的幕后，以便在出现一些错误时，你知道如何逐步解决问题。

C 语言广为人知，深受新老程序员的好评。使用 C 语言编写的源文件代码，使用了标准的英语术语，因而人们可以方便阅读。然而，计算机只能理解二进制代码。为将代码转换为机器语言，你需要使用一种被称为 <ruby>编译器<rt>compiler</rt></ruby> 的工具。

最常见的编译器是 GCC（<ruby>GNU 编译器集<rt>GNU Compiler Collection</rt></ruby>）。编译过程涉及到一系列的中间步骤及相关工具。

### 安装 GCC

为验证在你的系统上是否已经安装了 GCC，使用 `gcc` 命令：

```
$ gcc --version
```

如有必要，使用你的软件包管理器来安装 GCC。在基于 Fedora 的系统上，使用 `dnf` ：

```
$ sudo dnf install gcc libgcc
```

在基于 Debian 的系统上，使用 `apt` ：

```
$ sudo apt install build-essential
```

在安装后，如果你想查看 GCC 的安装位置，那么使用：

```
$ whereis gcc
```

### 演示使用 GCC 来编译一个简单的 C 程序

这里有一个简单的 C 程序，用于演示如何使用 GCC 来编译。打开你最喜欢的文本编辑器，并在其中粘贴这段代码：

```
// hellogcc.c
#include <stdio.h>

int main() {
    printf("Hello, GCC!\n");
    return 0;
}
```

保存文件为 `hellogcc.c` ，接下来编译它：

```
$ ls
hellogcc.c

$ gcc hellogcc.c

$ ls -1
a.out
hellogcc.c
```

如你所见，`a.out` 是编译后默认生成的二进制文件。为查看你所新编译的应用程序的输出，只需要运行它，就像你运行任意本地二进制文件一样：

```
$ ./a.out
Hello, GCC!
```

### 命名输出的文件

文件名称 `a.out` 是非常莫名其妙的，所以，如果你想具体指定可执行文件的名称，你可以使用 `-o` 选项：

（LCTT 译注：注意这和最近 Linux 内核废弃的 a.out 格式无关，只是名字相同，这里生成的 a.out 是 ELF 格式的 —— 也不知道谁给起了个 `a.out` 这破名字，在我看来，默认输出文件名就应该是去掉了 `.c` 扩展名后的名字。by wxy）

```
$ gcc -o hellogcc hellogcc.c

$ ls
a.out hellogcc hellogcc.c

$ ./hellogcc
Hello, GCC!
```

当开发一个需要编译多个 C 源文件文件的大型应用程序时，这种选项是很有用的。

### 在 GCC 编译中的中间步骤

编译实际上有四个步骤，即使在简单的用例中 GCC 自动执行了这些步骤。

1. <ruby>预处理<rt>Pre-Processing</rt></ruby>：GNU 的 C 预处理器（cpp）解析头文件（`#include` 语句），展开 <ruby>宏<rt>macros </rt></ruby> 定义（`#define` 语句），并使用展开的源文件代码来生成一个中间文件，如 `hellogcc.i`。
2. <ruby>编译<rt>Compilation</rt></ruby>：在这个期间中，编译器将预处理的源文件代码转换为指定 CPU 架构的汇编代码。由此生成是汇编文件使用一个 `.s` 扩展名来命名，如在这个示例中的 `hellogcc.s` 。
3. <ruby>汇编<rt>Assembly</rt></ruby>：汇编程序（`as`）将汇编代码转换为目标机器代码，放在目标文件中，例如 `hellogcc.o` 。
4. <ruby>链接<rt>Linking</rt></ruby>：链接器（`ld`）将目标代码和库代码链接起来生成一个可执行文件，例如 `hellogcc` 。

在运行 GCC 时，可以使用 `-v` 选项来查看每一步的细节：

```
$ gcc -v -o hellogcc hellogcc.c
```

![Compiler flowchart][2]

### 手动编译代码

体验编译的每个步骤可能是很有用的，因此在一些情况下，你不需要 GCC 完成所有的步骤。

首先，除源文件文件以外，删除在当前文件夹下生成的文件。

```
$ rm a.out hellogcc.o

$ ls
hellogcc.c
```

#### 预处理器

首先，启动预处理器，将其输出重定向为 `hellogcc.i` ：

```
$ cpp hellogcc.c > hellogcc.i

$ ls
hellogcc.c hellogcc.i
```

查看输出文件，并注意一下预处理器是如何包含头文件和扩展宏中的源文件代码的。

#### 编译器

现在，你可以编译代码为汇编代码。使用 `-S` 选项来设置 GCC 只生成汇编代码：

```
$ gcc -S hellogcc.i

$ ls
hellogcc.c hellogcc.i hellogcc.s

$ cat hellogcc.s
```

查看汇编代码，来看看生成了什么。

#### 汇编

使用你刚刚所生成的汇编代码来创建一个目标文件：

```
$ as -o hellogcc.o hellogcc.s

$ ls
hellogcc.c hellogcc.i hellogcc.o hellogcc.s
```

#### 链接

要生成一个可执行文件，你必须将对象文件链接到它所依赖的库。这并不像前面的步骤那么简单，但它却是有教育意义的：

```
$ ld -o hellogcc hellogcc.o
ld: warning: cannot find entry symbol _start; defaulting to 0000000000401000
ld: hellogcc.o: in function `main`:
hellogcc.c:(.text+0xa): undefined reference to `puts'
```

在链接器查找完 `libc.so` 库后，出现一个引用 `undefined puts` 错误。你必须找出适合的链接器选项来链接必要的库以解决这个问题。这不是一个小技巧，它取决于你的系统的布局。

在链接时，你必须链接代码到<ruby>核心运行时<rt>core runtime</rt></ruby>（CRT）目标，这是一组帮助二进制可执行文件启动的子例程。链接器也需要知道在哪里可以找到重要的系统库，包括 `libc` 和 `libgcc`，尤其是其中的特殊的开始和结束指令。这些指令可以通过 `--start-group` 和 `--end-group` 选项来分隔，或者使用指向 `crtbegin.o` 和 `crtend.o` 的路径。

这个示例使用了 RHEL 8 上的路径，因此你可能需要依据你的系统调整路径。

```
$ ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 \
    -o hello \
    /usr/lib64/crt1.o /usr/lib64/crti.o \
    --start-group \
        -L/usr/lib/gcc/x86_64-redhat-linux/8 \
        -L/usr/lib64 -L/lib64 hello.o \
        -lgcc \
        --as-needed -lgcc_s \
        --no-as-needed -lc -lgcc \
    --end-group \
    /usr/lib64/crtn.o
```

在 Slackware 上，同样的链接过程会使用一组不同的路径，但是，你可以看到这其中的相似之处：

```
$ ld -static -o hello \
    -L/usr/lib64/gcc/x86_64-slackware-linux/11.2.0/ \
    /usr/lib64/crt1.o /usr/lib64/crti.o hello.o /usr/lib64/crtn.o \
    --start-group \
        -lc -lgcc -lgcc_eh \
    --end-group
```

现在，运行由此生成的可执行文件：

```
$ ./hello
Hello, GCC!
```

### 一些有用的实用程序

下面是一些帮助检查文件类型、<ruby>符号表<rt>symbol tables</rt></ruby> 和链接到可执行文件的库的实用程序。

使用 `file` 实用程序可以确定文件的类型：

```
$ file hellogcc.c
hellogcc.c: C source, ASCII text

$ file hellogcc.o
hellogcc.o: ELF 64-bit LSB relocatable, x86-64, version 1 (SYSV), not stripped

$ file hellogcc
hellogcc: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=bb76b241d7d00871806e9fa5e814fee276d5bd1a, for GNU/Linux 3.2.0, not stripped
```

对目标文件使用 `nm` 实用程序可以列出 <ruby>符号表<rt>symbol tables</rt></ruby> ：

```
$ nm hellogcc.o
0000000000000000 T main
             U puts
```

使用 `ldd` 实用程序来列出动态链接库：

```
$ ldd hellogcc
linux-vdso.so.1 (0x00007ffe3bdd7000)
libc.so.6 => /lib64/libc.so.6 (0x00007f223395e000)
/lib64/ld-linux-x86-64.so.2 (0x00007f2233b7e000)
```

### 总结

在这篇文章中，你了解到了 GCC 编译中的各种中间步骤，和检查文件类型、<ruby>符号表<rt>symbol tables</rt></ruby> 和链接到可执行文件的库的实用程序。在你下次使用 GCC 时，你将会明白它为你生成一个二进制文件所要做的步骤，并且当出现一些错误时，你会知道如何逐步处理解决问题。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/gnu-c-compiler

作者：[Jayashree Huttanagoudar][a]
选题：[lkxed][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jayashree-huttanagoudar
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/build_structure_tech_program_code_construction.png
[2]: https://opensource.com/sites/default/files/2022-05/compiler-flowchart.png
