[#]: subject: "Microsoft has another Linux distribution and it is based on Debian"
[#]: via: "https://news.itsfoss.com/microsoft-debian-distro/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14604-1.html"

微软还有另一个 Linux 发行版，而且是基于 Debian 的
======

> 微软一直在为 Azure 云使用一个基于 Debian 的 Linux 发行版。我们开始揭开它的面纱了！

![微软 Debian][1]

微软在其大量的项目中利用了 Linux。近年来，你一定读过很多关于 WSL（或 WSL2）和微软制作的 Linux 发行版（即 **CBL Mariner**）的消息。

> CBL 是 “共用基础 Linux<rt>Common Base Linux</rt></ruby>”的缩写。

甚至在 Windows 11 上，微软也在不断地改进 [WSL][2] 的体验。

虽然 CBL Mariner 被用来支持 WSLg（WSL 2 的 GUI 部分）和 Azure，但最近一些媒体（[ZDNet][3]）报道发现了微软内部使用的另一个 Linux 发行版。

微软肯定喜欢 Linux，对吗？

### CBL-Delridge：一个基于 Debian 的 Linux 发行版

![][4]

微软维护着一个基于 Debian 的发行版，它被用来支持 Azure 的“<ruby>云端外壳<rt>Cloud Shell</rt></ruby>”。它的名字是 “CBL-Delridge”。

感谢 [Hayden Barnes][5]，他是 SUSE 公司负责 Windows 容器的高级工程经理。

在他 2022 年 2 月的一篇 [旧博文][6] 中，他透露了关于它的更多细节，并帮助你构建它以在需要时将其导入 WSL。

与从头构建的 CBL-Mariner 不同，CBL-Delridge（CBL-D）是基于 Debian 10（Buster）的。

看到 Debian 在这里受到青睐并不奇怪，即使是 [谷歌也为其内部的 Linux 发行版 gLinux 抛弃了 Ubuntu 而选择了 Debian][7]。

有趣的是，微软在 2020 年发布了这个供内部使用的发行版（根据 Hayden 维护的 [微软的开源举措的非官方时间表][8]），而我们在 2022 年才知道了它。

![][9]

CBL-Delridge 也采用了同样的版本号 10（巧合），代号为 “Quinault”。解析一下这个名字，ZDNet 指出，Delridge 是西雅图西部的一个区，而 Quinault 指的是华盛顿州奥林匹克国家公园的一个山谷。

### 构建 CBL-Delridge

与普通的 Linux 发行版不同，你找不到它的可以公开下载的镜像文件。

考虑到 CBL-D 的 APT 软件包库是公开的，如果你出于任何需求想测试它，你可以构建你的 CBL-D 镜像。

你也可以把它导入 WSL 中。[Hayden 的博文][10] 解释了如何使用 debootstrap 来开始构建镜像，然后将其导入 WSL。

请注意，CBL-D 并不完全是 Debian 的替代品。所以，你可能无法找到所有你喜欢的软件包。要了解更多的信息，你可以浏览 Hayden 的博文。

你对微软的内部使用的 Linux 发行版有什么看法？你试过其中一个吗？请在评论中告诉我你的想法。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/microsoft-debian-distro/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/05/microsoft-new-debian-based-linux-distro.jpg
[2]: https://news.itsfoss.com/windows-11-wsl/
[3]: https://www.zdnet.com/article/surprise-theres-yet-another-microsoft-linux-distro-cbl-delridge/
[4]: https://news.itsfoss.com/wp-content/uploads/2022/05/azure-delridge.png
[5]: https://twitter.com/unixterminal
[6]: https://boxofcables.dev/building-cbl-d-microsofts-other-linux-distro/
[7]: https://itsfoss.com/goobuntu-glinux-google/
[8]: https://github.com/sirredbeard/microsoft-opensource
[9]: https://news.itsfoss.com/wp-content/uploads/2022/05/wsl-cbl-delridge-1024x600.png
[10]: https://boxofcables.dev/building-cbl-d-microsofts-other-linux-distro/
