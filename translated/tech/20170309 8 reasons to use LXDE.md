使用 LXDE 的 8 个理由
============================================================

> 考虑使用轻量级桌面环境 LXDE 作为你 Linux 桌面的理由

![使用 LXDE 的 8 个理由](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/rh_003499_01_linux31x_cc.png?itok=1HXbvw2E "8 reasons to use LXDE") 

>Image by : opensource.com

去年年底，升级到 Fedora 25 所装的新版本 [KDE][7] Plasma 给我带来了严重问题，让我难以完成任何工作。出于两个原因我决定尝试其它 Linux 桌面环境。第一，我需要完成我的工作。第二，一心使用 KDE 已经有很多年，我认为是时候尝试一些不同的桌面了。

我第一个尝试了几周的替代桌面是 [Cinnamon][8]，我在 1 月份介绍过它。这次我已经使用了 LXDE（轻量级 X11 桌面环境(Lightweight X11 Desktop Environment)）大概 6 周，我发现它有很多我喜欢的东西。这是我使用 LXDE 的 8 个理由。

更多 Linux 相关资源

*	[Linux 是什么？][1]
*	[Linux 容器是什么？][2]
*	[在 Linux 中管理设备][3]
*	[马上下载：Linux 命令速查表][4]
*	[我们最新的 Linux 文章][5]

### 1、 LXDE 支持多个面板

和 KDE 以及 Cinnamon 一样，LXDE 支持包括系统菜单、应用启动器的面板，以及显示正在运行应用图标的任务栏。我第一次登录到 LXDE 时，面板的配置看起来异常熟悉。LDXE 看起来已经根据我的 KDE 配置情况为我准备好了喜欢的顶部和底部面板，并包括了系统托盘设置。顶部面板上的应用程序启动器看似来自 Cinnamon 。面板上的东西使得启动和管理程序变得容易。默认情况下，只在桌面底部有一个面板。

 ![打开了 Openbox Configuration Manager 的 LXDE 桌面。](https://opensource.com/sites/default/files/lxde-openboxconfigurationmanager.png "打开了 Openbox Configuration Manager 的 LXDE 桌面。") 

*打开了 Openbox 配置管理器的 LXDE 桌面。这个桌面还没有更改过，因此它使用了默认的颜色和图标主题。*

### 2、 Openbox 配置管理器提供了一个用于管理和体验桌面外观的简单工具。

它为主题、窗口修饰、多个显示器的窗口行为、移动和调整窗口大小、鼠标控制、多桌面等提供了选项。虽然这看起来似乎很多，但它远不如配置 KDE 桌面那么复杂，尽管如此 Openbox 仍然提供了绝佳的效果。

### 3、 LXDE 有一个强大的菜单工具

在桌面偏好（Desktop Preference）菜单的高级（Advanced）标签页有个有趣的选项。这个选项的名称是 “点击桌面时显示窗口管理器提供的菜单（Show menus provided by window managers when desktop is clicked）”。选中这个复选框，当你右击桌面时，会显示 Openbox 桌面菜单，而不是标准的 LXDE 桌面菜单。

Openbox 桌面菜单包括了几乎每个你可能想要的菜单选项，所有都可从桌面便捷访问。它包括了所有的应用程序菜单、系统管理、以及首选项。它甚至有一个菜单包括了所有已安装的终端模拟器应用程序的列表，因此系统管理员可以轻易地启动他们喜欢的终端。

### 4、 LXDE 桌面的设计干净简单

它没有任何会妨碍你完成工作的东西。尽管你可以添加一些文件、目录、应用程序的链接到桌面，但是没有可以添加到桌面的小部件。在我的 KDE 和 Cinnamon 桌面上我确实喜欢一些小部件，但它们很容易被覆盖住，然后我就需要移动或者最小化窗口，或者使用 “显示桌面（Show Desktop）” 按钮清空整个桌面才能看到它们。 LXDE 确实有一个 “图标化所有窗口（Iconify all windows）” 按钮，但我很少需要使用它，除非我想看我的壁纸。

### 5、 LXDE 有一个强大的文件管理器

LXDE 默认的文件管理器是 PCManFM，因此在我使用 LXDE 的时候它成为了我的文件管理器。PCManFM 非常灵活、可以配置为适用于大部分人和场景。它看起来没有我常用的文件管理器 Krusader 那么可配置，但我确实喜欢 Krusader 所没有的 PCManFM 侧边栏。

PCManFM 允许打开多个标签页，可以通过右击侧边栏的任何条目或者单击图标栏的新标签图标打开。PCManFM 窗口左边的位置（Places）面板显示了应用程序菜单，你可以从 PCManFM 启动应用程序。位置（Places）面板上面也显示了一个设备图标，可以用于查看你的物理存储设备，一系列带按钮的可移除设备允许你挂载和卸载它们，还有可以便捷访问的主目录、桌面、回收站。位置（Places）面板的底部包括一些默认目录的快捷方式，例如 Documents、Music、Pictures、Videos 以及 Downloads。你也可以拖拽其它目录到位置（Places）面板的快捷方式部分。位置（Places） 面板可以换为正常的目录树。

### 6、 如果在现有窗口后面打开，新窗口的标题栏会闪烁

这是一个在大量现有窗口中定位新窗口的好方法。

### 7、 大部分现代桌面环境允许多个桌面，LXDE 也不例外

我喜欢使用一个桌面用于我的开发、测试以及编辑工作，另一个桌面用于普通任务，例如电子邮件和网页浏览。LXDE 默认提供两个桌面，但你可以配置为只有一个或者多个。右击桌面切换器（Desktop Pager）配置它。

通过一些有害但不是破坏性的测试，我发现最大允许桌面数目是 100。我还发现当我把桌面数目减少到低于我实际已经在使用的 3 个时，不活动桌面上的窗口会被移动到桌面 1。多么有趣的发现！

### 8、 Xfce 电源管理器是一个小巧但强大的应用程序，它允许你配置电源管理如何工作

它提供了一个标签页用于通用配置，以及用于系统、显示和设备的标签页。设备标签页显示了我系统上已有设备的表格，例如电池供电的鼠标、键盘，甚至我的 UPS（不间断电源）。它显示了每个设备的详细信息，包括厂商和系列号，如果可用的话，还有电池充电状态。当我写这篇博客的时候，我 UPS 的电量是 100%，而我罗技鼠标的电量是 75%。 Xfce 电源管理器还在系统托盘显示了一个图标，因此你可以从那里快速了解你设备的电池状态。

关于 LXDE 桌面还有很多喜欢的东西，但这些就是抓住了我的注意力，它们也是对我使用现代图形用户界面工作非常重要、不可或缺的东西。

我注意到奇怪的一点是，我一直没有弄明白桌面（Openbox）菜单的 “重新配置（Reconfigure）” 选项是干什么的。我点击了几次，从没有注意到有任何类型的任何活动表明该选项实际起了作用。

我发现 LXDE 是一个简单但强大的桌面。我享受使用它写这篇文章的几周时间。通过允许我访问我想要的应用程序和文件，同时在其余时间保持不会让我分神，LXDE 使我得以高效地工作。我也没有遇到任何妨碍我完成工作的问题——当然，除了我用于探索这个好桌面所花的时间。我非常推荐 LXDE 桌面。

我现在正在试用 GNOME 3 和 GNOME Shell，并将在下一期中报告。

--------------------------------------------------------------------------------

作者简介：

David Both 是一个 Linux 和开源倡导者，他居住在北卡罗莱纳州的 Raleigh。他在 IT 行业已经超过 40 年，在他工作的 IBM 公司教授 OS/2 超过 20 年，他在 1981 年为最早的 IBM PC 写了第一个培训课程。他教过 Red Hat 的 RHCE 课程，在 MCI Worldcom、 Cisco 和北卡罗莱纳州 工作过。他一直在使用 Linux 和开源软件近 20 年。

--------------------------------------

via: https://opensource.com/article/17/3/8-reasons-use-lxde

作者：[David Both][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dboth
[1]:https://opensource.com/resources/what-is-linux?src=linux_resource_menu
[2]:https://opensource.com/resources/what-are-linux-containers?src=linux_resource_menu
[3]:https://opensource.com/article/16/11/managing-devices-linux?src=linux_resource_menu
[4]:https://developers.redhat.com/promotions/linux-cheatsheet/?intcmp=7016000000127cYAAQ
[5]:https://opensource.com/tags/linux?src=linux_resource_menu
[6]:https://opensource.com/article/17/3/8-reasons-use-lxde?rate=QigvkBy_9zLvktdsL-QaIWedjIqjtlwwJIVFQDQzsSY
[7]:https://opensource.com/life/15/4/9-reasons-to-use-kde
[8]:https://opensource.com/article/17/1/cinnamon-desktop-environment
[9]:https://opensource.com/user/14106/feed
[10]:https://opensource.com/article/17/3/8-reasons-use-lxde#comments
[11]:https://opensource.com/users/dboth
