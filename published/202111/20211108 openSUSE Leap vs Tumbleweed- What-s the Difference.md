[#]: subject: "openSUSE Leap vs Tumbleweed: What’s the Difference?"
[#]: via: "https://itsfoss.com/opensuse-leap-vs-tumbleweed/"
[#]: author: "John Paul https://itsfoss.com/author/john/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13966-1.html"

openSUSE Leap 与 Tumbleweed，我该选择哪一个
======

![][10]

[openSUSE 是一个非常受欢迎的 Linux 发行版][1]，尤其是在企业界。[SUSE][2] 从 1996 年起就以这样或那样的形式出现了。很久以来，他们只有一个分支版本。

然后，在 2015 年，他们改变了现状，决定提供两个分支：Leap 和 Tumbleweed。

如果你是 [openSUSE][3] 的新手，很容易把 Tumbleweed 和 Leap 搞混。最近有位读者要求我们解释这两者之间的异同，这正是我们今天要做的。

### Leap 和 Tumbleweed 之间有什么区别？

两者之间最重要的区别是发布时间表。openSUSE Leap （LCTT 译注：leap => “飞跃”）每隔几年就会按照固定的时间表发布一个新版本，类似于 Ubuntu 和 Fedora。另一方面，Tumbleweed （LCTT 译注：tumbleweed => “风滚草”）是一个紧密跟随 openSUSE 开发时间表的滚动发布，就像 Arch 或 Void。

![openSUSE Tumbleweed vs Leap][4]

你知道 [滚动发行版][5] 的优势吧？它为你提供了最新的软件版本，你不需要为一个重大版本发布而升级你的系统，因为你的系统会定期得到更新。

所以，在 openSUSE Tumbleweed 中，你会得到更新的桌面环境版本、内核版本等等，你会得到一个最先进的、新鲜的系统。

另一方面，openSUSE Leap 坚持使用较早的、LTS 版本的桌面环境和 Linux 内核，给你一个可靠的系统。当然也会有系统和安全的补丁，并且每隔几年会有一个重大版本，为你的系统提供更新的软件和内核。

#### 快速回顾一下 openSUSE 发布模式的变化历史

![OpenSUSELeap 安装程序][6]

从提供一个发行版分支到两个似乎是一个很大的飞跃，所以让我给你介绍一下历史背景。Tumblewee 项目是由 [Greg Kroah-Hartman][8] 在 2010 年 11 月宣布的。其目的是创建一个 “滚动更新版本的 openSUSE 存储库，包含供人们使用的最新‘稳定’版软件包”。这个项目并不是一个新的发行版，而是对现有 openSUSE 系统的附加部分。

这在 2014 年发生了变化，当时 openSUSE 背后的团队决定将下一个版本基于 SUSE Linux Enterprise Server（SLES）开发。他们将这个新版本命名为 “Leap 42”（解释一下，“42” 这个数字来自《<ruby>银河系漫游指南<rt>Hitchhiker’s Guide to the Galaxy</rt></ruby>》，其中 “42” 被认为是生命、宇宙和一切的答案）。（ LCTT 译注：在瞎飙了版本后之后，它们又回到了 15.x 这种按部就班的版本号）目前 openSUSE Leap 的版本是 15.2。

随着这一变化，Tumbleweed 成为 openSUSE 的官方发行版。有趣的是，根据 openSUSE 2020 年底的 [社区调查][9]，越来越多的人选择使用 Tumbleweed。

### 你应该使用 Leap 还是 Tumbleweed？

下一个问题是，“如果底层技术基本相同，那么应该使用这两个中的哪一个？”让我为你分析一下。

openSUSE Leap 是稳定的，经过高度测试的。它应该用于较旧的系统和需要长期无问题运行的计算机。这是因为所提供的软件不是最新和最好的，而是最稳定的。因为新的版本每 3 年才会发布一次，所以你安排的任何工作流程都是相对安全的。（一定要记得备份。）Leap 在其整个发布周期中坚持使用同一个 Linux 内核。

![OpenSUSE Leap 桌面][11]

使用 Leap，你不会收到最新版本的软件。你也将以较慢的速度获得硬件支持。你将需要每年至少更新一次你的系统以继续获得更新。Leap 就像 Ubuntu LTS 一样。

另一方面，openSUSE Tumbleweed 拥有所有软件的最新版本，包括内核、驱动程序和桌面环境。由于它是一个滚动发行版，所以你所使用的版本基本上没有寿命结束的可能。

Tumbleweed 不断接受更新的事实也会导致一些问题，比如工作流程或工具的损坏，一般来说，它打磨得比较粗糙。如果发生这种情况，Tumbleweed 确实有工具可以回滚到以前的状态，以避免这些问题。Tumbleweed 非常紧跟 Linux 内核的发布。

![openSUSE Tumbleweed 桌面][12]

让我为你总结一下，以帮助你做出决定。

如果：

  * 稳定性对你来说很重要
  * 你是 openSUSE 的新手
  * 你的硬件较旧
  * 你在运行一个生产服务器
  * 如果你正在为一个不懂技术的朋友或家人建立一个系统

那么你应该使用 Leap。

如果：

  * 你想尝试最新、最棒的软件
  * 你的硬件较新
  * 你对 Linux 比较有经验
  * 你是一个软件开发者
  * 你需要专有的硬件驱动，比如 Nvidia 或 Radeon 显卡，或者 Broadcom 的 Wi-Fi 适配器
  * 你想要最新的内核版本

那么你应该使用 Tumbleweed。

我希望能为你解开疑惑。如果你已经在使用 Leap 或 Tumbleweed，请在评论区告诉我们你的偏好和建议。

--------------------------------------------------------------------------------

via: https://itsfoss.com/opensuse-leap-vs-tumbleweed/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/why-use-opensuse/
[2]: https://en.wikipedia.org/wiki/SUSE_Linux
[3]: https://www.opensuse.org/
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/opensuse-leap-vs-tumbleweed.webp?resize=800%2C264&ssl=1
[5]: https://itsfoss.com/rolling-release/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/opensuse-leap-installer.png?resize=800%2C600&ssl=1
[7]: https://lists.opensuse.org/archives/list/project@lists.opensuse.org/message/NNRPP2KJ6TJ3QLLYJC2E62JADHT5GWMY/
[8]: https://en.wikipedia.org/wiki/Greg_Kroah-Hartman
[9]: https://en.opensuse.org/End-of-year-surveys/2020/Data#Uses_Tumbleweed_as_Desktop_on_a_regular_basis
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/opensuse-leap-vs-tumbleweed.png?resize=800%2C450&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/opensuse-leap-deaktop.png?resize=800%2C600&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/opensuse-tumbleweed-deaktop.png?resize=800%2C603&ssl=1
