[#]: subject: "Neither Windows, nor Linux! Shrine is ‘God’s Operating System’"
[#]: via: "https://itsfoss.com/shrine-os/"
[#]: author: "John Paul https://itsfoss.com/author/john/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13831-1.html"

不是 Windows，也不是 Linux，Shrine 才是 “神之操作系统”
======

![](https://img.linux.net.cn/data/attachment/album/202109/28/154516dcc5u1a50zfn4abw.jpg)

在生活中，我们都曾使用过多种操作系统。有些好，有些坏。但你能说你使用过由“神”设计的操作系统吗？今天，我想向你介绍 Shrine（圣殿）。

### 什么是 Shrine？

![Shrine 界面][1]

从介绍里，你可能想知道这到底是怎么回事。嗯，这一切都始于一个叫 Terry Davis 的人。在我们进一步介绍之前，我最好提醒你，Terry 在生前患有精神分裂症，而且经常不吃药。正因为如此，他在生活中说过或做过一些不被社会接受的事情。

总之，让我们回到故事的主线。在 21 世纪初，Terry 发布了一个简单的操作系统。多年来，它不停地换了几个名字，有 J Operating System、LoseThos 和 SparrowOS 等等。他最终确定了 [TempleOS][2]（神庙系统）这个名字。他选择这个名字是因为这个操作系统将成为“神的圣殿”。因此，“神”给 Terry 的操作系统规定了以下 [规格][3]：

![video](https://youtu.be/LtlyeDAJR7A)

  * 它将有 640×480 的 16 色图形显示
  * 它将使用 “单声道 8 位带符号的类似 MIDI 的声音采样”
  * 它将追随 Commodore 64，即“一个非网络化的简单机器，编程是目标，而不仅仅是达到目的的手段”
  * 它将只支持一个文件系统（名为 “Red Sea”）
  * 它将被限制在 10 万行代码内，以使它 “整体易于学习”
  * “只支持 Ring-0 级，一切都在内核模式下运行，包括用户应用程序”
  * 字体将被限制为 “一种 8×8 等宽字体”
  * “对一切都可以完全访问。所有的内存、I/O 端口、指令和类似的东西都绝无限制。所有的函数、变量和类成员都是可访问的”
  * 它将只支持一个平台，即 64 位 PC

Terry 用一种他称之为 HolyC（神圣 C 语言）的编程语言编写了这个操作系统。TechRepublic 称其为一种 “C++ 的修改版（‘比 C 多，比 C++ 少’）”。如果你有兴趣了解 HolyC，我推荐 [这篇文章][4] 和 [RosettaCode][5] 上的 HolyC 条目。

2013 年，Terry 在他的网站上宣布，TempleOS 已经完成。不幸的是，几年后的 2018 年 8 月，Terry 被火车撞死了。当时他无家可归。多年来，许多人通过他在该操作系统上的工作关注着他。大多数人对他在如此小的体积中编写操作系统的能力印象深刻。

现在，你可能想知道这些关于 TempleOS 的讨论与 Shrine 有什么关系。好吧，正如 Shrine 的 [GitHub 页面][6] 所说，它是 “一个为异教徒设计的 TempleOS 发行版”。GitHub 用户 [minexew][7] 创建了 Shrine，为 TempleOS 添加 Terry 忽略的功能。这些功能包括：

  * 与 TempleOS 程序 99% 的兼容性
  * 带有 Lambda Shell，感觉有点像经典的 Unix 命令解释器
  * TCP/IP 协议栈和开机即可上网
  * 包括一个软件包下载器

minexew 正计划在未来增加更多的功能，但还没有宣布具体会包括什么。他有计划为 Linux 制作一个完整的 TempleOS 环境。

![video](https://youtu.be/UCgoxQCf5Jg)

### 体验

让 Shrine 在虚拟机中运行是相当容易的。你所需要做的就是安装你选择的虚拟化软件。（我的是 VirtualBox）当你为 Shrine 创建一个虚拟机时，确保它是 64 位的，并且至少有 512MB 的内存。

一旦你启动到 Shrine，会询问你是否要安装到你的（虚拟）硬盘上。一旦安装完成（你也可以选择不安装），你会看到一个该操作系统的导览，你可以由此探索。

### 总结

TempleOS （和 Shrine）显然不是为了取代 Windows 或 Linux。即使 Terry 把它称为 “神之圣殿”，我相信在他比较清醒的时候，他也会承认这更像是一个业余的作业系统。考虑到这一点，已完成的产品相当 [令人印象深刻][8]。在 12 年的时间里，Terry 用他自己创造的语言创造了一个稍稍超过 10 万行代码的操作系统。他还编写了自己的编译器、图形库和几个游戏。所有这些都是在与他自己的个人心魔作斗争的时候进行的。

--------------------------------------------------------------------------------

via: https://itsfoss.com/shrine-os/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/shrine.jpg?resize=800%2C600&ssl=1
[2]: https://templeos.org/
[3]: https://web.archive.org/web/20170508181026/http://www.templeos.org:80/Wb/Doc/Charter.html
[4]: https://harrisontotty.github.io/p/a-lang-design-analysis-of-holyc
[5]: https://rosettacode.org/wiki/Category:HolyC
[6]: https://github.com/minexew/Shrine
[7]: https://github.com/minexew
[8]: http://www.codersnotes.com/notes/a-constructive-look-at-templeos/
