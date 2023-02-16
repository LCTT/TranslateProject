[#]: subject: "[Exclusive] Tuxedo Makes Ubuntu-based 'TUXEDO OS' Available For All"
[#]: via: "https://news.itsfoss.com/tuxedo-os/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "Cubik65536"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15110-1.html"

Tuxedo 已对所有用户开放基于 Ubuntu 的 TUXEDO OS
======

> TUXEDO OS 是一个基于 Ubuntu 的 Linux 发行版，旨在将 TUXEDO 在 Linux 方面的专业知识也带给非 TUXEDO 用户。

![[独家] Tuxedo 已对所有用户开放基于 Ubuntu 的 'TUXEDO OS'][1]

又一个基于 Ubuntu 的 Linux 发行版？😕

不完全是！**TUXEDO 计算机公司** 是一家硬件制造商，以其专注于 Linux 的笔记本电脑和计算机而闻名。

**TUXEDO OS 与 Ubuntu 之间存在着一些有趣的差异**。

虽然他们已经在笔记本电脑/计算机上提供预装 TUXEDO OS 的选项，但是它并未对所有人开放。

终于，他们决定将其发行版的第一个版本作为 **TUXEDO OS 1** 开放，该版本现已可供下载。

这也意味着你可以在自己的非 TUXEDO 系统上试用它。

所以这个思路很像 System76 的 Pop!_OS，所以这并不算一件坏事 👌

### 搭配 KDE 的 TUXEDO OS 1

![tuxedo 桌面][2]

TUXEDO OS 1 是基于 [Ubuntu 22.04 LTS][3] 的; 所以它应该可以直接在大多数设备上运行。

与 System76 的 Pop!_OS 不同，TUXEDO OS 搭载了 [KDE Plasma 5.24.6][4]。因此，它应当提供了一个 Windows 用户也较为熟悉的用户界面。

但是，TUXEDO OS 还包括一些额外的功能，例如 TUXEDO 控制中心，用于微调你的硬件（CPU/风扇等），以及 TUXEDO Tomte，一个用于解决驱动程序/缺少包问题的配置服务，但是它或许能，或许不能在其他硬件配置上工作。

说到这里，让我们看看 TUXEDO OS 及其提供的功能。

### TUXEDO OS，基于 KDE 的定制化 Ubuntu 体验

用户体验正如预期一样，与任何基于 KDE 的 Ubuntu 发行版相同。

> 📣 我将 TUXEDO OS（预览版）用做我的主要系统来体验它。

你会在应用和菜单上发现带有红色调的 TUXEDO 徽标。它还具有令人耳目一新的壁纸。

![tuxedo 菜单][5]

除了定制化的 KDE Plasma 主题，还有一些其他的变化，例如：

* 它使用了 PipeWire 作为声音服务器，而不是 PulseAudio。
* GRUB 中启用了 os-prober 功能，让用户可以方便地检测已安装的其他操作系统。
* .deb 作为首选的软件包格式，而 Snap 默认情况下被禁用。
* 从 NetworkManagerConnectivity 检查中移除了 Canonical 的链接。

#### 软件可用性？

你可以通过 “<ruby>发现<rt>Discover</rt></ruby>” 应用来找到所有流行的软件工具，其中包括 Ubuntu 的仓库和 TUXEDO 的仓库。

它包含了 **Firefox、Thunderbird、LibreOffice、VLC、Lutris 和 Heroic Games Launcher** 等必备应用程序。所以我认为你不会觉得它们很臃肿。

![tuxedo discover 应用][10]

我还注意到它默认启用了 Flatpak 集成。

你可以在他们的 [官方网页][11] 上了解有关可用软件的更多信息。

#### 这也给我们带来了一个重要的亮点

❌ TUXEDO OS 不会默认安装 Snap。对于 Firefox，它会像 Linux Mint 一样附带 deb 包安装。

✅ 值得注意的是，TUXEDO OS 22.04 LTS 附带了 Nvidia 驱动程序。

因此，我可以毫不费力地将它安装在带有 RTX 3060 Ti 显卡的系统上。

### TUXEDO 附加功能

如上所述，TUXEDO OS 附带了一些专为增强 Tuxedo 硬件的体验而量身定制的附加功能。

控制中心是监控你的系统、选择电源配置文件、控制外部水冷（[TUXEDO Aquaris][12]）等的绝佳工具。

![tuxedo 控制中心][13]

虽然控制中心不是为非 TUXEDO 设备量身定制的，但它在大多数情况下仍然能够正常工作。

还有一个 TUXEDO WebFAI Creator 程序（定制的 BalenaEtcher）来烧录用于操作系统安装的 U 盘。

![tuxedo webfai][14]

还有，不要忘记 TUXEDO Tomte，它无法在我的系统上运行，但可以很完美的在 TUXEDO 设备上作为配置服务运行：

![][15]

### 下载 TUXEDO OS 1

TUXEDO OS 带来了非常精致的体验。TUXEDO 背后的团队在让 Linux 运行在他们的一些最新笔记本电脑上拥有丰富的经验。因此，使用他们的 Linux 发行版，你可以对自己的体验充满信心。

如果你有兴趣，还可以找到关于 [TUXEDO OS 入门][16] 的官方文章。

**如果你希望获得一个基于 KDE 的定制化 Ubuntu 体验，TUXEDO OS 1 是一个不错的选择。**

你可以通过使用它来支持他们的计划，这可能会让你决定购买一台 TUXEDO 设备；你永远不知道以后会发生什么，对吧？

你可以从其官方网站下载它，并在下方的评论区中分享你的想法。

> **[下载 TUXEDO OS 1][17]**

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/tuxedo-os/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[Cubik65536](https://github.com/Cubik65536)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/content/images/size/w1200/2022/09/tuxedo-os-1.png
[2]: https://news.itsfoss.com/content/images/2022/09/tuxedo-home.jpg
[3]: https://news.itsfoss.com/ubuntu-22-04-release/
[4]: https://news.itsfoss.com/kde-plasma-5-24-lts-release/
[5]: https://news.itsfoss.com/content/images/2022/09/tuxedo-menu.png
[6]: https://itsfoss.com/properly-theme-kde-plasma/
[7]: https://itsfoss.com/properly-theme-kde-plasma/
[8]: https://itsfoss.com/get-linux-laptops/
[9]: https://itsfoss.com/get-linux-laptops/
[10]: https://news.itsfoss.com/content/images/2022/09/tuxedo-os-repositories.png
[11]: https://www.tuxedocomputers.com/en/Featured-KDEs-outstanding-applications-and-tools.tuxedo
[12]: https://www.tuxedocomputers.com/en/TUXEDO-Aquaris.tuxedo
[13]: https://news.itsfoss.com/content/images/2022/09/tuxedo-os-control-center.png
[14]: https://news.itsfoss.com/content/images/2022/09/tuxedo-webfai.jpg
[15]: https://news.itsfoss.com/content/images/2022/09/tuxedo-tomte.jpg
[16]: https://www.tuxedocomputers.com/en/First-Steps-with-TUXEDO-OS.tuxedo
[17]: https://www.tuxedocomputers.com/os
[18]: https://www.humblebundle.com/books/linux-no-starch-press-books?partner=itsfoss
