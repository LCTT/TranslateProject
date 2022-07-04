[#]: subject: "Linux Kernel 5.19 RC1 Released, Concluding ARM Generic Kernel Work"
[#]: via: "https://www.debugpoint.com/2022/06/linux-kernel-5-19-rc1/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "Donkey-Hao"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14692-1.html"

Linux 内核 5.19 RC1 发布，完成了 ARM 通用内核的工作
======

![](https://img.linux.net.cn/data/attachment/album/202206/10/100401b0t82bd0ww0o2tgn.jpg)

> Linus Torvalds 发布了用来测试的 Linux 内核 5.19 RC1，带来了一些重大变化。

继上个月 [Linux 内核 5.18][1] 发布之后，Linus Torvalds 宣布了 Linux 内核 5.19 系列第一个候选版本。与此同时，Linux 内核 5.19 官方合并窗口关闭，这意味着除非是关键性的，否则不会再接受任何新功能。

简单看一下 Linux 内核 5.19 的新内容，会发现 CPU、GPU、网络、存储和核心模块都有常规的更新。此外，代码清理、淘汰过时硬件和对以后芯片组的持续支持是此版本的亮点。

在进一步介绍之前，让我们简单来看一下这些新特性。

### Linux 内核 5.19（RC1）的新特性

#### CPU

首先需要提及的是，Linux 内核 5.19 开始 [初步支持][2] 龙芯架构的 CPU 系列。龙芯由中国龙芯中科公司设计开发。龙芯架构的 CPU 是兼容 MIPS 架构的通用微处理器。不过虽然现在提供了支持，但是你仍不能在龙芯 CPU 上启动 Linux，因为一些代码还在审核中。希望在 5.20 版本中能够使用。

新的 [英特尔 IFS 驱动][4] 在该版本中落地，这有助于在部署前后发现硬件问题。它能够在早期阶段检测电路层面的 CPU 错误。

在前几个针对英特尔 CPU 的内核版本中一直在对电源管理和散热方面进行开发，[这个版本][5] 也不例外。首先，为 Raptor 和 Alder Lake 家族添加了英特尔 <ruby>运行时平均功率限制<rt>Run-Time Average Power Limiting</rt></ruby>（RAPL）的支持。其次，改进了 P-state 驱动以处理频率变化，并且基于 CPU 的缩放支持被添加到被动 devfreq 中。

虽然英特尔 CPU 主要是散热和电源管理方面的工作，但对 AMD CPU 系列来说有更多的性能更新。首先，计划在今年年底完成 ZMD Zen 4 CPU 的 <ruby>基于指令的采样<rt>Instruction-Based Sampling</rt></ruby>（IBS）模块引入了更多更新。此外，此版本引入了 PerfMonV2，提供了更多性能监视能力。

此外，该版本中移除了 a.out 支持。同样，过时的 Renesas H8/300 CPU 也被移除了。

#### 主要 ARM 更新

终于，主线 Linux 内核能够 [支持 ARM 多平台][7] 了。在 Linus 的 RC1 开场白中可以看到，这是该版本中的巨大改变！从 Linux 3.7 开始，跨越了十多年的工作，这是多么漫长的过程。

![Linux 内核 5.19 Rc1 发布公告提到了 ARM 变化][8]

#### 图形和存储升级

存储子系统在各种流行的文件系统中都有性能提升。最主要的变化包括苹果 M1 NVMe 控制器支持和对 XFS 文件系统的更好支持。此外，Btrfs、F2FS 以及 exFAT 文件系统也有增强。

在代码行数方面，有一个令人兴奋的指标是仅是图形驱动程序 Linux 内核 5.19 就增加了大约[50 万行代码][9]。它包括 AMD 的 RDNA、CDNA，英特尔的 Raptor Lake、DG2/Alchemist 等图形驱动更新。

#### 重要的网络变化

鉴于数据传输大幅增长，对 Big TCP 的支持有助于支持数据中心 400 GBit 级别的流量。它还可以在高性能网络环境中降低延迟。

继续改进了 <ruby>多路径 TCP<rt>Multi-Path TCP</rt></ruby>（MPTCP）。此外，高通 ath11k WiFi 驱动程序在此版本中添加了网络唤醒功能。同样增加了对瑞昱的 8852ce 芯片、联发科的 T700 调制解调器以及瑞萨科技的 RZ/V2M 的支持。

#### 其他值得注意的功能

首先，内核中著名的随机函数生成器（RNG）在此版本中 [继续][10] 改进。

其次，著名的新兴的 Framework 模块化笔记本电脑获得了此版本 Chrome OS EC 驱动支持。Framework 笔记本现在可以作为一个非 Chromebook 设备利用 ChromeOS 的嵌入式控制器。

此外，Wacom 绘画板以及其他相关设备也有众多更新。[包括][11] 对联想 Thinkpad TrackPoint II、谷歌 Whiskers Touchpad、联想 X12 TrackPoint 等设备支持的提升。

### Linux 内核 5.19 下载

如果你想要测试并尝试该候选版本，可以在 [这里][12] 下载。

预计在 2022 年 7 月左右最终版本发布前，将会有多个版本更迭。

参考自：[内核邮件列表][17]

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/06/linux-kernel-5-19-rc1/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[Donkey-Hao](https://github.com/Donkey-Hao)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/2022/05/linux-kernel-5-18/
[2]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c6f2f3e2c80e975804360665d973211e4d9390cb
[3]: http://www.loongson.cn/
[4]: https://lore.kernel.org/lkml/13e61c61-0d4b-5f48-6373-f056bf8b603f@redhat.com/
[5]: https://lore.kernel.org/linux-acpi/CAJZ5v0hKBt3js65w18iKxzWoN5QuEc84_2xcM6paSv-ZHwe3Rw@mail.gmail.com/
[6]: https://lore.kernel.org/lkml/You6yGPUttvBcg8s@gmail.com/
[7]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ecf0aa5317b0ad6bb015128a5b763c954fd58708
[8]: https://www.debugpoint.com/wp-content/uploads/2022/06/Linux-Kernel-5.19-Rc1-release-announcement-mentions-ARM-changes.jpg
[9]: https://lore.kernel.org/lkml/CAPM=9tw62EZfAm0PbiOPmMrpfR98QMFTWGEQcA34G4ap4xxNkA@mail.gmail.com/
[10]: https://lore.kernel.org/lkml/20220522214457.37108-1-Jason@zx2c4.com/T/#u
[11]: https://lore.kernel.org/lkml/nycvar.YFH.7.76.2205241107530.28985@cbobk.fhfr.pm/
[12]: https://www.kernel.org/
[13]: https://git.kernel.org/torvalds/t/linux-5.19-rc1.tar.gz
[14]: https://git.kernel.org/torvalds/p/v5.19-rc1/v5.18
[15]: https://git.kernel.org/torvalds/ds/v5.19-rc1/v5.18
[16]: https://git.kernel.org/torvalds/h/v5.19-rc1
[17]: https://lore.kernel.org/lkml/CAHk-=wgZt-YDSKfdyES2p6A_KJoG8DwQ0mb9CeS8jZYp+0Y2Rw@mail.gmail.com/T/#u
