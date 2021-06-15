[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12124-1.html)
[#]: subject: (Here’s How to Find Out Which Desktop Environment You are Using)
[#]: via: (https://itsfoss.com/find-desktop-environment/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何找出你所使用的桌面环境
======

如果你是 Linux 新用户，并在一个 Linux 论坛中寻求帮助，那么你可能会被问以下问题：

> “你使用的是哪个桌面环境？”

你知道什么是<ruby>桌面环境<rt>desktop environment</rt></ruby>（DE），但你如何知道你使用的是哪一个？我会告诉你如何找到它。我将首先展示命令行方法，因为这适用于[各种 Linux 发行版][1]。我还将展示如何通过图形方式获得。

### 检查你使用的是哪个桌面环境

![][2]

你可以[在 Linux 中使用 echo 命令][3]在终端中显示 `XDG_CURRENT_DESKTOP` 变量的值。

打开终端并复制粘贴此命令：

```
echo $XDG_CURRENT_DESKTOP
```

例如，这表明我在 [Ubuntu 20.04][5] 中使用了 [GNOME 桌面][4]：

```
[email protected]:~$ echo $XDG_CURRENT_DESKTOP
ubuntu:GNOME
```

尽管此命令可以快速告诉你正在使用哪个桌面环境，但它不会提供任何其他信息。

在某些情况下，了解桌面环境版本可能很重要。软件的每个新版本都会带来新功能或删除某些功能。[GNOME 3.36][6] 引入了“请勿打扰”选项，以关闭所有桌面通知。

假设你了解了这个新的“请勿打扰”功能。你确认自己正在使用 GNOME，但是在 GNOME 桌面上看不到此选项。如果你可以检查系统上已安装的 GNOME 桌面版本，那么这会很清楚。

我将先向你展示命令检查桌面环境版本，因为你可以在任何运行桌面环境的 Linux 中使用它。

### 如何获取桌面环境版本

与获取桌面环境的名称不同。获取其版本号的方法并不直接，因为它没有标准的命令或环境变量可以提供此信息。

在 Linux 中获取桌面环境信息的一种方法是使用 [Screenfetch][7] 之类的工具。此[命令行工具以 ascii 格式显示 Linux 发行版的 logo][8] 以及一些基本的系统信息。桌面环境版本就是其中之一。

在基于 Ubuntu 的发行版中，你可以通过[启用 Universe 仓库][9]安装 Screenfetch，然后使用以下命令：

```
sudo apt install screenfetch
```

对于其他 Linux 发行版，请使用系统的软件包管理器来安装此程序。

安装后，只需在终端中输入 `screenfetch` 即可，它应该显示桌面环境版本以及其他系统信息。

![Check Desktop Environment Version][10]

如上图所示，我的系统使用 GNOME 3.36.1（基本版本是 GNOME 3.36）。你也可以这样[检查 Linux 内核版本][11]和其他详细信息。

请记住，Screenfetch 不一定显示桌面环境版本。我查看了它的源码，它有许多 if-else 代码，可以从各种桌面环境中的许多源和参数获取版本信息。如果找不到任何版本，那么仅显示桌面环境名称。

### 使用 GUI 检查桌面环境版本

几乎所有桌面环境在其 “Settings”->“About” 部分中都提供了基本的系统详细信息。

一个主要问题是，大多数桌面环境看起来都不同，因此我无法展示每个桌面环境的确切步骤。我将展示 GNOME 的，让你在桌面上发现它。

在菜单中搜索 “Settings”（按 Windows 键并搜索）：

![Search for Settings application][12]

在这里，找到底部的 “About” 部分。单击它，你应该就能看到桌面环境及其版本。

![Check Desktop Environment in Ubuntu][13]

如你所见，这表明我的系统正在使用 GNOME 3.36。

我希望这个快速入门技巧对你有所帮助。如果你有任何疑问或建议，请在下面发表评论。

--------------------------------------------------------------------------------

via: https://itsfoss.com/find-desktop-environment/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/what-is-linux/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/check-desktop-environment.jpg?ssl=1
[3]: https://linuxhandbook.com/echo-command/
[4]: https://www.gnome.org/
[5]: https://itsfoss.com/ubuntu-20-04-release-features/
[6]: https://itsfoss.com/gnome-3-36-release/
[7]: https://github.com/KittyKatt/screenFetch
[8]: https://itsfoss.com/display-linux-logo-in-ascii/
[9]: https://itsfoss.com/ubuntu-repositories/
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/check-desktop-environment-version.jpg?ssl=1
[11]: https://itsfoss.com/find-which-kernel-version-is-running-in-ubuntu/
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/applications_menu_settings.jpg?ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/check-desktop-environment-ubuntu.jpg?ssl=1
