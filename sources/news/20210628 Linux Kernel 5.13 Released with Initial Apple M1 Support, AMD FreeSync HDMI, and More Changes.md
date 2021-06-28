[#]: subject: (Linux Kernel 5.13 Released with Initial Apple M1 Support, AMD FreeSync HDMI, and More Changes)
[#]: via: (https://news.itsfoss.com/linux-kernel-5-13-release/)
[#]: author: (Jacob Crume https://news.itsfoss.com/author/jacob/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Linux Kernel 5.13 Released with Initial Apple M1 Support, AMD FreeSync HDMI, and More Changes
======

After a few months of development, Linux Kernel 5.13 is finally ready for prime time. It brings to the table a plethora of huge improvements, most notably the preliminary support for Apple’s M1 platform.

Alongside the support for the M1 chip, we also get a lot of other exciting improvements. Read on to find out more and see the key changes in this release.

Linus mentioned it as a fairly big release in the [Kernel mailing list][1]:

> 5.13 overall is actually fairly large. In fact, it’s one of the bigger 5.x releases, with over 16k commits (over 17k if you count merges), from over 2k developers.

### New Features in Linux Kernel 5.13

As always, there is a huge array of new features. With this release, we gain a lot of key improvements, and they are:

  * Basic M1 support
  * Preliminary Intel Alder Lake S graphics support
  * AMD GPU FreeSync/Adaptive-Sync HDMI support
  * AMD Aldebaran accelerator support
  * A new generic USB display driver
  * Much better RISC-V support



These should provide an improved experience to many users, especially those using the latest hardware. To get a clearer picture of what these improvements mean, let’s dive into some brief details.

#### Basic Apple M1 Support

The most notable change—the new Apple M1 support is the first step to allowing these exciting new machines to be powered with Linux.

While we already covered that [Linux Kernel 5.13 will be the first Kernel with early support for Apple M1][2], it is finally here.

Please bear in mind that this does not mean that you can just fire Linux up on a M1. Instead, this change is extremely limited, with only a UART serial console currently supported.

According to the [pull request][3]:

> The following features are supported in this initial port:
>
> – UART (samsung-style) with earlycon support
>
> – Interrupts, including affinity and IPIs (Apple Interrupt Controller)
>
> – SMP (through standard spin-table support)
>
> – simplefb-based framebuffer
>
> – Devicetree for the Mac Mini (should work for the others too at this
>  stage)

Despite these limitations, this is a huge achievement and paves the way for a future of Linux on the M1.

#### Preliminary Alder Lake S GPU Support

[Intel][4] has a long history of great support for its integrated graphics on Linux. This trend seems to continue with the integration of preliminary support of Alder Lake S GPUs.

The [pull request][5] highlights some of the major changes regarding Intel GPUs:

> Highlights:
>
> – Alder Lake S enabling, via topic branch
>
> – Refactor display code to shrink intel_display.c
>
> – Support more gen 9 and Tigerlake PCH combinations

While these changes won’t affect current users, it is great to see them anyway. Early hardware support is much better than late support (or no support at all).

#### AMD GPU FreeSync/Adaptive-Sync HDMI support

![][6]

Unfortunately, AMD was unable to get FreeSync over HDMI ready in time for April’s release of Linux 5.12. But the AMD team seems to have worked through the bugs, and finally added this feature now.

Unfortunately, this feature only supports pre-HDMI 2.1 hardware due to closed-spec access by the HDMI Forum. The pull request notes provide a list of changes, the most notable being various clean-ups and fixes, including display fixes, S0iX power savings fixes, PCIe DPM fixes, and other work.

#### AMD Aldebaran accelerator support

Aldebaran is the next-gen CDNA GPU from AMD. Towards the end of February, AMD began posting the open-source Linux driver patches related to Aldebaran. Linux Kernel 5.13 will be the first release to fully support it.

As always, it is great to see hardware supported in the kernel before its release.

#### New Generic USB display driver

An exciting addition to Linux Kernel 5.13 is the [new generic USB driver][7]. It enables an enormous number of potential projects, ranging from reusing old devices to cheaper display adapters.

Although it was originally meant to be used to make a cheap USB-to-HDMI display adapter with a Raspberry Pi, it can also be used in other applications. For example, the developer also notes that one use case could be to reuse old tablets and cell phones as USB displays.

#### Much better RISC-V support

![][6]

Finally, we can’t forget to mention the hugely improved [RISC-V][8] support in Linux Kernel 5.13. While it may not have any difference to how your current device runs, it does impact future devices.

For those that don’t know, RISC-V is a fully open-source CPU architecture. Its main purpose is to provide a competitive and free alternative to the proprietary arm chips used in many smartphones.

We have already seen a few RISC-V devices running Linux. These devices will gain a substantial number of improvements from Linux Kernel 5.13, with the most notable being:

  * Build system improvements with better handling when building the RISC-V Linux kernel with LLVM
  * A re-arranged kernel memory map
  * Support for KProbes, the kernel debugging infrastructure for monitoring events



Together, these improvements should provide a much better experience on RISC-V based systems.

#### Other Improvements

Alongside the improvements listed above, we also get a few other changes. These include:

  * Amazon Luna Game Controller support
  * A new Intel cooling driver
  * The Clang CFI now being available
  * Continued preparing for Intel discrete graphics support
  * New mount options for F2FS
  * An extreme performance improvement for OrangeFS
  * Apple Magic Mouse 2 support has been added
  * Touchpad and keyboard support for newer Microsoft Surface devices
  * Landlock module support for sandboxing



The support for Landlock module should help mitigate security attacks on the system by letting privileged or unprivileged processes use sandboxing.

### Wrapping Up

In total, Linux Kernel 5.13 is an exciting release with a variety of huge improvements. It is great to see the continued support from Intel and AMD on their future GPU drivers as well.

Before you go rushing out to try out the new kernel, I would recommend waiting for your distribution to release an official kernel update. If you are still impatient, feel free to download and compile the source tarball from the [Linux Kernel Archives][9].

_What do you think about the improvements in Linux Kernel 5.13? Let me know down in the comments!_

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/linux-kernel-5-13-release/

作者：[Jacob Crume][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/jacob/
[b]: https://github.com/lujun9972
[1]: https://lore.kernel.org/lkml/CAHk-=wj7E9iTGHbqfgtaTAM09WrVzwXjda2_D59MT8D_1=54Rg@mail.gmail.com/T/#u
[2]: https://news.itsfoss.com/linux-kernel-5-13-apple-m1/
[3]: https://lore.kernel.org/lkml/bdb18e9f-fcd7-1e31-2224-19c0e5090706@marcan.st/T/#u
[4]: https://www.intel.com/content/www/us/en/homepage.html
[5]: https://lists.freedesktop.org/archives/dri-devel/2021-March/299827.html
[6]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQzOSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[7]: https://github.com/notro/gud/wiki
[8]: https://riscv.org/
[9]: https://www.kernel.org/
