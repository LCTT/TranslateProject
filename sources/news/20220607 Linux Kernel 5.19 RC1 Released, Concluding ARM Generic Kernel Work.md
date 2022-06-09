[#]: subject: "Linux 内核 5.19 系列第一个候选版本（RC1）发布，包含 ARM 通用工作"
[#]: via: "https://www.debugpoint.com/2022/06/linux-kernel-5-19-rc1/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " Donkey-Hao "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux 内核 5.19 系列第一个候选版本（RC1）发布，包含 ARM 通用工作
======
Linus Torvalds 发布了 Linux Kernel 5.19 RC1 进行测试，带来了重大变化。

继上个月 [Linux Kernel 5.18][1] 发布之后，Linus Torvalds 宣布 Linux 内核 5.19 系列第一个候选版本可用。同时，Linux 内核 5.19 官方合并窗口关闭，这意味着只有很关键的特性才会被认可。

A brief look at the new items in Linux Kernel 5.19 shows regular updates across CPU, GPU, networking, storage and core modules. In addition, the code cleanups, removal of obsolete hardware and continuous support for future chipsets are the highlight of this release.
在 Linux Kernel 5.19 的简要介绍显示了 CPU、GPU、网络、存储和核心模块的定期更新。 此外，代码清理、淘汰过时硬件和对以后芯片组的持续支持是此版本的亮点。

让我们简单来看一下这些新特性

### Linux 内核 5.19(RC1) 的新特性

#### 处理器

最重要的是，Linux Kernel 5.19 开始对龙芯架构 CPU 的 [初步支持][2]。龙芯由中国龙芯中科公司设计。龙芯架构下的 CPU 是通用 MIPS 架构兼容处理器。尽管现在支持服务，但是你仍不能在龙芯上启动 Linux 因为代码还在审核中。希望在 5.20 版本中能够使用。

[Intel IFS 驱动 ][4] 在该版本中落地，这有助于在部署前后发现硬件问题。它能够在早期发现 CPU 关键部分的错误。

The power management and thermal work have continued for the last couple of Kernel releases for Intel CPUs. And [this release][5] also is no exception. Firstly, the Intel Run-Time Average Power Limiting (RAPL) support was added for Raptor and Alder Lake family. Second, the P-state driver is improved to handle frequency variance and CPU based scaling support is added to the passive devfreq.



While the thermal and power dominated Intel CPUs, AMD sees more performance updates in its own CPU families. Firstly, more updates were [introduced][6] in the Instruction-Based Sampling (IBS) module for AMD Zen 4 CPUs are planned for the end of this year. Moreover, PerfMonV2 is introduced in this release giving more performance monitoring capabilities.

Furthermore, the a.out support is removed in this release. Also, the Renesas H8/300 CPU architecture support is removed as its obsolete by now.

#### Major ARM update

Finally, the mainline Linux Kernel can [support multiple ARM platforms][7] with this release. This is a big step in this version, which is heard in Linus’s opening note on this Rc1 release. This is a long process that started with Linux 3.7 and spanned more than a decade of work and patches.

![Linux Kernel 5.19 Rc1 release announcement mentions ARM changes][8]

#### Graphics and Storage Updates

The storage subsystem sees performance improvements across popular file systems. The significant changes include Apple M1 NVMe controller support and better support for the XFS file system. In addition, enhancements arrive for Btrfs, F2FS and exFAT file systems.

One of the exciting metrics in terms of LOC is Linux Kernel 5.19 adds around [half-million lines of code][9] for the Graphics driver alone. It includes graphics updates across AMD RDNA, CDNA, Intel’s Raptor Lake, Intel’s DG2/Alchemist and more.

#### Important Networking Changes

Looking at the massive growth in the data transmission, the support for Big TCP lands which helps the data centre traffic at a range of 400GBit. It also aims to give lower latency in high-performance networking environments.

The Multi-Path TCP (MPTCP) continues its improvements. In addition to that, Qualcomm ath11k WiFi driver adds wake-on-lan support in this version. Also, support is added for Realtek 8852ce chipset, MediaTek T700 modems and Rensas RZ/V2M

#### Other Notable Features

Firstly, the famous random number generator in Kernel [continues][10] its improvements in this release.

Second, the famous and emerging Framework Modular Laptop gets this release Chrome OS EC Driver support. The Framework laptop now can take advantage of ChromeOS’s embedded controller as a non-Chromebook device.

Moreover, more updates arrive at Wacom tabs and other related devices. It [includes][11] improved support for Lenovo Thinkpad TrackPoint II, Google Whiskers Touchpad, Lenovo X12 TrackPoint, etc.

### Linux Kernel 5.19 Download

If you want to test and try this release candidate, download the release tarball [here][12]. Or refer below for a direct link to tar and diffs.

| - | - | - | - | - | - | - | - | - |
| :- | :- | :- | :- | :- | :- | :- | :- | :- |
| mainline: | 5.19-rc1 | 2022-06-06 | [tarball][13] |  | [patch][14] |  | [view diff][15] | [browse][16] |

There will be multiple kernel iterations until the final release, expected around July 2022.

*[Via Kernel mailing list.][17]*

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/06/linux-kernel-5-19-rc1/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/Donkey-Hao)
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
