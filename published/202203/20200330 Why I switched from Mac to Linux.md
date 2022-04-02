[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14356-1.html)
[#]: subject: (Why I switched from Mac to Linux)
[#]: via: (https://opensource.com/article/20/3/mac-linux)
[#]: author: (Lee Tusman https://opensource.com/users/leeto)

我为什么从 Mac 转到 Linux
======

> 25 年后，我转到了 Linux，简直不能更爽了。以下是我的经历。

![](https://img.linux.net.cn/data/attachment/album/202203/14/093159h433g7j2ytz4g4xz.jpg)

1994 年，我的家人买了一台 Macintosh Performa 475 作为家用电脑。我在学校时曾使用过 Macintosh SE 电脑，并通过《[Mavis Beacon 教你打字][2]》学会了打字，所以我成为 Mac 用户已经超过 25 年了。早在上世纪 90 年代中期，我就被 Mac 的易用性所吸引。它不是以 DOS 命令提示符开始的；它打开的是一个友好的桌面。它很有趣。尽管 Macintosh 的软件比 PC 少得多，但我认为 Mac 的生态系统更好，就凭着 KidPix 和 Hypercard，我仍然认为它们是无与伦比的、最直观的 _创意工厂_。

即便如此，我仍然感觉到，与 Windows 相比，Mac 只是个弟弟。我曾觉得这个公司或许有一天会消失。但几十年后的今天，苹果已经成为一个庞然大物，一个价值万亿美元的公司。但随着发展，它发生了重大变化。有些变化是为了更好的发展，比如更好的稳定性，更简单的硬件选择，更高的安全性，以及更多的可访问性选项。其他的变化让我恼火 —— 不是一下子，而是慢慢地不满意。最重要的是，我对苹果的封闭生态系统感到厌烦 —— 没有 iPhoto 就很难访问照片；必须使用 iTunes；即使我不想使用苹果商店的生态系统，也得强制捆绑。

随着时间的推移，我发现自己主要是在终端上工作。我使用 iTerm2 和 [Homebrew][3] 软件包管理器。虽然我不能让我所有的 Linux 软件都工作，但大部分软件都工作了。我认为我拥有两个世界中最好的东西：macOS 的图形操作系统和用户界面，以及快速打开终端会话的能力。

后来，我开始使用通过 Raspbian 启动的树莓派电脑。我还收集了一些从大学的垃圾堆中抢救出来的非常旧的笔记本电脑，因此，出于需要，我决定尝试各种 Linux 发行版。虽然它们都没有成为我的主用机器，但我开始真正喜欢使用 Linux。我开始考虑尝试运行 Linux 发行版作为我的日常用机，但我认为 Macbook 的舒适性和便利性，特别是硬件的尺寸和重量，在非 Mac 笔记本电脑中很难找到。

### 是时候进行转换了？

大约两年前，我开始在工作中使用一台戴尔电脑。那是一台较大的笔记本电脑，集成了 GPU，可以双启动 Linux 和 Windows。我用它来进行游戏开发、3D 建模、一些机器学习，以及用 C# 和 Java 进行基本编程。我曾考虑把它作为我的主用机器，但我喜欢我的 Macbook Air 的便携性，所以也继续使用它。

去年秋天，我开始注意到我的 Air 运行时很热，而且风扇开得越来越频繁。我的主用机器开始显得垂垂老矣。多年来，我使用 Mac 的终端来访问类 Unix 的 Darwin 操作系统，我在终端和网页浏览器之间切换的时间越来越多。是时候进行转换了吗？

我开始探索一个类似 Macbook 的 Linux 笔记本电脑的可能性。在做了一些研究、阅读测评和留言板之后，我选择了长期以来备受赞誉的戴尔 XPS 13 开发者版 7390，选择了第十代 i7。我选择它是因为我喜欢 Macbook（尤其是超薄的 Macbook Air）的感觉，而对 XPS 13 的评论表明它似乎是类似的笔记本电脑，对其触控板和键盘的评价也真的很好。

最重要的是，它装载了 Ubuntu。虽然买一台电脑，擦掉它，然后安装一个新的 Linux 发行版是很容易的，但我被这种配合得当的操作系统和硬件所吸引，而且它允许我们进行大量的定制，就像我们在 Linux 中了解而喜爱的一样。因此，当有促销活动时，我毅然决然地购买了它。

### 每天运行 Linux 是什么感觉

如今，我使用 XPS 13 已经有三个月了，我的双启动的 Linux 工作笔记本也有两年了。起初，我以为我会花更多的时间寻找一个更像 Mac 的替代桌面环境或窗口管理器，比如 [Enlightenment][4]。我试过几个，但我不得不说，我喜欢开箱即用的 [GNOME][5] 的简单性。首先，它是精简的；没有太多的 GUI 元素会吸引你的注意力。事实上，它很直观，这份 [概览][6] 只需要几分钟就能看完。 

我可以通过应用程序仪表盘或按网格排布的按钮访问我的应用程序，从而进入应用程序视图。要访问我的文件系统，我点击仪表盘上的“文件”图标。要打开 GNOME 终端，我输入 `Ctrl+Alt+T` 或者直接按下 `Alt+Tab` 来在打开的应用程序和打开的终端之间切换。定义你自己的 [自定义热键快捷方式][7] 也很容易。

除此以外，没有太多要说的。与 Mac 的桌面不同，没有那么多的东西会让人迷失，这意味着让我从工作或我想运行的应用程序中分心的东西更少。我没有看到我在 Mac 上浏览窗口的那么多选项，也不必在导航时花费那么多时间。在 Linux 中，只有文件、应用程序和终端。

我安装了 [i3 平铺式窗口管理器][8] 来做一个测试。我在配置上遇到了一些问题，因为我是用 [德沃夏克键盘][9] 键入的，而 i3 并不适应另一种键盘配置。我想，如果再努力一点，我可以在 i3 中找出一个新的键盘映射，但我主要想找的是简单的平铺功能。

我看了 GNOME 的平铺功能，并感到非常惊喜。你按下 `Super` 键（对我来说，就是有 Windows 标志的那个键 —— 我应该用贴纸盖住它！），然后按一个修饰键。例如，按 `Super + ←` 将你当前的窗口移动到屏幕左侧的贴片上。`Super + →` 移动到右半边。`Super + ↑` 使当前窗口最大化。`Super + ↓` 则恢复到之前的大小。你可以用 `Alt+Tab` 在应用程序窗口之间移动。这些都是默认行为，可以在键盘设置中自定义。

插上耳机或连接到 HDMI 的工作方式与你预期的一样。有时，我打开声音设置，在 HDMI 声音输出或我的外部音频线之间进行切换，就像我在 Mac 或 PC 上那样。触控板的反应很灵敏，我没有注意到与 Macbook 的有什么不同。当我插入一个三键鼠标时，它可以立即工作，即使是用我的蓝牙鼠标和键盘。

#### 软件

我在几分钟内安装了 Atom、VLC、Keybase、Brave 浏览器、Krita、Blender 和 Thunderbird。我在终端用 Apt 软件包管理器安装了其他软件（和平常一样），它比 macOS 的 Homebrew 软件包管理器提供了更多软件包。

#### 音乐

我有许多种听音乐的选择。我使用 Spotify 和 [PyRadio][10] 来串流播放音乐。[Rhythmbox][11] 在 Ubuntu 上是默认安装的；这个简单的音乐播放器可以立即启动，而且毫不臃肿。只需点击菜单，选择“添加音乐”，然后导航到一个音乐目录（它会递归搜索）。你也可以轻松地串流播客或在线广播。

#### 文本和 PDF

我倾向于在带有一些插件的 [Neovim][12] 中用 Markdown 写作，然后用 Pandoc 将我的文档转换为任何最终需要的格式。对于一个带有预览功能的漂亮的 Markdown 编辑器，我下载了 [Ghostwriter][13]，一个最集中注意力的写作应用程序。

如果有人给我发了一个微软 Word 文档，我可以用默认的 LibreOffice Writer 应用程序打开它。

偶尔，我也要签署一份文件。用 macOS 的“预览”应用程序和我的 PNG 格式的签名，这很容易，我需要一个 Linux 的对应工具。我发现默认的 PDF 查看器应用程序没有我需要的注释工具。LibreOffice 绘图程序是可以接受的，但不是特别容易使用，而且它偶尔会崩溃。做了一些研究后，我安装了 [Xournal][14]，它有我需要的简单的注释工具，可以添加日期、文字和我的签名，而且与 Mac 的预览程序相当。它完全能满足我的需要。

#### 从我的手机中导入图片

我有一个 iPhone。为了把我的图片从手机上拿下来，有很多方法可以同步和访问你的文件。如果你有一个不同的手机，你的过程可能是不同的。下面是我的方法：

1. 用 `sudo apt install gvfs-backends` 来安装 `gvfs-backends`，它是 GNOME 虚拟文件系统的一部分。
2. 获取你的手机的序列号。将你的手机插入你的电脑，在你的 iPhone 上点击“信任”。在你电脑的终端输入：
    ```
    lsusb -v 2> /dev/null | grep -e "Apple Inc" -A 2
    ```
    （感谢 Stack Oveflow 用户 [complistic][15] 提供的这个代码技巧）。
3. 现在打开你的文件系统。
    - 按 `Ctrl+L` 打开一个位置并输入：`afc://<你的序列号>`，（请替换 `<你的序列号>`）来打开并导航到你的 DCIM 文件夹。我的照片和视频在 DCIM 文件夹的五个子文件夹内，而不是在照片文件夹内。从这里你可以手动将它们移到你的电脑上。
    - 挂载手机文件系统后，你也可以在终端中通过以下方式导航到你的文件：
      ```
      cd /run/user/1001/gvfs/afc:host=<你的序列号>
      ```

#### 图形、照片、建模和游戏引擎

我是一名教育工作者，教授各种新媒体课程。我的许多同事和学生都订阅了价格昂贵的专有的 Adobe Creative Suite。我喜欢让我的学生知道他们还有其他选择。

对于绘图和图形编辑，我使用 [Krita][16]。这绝对是我的 Photoshop 替代品。对于插图工作，还有 [Inkscape][17] 和 Scribus 的出版软件。对于自动编辑，我使用命令行 [ImageMagick][18] 程序，它已经预装在 Ubuntu 中。

为了管理我的图像，我使用简单的 [Shotwell][19] 应用程序。

对于 3D 建模，我使用并教授开源的 [Blender][20] 软件。在我的学校，我们教 [Unity 3d][21]，它有 Linux 版本。它运行良好，但我一直想试试 [Godot][22]，一个开源的替代品。

#### 开发

我的 XPS 13 安装了 Chrome 和 Chromium。我还添加了 Firefox 和 [Brave][23] 浏览器。所有都和你在 Mac 或 PC 上习惯的一样。大多数时候，我在 Atom 中进行开发工作，有时在 Visual Studio Code 中进行，这两种软件都很容易安装在 Linux 上。Vim 已经预装在终端，而我首选的终端文本编辑器 Neovim，也很容易安装。

几周后，我开始尝试其他终端。我目前最喜欢的是 Enlightenment 基金会的 Terminology。首先，它允许你在终端中 [查看图片][24]，这在 Mac 的终端中是很难做到的。

### 留在这里

我看不出自己会转回 Mac 作为我的日用电脑。现在，当我使用 Mac 时，我注意到超多的选项和运行一个应用程序或浏览某个地方所需的额外步骤。我还注意到它的运行速度有点慢，或许这只是我个人的感受？

现在我已经转到了一个开源的生态系统和 Linux，我很高兴，没有必要再转回去。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/mac-linux

作者：[Lee Tusman][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/leeto
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_development_programming.png?itok=4OM29-82
[2]: https://en.wikipedia.org/wiki/Mavis_Beacon_Teaches_Typing
[3]: https://brew.sh/
[4]: https://www.enlightenment.org/
[5]: https://opensource.com/downloads/cheat-sheet-gnome-3
[6]: https://help.gnome.org/users/gnome-help/stable/shell-introduction.html.en
[7]: https://docs.fedoraproject.org/en-US/quick-docs/proc_setting-key-shortcut/
[8]: https://opensource.com/article/18/9/i3-window-manager-cheat-sheet
[9]: https://en.wikipedia.org/wiki/Dvorak_keyboard_layout
[10]: https://opensource.com/article/19/11/pyradio
[11]: https://wiki.gnome.org/Apps/Rhythmbox
[12]: https://neovim.io/
[13]: https://wereturtle.github.io/ghostwriter/
[14]: http://xournal.sourceforge.net/
[15]: https://stackoverflow.com/questions/19032162/is-there-a-way-since-ios-7s-release-to-get-the-udid-without-using-itunes-on-a/21522291#21522291
[16]: https://opensource.com/article/19/4/design-posters
[17]: https://opensource.com/article/19/1/inkscape-cheat-sheet
[18]: https://opensource.com/article/17/8/imagemagick
[19]: https://gitlab.gnome.org/GNOME/shotwell/
[20]: https://opensource.com/article/18/4/5-best-blender-video-tutorials-beginners
[21]: https://unity.com/
[22]: https://opensource.com/article/17/12/get-started-developing-games-godot
[23]: https://brave.com/
[24]: https://www.enlightenment.org/about-terminology.md