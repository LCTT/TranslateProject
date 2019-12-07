[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11650-1.html)
[#]: subject: (Use the Window Maker desktop on Linux)
[#]: via: (https://opensource.com/article/19/12/linux-window-maker-desktop)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

在 Linux 上使用 Window Maker 桌面
======
> 本文是 24 天 Linux 桌面特别系列的一部分。让我们和 Window Maker 一起时光倒流，它为如今的用户实现了老式 Unix NeXTSTEP 环境。

![Penguin with green background][1]

在 Mac OS X 之前，有一个奇怪的闭源 Unix 系统，称为 [NeXTSTEP][2]。Sun Microsystems 后来将 NeXTSTEP 的底层设为开放规范，这使其它项目可以创建许多自由开源的 NeXT 库和组件。GNUStep 实现了许多 NeXTSTEP 库，而 [Window Maker][3] 实现了其桌面环境。

Window Maker 非常接近地模仿了 NeXTSTEP 桌面 GUI，并提供了一个有趣的视角，可以让人了解 80 年代末 90 年代初的 Unix 是什么样子的。它还揭示了窗口管理器（例如 Fluxbox 和 Openbox）背后的一些基本概念。

你可以从发行版的仓库中安装 Window Maker。要尝试它，请在安装完成后退出桌面会话。默认情况下，会话管理器（KDM、GDM、LightDM 或 XDM，这取决于你的设置）将继续将登录到默认桌面，因此登录时必须覆盖默认设置。

要在 GDM 上切换到 Window Maker：

![Selecting the Window Maker desktop in GDM][4]

在 KDM 上：

![Selecting the Window Maker desktop in KDM][5]

### Window Maker 程序坞

默认情况下，Window Maker 桌面是空的，但每个角落都有几个*程序坞*。像在 NeXTSTEP 中一样，在 Window Maker 中，在程序坞区域，应用可最小化成图标后停靠，可创建启动器来快速访问常见应用，并且可运行微型的 “dockapp”。

你可以在软件仓库中搜索 “dockapp” 来试用 dockapp。它们常常是网络和系统监控器、音频设置面板、时钟等。这是在 Fedora 上运行的 Window Maker：

![Window Maker running on Fedora][6]

### 应用菜单

要访问应用菜单，请右键单击桌面上的任意位置。要关闭它，请再次单击鼠标右键。Window Maker 不是桌面环境（DE），而是一个窗口管理器（DM）。它可以帮助你安排和管理窗口。它唯一捆绑的程序是 [WPrefs][7]（或更常见的说法 Window Maker 偏好），它可帮助你配置常用设置，而应用菜单则提供对其他选项（包括主题）的访问。

运行什么应用完全由你决定。在 Window Maker 中，你可以选择运行 KDE 应用、GNOME 应用以及不被视为任何其他主流桌面应用的程序。你可以创建自己的工作环境，并且可以使用 Window Maker 对其进行管理。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/linux-window-maker-desktop

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_penguin_green.png?itok=ENdVzW22 (Penguin with green background)
[2]: https://en.wikipedia.org/wiki/NeXTSTEP
[3]: https://www.windowmaker.org/
[4]: https://opensource.com/sites/default/files/uploads/advent-windowmaker-gdm.jpg (Selecting the Window Maker desktop in GDM)
[5]: https://opensource.com/sites/default/files/uploads/advent-windowmaker-kdm.jpg (Selecting the Window Maker desktop in KDM)
[6]: https://opensource.com/sites/default/files/uploads/advent-windowmaker.jpg (Window Maker running on Fedora)
[7]: http://www.windowmaker.org/docs/guidedtour/prefs.html
