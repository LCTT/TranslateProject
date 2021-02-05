[#]: collector: (lujun9972)
[#]: translator: (Chao-zhi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting Started With Pacman Commands in Arch-based Linux Distributions)
[#]: via: (https://itsfoss.com/pacman-command/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

Getting Started With Pacman Commands in Arch-based Linux Distributions
======

_**Brief: This beginner’s guide shows you what you can do with pacmancommands in Linux, how to use them to find new packages, install and upgrade new packages, and clean your system.**_

The [pacman][1] package manager is one of the main difference between [Arch Linux][2] and other major distributions like Red Hat and Ubuntu/Debian. It combines a simple binary package format with an easy-to-use [build system][3]. The aim of pacman is to easily manage packages, either from the [official repositories][4] or the user’s own builds.

If you ever used Ubuntu or Debian-based distributions, you might have used the apt-get or apt commands. Pacman is the equivalent in Arch Linux. If you [just installed Arch Linux][5], one of the first few [things to do after installing Arch Linux][6] is to learn to use pacman commands.

In this beginner’s guide, I’ll explain some of the essential usage of the pacmand command that you should know for managing your Arch-based system.

### Essential pacman commands Arch Linux users should know

![][7]

Like other package managers, pacman can synchronize package lists with the software repositories to allow the user to download and install packages with a simple command by solving all required dependencies.

#### Install packages with pacman

You can install a single package or multiple packages using pacman command in this fashion:

```
pacman -S _package_name1_ _package_name2_ ...
```

![Installing a package][8]

The -S stands for synchronization. It means that pacman first synchronizes

The pacman database categorises the installed packages in two groups according to the reason why they were installed:

  * **explicitly-installed**: the packages that were installed by a generic pacman -S or -U command
  * **dependencies**: the packages that were implicitly installed because [required][9] by another package that was explicitly installed.



#### Remove an installed package

To remove a single package, leaving all of its dependencies installed:

```
pacman -R package_name_
```

![Removing a package][10]

To remove a package and its dependencies which are not required by any other installed package:

```
pacman -Rs _package_name_
```

To remove dependencies that are no longer needed. For example, the package which needed the dependencies was removed.

```
pacman -Qdtq | pacman -Rs -
```

#### Upgrading packages

Pacman provides an easy way to [update Arch Linux][11]. You can update all installed packages with just one command. This could take a while depending on how up-to-date the system is.

The following command synchronizes the repository databases _and_ updates the system’s packages, excluding “local” packages that are not in the configured repositories:

```
pacman -Syu
```

  * S stands for sync
  * y is for refresh (local
  * u is for system update



Basically it is saying that sync to central repository (master package database), refresh the local copy of the master package database and then perform the system update (by updating all packages that have a newer version available).

![System update][12]

Attention!

If you are an Arch Linux user before upgrading, it is advised to visit the [Arch Linux home page][2] to check the latest news for out-of-the-ordinary updates. If manual intervention is needed an appropriate news post will be made. Alternatively you can subscribe to the [RSS feed][13] or the [arch-announce mailing list][14].

Be also mindful to look over the appropriate [forum][15] before upgrading fundamental software (such as the kernel, xorg, systemd, or glibc), for any reported problems.

**Partial upgrades are unsupported** at a rolling release distribution such as Arch and Manjaro. That means when new library versions are pushed to the repositories, all the packages in the repositories need to be rebuilt against the libraries. For example, if two packages depend on the same library, upgrading only one package, might break the other package which depends on an older version of the library.

#### Use pacman to search for packages

Pacman queries the local package database with the -Q flag, the sync database with the -S flag and the files database with the -F flag.

Pacman can search for packages in the database, both in packages’ names and descriptions:

```
pacman -Ss _string1_ _string2_ ...
```

![Searching for a package][16]

To search for already installed packages:

```
pacman -Qs _string1_ _string2_ ...
```

To search for package file names in remote packages:

```
pacman -F _string1_ _string2_ ...
```

To view the dependency tree of a package:

```
pactree _package_naenter code hereme_
```

#### Cleaning the package cache

Pacman stores its downloaded packages in /var/cache/pacman/pkg/ and does not remove the old or uninstalled versions automatically. This has some advantages:

  1. It allows to [downgrade][17] a package without the need to retrieve the previous version through other sources.
  2. A package that has been uninstalled can easily be reinstalled directly from the cache folder.



However, it is necessary to clean up the cache periodically to prevent the folder to grow in size.

The [paccache(8)][18] script, provided within the [pacman-contrib][19] package, deletes all cached versions of installed and uninstalled packages, except for the most recent 3, by default:

```
paccache -r
```

![Clear cache][20]

To remove all the cached packages that are not currently installed, and the unused sync database, execute:

```
pacman -Sc
```

To remove all files from the cache, use the clean switch twice, this is the most aggressive approach and will leave nothing in the cache folder:

```
pacman -Scc
```

#### Installing local or third-party packages

Install a ‘local’ package that is not from a remote repository:

```
pacman -U _/path/to/package/package_name-version.pkg.tar.xz_
```

Install a ‘remote’ package, not contained in an official repository:

```
pacman -U http://www.example.com/repo/example.pkg.tar.xz
```

### Bonus: Troubleshooting common errors with pacman

Here are some common errors you may encounter while managing packages with pacman.

#### Failed to commit transaction (conflicting files)

If you see the following error:

```
error: could not prepare transaction
error: failed to commit transaction (conflicting files)
package: /path/to/file exists in filesystem
Errors occurred, no packages were upgraded.
```

This is happening because pacman has detected a file conflict and will not overwrite files for you.

A safe way to solve this is to first check if another package owns the file (pacman -Qo _/path/to/file_). If the file is owned by another package, file a bug report. If the file is not owned by another package, rename the file which ‘exists in filesystem’ and re-issue the update command. If all goes well, the file may then be removed.

Instead of manually renaming and later removing all the files that belong to the package in question, you may explicitly run _**pacman -S –overwrite glob package**_ to force pacman to overwrite files that match _glob_.

#### Failed to commit transaction (invalid or corrupted package)

Look for .part files (partially downloaded packages) in /var/cache/pacman/pkg/ and remove them. It is often caused by usage of a custom XferCommand in pacman.conf.

#### Failed to init transaction (unable to lock database)

When pacman is about to alter the package database, for example installing a package, it creates a lock file at /var/lib/pacman/db.lck. This prevents another instance of pacman from trying to alter the package database at the same time.

If pacman is interrupted while changing the database, this stale lock file can remain. If you are certain that no instances of pacman are running then delete the lock file.

Check if a process is holding the lock file:

```
lsof /var/lib/pacman/db.lck
```

If the above command doesn’t return anything, you can remove the lock file:

```
rm /var/lib/pacman/db.lck
```

If you find the PID of the process holding the lock file with lsof command output, kill it first and then remove the lock file.

I hope you like my humble effort in explaining the basic pacman commands. Please leave your comments below and don’t forget to subscribe on our social media. Stay safe!

--------------------------------------------------------------------------------

via: https://itsfoss.com/pacman-command/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[Chao-zhi](https://github.com/Chao-zhi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://www.archlinux.org/pacman/
[2]: https://www.archlinux.org/
[3]: https://wiki.archlinux.org/index.php/Arch_Build_System
[4]: https://wiki.archlinux.org/index.php/Official_repositories
[5]: https://itsfoss.com/install-arch-linux/
[6]: https://itsfoss.com/things-to-do-after-installing-arch-linux/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/essential-pacman-commands.jpg?ssl=1
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/sudo-pacman-S.png?ssl=1
[9]: https://wiki.archlinux.org/index.php/Dependency
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/sudo-pacman-R.png?ssl=1
[11]: https://itsfoss.com/update-arch-linux/
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/sudo-pacman-Syu.png?ssl=1
[13]: https://www.archlinux.org/feeds/news/
[14]: https://mailman.archlinux.org/mailman/listinfo/arch-announce/
[15]: https://bbs.archlinux.org/
[16]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/sudo-pacman-Ss.png?ssl=1
[17]: https://wiki.archlinux.org/index.php/Downgrade
[18]: https://jlk.fjfi.cvut.cz/arch/manpages/man/paccache.8
[19]: https://www.archlinux.org/packages/?name=pacman-contrib
[20]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/sudo-paccache-r.png?ssl=1
