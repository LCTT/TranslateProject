[#]: subject: "Linux Kernel 5.19 系列第一个候选版本（RC1）发布，包含 ARM 通用工作"
[#]: via: "https://www.debugpoint.com/2022/06/linux-kernel-5-19-rc1/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " Donkey-Hao "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Kernel 5.19 系列第一个候选版本（RC1）发布，包含 ARM 通用工作
======
Linus Torvalds 发布了 Linux Kernel 5.19 RC1 进行测试，带来了重大变化。

继上个月 [Linux Kernel 5.18][1] 发布之后，Linus Torvalds 宣布 Linux Kernel 5.19 系列第一个候选版本可用。同时，Linux Kernel 5.19 官方合并窗口关闭，这意味着只有很关键的特性才会被接受。

简要介绍一下 Linux Kernel 5.19 的项目，会发现 CPU、GPU、网络、存储和核心模块会定期更新。 此外，代码清理、淘汰过时硬件和对以后芯片组的持续支持是此版本的亮点。

让我们简单来看一下这些新特性。

### Linux Kernel 5.19(RC1) 的新特性

#### 处理器

最重要的是，Linux Kernel 5.19 开始对龙芯架构 CPU 的 [初步支持][2]。龙芯由中国龙芯中科公司设计开发。龙芯架构下的 CPU 是通用 MIPS 架构兼容微处理器。尽管现在提供了支持，但是你仍不能在龙芯 CPU 上启动 Linux 因为一些代码还在审核中。希望在 5.20 版本中能够使用。


[Intel IFS 驱动 ][4] 在该版本中落地，这有助于在部署前后发现硬件问题。它能够在早期发现 CPU 关键部分的错误。


电源管理和散热工作在英特尔 CPU 的最后几个内核版本中继续进行。 在 [这个版本][5] 也不例外。首先，为 Raptor 和 Alder Lake 家族添加了英特尔运行时平均功率限制（RAPL）的支持。其次，为了处理频率变化升级了 P-state 驱动，并且基于 CPU 的缩放支持被添加到被动的 devfreq 中。


虽然散热和供电主导着英特尔 CPU ，但 AMD 看到了自己 CPU 系列更多的性能更新。首先，计划在今年年底完成 ZMD Zen 4 CPUs 的 Instruction-Based Sampling (IBS) 模块的很多更新。此外，此版本引入了 PerfMonV2 ，提供了更多性能监视能力。

此外，该版本中移除了 a.out 支持。同样，过时的 Renesas H8/300 CPU 也被移除了。
#### 主要 ARM 更新

最后，主线 Linux Kernel 能够 [支持多个 ARM 平台][7]。在 Linus 的 RC1 开场白中可以看到，这是此版本中的巨大改变！从 Linux 3.7 开始跨越了十多年的工作，这是多么漫长的过程。

![Linux Kernel 5.19 Rc1 发布公告提到了 ARM 更改][8]

#### 图像和存储升级

存储子系统实现了跨越流行文件系统的性能提升。最主要的变化包括苹果 M1 NVMe 控制器支持和对 XFS 文件系统的更好支持。此外，提升了 Btrfs ， F2FS 以及 exFAT 文件系统。

关于 LOC 有一个令人兴奋的指标是仅图像驱动程序， Linux Kernel 5.19 增加了大约[50 万行代码][9] 。包括 AMD RDNA, CDNA, 英特尔的 Raptor Lake, DG2/Alchemist 等图形架构更新。

#### 重要的网络变化

鉴于数据传输大幅增长，对 Big TCP 的支持有助于数据中心流量达到 400 GBit 的范围。它还可以在高性能网络环境中降低延迟。

继续改进了 Multi-Path TCP (MPTCP) 。此外，高通 ath11k WiFi 驱动程序在此版本中添加了网络唤醒功能。同样增加了对瑞昱的 8852ce 芯片，联发科的 T700 调制解调器以及瑞萨科技的 RZ/V2M 的支持。

#### 其他值得注意的功能

首先，内核中著名的随机函数生成器在此版本中 [继续][10] 改进。

其次，著名的初创公司 Framework 模块化笔记本电脑获得了此版本 Chrome OS EC 驱动支持。 Framework 笔记本现在可以利用 ChromeOS 的嵌入式控制器作为 non-Chromebook 设备。

此外， Wacom 绘画板以及其他相关设备也有众多更新。 [包括][11] 对联想 Thinkpad TrackPoint II, 谷歌 Whiskers Touchpad, 联想 X12 TrackPoint 等设备支持的提升。

### Linux Kernel 5.19 下载

如果你想要测试并尝试该候选版本，可以在 [这里][12] 下载。或者参考下面的链接。

| - | - | - | - | - | - | - | - | - |
| :- | :- | :- | :- | :- | :- | :- | :- | :- |
| mainline: | 5.19-rc1 | 2022-06-06 | [tarball][13] |  | [patch][14] |  | [view diff][15] | [browse][16] |

预计在2022年7月左右最终版本发布前，将会有多个版本更迭。

*[Kernel 邮件列表.][17]*

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/06/linux-kernel-5-19-rc1/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[Donkey-Hao](https://github.com/Donkey-Hao)
校对：[校对者ID](https://github.com/校对者ID)

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
