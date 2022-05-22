[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12807-1.html)
[#]: subject: (Linux Kernel 5.10 Will be the Next LTS Release and it has Some Exciting Improvements Lined Up)
[#]: via: (https://itsfoss.com/kernel-5-10/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Linux 内核 5.10 LTS 的一些令人兴奋的改进
======

> Linux 内核 5.10 的开发正在进行中。已确认这是一个长期支持的版本，将带来更新的硬件支持和其他承诺的功能。

### Linux Kernel 5.10 将是长期支持版本

主要稳定内核维护者 **Greg Kroah-Hartman** 在 Linux 基金会欧洲开源峰会的 “Ask the Expert” 环节上发言，确认 Linux 5.10 将是下一个 LTS 版本。

尽管早期有一些关于 5.9 是 LTS 版本的猜测，但 Greg 澄清说，**一年的最后一个内核版本永远是 LTS 版本**。

目前来看，[Linux 内核 5.4][1] 系列恰好是最新的 LTS 版本，它增加了很多改进和硬件支持。另外，考虑到开发进度，Linux [内核 5.8][2] 是目前最大的版本，而 Linux 5.10 的第一个候选版本也很接近，所以下面有很多事情要做。

让我们来看看 Linux 内核 5.10 的一些功能和改进。

### Linux 内核 5.10 特性

![][4]

**注意：** Linux 内核 5.10 仍处于早期开发阶段。因此，我们将定期更新文章，以更新最新的补充/功能。

#### AMD Zen 3 处理器支持

新的 [Ryzen 5000][5] 产品线是 2020 年最大的看点之一。所以，随着 Linux 内核 5.10 发布候选版本的推出，针对 Zen 3 处理器的各种新增功能也在陆续推出。

#### Intel Rocket Lake 支持

我并不对 Intel 的 Rocket Lake 芯片组在明年（2021 年） Q1 出货报太大希望。但是，考虑到英特尔在不断地压榨 14 纳米制程，看到 Intel Rocket Lake 在 Linux 内核 5.10 上所做的工作，绝对是一件好事。

#### Radeon RX 6000 系列开源驱动

尽管我们是在 Big Navi 揭晓前一天才报道的，但 Radeon RX 6000 系列绝对会是一个令人印象深刻的东西，可以和 NVIDIA RTX 3000 系列竞争。

当然，除非它和 Vega 系列或 5000 系列遇到的同样问题。

很高兴在 Linux 内核 5.10 上看到下一代 Radeon GPU 的开源驱动已经完成。

#### 文件系统优化和存储改进

[Phoronix][6] 报道了 5.10 也对文件系统进行了优化和存储改进。所以，从这一点来看，我们应该会看到一些性能上的改进。

#### 其他改进

毫无疑问，你应该期待新内核带来大量的驱动更新和硬件支持。

目前，对 SoundBlaster AE-7 的支持、对 NVIDIA Orin（AI 处理器）的早期支持以及 Tiger Lake GPU 的改进似乎是主要亮点。

Linux 内核 5.10 的稳定版本应该会在 12 月中旬左右发布。它将被支持至少 2 年，但可能一直会有安全和 bug 修复更新，直到 2026 年。因此，我们将继续关注下一个 Linux 内核 5.10 LTS 版本的发展，以获得任何令人兴奋的东西。

你对即将发布的 Linux 内核 5.10 有什么看法？请在评论中告诉我们你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/kernel-5-10/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linux-kernel-5-4/
[2]: https://itsfoss.com/kernel-5-8-release/
[3]: https://twitter.com/gregkh/status/1320745076566433793?ref_src=twsrc%5Etfw
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/kernel-5-10-release.png?resize=800%2C450&ssl=1
[5]: https://www.tomsguide.com/news/amd-ryzen-5000-revealed-what-it-means-for-pc-gaming
[6]: https://www.phoronix.com/scan.php?page=article&item=linux-510-features&num=1
