[#]: collector: (lujun9972)
[#]: translator: (hkurj)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (6 Best AUR (Arch User Repository) Helpers for Arch Linux)
[#]: via: (https://www.2daygeek.com/best-aur-arch-user-repository-helpers-arch-linux-manjaro/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

6 Best AUR (Arch User Repository) Helpers for Arch Linux
======

Arch Linux is a Linux distribution largely based on the binary packages which targets x86-64 microprocessors computers.

Arch Linux uses rolling release model wherein the updates are frequently delivered over to applications.

It has package manager called **[pacman][1]** which allows to install, remove and update software packages.

Newbies are advised to step in after gaining hand on experience with other Linux flavors since Arch Linux is built for experienced users.

### What is AUR (Arch User Repository)?

[Arch User Repository][2] commonly referred as AUR is the community-based software repository for Arch users.

User compiled packages get into the Arch official repository, based on the package popularity honored by AUR Community.

### What is AUR Helper?

[AUR helper][3] is a wrapper that allows user to install the package from AUR Repository without manual intervention.

Usages such as searching of packages, resolving dependencies, retrieval and build AUR packages, Web content retrieval and submission of AUR packages are being automated.

**The 6 best AUR helpers are listed below:**

  * Yay (Yet another Yogurt)
  * Pakku
  * Pacaur
  * Pikaur
  * Trizen
  * Aura



### 1) Yay (Yet another Yogurt)

[Yay][4] is a best CLI based AUR helper for Arch Linux, written in GO Language. Yay is based on the design of yaourt, apacman and pacaur.

Best recommended for newbies. Similar to that of Pacman, with features matching many of the commands and options used in pacman.Allows users to find matching package providers during search and allow selection.

### How to Install yay

Run the following commands one by one to install yay on Arch Linux based systems.

```
$ sudo pacman -S git go base-devel
$ git clone https://aur.archlinux.org/yay.git
$ cd yay
$ makepkg -si
```

### How to Use yay

This use the same syntax like pacman, use the following command to install a package through yay.

```
$ yay -s arch-wiki-man
```

### 2) Pakku

[Pakku][5] can be treated as another Pacman however dwells in its initial stage. It is a wrapper which allows users to search or install packages from AUR.

It does a decent job of removing the dependencies and also allows to install packages by cloning the PKGBUILD.

### How to Install Pakku

To install pakku on Arch Linux based systems, run the following commands one by one.

```
$ sudo pacman -S git base-devel
$ git clone https://aur.archlinux.org/pakku.git
$ cd pakku
$ makepkg -si
```

### How to Use Pakku

It uses the same syntax as pacman, use the following command to install a package with pakku.

```
$ pakku -s dropbox
```

### 3) Pacaur

Another CLI based AUR helper that helps to reduce the user prompt interaction.

[Pacaur][6] is designed for advanced users who are inclined towards automation for repetitive tasks. Users are expected to be familiar with the AUR manual build process with makepkg and its configuration.

### How to Install Pacaur

To install pakku on Arch Linux based systems, run the following commands one by one.

```
$ sudo pacman -S git base-devel
$ git clone https://aur.archlinux.org/pacaur.git
$ cd pacaur
$ makepkg -si
```

### How to Use Pacaur

It uses the same syntax as pacman, use the following command to install a package with Pacaur.

```
$ pacaur -s spotify
```

### 4) Pikaur

[Pikaur][7] is a AUR helper with minimal dependencies and review PKGBUILDs all in once, next build them all without user interaction.

Pikaur will inform Pacman about the next step by mastering the pacman.

### How to Install Pikaur

To install pakku on Arch Linux based systems, run the following commands one by one.

```
$ sudo pacman -S git base-devel
$ git clone https://aur.archlinux.org/pikaur.git
$ cd pikaur
$ makepkg -fsri
```

### How to Use Pikaur

It uses the same syntax as pacman, use the following command to install a package with Pikaur.

```
$ pacaur -s spotify
```

### 5) Trizen

[Trizen][8] is a command line based lightweight wrapper for AUR, written in Perl. Speed oriented AUR helper which allows users to search, install packages and also permits to read AUR package comments.

Edit support for text files and the Input/output uses UTF-8 support. Built-in interaction with ‘pacman’.

### How to Install Trizen

To install pakku on Arch Linux based systems, run the following commands one by one.

```
$ sudo pacman -S git base-devel
$ git clone https://aur.archlinux.org/trizen.git
$ cd trizen
$ makepkg -si
```

### How to Use Trizen

It uses the same syntax as pacman, use the following command to install a package with Trizen.

```
$ pacaur -s google-chrome
```

### 6) Aura

[Aura][9] is a secure, multilingual package manager for Arch Linux and the AUR, written in Haskell. It supports many Pacman operations and sub-options which allows easy development and beautiful code.

It automates the process of installating packages from the Arch User Repositories.Users normally face difficulties in system upgrade when using Aura.

### How to Install Aura

To install pakku on Arch Linux based systems, run the following commands one by one.

```
$ sudo pacman -S git base-devel
$ git clone https://aur.archlinux.org/aura.git
$ cd aura
$ makepkg -si
```

### How to Use Aura

It uses the same syntax as pacman, use the following command to install a package with Aura.

```
$ pacaur -s android-sdk
```

### Conclusion:

Users can make their choice among the above 6 AUR helpers by analyzing through.

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/best-aur-arch-user-repository-helpers-arch-linux-manjaro/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[2]: https://wiki.archlinux.org/index.php/Arch_User_Repository
[3]: https://wiki.archlinux.org/index.php/AUR_helpers
[4]: https://github.com/Jguer/yay
[5]: https://github.com/kitsunyan/pakku
[6]: https://github.com/E5ten/pacaur
[7]: https://github.com/actionless/pikaur
[8]: https://github.com/trizen/trizen
[9]: https://github.com/fosskers/aura
