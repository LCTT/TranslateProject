[#]: collector: (lujun9972)
[#]: translator: (CoWave-Fall)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14632-1.html)
[#]: subject: (31 open source text editors you need to try)
[#]: via: (https://opensource.com/article/21/2/open-source-text-editors)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

值得尝试的 30 个开源文本编辑器
======

> 正在寻找新的文本编辑器？这里有 31 个编辑器可供尝试。

![](https://img.linux.net.cn/data/attachment/album/202205/24/184603krbzynnnikz8b0nc.jpg)

计算机是基于文本的，因此你使用它们做的事情越多，你可能就越需要文本编辑应用程序。你在文本编辑器上花费的时间越多，你就越有可能对你使用的编辑器提出更多的要求。

如果你正在寻找一个好的文本编辑器，你会发现 Linux 可以提供很多。无论你是想在终端、桌面还是在云端工作，你都可以试一试。你可以每天一款编辑器，连续着试一个月（或每月试一个，能够试三年）。坚持不懈，你终将找到适合你的完美的编辑器。

### Vim 类编辑器

![][2]

* [Vi][3] 通常随着 Linux 各发行版、BSD、Solaris 和 macOS 一起安装。它是典型的 Unix 文本编辑器，具有编辑模式和超高效的单键快捷键的独特组合。最初的 Vi 编辑器由 Bill Joy 编写（他也是 C shell 的作者）。Vi 的现代版本，尤其是 Vim，增加了许多特性，包括多级撤消、在插入模式下更好的导航、行折叠、语法高亮、插件支持等等。但它需要学习如何使用（它甚至有自己的教程程序，`vimtutor`）。
* [Kakoune][4] 是一个受 Vim 启发的应用程序，它具有熟悉的简约界面、短键盘快捷键以及独立的编辑和插入模式。乍一看，它的外观和感觉很像 Vi，但它在设计和功能上有自己独特的风格。 它有一个小彩蛋：具有 Clippy 界面的实现。

### emacs 编辑器

![][5]

* 从最初的免费 emacs 开始，发展到发起了自由软件运动的 GNU 项目的第一批官方应用程序，[GNU Emacs][6] 是一个广受欢迎的文本编辑器。它非常适合系统管理员、开发人员和日常用户的使用，具有大量功能和近乎无穷无尽的扩展。一旦你开始使用 emacs，你可能会发现很难想出一个理由来关闭它，因为它能做的事情非常多！
* 如果你喜欢 emacs，但觉得 GNU Emacs 过于臃肿，那么你可以试试 [Jove][7]。Jove 是一个基于终端的 emacs 编辑器。它很容易使用，但是如果你是使用 emacs 编辑器家族的新手，那么 Jove 也是很容易学习的，这要归功于 `teajove` 命令。
* 另一个轻量级的 emacs 编辑器是 [Jed][8]。它的工作流程基于宏。它与其他编辑器的不同之处在于它使用了 [S-Lang][9]，这是一种类似 C 的脚本语言，它为使用 C 而不是使用 Lisp 的开发人员提供了扩展的机会。

### 交互式编辑器

![][10]

* [GNU nano][11] 对基于终端的文本编辑采取了大胆的立场：它提供了一个菜单。是的，这个不起眼的编辑器从 GUI 编辑器那里得到了提示，它告诉用户他们需要按哪个键来执行特定的功能。这是一种令人耳目一新的用户体验，所以难怪 nano 被设置为“用户友好”发行版的默认编辑器，而不是 Vi。
* [JOE][12] 基于一个名为 WordStar 的旧文本编辑应用程序。如果你不熟悉 Wordstar，JOE 也可以模仿 Emacs 或 GNU nano。默认情况下，它是介于 Emacs 或 Vi 等相对神秘的编辑器和 GNU Nano 永远显示的冗长信息之间的一个很好的折衷方案（例如，它告诉你如何激活屏幕帮助显示，但默认情况下不启用）。
* [e3][13] 是一个优秀的小型文本编辑器，具有五个内置的键盘快捷键方案，用来模拟 Emacs、Vi、nano、NEdit 和 WordStar。换句话说，无论你习惯使用哪种基于终端的编辑器，你都可能对 e3 感到宾至如归。

### ed 及像 ed 一样的编辑器

* [POSIX][15] 和 Open Group 定义了基于 Unix 的操作系统的标准，[ed][14] 行编辑器是它的一部分。它安装在你遇到的几乎所有 Linux 或 Unix 系统上。它小巧、简洁、一流。
* 基于 ed，[Sed][16] 流编辑器因其功能和语法而广受欢迎。大多数 Linux 用户在搜索如何最简单、最快捷的更新配置文件中的行的方法时，至少会遇到一个 `sed` 命令，但它值得仔细研究一下。Sed 是一个强大的命令，包含许多有用的子命令。更好地了解了它，你可能会发现自己打开文本编辑器应用程序的频率要低得多。
* 你并不总是需要文本编辑器来编辑文本。[heredoc][17]（或 Here Doc）系统可在任何 POSIX 终端中使用，允许你直接在打开的终端中输入文本，然后将输入的内容通过管道传输到文本文件中。这不是最强大的编辑体验，但它用途广泛且始终可用。

### 极简风格的编辑器

![][18]

如果你认为一个好的文本编辑器就是一个文字处理器（除了没有所有的处理功能）的话，你可能正在寻找这些经典编辑器。这些编辑器可让你以最少的干扰和最少的帮助写作和编辑文本。它们提供的功能通常以标记文本、Markdown 或代码为中心。有些名称遵循某种模式：

* [Gedit][19] 来自 GNOME 团队；
* [medit][20] 有经典的 GNOME 手感；
* [Xedit][21] 仅使用最基本的 X11 库；
* [jEdit][22] 适用于 Java 爱好者。

KDE 用户也有类似的：

* [Kate][23] 是一款低调的编辑器，拥有你需要的几乎所有功能；
* [KWrite][24] 在看似简单易用的界面中隐藏了大量有用的功能。

还有一些适用于其他平台：

* [Pe][26] 适用于 Haiku OS（90 年代那个古怪的孩子 BeOS 的转世）；
* [FeatherPad][27] 是适用于 Linux 的基本编辑器，但对 macOS 和 Haiku 有一些支持。如果你是一名希望移植代码的 Qt 黑客，请务必看一看！

### 集成开发环境（IDE）

![][28]

文本编辑器和集成开发环境（IDE）有很多相同之处。后者实际上只是前者加上许多为特定代码而添加的功能。如果你经常使用 IDE，你可能会在扩展管理器中发现一个 XML 或 Markdown 编辑器：

* [NetBeans][29] 是一个方便 Java 用户的文本编辑器。
* [Eclipse][30] 提供了一个强大的编辑套件，其中包含许多扩展，可为你提供所需的工具。

### 云端编辑器

![][31]

在云端工作？当然，你也可以在那里进行编辑。

* [Etherpad][32] 是在网上运行的文本编辑器应用程序。有独立免费的实例供你使用，或者你也可以设置自己的实例。
* [Nextcloud][33] 拥有蓬勃发展的应用场景，包括内置文本编辑器和具有实时预览功能的第三方 Markdown 编辑器。

### 较新的编辑器

![][34]

每个人都会有让文本编辑器变得更完美的想法。因此，几乎每年都会发布新的编辑器。有些以一种新的、令人兴奋的方式重新实现经典的旧想法，有些对用户体验有独特的看法，还有些则专注于特定的需求。

* [Atom][35] 是来自 GitHub 的多功能的现代文本编辑器，具有许多扩展和 Git 集成。
* [Brackets][36] 是 Adobe 为 Web 开发人员提供的编辑器。
* [Focuswriter][37] 旨在通过无干扰的全屏模式、可选的打字机音效和精美的配置选项等有用功能帮助你专注于写作。
* [Howl][38] 是一个基于 Lua 和 Moonscript 的渐进式动态编辑器。
* [Norka][39] 和 [KJots][40] 模仿笔记本，每个文档代表“活页夹”中的“页面”。你可以通过导出功能从笔记本中取出单个页面。

### 自己制作编辑器

![][41]

俗话说得好：既然可以编写自己的应用程序，为什么要使用别人的（虽然其实没有这句俗语）？虽然 Linux 有超过 30 个常用的文本编辑器，但是再说一次，开源的一部分乐趣在于能够亲手进行实验。

如果你正在寻找学习编程的理由，那么制作自己的文本编辑器是一个很好的入门方法。你可以在大约 100 行代码中实现基础功能，并且你使用它的次数越多，你可能就越会受到启发，进而去学习更多知识，从而进行改进。准备好开始了吗？来吧，去 [创建你自己的文本编辑器][42]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/open-source-text-editors

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[CoWave-Fall](https://github.com/CoWave-Fall)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/button_push_open_keyboard_file_organize.png?itok=KlAsk1gx (open source button on keyboard)
[2]: https://opensource.com/sites/default/files/kakoune-screenshot.png
[3]: https://opensource.com/article/20/12/vi-text-editor
[4]: https://opensource.com/article/20/12/kakoune
[5]: https://opensource.com/sites/default/files/jed.png
[6]: https://opensource.com/article/20/12/emacs
[7]: https://opensource.com/article/20/12/jove-emacs
[8]: https://opensource.com/article/20/12/jed
[9]: https://www.jedsoft.org/slang
[10]: https://opensource.com/sites/default/files/uploads/nano-31_days-nano-opensource.png
[11]: https://opensource.com/article/20/12/gnu-nano
[12]: https://opensource.com/article/20/12/31-days-text-editors-joe
[13]: https://opensource.com/article/20/12/e3-linux
[14]: https://opensource.com/article/20/12/gnu-ed
[15]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[16]: https://opensource.com/article/20/12/sed
[17]: https://opensource.com/article/20/12/heredoc
[18]: https://opensource.com/sites/default/files/uploads/gedit-31_days_gedit-opensource.jpg
[19]: https://opensource.com/article/20/12/gedit
[20]: https://opensource.com/article/20/12/medit
[21]: https://opensource.com/article/20/12/xedit
[22]: https://opensource.com/article/20/12/jedit
[23]: https://opensource.com/article/20/12/kate-text-editor
[24]: https://opensource.com/article/20/12/kwrite-kde-plasma
[25]: https://opensource.com/article/20/12/notepad-text-editor
[26]: https://opensource.com/article/20/12/31-days-text-editors-pe
[27]: https://opensource.com/article/20/12/featherpad
[28]: https://opensource.com/sites/default/files/uploads/eclipse-31_days-eclipse-opensource.png
[29]: https://opensource.com/article/20/12/netbeans
[30]: https://opensource.com/article/20/12/eclipse
[31]: https://opensource.com/sites/default/files/uploads/etherpad_0.jpg
[32]: https://opensource.com/article/20/12/etherpad
[33]: https://opensource.com/article/20/12/31-days-text-editors-nextcloud-markdown-editor
[34]: https://opensource.com/sites/default/files/uploads/atom-31_days-atom-opensource.png
[35]: https://opensource.com/article/20/12/atom
[36]: https://opensource.com/article/20/12/brackets
[37]: https://opensource.com/article/20/12/focuswriter
[38]: https://opensource.com/article/20/12/howl
[39]: https://opensource.com/article/20/12/norka
[40]: https://opensource.com/article/20/12/kjots
[41]: https://opensource.com/sites/default/files/uploads/this-time-its-personal-31_days_yourself-opensource.png
[42]: https://opensource.com/article/20/12/31-days-text-editors-one-you-write-yourself
