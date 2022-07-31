[#]: subject: "SpiralLinux: The New Distro Making Debian Easier for Beginners"
[#]: via: "https://itsfoss.com/spirallinux-review/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

SpiralLinux: The New Distro Making Debian Easier for Beginners
======
SpiralLinux is a new entrant in the world of desktop-focused Linux distributions.

It is based on Debian Linux and created by the unnamed developer of [GeckoLinux][1].

Gecko what? [GeckoLinux][2] is a derivative of openSUSE and focuses on providing out-of-the-box usability to desktop users.

The aim for [SpiralLinux][3] is also the same. Provide an out-of-the-box usable Debian experience to desktop users.

Is Debian really that complex? While Debian is considered the most stable distro, the vanilla Debian often overwhelms new users with multiple download options. The focus on FOSS-only software by default policy also makes things difficult for beginners. It requires various tweaks after the first boot to make it useful.

And those are the areas where SpiralLinux shines!

Through this article, I’m going to walk you through the features of SpiralLinux and share my experience, so you can have a better idea of what to expect from SpiralLinux.

### SpiralLinux: Debian simplified

The first question that will come to your mind is why another [Debian-based distro][4]? The core idea behind SpiralLinux is to get you a well-tuned Debian that can be used out of the box.

If you [try installing Debian][5], you’ll notice a number of download options but they do not include proprietary drivers and codecs which are necessary for modern hardware (including mine). Getting the right ISO itself is the first struggle.

Not to forget that you’ll have to further tweak your vanilla Debian system to make it work with your hardware.

SpiralLinux aims to address those pain points by providing several pre-installed software, performance tweaks and proprietary drivers and codecs support.

Some key highlighting features are as follows:

* Ships with a wide range of drivers to support a variety of hardware
* zRAM is enabled by default for better performance
* It can be upgraded to Debian testing Unstable branches with just a few clicks
* It uses Linux kernel 5.18 out of the box to support the most recent hardware
* Proprietary media codecs are pre-installed
* Third-party Debian repositories are enabled by default
* ISOs available for Cinnamon, Xfce, GNOME, KDE, MATE, Budgie, and LXQt desktop environments
* An experimental “builder” ISO for experts

![SpiralLinux DE offerings][6]

#### System Requirements

There’s no mention of 32-bit or ARM support in the official documentation. You only get a single download option for a 64-bit system.

As SpiralLinux is entirely based on Debian stable, these are the standard system requirements for 64-bit machines:

* RAM: 2 GB or higher (Depends on the [desktop environment][7] you choose)
* Processor: Dual-core or higher
* Disk: 15 GB or higher

#### Installation

![Calamares installer for SpiralLinux][8]

As you expect from any easy-to-use Linux distro, SpiralLinux provides a graphical installer. Avid distrohoppers can easily see that it uses Calamares installer.

The installer has all the necessary features you expect such as manual/auto partitioning, disk encryption, changing bootloader location, and so on.

You can choose Btrfs as the default file system while installing SpiralLinux.

### My Experience with SpiralLinux

Experience. This is what really matters in the end because adding tons of features can only reduce steps after the first boot.

Like any other thing in the world, SpiralLinux has some good and some bad points. I’ll be addressing both pros and cons so that you can have a better idea.

#### Positives

Let’s start this review with positives, which includes the parts which I enjoyed.

##### Hardware support

My system is equipped with modern hardware and requires a modern kernel. By far, I never thought I would be able to boot into Debian 11, but this changed my mind.

By default, you get Linux Kernel 5.18, which is newer than what you get on vanilla Debian (5.10 series) and works well on my 12th gen Intel CPU.

![Linux kernel 5.18][9]

##### Non-free repositories

![Non-free repos][10]

Once in a while, we all need to install proprietary packages that are not available in default repositories.

These non-free repositories include closed-source firmware and drivers, which will help install proprietary microcodes and other software unavailable in the default repository.

##### Switching from Stable to Sid and Testing

![Using Debian Sid][11]

This is my favorite feature from the entire catalog. Just imagine, you can switch between stable, unstable, and testing branches without using a single command.

The best part is that users are given simple instructions on how they can switch between branches. You can access them from [here.][12]

##### Performance

SpiralLinux is well optimized in terms of RAM consumption and makes it an ideal choice for low-end hardware if you choose the right desktop environment.

I’ll show you what you can expect from [different desktop environments][13]. So if you are someone with decent hardware, you can opt for Cinnamon, as it only consumes around 900 MB of RAM in idle usage.

![idle ram consumption on cinnamon de][14]

But what if you are looking for something lighter? change your current DE to Xfce and as we already know, it is one of the most lightweight DEs; idle RAM consumption will only be around 600 MB.

![Idle ram consumption on Xfce de][15]

Either way, I didn’t encounter any performance issues, and things went well.

#### Negatives

SpiralLinux shines in various scenarios but I also encountered a few hiccups. Let me share them with you.

##### Hardware Acceleration Issue in VM

Once you boot into a VM without any hardware acceleration, you will be advised to enable it, as you may experience poor performance and high CPU usage.

![Requires hardware acceleration for better performance][16]

And once you enable hardware acceleration, you will find your VM is often crashing while booting. It’s no minor crash and makes your VM unstable.

![VM Hardware acceleration issue][17]

You can easily use SpiralLinux without enabling any hardware acceleration. I found no issues at all while using it without any acceleration enabled.

##### Snap Issues 

While Snaps are not my go-to choice, I use them when I want to get away from building packages from source. But this was a below-average experience with snaps in SpiralLinux.

I had two issues. One is that many of the snap packages were not even working. I even tried switching between other branches.

This was the issue with the fresh installation, without even changing a single config file. I noticed that many of my favorite apps, such as Spotify and Slack were not working in Snap form.

Some packages did work though. I use Shutter for screenshots and when I installed it using snaps, I was introduced to a quite outdated UI.

![Shutter][18]

The second problem was that any installed snap packed are not listed in the system menu by default. You can easily solve that issue by utilizing the given command:

```
sudo cp /var/lib/snapd/desktop/applications/*.desktop ~/.local/share/applications/
```

But this was only with Snap packages. Flatpaks were working quite smoothly and none of the problems I mentioned above were faced with Flatpaks.

### Final Thoughts

I like the imagination of the developer. GeckoLinux is based on openSUSE. Since openSUSE logo/mascot is a chameleon, the developer named it Gecko (a type of lizard).

The logo of Debian is a swirl, so the developer named the Debian variant SpiralLinux.

Both have the intention of simplifying the experience of their popular parent distro.

[Many other Debian-based distributions][19] have the same purpose as SpiralLinux. Linux Mint Debian Edition ([LMDE][20]) is one such example.

Personally, I would prefer using the main distribution instead of its derivative. But I understand that a few users may find it more convenient to use these derivatives.

I leave the comments open for you now. Do you think SpiralLinux has the potential to carve out a niche for itself or is it one of those distributions that will be lost in oblivion?

--------------------------------------------------------------------------------

via: https://itsfoss.com/spirallinux-review/

作者：[Sagar Sharma][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/geckolinux-review/
[2]: https://geckolinux.github.io/
[3]: https://spirallinux.github.io/
[4]: https://itsfoss.com/debian-based-distros/
[5]: https://itsfoss.com/install-debian-easily/
[6]: https://itsfoss.com/wp-content/uploads/2022/07/spirallinux-flavors.png
[7]: https://itsfoss.com/what-is-desktop-environment/
[8]: https://itsfoss.com/wp-content/uploads/2022/07/Calamares-installer-1.png
[9]: https://itsfoss.com/wp-content/uploads/2022/07/Linux-Kernel-5.18-1.png
[10]: https://itsfoss.com/wp-content/uploads/2022/07/Non-free-repos.png
[11]: https://itsfoss.com/wp-content/uploads/2022/07/Using-Debian-sid.png
[12]: https://github.com/SpiralLinux/SpiralLinux-project/wiki#switching-from-debian-stable-to-the-testing-or-unstable-branch
[13]: https://itsfoss.com/best-linux-desktop-environments/
[14]: https://itsfoss.com/wp-content/uploads/2022/07/idle-RAM-consumption-on-Cinnamon-DE.png
[15]: https://itsfoss.com/wp-content/uploads/2022/07/idle-RAM-consumption-on-Xfce-DE.png
[16]: https://itsfoss.com/wp-content/uploads/2022/07/Reuires-hardware-acceleration-for-better-performance.png
[17]: https://itsfoss.com/wp-content/uploads/2022/07/VM-3D-acceleration-issue.png
[18]: https://itsfoss.com/wp-content/uploads/2022/07/Shutter.png
[19]: https://itsfoss.com/debian-based-distros/
[20]: https://linuxmint.com/download_lmde.php
