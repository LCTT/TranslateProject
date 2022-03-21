[#]: subject: "Linux Kernel 5.17 Brings New Hardware Support And Steam Deck Improvements"
[#]: via: "https://news.itsfoss.com/linux-kernel-5-17-release/"
[#]: author: "Jacob Crume https://news.itsfoss.com/author/jacob/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Kernel 5.17 Brings New Hardware Support And Steam Deck Improvements
======

Linux 5.17 is here, after a week of [unexpected delay to fix Spectre exploits][1]. While there aren’t any massive changes here, there are a few smaller tweaks and important improvements for those running some specific systems.

Let’s take a look at what’s new!

### What’s New In Linux Kernel 5.17?

Alongside the typical driver and file system improvements, Linux 5.17 brings support for new ARM and RISC-V SoCs. Additionally, laptop and tablet users may notice some small improvements as well.

While [Linux Kernel 5.16][2] also focused on new hardware and gaming improvements, Linux Kernel 5.17 is particularly exciting considering it involves a lot of new hardware support.

The improvements benefit new-gen Intel processors and a significant number of preparations for AMD’s chips.

#### Improved Intel Graphics Support

![][3]

As one of the biggest companies in the world, Intel is always improving the Linux Kernel. This time around, these improvements include [initial support][4] for their upcoming Raptor Lake S SKUs and [variable refresh rates][5] for older Icelake SKUs.

Intel has also brought their Alder Lake P driver to the stable mainline to top this off. This comes after many revisions and over a year of development, so it should be a great addition.

Not to forget, the work to support Intel’s upcoming Alchemist discrete GPUs continues with this release.

Although these changes probably won’t affect many current Linux users, it is always good to see support for the latest hardware.

#### Improved Steam Deck &amp; AMD Laptop Support

With Valve’s Steam Decks already shipping, it is not surprising that some significant improvements are coming to the device. For those of you out of the loop, the Steam Deck is a Nintendo Switch-like console that runs a modified version of Arch Linux. It has a powerful AMD CPU and an extremely affordable price.

As a device designed to be used on the go, battery life is crucial for the Steam Deck (and laptops as well). With Linux Kernel 5.17, this is set to be improved further thanks to the inclusion of a new [P-State driver][6]. This allows the CPU to better scale its power draw, saving the battery.

![][3]

I’m sure many Steam deck and AMD laptop users will be pleasantly surprised, especially as early tests by [Phoronix][7] look quite promising.

#### New ARM SoC Support

While not as major as the Apple M1 support of previous kernels, Linux Kernel 5.17 does support [a few more SoC][8]s.

Some notable models include the newly adopted **Snapdragon 8 Gen 1**, X65 modem, NXP i.MX8ULP, Texas Instruments J721S2, and the Renesas R-Car S4-8.

The inclusion of support for the Snapdragon 8 Gen 1 opens up a range of possibilities, and it’s now only a matter of time before someone gets a functioning port booted.

#### Laptop Updates

This release also brings numerous laptop-specific improvements. In addition to the P State driver mentioned above, AMD users may also notice some fixes related to sleep. The sound driver has also been fixed.

For those running devices with pen inputs, Universal Stylus Initiative support has also been added. This comes with the benefit of allowing styluses from different manufacturers to be used on all compatible devices, among others.

Also, now the users of Asus ROG laptops can now adjust fan curves from the OS itself, a particularly useful feature for gaming laptops.

#### Filesystem Improvments

[F2FS][9], [Btrfs][10], and [XFS][11] have received some minor performance gains. However, the EXT4 file system has received a massive update, in that it now uses the [Linux Mount API][12]. This is a new API designed to replace the older mount syscall, with its main feature being increased control over the whole process.

Additionally, the FS-Cache and CacheFiles modules have received a [major rewrite][13]. This should greatly simplify the relevant code, and ensure better future maintainability.

And, yes, a long-standing bug that caused the system to freeze when attempting to read from a damaged floppy disk has finally [been fixed][14].

Long live the greatest storage medium of all time: The floppy disk!

#### Other Key Enhancements

Alongside the major ones listed above, there are a few more notable changes. These include:

  * [Sv48 support][15] for RISC-V processors.
  * New NZXT driver to control lighting and fan controls with NZXT’s fan controller (or smart devices).
  * Nintendo GameCube / Wii U RTC [driver][16].
  * Many Intel Wi-Fi driver [improvements][17].
  * Intel Alder Lake N [audio][18] support.



For more technical details, you can refer to the [official announcement][19].

### Installing Linux 5.17

As always, I recommend waiting for your distribution to test and push out Linux Kernel 5.17 as an update. You can try using Arch or Fedora Linux to get access to the latest version.

And, for those of you feeling adventurous, a [tarball][20] is available from the official kernel website.

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/linux-kernel-5-17-release/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/linux-kernel-5-17-spectre-delay/
[2]: https://news.itsfoss.com/linux-kernel-5-16/
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQzOSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[4]: https://lore.kernel.org/dri-devel/87ee6f5h9u.fsf@intel.com/
[5]: https://lists.freedesktop.org/archives/intel-gfx/2021-November/284109.html
[6]: https://lore.kernel.org/lkml/CAJZ5v0jHk1fP=V_iDGKVOeYg4xt-EEdgi5UUtQA4_qrQvUibNA@mail.gmail.com/
[7]: https://www.phoronix.com/scan.php?page=article&item=amd-pstate-first&num=1
[8]: https://lore.kernel.org/linux-arm-kernel/CAK8P3a0RDZpLtWjMEU1QVWSjOoqRAH6QxQ+ZQnJc8LwaV7m+JQ@mail.gmail.com/
[9]: https://lore.kernel.org/lkml/YedlHVEa4sdbvB2F@google.com/
[10]: https://lore.kernel.org/lkml/cover.1641841093.git.dsterba@suse.com/
[11]: https://lore.kernel.org/lkml/YdyxjTFaLWif6BCM@mit.edu/
[12]: https://github.com/torvalds/linux/blob/master/Documentation/filesystems/mount_api.rst
[13]: https://lore.kernel.org/lkml/510611.1641942444@warthog.procyon.org.uk/
[14]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c9193f48e94deaeff0c9abbc67b9584e8ddc42ed
[15]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7867e402787a23001cfb81ff298b7d023fee676a
[16]: https://lore.kernel.org/lkml/Yen7oaDXAbd4tFOD@piout.net/
[17]: https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=bc11517bc8219314948780570ec92814d14d6602
[18]: https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?h=for-next&id=4d5a628d96532607b2e01e507f951ab19a33fc12
[19]: https://lore.kernel.org/lkml/CAHk-=wj4fFjx2pgbGNBM4wJs3=eReZ05EQyprzgT2Jv8qJ2vJg@mail.gmail.com/T/#u
[20]: https://www.kernel.org/
