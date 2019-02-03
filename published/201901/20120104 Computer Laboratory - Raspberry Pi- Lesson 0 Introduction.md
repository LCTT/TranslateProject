[#]: collector: (lujun9972)
[#]: translator: (qhwdw)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10429-1.html)
[#]: subject: (Computer Laboratory – Raspberry Pi: Lesson 0 Introduction)
[#]: via: (https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/introduction.html)
[#]: author: (Robert Mullins http://www.cl.cam.ac.uk/~rdm34)

计算机实验室之树莓派：课程 0 简介
======

这个课程简介不包含实践内容，但它解释了一个操作系统的基本概念、汇编代码、和其它很重要的一些基本原理。如果你想直接进入实践环节，跳过本课程并不会有什么问题。

### 1、操作系统

操作系统就是一个非常复杂的程序。它的任务就是组织安排计算机上的其它程序，包括共享计算机的时间、内存、硬件和其它资源。你可能听说过的一些比较大的桌面操作系统家族有 GNU/Linux、Mac OS X 和 Microsoft Windows。其它的设备比如电话，也需要操作系统，它可能使用的操作系统是 Android、iOS 和 Windows Phone。 [^1]

由于操作系统是用来与计算机系统上的硬件进行交互的，所以它必须了解系统上硬件专有的信息。为了能让操作系统适用于各种类型的计算机，发明了 **驱动程序** 的概念。驱动程序是为了能够让操作系统与特定的硬件进行交互而添加（并可删除）到操作系统上的一小部分代码。在本课程中，我们并不涉及如何创建可删除的驱动程序，而是专注于特定的一个硬件：树莓派。

操作系统有各种不同的设计方式，在本课程中，我们只触及操作系统设计的皮毛。本课程中，我们主要专注于操作系统与各种硬件的交互部分，因为这经常是比较棘手的部分，并且也是在网络上文档和帮助最少的部分。

### 2、汇编代码

> 处理器每秒可以执行上百万的指令，但是这些指令必须要简单。

本课程几乎要完全靠汇编代码来写。汇编代码非常接近计算机的底层。计算机其实是靠一个叫处理器的设备来工作的，处理器能够执行像加法这样的简单任务，还有一组叫做 RAM 的芯片，它能够用来保存数字。当计算机通电后，处理器执行程序员给定的一系列指令，这将导致内存中的数字发生变化，以及与连接的硬件进行交互。汇编代码只是将这些机器命令转换为人类可读的文本。

常规的编程就是，程序员使用编程语言，比如 C++、Java、C#、Basic 等等来写代码，然后一个叫编译器的程序将程序员写的代码转换成汇编代码，然后进一步转换为二进制代码。[^2] 二进制代码才是计算机真正能够理解的东西，但它是人类无法读取的东西。汇编代码比二进制代码好一点，至少它的命令是人类可读的，但它仍然让人很沮丧。请记住，你用汇编代码写的每个命令都是处理器可以直接认识的，因此这些命令设计的很简单，因为物理电路必须能够处理每个命令。

![Compiler process][1]

和普通编程一样，也有很多不同的汇编代码编程语言，但与普通编程不一样的是，每个汇编编程语言是面对不同的处理器的，每种处理器设计为去理解不同的语言。因此，用一个针对某种机器设计的汇编语言所写的汇编代码，是不能在其它种类的机器上运行的。很多情况下，这都是一个大灾难，因此每个程序都必须在使用它的不同种类的机器上重写一遍，但对于操作系统，这不是个问题，因为在不同的硬件上它必须得重写。尽管如此，大多数操作系统都是用 C++ 或 C 来写的，这样它们就可以很容易地在不同种类的硬件上使用，只需要重写那些必须用汇编代码来实现的部分即可。

现在，你已经准备好进入第一节课了，它是 [课程 1 OK01][2]

[^1]: 要查看更完整的操作系统列表，请参照：[操作系统列表 - Wikipedia](http://en.wikipedia.org/wiki/List_of_operating_systems)
[^2]: 当然，我简化了普通编程的这种解释，实际上它在很大程度上取决于语言和机器。感兴趣的话，参见 [编译器 -  Wikipedia](http://en.wikipedia.org/wiki/Compiler)

--------------------------------------------------------------------------------

via: https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/introduction.html

作者：[Robert Mullins][a]
选题：[lujun9972][b]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.cl.cam.ac.uk/~rdm34
[b]: https://github.com/lujun9972
[1]: https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/images/compiling.png
[2]: https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/ok01.html
