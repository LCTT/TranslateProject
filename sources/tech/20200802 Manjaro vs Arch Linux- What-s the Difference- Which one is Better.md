[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Manjaro vs Arch Linux: What’s the Difference? Which one is Better?)
[#]: via: (https://itsfoss.com/manjaro-vs-arch-linux/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

Manjaro vs Arch Linux: What’s the Difference? Which one is Better?
======

_**Manjaro or Arch Linux? If Manjaro is based on Arch, how come is it different from Arch? Read how Arch and Manjaro are different in this comparison article.**_

Most of the [beginner-friendly Linux distributions][1] are based on Ubuntu. As Linux users gains more experience, some try their hands on the more ‘advanced distributions’, mostly in the ‘Arch domain’.

This Arch domain dominated by two distributions: [Arch Linux][2] itself and [Manjaro][3]. There are other [Arch-based Linux distributions][4] but none are as popular as these two.

If you are confused between Arch and Manjaro then this comparison should help you out.

### Manjaro and Arch Linux: How different or similar are they?

![][5]

I have tried to compare these two distributions on various points. Please keep in mind that I have not exclusively focused on the differences. I have also pointed out where they are similar.

#### Both are rolling release distributions but not of the same kind

There are no “releases” every few months or years in Arch and Manjaro like Ubuntu or Fedora. Just [keep your Arch or Manjaro system updated][6] and you’ll always have the latest version of the operating system and the software packages. You don’t need to worry about upgrading your installed version like ever.

If you are planning to do a fresh install at some point, keep in mind that both Manjaro and Arch update the installation ISO regularly. It is called ISO refresh and it ensures that newly installed systems don’t have to install all the new system updates made available in last few months.

But there is a difference between the rolling release model of Arch and Manjaro.

Manjaro maintains its own independent repositories except for the community-maintained Arch User Repository (AUR). These repositories also contain software packages not provided by Arch. Popular software packages initially provided by the official Arch repositories will first be thoroughly tested (and if necessary, patched), prior to being released, usually about two weeks behind Arch, to Manjaro’s own Stable Repositories for public use.

![][7]

A consequence of accommodating this testing process is that Manjaro will never be quite as bleeding-edge as Arch. But then, it makes Manjaro slightly more stable than Arch and less susceptible to breaking your system.

#### Package Management – Pacman and Pamac

Both Arch and Manjaro ship with command-line based package management tool called Pacman which was coded in C and uses tar to package applications. In other words, you can [use the same pacman commands][8] for managing packages in both distributions.

In addition to the Pacman, Manjaro has also developed a GUI application called Pamac for easily installing software on Manjaro. This makes using Manjaro easier than Arch.

![Pamac GUI Package Manager by Manjaro][9]

Do note that you may also install Pamac from AUR in Arch Linux but the tool is integral part of Manjaro.

#### Manjaro Hardware Detection Tool (MHWD)

Pamac is not the only GUI tool developed by Manjaro team to help its users. Manjaro also has a dedicated tool for detecting hardware and suggest drivers for them.

![Manjaro hardware configuration GUI tool][10]

This hardware detection tool is so useful that it can be one of the [main reasons why Manjaro is loved by the community][11]. It is insanely easy to detect/install/use or switch from one driver to another and makes the hardware compatibility an issue from the past.

#### Drivers support

Manjaro offers great support for GPU drivers. As we all know for many years Linux has issues installing drivers (Specially Nvidia).

While [installing Manjaro][12] it gives options to start with open source (free) or non-open source (non-free) graphics driver installation. When you choose “non-free” it automatically detects your graphics card and install the most appropriate driver for it and hence GPU works out of the box.

Installing graphics driver is easier even after installing Manjaro thanks to the hardware detection tool you saw in the previous section.

And if you have a system with Nvidia Optimus card (Hybrid GPU) it works fine with Manjaro. You will get plenty of options of get it working.

In Arch Linux, you have to install (if you could find) the appropriate drivers for your machine.

#### Access to the Arch User Repository (AUR)

[Arch User Repository][13] (AUR) is a community-driven repository for Arch-based Linux distributions users. The AUR was created to organize and share new packages from the community and to help accelerate popular packages’ inclusion into the [community repository][14].

A good number of new packages that enter the official repositories start in the AUR. In the AUR, users are able to contribute their own package builds (PKGBUILD and related files).

You can use AUR in both Arch and Manjaro.

#### Desktop environments

Alright! You can use virtually any desktop environments on any Linux distribution. Arch and Manjaro are no exceptions.

However, a dedicated desktop flavor or version makes it easier for users to have a seamless experience of the said desktop environments.

The default Arch ISO doesn’t include any desktop environment. For example, you want to [install KDE on Arch Linux][15], you will have to either download and install it while [installing Arch Linux][16] or after that.

Manjaro, on the other hand, provides different ISO for desktop environments like Xfce, KDE and GNOME. Manjaro community also maintains ISO for MATE, Cinnamon, LXDE, LXQt, OpenBox and more.

#### Installation procedure

![Arch Live Boot][17]

Manjaro is based on Arch Linux and it is Arch compatible, but **it is not Arch**. It’s not even a pre-configured version of Arch with just a graphical installer. Arch doesn’t come with the usual comfort out of the box, which is why most people prefer something easier. Manjaro offers you the easy entry, but supports you on your way to becoming an experienced user or power user.

#### Documentation and support

Both Arch and Manjaro have their own wiki pages and support forums to help their respective users.

While Manjaro has a decent [wiki][18] for documentation, the [Arch wiki][19] is in a different league altogether. You can find detailed information on every aspect of Arch Linux in the Arch wiki.

#### Targeted audience

The key difference is that [Arch is aimed to users with a do-it-yourself attitude][20] who are willing to read the documentation, and solve their own problems.

On the other hand Manjaro is targeted at Linux users who are not that experienced or who don’t want to spend time assembling the operating system.

### Conclusion

Some people often say that Manjaro is for those who can’t install Arch. But I think that’s not true. Not everyone wants to configure Arch from scratch or doesn’t have much time.

Manjaro is definitely a beast, but a very different kind of beast than Arch. **Fast, powerful, and always up to date**, Manjaro provides all the benefits of an Arch operating system, but with an especial emphasis on **stability, user-friendliness and accessibility** for newcomers and experienced users.

Manjaro doesn’t take its minimalism as far as Arch Linux does. With Arch, you start with a blank canvas and adjust each setting manually. When the default Arch installation completes, you have a running Linux instance at the command line. Want a [graphical desktop environment][21]? Go right ahead—there’s plenty to choose from. Pick one, install, and configure it. You learn so much doing that especially if you are new to Linux. You get a superb understanding of how the system goes together and why things are installed they way are.

I hope you have a better understanding of Arch and Manjaro now. You understand how they are similar and yet different.

_**I have voiced my opinion. Don’t hesitate to share yours in the comment section. Between Arch and Manjaro, which one do you prefer and why.**_

_With additional inputs from Abhishek Prakash._

--------------------------------------------------------------------------------

via: https://itsfoss.com/manjaro-vs-arch-linux/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-linux-beginners/
[2]: https://www.archlinux.org/
[3]: https://manjaro.org/
[4]: https://itsfoss.com/arch-based-linux-distros/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/arch-vs-manjaro.png?ssl=1
[6]: https://itsfoss.com/update-arch-linux/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/repositories.png?ssl=1
[8]: https://itsfoss.com/pacman-command/
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/Pamac.png?resize=800%2C534&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/hardware-detection.png?ssl=1
[11]: https://itsfoss.com/why-use-manjaro-linux/
[12]: https://itsfoss.com/install-manjaro-linux/
[13]: https://itsfoss.com/aur-arch-linux/
[14]: https://wiki.archlinux.org/index.php/Community_repository
[15]: https://itsfoss.com/install-kde-arch-linux/
[16]: https://itsfoss.com/install-arch-linux/
[17]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/Arch-live-boot.jpg?ssl=1
[18]: https://wiki.manjaro.org/index.php?title=Main_Page
[19]: https://wiki.archlinux.org/
[20]: https://itsfoss.com/why-arch-linux/
[21]: https://itsfoss.com/best-linux-desktop-environments/
