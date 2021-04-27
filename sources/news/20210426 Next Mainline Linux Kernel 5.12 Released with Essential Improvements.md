[#]: subject: (Next Mainline Linux Kernel 5.12 Released with Essential Improvements)
[#]: via: (https://news.itsfoss.com/linux-kernel-5-12-release/)
[#]: author: (Ankush Das https://news.itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Next Mainline Linux Kernel 5.12 Released with Essential Improvements
======

[Linux Kernel 5.11][1] was an impressive release with the support for new hardware that’s probably out-of-stock till the end of 2022.

Now, almost after 2 months of work and a week of delay for a release candidate version 8, Linux Kernel 5.12 is here.

The improvements span across many things that include processor support, laptop support, new hardware support, storage enhancements, and a few more essential driver additions.

Here, I will highlight the key changes with this release to give you an overview.

### Linux Kernel 5.12: Essential Improvements &amp; Additions

Linux Kernel 5.12 is a neat release with many essential additions. Also, it is worth noting that Linux [5.13 would be the first Linux Kernel to add initial support for Apple M1 devices][2] if you were expecting it here.

With the [release announcement][3], Linus Torvalds mentioned:

> Thanks to everybody who made last week very calm indeed, which just makes me feel much happier about the final 5.12 release.
>
> Both the shortlog and the diffstat are absolutely tiny, and it’s mainly just a random collection of small fixes in various areas: arm64 devicetree files, some x86 perf event fixes (and a couple of tooling ones), various minor driver fixes (amd and i915 gpu fixes stand out, but honestly, that’s not because they are big, but because the rest is even smaller), a couple of small reverts, and a few locking fixes (one kvm serialization fix, one memory ordering fix for rwlocks).

Let us take a look at what’s new overall.

#### Official PlayStation 5 Controller Driver

Sony’s open-source driver for controllers were pushed back last cycle, but it has been included with Linux 5.12 Kernel.

Not just as a one-time open-source driver addition but Sony has committed to its maintenance as well.

So, if you were looking to use Sony’s DualSense PlayStation 5 Controller, now would be a good time to test it out.

#### AMD FreeSync HDMI Support

While AMD has been keeping up with good improvements for its Linux graphics drivers, there was no [FreeSync][4] support over HDMI port.

With Linux Kernel 5.12, a patch has been merged to the driver that enables FreeSync support on HDMI ports.

#### Intel Adaptive-Sync for Xe Graphics

Intel’s 12th gen Xe Graphics is an exciting improvement for many users. Now, with Linux Kernel 5.12, adaptive sync support (variable refresh rate) will be added to connections over the Display Port.

Of course, considering that AMD has managed to add FreeSync support with HDMI, Intel would probably be working on the same for the next Linux Kernel release.

#### Nintendo 64 Support

Nintendo 64 is a popular but very [old home video game console][5]. For this reason, it might be totally dropped as an obsolete platform but it is good to see the added support (for those few users out there) in Linux Kernel 5.12.

#### OverDrive Overclocking for Radeon 4000 Series

Overlocking support for AMD’s latest GPU’s was not yet supporting using the command-line based OverDrive utility.

Even though OverDrive has been officially discontinued, there is no GUI-based utility by AMD for Linux. So, this should help meanwhile.

#### Open-Source Nvidia Driver Support for Ampere Cards

The open-source Nvidia [Nouveau][6] drivers introduces improved support for Ampere-based cards with Linux Kernel 5.12, which is a step-up from Linux Kernel 5.11 improvements.

With the upcoming Linux Kernel 5.13, you should start seeing 3D acceleration support as well.

#### Improvements to exFAT Filesystem

There have been significant optimizations for [exFAT Filesytem][7] that should allow you to delete big files much faster.

#### Intel’s Open-Source Driver to Display Laptop Hinge/Keyboard Angle

If you have a modern Intel laptop, you are in luck. Intel has contributed another open-source driver to help display the laptop hinge angle in reference to the ground.

Maybe you are someone who’s writing a script to get something done in your Laptop when the hinge reaches a certain angle or who knows what else? Tinkerers would mostly benefit from this addition by harnessing the information they did not have.

### Other Improvements

In addition to the key additions I mentioned above, there are numerous other improvements that include:

  * Improved battery reporting for Logitech peripherals
  * Improved Microsoft Surface laptop support
  * Snapdragon 888 support
  * Getting rid of obsolete ARM platforms
  * Networking improvements
  * Security improvements



You might want to check out the [full changelog][8] to know all the technical details.

If you think Linux 5.12 could be a useful upgrade for you, I’d suggest you to wait for your Linux distribution to push an update or make it available for you to select it as your Linux Kernel from the repository.

It is also directly available in [The Linux Kernel Archives][9] as a tarball if you want to compile it from source.

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

#### _Related_

  * [Linux Release Roundup #21.14: AlmaLinux OS, Linux Lite 5.4, Ubuntu 21.04 and More New Releases][10]
  * ![][11] ![Linux Release Roundups][12]


  * [Linux Kernel 5.11 Released With Support for Wi-Fi 6E, RTX 'Ampere' GPUs, Intel Iris Xe and More][1]
  * ![][11] ![][13]


  * [Nitrux 1.3.8 Release Packs in KDE Plasma 5.21, Linux 5.11, and More Changes][14]
  * ![][11] ![][15]



--------------------------------------------------------------------------------

via: https://news.itsfoss.com/linux-kernel-5-12-release/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/linux-kernel-5-11-release/
[2]: https://news.itsfoss.com/linux-kernel-5-13-apple-m1/
[3]: https://lore.kernel.org/lkml/CAHk-=wj3ANm8QrkC7GTAxQyXyurS0_yxMR3WwjhD9r7kTiOSTw@mail.gmail.com/
[4]: https://en.wikipedia.org/wiki/FreeSync
[5]: https://en.wikipedia.org/wiki/Nintendo_64
[6]: https://nouveau.freedesktop.org
[7]: https://en.wikipedia.org/wiki/ExFAT
[8]: https://cdn.kernel.org/pub/linux/kernel/v5.x/ChangeLog-5.12
[9]: https://www.kernel.org/
[10]: https://news.itsfoss.com/linux-release-roundup-2021-14/
[11]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9JzIwMCcgd2lkdGg9JzM1MCcgeG1sbnM9J2h0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnJyB2ZXJzaW9uPScxLjEnLz4=
[12]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2020/12/Linux-release-roundups.png?fit=800%2C450&ssl=1&resize=350%2C200
[13]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/02/linux-kernel-5-11-release.png?fit=1200%2C675&ssl=1&resize=350%2C200
[14]: https://news.itsfoss.com/nitrux-1-3-8-release/
[15]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/03/nitrux-1-3-8.png?fit=1200%2C675&ssl=1&resize=350%2C200
