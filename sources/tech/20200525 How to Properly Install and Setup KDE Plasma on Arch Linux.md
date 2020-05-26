[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Properly Install and Setup KDE Plasma on Arch Linux)
[#]: via: (https://itsfoss.com/install-kde-arch-linux/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

How to Properly Install and Setup KDE Plasma on Arch Linux
======

I believe you followed the [fantastic It’s FOSS guide on installing Arch Linux][1]. The guide ends with steps mentioning the installation procedure for [GNOME desktop][2].

Now, not everyone is a GNOME fan and several readers requested that we show them how to configure the [KDE desktop][3] on [Arch Linux][4].

And thus I created this guide to demonstrate the steps for properly installing and configuring KDE desktop (also known as KDE Plasma desktop) on Arch Linux.

### How to install and setup KDE desktop environment on Arch Linux

![][5]

Please keep in mind that KDE doesn’t allow login as root directly. If you have installed Arch Linux and using it as root, you should create a new user and give it sudo rights for running commands as root.

If you just have a bare minimum installation of Arch Linux, you probably are logging into a TTY terminal. If you are using some other desktop environment, steps remain the same.

Let’s go!

#### Step 1: Create a sudo user (if you have only root user)

You can use the [useradd command][6] for creating a new user. I am creating user named dimitrios (that’s my name). You can use something that matches your name.

The option -m creates a home directory for the newly created user.

```
useradd -m dimitrios
```

You should also set a password for this user. Use this command:

```
passwd dimitrios
```

Now that you have created the user, give it sudo access. First, install sudo and a [command line text editor][7] like [nano][8]:

```
pacman -S sudo nano
```

The configuration file for sudo is /etc/sudoers. It should always be edited with the visudo command. visudo locks the sudoers file, saves edits to a temporary file, and checks that file’s grammar before copying it to /etc/sudoers.

To use nano as the visudo editor, use:

```
EDITOR=nano visudo
```

Add the following line like I do in the example, then save and exit.

```
dimitrios ALL=(ALL) ALL
```

![Adding Sudoer in Arch Linux][9]

Save your changes and exit the editor. You now have a sudo user on Arch Linux.

#### Step 2: Installing KDE Plasma desktop

To run KDE desktop, you need the following packages:

  * [Xorg][10] group
  * [KDE Plasma][3] Desktop Environment
  * [Wayland][11] session for KDE Plasma
  * [KDE applications][12] group (consists of KDE specific applications including the Dolphin manager and other useful apps)



You can install of the above using the following command:

```
pacman -S xorg plasma plasma-wayland-session kde-applications
```

Once installed, enable the Display Manager and Network Manager services:

```
systemctl enable sddm.service
systemctl enable NetworkManager.service
```

Almost there. Shutdown your system:

```
shutdown now
```

Power on your system and you should see the KDE login. Do you remember the password you set up for your sudo user? Use it to login.

![Arch KDE Plasma Desktop][13]

#### What next?

You may want to explore the [essential pacman commands][14], to know what’s going on with the [Arch User Repository][15] and learn more about [AUR helpers][16].

I hope you found this tutorial helpful in installing KDE desktop on Arch Linux. Please let us know in the comments below, if you encountered any obstacle or difficulty during the installation.

What’s your favourite Desktop environment or Window Manager? Let us know and don’t forget to subscribe on our social media.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-kde-arch-linux/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-arch-linux/
[2]: https://www.gnome.org/
[3]: https://kde.org/plasma-desktop
[4]: https://www.archlinux.org/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/install-kde-arch-linux.png?ssl=1
[6]: https://linuxhandbook.com/useradd-command/
[7]: https://itsfoss.com/command-line-text-editors-linux/
[8]: https://www.nano-editor.org/
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/adding-sudoer-arch-linux.png?ssl=1
[10]: https://wiki.archlinux.org/index.php/Xorg
[11]: https://wiki.archlinux.org/index.php/Wayland
[12]: https://www.archlinux.org/groups/x86_64/kde-applications/
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/Arch-Plasma-desktop.jpg?fit=800%2C450&ssl=1
[14]: https://itsfoss.com/pacman-command/
[15]: https://itsfoss.com/aur-arch-linux/
[16]: https://itsfoss.com/best-aur-helpers/
