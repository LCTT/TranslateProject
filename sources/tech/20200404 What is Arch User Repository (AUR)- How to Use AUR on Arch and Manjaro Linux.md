[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What is Arch User Repository (AUR)? How to Use AUR on Arch and Manjaro Linux?)
[#]: via: (https://itsfoss.com/aur-arch-linux/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

What is Arch User Repository (AUR)? How to Use AUR on Arch and Manjaro Linux?
======

If you have been using [Arch Linux][1] or other distribution based on Arch such as Manjaro, you might have comes across the term AUR. You try to install a new software and someone suggests to install it from AUR. This leaves you confused.

What is this AUR? Why is it used? How to use AUR? I’ll answer these questions in this article.

### What is AUR?

![][2]

AUR stands for Arch User Repository. It is a community-driven repository for Arch-based Linux distributions users. It contains package descriptions named [PKGBUILDs][3] that allow you to compile a package from source with [makepkg][4] and then install it via [pacman][5] (package manager in Arch Linux).

The AUR was created to organize and share new packages from the community and to help accelerate popular packages’ inclusion into the [community repository][6].

A good number of new packages that enter the official repositories start in the AUR. In the AUR, users are able to contribute their own package builds (PKGBUILD and related files).

The AUR community has the ability to vote for packages in the AUR. If a package becomes popular enough — provided it has a compatible license and good packaging technique — it may be entered into the community repository directly accessible by pacman.

In short, AUR is the way for developers to make new software available to Arch Linux users before the software is officially included in Arch repositories.

### Should you use AUR? What’s the risk involved?

Using the AUR is like crossing the street. If you proceed with caution you should be fine.

If you are new to Linux it is advised to not to use the AUR until you build a foundation knowledge about Arch/Manjaro and Linux in general.

It is true that anyone can upload packages to the AUR but the [Trusted Users][7] (TUs) are charged with keeping an eye on what gets uploaded. Although TUs perform quality control to the uploaded packages, there is in no guarantee that packages in the AUR are well formed or not malicious.

In practice the AUR seems to be quite safe but in theory it can do some damage, but only if you are not careful. A smart Arch user, **always** inspects PKGBUILDs and *.install files when building packages from the AUR.

Additionally TUs (Trusted Users) also remove packages in the AUR that are included in core/extra/community so there should be no naming conflicts between them. The AUR will often contain developmental versions of packages (cvs/svn/git/etc) but they will have modified names such as foo-git.

As for the AUR packages, pacman handles dependency resolution and detects file conflicts so you never have to worry about overwriting files in one package with files from another package unless you use the “–force” option by default. If you do that, you probably have more serious problems than file conflicts.

### How to use AUR?

The simplest way to use AUR is through a AUR helper. An [AUR helper][8] is a command line tool (some has GUI as well) that lets you search for packages published on the AUR and install them.

##### Installing an AUR helper on Arch Linux

Let’s say you want to use [Yay AUR helper][9]. Make sure that you have git installed on Linux. And then clone the repository, go to the directory and build the package.

Use these commands one by one for that:

```
sudo pacman -S git
sudo git clone https://aur.archlinux.org/yay-git.git
cd yay
makepkg -si
```

Once installed, you can use yay command like this to install a package:

```
yay -S package_name
```

It’s not that you must use AUR helper for installing packages from AUR. Expand the next section to see how to use AUR without AUR helper.

##### Installing AUR packages without AUR helpers

If you don’t want to use AUR helper, you can install packages from AUR on your own as well.

As soon as you find the package you want to install on [AUR page][10] it is advised to confirm “Licence”, “Popularity”, “Last Updated”, “Dependencies” and so on as an extra quality control step.

```
git clone [package URL]
cd [package name]
makepkg -si
```

For example. let’s say you want to install [telegram desktop package][11]:

```
git clone https://aur.archlinux.org/telegram-desktop-git.git
cd telegram-desktop-git
makepkg -si
```

#### Enabling AUR support in Manjaro Linux

AUR isn’t enabled by default and you have to enable it through pamac. My laptop runs [Manjaro][12] Cinnamon but the steps are same for all Manjaro flavors.

Open Pamac (listed as Add/Remove Software):

![][13]

Once you are in pamac go to preferences like shown below.

![][14]

In preferences dialog box go to AUR tab, enable the AUR support, enable check for updates and close the dialog box.

![][15]

You can now search for packages and those which belong to AUR can be identified by the tag under the package descriptions.

![][16]

I hope you find this article useful and keep an eye on social media for upcoming Arch related topics.

--------------------------------------------------------------------------------

via: https://itsfoss.com/aur-arch-linux/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://www.archlinux.org/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/what-is-aur.png?ssl=1
[3]: https://wiki.archlinux.org/index.php/PKGBUILD
[4]: https://wiki.archlinux.org/index.php/Makepkg
[5]: https://wiki.archlinux.org/index.php/Pacman#Additional_commands
[6]: https://wiki.archlinux.org/index.php/Community_repository
[7]: https://wiki.archlinux.org/index.php/Trusted_Users
[8]: https://itsfoss.com/best-aur-helpers/
[9]: https://github.com/Jguer/yay
[10]: https://aur.archlinux.org/
[11]: https://aur.archlinux.org/packages/telegram-desktop-git
[12]: https://manjaro.org/
[13]: https://i1.wp.com/i.imgur.com/kFF6HtW.png?ssl=1
[14]: https://i0.wp.com/i.imgur.com/47r963A.png?ssl=1
[15]: https://i1.wp.com/i.imgur.com/UThiDHO.png?ssl=1
[16]: https://i2.wp.com/i.imgur.com/RM5BKi2.png?ssl=1
