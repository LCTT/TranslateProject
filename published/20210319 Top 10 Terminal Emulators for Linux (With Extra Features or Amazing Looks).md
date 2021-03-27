[#]: subject: (Top 10 Terminal Emulators for Linux \(With Extra Features or Amazing Looks\))
[#]: via: (https://itsfoss.com/linux-terminal-emulators/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13221-1.html)

10 个常见的 Linux 终端仿真器
======

![](https://img.linux.net.cn/data/attachment/album/202103/21/073043q4j4o6hr33b595j4.jpg)

默认情况下，所有的 Linux 发行版都已经预装了“<ruby>终端<rt>terminal</rt></ruby>”应用程序或“<ruby>终端仿真器<rt>terminal emulator</rt></ruby>”（这才是正确的技术术语）。当然，根据桌面环境的不同，它的外观和感觉会有所不同。

Linux 的特点是，你可以不用局限于你的发行版所提供的东西，你可以用你所选择的替代应用程序。终端也不例外。有几个提供了独特功能的终端仿真器令人印象深刻，可以获得更好的用户体验或更好的外观。

在这里，我将整理一个有趣的终端应用程序的列表，你可以在你的 Linux 发行版上尝试它们。

### 值得赞叹的 Linux 终端仿真器

此列表没有特别的排名顺序，我会先列出一些有趣的，然后是一些最流行的终端仿真器。此外，我还强调了每个提到的终端仿真器的主要功能，你可以选择你喜欢的终端仿真器。

#### 1、Terminator

![][1]

主要亮点：

* 可以在一个窗口中使用多个 GNOME 终端

[Terminator][2] 是一款非常流行的终端仿真器，目前仍在维护中（从 Launchpad 移到了 GitHub）。

它基本上是在一个窗口中为你提供了多个 GNOME 终端。在它的帮助下，你可以轻松地对终端窗口进行分组和重组。你可能会觉得这像是在使用平铺窗口管理器，不过有一些限制。

##### 如何安装 Terminator？

对于基于 Ubuntu 的发行版，你只需在终端输入以下命令:

```
sudo apt install terminator
```

你应该可以在大多数 Linux 发行版的默认仓库中找到它。但是，如果你需要安装帮助，请访问它的 [GitHub 页面][3]。

#### 2、Guake 终端

![][4]

主要亮点：

  * 专为在 GNOME 上快速访问终端而设计
  * 工作速度快，不需要大量的系统资源
  * 访问的快捷键

[Guake][6] 终端最初的灵感来自于一款 FPS 游戏 Quake。与其他一些终端仿真器不同的是，它的工作方式是覆盖在其他的活动窗口上。

你所要做的就是使用快捷键（`F12`）召唤该仿真器，它就会从顶部出现。你可以自定义该仿真器的宽度或位置，但大多数用户使用默认设置就可以了。

它不仅仅是一个方便的终端仿真器，还提供了大量的功能，比如能够恢复标签、拥有多个标签、对每个标签进行颜色编码等等。你可以查看我关于 [Guake 的单独文章][5] 来了解更多。

##### 如何安装 Guake 终端？

Guake 在大多数 Linux 发行版的默认仓库中都可以找到，你可以参考它的 [官方安装说明][7]。

如果你使用的是基于 Debian 的发行版，只需输入以下命令：

```
sudo apt install guake
```

#### 3、Tilix 终端

![][8]

主要亮点：

  * 平铺功能
  * 支持拖放
  * 下拉式 Quake 模式

[Tilix][10] 终端提供了与 Guake 类似的下拉式体验 —— 但它允许你在平铺模式下拥有多个终端窗口。

如果你的 Linux 发行版中默认没有平铺窗口，而且你有一个大屏幕，那么这个功能就特别有用，你可以在多个终端窗口上工作，而不需要在不同的工作空间之间切换。

如果你想了解更多关于它的信息，我们之前已经 [单独介绍][9] 过了。

##### 如何安装 Tilix？

Tilix 在大多数发行版的默认仓库中都有。如果你使用的是基于 Ubuntu 的发行版，只需输入：

```
sudo apt install tilix
```

#### 4、Hyper

![][13]

主要亮点：

  * 基于 HTML/CSS/JS 的终端
  * 基于 Electron
  * 跨平台
  * 丰富的配置选项

[Hyper][15] 是另一个有趣的终端仿真器，它建立在 Web 技术之上。它并没有提供独特的用户体验，但看起来很不一样，并提供了大量的自定义选项。

它还支持安装主题和插件来轻松定制终端的外观。你可以在他们的 [GitHub 页面][14] 中探索更多关于它的内容。

##### 如何安装 Hyper？

Hyper 在默认的资源库中是不可用的。然而，你可以通过他们的 [官方网站][16] 找到 .deb 和 .rpm 包来安装。

如果你是新手，请阅读文章以获得 [使用 deb 文件][17] 和 [使用 rpm 文件][18] 的帮助。

#### 5、Tilda

![][19]

主要亮点：

  * 下拉式终端
  * 搜索栏整合

[Tilda][20] 是另一款基于 GTK 的下拉式终端仿真器。与其他一些不同的是，它提供了一个你可以切换的集成搜索栏，还可以让你自定义很多东西。

你还可以设置热键来快速访问或执行某个动作。从功能上来说，它是相当令人印象深刻的。然而，在视觉上，我不喜欢覆盖的行为，而且它也不支持拖放。不过你可以试一试。

##### 如何安装 Tilda？

对于基于 Ubuntu 的发行版，你可以简单地键入：

```
sudo apt install tilda
```

你可以参考它的 [GitHub 页面][20]，以了解其他发行版的安装说明。

#### 6、eDEX-UI

![][21]

主要亮点：

  * 科幻感的外观
  * 跨平台
  * 自定义主题选项
  * 支持多个终端标签

如果你不是特别想找一款可以帮助你更快的完成工作的终端仿真器，那么 [eDEX-UI][23] 绝对是你应该尝试的。

对于科幻迷和只想让自己的终端看起来独特的用户来说，这绝对是一款漂亮的终端仿真器。如果你不知道，它的灵感很大程度上来自于电影《创：战纪》。

不仅仅是设计或界面，总的来说，它为你提供了独特的用户体验，你会喜欢的。它还可以让你 [自定义终端][12]。如果你打算尝试的话，它确实需要大量的系统资源。

你不妨看看我们 [专门介绍 eDEX-UI][22] 的文章，了解更多关于它的信息和安装步骤。

##### 如何安装 eDEX-UI？

你可以在一些包含 [AUR][24] 的仓库中找到它。无论是哪种情况，你都可以从它的 [GitHub 发布部分][25] 中抓取一个适用于你的 Linux 发行版的软件包（或 AppImage 文件）。

#### 7、Cool Retro Terminal

![][26]

主要亮点：

  * 复古主题
  * 动画/效果调整

[Cool Retro Terminal][27] 是一款独特的终端仿真器，它为你提供了一个复古的阴极射线管显示器的外观。

如果你正在寻找一些额外功能的终端仿真器，这可能会让你失望。然而，令人印象深刻的是，它在资源上相当轻盈，并允许你自定义颜色、效果和字体。

##### 如何安装 Cool Retro Terminal？

你可以在其 [GitHub 页面][27] 中找到所有主流 Linux 发行版的安装说明。对于基于 Ubuntu 的发行版，你可以在终端中输入以下内容：

```
sudo apt install cool-retro-term
```

#### 8、Alacritty

![][28]

主要亮点：

  * 跨平台
  * 选项丰富，重点是整合。

[Alacritty][29] 是一款有趣的开源跨平台终端仿真器。尽管它被认为是处于“测试”阶段的东西，但它仍然可以工作。

它的目标是为你提供广泛的配置选项，同时考虑到性能。例如，使用键盘点击 URL、将文本复制到剪贴板、使用 “Vi” 模式进行搜索等功能可能会吸引你去尝试。

你可以探索它的 [GitHub 页面][29] 了解更多信息。

##### 如何安装 Alacritty？

官方 GitHub 页面上说可以使用包管理器安装 Alacritty，但我在 Linux Mint 20.1 的默认仓库或 [synaptic 包管理器][30] 中找不到它。

如果你想尝试的话，可以按照 [安装说明][31] 来手动设置。

#### 9、Konsole

![][32]

主要亮点：

  * KDE 的终端
  * 轻巧且可定制

如果你不是新手，这个可能不用介绍了。[Konsole][33] 是 KDE 桌面环境的默认终端仿真器。

不仅如此，它还集成了很多 KDE 应用。即使你使用的是其他的桌面环境，你也可以试试 Konsole。它是一个轻量级的终端仿真器，拥有众多的功能。

你可以拥有多个标签和多个分组窗口。以及改变终端仿真器的外观和感觉的大量的自定义选项。

##### 如何安装 Konsole？

对于基于 Ubuntu 的发行版和大多数其他发行版，你可以使用默认的版本库来安装它。对于基于 Debian 的发行版，你只需要在终端中输入以下内容：

```
sudo apt install konsole
```

#### 10、GNOME 终端

![][34]

主要亮点：

  * GNOME 的终端
  * 简单但可定制

如果你使用的是任何基于 Ubuntu 的 GNOME 发行版，它已经是天生的了，它可能不像 Konsole 那样可以自定义，但它可以让你轻松地配置终端的大部分重要方面。它可能不像 Konsole 那样可以自定义（取决于你在做什么），但它可以让你轻松配置终端的大部分重要方面。

总的来说，它提供了良好的用户体验和易于使用的界面，并提供了必要的功能。

如果你好奇的话，我还有一篇 [自定义你的 GNOME 终端][12] 的教程。

##### 如何安装 GNOME 终端？

如果你没有使用 GNOME 桌面，但又想尝试一下，你可以通过默认的软件仓库轻松安装它。

对于基于 Debian 的发行版，以下是你需要在终端中输入的内容：

```
sudo apt install gnome-terminal
```

### 总结

有好几个终端仿真器。如果你正在寻找不同的用户体验，你可以尝试任何你喜欢的东西。然而，如果你的目标是一个稳定的和富有成效的体验，你需要测试一下，然后才能依靠它们。

对于大多数用户来说，默认的终端仿真器应该足够好用了。但是，如果你正在寻找快速访问（Quake 模式）、平铺功能或在一个终端中的多个窗口，请试试上述选择。

你最喜欢的 Linux 终端仿真器是什么？我有没有错过列出你最喜欢的？欢迎在下面的评论中告诉我你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/linux-terminal-emulators/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/03/terminator-terminal.jpg?resize=800%2C436&ssl=1
[2]: https://gnome-terminator.org
[3]: https://github.com/gnome-terminator/terminator
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/guake-terminal-2.png?resize=800%2C432&ssl=1
[5]: https://itsfoss.com/guake-terminal/
[6]: https://github.com/Guake/guake
[7]: https://guake.readthedocs.io/en/latest/user/installing.html#system-wide-installation
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/03/tilix-screenshot.png?resize=800%2C460&ssl=1
[9]: https://itsfoss.com/tilix-terminal-emulator/
[10]: https://gnunn1.github.io/tilix-web/
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/linux-terminal-customization.jpg?fit=800%2C450&ssl=1
[12]: https://itsfoss.com/customize-linux-terminal/
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/03/hyper-screenshot.png?resize=800%2C527&ssl=1
[14]: https://github.com/vercel/hyper
[15]: https://hyper.is/
[16]: https://hyper.is/#installation
[17]: https://itsfoss.com/install-deb-files-ubuntu/
[18]: https://itsfoss.com/install-rpm-files-fedora/
[19]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/03/tilda-terminal.jpg?resize=800%2C427&ssl=1
[20]: https://github.com/lanoxx/tilda
[21]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/edex-ui-screenshot.png?resize=800%2C450&ssl=1
[22]: https://itsfoss.com/edex-ui-sci-fi-terminal/
[23]: https://github.com/GitSquared/edex-ui
[24]: https://itsfoss.com/aur-arch-linux/
[25]: https://github.com/GitSquared/edex-ui/releases
[26]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2015/10/cool-retro-term-1.jpg?resize=799%2C450&ssl=1
[27]: https://github.com/Swordfish90/cool-retro-term
[28]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/03/alacritty-screenshot.png?resize=800%2C496&ssl=1
[29]: https://github.com/alacritty/alacritty
[30]: https://itsfoss.com/synaptic-package-manager/
[31]: https://github.com/alacritty/alacritty/blob/master/INSTALL.md#debianubuntu
[32]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/konsole-screenshot.png?resize=800%2C512&ssl=1
[33]: https://konsole.kde.org/
[34]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/default-terminal.jpg?resize=773%2C493&ssl=1
