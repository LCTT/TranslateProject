[#]: subject: "Wow! Linux Kernel 6.0 Lands With Intel 13th Gen Raptor Lake CPU Support"
[#]: via: "https://news.itsfoss.com/linux-6-0-release/"
[#]: author: "Jacob Crume https://news.itsfoss.com/author/jacob/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Wow! Linux Kernel 6.0 Lands With Intel 13th Gen Raptor Lake CPU Support
======
Linux Kernel 6.0 is here with Intel Raptor lake support and more!

![Wow! Linux Kernel 6.0 Lands With Intel 13th Gen Raptor Lake CPU Support][1]

Linux Kernel 6.0 is here, and it is a very exciting release. Although Linux 5.19 had primarily new hardware support, this release improves upon it with performance improvements and more.

Here, we will be looking at some of the major refinements, as well as highlighting some of the smaller ones too.

### What's With The Version Number Change?

As you will undoubtedly notice, the version number in Linux 6.0 has skipped the 5.x series.

The reason for the major version change is that the version numbers in the 5.x line were getting too big. There's not a hard rule regarding version numbering changes, and it mostly happens only when Linus Torvalds becomes worried that the [number is getting bigger][2].

> As is hopefully clear to everybody, the major version number change is more about me running out of fingers and toes than it is about any big fundamental changes.

That being said, Linux 6.0 is not fundamentally different from the version number might suggest. Despite this, it does bring some cool new features, which we'll look at now.

### Linux Kernel 6.0: What's New?

As with previous releases, a complete list of changes is available in the changelog. However, I can't recommend looking through it, as there have been thousands of changes since Linux 5.19.

With that in mind, I have picked out some of the best, starting with significantly improved support for the LoongArch CPU architecture

#### LoongArch Improvements

Linux 5.19 did include initial support for the Chinese LoongArch CPU architecture. However, it was impossible to boot a working system due to missing drivers.

LoongArch CPUs should now be booting Linux with this release. Not to forget, Loongson is preparing Linux for its laptops. So, you now have a driver code in the Linux Kernel 6.0.

[Loongson is Getting Ready for LoongArch Linux Laptops][3]

Additionally, the architecture has also now received initial PCI support. This means that the list of supported hardware for devices running this hardware should drastically improve.

#### New SoC Support

![linux 6.0 soc][5]

Over the past few years, it has been incredible to see the transition to ARM-based CPUs in desktop and laptop computers. Linux, which has been running on these CPUs for years, has always been at the forefront, with almost all new systems released with this architecture receiving support after only a few months.

Although we have seen a few SoC additions over the last few kernels, there has been nothing like the Linux Kernel 6.0 release offers.

First, we have support for the newly-released **Qualcomm Snapdragon 8cx Gen3**. This is the third generation of its high-end laptop SoC. It offers significantly improved performance, putting it more in line with Apple's M1 SoC than the rest of their lineup.

Other SoCs that are receiving support with Linux 6.0 include:

* NXP i.MX93 SoC
* Allwinner H616
* Marvell Prestera 98DX2530
* Nuvoton NPCM8XX
* Sunplus SP7021
* Google Chameleon v3
* Various other ARM-based Chromebooks

#### Complete Support For Intel Desktop GPUs

![Intel Arc A770 Desktop Graphics | XeSS and Ray Tracing][6]

As you probably have heard by now, Intel has had a tough time penetrating the GPU market. This has primarily been put down to driver issues on Windows, although these issues have extended to Linux too.

Despite the constant stream of driver improvements over the last few kernels, Linux Kernel 6.0 is the first where you can assume Arc Alchemist GPUs are finally usable. This is because the last low-level driver code has finally been added, allowing the PCI IDs to be added to the kernel. Theoretically, Intel's Arc GPUs should "just work" if you run Linux Kernel 6.0. You can test it out.

#### Raptor Lake Support

![linux 6.0 intel][7]

Intel unveiled its Raptor Lake series only recently. While the performance gains seem exciting on paper, we still have to wait for reviews.

With Linux Kernel 6.0, Intel maintainers have added various updates and support for its cooling driver as well. Of course, its support may not hint at a seamless experience without testing.

#### Other Changes

Alongside the major ones listed above, several smaller but still meaningful changes in the kernel with Linux 6.0. Some of these include:

* Raspberry Pi 4 V3D support (3 years after the Pi 4's release)
* Some more RDNA3 graphics driver code
* OpenRISC PCI support
* New extensions for RISC-V

You can explore more such feature changes in [Phoronix's feature overview][8].

#### Getting Linux Kernel 6.0

If you are currently Arch Linux, Fedora, or one of their derivatives, you should be able to upgrade shortly easily.

[Different Types of Kernel for Arch Linux and How to Use Them][9]

Unfortunately, if you are using other Linux distributions (Pop!_OS and Linux Lite can be an exception to some extent), you may not receive an upgrade directly from your distro.

However, almost all Linux distributions allow you to install the latest kernel explicitly. Here's a guide for Ubuntu 👇

[How to Install the Latest Mainline Linux Kernel Version in Ubuntu][11]

So, if you are feeling adventurous (and know what you are doing), you can find the newer kernel listed on [Linux Kernel Archives][13]. You can download the [tarball][14] to test it out.

However, as always, we recommend waiting for your Linux distribution to push an update if you do not want to take any chances. It is best to stick to what’s being offered for your Linux distribution by default.

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/linux-6-0-release/

作者：[Jacob Crume][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/content/images/size/w1200/2022/09/linux-kernel-6-0-release.png
[2]: https://lkml.org/lkml/2022/10/2/255
[3]: https://news.itsfoss.com/loongson-loongarch-linux-laptops/
[4]: https://news.itsfoss.com/loongson-loongarch-linux-laptops/
[5]: https://news.itsfoss.com/content/images/2022/09/linux-kernel-6-soc.jpg
[6]: https://youtu.be/eUZua8CfBZ8
[7]: https://news.itsfoss.com/content/images/2022/09/linux-kernel-6-intel.jpg
[8]: https://www.phoronix.com/review/linux-60-features
[9]: https://itsfoss.com/switch-kernels-arch-linux/
[10]: https://itsfoss.com/switch-kernels-arch-linux/
[11]: https://itsfoss.com/upgrade-linux-kernel-ubuntu/
[12]: https://itsfoss.com/upgrade-linux-kernel-ubuntu/
[13]: https://www.kernel.org/
[14]: https://git.kernel.org/torvalds/t/linux-5.19.tar.gz
