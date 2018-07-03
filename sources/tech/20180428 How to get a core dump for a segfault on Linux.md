translating by stenphenxs
在 Linux 上如何得到一个段错误的核心转储
============================================================

This week at work I spent all week trying to debug a segfault. I’d never done this before, and some of the basic things involved (get a core dump! find the line number that segfaulted!) took me a long time to figure out. So here’s a blog post explaining how to do those things!

本周工作中，我花了整整一周的时间来尝试调试一个段错误。我以前从来没有这样做过，我花了很长时间才弄清楚其中涉及的一些基本事情（获得核心转储，找到导致段错误的行号！）。于是便有了这篇博客来解释如何做那些事情！


At the end of this blog post, you should know how to go from “oh no my program is segfaulting and I have no idea what is happening” to “well I know what its stack / line number was when it segfaulted at at least!“.

在这篇博客的最后，你应该知道如何从“哦，我的程序出现段错误，但我不知道正在发生什么”到“我知道它出现段错误时的堆栈/行号了！ “。

### what’s a segfault?

### 什么是段错误？

A “segmentation fault” is when your program tries to access memory that it’s not allowed to access, or tries to . This can be caused by:

一个“段错误”是指你的程序尝试访问不允许访问或尝试访问的内存地址的情况。这可能是由于：（第二个tries to存疑）

*   trying to dereference a null pointer (you’re not allowed to access the memory address `0`)

*   试图解引用空指针（你不被允许访问内存地址 `0`）

*   trying to dereference some other pointer that isn’t in your memory

*   试图解引用其他一些不在你内存（译者注：指合法的内存地址空间）中的指针

*   a C++ vtable pointer that got corrupted and is pointing to the wrong place, which causes the program to try to execute some memory that isn’t executable

*   一个被破坏并且指向错误的地方的 C++ 虚表指针，它导致程序尝试把一些没有执行权限的内存地址空间当成指令执行

*   some other things that I don’t understand, like I think misaligned memory accesses can also segfault

*   其他一些我不明白的事情，比如我认为访问未对齐的内存地址也可能会导致段错误

This “C++ vtable pointer” thing is what was happening to my segfaulting program. I might explain that in a future blog post because I didn’t know any C++ at the beginning of this week and this vtable lookup thing was a new way for a program to segfault that I didn’t know about.

这个“C++ 虚表指针”是我的程序发生段错误的情况。我可能会在未来的博客中解释，因为我最初并不知道任何关于 C++的知识，并且这种虚表查找导致程序段错误的情况也是我所不了解的。

But! This blog post isn’t about C++ bugs. Let’s talk about the basics, like, how do we even get a core dump?

但是！这篇博客后不是关于 C++ 问题的。让我们谈论的基本的东西，比如，我们如何得到一个核心转储？

### step 1: run valgrind

### 步骤1：运行 valgrind

I found the easiest way to figure out why my program is segfaulting was to use valgrind: I ran

我发现找出为什么我的程序出现段错误的最简单的方式是使用valgrind：我运行

```
valgrind -v your-program

```

and this gave me a stack trace of what happened. Neat!

这给了我一个（故障时的）堆栈调用序列。 简洁！

But I wanted also wanted to do a more in-depth investigation and find out more than just what valgrind was telling me! So I wanted to get a core dump and explore it.

但我想也希望做一个更深入调查，并找出些valgrind没告诉我的信息！ 所以我想获得一个核心转储并探索它。

### How to get a core dump

### 如何获得一个核心转储

A core dump is a copy of your program’s memory, and it’s useful when you’re trying to debug what went wrong with your problematic program.

一个核心转储是您的程序内存的一个副本，并且当您试图调试您的有问题的程序哪里出错的时候它非常有用。

When your program segfaults, the Linux kernel will sometimes write a core dump to disk. When I originally tried to get a core dump, I was pretty frustrated for a long time because – Linux wasn’t writing a core dump!! Where was my core dump????

当您的程序出现段错误，Linux 的内核有时会把一个核心转储写到磁盘。 当我最初试图获得一个核心转储时，我很长一段时间非常沮丧，因为 -  Linux 不在生成核心转储！我的核心转储在哪里？

Here’s what I ended up doing:

这就是我最后做了什么：

1.  Run `ulimit -c unlimited` before starting my program

1.  在启动我的程序之前运行 `ulimit -c unlimited`

2.  Run `sudo sysctl -w kernel.core_pattern=/tmp/core-%e.%p.%h.%t`

2.  运行 `sudo sysctl -w kernel.core_pattern=/tmp/core-%e.%p.%h.%t`

### ulimit: set the max size of a core dump

### ulimit：设置核心转储的最大尺寸

`ulimit -c` sets the maximum size of a core dump. It’s often set to 0, which means that the kernel won’t write core dumps at all. It’s in kilobytes. ulimits are per process – you can see a process’s limits by running `cat /proc/PID/limit`

`ulimit -c` 设置核心转储的最大尺寸。 它往往设置为 0，这意味着内核根本不会写核心转储。 它以千字节为单位。 分别为每个进程设置 ulimit - 你可以通过运行 `cat /proc/PID/limit` 看到一个进程的各种资源限制。

For example these are the limits for a random Firefox process on my system:

例如这些是我的系统上一个随机Firefox进程的资源限制：

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

The kernel uses the soft limit (in this case, “max core file size = 0”) when deciding how big of a core file to write. You can increase the soft limit up to the hard limit using the `ulimit` shell builtin (`ulimit -c unlimited`!)

内核在决定写入多大的核心转储文件时使用 soft limit（在这种情况下，“最大的核心文件大小= 0”）。 您可以使用shell内置命令 `ulimit`（`ulimit -c unlimited`） 将 soft limit 增加到 hard limit。

### kernel.core_pattern: where core dumps are written

### kernel.core_pattern：核心转储保存在哪里

`kernel.core_pattern` is a kernel parameter or a “sysctl setting” that controls where the Linux kernel writes core dumps to disk.

`kernel.core_pattern` 是一个内核参数，或者叫“sysctl 设置”，它控制 Linux 内核将核心转储文件写到磁盘的哪里。

Kernel parameters are a way to set global settings on your system. You can get a list of every kernel parameter by running `sysctl -a`, or use `sysctl kernel.core_pattern` to look at the `kernel.core_pattern` setting specifically.

内核参数是一种设定您的系统全局设置的方法。您可以通过运行 `sysctl -a` 得到一个包含每个内核参数的列表，或使用 `sysctl kernel.core_pattern` 来专门查看 `kernel.core_pattern` 设置。

So `sysctl -w kernel.core_pattern=/tmp/core-%e.%p.%h.%t` will write core dumps to `/tmp/core-<a bunch of stuff identifying the process>`

所以 `sysctl -w kernel.core_pattern=/tmp/core-%e.%p.%h.%t` 将核心转储保存到目录 `/tmp` 下并以 `core` 加上一系列能够标识（出故障的）进程的参数构成的后缀为文件名。

If you want to know more about what these `%e`, `%p` parameters read, see [man core][1].

如果你想知道这些形如 `%e`、`%p` 的参数都表示什么，请参考 [man core][1]。

It’s important to know that `kernel.core_pattern` is a global settings – it’s good to be a little careful about changing it because it’s possible that other systems depend on it being set a certain way.

有一点很重要，`kernel.core_pattern` 是一个全局设置 - 修改它的时候最好小心一点，因为有可能其它系统功能依赖于把它被设置为一个特定的方式（才能正常工作）。

### kernel.core_pattern & Ubuntu

### kernel.core_pattern 和 Ubuntu

By default on Ubuntu systems, this is what `kernel.core_pattern` is set to

默认情况下在ubuntu系统中，`kernel.core_pattern` 被设置为下面的值

```
$ sysctl kernel.core_pattern
kernel.core_pattern = |/usr/share/apport/apport %p %s %c %d %P

```

This caused me a lot of confusion (what is this apport thing and what is it doing with my core dumps??) so here’s what I learned about this:

这引起了我的迷惑（这apport是干什么的，它对我的核心转储做了什么？）。这是关于这个我了解到的：

*   Ubuntu uses a system called “apport” to report crashes in apt packages

*   Ubuntu 使用一种叫做 apport 的系统来报告apt包有关的崩溃信息。

*   Setting `kernel.core_pattern=|/usr/share/apport/apport %p %s %c %d %P`means that core dumps will be piped to `apport`

*   把 `kernel.core_pattern=|/usr/share/apport/apport %p %s %c %d %P` 意味着核心转储将被通过管道送给 `apport` 程序。

*   apport has logs in /var/log/apport.log

*   apport 的日志保存在文件 /var/log/apport.log 中。

*   apport by default will ignore crashes from binaries that aren’t part of an Ubuntu packages

*   apport 默认会忽略来自不属于Ubuntu软件包一部分的二进制文件的崩溃信息

I ended up just overriding this Apport business and setting `kernel.core_pattern` to `sysctl -w kernel.core_pattern=/tmp/core-%e.%p.%h.%t` because I was on a dev machine, I didn’t care whether Apport was working on not, and I didn’t feel like trying to convince Apport to give me my core dumps.

我最终只是覆盖了 apport，并使用 `sysctl -w kernel.core_pattern=/tmp/core-%e.%p.%h.%t` 重新设置了 `kernel.core_pattern`，因为我在一台开发机上，我不在乎 apport 是否工作，我也不想尝试让 apport 把我的核心转储留在磁盘上。

### So you have a core dump. Now what?

### 现在你有了核心转储，接下来干什么？

Okay, now we know about ulimits and `kernel.core_pattern` and you have actually have a core dump file on disk in `/tmp`. Amazing! Now what??? We still don’t know why the program segfaulted!

好的，现在我们了解了 ulimit 和 `kernel.core_pattern` ，并且实际上在磁盘的 `/tmp` 目录中有了一个核心转储文件。太好了！接下来干什么？我们仍然不知道该程序为什么会出现段错误！

The next step is to open the core file with `gdb` and get a backtrace.

下一步将使用 `gdb` 打开核心转储文件并获取堆栈调用序列。

### Getting a backtrace from gdb

### 从gdb中得到堆栈调用序列

You can open a core file with gdb like this:

你可以像这样用 `gdb` 打开一个核心转储文件

```
$ gdb -c my_core_file

```

Next, we want to know what the stack was when the program crashed. Running `bt` at the gdb prompt will give you a backtrace. In my case gdb hadn’t loaded symbols for the binary, so it was just like `??????`. Luckily, loading symbols fixed it.

接下来，我们想知道程序崩溃时的堆栈是什么样的。在 gdb 提示符下运行 `bt` 会给你一个调用序列。在我的例子里，gdb 没有为二进制文件加载符号信息，所以这些函数名就像“??????”。幸运的是，（我们通过）加载符号修复了它。

Here’s how to load debugging symbols.

下面是如何加载调试符号。

```
symbol-file /path/to/my/binary
sharedlibrary

```

This loads symbols from the binary and from any shared libraries the binary uses. Once I did that, gdb gave me a beautiful stack trace with line numbers when I ran `bt`!!!

这从二进制文件及其引用的任何共享库中加载符号。一旦我这样做了，当我执行 `bt` 时，gdb 给了我一个带有行号的漂亮的堆栈跟踪！

If you want this to work, the binary should be compiled with debugging symbols. Having line numbers in your stack traces is extremely helpful when trying to figure out why a program crashed :)

如果你想它能工作，二进制文件应该以带有调试符号信息的方式被编译。在试图找出程序崩溃的原因时，堆栈跟踪中的行号非常有帮助。:)

### look at the stack for every thread

### 查看每个线程的堆栈

Here’s how to get the stack for every thread in gdb!

通过以下方式在 gdb 中获取每个线程的调用栈！

```
thread apply all bt full

```

### gdb + core dumps = amazing

### gdb + 核心转储 = 惊喜（这两段需要再斟酌）

If you have a core dump & debugging symbols and gdb, you are in an amazing situation!! You can go up and down the call stack, print out variables, and poke around in memory to see what happened. It’s the best.

如果你有一个带调试符号的核心转储以及 gdb，那太棒了！您可以上下查看调用堆栈，打印变量，并查看内存来得知发生了什么。这是最好的。

If you are still working on being a gdb wizard, you can also just print out the stack trace with `bt` and that’s okay :)

如果您仍然正在基于gdb向导来工作上，只打印出栈跟踪与bt也可以:)

### ASAN

### ASAN

Another path to figuring out your segfault is to do one compile the program with AddressSanitizer (“ASAN”) (`$CC -fsanitize=address`) and run it. I’m not going to discuss that in this post because this is already pretty long and anyway in my case the segfault disappeared with ASAN turned on for some reason, possibly because the ASAN build used a different memory allocator (system malloc instead of tcmalloc).

另一种搞清楚您的段错误的方法是使用 AddressSanitizer 选项编译程序（“ASAN”，即 `$CC -fsanitize=address`）然后运行它。 本文中我不准备讨论那个，因为本文已经相当长了，并且在我的例子中打开 ASAN 后段错误消失了，可能是因为 ASAN 使用了一个不同的内存分配器（系统内存分配器，而不是tcmalloc）。

I might write about ASAN more in the future if I ever get it to work :)

在未来如果我能让ASAN工作，我可能会多写点有关它的东西。（译者注：这里指使用ASAN也能出现段错误）

### getting a stack trace from a core dump is pretty approachable!

### 从一个核心转储得到一个堆栈跟踪是很approachable！

This blog post sounds like a lot and I was pretty confused when I was doing it but really there aren’t all that many steps to getting a stack trace out of a segfaulting program:

这个博客后听起来很多，但当我做这些的时候很困惑，但说真的，从一个段错误的程序中获得一个堆栈调用序列不需要那么多步骤：

1.  try valgrind

1.  试试用valgrind

if that doesn’t work, or if you want to have a core dump to investigate:

如果那没用，或者你想要拿到一个核心转储来调查：

1.  make sure the binary is compiled with debugging symbols

1.  确保二进制文件编译时带有调试符号信息；

2.  set `ulimit` and `kernel.core_pattern` correctly

2.  正确的设置 `ulimit` 和 `kernel.core_pattern`；

3.  run the program

3.  运行程序；

4.  open your core dump with `gdb`, load the symbols, and run `bt`

4.  一旦你用 `gdb` 调试核心转储了，加载符号并运行 `bt`；

5.  try to figure out what happened!!

5.  尝试找出发生了什么！

I was able using gdb to figure out that there was a C++ vtable entry that is pointing to some corrupt memory, which was somewhat helpful and helped me feel like I understood C++ a bit better. Maybe we’ll talk more about how to use gdb to figure things out another day!

我可以使用 gdb 弄清楚有一个 C++ 的 vtable 条目指向一些被破坏的内存，这有点帮助，并且使我感觉好像理解 C++ 更好一点。也许有一天我们会更多地讨论如何使用 gdb 来查找问题！

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2018/04/28/debugging-a-segfault-on-linux/

作者：[Julia Evans ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://jvns.ca/about/
[1]:http://man7.org/linux/man-pages/man5/core.5.html
