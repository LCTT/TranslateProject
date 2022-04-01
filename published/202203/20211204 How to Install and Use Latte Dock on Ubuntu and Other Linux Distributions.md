[#]: subject: "How to Install and Use Latte Dock on Ubuntu and Other Linux Distributions"
[#]: via: "https://itsfoss.com/install-use-latte-dock-ubuntu/"
[#]: author: "Pratham Patel https://itsfoss.com/author/pratham/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14340-1.html"

如何安装和使用 Latte Dock
======

![](https://img.linux.net.cn/data/attachment/album/202203/09/091040v3n0vlxvt9a0zokx.jpg)

你知道什么是“<ruby>停靠区<rt>Dock</rt></ruby>” 吧，它通常是你的应用程序“停靠”的底栏，以便快速访问。

![][1]

许多发行版和桌面环境都提供了某种停靠实现。如果你的发行版没有“<ruby>停靠区<rt>Dock</rt></ruby>”，或者你想尝试一些新的停靠应用，Latte Dock 是一个不错的选择。它类似于 macOS 上的停靠区，每次你用鼠标悬停在任何停靠对象上时，都会有一个的抛物线动画。

在本教程中，我将告诉你如何在 Ubuntu 上安装 Latte Dock。我还会展示一些关于使用和定制 Latte Dock 的事情。

### 在 Ubuntu 上安装 Latte Dock

[Latte Dock][2] 是一个流行的应用程序，可以从大多数 Linux 发行版的官方软件库中获得。也就是说你可以使用你的发行版的软件中心或软件包管理器来安装 Latte dock。

![Latte 可以从软件中心获得][3]

在 Ubuntu 和其他基于 Ubuntu 的发行版，如 elementary OS、Linux Mint、Pop!_OS、Zorin OS 上，使用 `apt` 命令：

```
sudo apt install latte-dock
```

这就行了！现在你已经在 Ubuntu 上安装了 Latte Dock。

#### 停用 Ubuntu 自带的停靠区（针对 Ubuntu 用户）

在你启动你闪亮的新停靠区之前，我建议你禁用 Ubuntu 默认提供的停靠区。这里有一个 [关于如何禁用 Ubuntu 的停靠区的指南][4]。

要禁用停靠区，请在你的终端输入以下内容：

```
gnome-extensions disable ubuntu-dock@ubuntu.com
```

如果你最终改变了主意，你可以用以下命令再次启用 Ubuntu 停靠区：

```
gnome-extensions enable ubuntu-dock@ubuntu.com
```

> 注意：
>
> 这不能禁用 Pop!_OS 20.04 LTS 上的默认停靠区（尽管它在桌面上默认是隐藏的；只在活动概览中可见）。在使用 COSMIC 桌面环境/扩展的 Pop!_OS 上，你可以通过“<ruby>设置<rt>Settings</rt></ruby>”应用中的“<ruby>桌面<rt>Desktop</rt></tuby> -> <ruby>停靠区<rt>Dock</rt></ruby>”来禁用或启用停靠区。

### 开始使用 Latte Dock

我在教程中使用的是 Pop!_OS，但这些步骤适用于任何 Linux 发行版。

一旦安装完毕，你会在你的应用程序抽屉里发现一个 Latte Dock 的启动器图标。你可以在这里访问它，或者按 `Super` 键（通常是 `Windows` 键；如果你有 Mac 键盘，则按 `Command` 键）键 + `A`。

从这里打开 Latte Dock：

![应用抽屉里高亮显示的 Latte dock][5]

酷！现在你的桌面上已经打开了 Latte Dock。

![桌面上的 Latte Dock 屏幕截图][6]

#### 启用 Latte Dock 的自动启动功能

随着 Latte Dock 的打开，以及 Ubuntu 自带停靠区的禁用，如果你现在重启，那么下次你的电脑开机时就不会有任何停靠区了。

让我们现在就来解决这个问题。

在停靠区上点击右键。点击“<ruby>布局<rt>Layouts</rt></ruby>”子菜单下的“<ruby>配置<rt>Configure</rt></ruby>”选项。

![通过进入“布局” -> “配置” 启动设置面板窗口][7]

现在，在“<ruby>偏好<rt>Preferences</rt></ruby>”选项卡下，确保“<ruby>在启动时启用自动启动<rt>Enable autostart during startup</rt></ruby>”复选框被选中。

![启用启动时自动启动复选框][8]

### 定制你的停靠区

如果你安装了任何 KDE 的产品，定制应该是永无止境的。如果 Latte Dock 不允许定制，那就奇怪了。幸运的是，情况并非如此。

你可以做各种各样的事情来定制 Latte Dock。增加它的大小，使它更透明或半透明，为它设计主题等等。

#### 将应用程序固定在停靠区上

要把你的应用程序固定在 Latte Dock 上，打开该应用程序，右键点击在你停靠区中的应用程序图标。现在点击“<ruby>固定启动器<rt></rt>Pin Launcher</ruby>”。完成了！你的应用程序现在已经被固定到了停靠区上。

![右击正在运行的应用程序并选择钉住启动器选项][9]

你可以通过点击和拖动移动它到左边或右边来改变它在停靠区中的位置。

#### 搜索和安装 Latte Dock 主题

通过右击停靠区打开 Latte Dock 的“<ruby>设置<rt>Settings</rt></ruby>”窗口，点击“<ruby>布局<rt>Layout</rt></ruby>”子菜单下的“<ruby>配置<rt>Configure</rt></ruby>”选项。

你可能已经安装了一些主题（呃...布局）。从已安装的选项列表中选择它，然后点击右侧的切换按钮。

![改变 Latte Dock 的主题][10]

你也可以通过点击“<ruby>下载<rt>Download</rt></ruby>”按钮来下载更多的主题。它应该向你显示一个可用的主题列表，以供安装。

![Latte Dock 插件安装窗口][11]

#### 改变停靠区的外观和行为

正如我前面提到的，在 KDE 产品中有大量的定制选项。

让我们来试试。

右键点击停靠区，点击 “<ruby>停靠区设置<rt>Dock Settings</rt></ruby>”。

![通过右键点击停靠区进入 Latte Dock 设置][12]

在这里，你会得到各种类型的可以切换的选项。想把停靠区移到显示器的左侧吗？你可以通过“<ruby>位置<rt> Location</rt></ruby>”子菜单下提供的选项来实现。

![Dock 设置和定制窗口][13]

如果你觉得可用的选项有任何限制，请拨动右上角的“<ruby>高级<rt>Advanced</rt></ruby>”开关。

![现在可以看到带有高级选项的停靠区设置和定制窗口][14]

现在看起来真是太棒了！

试着切换每个可用的开关。你可以延迟隐藏停靠区。你可以把它放在显示器的一个边缘，把它放在该边缘的中心、左边或右边。你可以做到这一切。

想修饰启动、悬停等效果？在“<ruby>效果<rt>Effects</rt></ruby>”选项卡下有更多的调整选项等待着你。

### 从你的系统中删除 Latte Dock

你安装了 Latte Dock，并对其进行了定制，但觉得它不是你想要的东西。而你现在正在寻找删除 Latte Dock 的方法。很好，我帮你。

你可以使用 `apt` 软件包管理器删除 Latte Dock。用下面的命令来做：

```
sudo apt autoremove --purge latte-dock
```

![][15]

`--purge` 标志将删除 Latte Dock 在系统目录中的任何配置文件，除了 `~/.config`。

#### 仅供高级用户使用：删除用户特定的遗留文件

这不是强制性的，但如果你想删除通常放在 `$HOME/.config`（即 `~/.config`）目录中的用户配置文件。[使用 find 命令][16] 来定位 Latte Dock 的配置文件：

```
find ~/.config -iname "latte*"
```

![][17]

你可以安全地从你的 `~/.config` 目录中删除这些目录和配置文件。

#### 对于 Ubuntu 用户：重新启用 Ubuntu 停靠区

不要忘了启用 Ubuntu 的停靠区。如果你不记得了，再次启用停靠区的命令在下面：

```
gnome-extensions enable ubuntu-dock@ubuntu.com
```

### 总结

Latte Dock 是一个来自 KDE 社区的令人惊艳的停靠区 ( ͡° ͜ʖ ͡°)

它提供了大量的主题（布局）、外观和自定义选项，以及一些漂亮的效果。如果你正在考虑定制你的桌面外观和感觉，它肯定是你应该寻找的东西。

如果你最终喜欢上了 Latte Dock 并开始每天使用它，请在评论中告诉我。如果你不喜欢 Latte Dock，也请发表评论让我知道原因。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-use-latte-dock-ubuntu/

作者：[Pratham Patel][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pratham/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/latte-dock.webp?resize=800%2C167&ssl=1
[2]: https://invent.kde.org/plasma/latte-dock
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/latte-ubuntu-software-center.png?resize=800%2C384&ssl=1
[4]: https://itsfoss.com/disable-ubuntu-dock/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/02_latte_in_drawer.webp?resize=800%2C450&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/03_latte_dock_launched.webp?resize=800%2C450&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/configure-latte-dock.png?resize=800%2C392&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/enable_autostart_latte_dock.webp?resize=800%2C433&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/pin-app-latte-dock.webp?resize=800%2C334&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/change-themes-latte-dock.webp?resize=800%2C393&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/08_download_layouts.webp?resize=800%2C450&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/latte_dock_settings.webp?resize=799%2C246&ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/11_customization_options.webp?resize=800%2C450&ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/12_customization_options_advanced.webp?resize=800%2C450&ssl=1
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/15_apt_get_remove.webp?resize=800%2C450&ssl=1
[16]: https://linuxhandbook.com/find-command-examples/
[17]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/13_find_configs.webp?resize=800%2C450&ssl=1
