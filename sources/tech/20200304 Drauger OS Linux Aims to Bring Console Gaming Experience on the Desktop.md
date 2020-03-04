[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Drauger OS Linux Aims to Bring Console Gaming Experience on the Desktop)
[#]: via: (https://itsfoss.com/drauger-os/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

Drauger OS Linux Aims to Bring Console Gaming Experience on the Desktop
======

For years (or decades) people complained that one of the reasons to not [use Linux][1] is lack of mainstream games. [Gaming on Linux][2] has improved drastically in last few years specially with the [introduction of Steam Proton][3] project that enables you to [play a lot of Windows-only games on Linux][4].

This also has encourages several [Linux distributions centered around gaming][5]. Take [Lakka][6] for example. You can [turn your old computer into a retro gaming console thanks to Lakka Linux][7].

Another such gaming focused Linux distribution is [Draguer OS][8] and we are going to take a look at it today.

### What is Drauger OS?

Accord to [the project’s website][9], “Drauger OS is a Linux desktop gaming operating system. It aims to provide a platform for gamers to use where they can get great performance without sacrificing their security. Furthermore, it aims to make it easy for anyone to game, whether they use a keyboard and mouse, or some sort of controller.”

They stress that Drauger OS is not for everyday use. As such, many of the productivity tools that most other distros come with are not in Drauger OS.

![Drauger OS 7.4.1][10]

Drauger OS is [based][9] on the Ubuntu. The current version (7.4.1 Jiangshi) uses “[Liquorix][11] low latency Linux kernel, a pre-compiled ZEN kernel designed with a balance between latency and throughput in mind”. However, that will be changing in the next release. They only have one desktop environment choice, a modified version of [Xfce][12].

Drauger OS has several applications and tools installed out of the box to improve the gaming experience. These include:

  * [PlayOnLinux][13]
  * WINE
  * [Lutris][14]
  * Steam
  * [DXVK][15]



It also has an interesting set of tools that are not gaming related. [Drauger Installer][16] is a .deb installer and alternative to Gdebi. [Multiple Repository App Installer][17] (mrai) is “an AUR-helper-like script for Debian-based Linux Operating Systems”. Mrai is designed to work with apt, snaps, flatpaks, and can install apps from GitHub.

Interestingly, Drauger OS’ name is an error. Lead dev [Thomas Castleman][18] (aka batcastle) has intended to name his distro Draugr, but had mistyped the name. In [episode 23][19] of the Drauger OS podcast, Castleman said the name will stay misspelled because it would be a lot of work to correct it. According to [Wikipedia][20], a draugr is “an undead creature from Norse mythology”.

Yes, you read that correctly. Drauger OS is one of only a few distros that have its own [podcast][21]. When asked about it, Castleman told me that “I wanted to ensure that we had the maximum transparency possible with our community, no matter their circumstances.” Most of the time, the podcast is an audio version of the Drauger OS blog, but sometimes they use it to make an announcement when they don’t have time to write a blog post.

### The Future for Drauger OS

![Drauger OS][22]

The developers behind Druager OS are working on their next major release: 7.5.1. This release will be based on Ubuntu 19.10. There will be three major changes. First, the Liquorix kernel will be [replaced][23] with “a kernel we are building in-house.” This kernel will be based on the Linux Kernel GitHub repository, “so it’s about as vanilla as it gets”.

The second major change in the new release will a new layout for their desktop. Based on user feedback, they have decided to change it to something that looks more GNOME-like.

Thirdly, they are dropping SystemBack as their backup tool and installer. They have instead written a new [installer][24] from scratch.

The Dev team is also working on an [ARM version][25] of Drauger OS. They hope to release it sometime in 2022.

### System requirements for Draguer OS

The Drauger OS [system requirements][25] are pretty modest. Keep in mind that Drauger OS will only run on 64-bit systems.

#### Minimum system requirements

  * CPU: Dual-Core, 1.8GHz, 64-bit processor
  * RAM: 1 GB
  * Storage: 16 GB
  * Graphics Processor: Integrated
  * Screen Resolution: 1024×768 at 60Hz
  * External Ports: 1 Port for Display (HDMI / DisplayPort / VGA / DVI), 2 USB Ports for Installation USB Drive and Keyboard (Mouse optional, but recommended)



#### Recommended system requirements

  * CPU: Quad-Core, 2.2Ghz, 64-bit processor
  * RAM: 4 GB
  * Storage: 128 GB
  * Graphics Processor: NVIDIA GTX 1050, AMD RX 460, or equivalent card
  * Screen Resolution: 1080p at 60Hz
  * External Ports: 1 Port for Display (HDMI / DisplayPort / VGA / DVI), 3 USB Ports for Installation USB Drive, Keyboard, and Mouse, 1 Audio Out Port



### How you can help out Drauger OS

There are several ways that you can help out the Drauger OS if you are interestedin doing so. They are always looking for [financial support][26] to keep development going.

If you want yo contribute code, they are looking for people with experience in BASH, C++, and Python. All of their code is up on [GitHub][27]. You can also [contact][28] them on social media.

### Final Thoughts

Drauger OS is quite a project. I’ve seen a couple of other [gaming-oriented distributions][29], but Drauger OS is single-minded in its focus on gaming. Since I am more of a casual gamer, this distro doesn’t appeal to me personally. But, I can see how it could lure gaming enthusiasts to Linux. I wish them good luck in their future releases.

What are your thoughts on this gaming-only distro? What is your favorite Linux gaming solution? Please let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][30].

--------------------------------------------------------------------------------

via: https://itsfoss.com/drauger-os/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/why-use-linux/
[2]: https://itsfoss.com/linux-gaming-guide/
[3]: https://itsfoss.com/steam-play-proton/
[4]: https://itsfoss.com/steam-play/
[5]: https://itsfoss.com/linux-gaming-distributions/
[6]: http://www.lakka.tv/
[7]: https://itsfoss.com/lakka-retrogaming-linux/
[8]: https://draugeros.org/go/
[9]: https://www.draugeros.org/go/about/
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/02/drauger-os-7.4.1.jpg?ssl=1
[11]: https://liquorix.net/
[12]: https://www.xfce.org/
[13]: https://www.playonlinux.com/en/
[14]: https://lutris.net/
[15]: https://github.com/doitsujin/dxvk
[16]: https://github.com/drauger-os-development/drauger-installer
[17]: https://github.com/drauger-os-development/mrai
[18]: https://github.com/Batcastle
[19]: https://anchor.fm/drauger-os/episodes/Episode-23-eapu47
[20]: https://en.wikipedia.org/wiki/Draugr
[21]: https://anchor.fm/drauger-os
[22]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/02/drauger-os-7.5.1.png?ssl=1
[23]: https://www.draugeros.org/go/2020/01/20/major-changes-in-drauger-os-7-5-1/
[24]: https://github.com/drauger-os-development/system-installer
[25]: https://www.draugeros.org/go/system-requirements/
[26]: https://www.draugeros.org/go/contribute/
[27]: https://github.com/drauger-os-development
[28]: https://www.draugeros.org/go/contact-us/
[29]: https://itsfoss.com/manjaro-gaming-linux/
[30]: https://reddit.com/r/linuxusersgroup
