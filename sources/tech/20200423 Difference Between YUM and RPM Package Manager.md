[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Difference Between YUM and RPM Package Manager)
[#]: via: (https://www.2daygeek.com/comparison-difference-between-yum-vs-rpm/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Difference Between YUM and RPM Package Manager
======

Package managers play a key role in the Linux system.

It allows you to install, update, view, search and delete software packages to suit your needs.

Each of the distributions has their own set of package managers and use them based on your Linux distributions.

RPM is one of the oldest traditional package managers, designed to work on Red Hat-based systems such as Red Hat Enterprise Linux (RHEL), CentOS, Fedora and openSUSE (which is based on suse Enterprise Linux).

But when it comes to dependency resolution and package update (full system update/upgrade), there is an prominent limitation for RPM package manager.

If you want to know the **[difference between yum and dnf package manager][1]** go to the following article.

This means that yum can download and install all required dependencies automatically, but rpm will tell you to install a list of dependencies, and then you have to manually install them.

This is practically impossible and time consuming when you want to install a group of packages using the **[rpm command][2]**.

That’s where the **[YUM Package Manager][3]** comes in handy and solve both problems.

### What’s RPM?

RPM refers to RPM Package Manager (formerly known as Red Hat Package Manager) is a powerful, command-line package management tool developed for the Red Hat operating system.

It is now used as a core component in many Linux distributions such as Centos, Fedora, Oracle Linux, openSUSE and Mageia.

RPM Package Manager allows you to install, upgrade, delete, query and verify packages on RPM-based Linux systems.

RPM files comes with the `.rpm` extension. The RPM package consists of an archive file, that contains libraries and dependencies for a specific package, that do not conflict with other packages installed on your system.

There are many front-end tools available on Linux to install the RPM package that make the installation process more efficiently compared to the RPM tool, especially for handling dependencies.

If you want to know more about the front-end package manager of Linux distributions, go to the link below.

  * **[List of Front-ent Command-line Package Manager for Linux][4]**



If you would like GUI package manager for Linux, go to the link below.

  * **[List of GUI Package Manager for Linux][5]**



### What’s YUM?

Yum is a free and open-source command-line package-management application for Linux operating systems that uses the RPM Package Manager.

Yum is a front-end tool for rpm that automatically solves dependencies for packages.

It installs RPM software packages from distribution official repositories and other third-party repositories.

Yum allows you to install, update, search and remove packages from your system.

If you want to keep your system up-to-date, you can enable automatic updates via yum-cron.

Also, it allows you to exclude a package or packages from the yum update if you need to.

Yum is installed by default and you do not need to install it.

S.No | RPM | YUM
---|---|---
1 | Red Hat introduced RPM in 1997. | Yellowdog UPdater (YUP) was developed in 1999-2001 and YUM replaced the original YUP utility in 2003.
2 | RPM stands for RPM Package manager (formally known as Red Hat package manager) | YUM stands for Yellowdog Updater Modified.
3 | The RPM File Naming Convention is as follows.
httpd-2.4.6-92.el7.x86_64.rpm
httpd - Name of the actual package
2.4.6 - Version of package release
92 - Subversion of package release
el7 - Red Hat Version
x86_64 - Hardware architecture
rpm - File extension | It uses the rpm database in the backend.
4 | It doesn't resolve dependencies, you must install them manually. | It automatically resolves dependencies and install them simultaneously (any package will be installed with its dependencies).
5 | This allows you to install multiple versions of the package at once | This does not allow and shows that the package is already installed.
6 | When installing a package using the RPM command you must provide the exact location of the ".rpm" package. | You can install any package available in the repository, but you only need to know the package name.
7 | RPM is not dependent on YUM | It is a frontend tool that uses the RPM package manager on the backend to manage packages.
8 | It is difficult to manage RPM in terms of package installation | YUM is the easiest way to manage RPM packages.
9 | RPM doesn't allow you to upgrade the entire system to the latest available version | YUM allows you to upgrade your system to the latest available version (minor version upgrade, for example, 7.0 to 7.x)
10 | RPM doesn't allow you to automatically update/upgrade packages installed on your system | YUM allows you to automatically update/upgrade the updates available on your system.
11 | It doesn't use the online repository to perform any actions. | It relies entirely on the online repository to do all the work.
12 | RPM is a package format and it is a low-level package manager that does basic things. | This is a top-level front-end package manager that can do everything you need.

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/comparison-difference-between-yum-vs-rpm/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/comparison-difference-between-dnf-vs-yum/
[2]: https://www.2daygeek.com/linux-rpm-command-examples-manage-packages-fedora-centos-rhel-systems/
[3]: https://www.2daygeek.com/linux-yum-command-examples-manage-packages-rhel-centos-systems/
[4]: https://www.2daygeek.com/list-of-command-line-package-manager-for-linux/
[5]: https://www.2daygeek.com/list-of-graphical-frontend-tool-for-linux-package-manager/
