
如何在Linux上检查一个包（package）的详细信息
======


我们可以就这个广泛讨论的话题写出大量的文档，大多数情况下，因为各种各样的原因，我们都愿意让包管理器（package manager）来帮我们做这些事情。

每个Linux发行版都有自己的包管理器，并且每个都有各自有不同的特性，这些特性包括允许用户执行安装新软件包，删除无用的软件包，更新现存的软件包，搜索某些具体的软件包，以及更新整个系统到其最新的状态之类的操作。

习惯于命令行的用户大多数时间都会使用基于命令行方式的包管理器。对于Linux而言，这些基于命令行的包管理器有Yum，Dnf, Rpm, Apt, Apt-Get, Deb, pacman 和zypper.


**推荐阅读**
**(#)** [List of Command line Package Managers For Linux & Usage][1]
**(#)** [A Graphical frontend tool for Linux Package Manager][2]
**(#)** [How To Search If A Package Is Available On Your Linux Distribution Or Not][3]
**(#)** [How To Add, Enable And Disable A Repository By Using The DNF/YUM Config Manager Command On Linux][4]


作为一个系统管理员你应该熟知以下事实：安装包来自何方，具体来自哪个软件仓库，包的具体版本，包的大小，发行版的版本，包的源URL，包的许可证信息，等等等等。


这篇短文将用尽可能简单的方式帮你理解包管理器的用法，这些用法正是来自随包自带的总结和描述文件。按你所使用的Linux发行版的不同，运行下面相应的命令，你能得到你所使用的发行版下的包的详细信息。

### [YUM 命令][5] : 在RHEL和CentOS系统上获得包的信息


YUM 英文直译是黄狗更新器--修改版，它是一个开源的基于命令行的包管理器前端实用工具。它被广泛应用在基于RPM的系统上，例如：RHEL和CentOS。

Yum是用于在官方发行版仓库以及其他第三方发行版仓库下获取，安装，删除，查询RPM包的主要工具。

```
# yum info python（译注：用yum info 获取python包的信息）
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

### YUMDB 命令： 查看RHEL和CentOS系统上的包信息


Yumdb info这个命令提供与yum info相类似的的信息，不过它还额外提供了诸如包校验值，包类型，用户信息（由何人安装）。从yum 3.2.26版本后，yum开始在rpm数据库外储存额外的信息了（下文输出的用户信息指该python由该用户安装，而dep说明该包是被作为被依赖的包而被安装的）。

```
# yumdb info python（译注：用yumdb info 来获取Python的信息）
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

### [RPM 命令][6] : 在RHEL/CentOS/Fedora系统上查看包的信息


RPM 英文直译为红帽包管理器，这是一个在RedHat以及其变种发行版（如RHEL， CentOS， Fedora， openSUSE，Megeia）下的功能强大的命令行包管理工具。它能让你轻松的安装，升级，删除，查询以及校验你的系统或服务器上的软件。RPM文件以.rpm结尾。RPM包由它所依赖的软件库以及其他依赖构成，它不会与系统上已经安装的包冲突。

```
# rpm -qi nano （译注：用RPM -qi 查询nano包的具体信息）
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

### [DNF 命令][7] : 在Fedora系统上查看报信息


DNF指时髦版的Yum,我们也可以认为DNF是下一代的YUM包管理器（Yum的一个分支），它在后台使用了hawkey/libsolv库。Aleš Kozumplík在Fedora 18上开始开发DNF，在Fedora 22上正式最后发布。 DNF命令用来在Fedora 22及以后系统安装， 更新，搜索以及删除包。它能自动的解决包安装过程中的包依赖问题。

```
$ dnf info tilix （译注： 用dnf info 查看tilix的包信息）
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

### [Zypper 命令][8] : 在openSUSE系统上查看包信息


Zypper是一个使用libzypp库的命令行包管理器。Zypper提供诸如软件仓库访问，安装依赖解决，软件包安装等等功能。

```
$ zypper info nano （译注： 用zypper info查询nano的信息）

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

### [pacman 命令][9] ：在ArchLinux及Manjaro系统上查看包信息

Pacman指包管理器实用工具。pacman是一个用于安装，构建，删除，管理Arch Linux上包的命令行工具。它后端使用libalpm(Arch Linux package Manager（ALPM）库)来完成所有功能。

```
$ pacman -Qi bash （译注： 用pacman -Qi 来查询bash）
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

### [Apt-Cache 命令][10] ：在Debian/Ubuntu/Mint系统上查看包信息


apt-cache命令能显示Apt内部数据库中的大量信息。这些信息是从sources.list中的不同的软件源中搜集而来，因此从某种意义上这些信息也可以被认为是某种缓存。
这些信息搜集工作是在运行apt update命令时执行的。

```
$ sudo apt-cache show apache2 （译注：用管理员权限查询apache2的信息）
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

### [APT 命令][11] : 查看Debian/Ubuntu/Mint系统上的包信息


APT意为高级打包工具，就像DNF将如何替代YUM一样，APT是apt-get的替代物。它功能丰富的命令行工具包括了如下所有命令的功能如apt-cache,apt-search,dpkg, apt-cdrom, apt-config, apt-key等等，我们可以方便的通过apt来安装.dpkg包，但是我们却不能通过apt-get来完成这一点，还有一些其他的类似的功能也不能用apt-get来完成，所以apt-get因为没有解决上述功能缺乏的原因而被apt所取代。

```
$ apt show nano （译注： 用apt show查看nano）
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

### [dpkg 命令][12] : 查看Debian/Ubuntu/Mint系统上的包信息


dpkg意指Debian包管理器（dpkg）。dpkg用于Debian系统上的安装，构建，移除以及管理Debian包的命令行工具。dpkg 使用Aptitude（因为它更为主流及用户友好）作为前端工具来完成所有的功能。其他的工具如dpkg-deb和dpkg-query使用dpkg做为前端来实现功能。尽管系统管理员还是时不时会在必要时使用dpkg来完成一些软件安装的任务，他大多数情况下还是会因为APt，Apt-Get以及Aptitude的健壮性而使用后者。

```
$ dpkg -s python （译注： 用dpkg -s查看python）
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


我们也可使用dpkg的‘-p’选项，这个选项提供和‘dpkg -s’相类似的信息，但是它还提供了包的校验值和包类型。

```
$ dpkg -p python3 （译注： 用dpkg -p查看python3的信息）
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

### Aptitude 命令 : 查看Debian/Ubuntu/Mint 系统上的包信息


aptitude是Debian GNU/Linux包管理系统的面向文本的接口。它允许用户查看已安装的包的列表，以及完成诸如安装，升级，删除包之类的包管理任务。这些管理行为也能从图形接口来执行。

```
$ aptitude show htop （译注： 用aptitude show查看htop信息）
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
译者：[DavidChenLiang](https://github.com/davidchenliang)
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
