[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11972-1.html)
[#]: subject: (Drauger OS Linux Aims to Bring Console Gaming Experience on the Desktop)
[#]: via: (https://itsfoss.com/drauger-os/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

Drauger OS Linux 旨在为台式机带来主机游戏体验
======

多年来（或数十年），人们抱怨不[使用Linux][1] 的原因之一是它缺乏主流游戏。[Linux 上的游戏][2]在最近几年有了显著改进，特别是 [Steam Proton][3] 项目的引入使你可以[在 Linux 上玩很多 Windows 专用的游戏][4]。

这也鼓励了一些[以游戏为中心的 Linux发行版][5]。以 [Lakka][6] 为例，你可以[借助 Lakka Linux 将旧计算机变成复古的街机游戏机][7]。

另一个以游戏为中心的 Linux 发行版是 [Draguer OS][8]，我们今天将对其进行研究。

### Drauger OS

根据[该项目的网站][9]，“Drauger OS 是 Linux 桌面游戏操作系统。它旨在为游戏玩家提供一个平台，使他们可以在不牺牲安全性的情况下获得出色的性能。此外，它旨在使任何人都可以轻松玩游戏，无论他们使用键盘和鼠标还是某种控制器。”

他们强调 Drauger OS 并非供日常使用。因此，大多数其他发行版附带的许多生产力工具都不在 Drauger OS 中。

![Drauger OS 7.4.1][10]

Drauger OS [基于][9] Ubuntu 之上。当前版本（7.4.1 Jiangshi）使用 “[Liquorix][11] 低延迟Linux 内核，这是一种预编译的 ZEN 内核，设计时考虑了延迟和吞吐量之间的平衡”。但是，这将在下一版本中更改。他们只有一个桌面环境可供选择，即一个修改版本的 [Xfce][12]。

Drauger OS 开箱即用地安装了多个应用程序和工具，以改善游戏体验。这些包括：

* [PlayOnLinux][13]
* WINE
* [Lutris][14]
* Steam
* [DXVK][15]

它还具有一组与游戏无关的有趣工具。[Drauger 安装器][16]是 .deb 安装程序，是 Gdebi 的替代品。[多软件库应用安装器][17]（mrai）是“用于基于 Debian 的 Linux 操作系统的类似于 AUR-helper 的脚本”。Mrai 旨在与 apt、snap、flatpaks 配合使用，并且可以从 GitHub 安装应用程序。

有趣的是，Drauger OS 的名称是一个错误。开发负责人 [Thomas Castleman][18]（即 batcastle）曾打算为其发行版命名为 Draugr，但是却打错了名字。在 Drauger OS 播客的[第 23 集][19]中，Castleman 说会保留这个拼写错误的名称，因为要对其进行更正需要大量工作。根据 [Wikipedia][20] 的描述，Draugr 是“来自北欧神话中的不死生物”。

是的，你没看错。Drauger OS 是仅有的几个具有自己的[播客][21]的发行版之一。当被问到这个问题时，Castleman 告诉我：“无论他们的情况如何，我都希望确保我们的社区拥有最大的透明度。”多数情况下，播客是 Drauger OS 博客的音频版本，但有时他们会在没有时间撰写博客文章时使用它来发布公告。

### Drauger OS 的未来

![Drauger OS][22]

Druager OS 背后的开发人员正在开发其下一个主要版本：7.5.1。此版本将基于 Ubuntu 19.10。将有三个主要变化。首先，将使用“我们内部构建的内核” [替换][23] Liquorix 内核。该内核将基于 Linux 内核 GitHub 存储库，“因此，它会变得越来越原汁原味”。

新版本的第二个主要变化将是为其桌面提供新布局。根据用户的反馈，他们决定将其更改为看起来更类似于 GNOME 的样子。

第三，他们放弃了 SystemBack 作为其备份工具和安装程序。相反，他们从头开始编写了新的[安装程序][24]。

开发团队也正在研究 Drauger OS 的 [ARM 版本][25]。他们希望在 2022 年的某个时候发布它。

### 系统要求

Drauger OS [系统要求][25]非常适中。请记住，Drauger OS 仅在 64 位系统上运行。

#### 最低系统要求

* CPU：双核、1.8GHz、64 位处理器
* RAM：1 GB
* 储存空间：16 GB
* 图形处理器：集成
* 屏幕分辨率：60Hz 时为 1024×768
* 外部端口：1 个用于显示的端口（HDMI/DisplayPort/VGA/DVI），2 个用于安装 USB 驱动器和键盘的 USB 端口（鼠标可选，但建议使用）

#### 推荐系统要求

* CPU：四核、2.2Ghz、64 位处理器
* RAM：4 GB
* 储存空间：128 GB
* 图形处理器：NVIDIA GTX 1050、AMD RX 460 或同等显卡
* 屏幕分辨率：60Hz 时为 1080p
* 外部端口：1 个用于显示的端口（HDMI/DisplayPort/VGA/DVI），3 个用于安装 USB 驱动器、键盘和鼠标的 USB 端口，1 个音频输出端口

### 如何为Drauger OS提供帮助

如果你有兴趣，可以通过多种方法来帮助 Drauger OS。他们一直在寻找[财政支持][26]以保持发展。

如果你想贡献代码，他们正在寻找具有 BASH、C++ 和 Python 经验的人员。他们所有的代码都在 [GitHub][27] 上。你也可以在社交媒体上[联系][28]他们。

### 结语

Drauger OS 只是这类项目之一。我还见过其他[面向游戏的发行版][29]，但 Drauger OS 在专注于游戏方面一心一意。由于我更喜欢休闲游戏，因此该发行版对我个人而言并不具有吸引力。但是，我可以看到它如何吸引游戏爱好者使用 Linux。祝他们在以后的发行中好运。

你对这个仅限于游戏的发行版有何想法？你最喜欢的 Linux 游戏解决方案是什么？请在下面的评论中告诉我们。

--------------------------------------------------------------------------------

via: https://itsfoss.com/drauger-os/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/why-use-linux/
[2]: https://linux.cn/article-7316-1.html
[3]: https://linux.cn/article-10054-1.html
[4]: https://itsfoss.com/steam-play/
[5]: https://itsfoss.com/linux-gaming-distributions/
[6]: http://www.lakka.tv/
[7]: https://itsfoss.com/lakka-retrogaming-linux/
[8]: https://draugeros.org/go/
[9]: https://www.draugeros.org/go/about/
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/02/drauger-os-7.4.1.jpg?ssl=1
[11]: https://liquorix.net/
[12]: https://www.xfce.org/
[13]: https://www.playonlinux.com/en/
[14]: https://lutris.net/
[15]: https://github.com/doitsujin/dxvk
[16]: https://github.com/drauger-os-development/drauger-installer
[17]: https://github.com/drauger-os-development/mrai
[18]: https://github.com/Batcastle
[19]: https://anchor.fm/drauger-os/episodes/Episode-23-eapu47
[20]: https://en.wikipedia.org/wiki/Draugr
[21]: https://anchor.fm/drauger-os
[22]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/02/drauger-os-7.5.1.png?ssl=1
[23]: https://www.draugeros.org/go/2020/01/20/major-changes-in-drauger-os-7-5-1/
[24]: https://github.com/drauger-os-development/system-installer
[25]: https://www.draugeros.org/go/system-requirements/
[26]: https://www.draugeros.org/go/contribute/
[27]: https://github.com/drauger-os-development
[28]: https://www.draugeros.org/go/contact-us/
[29]: https://itsfoss.com/manjaro-gaming-linux/
[30]: https://reddit.com/r/linuxusersgroup
