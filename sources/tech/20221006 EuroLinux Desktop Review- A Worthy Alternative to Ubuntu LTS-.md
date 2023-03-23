[#]: subject: "EuroLinux Desktop Review: A Worthy Alternative to Ubuntu LTS?"
[#]: via: "https://www.debugpoint.com/eurolinux-desktop-review/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

EuroLinux Desktop Review: A Worthy Alternative to Ubuntu LTS?
======
A detailed review of EuroLinux Desktop – a desktop Linux OS from the EuroLinux team.

EuroLinux is a Polish company which has been developing open-source server OS and solutions for almost a decade, mostly in the Europe market. The company is also known for its Linux server operating system (OS) based on Red Hat Enterprise Linux (RHEL).

A couple of weeks back, the company introduced a desktop operating system based on RHEL – “EuroLinux Desktop”.

Since few distros are available based on RHEL, I thought of giving it a spin and finding out how it is designed, its performance, etc. Moreover, the team markets the distro as *“combines the look and functionality of Windows® and macOS® with the reliability and security of a server-based Enterprise Linux distribution”.*

EuroLinux desktop is free to download and install. However, you can buy the support if you are a small business owner or have other commercial needs.

Let’s find out how it looks.

### EuroLinux Desktop Review

#### Installation and ISO Size

The ISO of the EuroLinux desktop is whooping 7GB+ (version 9.0). The reason is that ISO pre-loads all the necessary packages and applications in the ISO for offline installation. It also serves the target users, institutions, and schools which may not have an active internet connection.

EuroLinux uses the standard Anaconda installer used by most RHEL-based distros. The installation steps are simple and remain basic.

While testing no major problems in the installation, which took around 7 to 8 minutes of total time.

#### The first look

![EuroLinux Desktop 9.0][1]

Since the EuroLinux desktop is based on RHEL, it follows the RHEL release cycle. The current version which I am reviewing is version 9.0, based on RHEL 9.0 – which features a standard GNOME desktop.

Since RHEL is a little conservative regarding the latest package adoption for its critical servers and workstations use cases, you get the GNOME 40 with Linux Kernel 5.14 in the EuroLinux Desktop 9.0.

So, at first look, you experience a nice and clean GNOME 40 desktop with some additional customization.

The customizations on stock GNOME comes via pre-installed and enabled extensions.

The dash to Panel and Desktop Icons are the two major ones. Dash to Panel gives you a bottom transparent panel with a customized tray. The tray includes the Calendar, date/time, indicators (battery, network and night mode) and quick settings.

![Installed extensions by default][2]

At the extreme left, the application menu launches the full-screen app view of the GNOME desktop.

The default theme is Adwaita, and the only change you can experience is the Papirus icon theme.

#### Applications, necessary functionalities

Essential applications are pre-loaded. At least those are necessary for a basic functioning system.

For example, the LibreOffice suite is fully installed. The Firefox ESR is the default web browser – which is a good choice considering the long-term support of more than five years.

In addition, a text editor, image viewer, screenshot tool, and video player are all included in the default installation.

There is little distinction on how to install the Software in EuroLinux. EuroLinux has its repo pre-configured from its servers. This is obvious, considering its creator is an organization.

So, by default, you get the following repos.

The Software app works as it should. You can easily search, install or uninstall any application using its GUI.

![Software repos][3]

#### Performance

The performance is excellent, thanks to the RHEL base. In an idle state, GNOME Shell uses most of the system resources, including CPU and RAM. It clocks 7 to 14% CPU with 1.6GB of RAM.

EuroLinux 9.0 uses 7.3 GB disk space for a default installation.

If I compare this performance to [Ubuntu 22.04 LTS][4], it is indeed a very little higher (1.4 GB and 6% CPU) at idle.

I believe this tiny variance is due to GNOME 42’s recent performance improvements in mutter and Shell.

![EuroLinux performance at idle][5]

#### Comparison with Ubuntu LTS, Rocky and AlmaLinux

Fundamentally there are differences in how Ubuntu and RedHat-based distros are derived, i.e. Debian vs Fedora. And the package management system.

At a high level, you get the same years of support and security updates in both distros. In fact, EuroLinux provides more extended support until one version retires.

If you compare the distro from the fundamental usage standpoint, you may not know much of a difference at the surface. The only noticeable difference is the GNOME and Kernel versions. Ubuntu LTS versions are a little faster to adopt the latest GNOME and Kernel versions than RedHat (or EuroLinux).

The other difference is that the package manager is dnf in EuroLinux and apt in Ubuntu.

However, two other RHEL-based distros are available today (the most popular ones). They are Alma Linux and Rocky Linux. Both of them are precisely identical to EuroLinux except for the underlying software sources.

But both are relatively new in the field (born after the [CentOS event][6]) two/three years back. Whereas, EuroLinux (as a server) has been in the field for nearly a decade.

Also, the Rocky Linux is probably the only advantage of all, which is truly a community-driven project. And Alma Linux is actually a product from CloudLinux Inc & EuroLinux is from EuroLinux Sp. z o.o.

So, if you want a true community-based Ubuntu-LTS alternative, then perhaps Rocky Linux is the one.

### Should you use it for a daily driver?

I believe you can safely use this for your daily use.

Remember that you may not get the latest and greatest shiny GNOME & mainline Kernel right away. But hey, older packages are “proven” to work.

If you need a stable desktop your average use for 5+ years without worrying about sudden crashing, boot problems, grub problems, slowness, etc. – then it’s ideal for you.

Also, it’s perfect for you if you don’t like how Ubuntu is heading – forcing snap, other aspects and want to switch to a stable distro.

The only trade-off now is the latest GNOME 43 vs the older GNOME 40. And you can always install the latest mainline kernel if you are an advanced user.

### Wrapping Up

After my day-long test, it performed exactly what was expected. No crashes or any weird errors. The distro looks and performs at par with a professional Linux operating system. You can safely install it on your Laptops and desktops for day-to-day usage. Technically you can not use the actual RedHat Linux without registration and a license. Hence, this distro could be ideal who wants Ubuntu-LTS-like stability for 5+ years besides Rocky Linux.

Give it a try from the [official website][7].

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/eurolinux-desktop-review/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2022/10/EuroLinux-Desktop-9.0.jpg
[2]: https://www.debugpoint.com/wp-content/uploads/2022/10/Installed-extensions-by-default.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2022/10/Software-repos.jpg
[4]: https://www.debugpoint.com/ubuntu-22-04-review/
[5]: https://www.debugpoint.com/wp-content/uploads/2022/10/EuroLinux-performance-at-idle.jpg
[6]: https://www.debugpoint.com/centos-stream-announcement/
[7]: https://en.euro-linux.com/eurolinux/desktop/
