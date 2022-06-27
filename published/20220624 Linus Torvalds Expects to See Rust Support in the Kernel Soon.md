[#]: subject: "Linus Torvalds Expects to See Rust Support in the Kernel Soon"
[#]: via: "https://news.itsfoss.com/linux-kernel-rust/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14763-1.html"

Linus Torvalds 暗示很快就可以在内核中看到对 Rust 的支持
======

> 正如 Linus Torvalds 所暗示，Linux Kernel 5.20 发布时可能会提供对 Rust 的支持。你怎么看？

![Linus][1]

市面上已经有许多用 Rust 重写的开源项目。因此，如今 Rust 被认为是 Linux 内核的第二语言，也就不足为奇了。

几天前，在 [Linux 基金会开源峰会][2] 上，Linus Torvals 提到他们预计将在下一个内核版本（即 Linux 内核 5.20）中对 Rust 进行试验。

或许你不知道，正如 [Phoronix][3] 率先报道的那样，Linux 已经有了 Rust 内核补丁，包含了少量的示例驱动程序，以及基本的基础设施的启用代码。

因此，Linus Torvalds 对可能合并 Rust 支持的暗示，也不足为奇。但是，这无疑是令人兴奋的！

### 用于 Linux 内核的 Rust

这么做的最终目标是让 Linux 内核变得更好，但它现在仍然处于试运行阶段。

凭借其各种优势，Rust 正日益成为一种流行的编程语言。还记得吗，[System76 也在开发一个用 Rust 编写的新桌面环境][4]。

然而，并不是所有参与维护 Linux 内核的人都熟悉这种编程语言。

那么，这会是一个问题吗？

Linus Torvalds 并不认为这是一个大问题，因为内核中也有其他语言。他还提到希望看到 Rust 成为新的一份子。

[The Register][5] 报道称，Linus Torvalds 表示会信任维护者，除非他们犯了错误。

### Linux 5.20：何时发布？

Linux 内核 5.19 版本将于 7 月底左右发布。因此，5.20 版本的合并窗口应该会在其稳定版发布后开启（假设没有意外延迟的话）。

除了 Rust 以外，Linux 内核 5.20 应该也是对包括 RDNA3 在内的下一代硬件支持的重要更新，它同时提供了更多功能。

*你如何看待 Rust 将在不久的将来进入 Linux 呢？你感到兴奋吗？欢迎在下方评论区告诉我们～*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/linux-kernel-rust/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/06/linus-expects-rust-support-in-linux-kernel-soon.jpg
[2]: https://events.linuxfoundation.org/open-source-summit-north-america/
[3]: https://www.phoronix.com/scan.php?page=news_item&px=Rust-Linux-v7-Plus-New-Uutils
[4]: https://news.itsfoss.com/system76-rust-cosmic-desktop/
[5]: https://www.theregister.com/2022/06/23/linus_torvalds_rust_linux_kernel/
