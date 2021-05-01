[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13326-1.html)
[#]: subject: (11 Linux Distributions You Can Rely on for Your Ancient 32-bit Computer)
[#]: via: (https://itsfoss.com/32-bit-linux-distributions/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

14 种可以在古老的 32 位计算机上使用的 Linux 发行版
======

如果你一直关注最新的 [Linux 发行版][1]，那么你一定已经注意到，[大多数流行的 Linux 发行版][2] 已经终止了 32 位支持。Arch Linux、Ubuntu、Fedora，每一个都已经放弃了对这种较旧架构的支持。

但是，如果你拥有仍然需要再利用的老式硬件，或者想将其用于某些用途，该怎么办？不用担心，你的 32 位系统还有一些选择。

在本文中，我试图汇编一些最好的 Linux 发行版，这些发行版将在未来几年继续支持 32 位平台。

### 仍提供 32 位支持的最佳 Linux 发行版

![][3]

此列表与 [我们之前的支持旧笔记本电脑的 Linux 发行版列表][4] 略有不同。即使是 64 位计算机，如果是在 2010 年之前发布的，那么也可以认为它们是旧的。这就是为什么其中列出的一些建议包括现在仅支持 64 位版本的发行版的原因。

根据我的知识和认知，此处提供的信息是正确的，但是如果你发现有误，请在评论部分让我知道。

在继续之前，我认为你知道 [如何检查你拥有的是否是 32 位或 64 位计算机][5]。

#### 1、Debian

![图片来源: mrneilypops / Deviantart][6]

对于 32 位系统，[Debian][11] 是一个绝佳的选择，因为他们的最新的稳定版本仍然支持它。在撰写本文时，最新的稳定发行版 **Debian 10 “buster”** 提供了 32 位版本，并一直支持到 2024 年。

如果你是 Debian 的新手，值得一提的是，你可以在 [官方 Wiki][7] 上获得有关其所有内容的可靠文档。因此，上手应该不是问题。

你可以浏览 [可用的安装程序][8] 进行安装。但是，在开始之前，除了 [安装手册][10] 外，我建议你参考 [安装 Debian 之前要记住的事情][9] 列表。

最低系统要求：

- 512 MB 内存
- 10 GB 磁盘空间
- 1 GHz 处理器（奔腾 4 或同等水平）

#### 2、Slax

![][12]

如果你只是想快速启动设备以进行一些临时工作，[Slax][13] 是一个令人印象深刻的选择。

它基于 Debian，但它通过 USB 设备或 DVD 运行旨在成为一种便携且快速的选项。你可以从他们的网站免费下载 32 位 ISO 文件，或购买预装有 Slax 的可擦写 DVD 或加密的闪存盘。

当然，这并不是要取代传统的桌面操作系统。但是，是的，你确实获得了以 Debian 为基础的 32 位支持。

最低系统要求：

- 内存：128MB（离线使用）/ 512MB（用于网页浏览器使用）
- CPU: i686 或更新版本

#### 3、AntiX

![图片来源: Opensourcefeed][14]

[AntiX][15] 是另一个令人印象深刻的基于 Debian 的发行版。AntiX 是众所周知的无 systemd 发行版，该发行版侧重于性能，是一个轻量级的系统。

它完全适合于所有老式的 32 位系统。它只需要低至 256 MB 内存和 2.7 GB 存储空间。不仅易于安装，而且用户体验也是针对新手和有经验的用户的。

你应该可以得到基于 Debian 的最新稳定分支的最新版本。

最低系统要求：

- 内存：256 MB 的内存
- CPU：奔腾 3 系统
- 磁盘空间：5GB 的驱动器空间

#### 4、openSUSE

![][16]

[openSUSE][18] 是一个独立的 Linux 发行版，也支持 32 位系统。实际上最新的常规版本（Leap）不提供 32 位镜像，但滚动发行版本（Tumbleweed）确实提供了 32 位镜像。

如果你是新手，那将是完全不同的体验。但是，我建议你仔细阅读 [为什么要使用 openSUSE 的原因][17]。

它主要面向开发人员和系统管理员，但也可以将其用作普通桌面用户。值得注意的是，openSUSE 不意味在老式硬件上运行，因此必须确保至少有 2 GB 内存、40+ GB 存储空间和双核处理器。

最低系统要求：
- 奔腾 4 1.6 GHz 或更高的处理器
- 1GB 物理内存
- 5 GB 硬盘

#### 5、Emmabuntüs

![][19]

[Emmanbuntus][20] 是一个有趣的发行版，旨在通过 32 位支持来延长硬件的使用寿命，以减少原材料的浪费。作为一个团体，他们还参与向学校提供计算机和数字技术的工作。

它提供了两个不同的版本，一个基于 Ubuntu，另一个基于 Debian。如果你需要更长久的 32 位支持，则可能要使用 Debian 版本。它可能不是最好的选择，但是它具有许多预配置的软件来简化 Linux 学习体验，并提供 32 位支持，如果你希望在此过程中支持他们的事业，那么这是一个相当不错的选择。

最低系统要求：

- 512MB 内存
- 硬盘驱动器：2GB
- 奔腾处理器或同等配置

#### 6、NixOS

![Nixos KDE Edition \(图片来源: Distrowatch\)][21]

[NixOS][23] 是另一个支持 32 位系统的独立 Linux 发行版。它着重于提供一个可靠的系统，其中程序包彼此隔离。

这可能不是直接面向普通用户，但它是一个 KDE 支持的可用发行版，具有独特的软件包管理方式。你可以从其官方网站上了解有关其 [功能][22] 的更多信息。

最低系统要求：

- 内存：768 MB
- 8GB 磁盘空间
- 奔腾 4 或同等水平

#### 7、Gentoo Linux

![][24]

如果你是经验丰富的 Linux 用户，并且正在寻找 32 位 Linux 发行版，那么 [Gentoo Linux][26] 应该是一个不错的选择。

如果需要，你可以使用 Gentoo Linux 的软件包管理器轻松配置、编译和安装内核。不仅限于众所周知的可配置性，你还可以在较旧的硬件上运行而不会出现任何问题。

即使你不是经验丰富的用户，也想尝试一下，只需阅读 [安装说明][25]，就可以大胆尝试了。

最低系统要求：

- 256MB 内存
- 奔腾 4 或 AMD 的同类产品
- 2.5 GB 磁盘空间

#### 8、Devuan

![][27]

[Devuan][30] 是另一种无 systemd 的发行版。从技术上讲，它是 Debian 的一个分支，只是没有 systemd ，并鼓励 [初始化系统自由][29]。

对于普通用户来说，它可能不是一个非常流行的 Linux 发行版，但是如果你想要一个无 systemd 的发行版和 32 位支持，Devuan 应该是一个不错的选择。

最低系统要求：

- 内存：1GB
- CPU：奔腾 1.0GHz

#### 9、Void Linux

![][31]

[Void Linux][33] 是由志愿者独立开发的有趣发行版。它旨在成为一个通用的操作系统，同时提供稳定的滚动发布周期。它以 runit 作为初始化系统替代 systemd，并为你提供了多个 [桌面环境][32] 选择。

它具有非常令人印象深刻的最低需求规格，只需 96 MB 的内存配以奔腾 4 或等同的芯片。试试看吧！

最低系统要求：

- 96MB 内存
- 奔腾 4 或相当的 AMD 处理器

#### 10、Q4OS

![][34]

[Q4OS][37] 是另一个基于 Debian 的发行版，致力于提供极简和快速的桌面用户体验。它也恰好是我们的 [最佳轻量级 Linux 发行版][4] 列表中的一个。它的 32 位版本具有 [Trinity 桌面][35]，你可以在 64 位版本上找到 KDE Plasma 支持。

与 Void Linux 类似，Q4OS 可以运行在至低 128 MB 的内存和 300 MHz 的 CPU 上，需要 3 GB 的存储空间。对于任何老式硬件来说，它应该绰绰有余。因此，我想说，你绝对应该尝试一下！

要了解更多信息，你还可以查看 [我们对 Q4OS 的点评][36]。

Q4OS 的最低要求：

- 内存：128MB（Trinity 桌面）/ 1GB（Plasma 桌面）
- CPU：300 MHz（Trinity 桌面）/ 1 GHz（Plasma 桌面）
- 存储空间：5GB（Trinity 桌面）/3GB（Plasma 桌面）

#### 11、MX Linux

![][38]

如果有一个稍微不错的配置（不完全是老式的，而是旧的），对于 32 位系统，我个人推荐 [MX Linux][39]。它也恰好是适合各种类型用户的 [最佳 Linux 发行版][2] 之一。

通常，MX Linux 是基于 Debian 的出色的轻量级和可定制的发行版。你可以选择 KDE、XFce 或 Fluxbox（这是他们自己为旧硬件设计的桌面环境）。你可以在他们的官方网站上找到更多关于它的信息，并尝试一下。

最低系统要求：

- 1GB 内存（建议使用 2GB，以便舒适地使用）
- 15GB 的磁盘空间（建议 20GB）


#### 12、Linux Mint Debian Edtion

![][44]

[基于 Debian 的 Linux Mint][45]？为什么不可以呢？

你可以得到同样的 Cinnamon 桌面体验，只是不基于 Ubuntu。它和基于 Ubuntu 的 Linux Mint 一样容易使用，一样可靠。

不仅仅是基于 Debian，你还可以得到对 64 位和 32 位系统的支持。如果你不想在 32 位系统上使用一个你从未听说过的 Linux 发行版，这应该是一个不错的选择。

最低系统要求：

- 1GB 内存（建议使用 2GB，以便舒适地使用）
- 15GB 的磁盘空间（建议 20GB）

#### 13、Sparky Linux

![][46]

[Sparky Linux][47] 是 [为初学者定制的最好的轻量级 Linux 发行版][4] 之一。它很容易定制，而且资源占用很少。

它可以根据你的要求提供不同的版本，但它确实支持 32 位版本。考虑到你想为你的旧电脑买点东西，我建议你看看它的 MinimalGUI 版本，除非你真的需要像 Xfce 或 LXQt 这样成熟的桌面环境。

最低系统要求：

- 内存：512 MB
- CPU：奔腾 4，或 AMD Athlon
- 磁盘空间：2GB（命令行版），10GB（家庭版），20GB（游戏版）

#### 14、Mageia

![][48]

作为 [Mandriva Linux][49] 的分支，[Mageia Linux][50] 是一个由社区推动的 Linux 发行版，支持 32 位系统。

通常情况下，你会注意到每年都有一个重大版本。他们的目的是贡献他们的工作，以提供一个自由的操作系统，这也是潜在的安全。对于 32 位系统来说，它可能不是一个流行的选择，但它支持很多桌面环境（如 KDE Plasma、GNOME），如果你需要，你只需要从它的软件库中安装它。

你应该可以从他们的官方网站上得到下载桌面环境特定镜像的选项。

最低系统要求：

- 512MB 内存（推荐 2GB）
- 最小安装需 5GB 存储空间（常规安装 20GB）
- CPU：奔腾4，或 AMD Athlon

### 荣誉提名：Funtoo & Puppy Linux

[Funtoo][40] 是基于 Gentoo 的由社区开发的 Linux 发行版。它着重于为你提供 Gentoo Linux 的最佳性能以及一些额外的软件包，以使用户获得完整的体验。有趣的是，该开发实际上是由 Gentoo Linux 的创建者 Daniel Robbins 领导的。

[Puppy Linux][51] 是一个很小的 Linux 发行版，除了基本的工具，几乎没有捆绑的软件应用。如果其他选择都不行，而你又想要最轻量级的发行版，Puppy Linux 可能是一个选择。

当然，如果你不熟悉 Linux，这两个可能都不能提供最好的体验。但是，它们确实支持 32 位系统，并且可以在许多较旧的 Intel/AMD 芯片组上很好地工作。可以在它们的官方网站上探索更多的信息。

### 总结

我将列表重点放在基于 Debian 的发行版和一些独立发行版上。但是，如果你不介意长期支持条款，而只想获得一个支持 32 位的镜像，也可以尝试使用任何基于 Ubuntu 18.04 的发行版（或任何官方版本）。

在撰写本文时，它们只剩下几个月的软件支持。因此，我避免将其作为主要选项提及。但是，如果你喜欢基于 Ubuntu 18.04 的发行版或其它任何版本，可以选择 [LXLE][41]、[Linux Lite][42]、[Zorin Lite 15][43] 及其他官方版本。

即使大多数基于 Ubuntu 的现代桌面操作系统都放弃了对 32 位的支持。你仍然有很多选项可以选择。

在 32 位系统中更喜欢哪一个？在下面的评论中让我知道你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/32-bit-linux-distributions/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/what-is-linux-distribution/
[2]: https://itsfoss.com/best-linux-distributions/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/32-bit-linux.png?resize=800%2C450&ssl=1
[4]: https://itsfoss.com/lightweight-linux-beginners/
[5]: https://itsfoss.com/32-bit-64-bit-ubuntu/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/08/debian-screenshot.png?resize=800%2C450&ssl=1
[7]: https://wiki.debian.org/FrontPage
[8]: https://www.debian.org/releases/buster/debian-installer/
[9]: https://itsfoss.com/before-installing-debian/
[10]: https://www.debian.org/releases/buster/installmanual
[11]: https://www.debian.org/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/slax-screenshot.jpg?resize=800%2C600&ssl=1
[13]: https://www.slax.org
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/antiX-19-1.jpg?resize=800%2C500&ssl=1
[15]: https://antixlinux.com
[16]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/01/opensuse-15-1.png?resize=800%2C500&ssl=1
[17]: https://itsfoss.com/why-use-opensuse/
[18]: https://www.opensuse.org/
[19]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/Emmabuntus-xfce.png?resize=800%2C500&ssl=1
[20]: https://emmabuntus.org/
[21]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/nixos-kde.jpg?resize=800%2C500&ssl=1
[22]: https://nixos.org/features.html
[23]: https://nixos.org/
[24]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/gentoo-linux.png?resize=800%2C450&ssl=1
[25]: https://www.gentoo.org/get-started/
[26]: https://www.gentoo.org
[27]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/devuan-beowulf.jpg?resize=800%2C600&ssl=1
[28]: https://itsfoss.com/devuan-3-release/
[29]: https://www.devuan.org/os/init-freedom
[30]: https://www.devuan.org
[31]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/void-linux.jpg?resize=800%2C450&ssl=1
[32]: https://itsfoss.com/best-linux-desktop-environments/
[33]: https://voidlinux.org/
[34]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/q4os8Debonaire.jpg?resize=800%2C500&ssl=1
[35]: https://en.wikipedia.org/wiki/Trinity_Desktop_Environment
[36]: https://itsfoss.com/q4os-linux-review/
[37]: https://q4os.org/index.html
[38]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/08/mx-linux-19-2-kde.jpg?resize=800%2C452&ssl=1
[39]: https://mxlinux.org/
[40]: https://www.funtoo.org/Welcome
[41]: https://www.lxle.net/
[42]: https://www.linuxliteos.com
[43]: https://zorinos.com/download/15/lite/32/
[44]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/cinnamon-debian-edition.jpg?w=800&ssl=1
[45]: https://www.linuxmint.com/download_lmde.php
[46]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/sparky-linux.jpg?w=800&ssl=1
[47]: https://sparkylinux.org/download/stable/
[48]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/mageia.jpg?w=800&ssl=1
[49]: https://en.wikipedia.org/wiki/Mandriva_Linux
[50]: https://www.mageia.org/en/
[51]: http://puppylinux.com/