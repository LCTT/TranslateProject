[#]: subject: "Arch Linux’s Guided Installer Archinstall 2.3.1 Comes With Improved BTRFS and Pipewire Support"
[#]: via: "https://news.itsfoss.com/archinstall-2-3-1-release/"
[#]: author: "Abhishek https://news.itsfoss.com/author/root/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Arch Linux’s Guided Installer Archinstall 2.3.1 Comes With Improved BTRFS and Pipewire Support
======

In April last year, [Arch Linux started including a command line based guided installer called Archinstall.][1]

If you think that’s not much when compared to the graphical installer of Ubuntu, Manjaro or other distributions, you are right. But you should also know that something is better than nothing. Before the inclusion of Archinstall, you were totally on your own for installing Arch Linux and that’s not pretty if you don’t refer to a guide.

Archinstall makes things a bit easier by suggesting the installation steps even though it is completely command line based. It’s just a script after all.

The newest release of Archinstall script 2.3.1. includes improvement on BTRFS and [Pipewire][2] support. Let me share some details.

### Archinstall 2.3.1

![][3]

Default timeout in systemd-boot has changed from 5 to 15 seconds. systemd-boot is a bootloader like Grub. This change means if you do not select a boot choice, your system will boot into the default OS choice in 15 seconds. I am not a fan of this change. 15 seconds is way too long.

Btrfs subvolume default layout has changed to something that may work with Timeshift and [Snapper][4] backup tools. However, this feature has not been tested yet. You are free to experiment with it. Btrfs subvolumes now also get properly mounted recursively. Please keep in mind that Btrfs support is still in early shape so some layouts might still not be supported.

Application profile Pipewire has been added. GRUB now better deals with UEFI setups. As noted by [Phoronix][5], Xorg profile now sets the AMDGPU driver before the Radeon module for new initramfs images.

There are some more bug fixes. You may find more details in the official release notes on its [GitHub repository][6].

It’s good to see that Archinstall getting attention and regular improvements from the developers. [Archinstall is indeed a step in the right direction][7] even for seasoned Arch users.

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/archinstall-2-3-1-release/

作者：[Abhishek][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/root/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/arch-linux-easy-install/
[2]: https://pipewire.org/
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQxMSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[4]: http://snapper.io/
[5]: https://www.phoronix.com/scan.php?page=news_item&px=Arch-Linux-Archinstall-2.3.1
[6]: https://github.com/archlinux/archinstall/releases/tag/v2.3.1
[7]: https://news.itsfoss.com/arch-new-guided-installer/
