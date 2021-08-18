[#]: subject: "7 New Features in the Newly Released Debian 11 ‘Bullseye’ Linux Distro"
[#]: via: "https://news.itsfoss.com/debian-11-feature/"
[#]: author: "Abhishek https://news.itsfoss.com/author/root/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

7 New Features in the Newly Released Debian 11 ‘Bullseye’ Linux Distro
======

The much awaited release of Debian 11 codenamed Bullseye is finally here after two years of development. The release will be supported for the next five years like any other Debian stable version release.

Excited about it? Let’s see what’s new in Debian 11.

### 1\. New theme

Debian 11 comes with a new ‘Homeworld’ theme. It is inspired by the [Bauhaus movement][1], an art style born in Germany in the early 20th century and characterized by its unique approach to architecture and design.

![Debian 11 default wallpaper][2]

You’ll see this theme everywhere in Debian 11 be it on the login screen, installer or on the Grub menu.

![Grub screen][3]

![Installer][4]

![Login screen][2]

### 2\. Newer version of desktop environments

Debian 11 consists of newer version of the desktop flavors it offers:

  * GNOME 3.38
  * KDE Plasma 5.20
  * LXDE 11
  * LXQt 0.16
  * MATE 1.24
  * Xfce 4.16



If you use cutting-edge distributions like Fedora or Arch/Manjaro, you may find it weird. But here’s the thing. Debian prefers stability, and hence the desktop environment versions are not the latest ones. They are newer in comparison to the previous Debian stable release.

### 3\. Package updates

Debian has updates its package repositories. Debian 11 includes over 11294 new packages taking the total to over 59551 packages. Over 42821 software packages have newer versions. Over 9519 packages have been removed for the distribution.

This means that you should see newer versions of the popular applications like LibreOffice, Emacs, GIMP and various server and programming related tools.

### 4\. Linux Kernel 5.10 LTS

Debian 11 features [Kernel 5.10 which is a long term support (LTS) release][5]. Debian 10 Buster used Kernel 4.19 at the time of its release.

A new kernel obviously means better support for hardware, specially the newer hardware along with performance improvements.

### 5\. Printer and Scanner improvement

Debian 11 brings the new package ipp-usb. It uses the vendor-neutral IPP-over-USB protocol supported by many modern printers. This means that many newer printers will be supported by Debian 11 without needing the drivers.

Similarly, SANE driverless backend allows using scanners painlessly.

### 6\. ExFAT support

You no longer need to exfat-fuse package for mounting ExFAT filesystem. Thanks to the Linux kernel 5.10, Debian 11 has support for the exFAT filesystem, and defaults to using it for mounting exFAT filesystems.

### 7\. Still supports 32 bit

Is that even a feature? Considering that only a [handful of Linux distributions now support 32-bit architecture][6], I would say yes.

Apart from 32-bit and 64-bit PC, Debian 11 also supports 64-bit ARM (arm64), ARM EABI (armel), ARMv7 (EABI hard-float ABI, armhf), little-endian MIPS (mipsel), 64-bit little-endian MIPS (mips64el), 64-bit little-endian PowerPC (ppc64el) and IBM System z (s390x).

Now you know why is it called the ‘universal operating system’ 🙂

### Other changes

There are a few more changes in this release.

  * Systemd defaults to using control groups v2 (cgroupv2).
  * New Fcitx 5 is input method for Chinese, Japanese, Korean and many other languages.
  * Systemd journal logs are persistent by default.
  * A new open command to automatically open files from command-line with a certain app (GUI or CLI).
  * Password hashing for local system accounts now uses yescrypt by default instead of SHA-512 for improved security.



More information can be found in the [official release notes][7].

### Getting Debian 11

Debian 11 is available to download from its website. Just head over to the website and get the ISO from there.

[Download Debian][8]

If you are already using Debian 10, you can [easily upgrade to Debian 11 by changing your sources list.][9]

Enjoy the latest and greatest of the universal operating system 🙂

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/debian-11-feature/

作者：[Abhishek][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/root/
[b]: https://github.com/lujun9972
[1]: https://mymodernmet.com/what-is-bauhaus-art-movement/
[2]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQzOSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[3]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQ4MCIgd2lkdGg9IjY0MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjU4NiIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[5]: https://news.itsfoss.com/kernel-5-10-release/
[6]: https://itsfoss.com/32-bit-linux-distributions/
[7]: https://www.debian.org/releases/bullseye/amd64/release-notes/ch-whats-new.en.html
[8]: https://www.debian.org/
[9]: https://www.debian.org/releases/bullseye/amd64/release-notes/ch-upgrading.en.html
