[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11728-1.html)
[#]: subject: (Customize your Linux desktop with KDE Plasma)
[#]: via: (https://opensource.com/article/19/12/linux-kde-plasma)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

使用 KDE Plasma 定制 Linux 桌面
======

> 本文是 24 天 Linux 桌面特别系列的一部分。如果你认为没有太多自定义桌面的需要，KDE Plasma 可能适合你。

![5 pengiuns floating on iceburg][1]

KDE 社区的 Plasma 桌面是开源桌面环境中的巅峰之作。KDE 很早就进入了 Linux 桌面环境市场，但是由于它的基础 Qt 工具包当时没有完全开放的许可证，因此才有 [GNOME][2] 桌面。在此之后，Qt 开源了，并且 KDE（及其衍生产品，例如 [Trinity 桌面][3]）开始蓬勃发展。

你可能会在发行版的软件仓库中找到 KDE 桌面，或者可以下载并安装将 KDE 作为默认桌面的发行版。在安装之前，请注意，KDE 提供了完整、集成且强大的桌面体验，因此会同时安装几个 KDE 应用。如果你已经在运行其他桌面，那么将发现有几个冗余的应用（两个 PDF 阅读器、多个媒体播放器、两个或多个文件管理器，等等）。如果你只想尝试而不是一直使用 KDE 桌面，那么可以在虚拟机，如 [GNOME Boxes][4] 中安装基于 KDE 的发行版，也可以尝试使用可引导的操作系统，例如 [Porteus][5]。

### KDE 桌面之旅

乍一看，[KDE Plasma][6] 桌面相对无聊，但让人感到舒适。它有行业标准的布局：左下角弹出应用菜单，中间是任务栏，右边是系统托盘。这正是你对标准家用或商用计算机的期望。

![KDE Plasma desktop][7]

但是，使 KDE 与众不同的是，你几乎可以更改任何想要的东西。Qt 工具包可以以令人惊讶的方式分割和重新排列，这意味着你实质上可以使用 KDE 的部件作为基础来设计自己的桌面。桌面行为的可用设置也很多。KDE 可以充当标准桌面、平铺窗口管理器以及两者之间的任意形式。你可以通过窗口类、角色、类型、标题或它们的任意组合来创建自己的窗口规则，因此，如果希望特定应用的行为不同于其他行为，那么可以创建全局设置的例外。

此外，它还有丰富的小部件集合，使你可以自定义与桌面交互的方式。它有一个类似 GNOME 的全屏应用启动器，一个类似 Unity 的 dock 启动器和仅有图标的任务栏，以及一个传统的任务栏。你可以在屏幕的任何边缘上创建和放置面板。

![A slightly customized KDE desktop][8]

实际上，它有太多的自定义项了，因此 KDE 最常见的批评之一是它的*太过可定制化*，所以请记住，自定义项是可选的。你可以在默认配置下使用 Plasma 桌面，并仅在你认为必要时逐步进行更改。Plasma 桌面配置选项最重要的不是它们的数目，而是它们容易发现和直观，它们都在系统设置应用或者右键单击中。

事实是，在 KDE 上，几乎绝不会只有一种方法可以完成任何给定的任务，并且它的用户将这个视为其最大的优势。KDE 中没有隐含的工作流，只有默认的。并且可以更改所有默认设置，直到你需要桌面做的成为你的习惯。

### 一致性和集成

KDE 社区以一致性和集成为荣，出色的开发人员、社区管理以及 KDE 库使其成为可能。KDE 的开发人员不只是桌面开发人员。它们提供了[惊人的应用集合][9]，每个应用都使用 KDE 库创建，这些库扩展并标准化了常见的 Qt 小部件。使用 KDE 几个月后，无论是打开 [DigiKam][10] 进行照片管理，还是打开 Kmail 来检查电子邮件，还是打开 KTorrent 来获取最新的 ISO 或者使用 Dolphin 管理文件，你的肌肉记忆会在你思考之前直接带你进入对应 UI。

![KDE on Porteus][11]

### 尝试 KDE

KDE 适合所有人。使用其默认设置可获得流畅、原始的桌面体验，或对其进行自定义以使其成为自己专属。它是一个稳定、有吸引力且强大的桌面环境，可能有你想要在 Linux 完成要做的事的一切。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/linux-kde-plasma

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_linux31x_cc.png?itok=Pvim4U-B (5 pengiuns floating on iceburg)
[2]: https://opensource.com/article/19/12/gnome-linux-desktop
[3]: https://opensource.com/article/19/12/linux-trinity-desktop-environment-tde
[4]: https://opensource.com/article/19/5/getting-started-gnome-boxes-virtualization
[5]: https://opensource.com/article/19/6/linux-distros-to-try
[6]: https://kde.org/plasma-desktop
[7]: https://opensource.com/sites/default/files/uploads/advent-kde-presskit.jpg (KDE Plasma desktop)
[8]: https://opensource.com/sites/default/files/uploads/advent-kde-dock.jpg (A slightly customized KDE desktop)
[9]: https://kde.org/applications/
[10]: https://opensource.com/life/16/5/how-use-digikam-photo-management
[11]: https://opensource.com/sites/default/files/uploads/advent-kde.jpg (KDE on Porteus)
