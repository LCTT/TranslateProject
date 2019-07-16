[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (32-bit life support: Cross-compiling with GCC)
[#]: via: (https://opensource.com/article/19/7/cross-compiling-gcc)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

32位生存支持：使用 GCC 交叉编译
======
使用 GCC 从一个单个构建机器中来为不同的架构交叉编译二进制文件。
![Wratchet set tools][1]

如果你是一个开发者，创建二进制软件包，像一个 RPM, DEB, Flatpak,或 Snap 软件包，你不得不来为各种不同的目标平台编译代码。典型的目标包括32位和64位的 x86 和  ARM 。你可以在不同的物理或虚拟机器上完成你的构建。作为代替，你可以使用 GNU 编译器集合 ([GCC][2]) 来交叉编译，从一个单个构建机器中为几个不同的架构产生二进制文件。

假设你有一个简单的掷骰子游戏，你想交叉编译。在大多数系统上，以 C 语言写的一些东西相对简单，为了给现实性添加复杂性的目的，我以 C++ 语言写这个示例，所以程序依赖于一些不在 C 语言中东西 (具体来说，**iostream**)。


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

在你的系统上使用 **g++** 命令编译它：


```
`$ g++ dice.cpp -o dice`
```

然后，运行它来确认其工作：


```
$ ./dice
Pick a number between 1 and 20:
[...]
```

你可以使用 **file** 命令来查看你刚刚生产的二进制文件的类型：


```
$ file ./dice
dice: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically
linked (uses shared libs), for GNU/Linux 5.1.15, not stripped
```

同样重要，使用 **ldd** 命令来窗口它链接哪些库：


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

从这些测试中，你已经确认两件事：你刚刚运行的二进制文件是64位的，并且它链接64位库。

这意味着，为实现32位交叉编译，你必需告诉 **g++** 来：

  1. 产生一个32位二进制文件
  2. 链接32位库，而不是64位库



### 设置你的开发环境

为编译到32位，你需要在你的系统上安装32位库和头文件。如果你运行一个纯64位系统，那么，你没有32位库或头文件，并且需要安装一个基础集合。最起码，你需要 C 和 C++ 库 (**glibc** 和 **libstdc++**) 以及GCC 库 (**libgcc**) 的32位版本。这些软件包的名称可能在每个发行版中不同。在 Slackware 系统上，一个纯64位的带有32位兼容的发行版，可以从 [Alien BOB][3] 提供的 **multilib** 软件包中获得。在 Fedora，CentOS，和 RHEL 系统上：


```
$ yum install libstdc++-*.i686
$ yum install glibc-*.i686
$ yum install libgcc.i686
```

不管你正在使用什么系统，你同样必需安装一些你工程使用的32位库。例如，如果你在你的工程中包含 **yaml-cpp** ，那么，在编译工程前，你必需安装 **yaml-cpp** 的32位版本，或者，在很多系统上，安装 **yaml-cpp** 的开发软件包(例如，在 Fedora 系统上**yaml-cpp-devel** )。

一旦这些处理好了，编译是相当简单的：


```
`$ g++ -m32 dice.cpp -o dice32 -L /usr/lib -march=i686`
```

**-m32** 标志告诉 GCC 以32位模式编译。**-march=i686** 选项进一步定义来使用哪种最优化类型（参考 **info gcc** 选项列表）。**-L** 标志设置你希望 GCC 来链接库的路径。对于32位来说通常是 **/usr/lib** ，不过，依赖于你的系统是如何设置的，它可以是 **/usr/lib32** ，甚至 **/opt/usr/lib** ，或者任何你知道你存放你的32位库的地方。

在代码编译后，查看你的构建证据：


```
$ file ./dice32
dice: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV),
dynamically linked (uses shared libs) [...]
```

接着，当然， **ldd ./dice32** 指向你的32位库。

### 不同的架构

在64位相同的处理器家族上允许 GCC 制作很多关于如何编译代码的假设来编译32位软件。如果你需要为完全不同的处理器编译，你必需安装恰当地交叉构建实用程序。安装哪种实用程序取决于你正在编译的东西。这个过程比为相同的 CPU 家族编译更复杂一点。

当你为相同处理器家族交叉编译时，你可以期待找到与32位库集的相同的64位库集，因为你的 Linux 发行版是同时维护的。当为一个完全不同的架构编译时，你可能不得不穷追你代码需要的库。你需要的版本可能不在你的发行版的存储库中，因为你的发行版可能不为你的目标系统提供软件包，或者它不在容易到达的位置映照所有的软件包。如果你正在编译的代码是你的，那么你可能非常清楚它的依赖关系是什么，和清楚在哪里找到它们。如果代码是你下载的，并需要编译，那么你可能不熟悉它的要求。在这种情况下，研究正确编译代码需要什么 (它们通常被列在 README 或 INSTALL 文件中，当然也在源文件代码自身之中)，然后收集需要的组件。

例如，如果你需要为 ARM 编译 C 代码，你必需首先在Fedora 或 RHEL 上安装 **gcc-arm-linux-gnu** (32位) 或 **gcc-aarch64-linux-gnu** (64位)，或者，在 Ubuntu 上安装 **arm-linux-gnueabi-gcc** 和 **binutils-arm-linux-gnueabi** 。这提供你需要来构建（至少）一个简单的 C 程序的命令和库。此外，你需要你的代码使用的任何库。你可以在惯常的位置(在大多数系统上 **/usr/include** )放置头文件，或者，你可以放置它们在一个你选择的目录，并使用 **-I** 选项将 GCC 指向它。

当编译时，不使用标准的 **gcc** 或 **g++** 命令。作为代替，使用你安装的 GCC实用程序。例如：


```
$ arm-linux-gnu-g++ dice.cpp \
  -I/home/seth/src/crossbuild/arm/cpp \
  -o armdice.bin
```

验证你构建的什么：


```
$ file armdice.bin
armdice.bin: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV) [...]
```

### 库和可交付结果

这是一个如何使用交叉编译的简单的示例。在真实的生活中，你的源文件代码可以产生多于一个单个的二进制文件。虽然你可以手动管理，在这里手动管理可能不是好的正当理由。在我接下来的文章中，我将说明 GNU 自动工具，GNU 自动工具做大多数工作来使你的代码可移植。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/cross-compiling-gcc

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tools_osyearbook2016_sysadmin_cc.png?itok=Y1AHCKI4 (Wratchet set tools)
[2]: https://gcc.gnu.org/
[3]: http://www.slackware.com/~alien/multilib/
