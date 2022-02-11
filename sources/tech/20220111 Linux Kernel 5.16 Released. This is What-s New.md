[#]: subject: "Linux Kernel 5.16 Released. This is What’s New"
[#]: via: "https://www.debugpoint.com/2022/01/linux-kernel-5-16/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Kernel 5.16 Released. This is What’s New
======
LINUS TORVALDS RELEASED LINUX KERNEL 5.16 AS THE FIRST STABLE KERNEL
RELEASE OF THE YEAR 2022, IMPROVING STORAGE, PROCESSOR, PORTS AND ALL
MODULES. WE WRAP UP THE RELEASE IN THIS POST WITH DOWNLOAD AND
INSTALLATION GUIDELINES.
Following a fairly lengthy release candidate and testing cycle since the [Kernel 5.15][1], the Linux Kernel 5.16 is here. This release brings numerous updates to processors, graphics cards, ports, ARM devices. Major updates include improvements to AMD Ryzen 6000 series support, Intel’s Alder Lake S Graphics looks almost stable, cool performance boost for AMD Ryzen with Raedon graphics and more.

Quoting Linus on this release –

> Not a lot here since -rc8, which is not unexpected. We had that extra week due to the holidays, and it’s not like we had lots of last-minute things that needed to be sorted out.
>
> So this mainly contains some driver fixes (mainly networking and rdma), a cgroup credential use fix, a few core networking fixes, a couple of last-minute reverts, and some other random noise. The appended shortlog is so small that you might as well scroll through it.
>
> [Linus][2]

![Linux Kernel 5.16 – New Release][3]

Here’s the recap of the major features.

### Linux Kernel 5.16 – Top New Features

#### Processors

Intel’s Advanced Matrix Extensions [support][4] looks stable in this Kernel. This x86 chip extension introduces a different and performant approach for matrix operations.

Some important RISC-V architecture [updates][5] added in this Kernel version that enables open-source NVIDIA driver Nouveau support, as NVIDIA never made the RISC-V driver public.

The first patch for the Raptor Lake processor lands in this Kernel. Raptor Lake is the upcoming next-generation Intel Processors, succeeding the Alder Lake.

Mainline Linux Kernel now [supports][6] the system on module – Raspberry Pi Compute Module. This enables direct mainline Kernel support and doesn’t require any separate driver builds. This system on module chip used for commercial and industrial deployments.

As usual, ARM support list is huge in this mainline release.

Apple M1 PCI Express and GPIO driver is mainlined, making it closer to reality of M1 working out-of-the-box.

Snapdragon 690 (SM6350) and SM7225 SoCs supports from Qualcomm.

Support for Samsung’s first automobile processor (for Cars etc.) ExynosAutov9 introduced.

Following the tradition, more rockchip boards now supported in mainline. This particular release brings support for Rockchip RK3566 / RK3688 SoC boards.

#### Graphics

Intel’s upcoming Alder Lake S graphics support is complete and stable, it seems, in this release. It is not experimental anymore from this Kernel version, and it is not hidden behind the force_probe switch anymore. It is enabled by default.

New PCI IDs for Intel DG1 is available and initial work lands for DG2 graphics card. Intel DG2/Alchemist graphics card planned to launch in 2022.

The [initial DisplayPort 2.0 Support lands][7] for AMD Radeon Graphics cards. The current Radeon RX 6000 series only supports DisplayPort 1.4. So, in 2022, overall DisplayPort 2.0 adoption is likely.

More USB4 support for AMD Graphics card is [introduced][8], which continued from earlier Kernel releases. This particular Kernel release adds patches for DisplayPort tunneling in AMD Graphics driver for the upcoming Yellow Carp/Rembrandt chips.

The AMD engineers added code to revamp the initial graphics driver loading from a PCI ID based discovery to IP table based approach. Typically, new graphics cards are identified using PCI IDs, which was a common approach. And now a clean and robust approach is introduced. A new IP discovery table contains various hardware information, which is now consumed by the Kernel. This helps to maintain and update the driver code in future and removes any hard coding of PCI IDs.

[][9]

SEE ALSO:   Linux Kernel 5.16 RC1 Unveils New Features and Hardware Support

Intel’s Protected Xe Path (PXP) support lands in this Kernel, making the video sessions more secure.

#### Storage and Network

The recently made popular file system btrfs sees [several performance improvements][10] in the area of compression, logging, error handling and also various bug fixes.

Performance and fixes for [XFS][11], [F2FS][12].

Some important performance improvements for SMB3/CIFS client changes [lands][13] from Microsoft and SUSE.

Support for Realtek 802.11ax WiFi Driver RT89 (rtw89) [lands][14] in this release as well.

#### Misc Updates

More support for Son[y PlayStation 5][15] and HP Omen Laptops.

Some [updates][16] added for the Steam Deck display panel.

A huge set of ASUS motherboards now have [working sensor support][17] via HWMON subsystem in this Kernel. You can find the list of motherboards here.

Apple Magic Keyboard 2021 [support][18] added in this Kernel.

System76 engineers introduces several patches catering to fan speed, batter performance, function keys and additional support for their line of Laptops.

### How to download and Install Linux Kernel 5.16

As we always recommend, not to install the latest Kernel in your already stable system. If you want to experience your new hardware which might have support, then go ahead. Otherwise, it is wiser to wait for your distro (such as Ubuntu or Fedora) to test and publish the latest Kernel builds via official package manager.

#### Installing in Ubuntu

You can install the mainline kernel packages from the below link right now in your latest Ubuntu or Ubuntu-based Linux distributions. If you are running Debian, Ubuntu, and other stable or Long Term (LTS) releases – do not upgrade using the below steps. Instead, wait for an official update via your Linux distribution.

For general users, unless you are keen to experiment with the latest hardware whose support is added in this release, you should not update at the moment.

If you still want to install the latest Linux Kernel 5.16, follow the below instructions to install in Ubuntu-based systems.

Visit the [mainline kernel page][19].

There are two types of builds available – and **lowlatency**. For common systems, you can download generic builds that work most of the time. For audio recordings and other setups that require low latency, download the lowlatency one.

Download below four packages for generic via terminal and install.

```

    wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.16/amd64/linux-headers-5.16.0-051600-generic_5.16.0-051600.202201092355_amd64.deb
    wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.16/amd64/linux-headers-5.16.0-051600_5.16.0-051600.202201092355_all.deb
    wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.16/amd64/linux-image-unsigned-5.16.0-051600-generic_5.16.0-051600.202201092355_amd64.deb
    wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.16/amd64/linux-modules-5.16.0-051600-generic_5.16.0-051600.202201092355_amd64.deb

```

After installation, reboot the system.

The instruction for lowlatency and other architecture (ARM) installations are the same. Replace the package name in the above wget commands. You can find them on the mainline Kernel page.

For Arch Linux users, it is expected that Linux Kernel 5.16 release packages arrive within the February 2022 first week during monthly Arch .iso refresh.

With this release, the merge window opens for next Linux Kernel 5.17.

* * *

We bring the latest tech, software news and stuff that matters. Stay in touch via [Telegram][20], [Twitter][21], [YouTube][22], and [Facebook][23] and never miss an update!

##### Also Read

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/01/linux-kernel-5-16/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/tag/linux-kernel-5-15
[2]: https://lore.kernel.org/lkml/CAHk-=wgUkBrUVhjixy4wvrUhPbW-DTgtQubJWVOoLW=O0wRKMA@mail.gmail.com/T/#u
[3]: https://www.debugpoint.com/wp-content/uploads/2022/01/kernel516-1024x576.jpg
[4]: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/log/?h=x86/fpu
[5]: https://lkml.org/lkml/2021/11/12/619
[6]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ae45d84fc36d01dcb1007f4298871eec37907904
[7]: https://lists.freedesktop.org/archives/amd-gfx/2021-September/069487.html
[8]: https://lists.freedesktop.org/archives/amd-gfx/2021-October/070651.html
[9]: https://www.debugpoint.com/2021/11/linux-kernel-5-16-rc1/
[10]: https://lore.kernel.org/lkml/cover.1635773880.git.dsterba@suse.com/
[11]: https://lkml.org/lkml/2021/11/2/894
[12]: https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=6691d940b0e09dd1564130e7a354d6deaf05d009
[13]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c8103c2718eb99aab954187ca5be14f3d994c9be
[14]: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers-next.git/commit/?id=e3ec7017f6a20d12ddd9fe23d345ebb7b8c104dd
[15]: https://lore.kernel.org/lkml/nycvar.YFH.7.76.2111051220020.12554@cbobk.fhfr.pm/T/#u
[16]: https://lists.freedesktop.org/archives/dri-devel/2021-September/323539.html
[17]: https://lore.kernel.org/lkml/20211101154445.591872-1-linux@roeck-us.net/
[18]: https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?h=for-5.16/apple&id=0cd3be51733febb4f8acb92bcf55b75fe824dd05
[19]: https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.16
[20]: https://t.me/debugpoint
[21]: https://twitter.com/DebugPoint
[22]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[23]: https://facebook.com/DebugPoint
