[#]: subject: "GNOME 43: Top New Features and Release Wiki"
[#]: via: "https://www.debugpoint.com/gnome-43/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15071-1.html"

GNOME 43 发布，标志性的版本
======

> 对 GNOME 43 桌面环境的各种功能的介绍，以及它给你的日常需求和工作流程带来的变化和影响。

![通过 GNOME OS 运行的 GNOME 43][1]

这篇文章总结了所有关于 GNOME 43 的必要信息，包括功能、发布时间表等等。GNOME 43 版本可能是自 GNOME 40 以来在功能和对你的工作流程影响最大的一个版本。

主要的变化包括更新的 Shell 和更快的性能，内含了 GTK4 和 libadwaita 的转换，翻新的文件应用和 Web 应用的奇妙变化。

所有这些必要的变化都是早该进行的，并将改变你在 GNOME 桌面上的传统工作流程，使你的工作效率更高。

### 时间表

GNOME 43 于 2022 年 9 月 21 日 [正式发布][2]。

* GNOME 43 测试版：2022 年 8 月 31 日
* GNOME 43 候选版：2022 年 9 月 4 日
* GNOME 43 最终版：2022 年 9 月 21 日

### GNOME 43 的功能

#### 1、核心 Shell 的变化

* 终于，得益于 Wayland 最近的工作，GNOME 有了对高分辨率的滚轮支持。所以，如果你有一个高分辨率的显示器，用一个高级的鼠标（比如罗技 MX Master 3）来滚动应该成为了一种享受。
* 除了上述情况，GNOME 43 中的<ruby>直接扫描输出<rt>direct scanout</rt></ruby> 支持将有助于多显示器环境。
* 服务器端的窗口装饰得到了基本的颜色支持。
* Shell 还实现了一个功能，当焦点改变时，通知会消失，并不等待超时。
* 和每个版本一样，你在整个桌面上会体验到更好的动画性能，改进了网格和概览导航以及关键的更新，这给你带来了顺滑的体验。

这些就是核心变化的关键总结。现在，让我们来谈谈快速设置。

#### 2、新的快速设置菜单

系统托盘中的快速设置完全改变了。快速设置项目和菜单现在采用药丸状的切换按钮，用鲜艳的颜色来显示系统中正在发生的事情。该菜单也是动态的，并支持层叠的菜单项目。此外，你可以在快速设置中选择音频设备。

这里有一个快速演示，更多的屏幕截图和文章，请阅读：[GNOME 43 快速设置][3]。

![GNOME 43 的快速设置演示][4]

#### 3. 文件应用

GNOME <ruby>文件应用<rt>Files</rt></ruby>在 GNOME 43 版本中增加了很多功能。这个应用程序的改进清单非常巨大。文件管理器是任何桌面环境中使用最多的应用程序。因此，文件应用中的变化对整个用户群的影响最大。

这是 GTK4 版的文件应用第一次亮相（它在 GNOME 42 发布时还没有准备好），它将会彻底改变你的工作流程。

我将尝试用一个简短的列表来解释其中的大部分内容。否则，这将是一篇冗长的文章。我将单独推送另一篇关于文件应用的功能的文章。

##### 自适应侧边栏

可以让你访问导航、收藏夹、网络驱动器等的文件应用侧边栏是响应式的。当文件应用窗口的大小达到一定程度时，它会 [自动隐藏][5] 自己。如果你工作时有很多打开的窗口，而且显示器较小，那么这是一个熟悉而方便的功能。

另一个令人兴奋的功能是，当侧边栏完全隐藏时，在左上方会出现一个图标，点击可使其可见。

![自动隐藏侧边栏的文件应用 43][6]

##### 徽章

很久以前，GNOME 中就有了徽章，后来它们消失了。因此，徽章在 GNOME 43 中以文件和目录旁边的小图标的形象卷土重来。这些图标代表着类型，如符号链接、只读等。此外，这些图标会根据你的主题改变它们的颜色，而且一个文件也可以有多个图标。

![GNOME 43 中的徽章][7] 

##### 橡皮筋选择

接下来是期待已久的橡皮筋选择功能，它 [终于到来了][8]。现在你可以通过拖动选择机制来选择文件和文件夹。这是用户要求最多的功能之一。

![橡皮筋选择功能][9]

##### GtkColumnView 代替了 GtkTreeView

当你把鼠标放在列视图中的项目上时，你会看到一个焦点行，这是 GNOME 43 文件应用的另一个关键功能。但是它在 [树形视图不能显示][10]，可能计划在下一次迭代中实现。

![GtkColumnView 启用了焦点行][11]

##### 重新设计的属性窗口，具有交互式的权限和可执行文件检测功能

通过采用 GTK4，属性窗口 [完全改变了][12]。该窗口现在更加简洁，设计合理，只在需要的时候显示必要的项目。

此外，属性对话框可以确定文件类型并提供合适的选项。例如，如果你查看一个 Shell 脚本或文本文件的属性，你会得到一个选项，使其可执行。相反，图像文件的属性不会给你一个可执行的选项。

![智能属性窗口][13]

##### 标签式视图的改进

文件的标签式视图得到了一些 [额外的更新][14]。最值得注意的是，当拖动文件到标签时，可以适当地聚焦，在当前聚焦的标签之后创建标签，等等。

##### 重新设计的右键菜单

对文件或文件夹的主要右键菜单进行了分组。首先，打开选项被归入一个子菜单中。其次，复制/粘贴/剪切选项被合并到一个组中。最后，垃圾箱、重命名和压缩选项被归为一组。

此外，“<ruby>在终端打开<rt>Open in terminal</rt></ruby>”的选项对所有文件和文件夹都可用。然而，仍然缺失一个“创建新文件”的选项（这是我在这个版本中所期望的）。（LCTT 译者：预计 GNOME 44 文件应用将出现此功能）

![各种上下文菜单][15]

##### 其他变化

文件应用中其他醒目的变化是垃圾箱图标，以及其他位置（网络驱动器、磁盘）在右键菜单中有了属性菜单。

最后，文件应用的偏好窗口被重新设计，以显示更多的基本项目。重新设计后，普通用户可以很容易地找到适当的文件设置。

#### 4、Web 应用

让我们抽出一些时间来谈谈我们心爱的 Epiphany，又称 GNOME Web，是 GNOME 桌面上基于 WebKit 的原生网页浏览器。

这些更新早就应该开始了，并且终于从这个版本开始出现了。

首先，GNOME Web 现在支持 WebExtension API。它可以让你在网络中下载和安装火狐和谷歌浏览器的扩展。以下是做法：

* 从 Firefox 附加组件或谷歌 Chrome 扩展页面下载任何扩展文件（xpi 或 crx 文件）。
* 点击汉堡菜单，选择<ruby>扩展程序<rt>Extensions</rt></ruby>。
* 最后，点击<ruby>添加<rt>Add</rt></ruby>来安装它们。

WebExtension 的支持是使 Web 应用尽快可用的关键步骤。

其次，可以使用火狐浏览器同步选项，让你通过火狐浏览器账户登录 Web 应用，同步书签和其他浏览器项目。

![使用火狐账户登录 Web 应用][16]

Web 应用中其他值得注意的变化包括对 “查看源代码” 的支持、GTK4 的移植工作和一个更新的 PDF 库（PDF.js 2.13.216）。

Web 应用中仍然缺少的一个关键组件是 [通过 GStreamer 支持WebRTC][17]。一旦这个功能出现，它将是一个适合日常使用的浏览器。

希望有一天，我们都有一个体面的非火狐、非 Chromium 的替代浏览器。

#### 5、设置应用

在 <ruby>设置应用<rt>Settings</rt></ruby> 的窗口中，大部分改进和视觉微调在这个版本中出现。重要的变化包括警报中的 “狗叫声” 在经过长时间的 [有趣的对话][18] 后现在已经消失。

此外，引入了一个新的设备安全面板，日期和时间面板中的时区地图也修改了。

设置窗口的侧边栏也是响应式的，并为你提供自动隐藏功能，如上图所示的文件应用一样。

#### 6、软件应用

GNOME <ruby>软件应用<rt>Software</rt></ruby> 有两个关键的变化。这些变化使你可以在一个页面上查看应用程序的更多信息。

首先，一个新“该作者的其他应用程序”部分，为你提供了一个由当前应用程序的作者编写的应用程序列表。这有助于发现并告诉你应用作者有多受欢迎。

其次，GNOME 43 软件应用现在在一个单独的窗口中为你提供了 Flatpak 应用程序所需的详细权限列表。因此，你可以在安装它们之前确认该应用程序所需权限。

另一个关键的视觉变化是在应用程序概览主页面上新增了 “适用于 Fedora/任何发行版”部分，这需要配置。

![软件应用中的开发者的其他应用程序部分][19]

#### 7、气候变化墙纸

我不确定这个功能是否有了。因为我找不到它，但我听说过它。所以，我想我应该在这里提到它。

这个功能是，GNOME 43 带来了一张背景墙纸，显示了全球温度在几十年间是如何从 [海洋条纹][20] 上升的。该墙纸包含了垂直的彩色编码条，表示低和高的温度。我认为这是一个很好的提示，也是提高人们认识的努力。这是它在 GitLab 中的 [提交][21]。

此外，还有几张新的 [白天和黑夜][22] 的新鲜壁纸。

这就是我可以找到并总结的所有基本变化。除了这些，GNOME 43 还有大量的错误修复、性能改进和代码清理。

Fedora 37 将在发布时采用 GNOME 43，它的某些部分应该在 10 月发布的 Ubuntu 22.10 中出现。

### 总结

GNOME 43 是一个标志性的版本，因为它改变了几个基本的设计，影响了数百万用户的工作流程。快速设置的转变是非常棒的，而且早该如此了。此外，文件应用、Web 应用和设置应用的必要改变将提高你的工作效率。

此外，新功能的到来，同时保持了设计准则和美学的理念。一个好的用户界面需要一个深思熟虑的过程，而开发者在这个版本中做了完美的工作。

所以，差不多就是这样了。这就是 GNOME 43 的内容。如果你打算得到这个更新并想从 KDE 跳到 GNOME，请告诉我！

🗨️请在下面的评论区让我知道你最喜欢的功能。

举杯~

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/gnome-43/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2022/08/GNOME-43-Running-via-GNOME-OS.jpg
[2]: https://debugpointnews.com/gnome-43-release/
[3]: https://www.debugpoint.com/gnome-43-quick-settings/
[4]: https://www.debugpoint.com/?attachment_id=10682
[5]: https://gitlab.gnome.org/GNOME/nautilus/-/merge_requests/877
[6]: https://www.debugpoint.com/?attachment_id=10684
[7]: https://www.debugpoint.com/?attachment_id=10685
[8]: https://gitlab.gnome.org/GNOME/nautilus/-/merge_requests/817
[9]: https://www.debugpoint.com/wp-content/uploads/2022/08/Rubberband-Selection-Feature.gif
[10]: https://gitlab.gnome.org/GNOME/nautilus/-/merge_requests/817
[11]: https://www.debugpoint.com/wp-content/uploads/2022/08/GtkColumnView-enables-row-focus.gif
[12]: https://gitlab.gnome.org/GNOME/nautilus/-/merge_requests/745
[13]: https://www.debugpoint.com/wp-content/uploads/2022/08/Intelligent-properties-window.jpg
[14]: https://gitlab.gnome.org/GNOME/nautilus/-/merge_requests/595
[15]: https://www.debugpoint.com/?attachment_id=10689
[16]: https://www.debugpoint.com/wp-content/uploads/2022/08/Login-to-Web-using-Firefox-account.jpg
[17]: https://twitter.com/_philn_/status/1490391956970684422
[18]: https://discourse.gnome.org/t/dog-barking-error-message-sound/9529/2
[19]: https://www.debugpoint.com/wp-content/uploads/2022/08/Other-APPS-by-developer-section-in-Software.jpg
[20]: https://showyourstripes.info/s/globe/
[21]: https://gitlab.gnome.org/GNOME/gnome-backgrounds/-/commit/a142d5c88702112fae3b64a6d90d10488150d8c1
[22]: https://www.debugpoint.com/custom-light-dark-wallpaper-gnome/
