[#]: subject: "Linux Kernel 5.18 RC1 Unveils AMD, Intel Updates and More"
[#]: via: "https://www.debugpoint.com/2022/04/linux-kernel-5-18-rc1/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Kernel 5.18 RC1 Unveils AMD, Intel Updates and More
======
THE KERNEL ANNOUNCEMENTS INTRODUCE the FIRST RELEASE CANDIDATE, I.E.
LINUX KERNEL 5.18 RC1, FOR TESTING BY LINUS TORVALDS. WE WRAP UP THE
MAJOR FEATURES OF THIS KERNEL IN THIS POST.
the **first release candidate, i.e. Linux Kernel 5.18 RC1, for testing by Linus Torvalds. We wrap up the major features of this kernel in this post.**

Following the [Linux Kernel 5.17][1] release last month, Linus Torvalds announced the first release candidate availability of Linux Kernel 5.18. With this announcement, the official merge window of Linux Kernel 5.18 is now closed, which means no new features are to be accepted unless it’s critical.

Looking at the features of Linux Kernel 5.18 looks like regular updates to support newer processors, GPUs, and SoCs from major manufacturers. Also, we can see some performance improvements and obsolete code removal for drivers.

But why does the kernel needs patches for Tesla’s chip? Well, let’s dig in to find out. One exciting addition is the support for Tesla’s Full-scale Driving SoC in the mainline kernel, whose work is done mainly by Samsung and others.

Without further introduction, let’s take a look at the new features.

![Linux Kernel 5.18 Rc1][2]

### Linux Kernel 5.18 RC1 – New Features

#### Processors (CPU, CPU and SoC)

Most of the work on Intel’s Alder Lake N SoCs [lands][3] in this Kernel version. The upcoming low-power and lower-end devices [such as Chromebooks] featuring Alder Lake N SoC should work efficiently.

A good b[u][4][n][4][ch][4] of RISC-V architecture support (open-source implementation of ARM] lands. Significant changes include:

  * Improved PolarFire SoC support, optimized MEMMOVE code, support for Restartable Sequences.
  * CPU Idle support using the newer SBI (Supervisor Binary Interface) extension [contributed by Western Digital]
  * Support for the CURRENT_STACK_POINTER kernel option for extra stack debugging around the hardened user-copy code.
  * RISC-V’s default configuration files now opt for “CONFIG_PROFILING” enabled by default.



Other media work for this new kernel includes the Atmel microchip csi2dc driver, new sensor drivers, Mediatek MT8192 support in the MTK-VCodec driver, and other changes.

NVIDIA Tegra Video Decode Driver (Tegra-VDE) is now [available][5] in kernel 5.18.

AMD [added][6] some sound driver code for its upcoming series of platforms, such as Acp 3.0 (Audio Co-Processor), ACP PCI/PDM and Renoir.

One interesting change is the [support for Tesla’s full self-driving SoC (FSD)][7] in this kernel. But you might ask why? Why does the Linux kernel need to maintain Tesla’s chip support? Because Tesla and Samsung both have some benchmark of development environment consisting of Linux, they might need to do testing and work for their chip. And hence this patch also reduces maintainability from their standpoint as it always remains build-able. It opens sources of some of their patches, which is good for the community as a whole.

#### Storage and Virtualizations

The KVM for Linux on 64-bit architecture [adds][8] improvements of Microsoft Hyper-V, Intel IPI (initial support), and AMD AVIC supports. With this change, AMD can now support up to 511 virtual CPUs in the Linux systems.

Another [interesting][9] change on exFAT introduces support for paths with trailing dots. It was stripped out earlier by exFAT in Linux.

Linux 5.18 no longer [clears][10] VolumeDirty in writeback, and essential change to avoid shortening the life of the storage device.

Several [improvements][11] to the random/RNG code for the kernel are introduced.

Moreover, this kernel release [adds][12] the initial Apple NVMe open-source driver for Linux systems, a new driver altogether. The reason is Apple’s design of NVMe in its M1 Macs, which is not connected to PCIe bus for data transfer, and also it runs a proprietary RTOS.

EXT4 file-system [sees][13] bug fixes and improvements on ordered data mode improving commit latency.

EROFS Read-Only Linux sees some slight [improvement][14] on the meta buffer operations.

This kernel [release][15] exposes the PECI interface between the CPU and baseboard management controllers (BMCs) and other platform management devices on Intel server platforms.

Also, the ReiserFS file system is [deprecated][16] from now on, starting with this kernel release. The decision is taken on the consideration of no-one is using it anymore.

#### Input/Output improvements and Other updates

Alibaba requested SM3 (part of the Chinese Commercial Cryptography Suite) hash algorithm finally [merged][17] in this version. And it expects a 38% increase in performance with this AVX code on a Skylake system using this algorithm.

The MT6779 keypad found in Mediatek T6779 and other SoCs has a new driver in this kernel release.

And finally, the Imagis touchscreen driver [adds][18] catering to the IST3038C touchscreen chips.

### Linux Kernel 5.18 Download

If you want to test and try this release candidate, download the release tarball [here][19]. Or refer below for a direct link to tar and diffs.

| | | | | | | | | | | | --------- | ------------ | ---------- | ---------------------------------------------------------------------- | | -------------------------------------------------------------- | | ------------------------------------------------------------------- | --------------------------------------------------------- | | | mainline: | **5.18-rc1** | 2022-04-03 | [[tarball][20]] | | [[patch][21]] | | [[view diff][22]] | [[browse][23]] | |

There will be multiple kernel iterations until the final release, expected around May 2022.

* * *

We bring the latest tech, software news and stuff that matters. Stay in touch via [Telegram][24], [Twitter][25], [YouTube][26], and [Facebook][27] and never miss an update!

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/04/linux-kernel-5-18-rc1/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/2022/03/linux-kernel-5-17/
[2]: https://www.debugpoint.com/wp-content/uploads/2022/04/Linux-Kernel-5.18-Rc1-1024x576.jpg
[3]: https://lore.kernel.org/dri-devel/YgKFLmCgpv4vQEa1@intel.com/
[4]: https://lore.kernel.org/lkml/mhng-e0c01ab7-020f-4264-91da-0852f7e89534@palmer-mbp2014/
[5]: https://lore.kernel.org/lkml/20220322101406.459e2950@coco.lan/
[6]: https://lore.kernel.org/lkml/s5hfsn8tyll.wl-tiwai@suse.de/
[7]: https://lore.kernel.org/lkml/20220321123625.BA8CDC340F2@smtp.kernel.org/
[8]: https://lore.kernel.org/lkml/20220321173215.2824704-1-pbonzini@redhat.com/
[9]: https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat.git/commit/?h=dev&id=9ec784bf774c2d3b35a7577fc6441cfbd60aefea
[10]: https://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat.git/commit/?h=dev&id=a4a3d8c52d952ab1f5c8b8b67b57f2e01936628d
[11]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=478f74a3d8085076dfcb481aa9361b808a6aae94
[12]: https://lore.kernel.org/lkml/20220321165049.35985-1-sven@svenpeter.dev/
[13]: https://lore.kernel.org/lkml/YjuYwa2jhanwyryf@mit.edu/
[14]: https://lore.kernel.org/lkml/YjgtIqJK0Io+zYeI@debian/
[15]: https://lore.kernel.org/lkml/YkG6jOtPmhHehQoz@kroah.com/
[16]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a452c4eb404df8a7f2a79a37ac77b90b6db1a2c9
[17]: https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git/log/
[18]: https://lkml.org/lkml/2022/4/1/3
[19]: https://www.kernel.org/
[20]: https://git.kernel.org/torvalds/t/linux-5.18-rc1.tar.gz
[21]: https://git.kernel.org/torvalds/p/v5.18-rc1/v5.17
[22]: https://git.kernel.org/torvalds/ds/v5.18-rc1/v5.17
[23]: https://git.kernel.org/torvalds/h/v5.18-rc1
[24]: https://t.me/debugpoint
[25]: https://twitter.com/DebugPoint
[26]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[27]: https://facebook.com/DebugPoint
