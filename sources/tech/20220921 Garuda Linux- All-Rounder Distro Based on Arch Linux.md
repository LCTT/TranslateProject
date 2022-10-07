[#]: subject: "Garuda Linux: All-Rounder Distro Based on Arch Linux"
[#]: via: "https://www.debugpoint.com/garuda-linux-review-2022/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Garuda Linux: All-Rounder Distro Based on Arch Linux
======
A review of the Arch Linux based Garuda Linux, which brings a collection of desktop environments, window managers, and tools for general users and gamers.

Over the years, we [reviewed][1] a couple of Arch-based distros – spread across new ones, stables distros and more. Each one of them is a little different from the others. Finally, we review the Garuda Linux in 2022 – it’s our first review of this distro, and we will continue with all the major releases.

![Garuda Linux Desktop (2022)][2]

### What does it offer?

There are many customized and easy-to-use Arch-based Linux distributions available. Every one of those tries to present something new other than just another variant of Arch Linux.

Garuda Linux does offer a few new features compared to others.

Firstly, it **brings almost all popular desktops and window managers** such as KDE, Xfce, GNOME, LXQt-kwin, Cinnamon, Mate, Wayfire, Qtile, i3wm and Sway.

Second, it offers the **default BTRFS file system with zstd compression** for better performance. In addition, it provides the popular **Chaotic-Aur**, which contains a vast collection of pre-compiled binaries from AUR. Moreover, a group of hand-picked themes, icons and cursors give Garuda Linux an edge over the other Arch-based distros.

Finally, its primary selling point is i**ts pre-made for Gaming in Arch Linux** with native apps such as Garuda Gamer and the option for Zen Kernel.

### Garuda Linux Review – 2022 Edition

This review is based on Garuda’s default offering, i.e. Garuda dragonized zen kernel with KDE Plasma (April 28, 2022 iso).

#### Download and Installation

![Garuda Linux – boot screen][3]

The download via torrent was fast without any problems. The LIVE boot asks whether you want to boot using open-source or NVIDIA drivers. Finally, the welcome screen is well designed and gives you clear instructions to launch the installer.

Garuda offers **separate ISO files for different desktops** and window managers. Because a massive set of packages pre-loaded in ISO files also gives you the option for the LITE version with KDE Plasma. The LITE versions are the base Garuda Linux without additional theming and packages.

So, pick the one you want for your needs.

Garuda Linux uses **Calamares** installer. The Calamares are not configured heavily, and installation is pretty straightforward. However, Calamares doesn’t give you the option to choose the desktop environments or packages. As I mentioned above, it has a separate installer for each of those.

During my test, the installation went smoothly, and it took around 5 minutes to launch the LIVE medium to completion in an Intel i5, 8 GB, SSD configuration. **It’s blazing fast, in my opinion.**

#### Look and Feel

After the successful installation, you see a **nice login screen** (SDDM with themes). It is well designed and aligned with Garda Linux’s design patterns.

![The Login screen (SDDM) of Garuda Linux][4]

The KDE Plasma desktop is heavily customized in terms of look in Garuda Linux. Firstly, the Latte dock is well placed with essential shortcuts at the bottom. No unnecessary shortcuts are there, which is nice.

![Garuda Linux Desktop with Latte dock][5]

Second, at the top bar, you get the application menu of KDE Plasma with Latte dock widgets. All the widgets are well placed and necessary for all user bases. By default, the top bar contains NEtSpeed widgets, clipboard and volume controls and the event calendar widget of the Latte dock.

Garuda Linux uses **Kvantum theme engine** with “sweetified-plasma” theme with kvantum-dark application style, giving it its unique look. In addition, the famous BeautyLine icon theme provides the much-needed contrast (as designed) to this distro.

#### Initial Setup and Applications

Firstly, the initial setup gives you several options to quickly configure your desktop before your first use.

A series of terminal-based operations is provided by its welcome applications, such as system upgrades.

The welcome application gives an assorted list of Garuda utilities, ranging from system configurations to changing looks. It includes system cleaner, partition manager, Chaotic-aur managers, Gaming utilities, etc.

Not only that, but it also provides access to Garuda services for its users directly from the desktop. It helps new to advanced users in terms of discovery of the services and features.

![Garuda Welcome App][6]

Now, I would like to highlight two crucial apps in this Garuda Linux review.

First, the **Snapper tool** gives you controls to **create system restore points**using several options. If your system breaks at some point, you can always restore it to a stable state using this utility. This is one of the much-needed applications, considering it’s a rolling release.

![The Snapper Tools for system restore points][7]

Second, the **Octopi software manager**(similar to synaptic) gives you access to all necessary packages in the Arch repo. You can easily install with one click after verifying the dependencies. Moreover, it also gives you the ability to add and remove Arch repositories via GUI.

It’s worth mentioning here that Garuda includes “chaotic-aur” and “multilib” repo by default in addition to the typical “community”, “extra”, and “core” repo.

![Octopi Software Manager][8]

#### The Browser

Garuda doesn’t provide a Firefox web browser by default. It includes the **[customized LibreWolf-based FireDragon web browser][9]**, which integrates well with the KDE Plasma desktop.

In addition, UBlock Origin and Dark Reader add-ons are pre-installed in FireDragon. The FireDragon web browser uses Garuda’s server for searching the web. I am not entirely sure whether it connects to Google in the backend.

![FireDragon Web browser][10]

In addition to the above apps, Garuda uses the advanced Fish shell for command line work. However, LibreOffice and other graphical utilities are not installed by default.

#### Performance and Resource Usage

Garuda is a little resource-heavy, even in an idle state. It consumed around 17% of CPU and RAM usage of approximately 1.2 GB at idle. And if you open more apps, then it will further shoot up.

The htop shows that most of the idle state resources are consumed by KWin. I am not sure why there are five forks of KWin running (perhaps for Kvuntam and other theming). I cross-checked this with a standard Plasma installation, where only one process of KWin runs.

The default KDE Plasma edition of Garuda Linux takes around 6.4 GB of disk space.

![Garuda Linux Performance – Idle State][11]

With the above performance metric, you may be unable to run it in low-end hardware. I recommend using an Intel i7 or similar system with at least 8GB of memory for better performance. However, the official system requirement states 4 GB of memory as below.

* 30 GB storage space
* 4 GB RAM
* Video card with OpenGL 3.3 or better
* 64-bit system

Also, it is worth mentioning that other flavours, such as GNOME, Cinnamon etc., should have much better performance metrics.

### Things which grabbed my attention

Garuda requires 30 GB of disk space, which I overlooked before installing. And it also seems a hard requirement, and the Calamares installer is configured that way. So, you must have a minimum of 30 GB of root partition to install this version of Garuda Linux.

Moreover, it takes around 6 GB of disk space for a default install, and I am not sure why the 30 GB limit is too hardcoded in the installer.

![Garuda Linux requires min 30 GB disk space for installation][12]

While Garuda Linux looks wonderful, I feel the default theming and colour contrast are a little “too much”. It feels excellent with high contrast colours on a dark backdrop at first look. But it does look a little “fanboy” type. Although look and feel are subjective, everyone has a different taste.

But always, you can change the themes, icons and whatnot with just a click in KDE Plasma.

### Closing Notes

Finally, to wrap up the Garuda Linux review of 2022, I must say it is one of the Arch-based distros which stands out from the other distros in the same category. Due to its popularity and active participation from the user base, it shall not be discontinued in the future.

From a general user’s perspective, community help is available via several active channels (which can be accessed via shortcuts from the welcome screen).

If you are keen on gaming, zen Kernel and passionate about Arch Linux, you can choose Garuda. The use case of this distro may vary. I would not recommend it for serious development, projects, media related work.

Then again, Garuda undoubtedly brings unique apps to manage Arch Linux, which is also a plus point. If you need a fancy-looking Arch-based distro to start your Linux journey, it’s perfect.

That said, you can download Garuda Linux from the [official website][13].

And do let me know your opinion about Garuda in the comment box down below.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/garuda-linux-review-2022/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/tag/linux-distro-review
[2]: https://www.debugpoint.com/wp-content/uploads/2022/05/Garuda-Linux-Desktop-2022.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2022/05/Garuda-Linux-boot-screen.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/05/The-Login-screen-SDDM-of-Garuda-Linux.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2022/05/Garuda-Linux-Desktop-with-Latte-dock.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2022/05/Garuda-Welcome-App.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2022/05/The-Snapper-Tools-for-system-restore-points.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2022/05/Octopi-Software-Manager.jpg
[9]: https://github.com/dr460nf1r3/firedragon-browser
[10]: https://www.debugpoint.com/wp-content/uploads/2022/05/FireDragon-Web-browser.jpg
[11]: https://www.debugpoint.com/wp-content/uploads/2022/05/Garuda-Linux-Performance-Idle-State.jpg
[12]: https://www.debugpoint.com/wp-content/uploads/2022/05/Garuda-Linux-requires-min-30-GB-disk-space-for-installation.jpg
[13]: https://garudalinux.org/downloads.html
