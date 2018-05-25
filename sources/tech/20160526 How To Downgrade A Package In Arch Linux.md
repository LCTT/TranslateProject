How To Downgrade A Package In Arch Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2016/05/Arch-Linux-720x340.jpg)
As you might know, Arch Linux is a rolling release and DIY (do-it-yourself) distribution. So you have to be bit careful while updating it often, especially installing or updating packages from the third party repositories like AUR. You might be end up with broken system if you don’t know what you are doing. It is your responsibility to make Arch Linux more stable. However, we all do mistakes. It is difficult to be careful all time. Sometimes, you want to update to most bleeding edge, and you might be stuck with broken packages. Don’t panic! In such cases, you can simply rollback to the old stable packages. This short tutorial describes how to downgrade a package in Arch Linux and its variants like Antergos, Manjaro Linux.

### Downgrade a package in Arch Linux

In Arch Linux, there is an utility called** “downgrade”** that helps you to downgrade an installed package to any available older version. This utility will check your local cache and the remote servers (Arch Linux repositories) for the old versions of a required package. You can pick any one of the old stable package from that list and install it.

This package is not available in the official repositories. You need to add the unofficial **archlinuxfr** repository.

To do so, edit **/etc/pacman.conf** file:
```
$ sudo nano /etc/pacman.conf

```

Add the following lines:
```
[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch

```

Save and close the file.

Update the repositories with command:
```
$ sudo pacman -Sy

```

Then install “Downgrade” utility using the following command from your Terminal:
```
$ sudo pacman -S downgrade

```

**Sample output:**
```
resolving dependencies...
 looking for conflicting packages...

Packages (1) downgrade-5.2.3-1

Total Download Size: 0.01 MiB
 Total Installed Size: 0.10 MiB

:: Proceed with installation? [Y/n]

```

The typical usage of “downgrade” command is:
```
$ sudo downgrade [PACKAGE, ...] [-- [PACMAN OPTIONS]]

```

Let us say you want to downgrade **opera web browser** to any available old version.

To do so, run:
```
$ sudo downgrade opera

```

This command will list all available versions of opera package (both new and old) from your local cache and remote mirror.

**Sample output:**
```
Available packages:

 1) opera-37.0.2178.43-1-x86_64.pkg.tar.xz (local)
 2) opera-37.0.2178.43-1-x86_64.pkg.tar.xz (remote)
 3) opera-37.0.2178.32-1-x86_64.pkg.tar.xz (remote)
 4) opera-36.0.2130.65-2-x86_64.pkg.tar.xz (remote)
 5) opera-36.0.2130.65-1-x86_64.pkg.tar.xz (remote)
 6) opera-36.0.2130.46-2-x86_64.pkg.tar.xz (remote)
 7) opera-36.0.2130.46-1-x86_64.pkg.tar.xz (remote)
 8) opera-36.0.2130.32-2-x86_64.pkg.tar.xz (remote)
 9) opera-36.0.2130.32-1-x86_64.pkg.tar.xz (remote)
 10) opera-35.0.2066.92-1-x86_64.pkg.tar.xz (remote)
 11) opera-35.0.2066.82-1-x86_64.pkg.tar.xz (remote)
 12) opera-35.0.2066.68-1-x86_64.pkg.tar.xz (remote)
 13) opera-35.0.2066.37-2-x86_64.pkg.tar.xz (remote)
 14) opera-34.0.2036.50-1-x86_64.pkg.tar.xz (remote)
 15) opera-34.0.2036.47-1-x86_64.pkg.tar.xz (remote)
 16) opera-34.0.2036.25-1-x86_64.pkg.tar.xz (remote)
 17) opera-33.0.1990.115-2-x86_64.pkg.tar.xz (remote)
 18) opera-33.0.1990.115-1-x86_64.pkg.tar.xz (remote)
 19) opera-33.0.1990.58-1-x86_64.pkg.tar.xz (remote)
 20) opera-32.0.1948.69-1-x86_64.pkg.tar.xz (remote)
 21) opera-32.0.1948.25-1-x86_64.pkg.tar.xz (remote)
 22) opera-31.0.1889.174-1-x86_64.pkg.tar.xz (remote)
 23) opera-31.0.1889.99-1-x86_64.pkg.tar.xz (remote)
 24) opera-30.0.1835.125-1-x86_64.pkg.tar.xz (remote)
 25) opera-30.0.1835.88-1-x86_64.pkg.tar.xz (remote)
 26) opera-30.0.1835.59-1-x86_64.pkg.tar.xz (remote)
 27) opera-30.0.1835.52-1-x86_64.pkg.tar.xz (remote)
 28) opera-29.0.1795.60-1-x86_64.pkg.tar.xz (remote)
 29) opera-29.0.1795.47-1-x86_64.pkg.tar.xz (remote)
 30) opera-28.0.1750.51-1-x86_64.pkg.tar.xz (remote)
 31) opera-28.0.1750.48-1-x86_64.pkg.tar.xz (remote)
 32) opera-28.0.1750.40-1-x86_64.pkg.tar.xz (remote)
 33) opera-27.0.1689.76-1-x86_64.pkg.tar.xz (remote)
 34) opera-27.0.1689.69-1-x86_64.pkg.tar.xz (remote)
 35) opera-27.0.1689.66-1-x86_64.pkg.tar.xz (remote)
 36) opera-27.0.1689.54-2-x86_64.pkg.tar.xz (remote)
 37) opera-27.0.1689.54-1-x86_64.pkg.tar.xz (remote)
 38) opera-26.0.1656.60-1-x86_64.pkg.tar.xz (remote)
 39) opera-26.0.1656.32-1-x86_64.pkg.tar.xz (remote)
 40) opera-12.16.1860-2-x86_64.pkg.tar.xz (remote)
 41) opera-12.16.1860-1-x86_64.pkg.tar.xz (remote)

select a package by number:

```

Just type the package number of your choice, and hit enter to install it.

That’s it. The current installed package will be downgraded to the old version.

**Also Read:[How To Downgrade All Packages To A Specific Date In Arch Linux][1]**

##### So, how can avoid broken packages and make Arch Linux more stable?

Check [**Arch Linux news**][2] and [**forums**][3] before updating Arch Linux to find out if there have been any reported problem. I have been using Arch Linux as my main OS for the past few weeks. Here is some simple tips that I have found over a period of time to avoid installing unstable packages in Arch Linux.

  1. Avoid partial upgrades. It means that never run “pacman -Sy <package-name>”. This command will partially upgrade your system while installing a package. Instead, first use “pacman -Syu” to update the system and then use “package -S <package-name>” to a install package.
  2. Avoid using “pacman -Syu –force” command. The –force flag will ignore the package and file conflicts and you might end-up with broken packages or broken system.
  3. Do not skip dependency check. It means that do not use “pacman -Rdd <package-name>”. This command will avoid dependency check while removing a package. If you run this command, a critical dependency which is needed by another important package could be removed too. Eventually, it will break your Arch Linux.
  4. It is always a good practice to make regular backup of important data and configuration files to avoid any data loss.
  5. Be careful while installing packages from third party and unofficial repositories like AUR. And do not install packages that are in heavy development.



For more details, check the [**Arch Linux maintenance guide**][4].

I am not an Arch Linux expert, and I am still learning to make it more stable. Please feel free to let me know If you have any tips to make Arch Linux stable and safe in the comment section below. I am all ears.

Hope this helps. That’s all for now. I will be here again with another interesting article soon. Until then, stay tuned with OSTechNix.

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/downgrade-package-arch-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/downgrade-packages-specific-date-arch-linux/
[2]:https://www.archlinux.org/news/
[3]:https://bbs.archlinux.org/
[4]:https://wiki.archlinux.org/index.php/System_maintenance
