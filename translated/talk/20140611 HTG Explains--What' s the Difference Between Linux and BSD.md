HTG 解释:Linux 与 BSD 有什么不同?
================================================================================
![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/freebsd-devil-mascot-and-ubuntu-linux.jpg)

Linux和BSD都是免费的，开源的，类Unix系统。他们甚至使用很多相同的软件。他们看上去简直就像是一个操作系统，那么，不同点真的不存在吗？

其实，两者之间的不同，远远超出了我们将提到的这些，尤其是在构建完整操作系统和许可授予的哲学思想上，更是相差深远。尽管这只能帮助你简单的理解他们的不同。

### 基础 ###
[许多人所称的“Linux”实际上不是Linux ] [1]。Linux从技术上说只是Linux内核，典型的Linux分支则包括了Linux内核，还有许多软件。这是[为什么Linux有时被称为GNU/Linux][2]。事实上，许多同样的软件在Linux上使用BSD相同的软件。

Linux和BSD 都是类UNIX操作系统。我们可以通过阅读[类UNIX操作系统历史][3]发现Linux和BSD有不同的谱系。Linux是由Linus Torvalds在芬兰上大学的时候开发的。BSD则代表“伯克利软件套件”。因为这是在1977至1995年间由加州大学伯克利分校开发和发布的。

![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/freebsd-boot-screen.png)

### 内核 vs. 完整操作系统 ###
Linux 是只是一个内核。[Linux 发行版][4] 所要做的工作汇集了创建一个完整的 Linux 操作系统所需的所有软件，将它组合到一个 Linux 内核上，像 Ubuntu，Mint，Debian、 Red 或者是 Arch。当然还有许多不同的 Linux 发行版。

与此相反的是，Bsd 是一个内核和操作系统。例如，FreeBSD 提供了 FreeBSD 内核和 FreeBSD 操作系统。它是作为一个单一的项目维护的。换句话说，如果你想要安装 FreeBSD，你只需安装 FreeBSD。如果你想要安装 Linux，你需要首先在许多 Linux 发行版之间选择。

BSDs include the ports system. which provides a way of installing software packages. The ports system contains software in source form, so your computer has to compile them before they’ll run. (If you ever used Gentoo when it was popular, it’s a bit like that.) However, packages can also be installed in pre-installed binary form so you don’t have to spend time and system resources compiling them.

Bsd 包括Ports体系。提供了一种安装软件包的方式。Ports体系包含以源代码形式发布软件，所以您的计算机如果想安装，则需要先编译他们。（如果您曾经使用过 Gentoo，它就是那样的。然而，包也可以是预安装的二进制形式，所以你不需要花时间和系统资源编译他们就能运行。

![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/ubuntu-14.04-unity-desktop.png)

### 授权 ###

授权是显著的差异，虽然它不会对大多数人产生影响。Linux 使用 GNU 通用公共许可证或 GPL。如果你修改 Linux 内核，并将其分发，你必须释放您的修改的源代码。

Bsd 使用 BSD 许可证。如果你修改的 BSD 内核，你不需要发布其源代码。你可以自由地编写任何你喜欢的 BSD 代码，你不是有义务发布的源代码，虽然你可以这样做如果你喜欢。

两者都是 [开放源码] [5]，但以不同的方式。人们有时会陷入关于哪种许可是"更自由"的辩论。GPL 可以帮助用户通过确保他们可以有 GPL 软件的源代码，但它通过迫使他们开放代码来限制开发人员。BSD 许可证并不能确保用户可以拥有有源代码，但它给开发人员选择是否公布代码的权利，即使他们想要把它变成一个闭源项目。

### 有关BSDs ###

这些都是通常被认为是"主要"BSD的三个操作系统：

- [FreeBSD][6]: FreeBSD 是最受欢迎的 BSD，针对高性能和易用性。它支持英特尔和 AMD 32 位和 64 位处理器。
- [NetBSD][7]: NetBSD 设计运行在几乎任何架构上，支持更多的体系结构。在他们的主页上的格言是"Of course it runs NetBSD"。
- [OpenBSD][8]:OpenBSD 为安全性设计的 —— 不仅仅因为它的功能，还包括他执行的方法。它是为银行和其他重要机构的关键系统设计的。

有两个其他的 BSD 操作系统：

- [DragonFly BSD][9]: DragonFly BSD 的设计目标是提供一个运行在多线程环境中的操作系统 —  例如，计算机集群。
- [Darwin / Mac OS X][10]: Mac OS X  实际上基于Darwin操作系统，Darwin系统基于 BSD。它与其他的 Bsd 有点不同。虽然底层内核和其他的软件是开源代码(BSD 代码)，但操作系统的大部分是闭源代码(Mac OS 代码)。苹果内置 Mac OS X 和 iOS 基于BSD，这样他们就不必写操作系统底层，就像 [谷歌 android 系统在 Linux 上] [11]

![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/mac-os-x-is-built-on-darwin-bsd.png)

### 你为什么会选择 BSD 而不是 Linux？###

Linux 仍然比 FreeBSD 更受欢迎。Linux 往往会在FreeBSD之前提供新硬件的支持，例如，BSD可以提供兼容包，使之能像大多数的其他软件一样执行Linux的二进制程序。

如果您使用过 Linux和FreeBSD，你也不会发现有所不同。安装 FreeBSD 作为桌面操作系统，你也可以使用相同的 GNOME，KDE 或 Xfce [桌面环境] [12] 你也会在BSD上使用 Linux 上的其他软件。有一点需要注意，FreeBSD 不会自动安装的图形化桌面，所以你要花相对于Linux更多的心思来照顾你的BSD。

如果你是一个桌面的 PC 用户，你真的不需要太过在意 Bsd。你可能会喜欢 Linux，因为它具有更高级的硬件支持，更容易安装，具有现代操作系统的特点。如果你聚集服务器或设计嵌入式的设备，你可能会喜欢 FreeBSD。

我们可能会听到在桌面电脑上使用FreeBSD的人发表的评论，你当然也可能是其中之一！但像Ubuntu或Mint一样的开源操作系统将会变得更加用户友好。

图片来源: [atzerok on Flickr][13]

--------------------------------------------------------------------------------

via: http://www.howtogeek.com/190773/htg-explains-whats-the-difference-between-linux-and-bsd/

译者：[MikeCoder](https://github.com/MikeCoder) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.howtogeek.com/177213/linux-isnt-just-linux-8-pieces-of-software-that-make-up-linux-systems/
[2]:http://www.howtogeek.com/139287/the-great-debate-is-it-linux-or-gnulinux/
[3]:http://www.howtogeek.com/182649/htg-explains-what-is-unix/
[4]:http://www.howtogeek.com/132624/htg-explains-whats-a-linux-distro-and-how-are-they-different/
[5]:http://www.howtogeek.com/129967/htg-explains-what-is-open-source-software-and-why-you-should-care/
[6]:http://www.freebsd.org/
[7]:http://www.netbsd.org/
[8]:http://www.openbsd.org/
[9]:http://www.dragonflybsd.org/
[10]:http://opensource.apple.com/
[11]:http://www.howtogeek.com/189036/android-is-based-on-linux-but-what-does-that-mean/
[12]:http://www.howtogeek.com/163154/linux-users-have-a-choice-8-linux-desktop-environments/
[13]:http://www.flickr.com/photos/atzerok/5378691454