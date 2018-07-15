What is the Difference Between the macOS and Linux Kernels

macOS 和 Linux 内核有什么区别
======
Some people might think that there are similarities between the macOS and the Linux kernel because they can handle similar commands and similar software. Some people even think that Apple’s macOS is based on Linux. The truth is that both kernels have very different histories and features. Today, we will take a look at the difference between macOS and Linux kernels.

有些人可能会认为 macOS 和 Linux 内核之间存在相似之处，因为它们可以处理类似的命令和类似的软件。有些人甚至认为苹果公司的 macOS 是基于 Linux 的。事实是，两个内核有着截然不同的历史和特征。今天，我们来看看 macOS 和 Linux 内核之间的区别。


![macOS vs Linux][1]

### History of macOS Kernel

### macOS 内核的历史

We will start with the history of the macOS kernel. In 1985, Steve Jobs left Apple due to a falling out with CEO John Sculley and the Apple board of directors. He then founded a new computer company named [NeXT][2]. Jobs wanted to get a new computer (with a new operating system) to market quickly. To save time, the NeXT team used the [Mach kernel][3] from Carnegie Mellon and parts of the BSD code base to created the [NeXTSTEP operating system][4].

我们将从 macOS 内核的历史开始。1985年，由于与首席执行官约翰斯卡利和苹果董事会的不合，史蒂夫乔布斯离开了苹果公司。然后，他成立了一家名为 [NeXT][2] 的新电脑公司。乔布斯希望将一款新计算机（同时带有新操作系统）快速推向市场。为了节省时间，NeXT团队使用了卡耐基梅隆大学的 [Mach 内核][3] 和部分BSD代码库来创建 [NeXTSTEP 操作系统][4]。

NeXT never became a financial success, due in part to Jobs’ habit of spending money like he was still at Apple. Meanwhile, Apple had tried unsuccessfully on several occasions to update their operating system, even going so far as to partner with IBM. In 1997, Apple purchased NeXT for $429 million. As part of the deal, Steve Jobs returned to Apple and NeXTSTEP became the foundation of macOS and iOS.

NeXT 从来没有取得过财务上的成功，部分归因于乔布斯花钱的习惯，就像他还在苹果公司一样。与此同时，Apple 曾多次试图更新其操作系统，甚至与 IBM 合作。1997年，Apple 以4.29亿美元收购了 NeXT。作为交易的一部分，史蒂夫乔布斯回到了 Apple，NeXTSTEP 成为了 macOS 和 iOS 的基础。


### History of Linux Kernel

Unlike the macOS kernel, Linux was not created as part of a commercial endeavor. Instead, it was [created in 1991 by Finnish computer science student Linus Torvalds][5]. Originally, the kernel was written to the specifications of Linus’ computer because he wanted to take advantage of its new 80386 processor. Linus posted the code for his new kernel to [the Usenet in August of 1991][6]. Soon, he was receiving code and feature suggestions from all over the world. The following year Orest Zborowski ported the X Window System to Linux, giving it the ability to support a graphical user interface.

Over the last 27 years, Linux has slowly grown and gained features. It’s no longer a student’s small-time project. Now it runs most of the [world’s][7] [computing devices][8] and the [world’s supercomputers][9]. Not too shabby.

### Features of the macOS Kernel

The macOS kernel is officially known as XNU. The [acronym][10] stands for “XNU is Not Unix.” According to [Apple’s Github page][10], XNU is “a hybrid kernel combining the Mach kernel developed at Carnegie Mellon University with components from FreeBSD and C++ API for writing drivers”. The BSD subsystem part of the code is [“typically implemented as user-space servers in microkernel systems”][11]. The Mach part is responsible for low-level work, such as multitasking, protected memory, virtual memory management, kernel debugging support, and console I/O.

### Features of Linux Kernel

While the macOS kernel combines the feature of a microkernel ([Mach][12])) and a monolithic kernel ([BSD][13]), Linux is solely a monolithic kernel. A [monolithic kernel][14] is responsible for managing the CPU, memory, inter-process communication, device drivers, file system, and system server calls.

### Difference between Mac and Linux kernel in one line

The macOS kernel (XNU) has been around longer than Linux and was based on a combination of two even older code bases. On the other hand, Linux is newer, written from scratch, and is used on many more devices.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][15].

--------------------------------------------------------------------------------

via: https://itsfoss.com/mac-linux-difference/

作者：[John Paul][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
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
