[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12809-1.html)
[#]: subject: (Linux Jargon Buster: What are GUI, CLI and TUI in Linux?)
[#]: via: (https://itsfoss.com/gui-cli-tui/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Linux 黑话解释：什么是 Linux 中的 GUI、CLI 和 TUI？
======

![](https://img.linux.net.cn/data/attachment/album/202011/10/092051zw3ofb365a63fahl.jpg)

当你开始使用 Linux 并关注关于 Linux 的网站和论坛时，你会经常遇到诸如 GUI、CLI 等术语，有时还会遇到 TUI。

这一章的 Linux 黑话解释简要解释了这些术语，以便你作为一个（新的）Linux 用户在使用这些缩写词时能够更好地理解上下文。

说实话，像 GUI、CLI 或 TUI 这样的术语并不是 Linux 的专属术语。这些都是通用的计算术语，你会发现在非 Linux 的讨论中也会用到它们。

### GUI - <ruby>图形用户界面<rt>Graphical User Interface</rt></ruby>

这可能是你在这里最常遇到的词汇。这是因为我们专注于桌面 Linux 用户，并试图涵盖易于使用的图形化方法和应用程序。

GUI 应用程序（或图形应用程序）基本上是指任何可以与你的鼠标、触摸板或触摸屏交互的东西。有了图标和其他视觉概念，你可以使用鼠标指针来访问功能。

![GIMP：一个用于照片编辑的GUI应用程序][1]

在 Linux 上，[桌面环境][2]为你提供了与系统交互的图形界面，然后，你可以使用 GUI 应用程序，如 GIMP，VLC、Firefox、LibreOffice、文件管理器等来完成各种任务。

GUI 使普通用户的计算机使用变得更加容易，否则它将仍然是一个极客专用区。

### CLI - <ruby>命令行界面<rt>Command Line Interface</rt></ruby>

CLI 基本上是一个接受输入来执行某种功能的命令行程序。基本上，任何可以在终端中通过命令使用的应用程序都属于这一类。

![apt-cache 是一个 CLI 工具，用于在基于 Debian 的系统上与 APT 缓存交互][3]

早期的电脑与操作系统交互没有鼠标，你必须使用命令与机器互动。

如果你认为这都算困难，那你应该知道，早期的计算机甚至没有一个屏幕可以看到正在输入的东西，他们用实体的纸质打印机看到他们的输入命令。我从来没有用过这样的电脑，也没有在现实生活中看到过。我用过的最接近的东西是学习期间的单片机套件。

![肯•汤普森和丹尼斯•里奇在 PDP11 电脑上开发 UNIX 操作系统][4]

现在的 CLI 还有用吗？当然有。命令总是有它的好处，特别是当你处理操作系统的核心功能和配置时，比如设置防火墙、管理网络甚至[包管理][5]。

你可能会有一个基于 GUI 的应用程序来完成同样的任务，但命令可以让你更精细地访问这些功能。在一些情况下，你会发现 GUI 应用程序也会用命令（在它们的代码中使用）与操作系统交互。

![Handbrake GUI 应用程序在底层使用 FFMPEG CLI 工具][6]

许多流行的 GUI 应用程序往往是基于 CLI 工具的。以[Handbrake][7] 为例。这是一个流行的开源媒体转换器，它底层使用的是 [FFMPEG 命令行][8]工具。

很明显，使用命令行工具没有图形工具那么简单。不要担心。除非你有特殊需要，否则你应该可以用图形化的方式使用 Linux 系统。然而，了解基本的 Linux 命令会有很大的帮助。

### TUI - <ruby>终端用户界面<rt>Terminal User Interface</rt></ruby>（也称为<ruby>基于文本的用户界面<rt>Text-based User Interface</rt></ruby>）

这是三者中最不常见的名词。TUI 基本上部分是 GUI，部分是 CLI。糊涂了吗？让我为你解释一下。

你已经知道，早期的计算机使用 CLI。在实际的 GUI 出现之前，基于文本的用户界面在终端中提供了一种非常基本的图形交互。你会有更多的视觉效果，也可以使用鼠标和键盘与应用程序进行交互。

![终端中的 nnn 文件浏览器][9]

TUI 是基于文本的用户界面或终端用户界面的缩写。“基于文本”这个说法主要是因为你在屏幕上有一堆文本，而“终端用户界面”的说法是因为它们只在终端中使用。

TUI 的应用虽然不是那么常见，但你还是有一些的。[基于终端的 Web 浏览器][10]是 TUI 程序的好例子。[基于终端的游戏][11]也属于这一类。

![CMUS 是基于终端的音乐播放器][12]

当你在 [Ubuntu 中安装多媒体编解码器][13]时，你可能会遇到 TUI，你必须接受 EULA 或做出选择。

TUI 应用程序不像 GUI 应用程序那样用户友好，它们经常会有学习曲线，但它们比命令行工具更容易使用一些。

### 最后……

TUI 应用程序通常也被认为是 CLI 应用程序，因为它们被限制在终端上。在我看来，你是否认为它们与 CLI 不同，这取决于你。

我希望你喜欢这篇 Linux 黑话解释。如果你对这个系列的主题有什么建议，请在评论中告诉我，我将在以后尽量涵盖它们。

--------------------------------------------------------------------------------

via: https://itsfoss.com/gui-cli-tui/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/04/gimp-2-10-interface.jpg?resize=800%2C450&ssl=1
[2]: https://itsfoss.com/what-is-desktop-environment/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/apt-cache-search-names-only.png?resize=759%2C209&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/Ken_Thompson_and_Dennis_Ritchie_at_PDP-11.jpg?resize=800%2C641&ssl=1
[5]: https://itsfoss.com/package-manager/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/11/handbrake.png?resize=800%2C537&ssl=1
[7]: https://itsfoss.com/handbrake/
[8]: https://itsfoss.com/ffmpeg/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/nnn-file-browser.jpg?resize=800%2C597&ssl=1
[10]: https://itsfoss.com/terminal-web-browsers/
[11]: https://itsfoss.com/best-command-line-games-linux/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2017/07/cmus-interface.png?resize=734%2C436&ssl=1
[13]: https://itsfoss.com/install-media-codecs-ubuntu/
