What is the Difference Between the macOS and Linux Kernels
======

macOS 和 Linux 内核有什么区别
======
Some people might think that there are similarities between the macOS and the Linux kernel because they can handle similar commands and similar software. Some people even think that Apple’s macOS is based on Linux. The truth is that both kernels have very different histories and features. Today, we will take a look at the difference between macOS and Linux kernels.

有些人可能会认为 macOS 和 Linux 内核之间存在相似之处，因为它们可以处理类似的命令和类似的软件。有些人甚至认为 Apple 的 macOS 是基于 Linux 的。事实是，两个内核有着截然不同的历史和特征。今天，我们来看看 macOS 和 Linux 的内核之间的区别。


![macOS vs Linux][1]

### History of macOS Kernel

### macOS 内核的历史

We will start with the history of the macOS kernel. In 1985, Steve Jobs left Apple due to a falling out with CEO John Sculley and the Apple board of directors. He then founded a new computer company named [NeXT][2]. Jobs wanted to get a new computer (with a new operating system) to market quickly. To save time, the NeXT team used the [Mach kernel][3] from Carnegie Mellon and parts of the BSD code base to created the [NeXTSTEP operating system][4].

我们将从 macOS 内核的历史开始。1985 年，由于与首席执行官 John Sculley 和董事会不和，Steve Jobs 离开了 Apple。然后，他成立了一家名为 [NeXT][2] 的新电脑公司。Jobs 希望将一款新计算机（同时带有新操作系统）快速推向市场。为了节省时间，NeXT 团队使用了卡耐基梅隆大学的 [Mach 内核][3] 和部分 BSD 代码库来创建 [NeXTSTEP 操作系统][4]。

NeXT never became a financial success, due in part to Jobs’ habit of spending money like he was still at Apple. Meanwhile, Apple had tried unsuccessfully on several occasions to update their operating system, even going so far as to partner with IBM. In 1997, Apple purchased NeXT for $429 million. As part of the deal, Steve Jobs returned to Apple and NeXTSTEP became the foundation of macOS and iOS.

NeXT 从来没有取得过财务上的成功，部分归因于 Jobs 花钱的习惯，他就像还在苹果公司一样。与此同时，Apple 曾多次试图更新其操作系统，甚至与 IBM 合作，但从未成功。1997年，Apple 以 4.29 亿美元收购了 NeXT。作为交易的一部分，Steve Jobs 回到了 Apple，同时 NeXTSTEP 成为了 macOS 和 iOS 的基础。


### History of Linux Kernel

### Linux 内核的历史

Unlike the macOS kernel, Linux was not created as part of a commercial endeavor. Instead, it was [created in 1991 by Finnish computer science student Linus Torvalds][5]. Originally, the kernel was written to the specifications of Linus’ computer because he wanted to take advantage of its new 80386 processor. Linus posted the code for his new kernel to [the Usenet in August of 1991][6]. Soon, he was receiving code and feature suggestions from all over the world. The following year Orest Zborowski ported the X Window System to Linux, giving it the ability to support a graphical user interface.

与 macOS 内核不同，Linux 并非源于一次商业尝试而创建。相反，它是由[芬兰计算机科学专业学生 Linus Torvalds][5] 于 1991 年创建的。最初，内核是按照 Linus 的计算机的规格编写的，因为他想利用其新的 80386 处理器（译注：Linus 认为研究 80386 处理器最好的方法就是为它开发一个新的操作系统，所以有了 Linux）。Linus [于 1991 年 8 月在 Usenet 上][6]发布了他的新内核代码。很快，他就收到了来自世界各地的代码和功能建议。次年，Orest Zborowski 将 X Window 系统移植到 Linux，使其能够支持图形用户界面。


Over the last 27 years, Linux has slowly grown and gained features. It’s no longer a student’s small-time project. Now it runs most of the [world’s][7] [computing devices][8] and the [world’s supercomputers][9]. Not too shabby.

在过去的 27 年中，Linux 已经慢慢成长并增加了不少功能。这不再是学生的小型项目。现在它运行在[世界上][7]大多数的[计算设备][8]和[超级计算机][9]上。不错！

### Features of the macOS Kernel

### macOS 内核的特性

The macOS kernel is officially known as XNU. The [acronym][10] stands for “XNU is Not Unix.” According to [Apple’s Github page][10], XNU is “a hybrid kernel combining the Mach kernel developed at Carnegie Mellon University with components from FreeBSD and C++ API for writing drivers”. The BSD subsystem part of the code is [“typically implemented as user-space servers in microkernel systems”][11]. The Mach part is responsible for low-level work, such as multitasking, protected memory, virtual memory management, kernel debugging support, and console I/O.

macOS 内核被官方称为 XNU。这个[首字母缩写词][10]代表“XNU 不是 Unix”。根据 [Apple 的 Github 页面][10]，XNU 是“将卡耐基梅隆大学开发的 Mach 内核和 FreeBSD 组件组合而成的混合内核，加上用于编写驱动程序的 C++ API”。代码的 BSD 子系统部分[“在微内核系统中通常实现为用户空间的服务”][11]。Mach 部分负责底层工作，例如多任务、内存保护、虚拟内存管理、内核调试支持和控制台 I/O。

### Features of Linux Kernel

### Linux 内核的特性

While the macOS kernel combines the feature of a microkernel ([Mach][12])) and a monolithic kernel ([BSD][13]), Linux is solely a monolithic kernel. A [monolithic kernel][14] is responsible for managing the CPU, memory, inter-process communication, device drivers, file system, and system server calls.

虽然 macOS 内核结合了微内核（[Mach][12]）和单内核（[BSD][13]）的特性，但 Linux 只是一个单内核。一个[单内核][14]负责管理 CPU、内存、进程间通信、设备驱动程序、文件系统和系统服务器调用。

### Difference between Mac and Linux kernel in one line

### 用一行总结Linux和Mac的区别

The macOS kernel (XNU) has been around longer than Linux and was based on a combination of two even older code bases. On the other hand, Linux is newer, written from scratch, and is used on many more devices.

macOS 内核（XNU）比Linux历史更悠久，并且基于两个甚至更旧代码库的组合。另一方面，Linux 新一些，是从头开始编写的，并且在更多设备上使用。

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][15].

如果您发现这篇文章很有趣，请花一点时间在社交媒体，黑客新闻或[Reddit][15]上分享。

--------------------------------------------------------------------------------

via: https://itsfoss.com/mac-linux-difference/

作者：[John Paul][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[stephenxs](https://github.com/stephenxs)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[1]:https://4bds6hergc-flywheel.netdna-ssl.com/wp-content/uploads/2018/07/macos-vs-linux-kernels.jpeg
[2]:https://en.wikipedia.org/wiki/NeXT
[3]:https://en.wikipedia.org/wiki/Mach_(kernel)
[4]:https://en.wikipedia.org/wiki/NeXTSTEP
[5]:https://www.cs.cmu.edu/%7Eawb/linux.history.html
[6]:https://groups.google.com/forum/#!original/comp.os.minix/dlNtH7RRrGA/SwRavCzVE7gJ
[7]:https://www.zdnet.com/article/sorry-windows-android-is-now-the-most-popular-end-user-operating-system/
[8]:https://www.linuxinsider.com/story/31855.html
[9]:https://itsfoss.com/linux-supercomputers-2017/
[10]:https://github.com/apple/darwin-xnu
[11]:http://osxbook.com/book/bonus/ancient/whatismacosx/arch_xnu.html
[12]:https://en.wikipedia.org/wiki/Mach_(kernel
[13]:https://en.wikipedia.org/wiki/FreeBSD
[14]:https://www.howtogeek.com/howto/31632/what-is-the-linux-kernel-and-what-does-it-do/
[15]:http://reddit.com/r/linuxusersgroup
