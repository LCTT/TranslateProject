[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Manjaro Linux Review: ‘Arch Linux for Human Beings’ Provides Rolling Release for Every User)
[#]: via: (https://itsfoss.com/manjaro-linux-review/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

Manjaro Linux Review: ‘Arch Linux for Human Beings’ Provides Rolling Release for Every User
======

[Manjaro 20.0 Lysia][1] has been released lately. In this article, I’ll take a look at the features of [Manjaro Linux][2] in general, discuss [why people like Manjaro][3] and compare the performance of Cinnamon desktop with Linux Mint 19.3 Cinnamon edition.

### Manjaro Linux: Why so popular?

![Image Source][4]

To every stereotype there is some element of truth. One of the main reasons that Manjaro is so popular has to do with its roots. Manjaro is based on Arch Linux and inherits many elements of [Arch Linux][5] but it is a very distinct project.

Unlike Arch Linux, almost everything is pre-configured in Manjaro. This makes it one of the most [user-friendly Arch-based distributions][6]. A lot of new users get attracted to this idea and I can’t blame them.

Will Manjaro then can be the new Ubuntu for a new comer? My answer is Yes!

[Ubuntu][7] and [Canonical][8] will always have my utmost respect as it has a huge success on making Linux easily accessible to newcomers.

Just as Ubuntu made “Linux for human beings”, Manjaro made “Arch Linux for human beings”.

But his doesn’t mean Manjaro is a [Linux distribution for beginners][9] only. Manjaro can be suitable for both and experienced users.

Let me go over some of the main features of Manjaro.

#### Easy installation

[Installing Arch Linux can be a nightmare][10] for many users. On the other hand, [installing Manjaro Linux][11] is easier thanks to the [Calamares][12] graphical installer.

![Manjaro Linux graphical installer][13]

If you want to take control in your own hands, you can use [Manjaro Architect][14]. It provides a terminal-based installer. It is still easier than installing directly through commands.

![][15]

#### Desktop environments and Window Managers of your choice

Officially Manjaro Linux supports [Xfce desktop][16] as the default choice. The Xfce in Manjaro looks good thanks to the customization. Manjaro also offers GNOME and KDE Plasma variants.

If that is not enough, Manjaro community maintains [Awesome][17], [Bspwm][18], [Budgie][19], [Cinnamon][20], [i3][21], LXDE, LXQt, [MATE][22] and [Openbox][23].

![Desktop flavors available via Manjaro Architect][24]

#### X86 architecture is not a limitation for Manjaro

You are not limited to [X86 architecture][25] with Manjaro as it is ARM architecture friendly.

Images for [PineBook Pro][26], [Raspberry Pi][27], [Rock Pi][28] 4, Rock Pro 64, [Khadas Vim][29] 1 &amp; 3 and [other single board computers][30] are available in Xfce and KDE Plasma flavors.

#### Rolling release but not rolling blindly

Manjaro is a stable bleeding edge rolling release and is claimed to be more tested than Arch Linux because it performs some [additional testing][31] before releasing the updates.

![][32]

#### **New** **hardware? One click and it’s done.**

Manjaro comes with a [hardware detection tool][33] known as MHWD. If you need drivers for your hardware, just open it, click on “Auto Install” and wait until it’s finished. That’s it.

![Manjaro hardware configuration GUI tool][34]

#### **Ease to switch Linux kernels.**

Power-users and people who need special features of the [Linux Kernel][35] that don’t come with the default one, can just switch to a different Kernel with one click.

  * **RT-Kernel** (Real Time) is suitable for a multimedia user and for applications real time features.
  * **LTS kernel** is the way to go if stability your priority.
  * **Latest kernel** has the latest features and supports the latest hardware. Did you get a recently introduced to the market graphics card? The newest kernel is for you.



![Manjaro kernel GUI switch][36]

Manjaro supports multiple installed Kernels at the same time. Just re-boot your system and make your selection in the boot menu.

#### Access to the massive Arch User Repository (AUR)

What doesn’t work so well with Ubuntu-based distributions is managing [Personal Package Archives (PPAs)][37]. A PPA is a repository for a single or several applications, usually from an independent developer.

Managing PPAs can become troublesome. They should be purged as they can become abandoned and orphaned without notice. You need to reinstate them if you reinstall Ubuntu.

If you use Manjaro, you also have access to the [Arch User Repository][38] (AUR). The [AUR is probably the largest repository][39] catering for any distribution. It’s certainly stocked with the freshest produce.

#### Snap and Flatpack support in the Pamac software manager

![Snap applications in Pamac][40]

Pamac 9.4 series has enabled Snap and Flatpak support by default. You can now install snaps or flatpaks with Pamac in GUI or terminal and access an even [larger selection of the Linux applications][41].

#### Global set of mirrors

No-matter your location Manjaro has a [great number of servers][42] which is known as mirrors and you can choose the closest available.

Top tip!

If you are a frequent traveler all you have to do is to open the terminal and run the following command:

sudo pacman-mirrors –geoip &amp;&amp; sudo pacman -Syyu

This simple command will ping a list of mirrors for your country only, rating each one and reordering the list so the faster mirrors are at the top. Don’t forget to run the command once you get back home!

#### ZFS filesystem support

As mentioned previously, command line interface installer is called Manjaro Architect and if you are an experienced user there is a [guide to follow][14]. You can use [ZFS filesystem][43] as root in Manjaro 20.0 Lysia Architect.

### Performance comparison of Manjaro 19 Cinnamon with Linux Mint 19.3 Cinnamon

I am not an expert on performance comparison and other low-level stuff. So, please forgive me if you dislike this comparison.

Manjaro feels snappier than Ubuntu and its derivatives. So, what can explain the speed benefits?
A possible explanation could be the RAM and active tasks usage on idle.

Here are the stats for idle Manjaro Cinnamon. The idle memory usage is 577 MB.

![htop running on Manjaro 19.0.2 – Cinnamon 4.4.8][44]

Here are the stats for an idle Linux Mint Cinnamon. The idle memory usage is 656 MB.

![htop running on Linux Mint 19.3 – Cinnamon 4.4.8][45]

By running the below command you can [check the running services in Linux][46]:

```
systemctl list-unit-files --state=enabled --no-pager
```

The results on Manjaro:

![Manjaro running services][47]

The results on Linux Mint:

![Linux Mint running services][48]

Each of these services consume system resources, and more specifically system memory and kernel time.

#### Conclusion

Manjaro takes most of the risk out of the rolling model by delaying the release of new applications and features for several weeks. The rolling distribution, out-of-the-box Arch experience will win you over.

  * No-hassle experience
  * Kernel management
  * Superior packaging system
  * Excellent hardware detection
  * Fast &amp; responsive



Let me know your thoughts on Manjaro on the comments below and don’t forget to [subscribe to our weekly Linux newsletter][49].

--------------------------------------------------------------------------------

via: https://itsfoss.com/manjaro-linux-review/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/manjaro-20-release/
[2]: https://manjaro.org/
[3]: https://itsfoss.com/why-use-manjaro-linux/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/manjaro_wallpaper.jpg?ssl=1
[5]: https://www.archlinux.org/
[6]: https://itsfoss.com/arch-based-linux-distros/
[7]: https://ubuntu.com/
[8]: https://canonical.com/
[9]: https://itsfoss.com/best-linux-beginners/
[10]: https://itsfoss.com/install-arch-linux/
[11]: https://itsfoss.com/install-manjaro-linux/
[12]: https://calamares.io/
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/manjaro_install_installer_partition-1.png?resize=800%2C499&ssl=1
[14]: https://itsfoss.com/manjaro-architect-review/
[15]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2017/06/manjaro-architect-main.png?ssl=1
[16]: https://www.xfce.org/
[17]: https://awesomewm.org/
[18]: https://github.com/baskerville/bspwm
[19]: https://github.com/solus-project/budgie-desktop
[20]: https://github.com/linuxmint/Cinnamon
[21]: https://i3wm.org/
[22]: https://mate-desktop.org/
[23]: http://openbox.org/wiki/Main_Page
[24]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2017/06/manjaro-architect-de.png?ssl=1
[25]: https://www.computerhope.com/jargon/x/x86.htm
[26]: https://itsfoss.com/pinebook-pro/
[27]: https://itsfoss.com/raspberrypi/
[28]: https://rockpi.org/
[29]: https://itsfoss.com/vim3l/
[30]: https://itsfoss.com/raspberry-pi-alternatives/
[31]: https://manjaro.org/features/fresh-and-stable/
[32]: https://i1.wp.com/manjaro.org/img/features/repositories.png?ssl=1
[33]: https://wiki.manjaro.org/index.php?title=Manjaro_Hardware_Detection
[34]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/hardware-detection.png?ssl=1
[35]: https://itsfoss.com/find-which-kernel-version-is-running-in-ubuntu/
[36]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/Manjaro-kernel-switch.png?ssl=1
[37]: https://itsfoss.com/ppa-guide/
[38]: https://aur.archlinux.org/
[39]: https://itsfoss.com/aur-arch-linux/
[40]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/snap-app-pacman.jpg?resize=800%2C489&ssl=1
[41]: https://itsfoss.com/essential-linux-applications/
[42]: https://wiki.manjaro.org/Pacman-mirrors#Purpose
[43]: https://itsfoss.com/what-is-zfs/
[44]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/htop_manjaro_cinnamon.jpg?ssl=1
[45]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/htop_mint.png?ssl=1
[46]: https://itsfoss.com/start-stop-restart-services-linux/
[47]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/Manjaro-cropped.png?ssl=1
[48]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/Mint-cropped.png?ssl=1
[49]: https://itsfoss.com/subscribe-to-newsletter/
