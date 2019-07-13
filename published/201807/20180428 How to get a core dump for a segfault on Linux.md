在 Linux 上如何得到一个段错误的核心转储
============================================================

本周工作中，我花了整整一周的时间来尝试调试一个段错误。我以前从来没有这样做过，我花了很长时间才弄清楚其中涉及的一些基本事情（获得核心转储、找到导致段错误的行号）。于是便有了这篇博客来解释如何做那些事情！

在看完这篇博客后，你应该知道如何从“哦，我的程序出现段错误，但我不知道正在发生什么”到“我知道它出现段错误时的堆栈、行号了！ “。

### 什么是段错误？

“<ruby>段错误<rt>segmentation fault</rt></ruby>”是指你的程序尝试访问不允许访问的内存地址的情况。这可能是由于：

*   试图解引用空指针（你不被允许访问内存地址 `0`）；
*   试图解引用其他一些不在你内存（LCTT 译注：指不在合法的内存地址区间内）中的指针；
*   一个已被破坏并且指向错误的地方的 <ruby>C++ 虚表指针<rt>C++ vtable pointer</rt></ruby>，这导致程序尝试执行没有执行权限的内存中的指令；
*   其他一些我不明白的事情，比如我认为访问未对齐的内存地址也可能会导致段错误（LCTT 译注：在要求自然边界对齐的体系结构，如 MIPS、ARM 中更容易因非对齐访问产生段错误）。

这个“C++ 虚表指针”是我的程序发生段错误的情况。我可能会在未来的博客中解释这个，因为我最初并不知道任何关于 C++ 的知识，并且这种虚表查找导致程序段错误的情况也是我所不了解的。

但是！这篇博客后不是关于 C++ 问题的。让我们谈论的基本的东西，比如，我们如何得到一个核心转储？

### 步骤1：运行 valgrind

我发现找出为什么我的程序出现段错误的最简单的方式是使用 `valgrind`：我运行

```
valgrind -v your-program
```

这给了我一个故障时的堆栈调用序列。 简洁！

但我想也希望做一个更深入调查，并找出些 `valgrind` 没告诉我的信息！ 所以我想获得一个核心转储并探索它。

### 如何获得一个核心转储

<ruby>核心转储<rt>core dump</rt></ruby>是您的程序内存的一个副本，并且当您试图调试您的有问题的程序哪里出错的时候它非常有用。

当您的程序出现段错误，Linux 的内核有时会把一个核心转储写到磁盘。 当我最初试图获得一个核心转储时，我很长一段时间非常沮丧，因为 -  Linux 没有生成核心转储！我的核心转储在哪里？

这就是我最终做的事情：

1.  在启动我的程序之前运行 `ulimit -c unlimited`
2.  运行 `sudo sysctl -w kernel.core_pattern=/tmp/core-%e.%p.%h.%t`

### ulimit：设置核心转储的最大尺寸

`ulimit -c` 设置核心转储的最大尺寸。 它往往设置为 0，这意味着内核根本不会写核心转储。 它以千字节为单位。  `ulimit` 是按每个进程分别设置的 —— 你可以通过运行 `cat /proc/PID/limit` 看到一个进程的各种资源限制。

例如这些是我的系统上一个随便一个 Firefox 进程的资源限制：

```
$ cat /proc/6309/limits 
Limit                     Soft Limit           Hard Limit           Units     
Max cpu time              unlimited            unlimited            seconds   
Max file size             unlimited            unlimited            bytes     
Max data size             unlimited            unlimited            bytes     
Max stack size            8388608              unlimited            bytes     
Max core file size        0                    unlimited            bytes     
Max resident set          unlimited            unlimited            bytes     
Max processes             30571                30571                processes 
Max open files            1024                 1048576              files     
Max locked memory         65536                65536                bytes     
Max address space         unlimited            unlimited            bytes     
Max file locks            unlimited            unlimited            locks     
Max pending signals       30571                30571                signals   
Max msgqueue size         819200               819200               bytes     
Max nice priority         0                    0                    
Max realtime priority     0                    0                    
Max realtime timeout      unlimited            unlimited            us   
```

内核在决定写入多大的核心转储文件时使用<ruby>软限制<rt>soft limit</rt></ruby>（在这种情况下，`max core file size = 0`）。 您可以使用 shell 内置命令 `ulimit`（`ulimit -c unlimited`） 将软限制增加到<ruby>硬限制<rt>hard limit</rt></ruby>。

### kernel.core_pattern：核心转储保存在哪里

`kernel.core_pattern` 是一个内核参数，或者叫 “sysctl 设置”，它控制 Linux 内核将核心转储文件写到磁盘的哪里。

内核参数是一种设定您的系统全局设置的方法。您可以通过运行 `sysctl -a` 得到一个包含每个内核参数的列表，或使用 `sysctl kernel.core_pattern` 来专门查看 `kernel.core_pattern` 设置。

所以 `sysctl -w kernel.core_pattern=/tmp/core-%e.%p.%h.%t` 将核心转储保存到目录 `/tmp` 下，并以 `core` 加上一系列能够标识（出故障的）进程的参数构成的后缀为文件名。

如果你想知道这些形如 `%e`、`%p` 的参数都表示什么，请参考 [man core][1]。

有一点很重要，`kernel.core_pattern` 是一个全局设置 —— 修改它的时候最好小心一点，因为有可能其它系统功能依赖于把它被设置为一个特定的方式（才能正常工作）。

### kernel.core_pattern 和 Ubuntu

默认情况下在 ubuntu 系统中，`kernel.core_pattern` 被设置为下面的值：

```
$ sysctl kernel.core_pattern
kernel.core_pattern = |/usr/share/apport/apport %p %s %c %d %P
```

这引起了我的迷惑（这 apport 是干什么的，它对我的核心转储做了什么？）。以下关于这个我了解到的：

*   Ubuntu 使用一种叫做 apport 的系统来报告 apt 包有关的崩溃信息。
*   设定 `kernel.core_pattern=|/usr/share/apport/apport %p %s %c %d %P` 意味着核心转储将被通过管道送给 `apport` 程序。
*   apport 的日志保存在文件 `/var/log/apport.log` 中。
*   apport 默认会忽略来自不属于 Ubuntu 软件包一部分的二进制文件的崩溃信息

我最终只是跳过了 apport，并把 `kernel.core_pattern` 重新设置为 `sysctl -w kernel.core_pattern=/tmp/core-%e.%p.%h.%t`，因为我在一台开发机上，我不在乎 apport 是否工作，我也不想尝试让 apport 把我的核心转储留在磁盘上。

### 现在你有了核心转储，接下来干什么？

好的，现在我们了解了 `ulimit` 和 `kernel.core_pattern` ，并且实际上在磁盘的 `/tmp` 目录中有了一个核心转储文件。太好了！接下来干什么？我们仍然不知道该程序为什么会出现段错误！

下一步将使用 `gdb` 打开核心转储文件并获取堆栈调用序列。

### 从 gdb 中得到堆栈调用序列

你可以像这样用 `gdb` 打开一个核心转储文件：

```
$ gdb -c my_core_file
```

接下来，我们想知道程序崩溃时的堆栈是什么样的。在 `gdb` 提示符下运行 `bt` 会给你一个<ruby>调用序列<rt>backtrace</rt></ruby>。在我的例子里，`gdb` 没有为二进制文件加载符号信息，所以这些函数名就像 “??????”。幸运的是，（我们通过）加载符号修复了它。

下面是如何加载调试符号。

```
symbol-file /path/to/my/binary
sharedlibrary
```

这从二进制文件及其引用的任何共享库中加载符号。一旦我这样做了，当我执行 `bt` 时，gdb 给了我一个带有行号的漂亮的堆栈跟踪！

如果你想它能工作，二进制文件应该以带有调试符号信息的方式被编译。在试图找出程序崩溃的原因时，堆栈跟踪中的行号非常有帮助。:)

### 查看每个线程的堆栈

通过以下方式在 `gdb` 中获取每个线程的调用栈！

```
thread apply all bt full
```

### gdb + 核心转储 = 惊喜


如果你有一个带调试符号的核心转储以及 `gdb`，那太棒了！您可以上下查看调用堆栈（LCTT 译注：指跳进调用序列不同的函数中以便于查看局部变量），打印变量，并查看内存来得知发生了什么。这是最好的。

如果您仍然正在基于 gdb 向导来工作上，只打印出栈跟踪与bt也可以。 :)

### ASAN

另一种搞清楚您的段错误的方法是使用 AddressSanitizer 选项编译程序（“ASAN”，即 `$CC -fsanitize=address`）然后运行它。 本文中我不准备讨论那个，因为本文已经相当长了，并且在我的例子中打开 ASAN 后段错误消失了，可能是因为 ASAN 使用了一个不同的内存分配器（系统内存分配器，而不是 tcmalloc）。

在未来如果我能让 ASAN 工作，我可能会多写点有关它的东西。（LCTT 译注：这里指使用 ASAN 也能复现段错误）

### 从一个核心转储得到一个堆栈跟踪真的很亲切！

这个博客听起来很多，当我做这些的时候很困惑，但说真的，从一个段错误的程序中获得一个堆栈调用序列不需要那么多步骤：

1.  试试用 `valgrind`

如果那没用，或者你想要拿到一个核心转储来调查：

1.  确保二进制文件编译时带有调试符号信息；
2.  正确的设置 `ulimit` 和 `kernel.core_pattern`；
3.  运行程序；
4.  一旦你用 `gdb` 调试核心转储了，加载符号并运行 `bt`；
5.  尝试找出发生了什么！

我可以使用 `gdb` 弄清楚有个 C++ 的虚表条目指向一些被破坏的内存，这有点帮助，并且使我感觉好像更懂了 C++ 一点。也许有一天我们会更多地讨论如何使用 `gdb` 来查找问题！

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2018/04/28/debugging-a-segfault-on-linux/

作者：[Julia Evans][a]
译者：[stephenxs](https://github.com/stephenxs)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://jvns.ca/about/
[1]:http://man7.org/linux/man-pages/man5/core.5.html
