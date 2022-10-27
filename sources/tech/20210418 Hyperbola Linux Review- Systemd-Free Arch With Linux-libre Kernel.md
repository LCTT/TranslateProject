[#]: subject: (Hyperbola Linux Review: Systemd-Free Arch With Linux-libre Kernel)
[#]: via: (https://itsfoss.com/hyperbola-linux-review/)
[#]: author: (Sarvottam Kumar https://itsfoss.com/author/sarvottam/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Hyperbola Linux Review: Systemd-Free Arch With Linux-libre Kernel
======

In the last month of 2019, the Hyperbola project took a [major decision][1] of ditching Linux in favor of OpenBSD. We also had a [chat][2] with Hyperbola co-founder Andre Silva, who detailed the reason for dropping Hyperbola OS and starting a new HyperbolaBSD.

HyperbolaBSD is still under development and its alpha release will be ready by September 2021 for initial testing. The current Hyperbola GNU/Linux-libre v0.3.1 Milky Way will be supported until the legacy [Linux-libre kernel][3] reaches the end of life in 2022.

I thought of giving it a try before it goes away and switches to BSD completely.

### What is Hyperbola GNU/Linux-libre?

![][4]

Back in April 2017, the Hyperbola project was started by its [six co-founders][5] with an aim to deliver a lightweight, stable, secure, software freedom, and privacy focussed operating system. 

Subsequently, the first stable version of Hyperbola GNU/Linux-libre arrived in July 2017. It was based on Arch Linux snapshots combining Debian development.

But, unlike Arch having a rolling release model, Hyperbola GNU/Linux-libre follows a Long Term Support (LTS) model.

Also, instead of a generic Linux kernel, it includes GNU operating system components and the Linux-libre kernel. Most importantly, Hyperbola is also one of the distributions without Systemd init system.

Even though the Systemd is widely adopted by major Linux distributions like Ubuntu, Hyperbola replaced it with OpenRC as the default init system. v0.1 of Hyperbola was the first and the last version to support Systemd.

Moreover, Hyperbola put high emphasis on Keep It Simple Stupid (KISS) methodology. It provides packages for i686 and x86_64 architecture that meets GNU Free System Distribution Guidelines (GNU FSDG).

Not just that, but it also has its own social contract and packaging guidelines that follow the philosophy of the Free Software Movement.

Hence, Free Software Foundation [recognized][6] Hyperbola GNU/Linux-libre as the first completely free Brazilian operating system in 2018.

### Downloading Hyperbola GNU/Linux-libre 0.3.1 Milky Way

The hyperbola project provides [two live images][7] for installation: one is the regular Hyperbola and the other is Hypertalking. Hypertalking is the ISO optimized and adapted for blind and visually impaired users.

Interestingly, if you already use Arch Linux or Arch-based distribution like Parabola, you don’t need to download a live image. You can easily migrate to Hyperbola by following the official [Arch][8] or [Parabola][9] migration guide.

The ISO image sizes around 650MB containing only essential packages (excluding desktop environment) to boot only in a command line interface.

### Hardware requirements for Hyperbola

For v0.3.1 (x86_64), you require a minimum of any 64-bit processor, 47MiB (OS installed) and 302MiB (Live image) of RAM for text mode only with no desktop environment.

While for v0.3.1 (i686), you require a minimum of Intel Pentium II or AMD Athlon CPU model, 33MiB (OS installed), and 252MiB (Live image) of RAM for text mode only with no desktop environment.

### Installing Hyperbola Linux from scratch

Currently, I don’t use Arch or Parabola distribution. Hence, instead of migration, I chose to install Hyperbola Linux from scratch.

I also mostly don’t dual boot unknown (to me) distribution on my hardware as it may create undetermined problems. So, I decided to use the wonderful GNOME Boxes app for setting up a Hyperbola virtual machine with up to 2 GB of RAM and 22 GB of free disk space.

Similar to Arch, Hyperbola also does not come with a graphical user interface (GUI) installer. It means you need to set up almost everything from scratch using a command line interface (CLI).

Here, it also concludes that Hyperbola is definitely not for beginners and those afraid of the command line.

However, Hyperbola does provide separate [installation instruction][10], especially for beginners. But I think it still misses several steps that can trouble beginners during the installation process.

For instance, it does not guide you to connect to the network, set up a new user account, and install a desktop environment.

Hence, there is also another Hyperbola [installation guide][11] that you need to refer to in case you’re stuck at any step.

As I booted the live image, the boot menu showed the option to install for both 64-bit or 32-bit architecture.

![Live Image Boot Menu][12]

Next, following the installation instruction, I went through setting up disk partition, DateTime, language, and password for the root user.

![Disk partition][13]

Once everything set up, I then installed the most common [Grub bootloader][14] and rebooted the system. Phew! until now, all went well as I could log in to my Hyperbola system.

![text mode][15]

### Installing Xfce desktop in Hyperbola Linux

The command-line interface was working fine for me. But now, to have a graphical user interface, I need to manually choose and install a new [desktop environment][16] as Hyperbola does not come with any default DE.

For the sake of simplicity and lightweight, I chose to get the popular [Xfce desktop][17]. But before installing it, I also needed a Xorg [display server][18]. So, I installed it along with other important packages using the default pacman package manager.

![Install X.Org][19]

Later, I installed LightDM cross-desktop [display manager][20], Xfce desktop, and other necessary packages like elogind for managing user logins.

![Install Xfce desktop environment][21]

After the Xfce installation, you also need to add LightDM service at the default run level to automatically switch to GUI mode. You can use the below command and reboot the system:

```
rc-update add lightdm default
reboot
```

![Add LightDM at runlevel][22]

#### Pacman Signature Error In Hyperbola Linux

While installing Xorg and Xfce in the latest Hyperbola v0.3.1, I encountered the signature error for some packages showing “signature is marginal trust” or “invalid or corrupted package.”

![Signature Error In Hyperbola Linux][23]

After searching the solution, I came to know from Hyperbola [Forum][24] that the main author Emulatorman’s keys expired on 1st Feb 2021.

Hence, until the author upgrades the key or a new version 0.4 arrives sooner or later, you can change the `SigLevel` from “SigLevel=Required DatabaseOptional” to “SigLevel=Never” in`/etc/pacman.conf` file to avoid this error.

![][25]

### Hyperbola Linux with Xfce desktop

![Hyperbola Linux With Xfce desktop][26]

Hyperbola GNU/Linux-libre with Xfce 4.12 desktop gives a very clean, light, and smooth user experience. At the core, it contains Linux-libre 4.9 and OpenRC 0.28 service manager.

![][27]

As Hyperbola does not come with customized desktops and tons of bloated software, it definitely gives flexibility and freedom to choose, install, and configure the services you want.

On the memory usage side, it takes around 205MB of RAM (approx. 10%) while running no applications (except terminal).

![][28]

### Is Hyperbola a suitable distribution for you?

As per my experience, it definitely not a [Linux distribution that I would like to suggest to complete beginners][29]. Well, the Hyperbola project does not even claim to be beginners-friendly.

If you’re well-versed with the command line and have quite a good knowledge of Linux concepts like disk partition, you can give it a try and decide yourself. Spending time hacking around the installation and configuration process can teach you a lot.

Another thing that might matter in choosing Hyperbola Linux is also the default init system. If you’re looking for Systemd-free distribution with complete customization control from scratch, what can be better than it.

Last but not least, you should also consider the future of Hyperbola, which will no longer contain Linux Kernel as it will turn into a HyperbolaBSD with OpenBSD Linux and userspace.

If you’ve already tried or currently using Hyperbola Linux, let us know your experience in the comment below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/hyperbola-linux-review/

作者：[Sarvottam Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sarvottam/
[b]: https://github.com/lujun9972
[1]: https://www.hyperbola.info/news/announcing-hyperbolabsd-roadmap/
[2]: https://itsfoss.com/hyperbola-linux-bsd/
[3]: https://www.fsfla.org/ikiwiki/selibre/linux-libre/
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/hyperbola-gnu-linux.png?resize=800%2C450&ssl=1
[5]: https://www.hyperbola.info/members/founders/
[6]: https://www.fsf.org/news/fsf-adds-hyperbola-gnu-linux-libre-to-list-of-endorsed-gnu-linux-distributions
[7]: https://wiki.hyperbola.info/doku.php?id=en:main:downloads&redirect=1
[8]: https://wiki.hyperbola.info/doku.php?id=en:migration:from_arch
[9]: https://wiki.hyperbola.info/doku.php?id=en:migration:from_parabola
[10]: https://wiki.hyperbola.info/doku.php?id=en:guide:beginners
[11]: https://wiki.hyperbola.info/doku.php?id=en:guide:installation
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/04/Live-Image-Boot-Menu.png?resize=640%2C480&ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/Disk-partition.png?resize=600%2C450&ssl=1
[14]: https://itsfoss.com/what-is-grub/
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/04/text-mode.png?resize=600%2C450&ssl=1
[16]: https://itsfoss.com/what-is-desktop-environment/
[17]: https://xfce.org/
[18]: https://itsfoss.com/display-server/
[19]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/Install-xorg-package.png?resize=600%2C450&ssl=1
[20]: https://itsfoss.com/display-manager/
[21]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/04/Install-Xfce-desktop-environment-800x600.png?resize=600%2C450&ssl=1
[22]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/04/Add-LightDM-at-runlevel.png?resize=600%2C450&ssl=1
[23]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/04/Signature-Error-In-Hyperbola-Linux.png?resize=600%2C450&ssl=1
[24]: https://forums.hyperbola.info/viewtopic.php?id=493
[25]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/Configure-pacman-SigLevel.png?resize=600%2C450&ssl=1
[26]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/04/Hyperbola-Linux-With-Xfce-desktop.jpg?resize=800%2C450&ssl=1
[27]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/04/Hyperbola-System-Information.jpg?resize=800%2C450&ssl=1
[28]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/Memory-Usage.jpg?resize=800%2C450&ssl=1
[29]: https://itsfoss.com/best-linux-beginners/
