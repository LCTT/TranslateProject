[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11120-1.html)
[#]: subject: (32-bit life support: Cross-compiling with GCC)
[#]: via: (https://opensource.com/article/19/7/cross-compiling-gcc)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

32 位支持：使用 GCC 交叉编译
======

> 使用 GCC 在单一的构建机器上来为不同的 CPU 架构交叉编译二进制文件。

![](https://img.linux.net.cn/data/attachment/album/201907/19/054242nwhludz9tm2lwd8t.jpg)

如果你是一个开发者，要创建二进制软件包，像一个 RPM、DEB、Flatpak 或 Snap 软件包，你不得不为各种不同的目标平台编译代码。典型的编译目标包括 32 位和 64 位的 x86 和 ARM。你可以在不同的物理或虚拟机器上完成你的构建，但这需要你为何几个系统。作为代替，你可以使用 GNU 编译器集合 ([GCC][2]) 来交叉编译，在单一的构建机器上为几个不同的 CPU 架构产生二进制文件。

假设你有一个想要交叉编译的简单的掷骰子游戏。在大多数系统上，以 C 语言来编写这个相对简单，出于给添加现实的复杂性的目的，我以 C++ 语言写这个示例，所以程序依赖于一些不在 C 语言中东西 (具体来说就是 `iostream`)。

```
#include <iostream>
#include <cstdlib>

using namespace std;

void lose (int c); 
void win (int c); 
void draw (); 

int main() { 
  int i; 
    do { 
      cout << "Pick a number between 1 and 20: \n"; 
      cin >> i; 
      int c = rand ( ) % 21; 
      if (i > 20) lose (c); 
      else if (i < c ) lose (c); 
      else if (i > c ) win (c); 
      else draw (); 
      } 
      while (1==1); 
      }

void lose (int c ) 
  { 
    cout << "You lose! Computer rolled " << c << "\n"; 
  }

void win (int c ) 
  { 
    cout << "You win!! Computer rolled " << c << "\n"; 
   }

void draw ( ) 
   { 
     cout << "What are the chances. You tied. Try again, I dare you! \n";
   }
```

在你的系统上使用 `g++` 命令编译它：

```
$ g++ dice.cpp -o dice
```

然后，运行它来确认其工作：

```
$ ./dice
Pick a number between 1 and 20:
[...]
```

你可以使用 `file` 命令来查看你刚刚生产的二进制文件的类型：

```
$ file ./dice
dice: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically
linked (uses shared libs), for GNU/Linux 5.1.15, not stripped
```

同样重要，使用 `ldd` 命令来查看它链接哪些库：

```
$ ldd dice
linux-vdso.so.1 =&gt; (0x00007ffe0d1dc000)
libstdc++.so.6 =&gt; /usr/lib/x86_64-linux-gnu/libstdc++.so.6
(0x00007fce8410e000)
libc.so.6 =&gt; /lib/x86_64-linux-gnu/libc.so.6
(0x00007fce83d4f000)
libm.so.6 =&gt; /lib/x86_64-linux-gnu/libm.so.6
(0x00007fce83a52000)
/lib64/ld-linux-x86-64.so.2 (0x00007fce84449000)
libgcc_s.so.1 =&gt; /lib/x86_64-linux-gnu/libgcc_s.so.1
(0x00007fce8383c000)
```

从这些测试中，你已经确认了两件事：你刚刚运行的二进制文件是 64 位的，并且它链接的是 64 位库。

这意味着，为实现 32 位交叉编译，你必需告诉 `g++` 来：

  1. 产生一个 32 位二进制文件
  2. 链接 32 位库，而不是 64 位库

### 设置你的开发环境

为编译成 32 位二进制，你需要在你的系统上安装 32 位的库和头文件。如果你运行一个纯 64 位系统，那么，你没有 32 位的库或头文件，并且需要安装一个基础集合。最起码，你需要 C 和 C++ 库（`glibc` 和 `libstdc++`）以及 GCC 库（`libgcc`）的 32 位版本。这些软件包的名称可能在每个发行版中不同。在 Slackware 系统上，一个纯 64 位的带有 32 位兼容的发行版，可以从 [Alien BOB][3] 提供的 `multilib` 软件包中获得。在 Fedora、CentOS 和 RHEL 系统上：

```
$ yum install libstdc++-*.i686
$ yum install glibc-*.i686
$ yum install libgcc.i686
```

不管你正在使用什么系统，你同样必须安装一些你工程使用的 32 位库。例如，如果你在你的工程中包含 `yaml-cpp`，那么，在编译工程前，你必需安装 `yaml-cpp` 的 32 位版本，或者，在很多系统上，安装 `yaml-cpp` 的开发软件包（例如，在 Fedora 系统上的 `yaml-cpp-devel`）。

一旦这些处理好了，编译是相当简单的：

```
$ g++ -m32 dice.cpp -o dice32 -L /usr/lib -march=i686
```

`-m32` 标志告诉 GCC 以 32 位模式编译。`-march=i686` 选项进一步定义来使用哪种最优化类型（参考 `info gcc` 了解选项列表）。`-L` 标志设置你希望 GCC 来链接的库的路径。对于 32 位来说通常是 `/usr/lib`，不过，这依赖于你的系统是如何设置的，它可以是 `/usr/lib32`，甚至 `/opt/usr/lib`，或者任何你知道存放你的 32 位库的地方。

在代码编译后，查看你的构建的证据：

```
$ file ./dice32
dice: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV),
dynamically linked (uses shared libs) [...]
```

接着，当然， `ldd ./dice32` 也会指向你的 32 位库。

### 不同的架构

在 64 位相同的处理器家族上允许 GCC 做出很多关于如何编译代码的假设来编译 32 位软件。如果你需要为完全不同的处理器编译，你必需安装适当的交叉构建实用程序。安装哪种实用程序取决于你正在编译的东西。这个过程比为相同的 CPU 家族编译更复杂一点。

当你为相同处理器家族交叉编译时，你可以期待找到与 32 位库集的相同的 64 位库集，因为你的 Linux 发行版是同时维护这二者的。当为一个完全不同的架构编译时，你可能不得不穷追你的代码所需要的库。你需要的版本可能不在你的发行版的存储库中，因为你的发行版可能不为你的目标系统提供软件包，或者它不在容易到达的位置提供所有的软件包。如果你正在编译的代码是你写的，那么你可能非常清楚它的依赖关系是什么，并清楚在哪里找到它们。如果代码是你下载的，并需要编译，那么你可能不熟悉它的要求。在这种情况下，研究正确编译代码需要什么（它们通常被列在 `README` 或 `INSTALL` 文件中，当然也出现在源文件代码自身之中），然后收集需要的组件。

例如，如果你需要为 ARM 编译 C 代码，你必须首先在 Fedora 或 RHEL 上安装 `gcc-arm-linux-gnu`（32 位）或 `gcc-aarch64-linux-gnu`（64 位）；或者，在 Ubuntu 上安装 `arm-linux-gnueabi-gcc` 和 `binutils-arm-linux-gnueabi`。这提供你需要用来构建（至少）一个简单的 C 程序的命令和库。此外，你需要你的代码使用的任何库。你可以在惯常的位置（大多数系统上在 `/usr/include`）放置头文件，或者，你可以放置它们在一个你选择的目录，并使用 `-I` 选项将 GCC 指向它。

当编译时，不使用标准的 `gcc` 或 `g++` 命令。作为代替，使用你安装的 GCC 实用程序。例如：

```
$ arm-linux-gnu-g++ dice.cpp \
  -I/home/seth/src/crossbuild/arm/cpp \
  -o armdice.bin
```

验证你构建的内容：

```
$ file armdice.bin
armdice.bin: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV) [...]
```

### 库和可交付结果

这是一个如何使用交叉编译的简单的示例。在真实的生活中，你的源文件代码可能产生的不止于一个二进制文件。虽然你可以手动管理，在这里手动管理可能不是好的正当理由。在我接下来的文章中，我将说明 GNU 自动工具，GNU 自动工具做了使你的代码可移植的大部分工作。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/cross-compiling-gcc

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tools_osyearbook2016_sysadmin_cc.png?itok=Y1AHCKI4 (Wratchet set tools)
[2]: https://gcc.gnu.org/
[3]: http://www.slackware.com/~alien/multilib/
