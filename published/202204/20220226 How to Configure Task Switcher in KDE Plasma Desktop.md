[#]: subject: "How to Configure Task Switcher in KDE Plasma Desktop"
[#]: via: "https://www.debugpoint.com/2022/02/configure-task-switcher-kde/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14450-1.html"

如何在 KDE Plasma 桌面上配置任务切换器
======

> 本指南解释了如何在 KDE Plasma 桌面中配置任务切换器。

![Configure KDE Plasma Task Switcher][1]

### 什么是任务切换器？

[任务切换器][2] 是一个帮助你在当前桌面会话中切换打开的窗口或应用的组件。通常，当你按下 `Alt+Tab` 时，它会显示为一个图标列表。

![Thumbnail Grid Task Switcher][3]

而这在 KDE Plasma 中是可以根据你的具体需要高度配置的。你可以定制它的外观、图标的排序、相同应用的分组等等。

### 改变 KDE Plasma 的任务切换器选项

打开“<ruby>系统设置<rt>System Settings</rt></ruby>”。在“<ruby>工作区<rt>Workspace</rt></ruby>”组下，点击“<ruby>窗口管理<rt>Window Management</rt></ruby> > <ruby>任务切换器<rt>Task Switcher</rt></ruby>”。

在<ruby>主<rt>Main</rt></ruby>标签上，<ruby>可视化<rt>Visualisation</rt></ruby>部分有一个下拉菜单。这个下拉菜单包含几个任务切换器选项，你可以尝试一下。

选择你喜欢的选项并点击“预览”按钮。如果你感到满意，那么你可以点击“<ruby>应用<rt>Apply</rt></ruby>”按钮。

![Configure Task Switcher in KDE][4]

这就是如何改变 KDE Plasma 桌面中的任务切换器的方法。

### 替代切换器

<ruby>替代<rt>Alternative</rt></ruby>选项卡也包含同样的任务切换器的可视化选项。然而，你可以为替代方案配置集设置 `Alt+Tab` 以外的不同组合键。这样，你可以同时体验两组不同组合的任务切换器。

### 可视化

截至编写本指南时的 [KDE Plasma 5.24][5]，有以下不同的任务切换器：

  * Breeze
  * Breeze Dark
  * Breeze Twilight
  * Compact
  * Fedora
  * Grid
  * Informative
  * large Icons
  * Small Icons
  * Text Only
  * Thumbnail Grid
  * Thumbnails

下面是上述任务切换器的截图。

![][6]

![][7]

![][8]

![][9]

![][10]

![][11]

![][12]

![][13]

![][14]

现在，这就是 KDE Plasma 桌面中任务切换器的基本配置。现在我将解释它在以下情况下是如何表现的。

### 多显示器或显示屏中的任务切换器

如果你有一个多显示器（显示屏）环境，你不需要做任何事情。任务切换器将根据你的鼠标光标所在的位置显示出来。这意味着它将显示在活动显示器上。

### 任务切换器与相同的应用分组

你也可以在任务切换器中对相同的应用图标进行分组，以保持其简单明了。例如，如果你打开了多个 Dolphin 文件管理器实例，你可以选择下面的选项，在任务切换器的可视化中只出现一次 Dolphin 图标。

![Same application grouping][16]

但你可能想知道如果只出现一次，如何在相同的应用实例中切换。你可以通过任务切换器中的 `Alt+\``（默认值）来切换相同的应用。下面是你可以根据你的需要和工作来改变的选项。

### 下载更多的任务切换器

如果你对上述所有的选项不满意，你可以通过同一个设置窗口从 KDE 商店下载更多的任务切换器。

点击上图标注 ❺ 的 “<ruby>获取新的任务切换器<rt>Get New Task Switchers</rt></ruby>” ，选择你最喜欢的一个。然后点击“<ruby>安装<rt>Install</rt></ruby>”。完成安装后，回到主设置窗口，应用新下载的可视化。

记住，这些额外的项目是用户贡献的，在某些情况下可能会破坏你当前的主题，所以要慎重使用。在任何时候，你都可以点击重置按钮，回到原来的任务切换器视觉效果。

### 结束语

我希望这篇指南能帮助你在 KDE Plasma 桌面上设置一个漂亮而有效的任务切换器。正如我所说的，自定义选项很多，你可以随意发挥。

感谢阅读。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/02/configure-task-switcher-kde/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/wp-content/uploads/2022/02/kdetaskw1-1024x576.jpg
[2]: https://docs.kde.org/trunk5/en/kwin/kcontrol/kwintabbox/index.html
[3]: https://www.debugpoint.com/wp-content/uploads/2022/02/Thumbnail-Grid-1024x177.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/02/Configure-Task-Switcher-in-KDE-1024x652.jpg
[5]: https://www.debugpoint.com/2022/01/kde-plasma-5-24/
[6]: https://www.debugpoint.com/wp-content/uploads/2022/02/Thumbnails-150x150.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2022/02/Thumbnail-Grid-150x150.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2022/02/Text-Only-150x150.jpg
[9]: https://www.debugpoint.com/wp-content/uploads/2022/02/Small-Icons-150x108.jpg
[10]: https://www.debugpoint.com/wp-content/uploads/2022/02/Large-Icons-150x150.jpg
[11]: https://www.debugpoint.com/wp-content/uploads/2022/02/Informative-150x150.jpg
[12]: https://www.debugpoint.com/wp-content/uploads/2022/02/Grid-Task-Switcher-150x150.jpg
[13]: https://www.debugpoint.com/wp-content/uploads/2022/02/Compact-Task-Switcher-150x150.jpg
[14]: https://www.debugpoint.com/wp-content/uploads/2022/02/Breeze-Task-Switcher-150x150.jpg
[16]: https://www.debugpoint.com/wp-content/uploads/2022/02/Same-application-grouping.jpg
[17]: https://t.me/debugpoint
[18]: https://twitter.com/DebugPoint
[19]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[20]: https://facebook.com/DebugPoint
