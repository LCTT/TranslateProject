[#]: subject: "Oldest Active Linux Distro Slackware Finally Releases Version 15"
[#]: via: "https://news.itsfoss.com/slackware-15-release/"
[#]: author: "Rishabh Moharir https://news.itsfoss.com/author/rishabh/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Oldest Active Linux Distro Slackware Finally Releases Version 15
======

Rejoice! Linux fans will be pleased to know that the legendary distro, Slackware, has received a new release after a long time. For those unaware, Slackware’s latest version was released way back in 2016.

The entire Linux community was thrilled about it when the devs announced the plans for Slackware 15.0 in February, last year (2021).

The devs had made rapid progress in the development of Slackware Linux 15.0 in the past year, starting with an alpha release at the beginning of the year. It took a while considering its last release candidate release, but it is here now!

Let’s take a look at what’s new with Slackware 15.0

### What’s New in Slackware 15.0?

![][1]

As mentioned before, Slackware 15.0 has received many changes. Not to forget, it involved a beta release and two release candidate (RC) announcements before the final release.

If you have been following our coverage, you may have had come across our [beta release][2] coverage, back in April.

There were a few things that weren’t revealed with its beta/RC releases. So, here, we mention everything important about it.

#### Linux Kernel 5.15 LTS

The major highlight of Slackware 15 is the addition of the latest [Linux Kernel 5.15 LTS][3]. This is a big jump from Linux Kernel 5.10 LTS that we noticed in the beta release.

![][4]

Interestingly, the Slackware team tested hundreds of Linux Kernel versions before settling on Linux Kernel 5.15.19. The release note mentions:

> We’ve actually built over 400 different Linux kernel versions over the years it took to finally declare Slackware 15.0 stable (by contrast, we tested 34 kernel versions while working on Slackware 14.2). We finally ended up on kernel version 5.15.19 after Greg Kroah-Hartman confirmed that it would get long-term support until at least October 2023 (and quite probably for longer than that).

In case you are curious, Linux Kernel 5.15 brings in updates like enhanced NTFS driver support and improvements for Intel/AMD processors and Apple’s M1 chip. It also adds initial support for Intel 12th gen processors.

Overall, with Linux Kernel 5.15 LTS, you should get a good hardware compatibility result for the oldest active Linux distro.

The Linux Kernel is offered in two flavors, one baked in with drivers which does not need initrd and the relies on initrd to load the kernel modules. The release notes mention more about it:

> As usual, the kernel is provided in two flavors, generic and huge. The huge kernel contains enough built-in drivers that in most cases an initrd is not needed to boot the system. The generic kernels require the use of an initrd to load the kernel modules needed to mount the root filesystem. Using a generic kernel will save some memory and possibly avoid a few boot time warnings. I’d strongly recommend using a generic kernel for the best kernel module compatibility as well.

#### KDE Plasma 5.23 and Xfce 4.16

Speaking about KDE, you should find KDE Plasma packages updated to 5.23 while KDE Frameworks was updated to version 5.88.

[KDE Plasma 5.23][5] is KDE’s 25th-anniversary edition release that included UI improvements, and a wide range of subtle changes to improve the user experience.

In addition to this, Slackware 15 also comes with Xfce 4.16 as one of the desktop environment options.

#### Support for PipeWire and Wayland

As an alternative to PulseAudio, the support for PipeWire was added to Slackware 15.

And, for users who want to get away from X11, the support for Wayland also landed with this release.

#### 32-bit Support

Considering Slackware is one of the [suitable Linux distributions for 32-bit systems][6], the latest version features specific kernel versions to support it.

Technically, there are SMP and non-SMP kernels for single-core and multi-core processors.

The SMP kernel is recommended for better performance and memory management, but if you have a processor older than the Pentium III, the non-SMP kernel should come in handy.

#### Other Improvements

![][7]

Some technical upgrades include GCC compiler being upgraded to version 11.2.0. Quite a lot of security and bugs were also addressed.

The announcement furthermore said that the devs were focusing on updating Python Markdown to version 3.3.4 to fix the Samba build.

Other essential packages and apps like Network Manager, OpenSSH, Krita, Falkon browser and Ocular also received upgrades. Mozilla Firefox and Thunderbird were updated to their latest available packages as well.

You can check out the [official changelog][8] if you want to get all the technical details for this release. Some important ones include:

  * Slackware pkgtools received improvements to make the software installation experience hassle-free, without parallel collisions.
  * Slackware 15 includes a “make_world.sh” script for the first time to help rebuild the OS from source code.
  * More scripts have been added to easily rebuild the installer and kernel packages.
  * Dropped Qt4 and moved to Qt 5.
  * Added support for Privileged Access Management (PAM) to support newer projects that did not support shadow passwords.



It is important to note that you cannot easily upgrade from Slackware 14.2. So, it is best to perform a fresh installation.

[Slackware 15][9]

In either case, you should keep a backup of your data, and can try to follow the [official upgrade instructions][10] if you are not interested to install using the new ISO.

### Wrapping Up

I’m excited to see Slackware get a new release, considering the fact that it is still the oldest active Linux distro.

While it is still a recommendation for experienced users or tinkerers, the latest Slackware 15.0 supports UEFI and old systems. If you are looking for an adventure and want a unique Linux distro for your desktop, you can try Slackware 15.

_Will you be testing out Slackware 15.0? What do you think lies ahead for the future of Slackware?_

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/slackware-15-release/

作者：[Rishabh Moharir][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/rishabh/
[b]: https://github.com/lujun9972
[1]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQ0MCIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[2]: https://news.itsfoss.com/slackware-15-beta-release/
[3]: https://news.itsfoss.com/linux-kernel-5-15-release/
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjU3NCIgd2lkdGg9Ijc3NSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[5]: https://news.itsfoss.com/kde-plasma-5-23-release/
[6]: https://itsfoss.com/32-bit-linux-distributions/
[7]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQxMiIgd2lkdGg9IjY3OSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[8]: http://www.slackware.com/changelog/current.php?cpu=x86_64
[9]: http://www.slackware.com/
[10]: https://ftp.osuosl.org/pub/slackware/slackware64-15.0/UPGRADE.TXT
