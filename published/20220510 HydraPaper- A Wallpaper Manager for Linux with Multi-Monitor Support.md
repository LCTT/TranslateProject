[#]: subject: "HydraPaper: A Wallpaper Manager for Linux with Multi-Monitor Support"
[#]: via: "https://itsfoss.com/hydrapaper/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14616-1.html"

HydraPaper：一个支持多显示器的 Linux 壁纸管理器
======

> HydraPaper 是一个令人印象深刻的壁纸管理器，适用于 Linux 用户，也支持多显示器设置。让我们仔细看一下。

一般而言，你要为你的 Linux 发行版上的每个桌面环境分别设置壁纸。

而且，当试图将一个自定义的壁纸集文件夹添加到可选的壁纸范围时，往往会受到限制。此外，遇到多显示器环境时，你无法在你的发行版中为其单独选择壁纸。因此，你需要去寻找一个图形用户界面（GUI）程序来完成这些操作。

幸运的是，我偶然发现了一个让 Linux 用户印象深刻的选择，即 **HydraPaper**。

### HydraPaper：带有 CLI 接口的开源墙纸管理器

![hydrapaper wallpaper manager][1]

HydraPaper 是一个使用 Python 3 和 GTK 构建的相当有用的壁纸管理器。它可以让你为不同的显示器选择单独的墙纸。

虽然它主要是一个 GUI 程序，但你也可以使用命令行执行同样的任务。

因此，HydraPaper 是一个同时适用于 GUI 和 CLI 用户的壁纸管理器。

![hydrapaper favorites][2]

它看起来是一个直接的解决方案，有一些简单的功能。让我介绍一下如下的主要亮点。

### HydraPaper 的特点

![hydrapaper folders][3]

HydraPaper 可以让你添加自定义壁纸集，组织/选择你想要的文件夹，并方便地挑选壁纸。

一些基本的特性包括：

* 管理文件夹集合（根据需要一键切换它们）。
* 挑选喜欢的壁纸，并将它们添加到你的最爱集合。
* 按照你的喜好定位墙纸（缩放、适合黑色背景/模糊、居中等）。
* 能够从你的收藏中快速设置一个随机壁纸，如果你想这么做的话。
* 用深色模式自定义壁纸管理器的体验，选择单独保存壁纸，清除缓存，等等。
* 支持 CLI。
* 单跨壁纸模式适用于多显示器。

![single span mode][4]

使用起来相当简单。你可以为不同的显示器挑选壁纸，或者使用选项中的单跨壁纸模式，在多显示器之间应用一个壁纸。

![hydrapaper options][5]

你可以选择/添加/删除文件夹，调整位置，添加收藏夹，以及应用深色模式的墙纸。

### 在 Linux 中安装 HydraPaper

你可以在 Flathub 上找到 HydraPaper 的 [Flatpak 包][6]，它适合各种 Linux 发行版。如果你是第一次设置对 Flatpak 的支持，你可以参考我们的 [Flatpak 指南][7]。

你也可以在 Arch Linux 发行版的 AUR、Fedora 的仓库，以及 Debian（unstable）中找到它。

我在 Manjaro Linux 上测试了它，它使用 Flatpak 包工作得很好。

要探索更多的选择，你可以前往其 [GitLab 仓库][8]。

*你对 HydraPaper 有什么看法？你是否更喜欢用其他东西来管理多显示器设置上的壁纸？请在下面的评论中告诉我你的想法*。

--------------------------------------------------------------------------------

via: https://itsfoss.com/hydrapaper/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/wp-content/uploads/2022/05/hydrapaper-wallpaper-manager.jpg
[2]: https://itsfoss.com/wp-content/uploads/2022/05/hydrapaper-favorites.jpg
[3]: https://itsfoss.com/wp-content/uploads/2022/05/hydrapaper-folders.png
[4]: https://itsfoss.com/wp-content/uploads/2022/05/single-span-mode.jpg
[5]: https://itsfoss.com/wp-content/uploads/2022/05/hydrapaper-options.jpg
[6]: https://itsfoss.com/what-is-flatpak/
[7]: https://itsfoss.com/flatpak-guide/
[8]: https://gitlab.gnome.org/gabmus/hydrapaper
