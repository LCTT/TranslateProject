[#]: subject: "Linux Kernel 5.17 Released. This is What’s New"
[#]: via: "https://www.debugpoint.com/2022/03/linux-kernel-5-17/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Kernel 5.17 Released. This is What’s New
======
LINUX KERNEL 5.17 IS RELEASED WITH BETTER HARDWARE SUPPORT AND CORE
MODULE IMPROVEMENTS. HERE’S A QUICK SUMMARY OF THE NEW FEATURES WITH
DOWNLOAD AND INSTALLATION DETAILS.
![Linux Kernel 5.17 Brings More Hardware Compatibility][1]

Linux Torvalds [announced the release][2] of Linux Kernel 5.17 as the second stable mainline Kernel release of 2022. This release introduces support for new processors, graphics, storage and other hardware components across all Kernel modules.

Following the timeline and with just a slight delay since the Kernel 5.16 release, the mainline Linux Kernel 5.17 is now available for you to download. The updates include temperature support for the AMD Zen family of devices; a long-standing Floppy Disk hangs bug, a handful of ARM/SoC support and performance improvements across all subsystems.

Although we have covered most of the changes during the first release candidate, here’s a quick recap of the Linux Kernel 5.17 new features.

### Linux Kernel 5.17 – What’s New

#### Processor

The ARM64 architecture in Linux Kernel is now included with Kernel Concurrency Sanitizer (KCSAN). KSCAN is a race condition detector that already had support for other architectures. And now ARM64 is on the list. Also, initial work for Scalable Matrix Extensions (SME) promises to provide better and faster support for Matrix operations.

AMD [brings][3] the k10temp-based CPU temperature monitoring for the AMD Zen family 19h CPU models.

An extensive set of Arm/SoC support [lands][4] in Linux Kernel 5.17. The major one includes the new Snapdragon 8 Gen 1 and X65 platforms. Other SoC includes – NXP i.MX8ULP, Texas Instruments J721S2, and Renesas R-Car S4-8.

One of the significant CPU changes is the inclusion of the AMD P-state driver, which is developed in collaboration with Valve for the Steam Deck. This will lead to better power efficiency because of more granular controls on power due to ACPI Collaborative Processor Performance Controls (CPPC) exposure.

Another significant RISC-V change in this Kernel is sv48 support, allowing 48-bit virtual address space. This enables the Kernel to address up to 128 TB of virtual address space.

This release brings a lot of laptops, Tablet driver updates. A list is available [here][5]. However, here are the major ones.

Custom fan curve support added for ASUS ROG Laptops.

Support for Universal Stylus Initiative (USI) and NVIDIA Tegra Tablets has been added.

Some performance improvement and fix for AMD based Laptops related to sleep and Sound drivers.

#### Graphics

Intel’s Alder Lake P graphics are now stable in mainline after many iterations over the previous year. So, that brings us to Intel’s new Raptor Lake S graphics. This Kernel introduces an [initial batch of support for Raptor Lake S graphics][6].

Intel’s Gen Icelake graphics card family [gets][7] the Variable Refresh Rate/Adaptive-Sync support.

Some newer Laptops bring built-in privacy screens and expect more OEMs to follow suit. Also, it’s worth noting that GNOME Desktop and others are planning to use this privacy feature in the coming days. So, initial architecture and code work are included in this Kernel release for this privacy-centric feature.

[][8]

SEE ALSO:   Linux Kernel 5.17 RC1 Unveils New Features and Hardware Support

You can find a good list of graphics driver updates [here][9].

#### Storage

We get incremental updates to all major file systems and storage technology in every Kernel release. This release is also getting some.

  * Major updates include popular EXT4 file system uses new Linux Mount API.
  * Performance improvements in [F2FS][10], [Btrfs][11] and [XFS][12], like usual.
  * The FS-Cache and CacheFiles modules [receives][13] major re-write.



#### Misc Hardware Updates

Who uses Floppy disks today? I am sure there are still some business-specific use cases where Floppy Disks are still in use. So, that brings us to this specific patch that lands in this Kernel release. There was a long time bug in Kernel – where the system may hang where trying to read a broken Floppy disk. So, this old bug is finally addressed in this release, and I hope to give a pause to the few folks who still use this ancient storage medium.

  * Other notable misc hardware updates includes –
    * Nintendo GameCube / Wii / Wii U real-time clock [driver][14].
    * A generic USB GNSS (Global Navigation Satellite System) driver.
    * Cirrus CS35L41 HD audio codec [driver][15].
    * Many Intel Wi-Fi driver [improvements][16].
    * Intel Alder Lake N [audio][17] support.



### How to Download and Install Linux Kernel 5.17

We always recommend not to install the latest mainline Kernel in your stable system unless you possess specific new hardware or wants to experiment. For general users, it is always best to wait for the Kernel update via your Linux Distribution’s (e.g. Ubuntu, Fedora) official deployment channel.

If you still want to install, follow the below instructions to install Linux Kernel 5.17.

Visit the [mainline kernel page][18].

There are two types of builds available – and **lowlatency**. For standard systems, you can download generic builds that work most of the time. For audio recordings and other setups that require low latency, download the lowlatency one.

Download below four packages for generic via terminal and install.

```

    wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.17/amd64/linux-headers-5.17.0-051700-generic_5.17.0-051700.202203202130_amd64.deb
    wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.17/amd64/linux-headers-5.17.0-051700_5.17.0-051700.202203202130_all.deb
    wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.17/amd64/linux-image-unsigned-5.17.0-051700-generic_5.17.0-051700.202203202130_amd64.deb
    wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.17/amd64/linux-modules-5.17.0-051700-generic_5.17.0-051700.202203202130_amd64.deb

```

After installation, reboot the system.

The instruction for lowlatency and other architecture (ARM) installations are the same. Replace the package name in the above wget commands. You can find them on the mainline Kernel page.

For Arch Linux users, it is expected that Linux Kernel 5.17 release packages arrive within the April 2022 first week during monthly Arch .iso refresh.

With this release, the merge window opens for the following Linux Kernel 5.18.

* * *

We bring the latest tech, software news and stuff that matters. Stay in touch via [Telegram][19], [Twitter][20], [YouTube][21], and [Facebook][22] and never miss an update!

##### Also Read

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/03/linux-kernel-5-17/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/wp-content/uploads/2022/03/kernel517-1024x576.png
[2]: https://lkml.org/lkml/2022/3/20/213
[3]: https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?h=hwmon-next&id=6482dd78c00c6d604ac1c757fb2d8a2be2878654
[4]: https://lore.kernel.org/linux-arm-kernel/CAK8P3a0RDZpLtWjMEU1QVWSjOoqRAH6QxQ+ZQnJc8LwaV7m+JQ@mail.gmail.com/
[5]: https://lore.kernel.org/lkml/aea4c26b-25a1-9480-f780-7eb3502a4ce4@redhat.com/T/#u
[6]: https://lore.kernel.org/dri-devel/87ee6f5h9u.fsf@intel.com/
[7]: https://lists.freedesktop.org/archives/intel-gfx/2021-November/284109.html
[8]: https://www.debugpoint.com/2022/01/linux-kernel-5-17-rc1/
[9]: https://lists.freedesktop.org/archives/dri-devel/2022-January/336492.html
[10]: https://lore.kernel.org/lkml/YedlHVEa4sdbvB2F@google.com/
[11]: https://lore.kernel.org/lkml/cover.1641841093.git.dsterba@suse.com/
[12]: https://lore.kernel.org/lkml/YdyxjTFaLWif6BCM@mit.edu/
[13]: https://lore.kernel.org/lkml/510611.1641942444@warthog.procyon.org.uk/
[14]: https://lore.kernel.org/lkml/Yen7oaDXAbd4tFOD@piout.net/
[15]: https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?h=for-next&id=7b2f3eb492dac7665c75df067e4d8e4869589f4a
[16]: https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=bc11517bc8219314948780570ec92814d14d6602
[17]: https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?h=for-next&id=4d5a628d96532607b2e01e507f951ab19a33fc12
[18]: https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.17
[19]: https://t.me/debugpoint
[20]: https://twitter.com/DebugPoint
[21]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[22]: https://facebook.com/DebugPoint
