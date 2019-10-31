[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11523-1.html)
[#]: subject: (10 Ways to Customize Your Linux Desktop With GNOME Tweaks Tool)
[#]: via: (https://itsfoss.com/gnome-tweak-tool/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

使用 GNOME 优化工具自定义 Linux 桌面的 10 种方法
======


![][7]

你可以通过多种方法来调整 Ubuntu，以自定义其外观和行为。我发现最简单的方法是使用 [GNOME 优化工具][2]。它也被称为 GNOME Tweak 或简单地称为 Tweak（优化）。

在过去的教程中，我已经多次介绍过它。在这里，我列出了你可以使用此工具执行的所有主要优化。

我在这里使用的是 Ubuntu，但是这些步骤应该适用于使用 GNOME 桌面环境的任何 Linux 发行版。

### 在 Ubuntu 18.04 或其它版本上安装 GNOME 优化工具

GNOME 优化工具可从 [Ubuntu 中的 Universe 存储库][3]中安装，因此请确保已在“软件和更新”工具中启用了该仓库：

![在 Ubuntu 中启用 Universe 存储库][4]

之后，你可以从软件中心安装 GNOME 优化工具。只需打开软件中心并搜索 “GNOME Tweaks” 并从那里安装它：

![从软件中心安装 GNOME 优化工具][5]

或者，你也可以使用命令行通过 [apt 命令][6]安装此软件：

```
sudo apt install gnome-tweaks
```

### 用优化工具定制 GNOME 桌面

GNOME 优化工具使你可以进行许多设置更改。其中的某些更改（例如墙纸更改、启动应用程序等）也可以在官方的“系统设置”工具中找到。我将重点介绍默认情况下“设置”中不可用的优化。

#### 1、改变主题

你可以通过各种方式[在 Ubuntu 中安装新主题][8]。但是，如果要更改为新安装的主题，则必须安装GNOME 优化工具。

你可以在“<ruby>外观<rt>Appearance</rt></ruby>”部分找到主题和图标设置。你可以浏览可用的主题和图标并设置你喜欢的主题和图标。更改将立即生效。

![通过 GNOME 优化更改主题][9]

#### 2、禁用动画以提速你的桌面体验

应用程序窗口的打开、关闭、最大化等操作都有一些细微的动画。你可以禁用这些动画以稍微加快系统的速度，因为它会稍微使用一点资源。

![禁用动画以获得稍快的桌面体验][10]

#### 3、控制桌面图标

至少在 Ubuntu 中，你会在桌面上看到“<ruby>家目录<rt>Home</rt></ruby>”和“<ruby>垃圾箱<rt>Trash</rt></ruby>”图标。如果你不喜欢，可以选择禁用它。你还可以选择要在桌面上显示的图标。

![在 Ubuntu 中控制桌面图标][11]

#### 4、管理 GNOME 扩展

我想你可能知道 [GNOME 扩展][12]。这些是用于桌面的小型“插件”，可扩展 GNOME 桌面的功能。有[大量的 GNOME 扩展][13]，可用于在顶部面板中查看 CPU 消耗、获取剪贴板历史记录等等。

我已经写了一篇[安装和使用 GNOME 扩展][14]的详细文章。在这里，我假设你已经在使用它们，如果是这样，可以从 GNOME 优化工具中对其进行管理。

![管理 GNOME 扩展][15]

#### 5、改变字体和缩放比例

你可以[在 Ubuntu 中安装新字体][16]，并使用这个优化工具在系统范围应用字体更改。如果你认为桌面上的图标和文本太小，也可以更改缩放比例。

![更改字体和缩放比例][17]

#### 6、控制触摸板行为，例如在键入时禁用触摸板，使触摸板右键单击可以工作

GNOME 优化工具还允许你在键入时禁用触摸板。如果你在笔记本电脑上快速键入，这将很有用。手掌底部可能会触摸触摸板，并导致光标移至屏幕上不需要的位置。

在键入时自动禁用触摸板可解决此问题。

![键入时禁用触摸板][18]

你还会注意到[当你按下触摸板的右下角以进行右键单击时，什么也没有发生][19]。你的触摸板并没有问题。这是一项系统设置，可对没有实体右键按钮的任何触摸板（例如旧的 Thinkpad 笔记本电脑）禁用这种右键单击功能。两指点击可为你提供右键单击操作。

你也可以通过在“<ruby>鼠标单击模拟<rt>Mouse Click Simulation</rt></ruby>”下设置为“<ruby>区域<rt>Area</rt></ruby>”中而不是“<ruby>手指<rt>Fingers</rt></ruby>”来找回这项功能。

![修复右键单击问题][20]

你可能必须[重新启动 Ubuntu][21] 来使这项更改生效。如果你是 Emacs 爱好者，还可以强制使用 Emacs 键盘绑定。

#### 7、改变电源设置

电源这里只有一个设置。它可以让你在盖上盖子后将笔记本电脑置于挂起模式。

![GNOME 优化工具中的电源设置][22]

#### 8、决定什么显示在顶部面板

桌面的顶部面板显示了一些重要的信息。在这里有日历、网络图标、系统设置和“<ruby>活动<rt>Activities</rt></ruby>”选项。

你还可以[显示电池百分比][23]、添加日期及时间，并显示星期数。你还可以启用鼠标热角，以便将鼠标移至屏幕的左上角时可以获得所有正在运行的应用程序的活动视图。

![GNOME 优化工具中的顶部面板设置][24]

如果将鼠标焦点放在应用程序窗口上，你会注意到其菜单显示在顶部面板中。如果你不喜欢这样，可以将其关闭，然后应用程序菜单将显示应用程序本身。

#### 9、配置应用窗口

你可以决定是否在应用程序窗口中显示最大化和最小化选项（右上角的按钮）。你也可以改变它们的位置到左边或右边。

![应用程序窗口配置][25]

这里还有其他一些配置选项。我不使用它们，但你可以自行探索。

#### 10、配置工作区

GNOME 优化工具还允许你围绕工作区配置一些内容。

![在 Ubuntu 中配置工作区][26]

### 总结

对于任何 GNOME 用户，GNOME 优化（Tweaks）工具都是必备工具。它可以帮助你配置桌面的外观和功能。 我感到惊讶的是，该工具甚至没有出现在 Ubuntu 的主存储库中。我认为应该默认安装它，要不，你就得在 Ubuntu 中手动安装 GNOME 优化工具。

如果你在 GNOME 优化工具中发现了一些此处没有讨论的隐藏技巧，为什么不与大家分享呢？

--------------------------------------------------------------------------------

via: https://itsfoss.com/gnome-tweak-tool/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/10/gnome-tweak-tool-icon.png?ssl=1
[2]: https://wiki.gnome.org/action/show/Apps/Tweaks?action=show&redirect=Apps%2FGnomeTweakTool
[3]: https://itsfoss.com/ubuntu-repositories/
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/03/enable-repositories-ubuntu.png?ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/10/install-gnome-tweaks-tool.jpg?ssl=1
[6]: https://itsfoss.com/apt-command-guide/
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/10/customize-gnome-with-tweak-tool.jpg?ssl=1
[8]: https://itsfoss.com/install-themes-ubuntu/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/10/change-theme-ubuntu-gnome.jpg?ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/10/disable-animation-ubuntu-gnome.jpg?ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/10/desktop-icons-ubuntu.jpg?ssl=1
[12]: https://extensions.gnome.org/
[13]: https://itsfoss.com/best-gnome-extensions/
[14]: https://itsfoss.com/gnome-shell-extensions/
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/10/manage-gnome-extension-tweaks-tool.jpg?ssl=1
[16]: https://itsfoss.com/install-fonts-ubuntu/
[17]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/10/change-fonts-ubuntu-gnome.jpg?ssl=1
[18]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/10/disable-touchpad-while-typing-ubuntu.jpg?ssl=1
[19]: https://itsfoss.com/fix-right-click-touchpad-ubuntu/
[20]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/10/enable-right-click-ubuntu.jpg?ssl=1
[21]: https://itsfoss.com/schedule-shutdown-ubuntu/
[22]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/10/power-settings-gnome-tweaks-tool.jpg?ssl=1
[23]: https://itsfoss.com/display-battery-ubuntu/
[24]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/10/top-panel-settings-gnome-tweaks-tool.jpg?ssl=1
[25]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/10/windows-configuration-ubuntu-gnome-tweaks.jpg?ssl=1
[26]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/10/configure-workspaces-ubuntu.jpg?ssl=1
