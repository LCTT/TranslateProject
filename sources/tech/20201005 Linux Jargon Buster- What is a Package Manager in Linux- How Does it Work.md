[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux Jargon Buster: What is a Package Manager in Linux? How Does it Work?)
[#]: via: (https://itsfoss.com/package-manager/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Linux Jargon Buster: What is a Package Manager in Linux? How Does it Work?
======

One of the main points [how Linux distributions differ from each other][1] is the package management. In this part of the Linux jargon buster series, you’ll learn about packaging and package managers in Linux. You’ll learn what are packages, what are package managers and how do they work and what kind of package managers available.

### What is a package manager in Linux?

In simpler words, a package manager is a tool that allows users to install, remove, upgrade, configure and manage software packages on an operating system. The package manager can be a graphical application like a software center or a command line tool like [apt-get][2] or [pacman][3].

You’ll often find me using the term ‘package’ in tutorials and articles on It’s FOSS. To understand package manager, you must understand what a package is.

### What is a package?

A package is usually referred to an application but it could be a GUI application, command line tool or a software library (required by other software programs). A package is essentially an archive file containing the binary executable, configuration file and sometimes information about the dependencies.

In older days, [software used to installed from its source code][4]. You would refer to a file (usually named readme) and see what software components it needs, location of binaries. A configure script or makefile is often included. You will have to compile the software or on your own along with handling all the dependencies (some software require installation of other software) on your own.

To get rid of this complexity, Linux distributions created their own packaging format to provide the end users ready-to-use binary files (precompiled software) for installing software along with some [metadata][5] (version number, description) and dependencies.

It is like baking a cake versus buying a cake.

![][6]

Around mid 90s, Debian created .deb or DEB packaging format and Red Hat Linux created .rpm or RPM (short for Red Hat Package Manager) packaging system. Compiling source code still exists but it is optional now.

To interact with or use the packaging systems, you need a package manager.

### How does the package manager work?

Please keep in mind that package manager is a generic concept and it’s not exclusive to Linux. You’ll often find package manager for different software or programming languages. There is [PIP package manager just for Python packages][7]. Even [Atom editor has its own package manager][8].

Since the focus in this article is on Linux, I’ll take things from Linux’s perspective. However, most of the explanation here could be applied to package manager in general as well.

I have created this diagram (based on SUSE Wiki) so that you can easily understand how a package manager works.

![][9]

Almost all Linux distributions have software repositories which is basically collection of software packages. Yes, there could be more than one repository. The repositories contain software packages of different kind.

Repositories also have metadata files that contain information about the packages such as the name of the package, version number, description of package and the repository name etc. This is what you see if you use the [apt show command][10] in Ubuntu/Debian.

Your system’s package manager first interacts with the metadata. The package manager creates a local cache of metadata on your system. When you run the update option of the package manager (for example apt update), it updates this local cache of metadata by referring to metadata from the repository.

When you run the installation command of your package manager (for example apt install package_name), the package manager refers to this cache. If it finds the package information in the cache, it uses the internet connection to connect to the appropriate repository and downloads the package first before installing on your system.

A package may have dependencies. Meaning that it may require other packages to be installed. The package manager often takes care of the dependencies and installs it automatically along with the package you are installing.

![Package Manager Handling Dependencies In Linux][11]

Similarly, when you remove a package using the package manager, it either automatically removes or informs you that your system has unused packages that can be cleaned.

Apart from the obvious tasks of installing, removing, you can use the package manager to configure the packages and manage them as per your need. For example, you can [prevent the upgrade of a package version][12] from the regular system updates. There are many more things your package manager might be capable of.

### Different kinds of package managers

Package Managers differ based on packaging system but same packaging system may have more than one package manager.

For example, RPM has [Yum][13] and [DNF][14] package managers. For DEB, you have apt-get, [aptitude][15] command line based package managers.

![Synaptic package manager][16]

Package managers are not necessarily command line based. You have graphical package managing tools like [Synaptic][17]. Your distribution’s software center is also a package manager even if it runs apt-get or DNF underneath.

### Conclusion

I don’t want to go in further detail on this topic because I can go on and on. But it will deviate from the objective of the topic which is to give you a basic understanding of package manager in Linux.

I have omitted the new universal packaging formats like Snap and Flatpak for now.

I do hope that you have a bit better understanding of the package management system in Linux. If you are still confused or if you have some questions on this topic, please use the comment system. I’ll try to answer your questions and if required, update this article with new points.

--------------------------------------------------------------------------------

via: https://itsfoss.com/package-manager/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/what-is-linux/
[2]: https://itsfoss.com/apt-vs-apt-get-difference/
[3]: https://itsfoss.com/pacman-command/
[4]: https://itsfoss.com/install-software-from-source-code/
[5]: https://www.computerhope.com/jargon/m/metadata.htm
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/source-code-comilation-vs-packaging.png?resize=800%2C450&ssl=1
[7]: https://itsfoss.com/install-pip-ubuntu/
[8]: https://itsfoss.com/install-packages-in-atom/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/linux-package-manager-explanation.png?resize=800%2C450&ssl=1
[10]: https://itsfoss.com/apt-search-command/
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/package-manager-handling-dependencies-in-linux.png?resize=800%2C450&ssl=1
[12]: https://itsfoss.com/prevent-package-update-ubuntu/
[13]: https://fedoraproject.org/wiki/Yum
[14]: https://fedoraproject.org/wiki/DNF
[15]: https://wiki.debian.org/Aptitude
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/see-packages-by-repositories-synaptic.png?resize=799%2C548&ssl=1
[17]: https://itsfoss.com/synaptic-package-manager/
