[#]: subject: "Linux Kernel 5.17 RC1 Unveils New Features and Hardware Support"
[#]: via: "https://www.debugpoint.com/2022/01/linux-kernel-5-17-rc1/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Kernel 5.17 RC1 Unveils New Features and Hardware Support
======
LINUX KERNEL 5.17 RC1 (RELEASE CANDIDATE 1) IS NOW AVAILABLE FOR
DOWNLOAD AND TESTING. IN THIS QUICK SUMMARY POST, WE BRING YOU THE MAJOR
ADDITIONS IN THIS NEW KERNEL RELEASE.
The official code merge window for Linux Kernel 5.17 is now closed. It is now available for wide testing by the developers, testers and of course by the end users.

> I was nervous that this merge window would be more painful than usual due to my family-related travels, but I have to give thanks to people: a lot of you sent your pull requests early in the merge window, and while there were a couple of hiccups I hit early on, that was all before switching my main workstation to a laptop. Everything seems to have gone fairly smoothly.
>
> Knock wood.
>
> [Linus][1]

In this Kernel you see the usual hardware support updates across Processors, Graphics, Storage, Networking and misc devices. So, no surprise there. Among the notable updates, it’s worth to mention AMD Zen family temperature support, a long-standing floppy disk hang bug fix, a handful of ARM/SoC support, performance improvements across file systems.

Also, this Kernel brings updates to the Random Number generator modules, page table check support and x86 Straight line speculation mitigation support.

![Linux Kernel 5.17 RC1 is now available][2]

This is what’s new in detail.

### Linux Kernel 5.17 – New Features – RC1

#### Processor

  * The ARM64 architecture in Linux Kernel now [included][3] with Kernel Concurrency Sanitizer (KCSAN). KSCAN is a race condition detector which already had support for other architectures. And now ARM64 is on the list. Also, initial work for Scalable Matrix Extensions (SME) that promises to provide better and faster support for Matrix operations.
  * AMD [brings][4] the k10temp-based CPU temperature monitoring for the AMD Zen family 19h CPU models.
  * A big set of Arm/SoC support [lands][5] in Linux Kernel 5.17. The major one includes the new Snapdragon 8 Gen 1 and X65 platforms. Other SoC includes – NXP i.MX8ULP, Texas Instruments J721S2, and Renesas R-Car S4-8.
  * One of the major CPU change is [inclusion][6] of the AMD P-State driver, which is developed in collaboration with Valve for the Steam Deck. This will lead to better power efficiency because of more granular controls on power due to ACPI Collaborative Processor Performance Controls (CPPC) exposure.
  * Another major RISC-V changes in this Kernel is [sv48 support][7] that allows 48-bit virtual address space. This enables the Kernel to address up to a whooping 128 TB of virtual address space.
  * This release brings a lot of laptops, Tablet driver updates. A list is available [here][8]. However, here are the major ones.
    * Custom fan curve support added for ASUS ROG Laptops.
    * Support for Universal Stylus Initiative (USI) and NVIDIA Tegra Tablets has been added.
    * Some performance improvement and fix for AMD based Laptops related to sleep and Sound drivers.



#### Graphics

  * After many iterations over last year, Intel’s Alder Lake P graphics is now stable in mainline. So, that brings us to the Intel’s new Raptor Lake S graphics. In this Kernel, an [initial batch][9] of support for Raptor Lake S graphics is introduced.
  * Intel’s Gen Icelake graphics card family [gets][10] the Variable Refresh Rate/Adaptive-Sync support.
  * Some newer Laptops bringing built-in privacy screens and expected more OEM to follow suit. Also, it’s worth to note that GNOME Desktop and others are planning to use this privacy feature in coming days. So, that said, initial [architecture and code work][11] included in this Kernel release for this privacy centric feature.
  * You can find a good list of graphics driver updates in [here][12].



#### Storage

In every Kernel release, we get incremental updates to all major file systems and storage technology. This release is also getting some.

  * Major updates include popular EXT4 file system uses new Linux Mount API.
  * Performance improvements in [F2FS][13], [Btrfs][14] and [XFS][15], like usual.
  * The FS-Cache and CacheFiles modules [receives][16] major re-write.



#### Misc Hardware Updates

  * Who uses Floppy disks today? I am sure there are still some business specific use cases where Floppy Disks are still in use. So, that brings us to this [specific patch][17] that lands in this Kernel release. There was a long time bug in Kernel – where system may hang where trying to read a broken Floppy disk. So, this old bug is finally addressed in this release and hope to give breather to the few folks who still uses this ancient storage medium.
  * Other notable misc hardware updates includes –
    * Nintendo GameCube / Wii / Wii U real-time clock [driver][18].
    * A generic USB GNSS (Global Navigation Satellite System) driver.
    * Cirrus CS35L41 HD audio codec [driver][19].
    * Many Intel Wi-Fi driver [improvements][20].
    * Intel Alder Lake N [audio][21] support.



### Download

If you want to test and try this release candidate, then download the release tarball [here][22]. Or refer below for direct link to tar, diff from the [Kernel 5.16][23].

| | | | | | | | | | | | --------- | ------------ | ---------- | ---------------------------------------------------------------------- | | -------------------------------------------------------------- | | ------------------------------------------------------------------- | --------------------------------------------------------- | | | mainline: | **5.17-rc1** | 2022-01-23 | [[tarball][24]] | | [[patch][25]] | | [[view diff][26]] | [[browse][27]] | |

There should be multiple iterations until the final release, which is expected in the month of March 2022.

* * *

We bring the latest tech, software news and stuff that matters. Stay in touch via [Telegram][28], [Twitter][29], [YouTube][30], and [Facebook][31] and never miss an update!

##### Also Read

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/01/linux-kernel-5-17-rc1/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://lore.kernel.org/lkml/CAHk-=whUYZvNVtNc4Xftd8aDpZzuwswBtHG4fCYQ2AC3twh_5Q@mail.gmail.com/T/#u
[2]: https://www.debugpoint.com/wp-content/uploads/2022/01/517rc1-1024x576.jpg
[3]: https://lore.kernel.org/lkml/20220106185501.1480075-1-catalin.marinas@arm.com/
[4]: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?h=hwmon-next&id=6482dd78c00c6d604ac1c757fb2d8a2be2878654
[5]: https://lore.kernel.org/linux-arm-kernel/CAK8P3a0RDZpLtWjMEU1QVWSjOoqRAH6QxQ+ZQnJc8LwaV7m+JQ@mail.gmail.com/
[6]: https://lore.kernel.org/lkml/CAJZ5v0jHk1fP=V_iDGKVOeYg4xt-EEdgi5UUtQA4_qrQvUibNA@mail.gmail.com/
[7]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7867e402787a23001cfb81ff298b7d023fee676a
[8]: https://lore.kernel.org/lkml/aea4c26b-25a1-9480-f780-7eb3502a4ce4@redhat.com/T/#u
[9]: https://lore.kernel.org/dri-devel/87ee6f5h9u.fsf@intel.com/
[10]: https://lists.freedesktop.org/archives/intel-gfx/2021-November/284109.html
[11]: https://lists.freedesktop.org/archives/dri-devel/2021-November/331666.html
[12]: https://lists.freedesktop.org/archives/dri-devel/2022-January/336492.html
[13]: https://lore.kernel.org/lkml/YedlHVEa4sdbvB2F@google.com/
[14]: https://lore.kernel.org/lkml/cover.1641841093.git.dsterba@suse.com/
[15]: https://lore.kernel.org/lkml/YdyxjTFaLWif6BCM@mit.edu/
[16]: https://lore.kernel.org/lkml/510611.1641942444@warthog.procyon.org.uk/
[17]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c9193f48e94deaeff0c9abbc67b9584e8ddc42ed
[18]: https://lore.kernel.org/lkml/Yen7oaDXAbd4tFOD@piout.net/
[19]: https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?h=for-next&id=7b2f3eb492dac7665c75df067e4d8e4869589f4a
[20]: https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=bc11517bc8219314948780570ec92814d14d6602
[21]: https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?h=for-next&id=4d5a628d96532607b2e01e507f951ab19a33fc12
[22]: https://www.kernel.org/
[23]: https://www.debugpoint.com/2022/01/linux-kernel-5-16/
[24]: https://git.kernel.org/torvalds/t/linux-5.17-rc1.tar.gz
[25]: https://git.kernel.org/torvalds/p/v5.17-rc1/v5.16
[26]: https://git.kernel.org/torvalds/ds/v5.17-rc1/v5.16
[27]: https://git.kernel.org/torvalds/h/v5.17-rc1
[28]: https://t.me/debugpoint
[29]: https://twitter.com/DebugPoint
[30]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[31]: https://facebook.com/DebugPoint
