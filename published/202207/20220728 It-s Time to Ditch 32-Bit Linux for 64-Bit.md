[#]: subject: "It’s Time to Ditch 32-Bit Linux for 64-Bit"
[#]: via: "https://news.itsfoss.com/64-bit-linux/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14876-1.html"

是时候抛弃 32 位的 Linux，改用 64 位的了
======

> 如果你想获得安全的体验，你可能不会再继续使用 32 位 Linux 内核。

![](https://news.itsfoss.com/wp-content/uploads/2022/07/linux-64-bit.jpg)

我们有很多 [为 32 位系统定制的 Linux 发行版][1]。

那么，为什么我想要不鼓励使用 32 位，而升级到 64 位 Linux 呢？

有几个原因，其中一个最大的原因，在本周引发了很多关注。

### 32 位：古老的电子垃圾硬件？

没错，与其他操作系统不同的是，Linux 发行版允许你重新利用旧硬件。

你能够将一个老机器转换为 [媒体服务器][2]、存储服务器，等等。

在这里，我并不是要给你一些如何贡献更多的电子垃圾的思路。尽可能长地利用你的硬件，而不更换它们总是好的。

然而，不使用 32 位系统的理由可能比以往更有说服力。关键的问题是在安全和维护方面。

### 利用 64 位 Linux 提高安全性

2018 年，危险的处理器安全问题 Spectre 漏洞引发了热议。虽然英特尔和 AMD 对这个漏洞进行了修复，但情况并不乐观。

不幸的是，一个新的漏洞 Retbleed，它是 Spectre 的一个变种，正在影响英特尔和 AMD 芯片。

你可以在下面由发现它的研究人员分享的视频中看到它的情况。

![][3]

因此，我们自然需要适当的措施来解决这个新的安全漏洞的修复问题。

**令人震惊的事情来了**。64 位 Linux 内核已经收到了对它的修复，以保护有关的英特尔/AMD 的处理器。但是，正如 [Phoronix][4] 所报道的，Linux 32 位内核仍然容易受到 Retbleed 漏洞的影响。

英特尔的 Pawan Gupta 在 [内核邮件列表][5] 中回应了这些担忧，他提到：

> 英特尔不知道还有谁在 Skylake 那一代的 CPU 上使用 32 位模式的生产环境。所以这不应该是一个问题。

另外，很少看到为 32 位维护所做的任何努力。所以，这应该不算什么意外。

因此，如果你使用你的系统进行任何可能受到安全问题影响的任务，你应该避开 32 位内核。

当然，如果你有一个完全离线的环境可以算做例外。所以，你可以这样做，但不建议这样做。

### 不关心安全问题？

即使你认为得不到像 Retbleed 这样的关键安全修复没有关系，2022 年的 32 位系统也会有更多的麻烦。

软件维护者们最终会放弃对 32 位系统上的工具和 Linux 发行版的更新。

因此，你的 32 位 Linux 系统可能很快就不会再有积极维护的程序了。

因此，现在进行转换（和升级）将是一个好主意。

_你还在使用 32 位的 Linux 吗？你对此有什么看法？在下面的评论中分享你的想法。_

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/64-bit-linux/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/32-bit-linux-distributions/
[2]: https://itsfoss.com/best-linux-media-server/
[3]: https://i.ytimg.com/vi/dmSPvJxPm80/hqdefault.jpg
[4]: https://www.phoronix.com/news/Linux-x86-Retbleed
[5]: https://lore.kernel.org/lkml/20220715221901.xm3c4w4idqt67uja@desk/
