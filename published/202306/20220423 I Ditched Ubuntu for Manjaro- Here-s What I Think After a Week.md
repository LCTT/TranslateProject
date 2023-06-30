[#]: subject: "I Ditched Ubuntu for Manjaro: Here’s What I Think After a Week"
[#]: via: "https://news.itsfoss.com/manjaro-linux-experience/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15946-1.html"

弃 Ubuntu 转 Manjaro 一周后的使用体验
======

![][0]

通常，我用的是基于 Ubuntu 的发行版进行工作，如 Pop!_OS、Zorin OS、Linux Mint 或 Ubuntu 本身。

它们不会干扰我的工作，同时又提供了顺滑的软件更新。更不用说，它们与我使用的英特尔-英伟达系统相容性良好。

所有的一切（可能是主观的）都能开箱即用。

然而，最近我决定在实体机上切换到 Arch Linux（我大部分时间都是在虚拟机上使用它）。

结果，我最终选择使用了 **Manjaro Linux**（一款基于 Arch 的发行版）。

### 我选择 Manjaro Linux 的原因

令我惊讶的是，即使是使用 **Arch Linux 的立付 USB**，我甚至无法解决 “nouveau DRM: core notifier timeout” 错误，更别提继续安装了。是的，我知道有向导式的 Arch Linux 安装程序，但是不论怎么样，连接的显示器都会闪烁并突出显示这个错误。

解决这个问题的最好办法是不使用我的最近刚刚升级的英伟达显卡。

*很遗憾，我更喜欢英伟达的显卡……*

AMD 的 RX 6600 XT 的价格与 RTX 3060 Ti 相当；对于 1440p 来说，购买那款显卡是没有意义的。

因此，在我这个情况下，RTX 3060 Ti 可能是问题所在。

虽然我找到了一些解决问题的方法，但是我太懒了。我只是想看看能否在不用付出太多努力的情况下体验一下 Arch Linux。

**所以，我做了以下的事情：**

下一个最佳选择就是尝试任何一个专门简化了麻烦的 [最佳的基于 Arch 的发行版][2]，对吧？

这就是 **Manjaro Linux** 登场的地方。

Manjaro Linux 是一款流行的基于 Arch 的发行版，并且我注意到每次更新时都有各种改进（在虚拟机上使用时）。

此外，我喜欢 Manjaro 默认主题的强调色，很适合我的桌面体验。

所以，我决定试试看……

### Manjaro Linux: 起步有点困难

![][3]

使用专有的英伟达驱动程序安装 Manjaro 时我没有遇到任何问题。然而，最近的一个小版本更新，**Manjaro Linux 21.2.6，** 把我的系统弄乱了。

我无法访问登录界面和 [TTY][4]（我只能看到主板制造商的标志）

因此，我只能使用最新的 ISO 重新安装 Manjaro Linux，到目前为止一切都还好（千万别出问题）。

在我使用 Manjaro Linux 的过程中，我注意到了一些事情，有好有坏。

在这里，我分享一些我的经历。如果你还没有尝试过，这些经验应该对你帮助很大，可以让你更多地了解它。

#### 1、简单的安装

基于 Arch 的发行版的主要亮点是使安装过程变得简单。对我来说，完全没有遇到任何问题。

在我的第二块硬盘上安装 Manjaro Linux 是一件轻而易举的事情。引导加载程序正确配置，显示了 Manjaro 主题的启动菜单，让我可以选择 Windows/Manjaro Linux 进行双启动。

#### 2、Manjaro 欢迎页

![][5]

当尝试新东西时，欢迎体验在用户体验中占据了一大部分重要性。在这方面，Manjaro Linux 没有让人失望。

如果你仔细关注欢迎屏幕上提供的信息，你可以获得所有必要的信息。

GNOME 布局管理器能让你选择一个合适的布局，使你更加舒适。

![][6]

然而，当我尝试在这里启用“**窗口平铺**”功能时，它却无法正常工作：

![][7]

#### 3、包管理器快速且功能丰富

![][8]

考虑到 GNOME 是我最喜欢的桌面环境，我在软件中心（甚至是像 Pop!_Shop 这样特定于发行版的商店）上有过糟糕的经历。

虽然它们可以完成工作，但有时它们对我的期望反应不及预期。

在 Manjaro Linux 中，我发现安装了 [Pamac][9] 作为包管理器。这似乎是 [在 Manjaro Linux 上安装和卸载软件的最佳方式之一][10]。

根据我的经验，它在安装和卸载软件时非常快速。在安装某些软件时，你还会收到关于软件包冲突或是否需要替换/删除某些软件包的提示。当你安装某些东西时，包管理器提供了关于可选/必需依赖项的大量信息。

总体来说，体验非常流畅，没有出现任何麻烦。为了提升体验，包管理器还可以通过调整 pamac 的偏好设置，快速启用对 **Flatpaks/Snaps/AUR** 的支持。

![][11]

所以，你不必使用终端或不同的软件商店。一切都可在一个统一的平台下获得，这大大节省了时间。

#### 4、尝试 ZSH Shell

![][12]

我习惯于在基于 Ubuntu 的发行版上使用 Bash shell。然而，Manjaro Linux 默认使用 Zsh shell。我相信 Zsh 比 Bash 更好，不过我很快会在另一篇文章中介绍并深入比较。

换句话说，我可以直接尝试不同的东西。令我兴奋的是，终端提示符和遵循 Manjaro 品牌的Shell（或终端）的主题也采用了 Manjaro 的强调色，非常令人印象深刻！

![][12a]

因此，我没有必要在此处 [自定义终端的外观][13]。

要了解更多信息，你可以查看一些关于 [Zsh 是什么][14] 以及 [如何安装它][15] 的信息。

#### 5、缺乏官方软件支持

![][16]

我希望这个情况能够很快改善。但目前来说，许多软件/工具只提供对 Ubuntu 和 Fedora 的官方支持。

你可以在各种工具中找到官方的 DEB/RPM 包，但它们都不能直接在 Manjaro Linux 上使用。

你得依赖 Arch Linux 仓库或 [AUR][17] 中提供的软件包。

幸运的是，很有可能在 AUR 或社区或发行版开发者维护的仓库中找到所需的软件。就像我能够在 Manjaro Linux 上运行 [Insync][18]，并使用文件管理器的集成扩展。

然而，由于缺乏对该平台的官方支持，你可能会错过一些功能或快速更新。

当然，如果你依赖于 [Flatpak][19] 或 Snap 软件包，这对你来说应该不是个问题。此外，如果你是 Linux 的新手，你可以参考我们的 [Flatpak 指南][20] 获取更多信息。

#### 6、缺少分数缩放

我有一个由 1080p 和 1440p 分辨率组成的双显示器。因此，分数缩放很有帮助，但我可以不用它来操作。

要在 Manjaro 上启用分数缩放，你需要安装支持 X11 缩放的 Mutter 和 GNOME 控制中心软件包。这些软件包包括：

- `mutter-x11-scaling`
- `gnome-control-center-x11-scaling`

这将替换你现有的 Mutter 和 GNOME 控制中心软件包。因此，你将失去桌面的默认主题/强调色设置。

你可能需要使用 GNOME “<ruby>调整<rt>Tweaks</rt></ruby>”应用来将一切调整正确。但是，这可能会令人感觉麻烦。

### 总结

总体而言，我喜欢在 Manjaro Linux 上的桌面体验。如果那个更新没有搞坏我的系统，我认为我会继续使用 Manjaro Linux 作为我的新日常操作系统。

你认为 Manjaro Linux 的优点和缺点是什么？我在我的新体验中有遗漏了什么吗？作为一个有经验的 Arch Linux 用户，你有任何建议吗？

请在下方评论中告诉我你的想法。

*（题图：MJ/2726c4dd-5611-4ace-8c77-0db894ad6a23）*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/manjaro-linux-experience/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：ChatGPT
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/arch-new-guided-installer/
[2]: https://itsfoss.com/arch-based-linux-distros/
[3]: https://news.itsfoss.com/content/images/wordpress/2022/04/manjaro-linux-home.jpg
[4]: https://itsfoss.com/what-is-tty-in-linux/
[5]: https://news.itsfoss.com/content/images/wordpress/2022/04/manjaro-welcome.jpg
[6]: https://news.itsfoss.com/content/images/wordpress/2022/04/manjaro-desktop-layout.png
[7]: https://news.itsfoss.com/content/images/wordpress/2022/04/manjaro-settings-welcome.png
[8]: https://news.itsfoss.com/content/images/wordpress/2022/04/pamac-manjaro.png
[9]: https://wiki.manjaro.org/index.php/Pamac
[10]: https://itsfoss.com/install-remove-software-manjaro/
[11]: https://news.itsfoss.com/content/images/wordpress/2022/04/manjaro-pamac-enable-flat-snap.png
[12]: https://news.itsfoss.com/content/images/wordpress/2022/04/manjaro-terminal.png
[12a]: https://news.itsfoss.com/content/images/wordpress/2022/04/manjaro-terminal-update.png
[13]: https://itsfoss.com/customize-linux-terminal/
[14]: https://linuxhandbook.com/why-zsh/
[15]: https://linuxhandbook.com/install-zsh/
[16]: https://news.itsfoss.com/content/images/wordpress/2022/04/insync-manjaro.jpg
[17]: https://itsfoss.com/aur-arch-linux/
[18]: https://itsfoss.com/recommends/get-insync/
[19]: https://itsfoss.com/what-is-flatpak/
[20]: https://itsfoss.com/flatpak-guide/
[0]: https://img.linux.net.cn/data/attachment/album/202306/27/110506aou1bw5i6prwpm6m.jpg