[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11915-1.html)
[#]: subject: (Meet FuryBSD: A New Desktop BSD Distribution)
[#]: via: (https://itsfoss.com/furybsd/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

认识 FuryBSD：一个新的桌面 BSD 发行版
======

在过去的几个月中，出现了一些新的桌面 BSD。之前有 [HyperbolaBSD，它之前是 Hyperbola GNU/Linux][1]。[BSD][2] 世界中的另一个新入者是 [FuryBSD][3]。

### FuryBSD：一个新的 BSD 发行版

![][4]

从本质上讲，FuryBSD 是一个非常简单的小东西。根据[它的网站][5]：“FuryBSD 一个是基于 FreeBSD 的轻量级桌面发行版。” 它基本上是预配置了桌面环境，并预安装了多个应用的 FreeBSD。目地是快速地在你的计算机上运行基于 FreeBSD 的系统。

你可能会认为这听起来很像其他几个已有的 BSD，例如 [NomadBSD][6] 和 [GhostBSD][7]。这些 BSD 与 FuryBSD 之间的主要区别在于 FuryBSD 与现有的 FreeBSD 更加接近。例如，FuryBSD 使用 FreeBSD 安装程序，而其他发行版则用了自己的安装程序和工具。

正如[它的网站][8]所说：“尽管 FuryBSD 可能类似于 PC-BSD 和 TrueOS 等图形化 BSD 项目，但 FuryBSD 是由不同的团队创建的，并且采用了不同与 FreeBSD 着重于紧密集成的方法。这样可以降低开销，并保持与上游的兼容性。”开发负责人还告诉我：“FuryBSD 的一个主要重点是使其成为一种小型现场版介质，并带有一些测试硬件驱动程序的辅助工具。”

当前，你可以进入 [FuryBSD 主页][3]并下载 XFCE 或 KDE 的 LiveCD。GNOME 版本正在开发中。

### FuryBSD 的背后是谁

FuryBSD 的主要开发者是 [Joe Maloney][9]。Joe 多年来一直是 FreeBSD 的用户。他为 PC-BSD 等其他 BSD 项目做过贡献。他还与 GhostBSD 的创建者 Eric Turgeon 一起重写了 GhostBSD LiveCD。在此过程中，他对 BSD 有了更好的了解，并开始形成自己如何做一个发行版的想法。

Joe 与其他参与 BSD 世界多年的开发者一起加入了开发，例如 Jaron Parsons、Josh Smith 和 Damian Szidiropulosz。

### FuryBSD 的未来

目前，FuryBSD 仅仅是预配置的 FreeBSD。但是，开发者有一份[要改进的清单][5]。包括：

* 可靠的加载框架、第三方专有图形驱动、无线网络
* 进一步整理 LiveCD 体验，以使其更加友好
* 开箱即用的打印支持
* 包含更多默认应用，以提供完整的桌面体验
* 集成的 [ZFS][10] 复制工具，用于备份和还原
* Live 镜像持久化选项
* 默认自定义 pkg 仓库
* 用于应用更新的持续集成
* 桌面 FreeBSD 的质量保证
* 自定义、色彩方案和主题
* 目录服务集成
* 安全加固

开发者非常清楚地表明，他们所做的任何更改都需要大量的思考和研究。他们不会改进某个功能，只会在它破坏一些东西时删除或者修改它。

![FuryBSD desktop][11]

### 你可以如何帮助 FuryBSD？

目前，该项目还很年轻。由于所有项目都需要帮助才能生存，所以我问 Joe 他们正在寻求什么样的帮助。他说：“我们可以帮助[在论坛上回答问题][12]、回答 [GitHub][13] 上的问题，完善文档。”他还说如果人们想增加对其他桌面环境的支持，欢迎发起拉取请求。

### 最后的想法

尽管我还没有尝试过，但是我对 FuryBSD 感觉不错。听起来项目在掌握中。十多年来，Joe Maloney 一直在思考如何达到最佳的 BSD 桌面体验。与大多数 Linux 发行版基本上都是经过重新设计的 Ubuntu 不同，FuryBSD 背后的开发者知道他们在做什么，并且他们在更看重质量而不是花哨的功能。

你对这个在不断增长的桌面 BSD 市场的新入者怎么看？你尝试过 FuryBSD 或者会尝试一下吗？请在下面的评论中告诉我们。

如果你觉得这篇文章有趣，请在 Hacker News 或 [Reddit][14] 等社交媒体上分享它。

--------------------------------------------------------------------------------

via: https://itsfoss.com/furybsd/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/hyperbola-linux-bsd/
[2]: https://itsfoss.com/bsd/
[3]: https://www.furybsd.org/
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/01/fury-bsd.jpg?ssl=1
[5]: https://www.furybsd.org/manifesto/
[6]: https://itsfoss.com/nomadbsd/
[7]: https://ghostbsd.org/
[8]: https://www.furybsd.org/furybsd-video-overview-at-knoxbug/
[9]: https://github.com/pkgdemon
[10]: https://itsfoss.com/what-is-zfs/
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/01/FuryBSDS-desktop.jpg?resize=800%2C450&ssl=1
[12]: https://forums.furybsd.org/
[13]: https://github.com/furybsd
[14]: https://reddit.com/r/linuxusersgroup
