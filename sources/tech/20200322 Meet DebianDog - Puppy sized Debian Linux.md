[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Meet DebianDog – Puppy sized Debian Linux)
[#]: via: (https://itsfoss.com/debiandog/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

Meet DebianDog – Puppy sized Debian Linux
======

Recently I stumbled upon an intriguing Linux project. This project aims to create small live CDs for Debian and Debian-based systems, similar to the [Puppy Linux project][1]. Let’s take a look at DebianDog.

### What is DebianDog?

As it says on the tin, [DebianDog][2] “is a small Debian Live CD shaped to look like Puppy and act like Puppy. Debian structure and Debian behaviour are untouched and Debian documentation is 100% valid for DebianDog. You have access to all Debian repositories using apt-get or synaptic.”

![DebianDog Jessie][3]

For those of you who are not familiar with [Puppy Linux][1], the project is “a collection of multiple Linux distributions, built on the same shared principles”. Those principles are to be fast, small (300 MB or less), and easy to use. There are versions of Puppy Linux built to support Ubuntu, Slackware, and Raspbian packages.

The major difference between DebianDog and Puppy Linux is that Puppy Linux has its own package manager [the [Puppy Package Manager][4]]. As stated above, DebianDog using the Debian package manager and packages. Even the DebianDog website tries to make that clear: “It is not Puppy Linux and it has nothing to do with Puppy based on Debian.”

### Why should anyone use DebianDog?

The main reason to install DebianDog (or any of its derivatives) would be to restore an older system to operability. Every entry on DebianDog has a 32-bit option. They also have lighter desktop environments/window managers, such as [Openbox][5] or the [Trinity Desktop][6] environment. Most of those also have an alternative to systemd. They also come with lighter applications installed, such as [PCManFM][7].

### What versions of DebianDog are available?

Though DebianDog was the first in the series, the project is called ‘Dog Linux’ and provides various ‘Dog variants’ on popular distributions based on Debian and Ubuntu.

#### DebianDog Jessie

The first (and original) version of DebianDog is DebianDog Jessie. There are two [32-bit versions][8] of it. One uses [Joe’s Window Manager (JWM)][9] as default and the other uses XFCE. Both systemd and sysvinit are available. There is also a [64-bit version][10]. DebianDog Jessie is based on Debian 8.0 (codename Jessie). Support for Debian 8.0 ends on June 30th, 2020, so install with caution.

![TrinityDog][11]

#### StretchDog

[Stret][12][c][12][hDog][12] is based on Debian 9.0 (codename Stretch). It is available in 32 and 64-bit. Openbox is the default window manager, but we can also switch to JWM. Support for Debian 9.0 ends on June 30th, 2022.

#### BusterDog

[BusterDog][13] is interesting. It is based on [Debian 10][14] (codename Buster). It does not use systemd, instead, it uses [elogind][15] just like [AntiX][16]. Support for Debian 10.0 ends on June 2024.

#### MintPup

[MintPup][17] is based on [Linux Mint][18] 17.1. This LiveCD is 32-bit only. You can also access all of the “Ubuntu/Mint repositories using apt-get or synaptic”. Considering that Mint 17 has reached end of life, this version must be avoided.

#### XenialDog

There are both [32-bit][19] and [64-bit versions][20] of this spin based on the Ubuntu 16.04 LTS. Both versions come with Openbox as default with JWM as an option. Support for Ubuntu 16.04 LTS ends in April of 2021, so install with caution.

#### TrinityDog

There are two versions of the [TrintyDog][21] spin. One is based on Debian 8 and the other is based on Debian 9. Both are 32-bit and both use the [Trinity Desktop Environment][6], thus the name.

![BionicDog][22]

#### BionicDog

As you should be able to guess by the name. [BionicDog][23] is based on [Ubuntu 18.04 LTS][24]. The main version of this spin has both 32 and 64-bit with Openbox as the default window manager. There is also a version that uses the [Cinnamon desktop][25] and is only 64-bit.

### Final Thoughts

I like any [Linux project that wants to make older systems usable][26]. However, most of the operating systems available through DebianDog are no longer supported or nearing the end of their life span. This makes it less than useful for the long run.

**I wouldn’t really advise to use it on your main computer.** Try it in live USB or on a spare system. Also, [you can create][27] your own LiveCD spin if you want to take advantage of a newer base system.

Somehow I keep on stumbling across obscure Linux distributions like [FatDog64][28], [4M Linux][29] and [Vipper Linux][30]. Even though I may not always recommend them to use, it’s still good to know about the existence of such projects.

What are your thoughts on the DebianDog? What is your favorite Puppy-syle OS? Please let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][31].

--------------------------------------------------------------------------------

via: https://itsfoss.com/debiandog/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: http://puppylinux.com/
[2]: https://debiandog.github.io/doglinux/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/DebianDog-Jessie.jpg?fit=800%2C600&ssl=1
[4]: http://wikka.puppylinux.com/PPM?redirect=no
[5]: http://openbox.org/wiki/Main_Page
[6]: https://www.trinitydesktop.org/
[7]: https://wiki.lxde.org/en/PCManFM
[8]: https://debiandog.github.io/doglinux/zz01debiandogjessie.html
[9]: https://en.wikipedia.org/wiki/JWM
[10]: https://debiandog.github.io/doglinux/zz02debiandog64.html
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/TrinityDog.jpg?ssl=1
[12]: https://debiandog.github.io/doglinux/zz02stretchdog.html
[13]: https://debiandog.github.io/doglinux/zz03busterdog.html
[14]: https://itsfoss.com/debian-10-buster/
[15]: https://github.com/elogind/elogind
[16]: https://antixlinux.com/
[17]: https://debiandog.github.io/doglinux/zz04mintpup.html
[18]: https://linuxmint.com/
[19]: https://debiandog.github.io/doglinux/zz05xenialdog.html
[20]: https://debiandog.github.io/doglinux/zz05zxenialdog.html
[21]: https://debiandog.github.io/doglinux/zz06-trinitydog.html
[22]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/BionicDog.jpg?ssl=1
[23]: https://debiandog.github.io/doglinux/zz06-zbionicdog.html
[24]: https://itsfoss.com/ubuntu-18-04-released/
[25]: https://en.wikipedia.org/wiki/Cinnamon_(desktop_environment)
[26]: https://itsfoss.com/lightweight-linux-beginners/
[27]: https://github.com/DebianDog/MakeLive
[28]: https://itsfoss.com/fatdog64-linux-review/
[29]: https://itsfoss.com/4mlinux-review/
[30]: https://itsfoss.com/viperr-linux-review/
[31]: https://reddit.com/r/linuxusersgroup
