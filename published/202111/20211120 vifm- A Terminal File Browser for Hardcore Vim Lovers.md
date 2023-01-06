[#]: subject: "vifm: A Terminal File Browser for Hardcore Vim Lovers"
[#]: via: "https://itsfoss.com/vifm-terminal-file-manger/"
[#]: author: "Pratham Patel https://itsfoss.com/author/pratham/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14001-1.html"

vifm：为铁杆 Vim 爱好者提供的终端文件浏览器
======

> 让我们探索一个基于终端的文件浏览器，可以使用 Vim 风格的键绑定。

![](https://img.linux.net.cn/data/attachment/album/202111/20/103256stau7uhetccj7uun.png)

当在命令行中浏览 [Linux 目录结构][1] 时，人们经常依赖 [cd 命令][2]。

这也没什么不好，因为你登录到任何一个 Linux 系统上都有 `cd` 命令。

然而，如果系统是由你维护的，你想更直观地看到目录，那么文件管理器比 `cd` 或 `tree` 命令要好得多。

是的，你也可以在终端中找到文件管理器。它们可能不如 Nautilus 这样的图形界面应用，但仍然比普通的老命令好。

有几个 [TUI][3] 文件浏览器，我们已经介绍了其中的几个。今天，我们来看看 `vifm`。

### vifm 简介

![][4]

[vifm][5] 是一个命令行工具，它是一个文件管理器，导航和操作文件系统对象的键绑定与 Vim 类似。如果你不清楚我所说的“文件系统对象”是什么意思，它们是文件、目录、符号链接、硬链接等。

除了非常直观的 Vim 交互键绑定外，下面是 `vifm` 为你提供的一系列功能：

  * 一个就在你的终端中的快速文件管理器
  * 从文件管理器内编辑文本文件
  * `vifm` 使用 curses 界面
  * `vifm` 是跨平台的（在 Cygwin 的帮助下甚至可以在 Windows 上工作；它应该可以，但我没有测试过）
  * 支持 Vim 风格的键绑定输入，如 `dd`、`j`、`k`、`h`、`l` 等
  * [vifm 插件][6] 可以在 Vim 中使用，这样就可以通过 Vim 打开文件
  * 支持 Vim 命令的自动补完
  * 支持多个面板
  * 可以使用 [或不使用] 正则表达式进行批量重命名

### 在 Linux 上安装 vifm

`vifm` 软件包并不算新，因此在默认情况下，即使是“稳定”发行版（如 Debian）的软件库中也很容易找到它。

在 Debian 和基于 Debian 的发行版（如 Ubuntu、Pop!_OS、Mint 等）之上，你可以 [使用 apt 软件包管理器][7] 来安装 `vifm`：

```
sudo apt install vifm
```

使用 [pacman 软件包管理器][8] 在 [基于 Arch 的 Linux 发行版][9]上安装 `vifm`：

```
sudo pacman -S vifm
```

`vifm` 在 Fedora 和 RHEL 仓库中也有；用 DNF 软件包管理器安装它：

```
sudo dnf install vifm
```

安装好了 `vifm`，你可以简单地在终端输入 `vifm`，像下面这样，然后启动它：

```
vifm
```

### vifm 的用户界面

当你第一次启动 `vifm` 时，默认情况下，它启动时显示你当前所在的目录的概览。你还会注意到，`vifm` 默认使用两个窗格。

![默认的 vifm 界面，包括一个正常的视图（隐藏的文件不可见）和两个默认打开的窗格][10]

如果你对界面感到困惑，只需尝试按 `j` 键将光标向下移动一行，按 `k` 键将光标向上移动一行。你可以通过按 `h` 键向上移动一级目录。就像 Vim 中一样！

如果你的光标目前在一个文件上，按 `l` 键将在 Vim 中打开该文件（如果没有另外说明的话）。但如果你的光标在一个目录上，按 `l` 键将导航到该目录并显示其内容。

你也可以通过按 `Ctrl + g` 键绑定，从文件管理器中获得关于文件或目录的详细信息。

![`Ctrl + g` 键绑定如何显示目录/文件信息的屏幕截图][11]

你可以按 `za` 键来显示被隐藏的文件和目录（开头有 `.` 的文件和目录默认是隐藏的）。如果这些特殊的文件和目录没有被隐藏，按 `za` 键将会隐藏它们。

你可以用 `zo` 键绑定一直显示隐藏的文件和目录，或用 `zm` 键绑定使这些项目一直不可见。

![举例说明，当你按下 `zo` 键绑定时的情况][12]

### 总结

由于它是基于 Vim 的，你可以用 vifmrc 文件来配置它。在 [vifm wiki][15] 上有最新的默认绑定键的速查表，在 [这里][16]。这个项目的文档非常好。

![vifm 默认按键绑定][17]

`vifm` 是一个了不起的文件管理器，特别是对于 Vim 用户来说，因为它与 Vim 生态系统整合得非常好。它将许多 Vim 的功能和按键绑定整合到一个文件管理器中。默认的双窗格布局使其更具生产力。

不要犹豫，尝试一下 `vifm`。它真的是一个了不起的命令行工具。

--------------------------------------------------------------------------------

via: https://itsfoss.com/vifm-terminal-file-manger/

作者：[Pratham Patel][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pratham/
[b]: https://github.com/lujun9972
[1]: https://linuxhandbook.com/linux-directory-structure/
[2]: https://linuxhandbook.com/cd-command-examples/
[3]: https://itsfoss.com/gui-cli-tui/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/vifm-screenshot.png?resize=800%2C309&ssl=1
[5]: https://github.com/vifm/vifm
[6]: https://github.com/vifm/vifm.vim
[7]: https://itsfoss.com/apt-command-guide/
[8]: https://itsfoss.com/pacman-command/
[9]: https://itsfoss.com/arch-based-linux-distros/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/01_two_panes-1.webp?resize=800%2C600&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/02_ctrl_g_info.webp?resize=800%2C600&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/03_toggle_dotfile_visibility.webp?resize=800%2C600&ssl=1
[13]: https://itsfoss.com/nnn-file-browser-linux/
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2017/04/nnn-file-browser.jpg?fit=800%2C450&ssl=1
[15]: https://wiki.vifm.info/index.php/Main_Page
[16]: https://vifm.info/cheatsheets.shtml
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/vifm-key-binding-cheatsheet.webp?resize=800%2C561&ssl=1
