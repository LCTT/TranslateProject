[#]: subject: "How I use Linux accessibility settings"
[#]: via: "https://opensource.com/article/22/1/linux-accessibility-settings"
[#]: author: "Don Watkins https://opensource.com/users/don-watkins"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14244-1.html"

我如何使用 Linux 的无障碍设置
======

> 不同的 Linux 系统以不同的方式处理辅助技术。 这里是一些对视觉、听觉、打字等有用的设置。 

![](https://img.linux.net.cn/data/attachment/album/202202/05/140415a3ljitj3zbhulhqk.jpg)

当我在 20 世纪 90 年代开始使用 Linux 时，我已经 40 多岁了，<ruby>无障碍性<rt>accessibility</rt></ruby>不是我非常关注的问题。然而现在，当我快到 70 岁时，我的需求已经改变了。几年前，我从 System76 购买了一个全新的 Darter Pro，它的默认分辨率是 1920x1080，而且也是高 DPI。系统附带了 Pop!_OS，我发现我必须修改它才能看到显示屏上的图标和文字。谢天谢地，桌面上的 Linux 已经变得比 90 年代更容易使用了。

我需要辅助技术，特别是在视觉和听觉方面。还有一些我不使用的领域，但对需要帮助打字、指点、点击和手势的人来说是有用的。

不同的系统，如 Gnome、KDE、LXDE、XFCE 和其他系统，对这些辅助技术的处理方式不同。这些辅助性的调整大多可以通过 “<ruby>设置<rt>Settings</rt></ruby>” 对话框或键盘快捷键来实现。

### 文字显示

我需要帮助来显示较大的文字，在我的 Linux Mint Cinnamon 桌面上，我使用这些设置：

![accessibility options - visual][2]

我还发现 Gnome “<ruby>优化<rt>Tweaks</rt></ruby>” 可以让我对桌面体验的文字显示大小进行微调。我把我的显示器的分辨率从默认的 1920x1080 调整到更舒适的 1600x900。以下是我的布局设置：

![accessibility options - display][3]

### 键盘支持

我不需要键盘支持，但它们是现成支持的，如下图所示：

![accessibility options - keyboard][4]

### 更多无障碍选项

在 Fedora 35 上，无障碍访问也是熟悉的。打开 “<ruby>设置<rt>Settings</rt></ruby>” 菜单，选择让 “<ruby>总是显示无障碍菜单<rt>Always show Accessibility Menu</rt></ruby>” 图标在桌面上可见。我通常会切换 “<ruby>大字体<rt>Large Text</rt></ruby>”，除非我在一个大显示器上。还有许多其他选项，包括 “<ruby>缩放<rt>Zoom</rt></ruby>”、“<ruby>屏幕阅读器<rt>Screen Reader</rt></ruby>” 和 “<ruby>声音键<rt>Sound Keys</rt></ruby>”。这里有一些：

![accessibility options - settings][5]

当在 Fedora 的 “<ruby>设置<rt>Settings</rt></ruby>” 菜单中启用了 “<ruby>无障碍菜单<rt>Accessibility Menu</rt></ruby>”，就很容易从右上角的图标中切换其他功能：

![accessibility options - desktop][6]

有一些 Linux 发行版是专门为需要无障碍支持的人设计的。[Accessible Coconut][7] 就是这样一个发行版。Coconut 基于 Ubuntu Mate 20.04，并默认启用了屏幕阅读器。它装载了 Ubuntu Mate 的默认应用。Accessible Coconut 是 [Zendalona][8] 的作品，该公司专门开发自由开源的无障碍应用。他们所有的应用都是以 GPL 2.0 许可证发布的，包括 [iBus-Braille][9]。该发行版包括屏幕阅读器、各种语言的打印阅读、六键输入、打字辅导、放大器、电子书扬声器等等。

![accessibility options - desktop][10]

[Gnome 无障碍套件][11] 是一个开源软件库，是 Gnome 项目的一部分，为实现无障碍功能提供 API。你可以通过访问他们的维基来参与 [Gnome 无障碍团队][12]。KDE 也有一个 [无障碍项目][13] 和一个支持该项目的 [应用][14] 列表。你可以通过访问他们的 [维基][15] 来参与 KDE 无障碍项目。[XFCE][16] 也为用户提供了相关资源。[Fedora 项目维基][17] 也有一个可以安装在操作系统上的无障碍应用的列表。

### Linux 适合所有人

自 20 世纪 90 年代以来，Linux 已经有了长足的进步，其中一个很大的进步就是对无障碍的支持。很高兴知道随着 Linux 用户的不断变化，操作系统也可以和我们一起变化，并做出许多不同的支持选项。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/linux-accessibility-settings

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://opensource.com/sites/default/files/accessibility-visualpng.png (accessibility options - visual)
[3]: https://opensource.com/sites/default/files/display.png (accessibility options - display)
[4]: https://opensource.com/sites/default/files/keyboard_0.png (accessibility options - keyboard)
[5]: https://opensource.com/sites/default/files/settings.png (accessibility options - settings)
[6]: https://opensource.com/sites/default/files/desktop.png (accessibility options - desktop)
[7]: https://zendalona.com/accessible-coconut/
[8]: https://zendalona.com/
[9]: https://github.com/zendalona/ibus-braille
[10]: https://opensource.com/sites/default/files/desktop2.png (accessibility options - desktop)
[11]: https://en.wikipedia.org/wiki/Accessibility_Toolkit
[12]: https://wiki.gnome.org/Accessibility
[13]: https://community.kde.org/Accessibility#KDE_Accessibility_Project
[14]: https://userbase.kde.org/Applications/Accessibility
[15]: https://community.kde.org/Get_Involved/accessibility
[16]: https://docs.xfce.org/xfce/xfce4-settings/accessibility
[17]: https://fedoraproject.org/wiki/Docs/Beats/Accessibility#Using_Fedora.27s_Accessibility_Tools