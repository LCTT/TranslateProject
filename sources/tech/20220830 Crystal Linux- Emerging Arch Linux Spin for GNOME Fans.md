[#]: subject: "Crystal Linux: Emerging Arch Linux Spin for GNOME Fans"
[#]: via: "https://www.debugpoint.com/crystal-linux-first-look/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Crystal Linux: Emerging Arch Linux Spin for GNOME Fans
======
Meet Crystal Linux, a unique Arch Linux Spin with stock GNOME experience.

### Introduction

Often I think that we have sufficient Linux distros already. The count is nearing thousands, and fragmentation is at its peak. That is not good for quality software, especially in the open-source space.

There is always a distro available for every use case you can think of.

But Arch Linux is one of the sectors, it’s still emerging – just because of its debatable [complex installation methods][1]. That’s why most of the emerging Arch Linux distributions (such as [Xero Linux][2], [Hefftor Linux][3], Mabox, etc.) try to invent something unique in installation and other areas.

Crystal Linux is one of those distros with a different take on installation while being super user-friendly.

![Crystal Linux Desktop with GNOME 42][4]

### Crystal Linux: First Look

Before you read on, you should know that it’s a new distro (less than a year old) currently under development. So use it with caution.

At first glance, it will feel like a stock GNOME installation, similar to the Fedora workstation. That’s true. With the Arch Linux base and stock GNOME – the performance is top-notch. Although I tried it on a virtual machine, I feel the GNOME and Arch combination performs much better than the Fedora workstation in the same virtual machine setup.

With that said, no such different customization is available apart from those coming with GNOME. Honestly, GNOME doesn’t require any additional customization for its default settings. Looks wise it’s good enough.

### What’s unique about Crystal Linux?

#### jade Installer for Arch

The most important offering is its own installer called “[jade][5]“. Crystal Linux team created a GTK4/libadwaita and Rust-based installer to give you a streamlined experience for Arch installation.

And it looks fantastic  (see the below images).

![jade installer][6]

![selecting desktop to install][7]

![installation][8]

The jade installer reminds me of GNOME’s Tour app, but here it uses a similar principle for installation. Basic information such as Keyboard, region, and names/passwords are captured via a series of screens.

Then you get to choose the desktop environment you want to install. The default version is GNOME; however, you have the option to install all the famous desktops and window managers.

One unique feature of this new installer is that you get options to set up ipv6 and Timeshift restore points.

The partition wizard is currently under development with custom partitioning via this app or GParted as options. Here’s a mockup of the partition module under development (from [Twitter][9]).

![jade with additional options - mockup][10]

Finally, a summary for you before you install this distro/Arch Linux. The installation executes a script at the back end for Arch installation.

#### Onyx – custom GNOME experience (with Budgie?)

From GitHub, I found that there is a customized desktop for base install named [Onyx][11]. Although I am not sure how it fits into this desktop, it also has a Budgie desktop component. Since there is no documentation as such, I guess we need to wait until a stable release.

![Not sure how Onyx is working in the backend][12]

#### Amethyst – New AUR Helper

Do we really need another AUR helper? The [Yay helper][13] is awesome already.

Anyways.

The Crystal Linux also features a homegrown AUR helper and pacman Wrapper called [amethyst][14]. As the dev says, you can install it to any Arch-based distros. Amethyst comes with the command line option “ame” which you can use with standard pacman switches.

![ame terminal command][15]

#### Btrfs file system by default

One of the best features of this distro is the default btrfs file system during installation. Although the current work is ongoing for the additional file system, btrfs as default has its own advantages for backup and restoration.

I don’t remember any other Arch-spin that has btrfs as default.

#### Applications and Packages

Since it is a stock GNOME-based distro, no additional applications are installed. So, you need to spend some time configuring with necessary apps such as LibreOffice, GIMP, Media players, etc.

Firefox and native GNOME apps are available in the default installation.

Crystal Linux seems to deploy the core packages from their own server, NOT from the Arch repo. Hence, some features may arrive a little late for updating the desktop and such.

### Performance

Arch Linux always performs well, in my experience. All the popular desktops such as KDE, GNOME, Xfce – all of them somehow feel faster than in Ubuntu/Fedora.

With that said, the current GNOME 42 version in Crystal Linux is swift. The window animations and gestures feel smooth even in a virtual machine. There is no lag whatsoever.

![Crystal Linux - Performance][16]

Memory footprint is extremely low at 530 MB at idle. Most of the idle state CPUs are consumed by gnome-shell and systemd services.

Default GNOME desktop install takes only 3.8 GB of disk space.

### Wrapping up

The jade installer and btrfs file system are two major highlights of Crystal Linux. Since most of the Arch-based distros follow Calamares installer, it’s good to see a new installer in this space. And it’s really user-friendly.

The distro is just a few months old and has a long road ahead. I strongly believe it will give a competition to the currently famous Arch distro [EndeavourOS][17]. And the fans get to experience vanilla GNOME with Arch without the hassles of [installing Arch with GNOME][18].

You can download the current ISO from the [official website][19]. As I mentioned earlier, use it with caution since it is under development.

So, what are your thoughts about this distro? What are your favourite features? Do let me know in the comment box.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/crystal-linux-first-look/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/install-arch-linux/
[2]: https://www.debugpoint.com/xerolinux-review/
[3]: https://www.debugpoint.com/hefftor-linux-review/
[4]: https://www.debugpoint.com/wp-content/uploads/2022/08/Crystal-Linux-Desktop-with-GNOME-42-1024x579.jpg
[5]: https://github.com/crystal-linux/jade
[6]: https://www.debugpoint.com/wp-content/uploads/2022/08/jade-installer.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2022/08/selecting-desktop-to-install.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2022/08/installation.jpg
[9]: https://twitter.com/Crystal_Linux/status/1564379291529482240
[10]: https://www.debugpoint.com/wp-content/uploads/2022/08/jade-with-additional-options-mockup-1024x576.jpg
[11]: https://github.com/crystal-linux/onyx
[12]: https://www.debugpoint.com/wp-content/uploads/2022/08/Not-sure-how-Onyx-is-working-in-the-backend-1024x576.jpg
[13]: https://www.debugpoint.com/install-yay-arch/
[14]: https://github.com/crystal-linux/amethyst
[15]: https://www.debugpoint.com/wp-content/uploads/2022/08/ame-terminal-command-1024x576.jpg
[16]: https://www.debugpoint.com/wp-content/uploads/2022/08/Crystal-Linux-Performance-1024x576.jpg
[17]: https://www.debugpoint.com/tag/endeavouros
[18]: https://www.debugpoint.com/gnome-arch-linux-install/
[19]: https://getcryst.al/