[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11745-1.html)
[#]: subject: (Chill out with the Linux Equinox Desktop Environment)
[#]: via: (https://opensource.com/article/19/12/ede-linux-desktop)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

轻松使用 Linux Equinox 桌面环境
======

> 本文是 24 天 Linux 桌面特别系列的一部分。EDE 不是最迷人、最小或效率最高的桌面。但它的柔和、安宁让人平静，它让人感到熟悉舒缓，它的图标主题也很有趣。

我还没有认真用过 Fast Light Toolkit（[FLTK] [2]），但我是 C++ GUI 工具箱的粉丝，它非常易于学习，并且即使进行更新也很可靠。当我发现有一个用 FLTK 构建的桌面环境时，我很想尝试一下，并且我很快为我的决定感到高兴。[Equinox 桌面环境（EDE）][3] 是用 C++ 和 FLTK 为 Unix 桌面编写的快速、简单的桌面环境。它使用通用的桌面约定，因此外观和感觉都非常熟悉，并且在使用几天后，我发现它的简单性提供了我所喜欢的最低限度的优雅。

![EDE desktop][4]

### 安装 EDE

你可能会发现 EDE 包含在发行版的软件仓库中，但你也可以在它的 [SourceForge 仓库][5]中找到它。如果你已经在运行其他桌面环境，你可以安全地在同一系统上安装 EDE，因为它仅带来了一些额外的应用，这些应用程序特定于 EDE，因此它们不会妨碍你的其他桌面。

EDE 只是桌面环境，它使用 [Pekwm][6] 窗口管理器来处理布局。

安装 EDE 之后，注销当前的桌面会话，以便你可以登录到新的会话。默认情况下，会话管理器（KDM、GDM、LightDM 或 XDM，取决于你的设置）将继续登录到以前的桌面环境，因此你必须在登录之前覆盖该桌面环境。

在 GDM 中：

![][7]

在 SDDM 中：

![][8]

首次启动 EDE 时，可能会提示你确认一些启动任务。在我的 Slackware 工作站上，KDE 将某些服务标记为启动任务（例如 HPLIP 打印监视器和蓝牙守护程序），并且 EDE 在一个确认框中显示了它们。

![Importing desktop services in EDE][9]

设置一次后，你无需再次进行设置。

### EDE 桌面之旅

EDE 的布局恰恰是大多数人在桌面上所期望的布局：左侧的应用菜单、中间的任务栏、右侧的系统托盘。这是标准的现成布局，不会让任何人感到困惑。这是一个可以安全地装在 Linux 上并且可以自信地给任何没有使用过 Linux 的人使用的桌面。他们将以舒适的方式很快地适应这个桌面。

你可以单击鼠标右键打开一个小型桌面菜单。这可以让你在桌面上创建应用启动器、创建文件夹并设置一些主题选项。

屏幕底部的面板是可伸缩的，因此你可以根据需要在全屏模式下工作。单击屏幕右下角的时钟来调出日历和时区设置。

EDE 有一个小的配置应用，可用于设置一些简单的选项：

* 背景和图标设置
* 屏幕保护程序设置
* 时间和时钟
* 系统铃声
* 键盘
* 偏好应用

![EDE Configuration Place][10]

EDE 的功能不多。没有文件管理器、文本编辑器、绘画程序或纸牌游戏。你必须安装你想在桌面运行的程序。这意味着你可以从各种各样的 Linux 应用中进行选择，并使用你最喜欢的。

### EDE 总结

我发现 EDE 至少作为一种“假日”桌面而言，它的简单性令人舒适。它值得一看。它不是最迷人的桌面，也不是最精简的、也不是最高效的。但它的柔和、安宁让人平静，它让人感到熟悉舒缓，并且它的图标主题充满乐趣和生气。EDE 是一个以其缓慢而稳定的步调而自豪的桌面。

如果你想放松心情使用一个干净和令人愉悦的界面，请试试 EDE。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/ede-linux-desktop

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/penguin.igloo_.png?itok=K92O7H6b (Linux penguin at the north pole beside an igloo)
[2]: https://www.fltk.org/
[3]: https://sourceforge.net/projects/ede/
[4]: https://opensource.com/sites/default/files/uploads/advent-ede.jpg (EDE desktop)
[5]: http://ede.sf.net
[6]: https://opensource.com/article/19/12/pekwm-linux-desktop
[7]: https://opensource.com/sites/default/files/advent-gdm_2.jpg
[8]: https://opensource.com/sites/default/files/advent-kdm_1.jpg
[9]: https://opensource.com/sites/default/files/uploads/advent-ede-init.jpg (Importing desktop services in EDE)
[10]: https://opensource.com/sites/default/files/uploads/advent-ede-conf.jpg (EDE Configuration Place)
