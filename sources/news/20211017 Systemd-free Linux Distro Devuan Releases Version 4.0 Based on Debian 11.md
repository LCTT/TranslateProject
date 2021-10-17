[#]: subject: "Systemd-free Linux Distro Devuan Releases Version 4.0 Based on Debian 11"
[#]: via: "https://news.itsfoss.com/devuan-4-release/"
[#]: author: "Rishabh Moharir https://news.itsfoss.com/author/rishabh/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Systemd-free Linux Distro Devuan Releases Version 4.0 Based on Debian 11
======

The developers of Devuan GNU+Linux have recently released the latest stable version – Devuan “Chimaera” 4.0. For those who aren’t aware, Devuan is a fork of Debian that doesn’t use systemd but init as its software suite.

Let’s take a look at what this new release has to offer.

### Key Highlights

The latest release is now based on [Debian 11 “Bullseye”][1] and uses the Linux Kernel 5.10. As mentioned before, you have to choose between init systems – OpenRC, sysvinit, and runit.

![Source: devuan.org][2]

#### Refreshed UI

A new bootloader screen and desktop theming have been introduced.

The release note states –

> Improved desktop support – virtually all desktop environments available in Debian are now part of Devuan, systemd-free

This means you don’t necessarily have to use the default XFCE as the desktop environment. As for desktop managers, gdm3 and ssdm have now been included.

#### Improved Accessibility

The installer is completely based on Debian 11’s installer. Thus, all procedures described in Debian’s wiki will apply here too.

You can now disable task-speech accessibility if you intend to install a console-only system and avoid unnecessary dependencies.

Lastly, you can successfully install a desktop environment without installing PulseAudio. The GUI or console installation sessions will use hardware or software speech synthesis instead. This also includes using a refreshable braille display.

#### Fixes and Updates to Certain Packages

Do note that wicd, the network manager, will no longer be available due to its dependence on the obsolete python2. Instead, you can use other alternatives such as network-manager and connman.

It had been noticed that newer AMD CPUs caused the system to boot to a black screen. To solve this issue, the release notes clearly mention the user to install the firmware-amd-graphics package from the non-free repository. The non-free repositories will be available during the install time.

If you’re upgrading from the previous release, Devuan 3 Beowolf, you may notice missing XFCE app icons. This can easily be solved by running a simple command mentioned in the release notes.

For more details, you can refer to their [official release notes.][3]

### Summing Up

Devuan 4.0 looks like an interesting release, especially for those who want a Debian-like experience but without systemd.

Users running the older versions of Devuan and those looking to migrate from Debian can head over to the [official website’s guide][4]. New users willing to give Devuan 4.0 a try can use the link below.

[Get Devuan Chimaera 4.0][5]

_How do you find Devuan when compared to Debian? Would you like to try it out?_

#### Big Tech Websites Get Millions in Revenue, It's FOSS Got You!

If you like what we do here at It's FOSS, please consider making a donation to support our independent publication. Your support will help us keep publishing content focusing on desktop Linux and open source software.

I'm not interested

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/devuan-4-release/

作者：[Rishabh Moharir][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/rishabh/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/debian-11-feature/
[2]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQ4MCIgd2lkdGg9IjY0MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[3]: https://files.devuan.org/devuan_chimaera/Release_notes.txt
[4]: https://www.devuan.org/os/install
[5]: https://www.devuan.org/get-devuan
