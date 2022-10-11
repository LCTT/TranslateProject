[#]: subject: "GUI Apps for Package Management in Arch Linux"
[#]: via: "https://itsfoss.com/arch-linux-gui-package-managers/"
[#]: author: "Anuj Sharma https://itsfoss.com/author/anuj/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

GUI Apps for Package Management in Arch Linux
======

[Installing Arch Linux][1] is considered challenging. This is why [several Arch-based distributions exist][2] to make things easier by providing a graphical installer.

Even if you manage to install Arch Linux, you’ll notice that it relies heavily on the command line. You’ll have to open the terminal if you have to install applications or update the system.

Yes! Arch Linux does not have a software center. Shocking for many, I know.

If you feel uncomfortable using the command line for managing applications, you can install a GUI tool. This helps in searching for packages and installing and removing them from the comfort of the GUI.

Wondering which graphical frontend for [pacman commands][3] you should use? I have some suggestions to help you get started.

**Please note that some software managers are desktop environment specific.**

### 1. Apper

![Installing Firefox using Apper][4]

Apper is a minimal Qt5 application and package manager using PackageKit which also supports AppStream and automatic updates. But, **there is no AUR support**.

To install it from the official repos use the command below.

```
sudo pacman -Syu apper
```

[Apper on GitLab][5]

### 2. Deepin App Store

![Installing Firefox using Deepin App Store][6]

Deepin App Store is an app store for Deepin Desktop Environment built with DTK(Qt5), using PackageKit with AppStream support and also provides system update notifications. There is **no AUR support**.

To install it, use the command below.

```
sudo pacman -Syu deepin-store
```

[Deepin Store on Github][7]

### 3. Discover

![Installing Firefox using Discover][8]

Discover needs no introduction for KDE Plasma users. It is a Qt-based application manager using PackageKit which supports AppStream, Flatpak and Firmware updates.

For installing Flatpak and Firmware updates from Discover `flatpak` and `fwupd` packages need to be installed respectively.

There is no AUR support.

```
sudo pacman -Syu discover packagekit-qt5
```

[Discover on GitLab][9]

### 4. GNOME PackageKit

![Installing Firefox using GNOME PackageKit][10]

GNOMEPackageKit is a GTK3 package manager using PackageKit which supports AppStream. Unfortunately, there is **no AUR support**.

To install it from the official repos use the command below.

```
sudo pacman -Syu gnome-packagekit
```

[PackageKit on freedesktop][11]

### 5. GNOME Software

![Installing Firefox using GNOME Software][12]

GNOME Software needs no introduction for GNOME desktop users. It is the GTK4 application manager using PackageKit which supports AppStream, Flatpak and Firmware updates.

There is no AUR support. To install Flatpak and Firmware updates from GNOME Software `flatpak` and `fwupd` packages need to be installed respectively.

Install it using:

```
sudo pacman -Syu gnome-software-packagekit-plugin gnome-software
```

[GNOME Software on GitLab][13]

### 6. tkPacman

![Installing Firefox using tkPacman][14]

It is a Tk pacman wrapper written in Tcl. The interface is similar to [Synaptic Package Manager][15].

It is quite lightweight due to no GTK/Qt dependencies as it is uses Tcl/Tk GUI toolkit.

It does not support AUR which is ironic because you need to install it from [AUR][16]. You need to install an [AUR helper][17] like yay beforehand.

```
yay -Syu tkpacman
```

[tkPacman on Sourceforge][18]

### 7. Octopi

![Installing Firefox using Octopi][19]

Consider it a better looking cousin of tkPacman. It uses Qt5 and Alpm and also supports Appstream and **AUR (via yay)**.

You also get desktop notifications, repository editor and cache cleaner. The interface is similar to Synaptic Package Manager.

To install it from the AUR, use the following command.

```
yay -Syu octopi
```

[Octopi on GitHub][20]

### 8. Pamac

![Installing Firefox using Pamac][21]

Pamac is the graphical package manager from Manjaro Linux. It based on GTK3 and Alpm and **supports AUR, Appstream, Flatpak and Snap**.

Pamac also supports automatic download of updates and downgrade of packages.

It is the most widely used Application in Arch Linux derivatives. But, has been notorious for [DDoSing the AUR webpage][22].

There are several ways to [install Pamac on Arch Linux][23]. The simplest would be to use an AUR helper.

```
yay -Syu pamac-aur
```

[Pamac on GitLab][24]

### Conclusion

To remove any of the above-mentioned GUI package managers along with the dependencies and configuration files, use the following command replacing *packagename* with the name of package to be removed.

```
sudo pacman -Rns packagename
```

So it seems Arch Linux can also be used without touching the terminal with the right tools.

There are also some other applications also which use Terminal User Interface (TUI). A few examples are [pcurses][25], [cylon][26], [pacseek][27], and [yup][28]. But, this article is about only the ones with proper GUI.

**Note:** PackageKit opens up system permissions by default, and is otherwise [not recommended][29] for general usage. Because if the user is part of the wheel group no password is required to update or install any software.

**You saw several options for using GUI software center on Arch Linux. It’s time to make a decision on using one of them. Which one would you choose? Pamac or OctoPi or something else? Leave a quick comment below right now.**

--------------------------------------------------------------------------------

via: https://itsfoss.com/arch-linux-gui-package-managers/

作者：[Anuj Sharma][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/anuj/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/install-arch-linux/
[2]: https://itsfoss.com/arch-based-linux-distros/
[3]: https://itsfoss.com/pacman-command/
[4]: https://itsfoss.com/wp-content/uploads/2022/09/apper-arch-install-firefox.png
[5]: https://invent.kde.org/system/apper
[6]: https://itsfoss.com/wp-content/uploads/2022/09/apper-arch-install-firefox.png
[7]: https://github.com/dekzi/dde-store
[8]: https://itsfoss.com/wp-content/uploads/2022/09/apper-arch-install-firefox.png
[9]: https://invent.kde.org/plasma/discover
[10]: https://itsfoss.com/wp-content/uploads/2022/09/apper-arch-install-firefox.png
[11]: https://freedesktop.org/software/PackageKit/index.html
[12]: https://itsfoss.com/wp-content/uploads/2022/09/apper-arch-install-firefox.png
[13]: https://gitlab.gnome.org/GNOME/gnome-software
[14]: https://itsfoss.com/wp-content/uploads/2022/09/apper-arch-install-firefox.png
[15]: https://itsfoss.com/synaptic-package-manager/
[16]: https://itsfoss.com/aur-arch-linux/
[17]: https://itsfoss.com/best-aur-helpers/
[18]: https://sourceforge.net/projects/tkpacman
[19]: https://itsfoss.com/wp-content/uploads/2022/09/apper-arch-install-firefox.png
[20]: https://github.com/aarnt/octopi
[21]: https://itsfoss.com/wp-content/uploads/2022/09/apper-arch-install-firefox.png
[22]: https://gitlab.manjaro.org/applications/pamac/-/issues/1017
[23]: https://itsfoss.com/install-pamac-arch-linux/
[24]: https://gitlab.manjaro.org/applications/pamac
[25]: https://github.com/schuay/pcurses
[26]: https://github.com/gavinlyonsrepo/cylon
[27]: https://github.com/moson-mo/pacseek
[28]: https://github.com/ericm/yup
[29]: https://bugs.archlinux.org/task/50459
