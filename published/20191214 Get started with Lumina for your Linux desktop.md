[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11706-1.html)
[#]: subject: (Get started with Lumina for your Linux desktop)
[#]: via: (https://opensource.com/article/19/12/linux-lumina-desktop)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

在 Linux 桌面中开始使用 Lumina
======

> 本文是 24 天 Linux 桌面特别系列的一部分。Lumina 桌面是让你使用快速、合理的基于 Fluxbox 桌面的捷径，它具有你无法缺少的所有功能。

![](https://img.linux.net.cn/data/attachment/album/201912/23/070658vtgg3wkrpg5g36rs.jpg)

多年来，有一个名为 PC-BSD 的基于 FreeBSD 的桌面操作系统（OS）。它旨在作为一个常规使用的系统，因此值得注意，因为 BSD 主要用于服务器。大多数时候，PC-BSD 默认带 KDE 桌面，但是 KDE 越来越依赖于 Linux 特定的技术，因此 PC-BSD 越来越从 KDE 迁离。PC-BSD 变成了 [Trident][2]，它的默认桌面是 [Lumina][3]，它是一组小部件，它们使用与 KDE 相同的基于 Qt 的工具包，运行在 Fluxbox 窗口管理器上。

你可以在 Linux 发行版的软件仓库或 BSD 的 ports 树中找到 Lumina 桌面。如果你安装了 Lumina 并且已经在运行另一个桌面，那么你可能会发现有冗余的应用（两个 PDF 阅读器、两个文件管理器，等等），因为 Lumina 包含一些集成的应用。如果你只想尝试 Lumina 桌面，那么可以在虚拟机如 [GNOME Boxes][4] 中安装基于 Lumina 的 BSD 发行版。

如果在当前的操作系统上安装 Lumina，那么必须注销当前的桌面会话，才能登录到新的会话。默认情况下，会话管理器（SDDM、GDM、LightDM 或 XDM，取决于你的设置）将继续登录到以前的桌面，因此你必须在登录之前覆盖该桌面。

在 GDM 中：

![Selecting your desktop in GDM][5]

在 SDDM 中：

![Selecting your desktop in KDM][6]

### Lumina 桌面

Lumina 提供了一个简单而轻巧的桌面环境。屏幕底部有一个面板，它的左侧是应用菜单，中间是任务栏，右边是系统托盘。桌面上有图标，可以快速访问常见的应用和路径。

除了这个基本的桌面结构外，Lumina 还有自定义文件管理器、PDF 查看器，截图工具、媒体播放器、文本编辑器和存档工具。还有一个配置程序可以帮助你自定义 Lumina 桌面，并且右键单击桌面可以找到更多配置选项。

![Lumina desktop running on Project Trident][7]

Lumina 与几个 Linux 轻量级桌面非常相似，尤其是 LXQT，不同之处在于 Lumina 完全不依赖于基于 Linux 的桌面框架（例如 ConsoleKit、PolicyKit、D-Bus 或 systemd）。对于你而言，这是否具有优势取决于所运行的操作系统。毕竟，如果你运行的是可以访问这些功能的 Linux，那么使用不使用这些特性的桌面可能就没有多大意义，还会减少功能。如果你运行的是 BSD，那么在 Fluxbox 中运行 Lumina 部件意味着你不必从 ports 安装 Linux 兼容库。

### 为什么要使用 Lumina

Lumina 设计简单，它没有很多功能，但是你可以安装 Fluxbox 你喜欢的组件（用于文件管理的 [PCManFM][8]、各种 [LXQt 应用][9]、[Tint2][10] 面板等）。在开源中，开源用户喜欢寻找不要重复发明轮子的方法（几乎与我们喜欢重新发明轮子一样多）。

Lumina 桌面是让你使用快速、合理的基于 Fluxbox 桌面的捷径，它具有你无法缺少的所有功能，并且你很少需要调整细节。试一试 Lumina 桌面，看看它是否适合你。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/linux-lumina-desktop

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lightbulb-idea-think-yearbook-lead.png?itok=5ZpCm0Jh (Lightbulb)
[2]: https://project-trident.org/
[3]: https://lumina-desktop.org/
[4]: https://opensource.com/article/19/5/getting-started-gnome-boxes-virtualization
[5]: https://opensource.com/sites/default/files/uploads/advent-gdm_400x400_1.jpg (Selecting your desktop in GDM)
[6]: https://opensource.com/sites/default/files/uploads/advent-kdm_400x400_1.jpg (Selecting your desktop in KDM)
[7]: https://opensource.com/sites/default/files/uploads/advent-lumina.jpg (Lumina desktop running on Project Trident)
[8]: https://wiki.lxde.org/en/PCManFM
[9]: http://lxqt.org
[10]: https://opensource.com/article/19/1/productivity-tool-tint2
