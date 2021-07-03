[#]: subject: (Hash Linux: Arch Linux Preconfigured With Xmonad, Awesome, i3, and Bspwm Window Manager)
[#]: via: (https://itsfoss.com/hash-linux-review/)
[#]: author: (Sarvottam Kumar https://itsfoss.com/author/sarvottam/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Hash Linux: Arch Linux Preconfigured With Xmonad, Awesome, i3, and Bspwm Window Manager
======

With some effort, [you can install Arch Linux][1]. You may also install a desktop environment or windows manager of your choice on your Arch system.

That takes some time and effort but it is surely achievable. However, there exists projects that try to ease the pain by providing you a system preconfigured with a desktop environment or window manager of your choice. [ArcoLinux][2] is one such example.

Recently, I came across another project that has its sole focus on providing choice of window managers on top of the wonderful Arch distribution.

[Hash Project][3] offers four preconfigured Arch variants with tiling window managers: Awesome, [Xmonad][4], i3, and Bspwm.

If you’re a beginner window manager hopper, the Hash project is what you should definitely try at once. Without investing time to configure it first, you can explore the potential of window managers and get used to keyboard-driven systems.

In this article, I’ll discuss my part of the experience with the **Hash Linux Xmonad edition** featuring Linux kernel 5.12.

### Installation Of Hash Linux

The ISO image of all four editions of Hash Linux is available to [download][5] for x86_64 system architecture.

To avoid any unexpected error while installing it on a bare system, I created a virtual machine of Hash Linux Xmonad version in GNOME Boxes.

As I booted into Hash Linux, I noticed two things. First, a panel providing important shortcuts for managing windows and commands. I’ll discuss it later after installation. Second, a beautiful and easy-to-use GUI installer.

![Hash Linux GUI Installer][6]

As usual, the graphical installer made the installation process very smooth by providing buttons to click on. Within a few steps of configuration, Hash Linux was installed and ready to reboot.

![Installer Welcome Page][7]

### First Impression

![Hash Linux][8]

If you’ve ever installed Xmonad window manager on your Linux system, what is the first thing you saw after reboot? Blank screen right.

And if you’re a beginner or you don’t know the default key binding, you get stuck on the same screen. Hence, you must have to read keyboard shortcuts first before using any window manager.

What if you get all the important shortcuts right on your window? A cheat sheet can save you a lot of time.

Therefore, for the sake of simplicity and beginner-friendly, Hash Linux has pinned important keys on the desktop window.

So, let’s try some of it first. Starting with one of the most important `[Super]+Enter`, it opens the default termite terminal emulator with Z shell (ZSH).

If you click it multiple times, you notice that by default Xmonad follows a dwindle layout where it first fixes one window on the right side and then arranges the rest of all on the left side in the same manner.

![Xmonad default layout][9]

Using `[Super]+[Space]`, you can also change the current layout to a tabbed one. Even you can use `[Super]+[left+click]` to move a window into a float mode.

![Moved to float][10]

To quit the currently focussed window, you can press `[Super]+Q`.

### Applications In Hash Linux

By default, Hash Linux contains several useful command-line tools such as NeoFetch, Htop, Vim, Pacman, Git, and Speedtest-cli.

![Htop][11]

It also has a good amount of graphical applications such as Firefox 89, Gparted, Nitrogen, Conky, Flameshot, Geany, and CPU-X.

`[Super]+D` is the default key in Hash Linux to open application search menu.

![Application search menu][12]

### Theming

Hash Cyan is the default theme in Hash Linux. Besides it, Hash Linux provides four more themes: Light Orange, Sweet Purple, Night Red, and Arch Dark.

Hash Theme Selector is a home-baked Hash Linux application that you can use to configure the theme for a window manager.

![Hash Theme Selector][13]

### Upgrading Hash Linux

Being a rolling release distribution, you don’t need to download a new ISO of Hash Linux to update the existing system. The only thing you need to upgrade your system is to run `upgrade` command in a terminal.

![upgrading hash linux][14]

### Closing Thought

If you want to use a window manager instead of the desktop environment but do not want to spend a lot of time configuring it, Hash project saves the day.

First, it will save you a lot of time and effort for configuration, and second, it will easily make you comfortable in using a keyboard-driven system. Later, you can definitely learn to configure according to your own needs.

As Hash Linux already provides four ISO with the different window managers, you can start using any version and find your favorite one. Overall, it is a [good Arch-based Linux distribution][15].

At last, I would also like to mention that the current official [site][3] of Hash Linux does not contain much information about it.

![][16]

An earlier [site][17] (not accessible to me now) that also mentioned in the release info, contained information about it including configuration details when I checked last time.

Don’t want to go the Arch way just for tiling window manager? Try [Regolith Linux][18]. It is Ubuntu preconfigured with i3wm. Awesome, right?

--------------------------------------------------------------------------------

via: https://itsfoss.com/hash-linux-review/

作者：[Sarvottam Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sarvottam/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-arch-linux/
[2]: https://arcolinux.com/
[3]: https://hashproject.ga/
[4]: https://xmonad.org/
[5]: https://hashproject.ga/index.html#downloads
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/Hash-Linux-GUI-Installer.jpg?resize=800%2C451&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/06/Installer-Welcome-Page.png?resize=800%2C452&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/Hash-Linux.jpg?resize=800%2C451&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/Xmonad-default-layout.png?resize=800%2C452&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/Moved-to-float.png?resize=800%2C452&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/Htop.jpg?resize=800%2C451&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/Application-search-menu.jpg?resize=800%2C451&ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/Hash-Theme-Selector.png?resize=800%2C452&ssl=1
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/06/Upgrading-hash-linux.png?resize=800%2C452&ssl=1
[15]: https://itsfoss.com/arch-based-linux-distros/
[16]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/Hash-Linux-Site-URL.png?resize=575%2C193&ssl=1
[17]: https://hashproject.org/
[18]: https://itsfoss.com/regolith-linux-desktop/
