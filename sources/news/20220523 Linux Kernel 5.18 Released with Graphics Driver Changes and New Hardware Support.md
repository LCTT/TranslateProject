[#]: subject: "Linux Kernel 5.18 Released with Graphics Driver Changes and New Hardware Support"
[#]: via: "https://news.itsfoss.com/linux-kernel-5-18-release/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux Kernel 5.18 Released with Graphics Driver Changes and New Hardware Support
======
The latest Linux Kernel 5.18 is now available as per the expected schedule without any delays. The release includes support for new hardware, and some core changes.

![Linux kernel 5.18 release][1]

[Linux Kernel 5.17][2] came loaded with support for next-gen hardware, including improvements for the Steam Deck.

Not to forget, every Linux Kernel release is technically exciting, and Linux Kernel 5.18 is no exception.

### Linux Kernel 5.18: What’s New?

This time around, we get to see improved support for Razer hardware, Apple Magic keyboard, AMD graphics, and numerous networking, core, and security changes.

#### A New Razer Driver

When it comes to gaming gears, the hardware support in Linux needs serious upgrades.

Yes, there are useful workarounds with open-source drivers. But, that’s not always the solution for every user.

As spotted by [Phoronix][3], a new Razer HID driver comes with Linux Kernel 5.18, which focuses on Razer BlackWidow keyboards fixing the macro key handling.

#### AMDGPU FreeSync Video Mode Enabled by Default

![][4]

While the support for FreeSync video was good enough, it was a temporary solution to improve the user experience with FreeSync monitors.

Now, with Linux Kernel 5.18, the FreeSync video mode is enabled by default ([changelog][5]). You do not have to do anything from your side to enable it with supported monitors.

#### Graphics Driver Updates

In addition to the improvements to the AMDGPU driver, you also get updates preparing for future hardware.

There have been changes to support higher DisplayPort rates as well.

#### Switch from C89 to C11 (GNU11)

![][6]

The C programming used for the Linux Kernel was limited to the old C89 standard, which lacked certain features for the current requirements.

So, C11 was decided to replace it considering the current compiler version requirement i.e. GCC 5.1 sounds perfectly fine with it.

#### Networking Tweaks

Linux Kernel 5.18 adds support for new wireless hardware, including MediaTek MT7916, MT7921U, and Broadcom BCM43454/6.

![][7]

When it comes to mobile solutions, support for Intel M.2 WWAN card has also been added.

The Realtek W89 driver now supports AP mode, 6 GHz band, and adds a hardware scan feature.

Several other improvements have been made to configure IPv6, and handle various protocols, including performance optimizations.

#### USB Improvements

Xen USB driver is being hardened against malicious hosts, and the USB DWC3 driver received improvements to support more hardware types.

You can find various other refinements in the [commit log][8].

#### Enhanced Apple Keyboard and Tablet Support

![][9]

Advancements were made to improve the experience with Apple Magic Keyboards, including the first-generation models.

Some of the fixes included correcting function-key mapping, keyboard backlight events, and the ability to report the battery level for the 2021 Magic Keyboard model when connected via USB.

Linux Kernel 5.18 improves input handling and makes things reliable when it comes to tablets.

You can find changes for new hardware, touchscreens, and other stuff in the related [commit][10].

#### New ARM Chip Support (Tesla FSD, Raspberry Pi Zero 2 W)

![][11]

Tesla’s full self-driving SoC is now supported with Linux Kernel 5.18. Samsung engineers made it possible to upstream into the Linux Kernel.

Other interesting chip additions include Qualcomm Snapdragon 625/632, and Samsung Exynos 850/7885.

You also find the support for Raspberry Pi Zero 2 W with Linux Kernel 5.18. In addition to the new entrants, old hardware/boards were removed as well. You can explore the [commit l][12]og to know more.

You can refer to the [official changelog][13] and Linus Torvald’s announcement to explore more details.

### How to Install Linux Kernel 5.18?

You should find the newer kernel listed on [Linux Kernel Archives][14]. So, you can download the [tarball][15] to test it out. Or, you can follow our [Linux Kernel upgrade guide][16] for help.

If you want to avoid compiling it yourself, you should wait for a few weeks for Linux distributions to push it to the repositories.

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/linux-kernel-5-18-release/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/05/kernel-5-18-release.png
[2]: https://news.itsfoss.com/linux-kernel-5-17-release/
[3]: https://www.phoronix.com/scan.php?page=news_item&px=Linux-5.18-HID
[4]: https://news.itsfoss.com/wp-content/uploads/2022/05/amd-linux-5-18-1024x576.jpg
[5]: https://lists.freedesktop.org/archives/amd-gfx/2022-February/075262.html
[6]: https://news.itsfoss.com/wp-content/uploads/2022/05/c-linux-5-18-1024x576.jpg
[7]: https://news.itsfoss.com/wp-content/uploads/2022/05/networking-linux-5-18-1024x576.jpg
[8]: https://lore.kernel.org/lkml/Yj7vGtn8fILavjyL@kroah.com/
[9]: https://news.itsfoss.com/wp-content/uploads/2022/05/apple-linux-5-18-1024x576.jpg
[10]: https://lore.kernel.org/lkml/nycvar.YFH.7.76.2203231015060.24795@cbobk.fhfr.pm/
[11]: https://news.itsfoss.com/wp-content/uploads/2022/05/arm-linux-5-18-1024x576.jpg
[12]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=baaa68a9796ef2cadfe5caaf4c730412eda0f31c
[13]: https://lore.kernel.org/lkml/CAHk-=wjiqyoH6qntYvYTjR1F2L-pHtgX9esZMRS13iktCOJ1zA@mail.gmail.com/T/#u
[14]: https://www.kernel.org/
[15]: https://git.kernel.org/torvalds/t/linux-5.16.tar.gz
[16]: https://itsfoss.com/upgrade-linux-kernel-ubuntu/
