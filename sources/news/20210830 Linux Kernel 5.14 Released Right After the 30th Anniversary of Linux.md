[#]: subject: "Linux Kernel 5.14 Released Right After the 30th Anniversary of Linux"
[#]: via: "https://news.itsfoss.com/kernel-5-14-release/"
[#]: author: "Jacob Crume https://news.itsfoss.com/author/jacob/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Kernel 5.14 Released Right After the 30th Anniversary of Linux
======

Back in June, I looked at [Linux Kernel 5.13][1], where we received preliminary support for the M1, RISC-V improvements, and support for new GPUs.

Now, Linux kernel 5.14 is here! Linus Torvalds just [announced it on the kernel mailing list][2]:

![Kernel 5.14 announcement mail][3]

While this release is not quite as large as the aforementioned one, it still has many improvements, especially for ARM devices.

Let us take a quick look at the key highlights of this release.

### Linux Kernel 5.14: What’s New?

Linux kernel 5.14 contains a wide variety of new features, especially for ARM-based systems. This is all happening despite Linus Torvalds claiming that this is a relatively small release in the initial [kernel announcement][4].

Fast forward to its release candidate v7 before its final release, Linus mentioned:

> Most of the changes here are drivers (GPU and networking stand out),
>
> and the rest is pretty random stuff: arch, tracing, core networking, a
>
> couple of VM fixes..

Linus Torvalds, Linux kernel 5.14 RC7 announcement

This release contains a variety of new features. Here is a list of the key new features present in Linux kernel 5.14:

  * The [Raspberry Pi 400][5] can now work completely with this kernel, thanks to the work done for the past couple of months.
  * The [Rockchip RK3568 SoC][6] is now supported
  * Initial support for the Sony Xperia 1/1II and 5/5II
  * Various updates added for Microsoft Surface Duo
  * Updates to DIY BananaPi M5 board added
  * [Important updates][7] for RISC-V
  * Improved support for Intel Alder Lake P and Alder Lake M graphics cards
  * New hot-unplug support on AMD Radeon graphics cards
  * ‘Secret’ memory areas introduced with a new system called ‘memfd_secret’
  * Improvements to [lower the latency of its USB audio driver][8]s
  * Improved support for USB4
  * Initial groundwork to support Intel Alder lake processors



In this article, we will be looking at what these features are, and what they mean for the end user.

#### Raspberry Pi 400

Last year, the Raspberry Pi Foundation launched the [Raspberry Pi 400][5], a keyboard computer similar to those of the 1980s. Unfortunately, this computer requires a custom kernel version to function due to non-mainline drivers.

However, with the kernel 5.14 release, this appears to have changed. After months of development, the Raspberry Pi 400 can now be booted using the Linux kernel 5.14. While it is unfortunate for support to take this long, it is much better late than never.

#### RK35xx SoC Support

This year has truly been a glorious year for [Rockchip][9]. They started off by launching their rk35xx series of SoCs, with many manufacturers integrating the newly-released SoCs into their products.

One of the most notable uses of the RK35xx series is in the Quartz64, an SBC developed by [Pine64][10] (which I am currently helping mainline). And Linux 5.14 brings support for one of these SoCs, the RK3568.

For all the upcoming boards based on this SoC, this inclusion is extremely important as it greatly simplifies distro porting.

#### Initial Support for Sony Xperia 1/1II and 5/5II

[Sony][11] is one of the few mobile phone manufacturers that actively support running Linux on their phones. This is demonstrated through their compatibility with operating systems such as [Sailfish OS][12] and [Ubuntu Touch][13].

Now, with the Sony Xperia 1/1II and 5/5II being mainlined, it should be much easier to get an even wider variety of distributions booted. However, it should be also be kept in mind that this is only initial support, much like Linux 5.13’s M1 support.

#### RISC-V Updates

One of the trends I have noticed over the past few kernel updates is the ever-improving support for [RISC-V][14] processors. Last update, we got some significant build system improvements, a re-arranged kernel memory map, and support for the kernel debugging module KProbes.

This time, it appears that this trend is continuing, with the addition of a few RISC-V-specific improvements. These include:

  * Support for transparent huge pages
  * An optimized copy_{to,from}_user.
  * Generic PCI resources mapping support
  * Support for KFENCE (Kernel Electric Fence) for memory safety error detection/validation



While mostly minor, these updates should pave the way for future RISC-V based devices.

#### Radeon Hot-Unplug

Perhaps my favorite feature of this release, AMD Radeon cards are getting a new hot-unplug feature. Previously, ripping your GPU out while your system was running would result in a kernel panic. Now, you can remove your (Radeon) GPU at any time and your system will continue to function normally, at least in theory.

I just hope that this feature works better on Linux than my experience with it on Windows. While I wouldn’t recommend randomly pulling your GPU out of your system mid-update, it is still a nice feature to see, and it will be interesting to see what people do with it.

#### USB 4 Support

As we see an increasing number of new laptops shipping with USB 4, it has become more and more important for Linux to start supporting it. Fortunately, the Linux kernel 5.14 has a wide variety of improvements for USB 4 users.

These include:

  * More USB 4 support added to the thunderbolt core
  * Build warning fixes all over the place
  * USB-serial driver updates and new device support
  * A wide variety of driver updates
  * Lots of other tiny things



While not game-changing, these improvements should help many current and future users of USB 4.

### Wrapping Up

Between the improved USB support, multitude of updates for ARM and RISC-V devices, and minor GPU upgrades, this release is looking pretty good. As I mentioned before, I am most excited about the Radeon hot-unplug support, as this should make GPU swapping that little bit easier.

Similarly to last time, I’d recommend waiting for your distribution to offer official updates before upgrading to Linux kernel 5.14. Fortunately, users of distributions such as Arch and Manjaro should receive the updates very shortly. [Advanced Ubuntu users can install the latest mainline Kernel][15] with some effort though it should be avoided.

_What do you think about the improvements in Linux Kernel 5.14? Let me know down in the comments!_

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/kernel-5-14-release/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/linux-kernel-5-13-release/
[2]: https://lkml.org/lkml/2021/8/29/382
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQ1NiIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[4]: http://lkml.iu.edu/hypermail/linux/kernel/2107.1/02943.html
[5]: https://www.raspberrypi.org/products/raspberry-pi-400/
[6]: https://www.96rocks.com/blog/2020/11/28/introduce-rockchip-rk3568/
[7]: https://lore.kernel.org/lkml/mhng-423e8bdb-977e-4b99-a1bb-b8c530664a51@palmerdabbelt-glaptop/
[8]: http://lkml.iu.edu/hypermail/linux/kernel/2107.1/00919.html
[9]: https://www.rock-chips.com/a/en/index.html
[10]: http://pine64.org
[11]: https://electronics.sony.com/c/mobile
[12]: https://sailfishos.org/
[13]: https://ubuntu-touch.io/
[14]: https://riscv.org/
[15]: https://itsfoss.com/upgrade-linux-kernel-ubuntu/
