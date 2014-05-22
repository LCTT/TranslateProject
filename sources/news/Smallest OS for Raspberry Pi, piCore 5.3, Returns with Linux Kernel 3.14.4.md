Smallest OS for Raspberry Pi, piCore 5.3, Returns with Linux Kernel 3.14.4
================================================================================
![](http://i1-news.softpedia-static.com/images/news2/Smallest-OS-for-Raspberry-Pi-piCore-5-3-Returns-with-Linux-Kernel-3-14-4-443246-2.jpg)

**The Tiny Core team has announced that piCore 5.3, the Raspberry Pi port of Tiny Core Linux, has just received a new version and is now available for download.**

The Tiny Core developers are actually responsible for a larger number of other distributions that are built with the same foundations. There are a number of variants available from the developer. There is the Core version (base system the provides only a command line interface for experienced users), TinyCore (recommended option for new users who have a wired network connection), and CorePlus (an installation image, not a Live one).

Team Tiny Core is not at the first release of this Linux distribution, but some improvements were necessary, although the changes are not all that big, with the exception of a new Linux kernel.

According to the changelog, the Linux kernel has been updated to version 3.14.4, the Raspberry Pi firmware has been updated to its latest version (May release), e2fsprogs has been updated to version 1.42.10, HDMI sound is now working at 192 kbit/s rate, CMA and FIQ-FSM are now enabled by default, and sudo is now used when unmounting meta-extensions.

It's possible to update previous versions on Raspberry Pi without removing the SD card, and the devs have posted some instructions on how to do this.

“Download piCore-5.3rc4-boot.tar.gz extract to a temporary folder and overwrite content of /mnt/mmcblk0p1 after mounting it. It will overwrite custom boot options. If you have customized cmdline.txt on config.txt in the old system, do it again.”

“Do not reboot if using wireless remote connection, otherwise you will lose connection due to incompatible kernel modules! Next download kernel module tcz's from the repo matching new kernel version and reboot. You must have a new, updated system working. Please note, there may be kernel module extensions which are not yet available in the repo,” read the notes posted on the official forums.

A complete list of updates and changes can be found in the official announcement. You can download piCore 5.3 right now from Softpedia.

Raspberry Pi relies on an ARM processor with a clock speed of 700 MHz, 512 MB of RAM, an SD card slot, and a 5V Micro USB connector that supplies the power. It also features RCA and HDMI ports.

The Raspberry Pi port of Tiny Core Linux is an independent system architected by Robert Shingledecker and now developed by a small team with strong community support.

If you are not familiar with the Tiny Core family of Linux distributions, you need to know that this is a modular-based system with community-built extensions. It usually implements the latest Linux kernel vmlinuz 3.0 and a 5MB core.gz.

### Tiny Core Linux piCore 5.3: Free Download ###

- [Tiny Core Linux piCore 5.3 (zip) Multiple editions][3][binary] [14 MB]

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/Smallest-OS-for-Raspberry-Pi-piCore-5-3-Returns-with-Linux-Kernel-3-14-4-443246.shtml

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://forum.tinycorelinux.net/index.php/topic,17061.0.html
[2]:http://linux.softpedia.com/get/Linux-Distributions/Tiny-Core-Linux-piCore-103260.shtml
[3]:http://tinycorelinux.net/5.x/armv6/releases/5.3/