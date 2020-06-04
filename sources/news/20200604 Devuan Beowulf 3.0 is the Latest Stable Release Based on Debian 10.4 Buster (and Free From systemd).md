[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Devuan Beowulf 3.0 is the Latest Stable Release Based on Debian 10.4 Buster (and Free From systemd))
[#]: via: (https://itsfoss.com/devuan-3-release/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Devuan Beowulf 3.0 is the Latest Stable Release Based on Debian 10.4 Buster (and Free From systemd)
======

[Devuan GNU+Linux][1] is a fork of [Debian][2] without [systemd][3]. If you are wondering what’s wrong with systemd — that’s a discussion for another day.

But, if you are someone who wanted a systemd-free Linux distribution, the release of Devuan Beowulf 3.0 should be good news for you.

### Devuan Beowulf 3.0: What’s New?

![][4]

Devuan is normally appreciated for providing alternative [init][5] software such as [SysV][6].

In this article, we’ll take a look at the key highlights in Devuan Beowulf 3.0.

#### Based on Debian 10.4 Buster

[Debian 10 Buster][7] is undoubtedly an impressive series of releases while Debian 10.4 being the latest.

And, with Devuan Beowulf 3.0, you’ll be happy to know that the release is based on the latest Debian 10.4 Buster update.

In case you aren’t aware of it, you may check out the [official announcement post for Debian 10.4 Buster][8] release to know more about it.

#### Linux Kernel 4.19

It’s also a great addition to have [Linux Kernel 4.19 LTS][9] baked in the latest release.

Of course, not the latest because we are in ‘Debian land’ and things are not always latest here but more stable. The new kernel should fix several issues that you may have had with previous releases.

#### Support For ppc64el Architecture

The support for [ppc64el][10] may not be a big deal for the most part — but having the support for PowerPC and Power ISA processors is a plus.

Not to forget, Devuan GNU+Linux already supports i386, amd64, armel, armhf and arm64 architectures.

#### Added runit &amp; OpenRC as optional alternative

To consider more init software alternatives, [runit][11] and [openrc][12] is now an option in the latest release.

#### Other Changes

In addition to the key highlights mentioned above, you will also find the addition of standalone daemons [eudev][13] and [elogind][14].

The boot screen, the display manager and the desktop theming also includes subtle changes. For example, the boot menu says “**Debian**” instead of “**Devuan**“.

You might want to look the [official release notes][15] if you want more technical details on the changes with Devuan Beowulf 3.0.0.

Trivia

Devuan releases are named after minor planets. Beowulf is a [minor planet numbered 38086][16].

### Wrapping Up

The latest stable release of Devuan Beowulf 3.0 counts as good progress with systemd-free distributions available out there.

If you want to support Devuan project, please make some [contribution to their project either financially][17] or [by other means][18].

What do you think about this release? Feel free to let me know what you think in the comments below!

--------------------------------------------------------------------------------

via: https://itsfoss.com/devuan-3-release/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://devuan.org
[2]: https://www.debian.org
[3]: https://en.wikipedia.org/wiki/Systemd
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/devuan-beowulf.jpg?ssl=1
[5]: https://en.wikipedia.org/wiki/Init
[6]: https://wiki.archlinux.org/index.php/SysVinit
[7]: https://itsfoss.com/debian-10-buster/
[8]: https://www.debian.org/News/2020/20200509
[9]: https://itsfoss.com/linux-kernel-4-19-lts-release/
[10]: https://en.wikipedia.org/wiki/Ppc64
[11]: https://en.wikipedia.org/wiki/Runit
[12]: https://en.wikipedia.org/wiki/OpenRC
[13]: https://wiki.gentoo.org/wiki/Eudev
[14]: https://wiki.gentoo.org/wiki/Elogind
[15]: https://files.devuan.org/devuan_beowulf/Release_notes.txt
[16]: https://en.wikipedia.org/wiki/Meanings_of_minor_planet_names:_38001%E2%80%9339000#086
[17]: https://devuan.org/os/donate
[18]: https://dev1galaxy.org/viewtopic.php?pid=1380#p1380
