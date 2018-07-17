How To View Detailed Information About A Package In Linux
======
This is know topic and we can write so many articles because most of the time we would stick with package managers for many reasons.

Each distribution clones has their own package manager, each has comes with their unique features that allow users to perform many actions such as installing new software packages, removing unnecessary software packages, updating the existing software packages, searching for specific software packages, and updating the system to latest available version, etc.

Whoever is sticking with command-line most of the time they would preferring the CLI based package managers. The major CLI package managers for Linux are Yum, Dnf, Rpm,Apt, Apt-Get, Deb, pacman and zypper.

**Suggested Read :**
**(#)** [List of Command line Package Managers For Linux & Usage][1]
**(#)** [A Graphical frontend tool for Linux Package Manager][2]
**(#)** [How To Search If A Package Is Available On Your Linux Distribution Or Not][3]
**(#)** [How To Add, Enable And Disable A Repository By Using The DNF/YUM Config Manager Command On Linux][4]

As a system administrator you should aware of from where packages are coming, which repository, version of the package, size of the package, release, package source url, license info, etc,.

This will help you to understand the package usage in simple way since it’s coming with package summary & Description. Run the below commands based on your distribution to get detailed information about given package.

### [YUM Command][5] : View Package Information On RHEL & CentOS Systems

YUM stands for Yellowdog Updater, Modified is an open-source command-line front-end package-management utility for RPM based systems such as Red Hat Enterprise Linux (RHEL) and CentOS.

Yum is the primary tool for getting, installing, deleting, querying, and managing RPM packages from distribution repositories, as well as other third-party repositories.
```
# yum info python
Loaded plugins: fastestmirror, security
Loading mirror speeds from cached hostfile
 * epel: epel.mirror.constant.com
Installed Packages
Name : python
Arch : x86_64
Version : 2.6.6
Release : 66.el6_8
Size : 78 k
Repo : installed
From repo : updates
Summary : An interpreted, interactive, object-oriented programming language
URL : http://www.python.org/
License : Python
Description : Python is an interpreted, interactive, object-oriented programming
 : language often compared to Tcl, Perl, Scheme or Java. Python includes
 : modules, classes, exceptions, very high level dynamic data types and
 : dynamic typing. Python supports interfaces to many system calls and
 : libraries, as well as to various windowing systems (X11, Motif, Tk,
 : Mac and MFC).
 :
 : Programmers can write new built-in modules for Python in C or C++.
 : Python can be used as an extension language for applications that need
 : a programmable interface.
 :
 : Note that documentation for Python is provided in the python-docs
 : package.
 :
 : This package provides the "python" executable; most of the actual
 : implementation is within the "python-libs" package.

```

### YUMDB Command : View Package Information On RHEL & CentOS Systems

Yumdb info provides information similar to yum info but additionally it provides package checksum data, type, user info (who installed the package). Since yum 3.2.26 yum has started storing additional information outside of the rpmdatabase (where user indicates it was installed by the user, and dep means it was brought in as a dependency).
```
# yumdb info python
Loaded plugins: fastestmirror
python-2.6.6-66.el6_8.x86_64
 changed_by = 4294967295
 checksum_data = 53c75a1756e5b4f6564c5229a37948c9b4561e0bf58076bd7dab7aff85a417f2
 checksum_type = sha256
 command_line = update -y
 from_repo = updates
 from_repo_revision = 1488370672
 from_repo_timestamp = 1488371100
 installed_by = 4294967295
 reason = dep
 releasever = 6


```

### [RPM Command][6] : View Package Information On RHEL/CentOS/Fedora Systems

RPM stands for Red Hat Package Manager is a powerful, command line Package Management utility for Red Hat based system such as (RHEL, CentOS, Fedora, openSUSE & Mageia) distributions. The utility allow you to install, upgrade, remove, query & verify the software on your Linux system/server. RPM files comes with .rpm extension. RPM package built with required libraries and dependency which will not conflicts other packages were installed on your system.
```
# rpm -qi nano
Name : nano Relocations: (not relocatable)
Version : 2.0.9 Vendor: CentOS
Release : 7.el6 Build Date: Fri 12 Nov 2010 02:18:36 AM EST
Install Date: Fri 03 Mar 2017 08:57:47 AM EST Build Host: c5b2.bsys.dev.centos.org
Group : Applications/Editors Source RPM: nano-2.0.9-7.el6.src.rpm
Size : 1588347 License: GPLv3+
Signature : RSA/8, Sun 03 Jul 2011 12:46:50 AM EDT, Key ID 0946fca2c105b9de
Packager : CentOS BuildSystem
URL : http://www.nano-editor.org
Summary : A small text editor
Description :
GNU nano is a small and friendly text editor.

```

### [DNF Command][7] : View Package Information On Fedora System

DNF stands for Dandified yum. We can tell DNF, the next generation of yum package manager (Fork of Yum) using hawkey/libsolv library for backend. Aleš Kozumplík started working on DNF since Fedora 18 and its implemented/launched in Fedora 22 finally. Dnf command is used to install, update, search & remove packages on Fedora 22 and later system. It automatically resolve dependencies and make it smooth package installation without any trouble.
```
$ dnf info tilix
Last metadata expiration check: 27 days, 10:00:23 ago on Wed 04 Oct 2017 06:43:27 AM IST.
Installed Packages
Name : tilix
Version : 1.6.4
Release : 1.fc26
Arch : x86_64
Size : 3.6 M
Source : tilix-1.6.4-1.fc26.src.rpm
Repo : @System
From repo : @commandline
Summary : Tiling terminal emulator
URL : https://github.com/gnunn1/tilix
License : MPLv2.0 and GPLv3+ and CC-BY-SA
Description : Tilix is a tiling terminal emulator with the following features:
 :
 : - Layout terminals in any fashion by splitting them horizontally or vertically
 : - Terminals can be re-arranged using drag and drop both within and between
 : windows
 : - Terminals can be detached into a new window via drag and drop
 : - Input can be synchronized between terminals so commands typed in one
 : terminal are replicated to the others
 : - The grouping of terminals can be saved and loaded from disk
 : - Terminals support custom titles
 : - Color schemes are stored in files and custom color schemes can be created by
 : simply creating a new file
 : - Transparent background
 : - Supports notifications when processes are completed out of view
 :
 : The application was written using GTK 3 and an effort was made to conform to
 : GNOME Human Interface Guidelines (HIG).

```

### [Zypper Command][8] : View Package Information On openSUSE System

Zypper is a command line package manager which makes use of libzypp. Zypper provides functions like repository access, dependency solving, package installation, etc.
```
$ zypper info nano

Loading repository data...
Reading installed packages...


Information for package nano:
-----------------------------
Repository : Main Repository (OSS)
Name : nano
Version : 2.4.2-5.3
Arch : x86_64
Vendor : openSUSE
Installed Size : 1017.8 KiB
Installed : No
Status : not installed
Source package : nano-2.4.2-5.3.src
Summary : Pico editor clone with enhancements
Description :
 GNU nano is a small and friendly text editor. It aims to emulate
 the Pico text editor while also offering a few enhancements.

```

### [pacman Command][9] : View Package Information On Arch Linux & Manjaro Systems

Pacman stands for package manager utility. pacman is a simple command-line utility to install, build, remove and manage Arch Linux packages. Pacman uses libalpm (Arch Linux Package Management (ALPM) library) as a back-end to perform all the actions.
```
$ pacman -Qi bash
Name : bash
Version : 4.4.012-2
Description : The GNU Bourne Again shell
Architecture : x86_64
URL : http://www.gnu.org/software/bash/bash.html
Licenses : GPL
Groups : base
Provides : sh
Depends On : readline>=7.0 glibc ncurses
Optional Deps : bash-completion: for tab completion
Required By : autoconf automake bison bzip2 ca-certificates-utils db
 dhcpcd diffutils e2fsprogs fakeroot figlet findutils
 flex freetype2 gawk gdbm gettext gmp grub gzip icu
 iptables keyutils libgpg-error libksba libpcap libpng
 libtool lvm2 m4 man-db mkinitcpio nano neofetch nspr
 nss openresolv os-prober pacman pcre pcre2 shadow
 systemd texinfo vte-common which xdg-user-dirs xdg-utils
 xfsprogs xorg-mkfontdir xorg-xpr xz
Optional For : None
Conflicts With : None
Replaces : None
Installed Size : 7.13 MiB
Packager : Jan Alexander Steffens (heftig)
Build Date : Tue 14 Feb 2017 01:16:51 PM UTC
Install Date : Thu 24 Aug 2017 06:08:12 AM UTC
Install Reason : Explicitly installed
Install Script : No
Validated By : Signature

```

### [Apt-Cache Command][10] : View Package Information On Debian/Ubuntu/Mint Systems

The apt-cache command can display much of the information stored in APT’s internal database. This information is a sort of cache since it is gathered from the different sources listed in the sources.list file. This happens during the apt update operation.
```
$ sudo apt-cache show apache2
Package: apache2
Priority: optional
Section: web
Installed-Size: 473
Maintainer: Ubuntu Developers
Original-Maintainer: Debian Apache Maintainers
Architecture: amd64
Version: 2.4.12-2ubuntu2
Replaces: apache2.2-common
Provides: httpd, httpd-cgi
Depends: lsb-base, procps, perl, mime-support, apache2-bin (= 2.4.12-2ubuntu2), apache2-utils (>= 2.4), apache2-data (= 2.4.12-2ubuntu2)
Pre-Depends: dpkg (>= 1.17.14)
Recommends: ssl-cert
Suggests: www-browser, apache2-doc, apache2-suexec-pristine | apache2-suexec-custom, ufw
Conflicts: apache2.2-common (<< 2.3~)
Filename: pool/main/a/apache2/apache2_2.4.12-2ubuntu2_amd64.deb
Size: 91348
MD5sum: ab0ee0b0d1c6b3d19bd87aa2a9537125
SHA1: 350c9a1a954906088ed032aebb77de3d5bb24004
SHA256: 03f515f7ebc3b67b050b06e82ebca34b5e83e34a528868498fce020bf1dbbe34
Description-en: Apache HTTP Server
 The Apache HTTP Server Project's goal is to build a secure, efficient and
 extensible HTTP server as standards-compliant open source software. The
 result has long been the number one web server on the Internet.
 .
 Installing this package results in a full installation, including the
 configuration files, init scripts and support scripts.
Description-md5: d02426bc360345e5acd45367716dc35c
Homepage: http://httpd.apache.org/
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Origin: Ubuntu
Supported: 9m
Task: lamp-server, mythbuntu-frontend, mythbuntu-desktop, mythbuntu-backend-slave, mythbuntu-backend-master, mythbuntu-backend-master

```

### [APT Command][11] : View Package Information On Debian/Ubuntu/Mint Systems

APT stands for Advanced Packaging Tool (APT) which is replacement for apt-get, like how DNF came to picture instead of YUM. It’s feature rich command-line tools with included all the futures in one command (APT) such as apt-cache, apt-search, dpkg, apt-cdrom, apt-config, apt-key, etc..,. and several other unique features. For example we can easily install .dpkg packages through APT but we can’t do through Apt-Get similar more features are included into APT command. APT-GET replaced by APT Due to lock of futures missing in apt-get which was not solved.
```
$ apt show nano
Package: nano
Version: 2.8.6-3
Priority: standard
Section: editors
Origin: Ubuntu
Maintainer: Ubuntu Developers
Original-Maintainer: Jordi Mallach
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 766 kB
Depends: libc6 (>= 2.14), libncursesw5 (>= 6), libtinfo5 (>= 6)
Suggests: spell
Conflicts: pico
Breaks: nano-tiny (<< 2.8.6-2)
Replaces: nano-tiny (<< 2.8.6-2), pico
Homepage: https://www.nano-editor.org/
Task: standard, ubuntu-touch-core, ubuntu-touch
Supported: 9m
Download-Size: 222 kB
APT-Manual-Installed: yes
APT-Sources: http://in.archive.ubuntu.com/ubuntu artful/main amd64 Packages
Description: small, friendly text editor inspired by Pico
 GNU nano is an easy-to-use text editor originally designed as a replacement
 for Pico, the ncurses-based editor from the non-free mailer package Pine
 (itself now available under the Apache License as Alpine).
 .
 However, GNU nano also implements many features missing in pico, including:
 - undo/redo
 - line numbering
 - syntax coloring
 - soft-wrapping of overlong lines
 - selecting text by holding Shift
 - interactive search and replace (with regular expression support)
 - a go-to line (and column) command
 - support for multiple file buffers
 - auto-indentation
 - tab completion of filenames and search terms
 - toggling features while running
 - and full internationalization support

```

### [dpkg Command][12] : View Package Information On Debian/Ubuntu/Mint Systems

dpkg stands for Debian package manager (dpkg). dpkg is a command-line tool to install, build, remove and manage Debian packages. dpkg uses Aptitude (primary and more user-friendly) as a front-end to perform all the actions. Other utility such as dpkg-deb and dpkg-query uses dpkg as a front-end to perform some action. Now a days most of the administrator using Apt, Apt-Get & Aptitude to manage packages easily without headache and its robust management too. Even though still we need to use dpkg to perform some software installation where it’s necessary.
```
$ dpkg -s python
Package: python
Status: install ok installed
Priority: optional
Section: python
Installed-Size: 626
Maintainer: Ubuntu Developers
Architecture: amd64
Multi-Arch: allowed
Source: python-defaults
Version: 2.7.14-2ubuntu1
Replaces: python-dev (<< 2.6.5-2)
Provides: python-ctypes, python-email, python-importlib, python-profiler, python-wsgiref
Depends: python2.7 (>= 2.7.14-1~), libpython-stdlib (= 2.7.14-2ubuntu1)
Pre-Depends: python-minimal (= 2.7.14-2ubuntu1)
Suggests: python-doc (= 2.7.14-2ubuntu1), python-tk (>= 2.7.14-1~)
Breaks: update-manager-core (<< 0.200.5-2)
Conflicts: python-central (<< 0.5.5)
Description: interactive high-level object-oriented language (default version)
 Python, the high-level, interactive object oriented language,
 includes an extensive class library with lots of goodies for
 network programming, system administration, sounds and graphics.
 .
 This package is a dependency package, which depends on Debian's default
 Python version (currently v2.7).
Homepage: http://www.python.org/
Original-Maintainer: Matthias Klose

```

Alternatively we can use `-p` option with dpkg that provides information similar to `dpkg -s` info but additionally it provides package checksum data and type.
```
$ dpkg -p python3
Package: python3
Priority: important
Section: python
Installed-Size: 67
Origin: Ubuntu
Maintainer: Ubuntu Developers
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Architecture: amd64
Multi-Arch: allowed
Source: python3-defaults
Version: 3.6.3-0ubuntu2
Replaces: python3-minimal (<< 3.1.2-2)
Provides: python3-profiler
Depends: python3.6 (>= 3.6.3-1~), libpython3-stdlib (= 3.6.3-0ubuntu2), dh-python
Pre-Depends: python3-minimal (= 3.6.3-0ubuntu2)
Suggests: python3-doc (>= 3.6.3-0ubuntu2), python3-tk (>= 3.6.3-1~), python3-venv (>= 3.6.3-0ubuntu2)
Filename: pool/main/p/python3-defaults/python3_3.6.3-0ubuntu2_amd64.deb
Size: 8712
MD5sum: a8bae494c6e5d1896287675faf40d373
Description: interactive high-level object-oriented language (default python3 version)
Original-Maintainer: Matthias Klose
SHA1: 2daec885cea7d4dc83c284301c3bebf42b23e095
SHA256: 865e509c91d2504a16c4b573dbe27e260c36fceec2add3fa43a30c1751d7e9bb
Homepage: http://www.python.org/
Task: minimal, ubuntu-core, ubuntu-core
Description-md5: 950ebd8122c0a7340f0a740c295b9eab
Supported: 9m

```

### Aptitude Command : View Package Information On Debian/Ubuntu/Mint Systems

aptitude is a text-based interface to the Debian GNU/Linux package system. It allows the user to view the list of packages and to perform package management tasks such as installing, upgrading, and removing packages. Actions may be performed from a visual interface or from the command-line.
```
$ aptitude show htop
Package: htop
Version: 2.0.2-1
State: installed
Automatically installed: no
Priority: optional
Section: universe/utils
Maintainer: Ubuntu Developers
Architecture: amd64
Uncompressed Size: 216 k
Depends: libc6 (>= 2.15), libncursesw5 (>= 6), libtinfo5 (>= 6)
Suggests: lsof, strace
Conflicts: htop:i386
Description: interactive processes viewer
 Htop is an ncursed-based process viewer similar to top, but it allows one to scroll the list vertically and horizontally to see all processes and their full command lines.

 Tasks related to processes (killing, renicing) can be done without entering their PIDs.
Homepage: http://hisham.hm/htop/

```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-view-detailed-information-about-a-package-in-linux/

作者：[Prakash Subramanian][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/prakash/
[1]:https://www.2daygeek.com/list-of-command-line-package-manager-for-linux/
[2]:https://www.2daygeek.com/list-of-graphical-frontend-tool-for-linux-package-manager/
[3]:https://www.2daygeek.com/how-to-search-if-a-package-is-available-on-your-linux-distribution-or-not/
[4]:https://www.2daygeek.com/how-to-add-enable-disable-a-repository-dnf-yum-config-manager-on-linux/
[5]:https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[6]:https://www.2daygeek.com/rpm-command-examples/
[7]:https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[8]:https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[9]:https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[10]:https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[11]:https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[12]:https://www.2daygeek.com/dpkg-command-to-manage-packages-on-debian-ubuntu-linux-mint-systems/
