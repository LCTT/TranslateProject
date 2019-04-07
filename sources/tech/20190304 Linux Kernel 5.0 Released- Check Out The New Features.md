[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux Kernel 5.0 Released! Check Out The New Features)
[#]: via: (https://itsfoss.com/linux-kernel-5/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Linux Kernel 5.0 Released! Check Out The New Features
======

[Linus Torvalds][1] has [announced][2] the release of Linux Kernel 5.0.

Don’t get too excited thinking it’s a major new release because it’s called 5.0 instead of 4.22.

It’s just that the major bump in the version number gives the impression that there might be a huge number of major new changes but that’s not the case here.

> I’d like to point out (yet again) that we don’t do feature-based releases, and that “5.0” doesn’t mean anything more than that the 4.x numbers started getting big enough that I ran out of fingers and toes.
>
> Linus Torvalds

Of course, it doesn’t mean Kernel 5.0 doesn’t have new features. In fact, the “overall changes for all of the 5.0 release are much bigger.”

### New features in Linux Kernel 5.0

![][3]

Here are some of the major new changes in Kernel 5.0:

  * AMD Radeon FreeSync support
  * Support for a new VegaM
  * NVIDIA Xavier display support
  * Continued work on Intel Icelake Gen11 graphics
  * Initial support for the NXP i.MX8 SoCs
  * Support for the Allwinner T3, Qualcomm QCS404, and NXP Layerscape LX2160A
  * Intel VT-d Scalable Mode support for Scalable I/O Virtualization
  * New Intel Stratix 10 FPGA drivers
  * Fixes for F2FS, EXT4 and XFS
  * Btrfs file-system restores support for swap files
  * Fscrypt Adiantum support for helping with fast data encryption on low-end hardware. This replaces the [infamous Speck algorithm by NSA][4].
  * Realtek R8169 driver improvements
  * Logitech High Resolution Scrolling support
  * Raspberry Pi Touchscreen driver
  * x86 laptop drivers improvement
  * Thunderbolt security enhancement
  * Support for the Chameleon96 Intel FPGA board
  * Improved power management



If you want to know more, you can refer to this [excellent compilation of Kernel 5.0 features by Phoronix][5].

[Linux Kernel 5.0 is released. Brings tons of improvements and hardware support.][6] [Click to Tweet **][6]

### Getting Linux Kernel 5.0

Some rolling release distributions like Arch Linux will start to provide Kernel 5.0 in a few days (or hours perhaps). [Check your Linux kernel version][7] and see if it’s already updated to the new kernel with the last system update.

But most other distributions like Ubuntu, Linux Mint, Fedora, Debian etc won’t provide this release anytime soon (or ever).

Warning

If you are an average desktop user, don’t go after chasing Linux kernels unless you have a strong reason to install it manually. For example, if the new kernel provides a crucial update for certain hardware you use. Otherwise, don’t try to upgrade kernels manually because it’s a risky business.﻿

If you really want to use the new kernel, you may try [Ukuu][8]. It’s a GUI tool that lets you easily install other kernel versions. The older versions of the tool are still free and open source but you need to buy licenses for the newer version, unfortunately.

This article was originally published earlier and anticipated Kernel 5.0 release in summer’18. Linux Kernel 5.0 was actually supposed to be released after 4.19. But apparently, a few people really liked to see the [Linux Kernel 4.20][9] purely for the [number 4.20][10]. Pun intended.

--------------------------------------------------------------------------------

via: https://itsfoss.com/linux-kernel-5/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linus-torvalds-facts/
[2]: https://lkml.org/lkml/2019/3/3/236
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2017/12/Linux-Kernel-5-featured.jpg?resize=800%2C450&ssl=1
[4]: https://itsfoss.com/nsas-encryption-algorithm-in-linux-kernel-is-creating-unease-in-the-community/
[5]: https://www.phoronix.com/scan.php?page=article&item=linux-2019-features&num=1
[6]: https://twitter.com/intent/tweet?text=Linux+Kernel+5.0+is+released.+Brings+tons+of+improvements+and+hardware+support.&url=https%3A%2F%2Fitsfoss.com%2Flinux-kernel-5%2F&via=itsfoss2&related=itsfoss2
[7]: https://itsfoss.com/find-which-kernel-version-is-running-in-ubuntu/
[8]: https://itsfoss.com/upgrade-linux-kernel-ubuntu/
[9]: https://itsfoss.com/kernel-4-20-release/
[10]: https://en.wikipedia.org/wiki/420_(cannabis_culture)
