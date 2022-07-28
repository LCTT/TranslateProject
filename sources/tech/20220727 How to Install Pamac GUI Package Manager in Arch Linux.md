[#]: subject: "How to Install Pamac GUI Package Manager in Arch Linux"
[#]: via: "https://itsfoss.com/install-pamac-arch-linux/"
[#]: author: "Anuj Sharma https://itsfoss.com/author/anuj/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install Pamac GUI Package Manager in Arch Linux
======

[Pamac][1] is the package manager of [Manjaro][2] based on [libalpm][3] which also supports Appstream, [AUR][4], [Flatpak][5] and [Snaps][6]. Being an alternative to [pacman][7] it focuses on providing an easy-to-use interface whether it is GUI or CLI.

Arch Linux relies on the [pacman commands for package management][8]. You may get a GUI-based software center from your desktop environment.

However, if you want to install the fabulous Pamac package manager in Arch Linux, you could do that.

In this tutorial, I’ll show you two methods to do that:

* Installing from the AUR
* Installing from the [Chaotic-AUR][9] (Recommended as the developers of Garuda Linux sign packages)

Both are command line methods, but you are an Arch user, and I believe you can handle the command line a bit, can you not?

### Method 1: Installing Pamac from the AUR

If you have an AUR helper like Yay installed already, getting Pamac is really easy.

```
yay -S pamac-aur
```

**Otherwise, you’ll have to go the challenging route.**

First, update your system as Arch is a rolling release distribution and [do not support partial upgrades][10]. Enter the following command in the terminal to [update your Arch Linux system][11].

```
sudo pacman -Syu
```

Then you need to install all the packages of the [base-devel][12] package group and [git][13] by entering the command below.

```
sudo pacman -S --needed base-devel git
```

Now you need to build and install [archlinux-appstream-data-pamac][14], [libpamac-aur][15] and [pamac-aur][16] respectively.

Enter the following commands replacing the package name with packages you want to install for all the 3 packages.

```
git clone https://aur.archlinux.org/archlinux-appstream-data-pamac.git
cd archlinux-appstream-data-pamac
makepkg -si
```

In this case, the AUR package `pamac-aur` have other AUR packages as dependencies. So you have to build and install them before installing the main package. This hassle can be avoided by using an [AUR helper][17].

Building and installing packages from AUR may fail due to outdated [PKGBUILD][18] and there are plenty of them in the AUR. Also, you need to manually update AUR packages if there is an update, as AUR packages don’t update when you update your system with Pacman.

In my opinion, you should use the next method. You don’t have to bother building and updating Pamac manually when there is an update.

### Method 2: Installing Pamac from the Chaotic-AUR (Recommended)

Chaotic-AUR is a repository for Arch Linux maintained by the developers of [Garuda Linux][19]. Packages of this repo are signed and can be trusted. When you add this repo, you can install Pamac using Pacman directly.

Let’s add the repo by entering the following commands.

```
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
```

The above command just installs the keyring and mirrorlist for the repo. You also have to add the repo to the end of */etc/pacman.conf*. Here I will use nano to edit the file.

```
sudo nano /etc/pacman.conf
```

The resulting file should look something like this.

```
...
# An example of a custom package repository.  See the pacman manpage for
# tips on creating your own repositories.
#[custom]
#SigLevel = Optional TrustAll
#Server = file:///home/custompkgs

[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist
```

Now update your system using Pacman and install Pamac by the entering the following command.

```
sudo pacman -Syu pamac-aur
```

Once installed, you can access the GUI from Application Menu and CLI using the pamac command.

![Pamac GUI][20]

![Pamac CLI][21]

In case you don’t like Pamac, you can remove it along with its dependencies and configuration files using pacman via the following command:

```
sudo pacman -Rns pamac-aur
```

### Conclusion

When I started using Arch Linux, I was also very skeptical about installing AUR packages as they took a long time to build and many times refused to build due to outdated PKGBUILD. I wish we had Chaotic-AUR earlier kudos to the Garuda Linux developers.

Note that there are other variants of Pamac available in the AUR which support Flatpak and Snaps. But in this tutorial, I have mentioned the variant with only Appstream and AUR support.

What’s your opinion on adding a 3rd party repos like Chaotic-AUR on Arch Linux? Which method would you use to install Pamac?

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-pamac-arch-linux/

作者：[Anuj Sharma][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/anuj/
[b]: https://github.com/lkxed
[1]: https://wiki.manjaro.org/index.php/Pamac
[2]: https://manjaro.org/
[3]: https://man.archlinux.org/man/libalpm.3.en
[4]: https://aur.archlinux.org
[5]: http://flatpak.org
[6]: https://snapcraft.io/
[7]: https://wiki.archlinux.org/title/Pacman
[8]: https://itsfoss.com/pacman-command/
[9]: https://aur.chaotic.cx/
[10]: https://wiki.archlinux.org/title/System_maintenance#Partial_upgrades_are_unsupported
[11]: https://itsfoss.com/update-arch-linux/
[12]: https://archlinux.org/groups/x86_64/base-devel/
[13]: https://git-scm.com/
[14]: https://aur.archlinux.org/packages/archlinux-appstream-data-pamac
[15]: https://aur.archlinux.org/packages/libpamac-aur
[16]: https://aur.archlinux.org/packages/pamac-aur
[17]: https://wiki.archlinux.org/title/AUR_helpers
[18]: https://wiki.archlinux.org/title/PKGBUILD
[19]: http://garudalinux.org
[20]: https://itsfoss.com/wp-content/uploads/2022/07/pamac-gui.png
[21]: https://itsfoss.com/wp-content/uploads/2022/07/pamac-cli-terminal.png
