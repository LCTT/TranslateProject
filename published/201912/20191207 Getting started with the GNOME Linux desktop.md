[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11675-1.html)
[#]: subject: (Getting started with the GNOME Linux desktop)
[#]: via: (https://opensource.com/article/19/12/gnome-linux-desktop)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

GNOME Linux 桌面入门
======

> 本文是 24 天 Linux 桌面特别系列的一部分。GNOME 是大多数现代 Linux 发行版的默认桌面，它干净、简单、组织良好。

![](https://img.linux.net.cn/data/attachment/album/201912/14/150510z2227x177x8liwww.jpg)

[GNOME][2] 项目理所应当是 Linux 桌面的宠儿。它起初是专有桌面（当时包括 KDE）的自由开源的桌面替代品，此后一直发展强劲。GNOME 采用了[由 GIMP 项目开发][3]的 GTK+，并将其开发为强大的通用 GTK 框架。该项目开创了用户界面的先声，挑战了桌面“应有”外观的先入之见，并为用户提供了新的范例和选项。

在大多数主流现代 Linux 发行版（包括 RHEL、Fedora、Debian 和 Ubuntu）中，GNOME 作为默认桌面而广泛使用。如果你的发行版不提供它的某个版本，那么你可以从软件仓库中安装 GNOME。但是，在执行此操作之前，请注意，为了提供完整的桌面体验，这会随桌面一起安装许多 GNOME 应用。如果你在用其他桌面，那么你可能会发现有冗余的应用（两个 PDF 阅读器、两个媒体播放器、两个文件管理器，等等）。如果你只想尝试 GNOME 桌面，请考虑在虚拟机，如 [GNOME Boxes][4]，中安装 GNOME 发行版。

### GNOME 功能

GNOME 桌面很干净，顶部有一个简单的任务栏，右上角的系统托盘中只有很少的图标。GNOME 上没有桌面图标，这是设计使然。如果你是喜欢在桌面上保存*任何东西*的用户，那么你可能会意识到桌面会定期地变得混乱，而且，更糟糕的是，由于你的应用掩盖了桌面，因此桌面永远不会显示出来。

GNOME 解决了两个问题：（在功能上）没有桌面，并且动态生成新的虚拟工作区，因此你可以在全屏模式下运行应用。如果你常把屏幕弄乱，那么可能需要一些时间来习惯，但实际上，从各个方面来说，这都是一种改进的工作流程。你将学习如何使文件井井有条（或者将它们分散在家目录中），并且可以像在手机上一样快速地在屏幕之间切换。

当然，并非所有应用都设计为在全屏模式下运行，因此，如果你更喜欢单击切换窗口，也可以这样做。

![GNOME running on Debian][5]

GNOME 哲学褒扬了 Canonical 对常见任务的解决方案。在 GNOME 中，你通常不会发现“回字有四种写法”。你会找到一种或两种官方方法来完成一项任务，你了解了这些方法后，便只需记住这些即​​可。它非常简单，但由于它在 Linux 上运行，因此在技术上也很灵活（毕竟，你不必因为运行 GNOME 桌面而必须要使用 GNOME 应用）。

### 应用菜单

要访问名为“活动”的应用菜单，请在桌面的左上角单击。此菜单将占满整个屏幕，屏幕最左侧有一栏常见应用的 dock，或可以在网格中浏览应用的图标。你可以通过浏览已安装的应用，或输入软件的头几个字母来过滤列表，然后来启动应用。

![GNOME activities][6]

### GNOME 应用

GNOME 不仅是桌面。它是一个桌面以及一组丰富的集成应用，例如 Gedit 文本编辑器、Evince PDF 查看器、Web 浏览器、图像查看器、Nautilus 文件管理器等等。GNOME 应用（例如桌面本身）遵循 [GNOME 人机界面指南][7]，因此用户体验既愉悦又一致。无论你是否使用 GNOME 桌面，都可能使用 GTK 应用，也可能会使用 GNOME 应用。

### GNOME 3 及更高版本

GNOME 项目进展顺利，还有几个令人兴奋的项目（例如 MATE 和 [Cinnamon][8]）。它流行、令人舒适，被视为 Linux 桌面的代表。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/gnome-linux-desktop

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/custom_gnomes.png?itok=iG98iL8d (Gnomes in a window.)
[2]: https://www.gnome.org/
[3]: https://www.gtk.org/overview.php
[4]: https://opensource.com/article/19/5/getting-started-gnome-boxes-virtualization
[5]: https://opensource.com/sites/default/files/uploads/advent-gnome.jpg (GNOME running on Debian)
[6]: https://opensource.com/sites/default/files/uploads/advent-gnome-activities.jpg (GNOME activities)
[7]: https://developer.gnome.org/hig/stable/
[8]: https://opensource.com/article/19/11/advent-2019-cinnamon
