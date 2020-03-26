[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How the Linux desktop has grown)
[#]: via: (https://opensource.com/article/19/8/how-linux-desktop-grown)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)

Linux 桌面史话
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

在 1996 年，Matthias Ettrich 感于 X 之下 Linux 应用程序体验不一致的困扰。他想使找个图形环境更易于使用，而且更重要的是，他想使所有东西都像实际的桌面一样“集成”在一起。

Matthias 开始研究<ruby>K 桌面环境<rt>K Desktop Environment</rt></ruby>（KDE）。那个 K 代表着 “Kool”（LCTT 译注：即 Cool）。但是 KDE 这个名字也意味着可以在<ruby>通用桌面环境<rt>Common Desktop Environment</rt></ruby>（CDE）上发挥作用，而通用桌面环境是“大 Unix”世界的标准。尽管到了 1996 年，CDE 看起来已经有点过时了。CDE 基于 Motif 部件集，这与 FVWM 模仿的设计相同。KDE  1.0 于 1998 年 7 月完成，是对 FVWM95 等普通窗口管理器的绝对改进。
 
![KDE 1.0][8]

*K 桌面环境（KDE）版本 1.0。图片来源：Paul Brown / KDE*

KDE 是 Linux 向前迈出的一大步。最终，Linux 有了一个具有应用程序集成和更现代的桌面图标的真正的桌面。KDE 的设计与 Windows 95 并无不同。屏幕底部有一个任务栏，它提供与 Windows 95 的“开始”菜单等效的功能以及一些应用程序快捷方式。KDE 还支持虚拟桌面，它们被巧妙地标记为 “One”、“ Two”、“Three” 和 “Four”。而正在运行的应用程序则通过屏幕顶部单独的任务栏中的按钮表示。

但是并不是每个人都对 KDE 感到满意。为了从系统中抽象出 GUI 来，KDE 使用了 Trolltech 的 Qt 工具套件库。不幸的是，Qt 并不是以自由软件的许可证进行分发的。Trolltech 允许 Qt 免费在自由软件应用程序中使用，但在商业或专有应用程序中要收取使用费。而且这种二分法与自由软件不符。这给 Linux 发行版带来了问题：它们应该包括 KDE 吗？还是默认使用较旧而属于自由软件的图形用户界面（例如 FVWM）？

面对这种情况，Miguel de Icaza 和 Federico Mena 于 1997 年开始开发新的 Linux 桌面上。这个新项目被称为 GNOME，即<ruby>GNU 网络对象模型环境<rt>GNU Network Object Model Environment</rt></ruby>的缩写。GNOME 旨在成为完全自由的软件，并使用了来自 GIMP 图像编辑器中的另一种工具套件（称为 GTK）。 GTK 从字面上代表 <ruby>GIMP 工具套件<rt>GIMP Tool Kit</rt></ruby>。当 GNOME  1.0 最终于 1999 年发布时，Linux 有了另一个现代化的桌面环境。

![GNOME 1.0][9]

*GNOME 1.0 版。图片来源：GNOME 文档项目*

有两个 Linux 桌面环境固然很棒，但“KDE 与 GNOME”之争仍持续了一段时间。到 1999 年，Trolltech 以新的公共许可证 <ruby>Q 公共许可证<rt>Q Public License</rt></ruby>（QPL）重新发布了 Qt 库。但是，新许可证有其自己的包袱—-QPL 仅适用于 Qt 在开源软件项目中的使用，而不适用于商业项目。因此，<ruby>自由软件基金会<rt>Free Software Foundation</rt></ruby>（FSF）认为 QPL 与 <ruby>GNU 通用公共许可证<rt>GNU General Public License</rt></ruby>（GNU GPL）[不兼容][10]。在 Trolltech 在 2000 年根据 GNU GPL v2 重新发布 Qt 库之前，这个许可证问题一直存在。

### 随着时间的发展

Linux 桌面继续成熟。KDE 和 GNOME 进行了一场友好的竞争，不仅增加了新功能，还互相交流了思想和观念。到 2004 年，GNOME 和 KDE 都取得了长足的进步，但用户界面只是在原有基础上添加了一些变化。

KDE 2 和 3 继续依赖屏幕底部的任务栏概念，但并入了用于运行应用程序的按钮。KDE 最明显的变化之一是添加了 Konqueror 浏览器，该浏览器首次出现在 KDE 2 中。

![KDE 2.2.2 \(2001\) showing the Konqueror browser][11]

*KDE 2.2.2（2001），显示了 Konqueror 浏览器。图片来源：Paul Brown / KDE*

![KDE 3.2.2][12]

*Fedora Core 2 上的 KDE 3.2.2（2004），显示了 Konqueror 文件管理器（使用 Fedora Core 2 主题）*

GNOME 2 还使用了任务栏概念，但将其分为两个部分：位于屏幕顶部的任务栏以启动应用程序并响应桌面警报，以及位于页面底部的任务栏以显示正在运行的应用程序。我自己将这两个任务栏称之为“你可以做的事情”（顶部）和“你正在做的事情”（底部）。除了精简的用户界面外，GNOME 还添加了由 Eazel 开发的名为 Nautilus 的更新文件管理器。

![GNOME 2.6.0][13]

*Fedora Core 2 上的 GNOME 2.6.0（2004），显示了 Nautilus 文件管理器（使用 Fedora Core 2 主题）*

随着时间的流逝，KDE 和 GNOME 走了不同的路径。两者都提供了功能丰富、健壮且现代化的桌面环境，但是却具有不同的用户界面目标。2011 年，GNOME 和 KDE 处理桌面界面的方式之间存在重大偏差。KDE 4.6（2011 年 1 月）和 KDE 4.7（2011 年 7 月）提供了更传统的桌面感受，同时继续根植于许多用户熟悉的任务栏概念。当然，可以看到 KDE 发生很多变化，但是它仍然保留了熟悉的外观。

![KDE 4.6][14]

*KDE 4.6，显示 Gwenview 图像查看器。图片来源：KDE*

2011 年，GNOME 通过新的桌面概念彻底改变了走向。GNOME 3 旨在创建一个更简单、更精简的桌面体验，使用户可以专注于自己的工作。任务栏消失了，取而代之的是屏幕顶部的黑色状态栏，其中包括音量和网络控件，显示了时间和电池状态，并允许用户通过重新设计过的菜单启动新程序。

菜单的变化最具最戏剧性。单击“活动”菜单或将鼠标移到“活动”的“热角”，会将所有打开的应用程序显示为单独的窗口。用户还可以从概述中单击“应用程序”选项卡以启动新程序。“概述”还提供了内部集成的搜索功能。

![GNOME 3.0][15]

*GNOME 3.0，显示 GNOME 图片应用程序。图片来源：GNOME*

![GNOME 3.0][16]

*GNOME 3.0，显示活动概述。图片来源：GNOME*

### 你的桌面之选

拥有两个 Linux 桌面意味着用户有很多选择。有些人喜欢 KDE，而另一些人喜欢 GNOME。没关系，选择最适合你的桌面就行。

可以肯定的是，KDE 和 GNOME 都有拥护者和批评者。例如，GNOME 放弃任务栏以支持“活动概述”而受到了很多批评。也许最著名的批评家是 Linus Torvalds，他在 2011 年[大声斥责并抛弃了][17]新的 GNOME，将其视为“邪恶的烂摊子”，然后在两年后[回到了][18] GNOME。

其他人也对 GNOME 3 提出了类似的批评，以至于一些开发人员复刻 GNOME 2 的源代码来创建 MATE 桌面。MATE（是<ruby>MATE 高级传统环境<rt>MATE Advanced Traditional Environment</rt></ruby>的递归缩写）延续了 GNOME 2 的传统任务栏界面。

无论如何，毫无疑问当今两个最受欢迎的 Linux 桌面是 KDE 和 GNOME。它们的当前版本非常成熟，并且具有很多功能。 KDE 5.16（2019）和 GNOME 3.32（2019）都试图简化和精简 Linux 桌面体验，但是方式有所不同。GNOME 3.32 继续致力于极简外观，删除所有分散用户注意力的用户界面元素，以便用户可以专注于其应用程序和工作。 KDE 5.16 在任务栏上采用了更为熟悉的方法，但是增加了其他视觉上的改进和特质，尤其是围绕改进的小部件处理和图标。

![KDE 5.16 Plasma][19]

*KDE 5.16 Plasma。图片来源：KDE*

![GNOME 3.32][20]

*GNOME 3.32。图片来源：GNOME*

同时，你也不会完全失去它们之间的兼容性。每个主要的 Linux 发行版都提供兼容性库，因此你可以在运行 GNOME 时从 KDE 运行应用程序。在当你实际要使用的应用程序是为其他桌面环境编写的时候，这非常有用。 你可以在 GNOME 上运行 KDE 应用程序，反之亦然。

我认为这种态势不会很快改变，这是一件好事。KDE 和 GNOME 之间的良性竞争使这两个阵营的开发人员都可以避免故步自封。无论你使用 KDE 还是 GNOME，你都将拥有一个集成度很高的现代化桌面。最重要的是，这意味着 Linux 拥有自由软件的最佳特性：选择。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/how-linux-desktop-grown

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
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
