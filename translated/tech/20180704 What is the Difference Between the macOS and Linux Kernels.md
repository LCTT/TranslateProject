macOS 和 Linux 的内核有什么区别
======

有些人可能会认为 macOS 和 Linux 内核之间存在相似之处，因为它们可以处理类似的命令和类似的软件。有些人甚至认为苹果公司的 macOS 是基于 Linux 的。事实上是，两个内核有着截然不同的历史和特征。今天，我们来看看 macOS 和 Linux 的内核之间的区别。

![macOS vs Linux][1]

### macOS 内核的历史

我们将从 macOS 内核的历史开始。1985 年，由于与首席执行官 John Sculley 和董事会不和，<ruby>史蒂夫·乔布斯<rt>Steve Jobs</rt></ruby>离开了苹果公司。然后，他成立了一家名为 [NeXT][2] 的新电脑公司。乔布斯希望将一款（带有新操作系统的）新计算机快速推向市场。为了节省时间，NeXT 团队使用了卡耐基梅隆大学的 [Mach 内核][3] 和部分 BSD 代码库来创建 [NeXTSTEP 操作系统][4]。

NeXT 从来没有取得过财务上的成功，部分归因于乔布斯花钱的习惯，就像他还在苹果公司一样。与此同时，苹果公司曾多次试图更新其操作系统，甚至与 IBM 合作，但从未成功。1997年，苹果公司以 4.29 亿美元收购了 NeXT。作为交易的一部分，史蒂夫·乔布斯回到了苹果公司，同时 NeXTSTEP 成为了 macOS 和 iOS 的基础。

### Linux 内核的历史

与 macOS 内核不同，Linux 的创建并非源于商业尝试。相反，它是由[芬兰计算机科学专业学生<ruby>林纳斯·托瓦兹<rt>Linus Torvalds</rt></ruby>于 1991 年创建的][5]。最初，内核是按照林纳斯自己的计算机的规格编写的，因为他想利用其新的 80386 处理器（的特性）。林纳斯[于 1991 年 8 月在 Usenet 上][6]发布了他的新内核代码。很快，他就收到了来自世界各地的代码和功能建议。次年，Orest Zborowski 将 X Window 系统移植到 Linux，使其能够支持图形用户界面。

在过去的 27 年中，Linux 已经慢慢成长并增加了不少功能。这不再是一个学生的小型项目。现在它运行在[世界上][7]大多数的[计算设备][8]和[超级计算机][9]上。不错！

### macOS 内核的特性

macOS 内核被官方称为 XNU。这个[首字母缩写词][10]代表“XNU is Not Unix”。根据 [苹果公司的 Github 页面][10]，XNU 是“将卡耐基梅隆大学开发的 Mach 内核和 FreeBSD 组件整合而成的混合内核，加上用于编写驱动程序的 C++ API”。代码的 BSD 子系统部分[“在微内核系统中通常实现为用户空间的服务”][11]。Mach 部分负责底层工作，例如多任务、内存保护、虚拟内存管理、内核调试支持和控制台 I/O。

### Linux 内核的特性

虽然 macOS 内核结合了微内核（[Mach][12]）和宏内核（[BSD][13]）的特性，但 Linux 只是一个宏内核。[宏内核][14]负责管理 CPU、内存、进程间通信、设备驱动程序、文件系统和系统服务调用（ LCTT 译注：原文为 system server calls，但结合 Linux 内核的构成，译者认为这里翻译成系统服务调用更合适，即 system service calls）。

### 用一句话总结 Linux 和 Mac 的区别

macOS 内核（XNU）比 Linux 历史更悠久，并且基于两个更古老一些的代码库的结合；另一方面，Linux 新一些，是从头开始编写的，并且在更多设备上使用。

如果您发现这篇文章很有趣，请花一点时间在社交媒体，黑客新闻或 [Reddit][15] 上分享。

--------------------------------------------------------------------------------

via: https://itsfoss.com/mac-linux-difference/

作者：[John Paul][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[stephenxs](https://github.com/stephenxs)
校对：[wxy](https://github.com/wxy)

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
