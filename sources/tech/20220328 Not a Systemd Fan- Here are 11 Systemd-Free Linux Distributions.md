[#]: subject: "Not a Systemd Fan? Here are 11 Systemd-Free Linux Distributions"
[#]: via: "https://itsfoss.com/systemd-free-distros/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Not a Systemd Fan? Here are 11 Systemd-Free Linux Distributions
======

systemd is a popular init system adopted by most of the major Linux distributions backed by dozens of developers and companies.

In case you’re curious, the init system is the first process after the Linux Kernel comes into action in the boot process to initialize various device management, logging, and networking service. You may know them as [daemons][1] as well.

Technically, systemd solved numerous issues that made Linux distributions more reliable to use on desktop and massive server configurations.

So, it is safe to say that many believe that it is meant to be to make the boot process reliable and fast with the ability to initialize things in parallel,.

However, there are other users who absolutely hate the inclusion of it in modern Linux distributions. Hence, demanding systemd-free Linux distributions.

But, why is that?

Furthermore, what are your options if you do not want systemd on your Linux system?

This article will briefly discuss why some users prefer system-free distros and some of the best options available.

![][2]

### Why systemd-free Alternatives?

Primarily, systemd is considered as a bloated implementation compared to the classic init systems like SysVinit (or System V init).

It is also believed to go against the UNIX philosophy, where the aim should have been to keep things simple and focus on doing a single thing efficiently.

Moreover, systemd is a complex implementation with various modules, which potentially increases the attack surface compared to SysVinit.

In addition to some of these reasons, desktop environments like GNOME and KDE are known to depend on systemd components. However, some argue that other tools/services should not be entirely dependent on systemd, taking the freedom of a user to use another init system.

### 11 Systemd-free Linux Distro Options

However, the list of distributions without systemd involves some options that use [elogind][3] and some systemd parts.

These are some of the options that help you run distros without systemd while fulfilling some of the dependencies of systemd.

Fret not, the list also involves options that are entirely systemd-free without elogind and other systemd-parts. The list mentions the use of the same wherever necessary.

The list is in no particular order of ranking.

#### 1\. Devuan

![Credits: Distrowatch][4]

Devuan is a Debian fork without systemd. It is usually based on the latest stable Debian version available.

The project’s aim is to allow users to control the choice of Init system. You can choose to use sysVinit, runit, and openRC.

With Devuan, you will have access to all the desktop environments that are available in Debian. It works with the systemd-free configurations. Compared to some other systemd-free distros, Devuan can be an easier option with respectable accessibility improvements and a smooth installation process.

At the time of publishing this, you can try Devuan on 32-bit and 64-bit systems.

[Devuan][5]

#### 2\. AntiX

![Credits: Distrowatch][6]

AntiX is an interesting systemd-free distro based on Debian (Stable), which is also [one of the best options for 32-bit systems][7].

Considering it offers support for both 64-bit and 32-bit systems and uses IceWM window manager, it is [one of the most lightweight options][8] as well.

You also get the option to use Fluxbox, and a couple of other window managers as per your requirements.

When it comes to the Init system, you can choose to download the runit edition or sysVinit version. There are different editions available to get started.

[AntiX][9]

#### 3\. Void Linux

![Credits: Distrowatch][10]

Void Linux is a unique offering that is not based on any existing Linux distro. It is entirely independent and actively developed.

It prefers to use runit as the init system instead of systemd. While it focuses on providing stability, they follow a [rolling release schedule][11] with their continuous build system.

You get to use its native package manager, written from scratch, to quickly install and manage software in your system.

They offer detailed documentation to explain the available features and instructions to configure your experience.

[Void Linux][12]

#### 4\. GoboLinux

![Credits: Distrowatch][13]

If you are feeling adventurous, and do not have an issue playing with the terminal, GoboLinux is an interesting pick. While it does offer a desktop, you get the bare minimum and don’t expect something like you see in Ubuntu.

Unlike most, it is a modular Linux distribution that focuses on an efficient file system to organize the programs. Usually, when we install something on Linux, the files for programs get scattered all over the system at different directories.

GoboLinux aims to simplify that by giving each program its directory. On top of all the unique points, it is also a systemd-free distro.

[GoboLinux][14]

#### 5\. Alpine Linux

![][15]

Alpine Linux is yet another independent Linux distribution without systemd. When it comes to init system, it uses OpenRC.

The distribution focuses on security and resource efficiency. So, if you were looking for a simple systemd-free distro with a focus on security, Alpine Linux can be a good choice.

[Alpine Linux][16]

### 6\. Artix

![Credits: Distrowatch][17]

Artix is an Arch-based distro without systemd. You can configure it to use OpenRC, Runit, or dinit (a new init system).

It does utilize **elogind** as its user login manager to try making the move to a systemd-free distro seamless. However, if you dislike its presence, you can try running it without it.

Compared to some other options, Artix is only suitable for experienced Arch users who can configure their setup.

[Artix Linux][18]

### 7\. TinyCore Linux

![Credits: Distrowatch][19]

TinyCore Linux is a modular Linux distribution with community-built extensions. You get a Linux kernel, root filesystem, and some startup-up scripts to install some kernel modules.

Basically, you build your minimal Linux distribution with TinyCore Linux.

As the name suggests, it is a tiny installation barely taking up any storage space (as low as 10 MB) as per modern OS standards.

Considering it is modular, you can fully customize your configuration without systemd, or making use of elogind. You can quickly install a variety of desktop environments and window managers to get started.

For obvious reasons, it can run perfectly fine on older computers.

[TinyCore Linux][20]

### 8\. Chimera Linux

![][21]

Chimera Linux is an experimental option if you like to compile things yourself and use a Linux distribution. However, you get ISO images available with GUI.

It is based on FreeBSD, and uses dinit as its init system.

You can install GNOME or Enlightenment desktop with Chimera Linux to get a full-fledged desktop experience.

[Chimera Linux][22]

### 9\. Venom Linux

![Credits: Distrowatch][23]

Venom Linux is yet another source-based Linux distribution, giving you the ability to customize things while keeping it minimal.

It does not rely on systemd or elogind.

[Venom Linux][24]

### 10\. Kiss Linux

Kiss Linux is a rolling release distribution where you need to download the tarball, unpack and rebuild the system as per your requirements.

The default init system is busybox. But, you can experiment with other init systems as well.

[Kiss Linux][25]

### 11\. PCLinuxOS

![PCLinuxOS][26]

PCLinuxOS is a fantastic choice for users who want a working desktop environment without all the hassle.

It does not rely on systemd, but you also get all the essential tools with the distribution baked in. So, compared to most other options, the challenges of not having systemd will be minimal, making the user experience better.

It uses sysVinit and also features a package manager to help you manage software.

[PCLinuxOS][27]

### Systemd or Not?

Bloat or not, Systemd has made it possible to make numerous things easy while improving performance.

You will not have any compatibility issues when choosing a distro with systemd.

Considering most of the popular Linux distributions rely on it, there’s something about it that makes sense to provide a better user experience to the end-user.

However, if you are someone who wants an init system that follows the traditional approach, systemd-free distros should suit you well.

Note that you might face some issues/challenges when it comes to some systemd-free distros. So, make sure you do your research before trying anything.

If you know of some other good Linux distro that doesn’t use systemd, do let us know in the comments.

--------------------------------------------------------------------------------

via: https://itsfoss.com/systemd-free-distros/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linux-daemons/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/systemd-free-distros.png?resize=800%2C450&ssl=1
[3]: https://wiki.gentoo.org/wiki/Elogind
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/devuan.png?resize=800%2C500&ssl=1
[5]: https://www.devuan.org/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/antix.png?resize=800%2C500&ssl=1
[7]: https://itsfoss.com/32-bit-linux-distributions/
[8]: https://itsfoss.com/lightweight-linux-beginners/
[9]: https://antixlinux.com/
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/void.jpg?resize=800%2C500&ssl=1
[11]: https://itsfoss.com/rolling-release/
[12]: https://voidlinux.org/
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/gobo.png?resize=800%2C450&ssl=1
[14]: https://gobolinux.org/
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/AlpineDesktop.png?resize=800%2C452&ssl=1
[16]: https://alpinelinux.org/
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/artix.jpg?resize=800%2C500&ssl=1
[18]: https://artixlinux.org/
[19]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/tinycore.jpg?resize=800%2C640&ssl=1
[20]: http://tinycorelinux.net/
[21]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/chimera-screenshot.jpg?resize=800%2C450&ssl=1
[22]: https://chimera-linux.org/
[23]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/venom.jpg?resize=800%2C500&ssl=1
[24]: https://venomlinux.org/
[25]: https://kisslinux.org/
[26]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/pclinuxos.jpg?resize=800%2C500&ssl=1
[27]: https://www.pclinuxos.com/
