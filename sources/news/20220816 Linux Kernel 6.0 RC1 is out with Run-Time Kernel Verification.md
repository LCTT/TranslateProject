[#]: subject: "Linux Kernel 6.0 RC1 is out with Run-Time Kernel Verification"
[#]: via: "https://www.debugpoint.com/linux-kernel-6-0-rc1/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Kernel 6.0 RC1 is out with Run-Time Kernel Verification
======
Linus Torvalds releases Linux Kernel 6.0 RC1 for everyone to test, and here’s a feature recap.

![Linux Kernel 6.0][1]

Following the [Linux Kernel 5.19][2] released a few days back, Linus [released the first release candidate][3] of Linux 6.0 for testing. It officially closes the merge window for this release while you test.

### Why 6.0?

Usually, the mainline Kernel version increases by the minor version and this release should have been Kernel 5.20. However, Linus decided to increase the significant version number, hence the Kernel 6.0.

> Despite the major number change, there’s nothing fundamentally different about this release – I’ve long eschewed the notion that major numbers are meaningful, and the only reason for a “hierarchical” numbering system is to make the numbers easier to remember and distinguish. Which is why when the minor number gets to around 20 I prefer to just increment the major number instead and reset to something smaller.

Let’s take a look at what’s in store.

### Linux Kernel 6.0 RC1 – New Features

#### Processors

AMD Zen systems gets a [performance boost][4] with updated NUMA balancing in the Kernel scheduler.

The Ratbleed speculative execution exploits fixing [continues][5] in this release affecting Intel 8th Gen+ and AMD Zen 1+ CPU family. Although the Ratbleed has not yet been found in the wild (only in Lab), the fix continues in this Kernel.

Lenovo and AMD [bring][6] the Automatic Mode Transition (AMT) support for Ryzen power ThinkPad laptops. This feature should give firmware-based power handling in those laptops with better efficiency.

New audio hardware [support][7] for AMD Ryzen 7000 desktop processors (Raphael) lands in this release with ACP 6.x support.

AMD is [preparing][8] for the release day with additional Instruction based sampling support for the Zen 4 series.

More CPU [temperature monitoring code][9] lands for AMD 17th and 19th family of models.

Initial work starts landing for Lenovo’s ARM Laptop X13 featuring Qualcomm Snapdragon 8cx Gen3 (SC8280XP) CPU.

Likewise, in all releases, a bunch of SOC chips get support in Linux Kernel 6. The most notable ones include NXP i.MX93 SoC (primarily used for smart devices in home solutions).

Here’s a quick list (not complete) of the SOCs that gets [support][10] in this instalment.

* Broadcom SOCs for broadband devices  * BCM63178  * BCM63158  * BCM4912  * BCM6858  * BCM6878  * BCM6846  * BCM63146  * BCM6856  * BCM6855  * BCM6756  * BCM63148  * BCM6813
* Allwinner’s H616 (IPTV, OTT streaming)
* Marvell Prestera 98DX2530
* Google Chameleon v3 FPGA

In addition, a bunch of RISC-V processor code was introduced with an aim to support it in future.

#### GPU

Work continues in this Kernel release for Intel DG2/Alchemist and AMD RDNA3 graphics cards; the support is entirely not there but is in progress for future versions.

A bunch of frame buffer device driver [update][11] (mostly fixes) arrives for Atari GPUs. Most noteworthy are the patchsets to fix VGA modes, colour handling and numerous code clean-ups.

Intel Meteor Lake GPU [support][12] is starting up in this release.

#### Storage and file systems

Like all releases, the famous and supported file systems are updated and improved.

Since the usage of SSDs is increasing, the flash-friendly file system (F2FS) [enhances][13] memory handling, garbage collection optimization and more.

One Microsoft employee provides a [patch][14] to improve locking performance & reliability for CIF/SMB3 protocol to improve multi-channel operation over the network.

#### Additional Changes

Other noteworthy changes across this Kernel release include early work for Wi-Fi 7 support, more feature updates on the ongoing random number generation and setting up system hostname via Kernel parameter.

Furthermore, one of the vital features is the “Run-Time Verification” codebase which helps Linux run in safety-critical infrastructure. The method takes an approach where the system specification instruction set is compared against the actual execution instruction set by re-implementing instruction sets at run-time. This is based on a paper which you can read [here][15]. The actual patch is present on this [page][16].

### Download

You can download the source tree from the following page:

| - | - | - | - | - |
| :- | :- | :- | :- | :- |
| mainline: | 6.0-rc1 | [tarball] | [patch] | [browse] |

If you are running benchmarks, testing new hardware and finding issues, report to the Kernel mailing list.

The Linux Kernel 6.0 is expected to be released by the beginning of Q4 2022, i.e. October timeframe. Hence, Ubuntu 22.10 may get this version (although I am doubtful about that).

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/linux-kernel-6-0-rc1/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2022/08/kernel6rc1.jpg
[2]: https://www.debugpoint.com/2022/05/linux-kernel-5-18/
[3]: https://lore.kernel.org/lkml/CAHk-=wgRFjPHV-Y_eKP9wQMLFDgG+dEUHiv5wC17OQHsG5z7BA@mail.gmail.com/T/#u
[4]: https://lore.kernel.org/lkml/Yufc5Mq1aqLVV%2FOv@gmail.com/T/#u
[5]: https://lore.kernel.org/lkml/Yvd%2Fg8RODN%2FpSkCX@gmail.com/T/#u
[6]: https://lore.kernel.org/lkml/19d29009-ab84-fffc-82dd-9754e65b092e@redhat.com/
[7]: https://www.phoronix.com/news/AMD-Raphael-Audio-Driver-Linux
[8]: https://lkml.org/lkml/2022/8/4/694
[9]: https://lore.kernel.org/lkml/Yue6jQd37wpssGeZ@zn.tnic/
[10]: https://lore.kernel.org/linux-arm-kernel/CAK8P3a1DVcc=AV29AJJxMzBVoU-grFaNet0ndxPgPFvpK-ZANQ@mail.gmail.com/T/
[11]: https://lore.kernel.org/lkml/Yu7J2Yj6UyAiE2Ne@ls3530/
[12]: https://lists.freedesktop.org/archives/dri-devel/2022-July/364441.html
[13]: https://lore.kernel.org/lkml/YvE6fO1r0znOdr60@google.com/
[14]: https://lore.kernel.org/lkml/CAH2r5mvaTWyWnPpYk=OPCbud85LEo5Oj=K2ZK56jmri6452zRQ@mail.gmail.com/
[15]: https://dl.acm.org/doi/abs/10.1007/978-3-030-30446-1_17
[16]: https://lore.kernel.org/lkml/20220803112014.7ffed04e@gandalf.local.home/
