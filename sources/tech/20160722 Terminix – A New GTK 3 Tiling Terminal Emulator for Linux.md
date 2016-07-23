Terminix – A New GTK 3 Tiling Terminal Emulator for Linux
============================================================

There are [multiple terminal emulators][1] you can find on the Linux platform today, with each of them offering users some remarkable features.

But sometimes, we find it difficult to choose which terminal emulator to work with, depending on our preferences. In this overview, we shall cover one exciting terminal emulator for Linux called Terminix.

![](http://www.tecmint.com/wp-content/uploads/2016/07/Terminix-Terminal-Emulator-for-Linux.png)
>Terminix Terminal Emulator for Linux

Terminix is a tiling terminal emulator that uses VTE GTK+ 3 widget. It is developed using GTK 3 with aims of conforming to GNOME HIG (Human Interface Guidelines). Additionally, this application has been tested on GNOME and Unity desktops, although users have also tested it successfully on various other Linux desktops environments.

Just like the rest of Linux terminal emulators, Terminix comes with some illustrious features and these include:

- Enables users to layout terminals in any style by splitting them vertically or horizontally
- Supports drag and drop functionality to re-arrange terminals
- Supports detaching of terminals from windows using drag and drop
- Supports input synchronization between terminals, therefore commands typed in one terminal can be reproduced in another
- Terminal grouping can be saved and loaded from disk
- Supports transparent backgrounds
- Allows use of background images
- Supports automatic profile switches based on hostname and directory
- Also supports notification for out of view process completion
- Color schemes stored in files and new files can be created for custom color schemes

### How to Install Terminix on Linux Systems

Let us now uncover the steps you can follow to install Terminix on the various Linux distributions, but before we move any further, we have to list the various requirements for Terminix to work on Linux.

#### Dependencies

To work very well, the application requires the following libraries:

- GTK 3.14 and above
- GTK VTE 0.42 and above
- Dconf
- GSettings
- Nautilus-Python for Nautilus integration

If you have all the above requirements on your system, then proceed to install Terminix as follows.

#### On RHEL/CentOS 7 and Fedora 22-24

First, you need to add the package repository by creating a file `/etc/yum.repos.d/terminix.repo` using your favorite text editor as follows.

```
# vi /etc/yum.repos.d/terminix.repo
```

Then copy and paste the text below into the file above:

```
[heikoada-terminix]
name=Copr repo for terminix owned by heikoada
baseurl=https://copr-be.cloud.fedoraproject.org/results/heikoada/terminix/fedora-$releasever-$basearch/
skip_if_unavailable=True
gpgcheck=1
gpgkey=https://copr-be.cloud.fedoraproject.org/results/heikoada/terminix/pubkey.gpg
enabled=1
enabled_metadata=1
```

Save the file and exit.

Then update your system and install Terminix as shown:

```
---------------- On RHEL/CentOS 7 ---------------- 
# yum update
# yum install terminix

---------------- On Fedora 22-24 ---------------- 
# dnf update
# dnf install terminix
```

#### On Ubuntu 16.04-14.04 and Linux Mint 18-17

There is no official package for Debian/Ubuntu based distributions, but you can install it manually using the commands below:

```
$ wget -c https://github.com/gnunn1/terminix/releases/download/1.1.1/terminix.zip
$ sudo unzip terminix.zip -d / 
$ sudo glib-compile-schemas /usr/share/glib-2.0/schemas/
```

OpenSUSE users can install Terminix from the default repository and Arch Linux users can install the [AUR Terminix package][2].

### Terminix Screenshot Tour

![](http://www.tecmint.com/wp-content/uploads/2016/07/Terminix-Terminal.png)
>Terminix Terminal

![](http://www.tecmint.com/wp-content/uploads/2016/07/Terminix-Terminal-Settings.png)
>Terminix Terminal Settings

![](http://www.tecmint.com/wp-content/uploads/2016/07/Terminix-Terminal-Tabs.png)
>Terminix Multiple Terminal Tabs

### How to Uninstall or Remove Terminix

In case you installed it manually and want to remove it, then you can follow the steps below to uninstall it. Download the uninstall.sh from Github repository, make it executable and then run it:

```
$ wget -c https://github.com/gnunn1/terminix/blob/master/uninstall.sh
$ chmod +x uninstall.sh
$ sudo sh uninstall.sh
```

But if you installed it using a package manager, then you can use the package manager to uninstall it.

Visit the [Terminix Github][3] repository

In this overview, we have looked at an important Linux terminal emulator that is just an alternative to the multiple terminal emulators out there. Having installed it you can try out the different features and also compare it with the rest that you have probably used.

Importantly, for any questions or extra information that you have about Terminix, please use the comment section below and do not forget to also give us feedback about your experience with it.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/terminix-tiling-terminal-emulator-for-linux/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+tecmint+%28Tecmint%3A+Linux+Howto%27s+Guide%29

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
[1]: http://www.tecmint.com/linux-terminal-emulators/
[2]: https://aur.archlinux.org/packages/terminix
[3]: https://github.com/gnunn1/terminix
