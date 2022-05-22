[#]: subject: (How to Make LibreOffice Look Like Microsoft Office)
[#]: via: (https://www.debugpoint.com/2021/06/libreoffice-like-microsoft-office/)
[#]: author: (Arindam https://www.debugpoint.com/author/admin1/)
[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14412-1.html)

如何使 LibreOffice 看起来像微软 Office
======

![](https://img.linux.net.cn/data/attachment/album/202203/29/224638h4k4bg561ix4qnb6.jpg)

> 我们做了一次尝试，使 LibreOffice 套件看起来像微软 Office。能做到吗？让我们来看看。

[LibreOffice][1] 是一个自由开源的办公生产力套件，它向你提供了一套完整的应用程序集合。它包含文字处理器（Writer）、电子表格程序（Calc）、演示程序（Impress）和 绘图程序（Draw）。它还为你提供了一个独立的数据库系统（LibreOffice Base），以及 LibreOffice Math 是一个帮助学生、研究人员编写公式和方程的程序。

然而，广泛使用的 [微软 Office][2] 是一个付费的办公生产力套件，提供了优秀的程序来完成几乎所有的关于学习、办公和企业应用的任务。

这两组程序套件是不同的，但是它们在功能方面的目标是相同的。由于它的流行，微软 Office 被广泛的使用，并被使用者熟知。不过，这里有很多使用者更喜欢免费的 LibreOffice 来支撑他们的工作和活动。与微软 Office 相比，采用 LibreOffice 有时会很困难 —— 尽管大多数的菜单项和工具都是一样的。

尽管如此，如果你可以使 LibreOffice 看起来像微软 Office ，那么，对于初次使用 LibreOffice 的用户来说会更容易接纳，他们大多数是有使用微软 Office 的经历背景的用户。外观和感受在用户的头脑中起着重要的作用，也包含他们的肌肉记忆和对颜色、菜单项的熟悉度。

当然，你不可能使它完全像微软 Office，因为它们使用了不同的图标、字体等等。不过，你可以将其微调到一定程度。

### 使 LibreOffice 看起来像微软 Office

这篇指南是以 LibreOffice 7.2（开发版）版本为基础所编写的。

#### 1、用户界面的变化

LibreOffice 有一个名为“标签栏” 的 “<ruby>功能区<rt>Ribbon</rt></ruby>” 式工具栏。尽管它带有多种工具栏变体（如下）。但是，对于这篇指南，我使用 <ruby>标签式<rt>Tabbed</rt></ruby> 工具栏选项。

  * 打开 LibreOffice 并转到 “<ruby>菜单<rt>Menu</rt></ruby> > <ruby>视图<rt>View</rt></ruby> > <ruby>用户界面<rt>User Interface</rt></ruby>”。
  * 从 UI 部分中选择 “<ruby>标签式<rt>Tabbed</rt></ruby>” 。

    ![tabbed bar option][3]

  * 点击 “<ruby>应用于全部<rt>Apply to All</rt></ruby>” 。LibreOffice 也提供一个选项，可以将特定的工具栏样式应用到 Writer 或 Calc。如果你想要一种不同的工具栏样式，你可以选择这种方法。但是，我推荐使用应用于全部来使其保持一致。
  * 现在，你已经有了微软 Office 样式的功能区。尽管它们并不是完全相同，但是你也能体会到它的感受。

#### 2、适用于 LibreOffice 的微软 Office 图标

工具栏中的图标在你的工作流中起着重要的作用。LibreOffice 为你的工具栏提供一些漂亮的图标。其中最好的一些是：

  * Karasa Jaga
  * Colibre
  * Elementary

针对这篇指南，我们将使用 [Office 2013 图标集][4]，它是由一名作家开发的，可以在 Devian Art 中获得。

  * 转到下面的链接并下载 LibreOffice 扩展文件（*.oxt），对于 LibreOffice 的较新版本，你需要使用扩展文件来安装图标集。
    - [下载适用于 libreoffice 的 Office 2013 图标集][5]
  * 在下载后，双击 .oxt 文件来将其打开。或者，按下 `CTRL+ALT+E` 组合按键来打开扩展管理器，并使用 “<ruby>添加<rt>Add</rt></ruby>” 按钮来选择已下载的 .oxt 文件。在完成后关闭窗口。
  
    ![Import icon sets in Extension Manager][6]
  
  * 现在，转到 “<ruby>工具<rt>Tools</rt></ruby> > <ruby>选项<rt>Options</rt></ruby> > <ruby>视图<rt>View</rt></ruby>”。从“<ruby>图标样式<rt>Icon Style</rt></ruby>”中选择 “Office 2013” 。
  * 通过 “<ruby>图标大小<rt>Icon Size</rt></ruby> > <ruby>笔记本栏<rt>Notebookbar</rt></ruby> > <ruby>大<rt>Large</rt></ruby>” 来更改图标大小。如果你感觉图标有点小，你可以更改它们。不过，我觉得要使它更像 Office ，将图标设置的较大一点的效果会更好。

    ![Change icons in Options][7]

就这样，你的 LibreOffice 应该看起来像这样：

![在 KDE Plasma 中让 LibreOffice 看起来像微软 Office][9]

![在 Windows 10 中让 LibreOffice 看起来像微软 Office][10]

![在 GNOME 中让 LibreOffice 看起来像微软 Office][11]

注意，如果你正在使用 Ubuntu、KDE Plasma，或者任何 Linux 发行版，它们的外观可能会有所不同。但是，在我看来，在 KDE Plasma 中比在 GNOME 中看起来更像微软 Office 。LibreOffice 目前在基于 GTK 的系统中看起来并不太好。

不过，在 Windows 中，它看起来会更像，因为它使用同一个系统的字体和颜色面板。

这些是你可以使用的一些设置，不过，你可以随心所欲地自由调整更多的定制、图标和主题。如果你喜欢 LibreOffice 的深色模式，你可能想要阅读我们的教程 – [如何在 LibreOffice 中启用深色模式][12]。

### 结束语

微软 Office 毫无疑问是办公生产力领域的市场领导者。这是有原因的，它来自数十年的开发。它不是免费的产品，事实上，最新的 Office 365 家庭版本的价格大约是 7 美元/月，可以在 3 到 4 台设备上使用。在我看来，它有点小贵。

然而 LibreOffice 是免费的，由文档基金会领导的社区开发。因此，开发速度较慢、功能出现也较晚。它并不是要成为微软 Office ，而是要给数以百万计的用户、学校、非营利组织、高校、学生一个使用免费办公套件工作和学习的机会。

因此，如果它能够模仿基本的外观和感受，使其像微软 Office 一样，从而调高 LibreOffice 的使用率，那将是有益的。我希望这篇指南能在这个方向上能起到一点作用。

- [链接: LibreOffice 和 Microsoft Office 的官方功能比较][13]

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/06/libreoffice-like-microsoft-office/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: http://libreoffice.com
[2]: http://office.com
[3]: https://www.debugpoint.com/blog/wp-content/uploads/2021/06/tabbed-bar-option.jpg
[4]: https://www.deviantart.com/charliecnr/art/Office-2013-theme-for-LibreOffice-512127527
[5]: https://www.deviantart.com/users/outgoing?https://1drv.ms/u/s!ArgKmgFcmBYHhSQkPfyMZRnXX5LJ
[6]: https://www.debugpoint.com/blog/wp-content/uploads/2021/06/Import-icon-sets-in-Extension-Manager.jpg
[7]: https://www.debugpoint.com/blog/wp-content/uploads/2021/06/Change-icons-in-Options-1024x574.jpg
[8]: https://www.debugpoint.com/2021/05/libreoffice-7-2/
[9]: https://www.debugpoint.com/blog/wp-content/uploads/2021/06/Making-LibreOffice-look-like-Microsoft-Office-in-KDE-Plasma-1024x441.jpg
[10]: https://www.debugpoint.com/blog/wp-content/uploads/2021/06/Making-LibreOffice-look-like-Microsoft-Office-in-Windows-10-1024x554.jpg
[11]: https://www.debugpoint.com/blog/wp-content/uploads/2021/06/Making-LibreOffice-look-like-Microsoft-Office-in-GNOME-1024x498.jpg
[12]: https://www.debugpoint.com/2020/01/how-to-enable-dark-mode-libreoffice/
[13]: https://wiki.documentfoundation.org/Feature_Comparison:_LibreOffice_-_Microsoft_Office
