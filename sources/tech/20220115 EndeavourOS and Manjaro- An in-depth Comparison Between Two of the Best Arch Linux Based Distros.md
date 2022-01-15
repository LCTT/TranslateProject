[#]: subject: "EndeavourOS and Manjaro: An in-depth Comparison Between Two of the Best Arch Linux Based Distros"
[#]: via: "https://itsfoss.com/endeavouros-vs-manjaro/"
[#]: author: "Pratham Patel https://itsfoss.com/author/pratham/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

EndeavourOS and Manjaro: An in-depth Comparison Between Two of the Best Arch Linux Based Distros
======

If you have ever tried using Arch Linux, you know it is almost impossible to install it without proper documentation and Linux knowledge. That’s the [charm of Arch Linux][1], actually.

But since Arch Linux lies on the expert end of the Linux distros spectrum, there exists several [Arch-based distributions that try to make things easier for the common folks][2].

Manjaro and EndeavourOS are two of the most popular choices when it comes to an ‘Arch-based Arch alternative’.

So let’s take a look at the differences between these two. Why should you choose one Linux distribution over another?

![][3]

### Desktop variants

Both of these distributions come in many flavours. Manjaro has three official flavors: Xfce, KDE and GNOME. There is also community editions for Budgie, Cinnamon, Deepin, Mate, Sway and i3.

Endeavour OS offers a lot more variants officially. Apart from what Manjaro has, it also has LXQT, BSPWM, Openbox and Qtile.

Since each flavour has a different [Desktop Environment][4] and their own DE-specific bundled apps. This ends up in not having a “strict” baseline of minimum of system requirements.

Here is a list of system requirement of RAM [as per EndeavourOS’ website][5] (this should be same for Manjaro as well) per Desktop Environment

  * Xfce – A minimum of 2GB of RAM, but 4GB is recommended
  * Mate – A minimum of 2GB of RAM, but 4GB is recommended
  * Cinnamon – A minimum of 4GB of RAM is necessary
  * Gnome – A minimum of 4GB of RAM is necessary (assume it is the same for KDE)
  * Budgie – A minimum of 4GB of RAM is necessary
  * Plasma – A minimum of 4GB of RAM is necessary
  * LXQT – A minimum of 2GB of RAM, but 4GB is recommended



### Getting the ISO

As I mentioned above, Manjaro and EndeavourOS are available in a wide variety of flavours. This means that I can not point you to a single ISO download link. But, for the intents and purpose of this article comparing the Operating Systems, I have gone with the default offering – the Xfce flavour ISO.

[Download Manjaro][6]

[Download EndeavourOS][7]

### Installing the OS

Both, EndeavourOS and Manjaro use the Calameres installer and give you a few useful options in their grub boot menus.

#### EndeavourOS installation

When you first boot EndeavourOS, it will present you with a GRUB menu with the following options

  * Boot using Intel/AMD drivers (**default option**)
  * Boot using the proprietary NVIDIA graphics driver
  * Run [Memtest86+][8] (RAM test)
  * Run [HDT][9] (Hardware Detection Tool)



Once EndeavourOS has booted, it’s welcome screen will provide you with some options.

The options are to manage partitions, installing community editions, updating mirrors and starting the installer.

![list of options on the EndeavourOS installer][10]

There are two options for installation

  * Online – Gives you the option to change your desktop environment to something other than Xfce
  * Offline – Gives you the Xfce desktop with the EndeavourOS theme



As previously mentioned, EndeavourOS uses the open source Calameres installer. But on top of that, it also offers you some options for better control over user experience and installation.

The available options provided by the EndeavourOS installer are listed below

  * [LTS Kernel][11] (_alongside_ the latest stable kernel)
  * XFCE4
  * KDE
  * GNOME
  * i3 WM
  * Mate Desktop Environment
  * Cinnamon Desktop Environment
  * Budgie Desktop Environment
  * LXQT
  * LXDE



The list of accessibility tools available in the EndeavourOS installer are as following

  * espeak-ng : open source text to speech synthesizer
  * mousetweaks : accessibility enhancements for pointing devices
  * orca : script-able screen reader



#### Manjaro installation

![][12]

With your first boot of Manjaro, you will see a GRUB menu with the following options

  * Boot using Intel/AMD driver (**default option**)
  * Boot using the proprietary NVIDIA graphics driver
  * Run a RAM test ([Memtest is no longer included and appears to be missing in UEFI mode][13])



Aside from the branding and OS-specific changes done by Manjaro devs to the Calameres installer, there isn’t much difference between the stock Calameres installer and what you get on Manjaro.

![][14]

Calameres is not the only installer for Manjaro

If you want a customized install on Manjaro, you can use the [Manjaro Architect][15] ISO for a fully custom CLI install.

**Keep in mind, at the time of writing this article, the Architect flavour of Manjaro [appears to be unmaintained][16] due to an un-resolved package conflict. Please help maintain the project if you have the necessary skills and time to spare** :)

Which can be a good or bad thing, based on who you ask.

In my opinion, if you are beginner starting out with your first Linux distribution as Manjaro, it is best that your options are limited.

This means less barrier of entry which would be caused by a list of alternative sound servers, display servers, display managers and/or window managers to choose from.

Once you get comfortable enough with Linux distributions to tinker with your system, you can spice things up as you like.

If you are looking to customize your installation, you will have to do that once your OS is installed.

### First boot

After you have installed Manjaro or EndeavourOS, you will get a welcome screen with a few options for someone who is new to Linux in general or new to Manjaro or EndeavourOS or Arch-based distributions.

The options available to you in EndeavourOS include things like updating mirrors, updating system, changing display manager (lightdm, gdm, lxdm and sddm), browsing AUR packages, installing packages like libreoffice, chromium, akm ([A Kernel Manager][17]) and more.

On the Manjaro side, the options you are presented with are what I would consider limited when compared to EndeavourOS, but I would put it as “adequately limited”.

It is just the right amount of things that you will need (as a beginner) to get started with Manjaro.

A few options available in Manjaro welcome screen are a link to the official Wiki, support forums, mailing list, getting involved with Manjaro development, installing and/or removing applications, etc.

The welcome screen on both, Manjaro and EndeavourOS also have the option for you to donate if you like the project and it’s direction, but do so only you have the money to do so.

### Software packaging

Lets face it, installation of OS is only one part of a Linux distribution.

The package manager and the way software is packaged plays a major role in how stable a Linux distribution feels.

If you are updating/installing a package, and it updates an already installed library – which other packages depend on, well… that is bad. It creates what is called “dependency hell”. A package manager should take care of this.

So how do Manjaro and EndeavourOS compare in this regard?

Well, since Manjaro and EndeavourOS are based on Arch Linux, they use the [pacman package manager][18] which Arch Linux uses. One of the many features of pacman is that it handles dependencies for you.

#### Manjaro

Even though Manjaro uses the pacman package manager, Manjaro has their own repositories.

Packages are taken from Arch Linux on a daily basis and “mirrored” in the Manjaro Unstable package repository and then pushed to Manjaro Testing for – you guessed it – Testing.

Once the packages are found to be stable, they’re pushed to the main repositories for everyone else to install.

Security updates though, are directly pushed to the public repositories through what Manjaro calls “Fast-Tracking” for faster resolution of issues.

![Manjaro testing Arch Linux packages for stability][19]

This method of testing packages ensures that there are no unexpected breaking of packages because “xyz” was changed.

But, this also means that users need to wait a few weeks (usually 2 to 4 weeks) for the newer version of their software to be available for install.

#### EndeavourOS

EndeavourOS does not have their own software repositories. They depend on the main Arch Linux repositories and doing so, you get the most “vanilla” experience if you use EndeavourOS.

If you were to install Arch Linux and EndeavourOS on the same machine, almost everything except the Desktop Environment or Window Manager and/or their themes and the install experience – should stay the same.

### Included packages

By now, you might be noticing a pattern in the differences between Manjaro and EndeavourOS.

#### EndeavourOS

EndeavourOS prioritizes to be closest to Arch Linux in terms of philosophy.

Have a custom installation? Check.

Install only the necessary packages for a complete desktop experience? Check.

Have the most bleeding edge packages in the distribution repositories? Check.

EndeavourOS gives you an opportunity of wanting to learn Arch without learning everything from EFI, driver-hunt and installation (looking at you nVidia), desktop environments/window managers, display managers, etc all at once.

It will set up everything at once and gives you the time to learn the inner working of Arch Linux yourself, at your own pace.

![obligatory neofetch screenshot of EndeavourOS][20]

#### Manjaro

Manjaro, on the other hand, it holds your hand (see what I did there?) the whole time you use it. It handles everything from the installation to the package stability along with giving you fairly instant access to security updates.

It is intended to be used a general purpose operating system for your computer.

It installs quite a few open source applications by default. That is extremely helpful for a new Linux user.

It has a few applications installed for you, like an audio player, GUI firewall (gufw), GIMP, HP Device Manager, e-mail client (thunderbird), video player (vlc), office suite (onlyoffice-desktopeditors).

![obligatory neoftech screenshot of Manjaro][21]

### What should I use?

Well, that is your call. I can only recommend one or either based on their use case and target audience.

If you are someone who considers yourself as a casual computer user who only needs an Office Suite ([LibreOffice][22], [ONLYOFFICE][23]), a media player and a web browser to do your stuff, I would recommend that you give Manjaro a try because of their own repo for [mostly] stable packages and a billow-free installation.

But, on the other hand, if you are someone who previously used a distribution like [Ubuntu][24], [Pop!_OS][25], [Linux Mint][26], [ElementaryOS][27], [Fedora][28], etc and now want to learn how to rice your Linux distro install from the WM to GRUB menu (yes, [ricing GRUB is a thing][29]). So, if you need a bare-bones Linux distribution like Arch to begin with, EndeavourOS is what I would present as my recommendation to you.

Now you too, can say: *tips fedora* I use Arch btw ( ͡° ͜ʖ ͡°)

--------------------------------------------------------------------------------

via: https://itsfoss.com/endeavouros-vs-manjaro/

作者：[Pratham Patel][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pratham/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/why-arch-linux/
[2]: https://itsfoss.com/arch-based-linux-distros/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/01/manjrao-vs-endeavouros.png?resize=800%2C450&ssl=1
[4]: https://itsfoss.com/what-is-desktop-environment/
[5]: https://endeavouros.com/
[6]: https://manjaro.org/download/
[7]: https://endeavouros.com/latest-release/
[8]: https://www.memtest.org/
[9]: https://wiki.syslinux.org/wiki/index.php?title=Hdt_(Hardware_Detection_Tool)
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/01_endeavour_options.webp?resize=800%2C434&ssl=1
[11]: https://itsfoss.com/linux-kernel-release-support/
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/03/manjaro_install_grub.png?resize=800%2C597&ssl=1
[13]: https://forum.manjaro.org/t/memory-test-no-longer-included-on-live-isos/62074/2
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/03/manjaro_install_welcome.png?resize=800%2C452&ssl=1
[15]: https://wiki.manjaro.org/index.php/Installation_with_Manjaro_Architect
[16]: https://forum.manjaro.org/t/maintainer-s-wanted/19502
[17]: https://discovery.endeavouros.com/endeavouros-tools/akm/2021/08/
[18]: https://archlinux.org/pacman/pacman.8.html
[19]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/04_manjaro_repos.webp?resize=569%2C439&ssl=1
[20]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/03_neofetch_endeavouros-1.webp?resize=800%2C434&ssl=1
[21]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/02_neofetch_manjaro-1.webp?resize=800%2C434&ssl=1
[22]: https://www.libreoffice.org/
[23]: https://www.onlyoffice.com/
[24]: https://ubuntu.com/
[25]: https://pop.system76.com/
[26]: https://linuxmint.com/
[27]: https://elementary.io/
[28]: https://getfedora.org/
[29]: https://www.reddit.com/r/unixporn/comments/m5522z/grub2_had_some_fun_with_grub/
