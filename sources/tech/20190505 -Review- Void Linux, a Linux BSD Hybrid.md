[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: ([Review] Void Linux, a Linux BSD Hybrid)
[#]: via: (https://itsfoss.com/void-linux/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

[Review] Void Linux, a Linux BSD Hybrid
======

There are distros that follow the crowd and there are others that try to make their own path through the tall weed. Today, we’ll be looking at a small distro that looks to challenge how a distro should work. We’ll be looking at Void Linux.

### What is Void Linux?

[Void Linux][1] is a “general purpose operating system, based on the monolithic Linux kernel. Its package system allows you to quickly install, update and remove software; software is provided in binary packages or can be built directly from sources with the help of the XBPS source packages collection.”

![Void Linux Neofetch][2]

Like Solus, Void Linux is written from scratch and does not depend on any other operating system. It is a rolling release. Unlike the majority of Linux distros, Void does not use [systemd][3]. Instead, it uses [runit][4]. Another thing that separates Void from the rest of Linux distros is the fact that they use LibreSSL instead of OpenSSL. Void also offers support for the [musl C library][5]. In fact, when you download a .iso file, you can choose between `glibc` and `musl`.

The homegrown package manager that Void uses is named X Binary Package System (or xbps). According to the [Void wiki][6], xbps has the following features:

  * Supports multiple local and remote repositories (HTTP/HTTPS/FTP).
  * RSA signed remote repositories
  * SHA256 hashes for package metadata, files, and binary packages
  * Supports package states (ala dpkg) to mitigate broken package * installs/updates
  * Ability to resume partial package install/updates
  * Ability to unpack only files that have been modified in * package updates
  * Ability to use virtual packages
  * Ability to check for incompatible shared libraries in reverse dependencies
  * Ability to replace packages
  * Ability to put packages on hold (to never update them)
  * Ability to preserve/update configuration files
  * Ability to force reinstallation of any installed package
  * Ability to downgrade any installed package
  * Ability to execute pre/post install/remove/update scriptlets
  * Ability to check package integrity: missing files, hashes, missing or unresolved (reverse)dependencies, dangling or modified symlinks, etc.



#### System Requirements

According to the [Void Linux download page][7], the system requirements differ based on the architecture you choose. 64-bit images require “EM64T CPU, 96MB RAM, 350MB disk, Ethernet/WiFi for network installation”. 32-bit images require “Pentium 4 CPU (SSE2), 96MB RAM, 350MB disk, Ethernet / WiFi for network installation”. The [Void Linux handbook][8] recommends 700 MB for storage and also notes that “Flavor installations require more resources. How much more depends on the flavor.”

Void also supports ARM devices. You can download [ready to boot images][9] for Raspberry Pi and several other [Raspberry Pi alternatives][10].

[][11]

Suggested read NomadBSD, a BSD for the Road

### Void Linux Installation

NOTE: you can either install [Void Linux download page][7] via a live image or use a net installer. I used a live image.

I was able to successfully install Void Linux on my Dell Latitude D630. This laptop has an Intel Centrino Duo Core processor running at 2.00 GHz, NVIDIA Quadro NVS 135M graphics chip, and 4 GB of RAM.

![Void Linux Mate][12]

After I `dd`ed the 800 MB Void Linux MATE image to my thumb drive and inserted it, I booted my computer. I was very quickly presented with a vanilla MATE desktop. To start installing Void, I opened up a terminal and typed `sudo void-installer`. After using the default password `voidlinux`, the installer started. The installer reminded me a little bit of the terminal Debian installer, but it was laid out more like FreeBSD. It was divided into keyboard, network, source, hostname, locale, timezone, root password, user account, bootloader, partition, and filesystems sections.

Most of the sections where self-explanatory. In the source section, you could choose whether to install the packages from the local image or grab them from the web. I chose local because I did not want to eat up bandwidth or take longer than I had to. The partition and filesystems sections are usually handled automatically by most installers, but not on Void. In this case, the first section allows you to use `cfdisk` to create partitions and the second allows to specify what filesystems will be used in those partitions. I followed the partition layout on [this page][13].

If you install Void Linux from the local image, you definitely need to update your system. The [Void wiki][14] recommends running `xbps-install -Suv` until there are no more updates to install. It would probably be a good idea to reboot between batches of updates.

### Experience with Void Linux

So far in my Linux journey, Void Linux has been by far the most difficult. It feels more like I’m [using a BSD than a Linux distro][15]. (I guess that should not be surprising since Void was created by a former [NetBSD][16] developer who wanted to experiment with his own package manager.) The steps in the command line installer are closer to that of [FreeBSD][17] than Debian.

Once Void was installed and updated, I went to work installing apps. Unfortunately, I ran into an issue with missing applications. Most of these applications come preinstalled on other distros. I had to install wget, unzip, git, nano, LibreOffice to name just a few.

Void does not come with a graphical package manager. There are three unofficial frontends for the xbps package manager and [one is based on qt][18]. I ran into issues getting one of the Bash-based tools to work. It hadn’t been updated in 4-5 years.

![Octoxbps][19]

The xbps package manager is kinda interesting. It downloads the package and its signature to verify it. You can see the [terminal print out][20] from when I installed Mcomix. Xbps does not use the normal naming convention used in most package managers (ie `apt install` or `pacman -R`), instead, it uses `xbps-install`, `xbps-query`, `xbps-remove`. Luckily, the Void wiki had a [page][21] to show what xbps command relates to apt or dnf commands.

[][22]

Suggested read How To Solve: error: no such partition grub rescue in Ubuntu Linux

The main repo for Void is located in Germany, so I decided to switch to a more local server to ease the burden on that server and to download packages quicker. Switching to a local mirror took a couple of tries because the documentation was not very clear. Documentation for Void is located in two different places: the [wiki][23] and the [handbook][24]. For me, the wiki’s [explanation][25] was confusing and I ran into issues. So, I searched for an answer on DuckDuckGo. From there I stumbled upon the [handbook’s instructions][26], which were much clearer. (The handbook is not linked on the Void Linux website and I had to stumble across it via search.)

One of the nice things about Void is the speed of the system once everything was installed. It had the quickest boot time I have ever encountered. Overall, the system was very responsive. I did not run into any system crashes.

### Final Thoughts

Void Linux took more work to get to a useable state than any other distro I have tried. Even the BSDs I tried felt more polished than Void. I think the tagline “General purpose Linux” is misleading. It should be “Linux with hackers and tinkerers in mind”. Personally, I prefer using distros that are ready for me to use after installing. While it is an interesting combination of Linux and BSD ideas, I don’t think I’ll add Void to my short list of go-to distros.

If you like tinkering with your Linux system or like building it from scratch, give [Void Linux][7] a try.

Have you ever used Void Linux? What is your favorite Debian-based distro? Please let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][27].

--------------------------------------------------------------------------------

via: https://itsfoss.com/void-linux/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://voidlinux.org/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/Void-Linux-Neofetch.png?resize=800%2C562&ssl=1
[3]: https://en.wikipedia.org/wiki/Systemd
[4]: http://smarden.org/runit/
[5]: https://www.musl-libc.org/
[6]: https://wiki.voidlinux.org/XBPS
[7]: https://voidlinux.org/download/
[8]: https://docs.voidlinux.org/installation/base-requirements.html
[9]: https://voidlinux.org/download/#download-ready-to-boot-images-for-arm
[10]: https://itsfoss.com/raspberry-pi-alternatives/
[11]: https://itsfoss.com/nomadbsd/
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/04/Void-Linux-Mate.png?resize=800%2C640&ssl=1
[13]: https://wiki.voidlinux.org/Disks#Filesystems
[14]: https://wiki.voidlinux.org/Post_Installation#Updates
[15]: https://itsfoss.com/why-use-bsd/
[16]: https://itsfoss.com/netbsd-8-release/
[17]: https://www.freebsd.org/
[18]: https://github.com/aarnt/octoxbps
[19]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/OctoXBPS.jpg?resize=800%2C534&ssl=1
[20]: https://pastebin.com/g31n1bFT
[21]: https://wiki.voidlinux.org/Rosetta_stone
[22]: https://itsfoss.com/solve-error-partition-grub-rescue-ubuntu-linux/
[23]: https://wiki.voidlinux.org/
[24]: https://docs.voidlinux.org/
[25]: https://wiki.voidlinux.org/XBPS#Official_Repositories
[26]: https://docs.voidlinux.org/xbps/repositories/mirrors/changing.html
[27]: http://reddit.com/r/linuxusersgroup
