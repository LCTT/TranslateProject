[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How the Linux desktop has grown)
[#]: via: (https://opensource.com/article/19/8/how-linux-desktop-grown)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)

Linux 桌面成长之旅
======
> 自 1990 年代初以来，Linux 桌面已从简单的窗口管理器发展为完整的桌面。与我们一起来探索 Linux  桌面的历史。

![Person typing on a 1980's computer][1]

我首次安装 Linux 是 1993 年。那时，安装这种操作系统没有太多的选择。早期，许多人只是从别人那里复制一个正在运行的镜像。然后有人想到了一个精巧的主意，创建一个 Linux 的“发行版”，使你可以自定义要安装的软件。那就是 Softlanding Linux 系统（SLS），也是我首次见到了 Linux。

我的 386 PC 虽然内存不多，但也足够了。SLS 1.03 需要 2MB 的内存才能运行，如果要编译程序，则需要 4MB 的内存。如果要运行 X Window 系统，则需要多达 8MB 的内存！而我的电脑正好有足够的内存来运行 X Window 系统。

因为我是在命令行中成长的，图形用户界面对我来说并不是必不可少的。但它确实很方便。我可以在不同的窗口中运行应用程序，并轻松地在任务之间切换。

从我首次体验 Linux 开始，我就迷上了它。从那以后，我一直在台式机上使用 Linux。和许多人一样，我在双引导配置下运行 Linux 已有一段时间，因此我可以跳回到 MS-DOS 和 Windows 来运行某些程序。直到 1998 年，我终于冒了个险，全面投身于 Linux 之中。

在过去的 26 年中，我目睹了 Linux 桌面的成熟。在那段时间里，我还尝试了一种有趣的桌面环境组合，我会在下面通过 Linux 桌面的历史之旅分享它。

### X 和窗口管理器

Linux 上的第一个“桌面”其实不是桌面。相反，它们是运行在 X Window 系统上的“<ruby>窗口管理器<rt>window manager</rt></ruby>”（WM）。X 提供了图形用户界面的基本组件，如在屏幕上创建窗口以及提供键盘和鼠标输入。就其本身而言，X 并没有做太多事情。为了使 X 图形环境能够用起来，你需要一种方法来管理会话中的所有窗口。这就出现了<ruby>窗口管理器<rt>window manager</rt></ruby>。运行 xterm 或 xclock 之类的 X 程序会在一个窗口中打开该程序。窗口管理器会跟踪窗口并进行基本的内部管理，例如让你可以来回移动窗口并将其最小化。其余的事情取决于你自己。你可以通过将程序名列在 `~/ .xinitrc` 文件中以在 X 开始时启动这些程序，但是通常，你会从 xterm 中运行新程序。

在 1993 年，最常见的窗口管理器是 TWM，它的历史可以追溯到 1988 年。TWM 极其简单，仅仅提供了基本的窗口管理功能。

![TWM on SLS 1.05][2]

*SLS 1.05 上的 TWM，显示了 xterm、xclock 和 Emacs 编辑器*

另一个早期的窗口管理器是 OpenLook 虚拟窗口管理器（OLVWM）。OpenLook 是 Sun 微系统公司在 1980 年代开发的图形用户界面，后来又移植到其他 Unix 平台。作为一个*虚拟*窗口管理器，OLVWM 支持多个工作区。

![OLVWM on SLS 1.05][3]

*SLS 1.05 上的 OLVWM，显示了 xterm 和虚拟工作区选择器*

当 Linux 开始流行时，没多久就有人创建出具有更流畅性能和改进界面的新的窗口管理器。这些新的窗口管理器中首先出现的是虚拟窗口管理器 FVWM。FVWM 比 TWM 或 OLVWM 更具现代感。但是，我们仍然没有桌面。

![FVWM on SLS 1.05][4]

*SLS 1.05 上的 FVWM，显示了 xterm 和文件管理器*

以现代的眼光来看，TWM 和 FVWM 可能看起来很普通。但重要的是要想想当时其它图形环境的外观。 Windows 当时的版本看起来也相当简单。Windows 版本 1 到版本 3 使用了一个称为“程序管理器”的普通启动器。

![Windows 3.11][5]

*Windows 3.11，显示程序管理器和记事本编辑器*

1995 年 8 月，微软发布了 Windows 95，改变了现代 PC 桌面的格局。当然，我对此印象深刻。我觉得 Windows 3.x 笨拙而丑陋，但 Windows 95 却流畅而漂亮。更重要的是，我们现在将 Windows 95 视为“ **桌面**”。新的“桌面”隐喻是向前迈出的一大步。你可以在桌面上放置图标——实际上，Windows 95 提供了两个默认的桌面图标，分别是“我的电脑”（用于打开文件管理器）和“回收站”（用于放置以后要删除的文件）。

但是，更重要的是，Windows 95 桌面的意味着*集成*。程序管理器不见了，取而代之的是屏幕底部的任务栏，可让你使用更简单的“开始”菜单启动新程序。任务栏是多功能的，还通过一系列的按钮显示了你正在运行的程序，而托盘显示了时间、扬声器音量和其它简单的控件。你可以在这个新桌面上右键单击任何对象， Windows 95 会为你提供一个上下文相关的菜单，其中包含你可以执行的操作。

![Windows 95][6]

*Windows 95，显示了记事本编辑器*

与以前版本的 Windows 甚至其它 Linux 窗口管理器相比，Windows 95 的界面更加流畅并且易于使用。值得一提的是，Linux 开发人员创建了一个模仿 Windows 95 界面的 FVWM 的新版本。名为 FVWM95 的新窗口管理器仍然不是桌面，但看起来非常漂亮。新的任务栏使你可以使用“开始”菜单启动新的 X 程序。任务栏还使用类似于 Windows 95 的按钮显示了正在运行的程序。

![FVWM95 on Red Hat Linux 5.2][7]

*在 Red Hat Linux 5.2 上的 FVWM95，显示了 xterm 和一个带有 xterm 图标、文件管理器和其他程序的快速访问程序启动器*

在 FVWM95 和其他窗口管理器还在改进的同时，核心问题仍然存在：Linux 并没有真正的桌面。它具有一堆窗口管理器，仅此而已。使用图形用户界面的 Linux 应用程序（基本上意味着它们是 X 应用程序）看起来形态各异且工作方式也不同。除了 X Window 系统提供的简单的纯文本复制/粘贴功能外，你无法从一个应用程序复制和粘贴到另一个应用程序里。Linux 真正需要的是在其图形用户界面中完全重新打造以创建它的第一个桌面。

### Linux 桌面之初啼

In 1996, Matthias Ettrich was troubled by the inconsistency of Linux applications under X. He wanted to make the graphical environment easy to use. And more importantly, he wanted to make everything _integrated_—like an actual desktop.

Matthias started work on the K Desktop Environment. That's K for "Kool." But the name KDE was also meant to be a play on the Common Desktop Environment (CDE) that was the standard in the "Big Unix" world. Although by 1996, CDE was looking pretty dated. CDE was based on the Motif widget set, which is the same design that FVWM mimicked. Finalized in July 1998, KDE 1.0 was a definite improvement over plain window managers like FVWM95.

![KDE 1.0][8]

K Desktop Environment (KDE) version 1.0

Image credit: Paul Brown / KDE

KDE was a big step forward for Linux. Finally, Linux had a true desktop with application integration and more modern desktop icons. KDE's design was not dissimilar from Windows 95. You had a kind-of taskbar along the bottom of the screen that provided the equivalent of Windows 95's Start menu as well as several application shortcuts. KDE also supported virtual desktops, which were cleverly labeled One, Two, Three, and Four. Running applications were represented via buttons in a separate taskbar at the top of the screen.

But not everyone was happy with KDE. To abstract the GUI from the system, KDE used Trolltech's Qt toolkit library. Unfortunately, Qt was not distributed under a free software license. Trolltech allowed Qt to be used at no charge in free software applications but charged a fee to use it in commercial or proprietary applications. And that dichotomy is not aligned with free software. This caused problems for Linux distributions: Should they include KDE? Or default to an older but free software graphical user interface like FVWM?

In response, Miguel de Icaza and Federico Mena started work in 1997 on a new Linux desktop. The new project was dubbed GNOME, for GNU Network Object Model Environment. GNOME aimed to be completely free software and used a different toolkit, called GTK, from the GIMP image editor. GTK literally stood for GIMP Tool Kit. When GNOME 1.0 was finally released in 1999, Linux had another modern desktop environment.

![GNOME 1.0][9]

GNOME version 1.0

Image credit: GNOME Documentation Project

While it was great to have two desktop environments for Linux, the "KDE versus GNOME" rivalry continued for some time. By 1999, Trolltech re-released the Qt library under a new public license, the Q Public License (QPL). But the new license carried its own baggage—the QPL only applied to Qt's use in open source software projects, not commercial projects. Thus the Free Software Foundation deemed the QPL [not compatible][10] with the GNU General Public License (GNU GPL). This licensing issue would remain until Trolltech re-re-released the Qt library under the GNU GPL version 2 in 2000.

### Development over time

The Linux desktop continued to mature. KDE and GNOME settled into a friendly competition that pushed both to add new features and to exchange ideas and concepts. By 2004, both GNOME and KDE had made significant strides, yet brought only incremental changes to the user interface.

KDE 2 and 3 continued to rely on a taskbar concept at the bottom of the screen but incorporated the buttons for running applications. One of KDE's most visible changes was the addition of the Konqueror browser, which first appeared in KDE 2.

![KDE 2.2.2 \(2001\) showing the Konqueror browser][11]

KDE 2.2.2 (2001) showing the Konqueror browser

Image credit: Paul Brown / KDE

![KDE 3.2.2][12]

KDE 3.2.2 (2004) on Fedora Core 2 showing the Konqueror file manager (using a Fedora Core 2 theme)

GNOME 2 also used a taskbar concept but split the bar into two: a taskbar at the top of the screen to launch applications and respond to desktop alerts, and a taskbar at the bottom of the page to show running applications. On my own, I referred to the two taskbars as "things you can do" (top) and "things are you doing" (bottom). In addition to the streamlined user interface, GNOME also added an updated file manager called Nautilus, developed by Eazel.

![GNOME 2.6.0][13]

GNOME 2.6.0 (2004) on Fedora Core 2 showing the Nautilus file manager (using a Fedora Core 2 theme)

Over time, KDE and GNOME have taken different paths. Both provide a feature-rich, robust, and modern desktop environment—but with different user interface goals. In 2011, there was a major deviation between how GNOME and KDE approached the desktop interface. KDE 4.6 (January 2011) and KDE 4.7 (July 2011) provided a more traditional desktop metaphor while continuing to rely on the taskbar concept familiar to many users. Of course, KDE saw lots of changes under the hood, but the familiar look and feel remained.

![KDE 4.6][14]

KDE 4.6 showing the Gwenview image viewer

Image credit: KDE

In 2011, GNOME completely changed gears with a new desktop concept. GNOME 3 aimed to create a simpler, more streamlined desktop experience, allowing users to focus on what they were working on. The taskbar disappeared, replaced by a black status bar at the top of the screen that included volume and network controls, displayed the time and battery status, and allowed users to launch new programs via a redesigned menu.

The menu was the most dramatic change. Clicking the Activities menu or moving the mouse into the Activities "hot corner" showed all open applications as separate windows. Users could also click an Applications tab from the Overview to start a new program. The Overview also provided an integrated search function.

![GNOME 3.0][15]

GNOME 3.0 showing the GNOME Pictures application

Image credit: GNOME

![GNOME 3.0][16]

GNOME 3.0 showing the Activities Overview

Image credit: GNOME

### Your choice of desktop

Having two desktops for Linux means users have great choice. Some prefer KDE and others like GNOME. That's fine. Pick the desktop that best suits you.

To be sure, both KDE and GNOME have fans and detractors. For example, GNOME received a fair bit of criticism for dropping the taskbar in favor of the Activities Overview. Perhaps the most well-known critic was Linus Torvalds, who [loudly denounced and abandoned][17] the new GNOME as an "unholy mess" in 2011—before [moving back][18] to GNOME two years later.

Others have made similar criticisms of GNOME 3, to the point that some developers forked the GNOME 2 source code to create the MATE desktop. MATE (which stands for MATE Advanced Traditional Environment) continues the traditional taskbar interface from GNOME 2.

Regardless, there's no doubt that the two most popular Linux desktops today are KDE and GNOME. Their current versions are both very mature and packed with features. Both KDE 5.16 (2019) and GNOME 3.32 (2019) try to simplify and streamline the Linux desktop experience—but in different ways. GNOME 3.32 continues to aim for a minimal appearance, removing all distracting user interface elements so users can focus on their applications and work. KDE 5.16 takes a more familiar approach with the taskbar but has added other visual improvements and flair, especially around improved widget handling and icons.

![KDE 5.16 Plasma][19]

KDE 5.16 Plasma

Image credit: KDE

![GNOME 3.32][20]

GNOME 3.32

Image credit: GNOME

At the same time, you don't completely lose out on compatibility. Every major Linux distribution provides compatibility libraries, so you can run applications from, say, KDE while running GNOME. This is immensely useful when an application you really want to use is written for the other desktop environment—not a problem; you can run KDE applications on GNOME and vice versa.

I don't see this changing anytime soon. And I think that's a good thing. Healthy competition between KDE and GNOME has allowed developers in both camps to push the envelope. Whether you use KDE or GNOME, you have a modern desktop with great integration. And above all, this means Linux has the best feature in free software: choice.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/how-linux-desktop-grown

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hallhttps://opensource.com/users/jason-bakerhttps://opensource.com/users/jlacroixhttps://opensource.com/users/doni08521059https://opensource.com/users/etc-eterahttps://opensource.com/users/marcobravohttps://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/1980s-computer-yearbook.png?itok=eGOYEKK- (Person typing on a 1980's computer)
[2]: https://opensource.com/sites/default/files/uploads/twm-sls105.png (TWM on SLS 1.05)
[3]: https://opensource.com/sites/default/files/uploads/olvwm-sls105.png (OLVWM on SLS 1.05)
[4]: https://opensource.com/sites/default/files/uploads/fvwm-sls105.png (FVWM on SLS 1.05)
[5]: https://opensource.com/sites/default/files/uploads/win311.png (Windows 3.11)
[6]: https://opensource.com/sites/default/files/uploads/win95.png (Windows 95)
[7]: https://opensource.com/sites/default/files/uploads/fvwm95-rh52.png (FVWM95 on Red Hat Linux 5.2)
[8]: https://opensource.com/sites/default/files/uploads/kde1.png (KDE 1.0)
[9]: https://opensource.com/sites/default/files/uploads/gnome10.png (GNOME 1.0)
[10]: https://www.linuxtoday.com/developer/2000090500121OPLFKE
[11]: https://opensource.com/sites/default/files/uploads/kde_2.2.2.png (KDE 2.2.2 (2001) showing the Konqueror browser)
[12]: https://opensource.com/sites/default/files/uploads/kde322-fc2.png (KDE 3.2.2)
[13]: https://opensource.com/sites/default/files/uploads/gnome26-fc2.png (GNOME 2.6.0)
[14]: https://opensource.com/sites/default/files/uploads/kde46.png (KDE 4.6)
[15]: https://opensource.com/sites/default/files/uploads/gnome30.png (GNOME 3.0)
[16]: https://opensource.com/sites/default/files/uploads/gnome30-overview.png (GNOME 3.0)
[17]: https://www.theregister.co.uk/2011/08/05/linus_slams_gnome_three/
[18]: https://www.phoronix.com/scan.php?page=news_item&px=MTMxNjc
[19]: https://opensource.com/sites/default/files/uploads/kde516.png (KDE 5.16 Plasma)
[20]: https://opensource.com/sites/default/files/uploads/gnome332.png (GNOME 3.32)
