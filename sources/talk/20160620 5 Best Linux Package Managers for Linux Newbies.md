transalting by ynmlml
5 Best Linux Package Managers for Linux Newbies
=====================================================


One thing a new Linux user will get to know as he/she progresses in using it is the existence of several Linux distributions and the different ways they manage packages.

Package management is very important in Linux, and knowing how to use multiple package managers can proof life saving for a power user, since downloading or installing software from repositories, plus updating, handling dependencies and uninstalling software is very vital and a critical section in Linux system Administration.

![](http://www.tecmint.com/wp-content/uploads/2016/06/Best-Linux-Package-Managers.png)
>Best Linux Package Managers

Therefore to become a Linux power user, it is significant to understand how the major Linux distributions actually handle packages and in this article, we shall take a look at some of the best package managers you can find in Linux.

Here, our main focus is on relevant information about some of the best package managers, but not how to use them, that is left to you to discover more. But I will provide meaningful links that point out usage guides and many more.

### 1. DPKG – Debian Package Management System

Dpkg is a base package management system for the Debian Linux family, it is used to install, remove, store and provide information about `.deb` packages.

It is a low-level tool and there are front-end tools that help users to obtain packages from remote repositories and/or handle complex package relations and these include:

Don’t Miss: [15 Practical Examples of “dpkg commands” for Debian Based Distros][1]

#### APT (Advanced Packaging Tool)

It is a very popular, free, powerful and more so, useful command line package management system that is a front end for dpkg package management system.

Users of Debian or its derivatives such as Ubuntu and Linux Mint should be familiar with this package management tool.

To understand how it actually works, you can go over these how to guides:

Don’t Miss: [15 Examples of How to Use New Advanced Package Tool (APT) in Ubuntu/Debian][2]

Don’t Miss: [25 Useful Basic Commands of APT-GET and APT-CACHE for Package Management][3]

#### Aptitude Package Manager

This is also a popular command line front-end package management tool for Debian Linux family, it works similar to APT and there have been a lot of comparisons between the two, but above all, testing out both can make you understand which one actually works better.

It was initially built for Debian and its derivatives but now its functionality stretches to RHEL family as well. You can refer to this guide for more understanding of APT and Aptitude:

Don’t Miss: [What is APT and Aptitude? and What’s real Difference Between Them?][4]

#### Synaptic Package Manager

Synaptic is a GUI package management tool for APT based on GTK+ and it works fine for users who may not want to get their hands dirty on a command line. It implements the same features as apt-get command line tool.

### 2. RPM (Red Hat Package Manager)

This is the Linux Standard Base packing format and a base package management system created by RedHat. Being the underlying system, there several front-end package management tools that you can use with it and but we shall only look at the best and that is:

#### YUM (Yellowdog Updater, Modified)

It is an open source and popular command line package manager that works as a interface for users to RPM. You can compare it to APT under Debian Linux systems, it incorporates the common functionalities that APT has. You can get a clear understanding of YUM with examples from this how to guide:

Don’t Miss: [20 Linux YUM Commands for Package Management][5]

#### DNF – Dandified Yum

It is also a package manager for the RPM-based distributions, introduced in Fedora 18 and it is the next generation of version of YUM.

If you have been using Fedora 22 onwards, you must have realized that it is the default package manager. Here are some links that will provide you more information about DNF and how to use it:

Don’t Miss: [DNF – The Next Generation Package Management for RPM Based Distributions][6]

Don’t Miss: [27 ‘DNF’ Commands Examples to Manage Fedora Package Management][7]

### 3. Pacman Package Manager – Arch Linux

It is a popular and powerful yet simple package manager for Arch Linux and some little known Linux distributions, it provides some of the fundamental functionalities that other common package managers provide including installing, automatic dependency resolution, upgrading, uninstalling and also downgrading software.

But most effectively, it is built to be simple for easy package management by Arch users. You can read this [Pacman overview][8] which explains into details some of its functions mentioned above.

### 4. Zypper Package Manager – openSUSE

It is a command line package manager on OpenSUSE Linux and makes use of the libzypp library, its common functionalities include repository access, package installation, resolution of dependencies issues and many more.

Importantly, it can also handle repository extensions such as patterns, patches, and products. New OpenSUSE user can refer to this following guide to master it.

Don’t Miss: [45 Zypper Commands to Master OpenSUSE Package Management][9]

### 5. Portage Package Manager – Gentoo

It is a package manager for Gentoo, a less popular Linux distribution as of now, but this won’t limit it as one of the best package managers in Linux.

The main aim of the Portage project is to make a simple and trouble free package management system to include functionalities such as backwards compatibility, automation plus many more.

For better understanding, try reading [Portage project page][10].

### Concluding Remarks

As I already hinted at the beginning, the main purpose of this guide was to provide Linux users a list of the best package managers but knowing how to use them can be done by following the necessary links provided and trying to test them out.

Users of the different Linux distributions will have to learn more on their own to better understand the different package managers mentioned above.


--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-package-managers/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+tecmint+%28Tecmint%3A+Linux+Howto%27s+Guide%29

作者：[Ravi Saive][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/admin/
[1]: http://www.tecmint.com/dpkg-command-examples/
[2]: http://www.tecmint.com/apt-advanced-package-command-examples-in-ubuntu/
[3]: http://www.tecmint.com/useful-basic-commands-of-apt-get-and-apt-cache-for-package-management/
[4]: http://www.tecmint.com/difference-between-apt-and-aptitude/
[5]: http://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/
[6]: http://www.tecmint.com/dnf-next-generation-package-management-utility-for-linux/
[7]: http://www.tecmint.com/dnf-commands-for-fedora-rpm-package-management/
[8]: https://wiki.archlinux.org/index.php/Pacman
[9]: http://www.tecmint.com/zypper-commands-to-manage-suse-linux-package-management/
[10]: https://wiki.gentoo.org/wiki/Project:Portage
