[#]: subject: "Hash Linux: Arch Linux Preconfigured With Xmonad, Awesome, i3, and Bspwm Window Manager"
[#]: via: "https://itsfoss.com/hash-linux-review/"
[#]: author: "Sarvottam Kumar https://itsfoss.com/author/sarvottam/"
[#]: collector: "lujun9972"
[#]: translator: "mcfd"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13608-1.html"

Hash Linux：预配置了四种平铺窗口管理器的 Arch Linux 衍生版
======

![](https://img.linux.net.cn/data/attachment/album/202107/23/112405tt57nu7neuddkk7k.jpg)

通过一些努力，[你能安装上 Arch Linux][1]，也可以在你的 Arch 系统上安装一个你选择的桌面环境或窗口管理器。

这需要一些时间和精力，但肯定是可以实现的。但是，有一些项目可以减轻你的痛苦，为你提供一个预先配置好的桌面环境或窗口管理器的系统。[ArcoLinux][2] 就是这样一个例子。

最近，我发现了另一个项目，它只专注于在出色的 Arch 发行版上提供完善的窗口管理器的选择。

[Hash 项目][3] 提供了四种预配置有平铺式窗口管理器的 Arch 变体：Awesome、[Xmonad][4]、 i3 和 Bspwm。

如果你是一个刚刚接触窗口管理器的人，Hash 项目绝对是你应该马上尝试的。不用先投入时间去配置它，你就可以深入探索窗口管理器，并习惯由键盘驱动的系统。

在本文中，我将讨论我在使用 **Hash Linux Xmonad 版本** 时的部分体验，该版本采用 Linux 5.12 的内核。

### 安装 Hash Linux

Hash Linux 四个版本的 ISO 镜像均可 [下载][5] ，适用于 x86_64 系统架构。

为了避免在实体机上安装时出现的各种意外错误，我在 GNOME Boxes 中创建了一个 Hash Linux Xmonad 版本的虚拟机。 

当我启动到 Hash Linux 时，我注意到两件事。首先是一个面板，提供用于管理窗口和命令的快捷方式。我将在安装后讨论它。其次，是一个漂亮且易于使用的 GUI 安装程序。

![Hash Linux GUI Installer][6]

像其他衍生版一样，图形化的安装程序使安装过程非常顺畅。在几个步骤的配置中，Hash Linux 已安装完毕，并准备重新启动。

![Installer Welcome Page][7]

### 第一印象

![Hash Linux][8]

如果你曾经在你的 Linux 系统上安装过 Xmonad 窗口管理器，那么你重启后首先看到的是什么？空白的屏幕吧。

如果你是一个初学者，或者你不知道默认的按键绑定，你会被卡在一个屏幕上。因此，在使用任何窗口管理器之前，你必须先阅读其键盘快捷键。

如果你想把所有重要的快捷键提示都放在窗口上呢？一个备忘单可以为你节省很多时间。

因此，为了简化和方便初学者，Hash Linux 将重要的快捷键都钉在了桌面上。

所以，让我们先尝试其中的一些。从最重要的一个开始 `Super+Enter`，它可以打开默认的 termite 终端模拟器与 Z shell（ZSH）。

如果你多次按下它，你会发现默认情况下 Xmonad 遵循一个缩减布局，它首先将一个窗口固定在右边，然后以同样的方式将其余的全部安排在左边。

![Xmonad default layout][9]

按下 `Super+Space`，你也可以将当前的布局改为标签式布局。甚至你可以按下 `Super+leftclick` 将窗口拖动。

![Moved to float][10]

要退出当前的窗口，你可以按下 `Super+Q`。

### Hash Linux 中的应用

默认情况下，Hash Linux 包含几个有用的命令行工具，如：NeoFetch、Htop、Vim、Pacman、Git 和 Speedtest-cli。

![Htop][11]

它还拥有大量的图形应用程序，如：Firefox 89、Gparted、Nitrogen、Conky、Flameshot、Geany 和 CPU-X。

`Super+D` 是 Hash Linux 中打开应用程序搜索菜单的默认快捷键。

![Application search menu][12]

### 主题美化

Hash Cyan 是 Hash Linux 的默认主题。除了它之外，Hash Linux 还提供了另外四个主题：Light Orange、Sweet Purple、Night Red 和 Arch Dark。 

Hash Theme Selector 是一个自制的 Hash Linux 应用程序，你可以用它来配置窗口管理器的主题。

![Hash Theme Selector][13]

### 升级 Hash Linux

作为一个滚动发行版，你不需要下载一个新的 Hash Linux 的 ISO 来更新现有系统。你唯一需要的是在终端运行 ` upgrade` 命令来升级你的系统。

![upgrading hash linux][14]

### 结束语

如果你想使用一个窗口管理器来代替桌面环境，但又不想花很多时间来配置它，Hash 项目可以节省你的时间。

首先，它可以节省你大量的配置时间和精力，其次，它可以很轻松地让你适应使用键盘控制的系统。以后，你肯定可以学会根据自己的需要进行配置。

由于 Hash Linux 已经提供了 4 个带有不同的窗口管理器的 ISO，你可以开始使用任何一个版本，并找到你最喜欢的一个版本。总的来说，它是一个 [很好的 Arch Linux 衍生版][15]。

最后我还要提一下，目前 Hash Linux 的官方 [网站][3] 并没有包含很多关于它的信息。

![][16]

在发布信息中也提到了一个早期的 [网站][17]（我现在无法访问），在我上次访问时，其中包含了许多关于它的信息，包括配置细节等。

不想入 Arch 的教，只想用平铺式窗口管理器？可以试试 [Regolith Linux][18] 。它是预先配置了 i3wm 的 Ubuntu。棒极了，对吧？

--------------------------------------------------------------------------------

via: https://itsfoss.com/hash-linux-review/

作者：[Sarvottam Kumar][a]
选题：[lujun9972][b]
译者：[mcfd](https://github.com/mcfd)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sarvottam/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-arch-linux/
[2]: https://arcolinux.com/
[3]: https://hashproject.ga/
[4]: https://xmonad.org/
[5]: https://hashproject.ga/index.html#downloads
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/Hash-Linux-GUI-Installer.jpg?resize=800%2C451&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/06/Installer-Welcome-Page.png?resize=800%2C452&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/Hash-Linux.jpg?resize=800%2C451&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/Xmonad-default-layout.png?resize=800%2C452&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/Moved-to-float.png?resize=800%2C452&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/Htop.jpg?resize=800%2C451&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/Application-search-menu.jpg?resize=800%2C451&ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/Hash-Theme-Selector.png?resize=800%2C452&ssl=1
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/06/Upgrading-hash-linux.png?resize=800%2C452&ssl=1
[15]: https://itsfoss.com/arch-based-linux-distros/
[16]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/Hash-Linux-Site-URL.png?resize=575%2C193&ssl=1
[17]: https://hashproject.org/
[18]: https://itsfoss.com/regolith-linux-desktop/
