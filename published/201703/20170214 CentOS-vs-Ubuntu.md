CentOS 与 Ubuntu 有什么不同？
============

[![centos vs. ubuntu](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/centos-vs-ubuntu_orig.jpg) 
][4]

Linux 中的可选项似乎“无穷无尽”，因为每个人都可以通过修改一个已经发行的版本或者新的[白手起家的版本][7] (LFS) 来构建 Linux。

关于 Linux 发行版的选择，我们关注的因素包括用户界面、文件系统、软件包分发、新的特性以及更新周期和可维护性等。

在这篇文章中，我们会讲到两个较为熟知的 Linux 发行版，实际上，更多的是介绍两者之间的不同，以及在哪些方面一方比另一方更好。

### 什么是 CentOS？

CentOS（Community Enterprise Operating System）是脱胎于 Red Hat Enterprise Linux  (RHEL) 并与之兼容的由社区支持的克隆版 Linux 发行版，所以我们可以认为 CentOS 是 RHEL 的一个免费版。CentOS 的每一套发行版都有 10 年的维护期，每个新版本的释出周期为 2 年。在 2014 年 1 月 8 日，[CentOS 声明正式加入红帽](https://linux.cn/article-2453-1.html)，为新的 CentOS 董事会所管理，但仍然保持与 RHEL 的独立性。

扩展阅读：[如何安装 CentOS?][1]

#### CentOS 的历史和第一次释出

[CentOS][8] 第一次释出是在 2004 年，当时名叫 cAOs Linux；它是由社区维护和管理的一套基于 RPM 的发行版。

CentOS 结合了包括 Debian、Red Hat Linux/Fedora 和 FreeBSD 等在内的许多方面，使其能够令服务器和集群稳定工作 3 到 5 年的时间。它有一群开源软件开发者作为拥趸，是一个大型组织（CAOS 基金会）的一部分。

在 2006 年 6 月，David Parsley 宣布由他开发的 TAO Linux（另一个 RHEL 克隆版本）退出历史舞台并全力转入 CentOS 的开发工作。不过，他的领域转移并不会影响之前的 TAO 用户， 因为他们可以通过使用 `yum update` 来更新系统以迁移到 CentOS。

2014 年 1 月，红帽开始赞助 CentOS 项目，并移交了所有权和商标。

#### CentOS 设计

确切地说，CentOS 是付费 RHEL (Red Had Enterprise Edition) 版本的克隆。RHEL 提供源码以供之后 CentOS 修改和变更（移除商标和 logo）并完善为最终的成品。

### Ubuntu

Ubuntu 是一个基于 Debian 的 Linux 操作系统，应用于桌面、服务器、智能手机和平板电脑等多个领域。Ubuntu 是由一个英国的名为 Canonical Ltd. 的公司发行的，由南非的  Mark Shuttleworth 创立并赞助。

扩展阅读：[安装完 Ubuntu 16.10 必须做的 10 件事][2]

#### Ubuntu 的设计

Ubuntu 是一个在全世界的开发者共同努力下生成的开源发行版。在这些年的悉心经营下，Ubuntu 的界面变得越来越现代化和人性化，整个系统运行也更加流畅、安全，并且有成千上万的应用可供下载。

由于它是基于 [Debian][10] 的，因此它也支持 .deb 包、较新的包系统和更为安全的 [snap 包格式 (snappy)][11]。

这种新的打包系统允许分发的应用自带满足所需的依赖性。

扩展阅读：[点评 Ubuntu 16.10 中的 Unity 8][3]

### CentOS 与 Ubuntu 的区别

* Ubuntu 基于 Debian，CentOS 基于 RHEL；
* Ubuntu 使用 .deb 和 .snap 的软件包，CentOS 使用 .rpm 和 flatpak 软件包；
* Ubuntu 使用 apt 来更新，CentOS 使用 yum；
* CentOS 看起来会更稳定，因为它不会像 Ubuntu 那样对包做常规性更新，但这并不意味着 Ubuntu 就不比 CentOS 安全；
* Ubuntu 有更多的文档和免费的问题、信息支持；
* Ubuntu 服务器版本在云服务和容器部署上的支持更多。

### 结论

不论你的选择如何，**是 Ubuntu 还是 CentOS**，两者都是非常优秀稳定的发行版。如果你想要一个发布周期更短的版本，那么就选 Ubuntu；如果你想要一个不经常变更包的版本，那么就选 CentOS。在下方留下的评论，说出你更钟爱哪一个吧！

--------------------------------------------------------------------------------

via: http://www.linuxandubuntu.com/home/centos-vs-ubuntu

作者：[linuxandubuntu.com][a]
译者：[Meditator-hkx](http://www.kaixinhuang.com)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxandubuntu.com/home/centos-vs-ubuntu
[1]:http://www.linuxandubuntu.com/home/how-to-install-centos
[2]:http://www.linuxandubuntu.com/home/10-things-to-do-after-installing-ubuntu-16-04-xenial-xerus
[3]:http://www.linuxandubuntu.com/home/linuxandubuntu-review-of-unity-8-preview-in-ubuntu-1610
[4]:http://www.linuxandubuntu.com/home/centos-vs-ubuntu
[5]:http://www.linuxandubuntu.com/home/centos-vs-ubuntu
[6]:http://www.linuxandubuntu.com/home/centos-vs-ubuntu#comments
[7]:http://www.linuxandubuntu.com/home/how-to-create-a-linux-distro
[8]:http://www.linuxandubuntu.com/home/10-things-to-do-after-installing-centos
[9]:https:]:http://www.linuxandubuntu.com/home/linuxandubuntu-review-of-unity-8-preview-in-ubuntu-1610
[10]:https://www.debian.org/
[11]:https://en.wikipedia.org/wiki/Snappy_(package_manager)
