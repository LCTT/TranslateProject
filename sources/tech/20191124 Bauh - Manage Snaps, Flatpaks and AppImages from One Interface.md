[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Bauh – Manage Snaps, Flatpaks and AppImages from One Interface)
[#]: via: (https://itsfoss.com/bauh-package-manager/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

Bauh – Manage Snaps, Flatpaks and AppImages from One Interface
======

One of the biggest problems with universal packages like [Snap][1], [Flatpak][2] and [AppImage][3] is managing them. Most built-in package managers do not support all of these new formats.

Thankfully, I stumbled across an application that supports several universal package formats.

### Bauh – a Manager for Your Multi-Package Needs

Originally named fpakman, [bauh][4] is designed to handle Flatpak, Snap, [AppImage][5], and [AUR][6] packages. Creator [vinifmor][7] started the project in June’19 with the [intention][8] of “giving a graphical interface to manage Flatpaks for Manjaro users.” Since then, he has expanded the application to add support for Debian-based systems.

![Bauh About][9]

When you first open bauh, it will scan your installed applications and check for updates. If there are any that need to be updated, they will be listed front and center. Once all the packages are updated, you will see a list of packages you have installed. You can deselect a package with updates to prevent it from being updated. You can also choose to install a previous version of the application.

![With Bauh you can manage various types of packages from one application][10]

You can also search for applications. Bauh has detailed information for both installed and searched packages. If you are not interested in one (or more) of the packaging types, you can deselect them in settings.

### Installing bauh on your Linux distribution

Let’s see how to install bauh.

#### Arch-based distributions

If you have a recent install of [Manjaro][11], you should be all set. Bauh comes installed by default. If you have an older install of Manjaro (like I do) or a different Arch-based distro, you can install it from the [AUR][12] by typing this in terminal:

```
sudo pacman -S bauh
```

![Bauh Package Info][13]

#### Debian/Ubuntu based distributions

If you have a Debianor Ubuntubased Linux distribution, you can install bauh with pip. First, make sure to [install pip on Ubuntu][14].

```
sudo apt install python3-pip
```

And then use it to install bauh:

```
pip3 install bauh
```

However, the creator recommends installing it [manually][15] to avoid messing up your system’s libraries.

To install bauh manually, you have to first download the [latest release][16]. Once you download it, you can [unzip using a graphical tool][17] or the [unzip command][18]. Next, open up the folder in your terminal. You will need to use the following steps to complete the install.

First, create a virtualenv in a folder called env:

```
python3 -m venv env
```

Now install the application code inside the env:

```
env/bin/pip install .
```

And launch the application:

```
env/bin/bauh
```

![Bauh Updating][19]

Once you finish installing bauh, you can [fine-tune][20] it by changing the environment setting and arguments.

### The road ahead for bauh

Bauh has grown quite a bit in a few short months. It plans to continue to grow. The current [road map][21] includes:

  * Support for other packaging technologies
  * Separate modules for each packaging technology
  * Memory and performance improvements
  * Improve the user experience



![Bauh Search][22]

### Final thoughts

When I tried out bauh, I ran into a couple of issues. When I opened it up for the first time, it told me that Snap was not installed and that I would have to install it if I wanted to use Snaps. I know that Snap is installed because I ran `snap list` in the terminal and it worked. I restarted the system and snaps worked.

The other issue I ran into was that one of my AUR packages failed to update. I was able to update the package without any issue with `yay`. There might be an issue with my install of Manjaro, I’ve had it going for 3 or 4 years.

Overall, bauh worked. It did what was printed on the tin. I can’t ask for more than that.

Have you ever used bauh? What is your favorite tool to manage different package formats if there is one? Let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][23].

--------------------------------------------------------------------------------

via: https://itsfoss.com/bauh-package-manager/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://snapcraft.io/
[2]: https://flatpak.org/
[3]: https://appimage.org/
[4]: https://github.com/vinifmor/bauh
[5]: https://itsfoss.com/use-appimage-linux/
[6]: https://itsfoss.com/best-aur-helpers/
[7]: https://github.com/vinifmor
[8]: https://forum.manjaro.org/t/bauh-formerly-known-as-fpakman-a-gui-for-flatpak-and-snap-management/96180
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/11/bauh-about.jpg?ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/11/bauh.jpg?ssl=1
[11]: https://manjaro.org/
[12]: https://aur.archlinux.org/packages/bauh
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/11/bauh-package-info.jpg?ssl=1
[14]: https://itsfoss.com/install-pip-ubuntu/
[15]: https://github.com/vinifmor/bauh#manual-installation
[16]: https://github.com/vinifmor/bauh/releases
[17]: https://itsfoss.com/unzip-linux/
[18]: https://linuxhandbook.com/unzip-command/
[19]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/11/bauh-updating.jpg?ssl=1
[20]: https://github.com/vinifmor/bauh#general-settings
[21]: https://github.com/vinifmor/bauh#roadmap
[22]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/11/bauh-search.png?resize=800%2C319&ssl=1
[23]: https://reddit.com/r/linuxusersgroup
