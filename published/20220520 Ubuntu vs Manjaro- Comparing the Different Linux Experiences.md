[#]: subject: "Ubuntu vs Manjaro: Comparing the Different Linux Experiences"
[#]: via: "https://itsfoss.com/ubuntu-vs-manjaro/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "Return7g"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15006-1.html"

Ubuntu 和 Manjaro：比较两种不同的 Linux 发行版体验
======

![](https://img.linux.net.cn/data/attachment/album/202209/06/215515o89v2xu8v05rv759.jpg)

Ubuntu 是基于 Debian 最流行的桌面和服务器 Linux 发行版。

Manjaro 是基于 Arch 量身定制的 Linux 发行版。

两者在用户体验以及功能上都大相径庭。

然而，将 Manjaro 的 GNOME 版和 Ubuntu 放到一起比较时，其中一个共同点是 [桌面环境][1]。

但它们到底有什么不同？Manjaro 的包管理器会更好用吗？Ubuntu 和 Manjaro 上的软件生态怎么样？

接下来，我们来看看两个 Linux 发行版在某些关键问题上的差异。

### 发行周期

Ubuntu 根据你选择的版本不同提供了两个发行周期。如果你选择的是<ruby>长期支持版本<rt>Long Term Support</rt></ruby>（LTS），那么你在至少未来五年内都会收到安全维护更新。

假如你安装了 Ubuntu 22.04 ，那么你在 **2027 年 4 月** 之前都能获取更新。

![ubuntu22 04 lts about][2]

因此，我们更推荐普通桌面用户使用 LTS 版本。

如果你想要更新更好的体验，你可以选择每**九个月**更新一次的非 LTS 版本。例如 Ubuntu 21.04、 Ubuntu 21.10、Ubuntu 22.10。

需要注意的是，非 LTS 版本涉及的更改可能会影响你的工作流程以及用户体验。因此并不推荐所有人都去使用非 LTS 版本。

选择 Manjaro Linux 时你将会获得滚动发布的更新，因此你不必担心对你使用版本的支持过期。它会通过定期更新升级到最新的可用版本。

![manjaro about][3]

由于滚动发行周期的原因，你可以快速获取到最新的软件包。因此如果你想使用某个软件的历史版本，Manjaro 或许并不适合你。

### 桌面环境

Ubuntu 特别提供了一个定制版的 GNOME 桌面。它可能不是最新的，但如果你使用较新的 Ubuntu 版本，它基本上包含的就是最新的 GNOME 桌面环境。

![ubuntu 22 04 wallpaper][4]

Canonical（Ubuntu 背后的公司）并不提供其它桌面环境。

但如果你想在 Ubuntu 上使用其它桌面环境，你可以选择包含了 KDE、Budgie、LXQt、MATE 以及 XFCE 等桌面环境的 Ubuntu 官方 <ruby>[风味版][5]<rt>Flavour</rt></ruby>。与提供了其他桌面环境的非官方版或更新的<ruby>特色版<rt>Spin</rt></ruby>的 Ubuntu 相比，它们是经过良好测试且稳定的 Ubuntu Linux 发行版。

但是这些 Ubuntu 风味版没有五年的软件支持；相反，你只能受限地得到对 LTS 版本的三年支持。

如果使用 Manjaro，你可以选择官方提供的三个版本：XFCE、KDE 和 GNOME。 无论桌面环境如何，你都会使用滚动发布模式。

![manjaro gnome 42][6]

当然你也可以使用 Manjaro 的一些社区版本，如 Budgie、MATE、LXQt。

### 包管理器以及软件生态

在上述这两类发行版中，找到大多数必要的 Linux 应用是没问题的。

不过，Manjaro Linux 使用 Pamac 作为其包管理器而获得了更快速的体验。

![manjaro package manager][8]

与 Ubuntu 上的应用商店相比，Manjaro Linux 在快速安装/更新软件方面提供了更好的体验。而且，它还支持开箱即用的 Flatpak/Snap，如果你只需一键即可启用它们。

Ubuntu 比较重视 Snap 软件包，你会发现一些应用程序预装为 Snap 软件包（如 Firefox 浏览器）。

![firefox as snap][9]

对于 Manjaro Linux 来说，你可以根据自身需求决定是否启用 Flatpak/Snap。

在使用 Ubuntu 时，其应用商店提供的 Linux 应用并不是最好的。取决于你的系统配置和使用年限，它会变得越来越慢。

![ubuntu 22 04 software center][10]

除此之外，Manjaro Linux 还可以访问 [AUR][11]，它可以获得你在 Ubuntu 应用商店中可能找不到的几乎所有软件。

因此，就软件生态系统和包管理器而言，Manjaro Linux 的确要比 Ubuntu 有更多的优势。

### 易用性和目标用户

Ubuntu 桌面主要是为了易于使用而量身定制的。它专注于提供最佳的软件和硬件兼容性组合，让所有计算机用户都可以使用 Ubuntu Linux，而无需了解 Linux 世界中的大部分内容。

即使有人不知道 Linux 上的“包管理器”是什么，在他们使用它时也可以完全把它作为 Windows/macOS 的完美替代品。

当然，我们也有一个指南来帮助你 [安装最新的 Ubuntu 后要做的事情][12]。

Manjaro Linux 也是为桌面用户使用量身定制的。但是它并不适合首次使用 Linux 的用户使用。

它旨在简化 Arch Linux 的操作。因此主要面向想要使用 Arch Linux 的 Linux 用户，但是增加了一些便利性。

### 稳定性

![stability tux][13]

Ubuntu LTS 版本主要关注稳定性和可靠性，因此你也可以在服务器上部署它们。

相比之下，Manjaro Linux 可能没有提供现成的的稳定性。你在 Manjaro Linux 中安装软件包时需要更加仔细，同时密切注意你的配置，以确保更新不会破坏你的系统。

对于 Ubuntu 用户来说则无需担心软件更新，尤其是在考虑 LTS 版本时，更新通常不会破坏你的系统。

### 个性化

Ubuntu 特别提供了一个由 Canonical 为最终用户设置的定制 GNOME 桌面。虽然你可以自由定制你的 Linux 发行版的各个方面，但 Ubuntu 开箱即用提供定制很少。

Ubuntu 多年来一直在改进，最近增加了 [在 Ubuntu 22.04 LTS 中添加强调色][14] 的能力。 但是它仍然还有很长的路要走。

如果你想获得个性化的桌面体验，你只能借助 [GNOME Tweak][15] 等软件来实现。

对比 Manjaro GNOME，你也只能使用相同的工具来自定义桌面。

Manjaro 还对外观进行了一些自定义调整。但是它提供了更多组件来更改布局和其他一些选项。

![manjaro layout][16]

在个性定制方面，你在 Manjaro 和 Ubuntu 上的体验大致相同。

如果你想要更多自定义选项，Manjaro Linux 可能是一个不错的选择。但是如果你只想要个性化体验而不需要太多的改变，Ubuntu 应该就足够了。

### 臃肿的软件

这对每个人来说可能都不是什么大问题。但如果你不喜欢预装许多应用程序，那么 Ubuntu 可能会令你感到麻烦。

![ubuntu 22 apps][17]

虽然可以随时删除不需要的应用程序。但是你会发现随 Ubuntu 一起安装的软件和服务还有很多。

使用 Manjaro 时，你在安装时只需要安装最基础的内容即可。它们坚持使用最基础的实用程序，最大限度地减少预装的软件包数量。因此，Manjaro 很少会和软件臃肿联系到一起。

但是你在默认安装的 Manjaro 上可能找不到你最喜欢的 Linux 软件。因此，如果你想在安装后立即使用一些你喜欢的软件，Ubuntu 可能是一个不错的选择。

### 性能

![ubuntu 22 04 neofetch lolcat][18]

虽然 Ubuntu 改进了其系统表现，甚至可以在 2 GB 内存的树莓派上运行，但它仍然不是性能最好的 Linux 发行版。

当然，性能确实取决于你选择使用的桌面环境。

但是与 Manjaro 的 GNOME 版本相比，Manjaro 提供了更快捷的体验。

需要注意的是，性能和动画首选项的用户体验还取决于你的系统配置。例如，Manjaro 的推荐系统要求（1GB 内存和 1GHz 处理器）给了你使用旧电脑的机会。

但是，对于 Ubuntu，在撰写本文时，你至少需要 4GB 内存 和 2GHz 双核处理器，才能获得理想的桌面体验。

### 文档

考虑到 Ubuntu 的受欢迎程度，Ubuntu 更易于使用，并且对新用户来说可能更舒适。

[Ubuntu 的文档][19] 即使不是最好也足够好了。

谈到 Manjaro Linux，他们有一个 [维基][20]，其中包含基础信息和深入的指南来帮助你入门。

总的来说，[Arch Linux 的文档][21] 非常细致，几乎每个人（甚至是老手）都会参考它来寻求帮助。

Arch Linux 的文档在很大程度上也适用于 Manjaro Linux，因此在文档方面，使用 Manjaro Linux 比 Ubuntu 更有优势。

### 结束语

作为两个完全不同的 Linux 发行版，它们服务于各种类型的用户。你可以选择你感兴趣的任意一个并尝试去使用它来判断它是否适合你。

但是，如果你想避免对系统进行任何更改，并专注于你的工作，那么 Ubuntu 应该是一个明智的选择。

而如果 Ubuntu 的性能对你的体验有相当大的影响，你应该去尝试 Manjaro。 你可以阅读我的 [关于从 Ubuntu 切换到 Manjaro 的初步想法][22]。

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-vs-manjaro/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[Return7g](https://github.com/Return7g)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/what-is-desktop-environment/
[2]: https://itsfoss.com/wp-content/uploads/2022/05/ubuntu22-04-lts-about.png
[3]: https://itsfoss.com/wp-content/uploads/2022/05/manjaro-about.png
[4]: https://itsfoss.com/wp-content/uploads/2022/04/ubuntu-22-04-wallpaper.jpg
[5]: https://itsfoss.com/which-ubuntu-install/
[6]: https://itsfoss.com/wp-content/uploads/2022/05/manjaro-gnome-42.png
[7]: https://itsfoss.com/essential-linux-applications/
[8]: https://itsfoss.com/wp-content/uploads/2022/05/manjaro-package-manager.png
[9]: https://itsfoss.com/wp-content/uploads/2022/04/firefox-as-snap.jpg
[10]: https://itsfoss.com/wp-content/uploads/2022/04/ubuntu-22-04-software-center.jpg
[11]: https://itsfoss.com/aur-arch-linux/
[12]: https://itsfoss.com/things-to-do-after-installing-ubuntu-22-04/
[13]: https://itsfoss.com/wp-content/uploads/2022/05/stability-tux.png
[14]: https://itsfoss.com/accent-color-ubuntu/
[15]: https://itsfoss.com/gnome-tweak-tool/
[16]: https://itsfoss.com/wp-content/uploads/2022/05/manjaro-layout.png
[17]: https://itsfoss.com/wp-content/uploads/2022/05/ubuntu-22-apps.jpg
[18]: https://itsfoss.com/wp-content/uploads/2022/04/ubuntu-22-04-neofetch-lolcat-800x445.png
[19]: https://help.ubuntu.com/
[20]: https://wiki.manjaro.org/index.php/Main_Page
[21]: https://wiki.archlinux.org/
[22]: https://news.itsfoss.com/manjaro-linux-experience/
