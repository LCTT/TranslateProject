[#]: subject: "What is the Release Schedule for Linux Kernel? How Long a Linux Kernel is Supported?"
[#]: via: "https://itsfoss.com/linux-kernel-release-support/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13963-1.html"

Linux 内核的发布时间表是什么？它的支持时间是多久？
======

![](https://img.linux.net.cn/data/attachment/album/202111/08/104610egbqhs8lbldgd6ad.png)

Linux 内核很复杂。我说的甚至不是代码的问题。

Linux 内核的代码本身很复杂，但你不需要为这个问题而烦恼。我说的是 Linux 内核的发布时间表。

一年内多久发布一个新的内核版本？内核被支持多长时间？还有一些 LTS（长期支持）内核，LTS Linux 内核的支持时间有多长？

问题是，虽然这些问题看起来很简单，但答案却不简单。

这些问题没有一个直接明了的答案，需要做一些解释，这就是我在这篇文章中要做的。

### Linux 内核发布时间表：有吗？

![][1]

短的回答是，每两到三个月就有一个新的内核版本发布。长的回答是，这不是一个硬性规定。

这个意思是，你经常会看到每两到三个月就有一个新的内核版本发布。这是内核维护者团队的目标，但并没有规定新版本必须在前一个版本的 8 周后准时发布的期限。

新的内核版本（通常）是由 Linus Torvalds 在它准备好的时候发布的。通常是每 2 到 3 个月发布一次。该版本被宣布为“稳定”，一般以 X.Y 的格式编号。

但这并不是 X.Y 开发的结束。稳定版会有更多的小版本以进行错误的修复。这些小版本在稳定版的内核上又增加了一个点，就像是 X.Y.Z。

虽然 X.Y（通常）是由 Linux 创造者 Linus Torvalds 发布的，但是维护稳定的 X.Y 内核、合并错误修复和发布 X.Y.Z 版本的责任是由另外的内核开发者负责的。

### 一个内核版本支持多长时间？

![][2]

和发布一样，一个内核版本支持多长时间也没有固定的日期和时间表。

一个普通的稳定内核版本通常会被支持两个半月到三个月，这取决于下一个稳定内核版本的发布时间。

例如，稳定版内核 5.14 会在稳定版内核 5.15 发布后的几周内达到 [生命末期][3]。结束支持是由该稳定内核版本的维护者在 Linux 内核邮件列表中宣布的。用户和贡献者会被要求切换到新发布的稳定版本。

但这只适用于正常的稳定内核版本，还有 LTS（长期支持）内核版本，它们的支持期要比 3 个月长得多。

### LTS 内核：它支持多长时间？

LTS 内核也没有固定的发布时间表。通常，每年都有一个 LTS 内核版本，一般是当年的最后一个版本，它至少会被支持两年。但同样，这里也没有固定的规则。

LTS 内核的维护者可以同意某个 LTS 内核的维护时间超过通常的两年。这个协议是根据必要性和参与的人员来达成的。

这种情况经常发生在 Android 项目中。由于两年的时间不足以让制造商结束对他们的硬件和软件功能的支持，你经常会发现一些 LTS 内核会被支持六年之久。

![Linux LTS 内核计划支持日期][4]

你可以 [在 Linux 内核网站上][5] 找到这个信息。

### 你的发行版可能没有跟随通常的 Linux 内核版本

如果你检查你的 Linux 内核版本，你可能会发现 [你的发行版使用了一个旧的内核][6]。也有可能该发行版提供的内核已经在内核网站上被标记为到达了生命末期。

不要惊慌。你的发行版会负责修补内核的错误和漏洞。除非你真的在使用一个不知名的 Linux 发行版，否则你可以相信你的发行版会保持它的安全和健全。

如果你有足够的理由，比如为了支持更新的硬件，你可以自由地在你使用的任何发行版或 [Ubuntu 中安装最新的 Linux 内核][7] 。

如果你想了解更多细节，我已经 [在这里解释了为什么你的发行版使用过时的 Linux 内核][6]。

![][8]

### 没有直接明了的答案

正如你所看到的，对于 Linux 内核发布时间表的问题，没有直接明了的答案。一切都是暂定的。

在我看来，好的方面是，如果你使用一个常规的 Linux 发行版，你不需要为 Linux 内核版本的发布或终止而烦恼。那是由你的发行版处理的事情。

我希望你对 Linux 内核的发布周期有了更多的了解，或者是我把你搞糊涂了。无论是哪种情况，请在评论区告诉我你的观点。

--------------------------------------------------------------------------------

via: https://itsfoss.com/linux-kernel-release-support/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/torvalds-kernel-release.webp?resize=800%2C450&ssl=1
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/kernel-release.png?resize=800%2C450&ssl=1
[3]: https://itsfoss.com/end-of-life-ubuntu/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/linux-lts-kernel-end-of-life.png?resize=785%2C302&ssl=1
[5]: https://www.kernel.org/category/releases.html
[6]: https://itsfoss.com/why-distros-use-old-kernel/
[7]: https://itsfoss.com/upgrade-linux-kernel-ubuntu/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/Keep_Calm_and_Trust_Your_Distribution.png?resize=800%2C400&ssl=1
