Linux 与 BSD 有什么不同?
================================================================================
![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/freebsd-devil-mascot-and-ubuntu-linux.jpg)

Linux 和 BSD 都是免费的，开源的，类Unix系统。他们甚至使用很多相同的软件。他们看上去简直就像是一个操作系统，那么，它们有什么不同吗？

其实，两者之间的不同，远远超出了我们下面提到的这些，尤其是在构建完整操作系统和许可授权的哲学思想上，更是相差甚远。通过这篇短文将可以简单的了解它们之间的不同。

### 基础 ###

[许多人所称的“Linux”实际上不是 Linux][1]。Linux 从技术上说只是 Linux 内核，典型的 Linux 发行版则包括了 Linux 内核和许多软件。这是[为什么 Linux 有时被称为 GNU/Linux][2]。事实上，许多在 Linux 上使用的软件同样也在 BSD 上使用。

Linux 和 BSD 都是类 UNIX 操作系统。我们可以通过阅读[类 UNIX 操作系统历史][3]发现 Linux 和 BSD 有不同的谱系。Linux 是由 Linus Torvalds 在芬兰上大学的时候开发的。BSD 则代表“Berkeley Software Distribution，伯克利软件套件”，其源于对加州大学伯克利分校所开发的贝尔实验室UNIX的一系列修改，它最终发展成一个完整的操作系统，现在有多个不同的BSD分支。

![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/freebsd-boot-screen.png)

### 内核 vs. 完整操作系统 ###

严格的说，Linux 是只是一个内核。制作 Linux 发行版所要做的工作就是，汇集那些创建一个完整 Linux 操作系统所需的所有软件，将它组合成一个像 Ubuntu、Mint、Debian、RedHat 或者是 Arch 这样的 [Linux 发行版][4]。有许多不同的 Linux 发行版。

与此相反的是，BSD 这个名字则代表其内核和操作系统。例如，FreeBSD 提供了 FreeBSD 内核和 FreeBSD 操作系统。它是作为一个单一的项目维护的。换句话说，如果你想要安装 FreeBSD，就只有一个 FreeBSD 可供你安装。如果你想要安装 Linux，你首先需要在许多 Linux 发行版之间选择。

BSD 包括一个名为 Ports 的系统，它提供了一种安装软件包的方式。Ports 系统包含了软件包的源代码，所以您的计算机如果想安装软件的话，则需要先编译他们。（如果您曾经使用过以前流行的 Gentoo，有点类似那样。）不过，软件包也可以是预安装的二进制形式，以便你不需要花时间和系统资源编译他们就能运行。

![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/ubuntu-14.04-unity-desktop.png)

### 许可证 ###

许可证是典型的差异，虽然它不会对大多数人产生影响。Linux 使用 GNU 通用公共许可证，即 GPL。如果你修改了 Linux 内核，并将其分发，你就必须放出您的修改的源代码。

BSD 使用 BSD 许可证。如果你修改了 BSD 内核或发行版，并且发布它，你根本不需要必须发布其源代码。你可以自由地对你的 BSD 代码做任何你想做的事情，你没有义务发布的你修改的源代码，当然你想发布也行。

两者都是[开放源码][5]的，但是以不同的方式。人们有时会陷入关于哪种许可证是“更自由”的辩论。GPL 可以帮助用户以确保他们可以拥有 GPL 软件的源代码，并限制开发人员迫使他们开放代码。BSD 许可证并不能确保用户可以拥有源代码，而是给开发人员选择是否公布代码的权利，即使他们想要把它变成一个闭源项目。

### BSD分支 ###

以下是通常认可的三个“主流” BSD 操作系统：

- [FreeBSD][6]: FreeBSD 是最受欢迎的 BSD，针对高性能和易用性。它支持英特尔和 AMD 的32位和64位处理器。
- [NetBSD][7]: NetBSD 被设计运行在几乎任何架构上，支持更多的体系结构。在他们的主页上的格言是"理所当然，我们运行在 NetBSD 上"。
- [OpenBSD][8]:OpenBSD 为最大化的安全性设计的 —— 这不仅仅它宣称的功能，在实践中也确实如此。它是为银行和其他重要机构的关键系统设计的。

还有两个其他的重要 BSD 操作系统：

- [DragonFly BSD][9]: DragonFly BSD 的设计目标是提供一个运行在多线程环境中的操作系统 —— 例如，计算机集群。
- [Darwin / Mac OS X][10]: Mac OS X 实际上基于 Darwin 操作系统，而 Darwin 系统基于 BSD。它与其他的 BSD 有点不同，虽然底层内核和其他的软件是开源代码(BSD 代码)，但操作系统的大部分是闭源的 Mac OS 代码)。苹果在 BSD 基础上开发了 Mac OS X 和 iOS，这样他们就不必写操作系统底层，就像 [谷歌在 Linux 基础上开发 android 系统][11]一样。

![](http://cdn.howtogeek.com/wp-content/uploads/2014/06/mac-os-x-is-built-on-darwin-bsd.png)

### 你为什么会选择 BSD 而不是 Linux？###

Linux 显然比 FreeBSD 更受欢迎。例如，Linux 往往会比 FreeBSD 更早提供新硬件的支持。BSD 有一个兼容包可用，使之能像大多数的其他软件一样原生的执行 Linux 二进制程序。

如果您使用过 Linux， FreeBSD 不会让你感觉到太大的不同。如果把 FreeBSD 作为桌面操作系统，你也可以使用相同的 GNOME，KDE 或 Xfce [桌面环境][12]，你也可以在BSD上使用 Linux 上的大多数的其他软件。有一点需要注意，FreeBSD 不会自动安装的图形化桌面，所以你要花相对于 Linux 更多的心思来照顾你的BSD。BSD 更守旧一些。

FreeBSD 的可靠性和稳定性也许更适合作为服务器的操作系统。而厂商也会选择 BSD 而不是 Linux 作为其操作系统，因为这样他们就不必放出他们修改的代码。

如果你是一个 PC 桌面用户，你真的不需要太过在意 BSD。你可能会喜欢 Linux，因为它具有更先进的硬件支持，更容易安装，具有现代操作系统的特点。如果你关注服务器或嵌入式的设备，你可能会更喜欢 FreeBSD。

我们可能会听到一些人说他们在桌面电脑上使用 FreeBSD，你当然也可能是其中之一！但像 Ubuntu 或 Mint 一样的开源操作系统对于多数用户来说更体验良好和更先进些。

图片来源: [atzerok on Flickr][13]

--------------------------------------------------------------------------------

via: http://www.howtogeek.com/190773/htg-explains-whats-the-difference-between-linux-and-bsd/

译者：[MikeCoder](https://github.com/MikeCoder) 校对：[wxy](https://github.com/wxy)

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