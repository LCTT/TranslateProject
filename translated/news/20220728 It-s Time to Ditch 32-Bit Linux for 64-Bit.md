[#]: subject: "It’s Time to Ditch 32-Bit Linux for 64-Bit"
[#]: via: "https://news.itsfoss.com/64-bit-linux/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

是时候抛弃 32 位 并使用 64 位 Linux 了
======

我们有许多 [为 32 位系统量身定制的 Linux 发行版][1]。

那么，为什么我还要劝你停止使用 32 位，并升级到 64 位 Linux 呢？

理由有好几个，并且，就在本周，其中最重要的之一还引起了大量关注。

### 32 位：用于电子垃圾的远古硬件？

当然，与其他所有的操作系统不同，Linux 发行版允许你重新使用旧硬件。

这意味着，你可以把你的系统变成为 [媒体服务器][2]、存储服务器等等。

别误会，我并不是要你贡献更多的电子垃圾。毕竟，尽可能长时间地使用你的硬件而不更换它们，总归是一件好事。

但现在，停止使用 32 位系统的理由可能比以往任何时候都更有说服力。最主要是基于安全和维护方面的考量。

### 使用 64 位 Linux 提高安全性

Spectre 漏洞在 2018 年引起了轰动，严重威胁到了处理器的安全。虽然 Intel 和 AMD 处理器对此进行了修复，但情况并不理想。

不幸的是，最近又出现了一个新的漏洞，叫 **Retbleed**，它是一种 Spectre 的变体，正在影响 Intel 和 AMD 的芯片。

你可以在下面这个的视频中看到它的实际效果（视频由发现它的研究人员分享）：

![][3]

因此，自然地，我们需要适当的措施来解决这个新的安全漏洞。

**令人震惊的事情来了**：64 位 Linux 内核已获得了针对它的修复，从而保护了涉及到的 Intel/AMD 处理器。但是，正如 [Phoronix][4] 报道的那样，32 位的 Linux 内核仍然容易受到 Retbleed 的攻击。

Pawan Gupta（来自 Intel 公司）对 [内核邮件列表][5] 中的担忧做出了回应，其中提到：

> 就 Intel 所了解到的，目前还没有在 Skylake-gen CPU 上使用 32 位系统的。所以这应该不是一个问题。

另外，我们也很少看到有人专门为 32 位系统做维护。所以，这也没有什么可意外的。

因此，当你将系统用于任何可能因安全问题而中断的任务时，应避免使用 32 位内核。

当然，除非你将系统设置为完全离线（本地工作）。所以，这最终取决于你，但我们不推荐你这么做。

### 不关心安全性？

如果你觉得，就算得不到像 Retbleed 这样的关键安全修复程序，也没关系，那我要告诉你，在 2022 年，32 位系统会有更多麻烦。

为了让软件在 32 位系统上正常工作，维护人员最终会放弃一些工具和 Linux 发行版更新。

因此，你的 32 位 Linux 系统中，恐怕不会有很多积极维护的程序了。

所以，现在进行切换（和升级）会是一个好主意。

_你还在使用 32 位 Linux 吗？你怎么看待这件事？欢迎在下面的评论中分享你的想法。_

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/64-bit-linux/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[lkxed](https://github.com/lkxed)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/32-bit-linux-distributions/
[2]: https://itsfoss.com/best-linux-media-server/
[3]: https://i.ytimg.com/vi/dmSPvJxPm80/hqdefault.jpg
[4]: https://www.phoronix.com/news/Linux-x86-Retbleed
[5]: https://lore.kernel.org/lkml/20220715221901.xm3c4w4idqt67uja@desk/
