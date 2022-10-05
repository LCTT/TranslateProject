[#]: subject: "Linux Kernel 6.0 is Officially Out with Run-Time Kernel Verification"
[#]: via: "https://www.debugpoint.com/linux-kernel-6-0/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Kernel 6.0 is Officially Out with Run-Time Kernel Verification
======
A new Kernel is here (Linux Kernel 6.0) with the best hardware support for your devices. Here’s a quick recap on the new features.

After seven release candidates and a lot of testing, Linus Torvalds [released][1] the latest mainline Linux Kernel 6.0 with significant hardware improvements and updates. This release is the successor of the Linux [Kernel 5.19][2] and brings a bump to the major version number, i.e. Linux Kernel 6.0.

Although, as per Linus, the numbering doesn’t mean anything other than a new version.

> So, as is hopefully clear to everybody, the major version number change is more about me running out of fingers and toes than it is about any big fundamental changes.

> But of course there’s a lot of various changes in 6.0 – we’ve got over 15k non-merge commits in there in total, after all, and as such 6.0 is one of the bigger releases at least in numbers of commits in a while.

> The shortlog of changes below is only the last week since 6.0-rc7. A little bit of everything, although the diffstat is dominated by drm (mostly amd new chip support) and networking drivers.

> And this obviously means that tomorrow I’ll open the merge window for 6.1. Which – unlike 6.0 – has a number of fairly core new things lined up. But for now, please do give this most recent kernel version a whirl.

[announcement][3]

I have already round-up the features in the [RC-1 post][4], but for the new users, here’s what’s new in Linux Kernel 6.0.

### Linux Kernel 6.0: New Features

#### Processors

AMD Zen systems gets a [performance boost][5] with updated NUMA balancing in the Kernel scheduler.

The Ratbleed speculative execution exploits fixing [continues][6] in this release affecting Intel 8th Gen+ and AMD Zen 1+ CPU family. Although the Ratbleed has not yet been found in the wild (only in Lab), the fix continues in this Kernel.

Lenovo and AMD [bring][7] the Automatic Mode Transition (AMT) support for Ryzen power ThinkPad laptops. This feature should give firmware-based power handling in those laptops with better efficiency.

New audio hardware [support][8] for AMD Ryzen 7000 desktop processors (Raphael) lands in this release with ACP 6.x support.

AMD is [preparing][9] for the release day with additional Instruction based sampling support for the Zen 4 series.

More CPU [temperature monitoring code][10] lands for AMD 17th and 19th family of models.

Initial work starts landing for Lenovo’s ARM Laptop X13 featuring Qualcomm Snapdragon 8cx Gen3 (SC8280XP) CPU.

Likewise, in all releases, a bunch of SOC chips get support in Linux Kernel 6. The most notable ones include NXP i.MX93 SoC (primarily used for smart devices in home solutions).

Here’s a quick list (not complete) of the SOCs that gets [support][11] in this instalment.

* Broadcom SOCs for broadband devices  * BCM63178  * BCM63158  * BCM4912  * BCM6858  * BCM6878  * BCM6846  * BCM63146  * BCM6856  * BCM6855  * BCM6756  * BCM63148  * BCM6813
* Allwinner’s H616 (IPTV, OTT streaming)
* Marvell Prestera 98DX2530
* Google Chameleon v3 FPGA

In addition, a bunch of RISC-V processor code was introduced with an aim to support it in future.

#### GPU

Work continues in this Kernel release for Intel DG2/Alchemist and AMD RDNA3 graphics cards; the support is entirely not there but is in progress for future versions.

A bunch of frame buffer device driver [update][12] (mostly fixes) arrives for Atari GPUs. Most noteworthy are the patchsets to fix VGA modes, colour handling and numerous code clean-ups.

Intel Meteor Lake GPU [support][13] is starting up in this release.

#### Storage and file systems

Like all releases, the famous and supported file systems are updated and improved.

Since the usage of SSDs is increasing, the flash-friendly file system (F2FS) [enhances][14] memory handling, garbage collection optimization and more.

One Microsoft employee provides a [patch][15] to improve locking performance & reliability for CIF/SMB3 protocol to improve multi-channel operation over the network.

#### Additional Changes

Other noteworthy changes across this Kernel release include early work for Wi-Fi 7 support, more feature updates on the ongoing random number generation and setting up system hostname via Kernel parameter.

Furthermore, one of the vital features is the “Run-Time Verification” codebase which helps Linux run in safety-critical infrastructure. The method takes an approach where the system specification instruction set is compared against the actual execution instruction set by re-implementing instruction sets at run-time. This is based on a paper which you can read [here][16]. The actual patch is present on this [page][17].

### How to Download and Install Linux Kernel 6.0

Remember that using the bleeding-edge mainline Linux Kernel in your production systems/daily-drive laptops/desktops is not wiser unless you have a specific requirement. Or have the latest GPU, CPU, which requires support.

For general users, it’s always best to wait for a few weeks until all the major Linux Distributions bring this version via their official stable channel after proper testing.

That being said, if you still want to install this version, go ahead and follow the below instructions, which I lined up here.

* Firstly, visit the [mainline kernel page][18].  * There are two types of builds available – generic and lowlatency. You can download generic builds that work most of the time for standard systems.   * For audio recordings and other setups that require low latency (like real-time feeds), download the lowlatency one.
* Secondly, download the below four packages for generic via terminal and install them.

```
wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v6.0/amd64/linux-headers-6.0.0-060000-generic_6.0.0-060000.202210022231_amd64.deb
wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v6.0/amd64/linux-headers-6.0.0-060000_6.0.0-060000.202210022231_all.deb
wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v6.0/amd64/linux-image-unsigned-6.0.0-060000-generic_6.0.0-060000.202210022231_amd64.deb
wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v6.0/amd64/linux-modules-6.0.0-060000-generic_6.0.0-060000.202210022231_amd64.deb
```

```
sudo dpkg -i *.deb
```

* After installation, reboot the system.
* The instruction for lowlatency and other architecture (e.g., ARM) installations are the same. Replace the package name in the above wget commands. You can find them on the mainline Kernel page.

#### Distro support

Arch Linux users should get this version by October-end/1st week of November via monthly ISO refresh.

Due to a schedule mismatch, Ubuntu 22.10 and Fedora 37 would not feature this Kernel. So, you have to wait a little longer to get this version.

### Wrapping Up

This release opens the merge window for the following Linux Kernel 6.1, which is expected to bring huge updates such as Rust framework implementation and many others. Looking at the trends and other moving parts, 2023 will be an exciting year for Linux, Rust, and Apple Silicon support.

Cheers.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/linux-kernel-6-0/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://lkml.org/lkml/2022/10/2/255
[2]: https://www.debugpoint.com/linux-kernel-5-19/
[3]: https://lkml.org/lkml/2022/10/2/255
[4]: https://www.debugpoint.com/linux-kernel-6-0-rc1/
[5]: https://lore.kernel.org/lkml/Yufc5Mq1aqLVV%2FOv@gmail.com/T/#u
[6]: https://lore.kernel.org/lkml/Yvd%2Fg8RODN%2FpSkCX@gmail.com/T/#u
[7]: https://lore.kernel.org/lkml/19d29009-ab84-fffc-82dd-9754e65b092e@redhat.com/
[8]: https://www.phoronix.com/news/AMD-Raphael-Audio-Driver-Linux
[9]: https://lkml.org/lkml/2022/8/4/694
[10]: https://lore.kernel.org/lkml/Yue6jQd37wpssGeZ@zn.tnic/
[11]: https://lore.kernel.org/linux-arm-kernel/CAK8P3a1DVcc=AV29AJJxMzBVoU-grFaNet0ndxPgPFvpK-ZANQ@mail.gmail.com/T/
[12]: https://lore.kernel.org/lkml/Yu7J2Yj6UyAiE2Ne@ls3530/
[13]: https://lists.freedesktop.org/archives/dri-devel/2022-July/364441.html
[14]: https://lore.kernel.org/lkml/YvE6fO1r0znOdr60@google.com/
[15]: https://lore.kernel.org/lkml/CAH2r5mvaTWyWnPpYk=OPCbud85LEo5Oj=K2ZK56jmri6452zRQ@mail.gmail.com/
[16]: https://dl.acm.org/doi/abs/10.1007/978-3-030-30446-1_17
[17]: https://lore.kernel.org/lkml/20220803112014.7ffed04e@gandalf.local.home/
[18]: https://kernel.ubuntu.com/~kernel-ppa/mainline/v6.0
[19]: https://www.debugpoint.com/ubuntu-22-10/
[20]: https://news.google.com/publications/CAAqBwgKMOCfmgsw-qmyAw
[21]: https://t.me/debugpoint
