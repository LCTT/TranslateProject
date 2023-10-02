[#]: subject: "Bazzite: A Distro for Linux Gaming on Steam Deck and PCs"
[#]: via: "https://news.itsfoss.com/bazzite/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16241-1.html"

Bazzite：专为 Steam Deck 和 PC 上的 Linux 游戏打造的发行版
======

![][0]

> 为 Linux 桌面或者 Steam Deck 做好游戏准备，听起来都很刺激！

对于一个专为 Linux 游戏定制的发行版，你是否感兴趣呢？

如果答案是肯定的，那么我们为你准备了绝佳选择。

Bazzite 是一个新推出的基于 Fedora 的发行版，它是为 **Linux 桌面上的游戏**，以及越来越火热的 **[Steam Deck][1]** 定制的。

在此文章中，我们将对 Bazzite 进行简短总结，并探讨其优势。

### ⭐ Bazzite：概述

![][2]

Bazzite 基于最新发布的 [Fedora 38][3]，使用的是 [Universal Blue][4] —— Fedora 的一个 OCI 基础镜像。它提供了扩展硬件支持，如 **微软 Surface 设备**，并预先安装了关键驱动。

> 🚧 基于 Fedora 39 的构建也可供测试。你可以关注下个月末发布的稳定版。

它的一些亮点包括：

  * 预装专有的英伟达驱动
  * 支持硬件加速的 H264 解码
  * 引入了 [Waydroid][5]，允许运行安卓应用
  * 由于实现了 [xone][6]、[xpadneo][7] 和 [xpad-noone][8]，所以支持 Xbox 手柄

### 👨‍💻 初步印象

我在 [虚拟机][10] 上尝试了 Bazzite，发现其安装体验极其接近 Fedora。但在安装过后，你会发现它的独特之处。

Bazzite 默认使用的是 [KDE Plasma 5.27][11] 桌面环境，并在整个操作系统中融入了整洁的 **Steam Deck 风格**。

它还为 PC 和 Steam Deck 提供了 **独立的 ISO**，包括一个面向 **英伟达的版本**，以及一个如果你不喜欢 KDE，可以选择的 **GNOME 版本**。

在设置发行版用于游戏时，我使用了 “Bazzite Portal” 应用，它引导我走过了一些重要的配置步骤。如果你需要，此处你也可以安装 [Open Razer][12]。

![][13]

首先，它设置了 Bazzite Arch，它是一个自定义的 Arch Linux OCI，运行在 Distrobox 中，支持 [Steam][14]、[Lutris][15] 等在其内运行游戏。

![][16]

在配置了一些其他选项之后，开始了应用程序的安装，呈现了许多包含各种类别的特定用例的最热门应用。

![][17]

完成设置之后，你就拥有了一款专为游戏设计的操作系统 😲

![在 Bazzite 上运行的 Lutris 和 Steam][18]

最近，通过一个更新，Bazzite 新增了两款预装应用：

  * [Mission Control][20]（系统监视器应用）
  * [Discover Overlay][21]（一个用于 Discord overlay 的应用）

![带有系统监视器应用的 Bazzite GNOME 版本][19]

这里还有我跳过的一些其他配置选项。

Bazzite 可以利用 **Nix 包管理器**，**在启动时以大屏幕模式启动 Steam**，**提供了内存调节的选项** 等等。

这个概念听起来极具趣味性，如果你一直在寻找像 [Nobara][22] 那样，基于 Fedora 的、对游戏进行优化的发行版，你可以试试 Bazzite。

### 📥 下载 Bazzite

如果你对 Bazzite 提供的功能感兴趣，你可以在其 [GitHub 仓库][24] 中下载最新版本。

> **[Bazzite（GitHub）][24]**

想要获取更多关于 Bazzite 的信息，你也可以去查看其早期的 [博客发布][25]。

💬 请在下面的评论区分享你对该项目的看法。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/bazzite/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://store.steampowered.com/steamdeck/
[2]: https://news.itsfoss.com/content/images/2023/08/Bazzite_1.png
[3]: https://news.itsfoss.com/fedora-38-release/
[4]: https://github.com/ublue-os/main
[5]: https://waydro.id/
[6]: https://github.com/medusalix/xone
[7]: https://github.com/atar-axis/xpadneo
[8]: https://github.com/ublue-os/xpad-noone
[9]: https://news.itsfoss.com/content/images/2023/04/Follow-us-on-Google-News.png
[10]: https://itsfoss.com/virtual-machine/
[11]: https://news.itsfoss.com/kde-plasma-5-27-release/
[12]: https://github.com/openrazer/openrazer
[13]: https://news.itsfoss.com/content/images/2023/08/Bazzite_2.png
[14]: https://store.steampowered.com/
[15]: https://lutris.net/
[16]: https://news.itsfoss.com/content/images/2023/08/Bazzite_3.png
[17]: https://news.itsfoss.com/content/images/2023/08/Bazzite_6.png
[18]: https://news.itsfoss.com/content/images/2023/08/Bazzite_9.png
[19]: https://news.itsfoss.com/content/images/2023/09/bazzite-gnome-task-manager.jpg
[20]: https://gitlab.com/mission-center-devs/mission-center
[21]: https://github.com/trigg/Discover
[22]: https://nobaraproject.org/
[23]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[24]: https://github.com/ublue-os/bazzite/releases
[25]: https://universal-blue.org/blog/2023/08/20/bazzite-10/
[26]: https://news.itsfoss.com/assets/images/Certs-and-Bundles-1536x864.webp
[27]: https://itsfoss.click/latest-lf-offer
[0]: https://img.linux.net.cn/data/attachment/album/202309/30/150801h5w6wyf7s6s56ynq.jpg