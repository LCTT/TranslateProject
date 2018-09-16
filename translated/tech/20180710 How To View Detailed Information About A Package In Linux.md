
如何在 Linux 上检查一个软件包的详细信息
======

我们可以就这个已经被广泛讨论的话题写出大量的文章，大多数情况下，因为各种各样的原因，我们都愿意让<ruby>包管理器<rt>package manager</rt></ruby>来帮我们做这些事情。

每个 Linux 发行版都有自己的包管理器，并且每个都有各自有不同的特性，这些特性包括允许用户执行安装新软件包，删除无用的软件包，更新现存的软件包，搜索某些具体的软件包，以及更新整个系统到其最新的状态之类的操作。

习惯于命令行的用户大多数时间都会使用基于命令行方式的包管理器。对于 Linux 而言，这些基于命令行的包管理器有 `yum`、`dnf`、`rpm`、`apt`、`apt-get`、`dpkg`、`pacman` 和 `zypper`。

**推荐阅读**

-  [Linux 命令行包管理器列表及其用法][1]
-  [一个图形化的 Linux 包管理器前端工具][2]
-  [如何搜索知道一个软件包是否存在于你的 Linux 发行版][3]
-  [如何使用 dnf/yum 配置包管理器在 Linux 上来添加、启用和禁用软件仓库][4]

作为一个系统管理员你应该清楚地知道：安装包来自何方，具体来自哪个软件仓库，包的具体版本，包的大小，版本，包的源代码 URL，包的许可证信息，等等。

这篇短文将用尽可能简单的方式帮你从随包自带的总结和描述中了解该包的用法。按你所使用的 Linux 发行版的不同，运行下面相应的命令，你能得到你所使用的发行版下的包的详细信息。

### YUM 命令：在 RHEL 和 CentOS 系统上获得包的信息

[YUM][5] 英文直译是“<ruby>黄狗更新器--修改版<rt>Yellowdog Updater, Modified</rt></ruby>”，它是一个开源的基于命令行的包管理器前端实用工具。它被广泛应用在基于 RPM 的系统上，例如：RHEL 和 CentOS。

Yum 是用于在官方发行版仓库以及其他第三方发行版仓库下获取、安装、删除、查询 RPM 包的主要工具。

（LCTT 译注：用 `yum info` 获取 python 包的信息）

```
# yum info python
Loaded plugins: fastestmirror, security
Loading mirror speeds from cached hostfile
 * epel: epel.mirror.constant.com
Installed Packages
Name        : python
Arch        : x86_64
Version     : 2.6.6
Release     : 66.el6_8
Size        : 78 k
Repo        : installed
From repo   : updates
Summary     : An interpreted, interactive, object-oriented programming language
URL         : http://www.python.org/
License     : Python
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

### YUMDB 命令：查看 RHEL 和 CentOS 系统上的包信息

`yumdb info` 这个命令提供与 `yum info` 相类似的的信息，不过它还额外提供了诸如包校验值、包类型、用户信息（由何人安装）。从 yum 3.2.26 版本后，`yum` 开始在 rpm 数据库外储存额外的信息了（此处如显示 `user` 表明该包由用户安装，而 `dep` 说明该包是被作为被依赖的包而被安装的）。

（LCTT 译注：用 `yumdb info` 来获取 python 包的信息）

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

### RPM 命令：在 RHEL/CentOS/Fedora 系统上查看包的信息

[RPM][6] 英文直译为“<ruby>红帽包管理器<rt>Red Hat Package Manager</rt></ruby>”，这是一个在 RedHat 以及其变种发行版（如RHEL、CentOS、Fedora、openSUSE、Megeia）下的功能强大的命令行包管理工具。它能让你轻松的安装、升级、删除、查询以及校验你的系统或服务器上的软件。RPM 文件以 `.rpm` 结尾。RPM 包由它所依赖的软件库以及其他依赖构成，它不会与系统上已经安装的包冲突。

（LCTT 译注：用 `rpm -qi` 查询 nano 包的具体信息）

```
# rpm -qi nano
Name        : nano                         Relocations: (not relocatable)
Version     : 2.0.9                             Vendor: CentOS
Release     : 7.el6                         Build Date: Fri 12 Nov 2010 02:18:36 AM EST
Install Date: Fri 03 Mar 2017 08:57:47 AM EST      Build Host: c5b2.bsys.dev.centos.org
Group       : Applications/Editors          Source RPM: nano-2.0.9-7.el6.src.rpm
Size        : 1588347                          License: GPLv3+
Signature   : RSA/8, Sun 03 Jul 2011 12:46:50 AM EDT, Key ID 0946fca2c105b9de
Packager    : CentOS BuildSystem 
URL         : http://www.nano-editor.org
Summary     : A small text editor
Description :
GNU nano is a small and friendly text editor.
```

### DNF 命令：在 Fedora 系统上查看包信息

[DNF][7] 指“<ruby>时髦版的 Yum<rt>Dandified yum</rt></ruby>”，我们也可以认为 DNF 是下一代的 yum 包管理器（Yum 的一个分支），它在后台使用了 hawkey/libsolv 库。Aleš Kozumplík 在Fedora 18 上开始开发 DNF，在 Fedora 22 上正式最后发布。 `dnf` 命令用来在 Fedora 22 及以后的系统上安装、更新、搜索以及删除包。它能自动的解决包安装过程中的包依赖问题。

（LCTT 译注： 用 `dnf info` 查看 tilix 包信息）

```
$ dnf info tilix
Last metadata expiration check: 27 days, 10:00:23 ago on Wed 04 Oct 2017 06:43:27 AM IST.
Installed Packages
Name         : tilix
Version      : 1.6.4
Release      : 1.fc26
Arch         : x86_64
Size         : 3.6 M
Source       : tilix-1.6.4-1.fc26.src.rpm
Repo         : @System
From repo    : @commandline
Summary      : Tiling terminal emulator
URL          : https://github.com/gnunn1/tilix
License      : MPLv2.0 and GPLv3+ and CC-BY-SA
Description  : Tilix is a tiling terminal emulator with the following features:
             : 
             :  - Layout terminals in any fashion by splitting them horizontally or vertically
             :  - Terminals can be re-arranged using drag and drop both within and between
             :    windows
             :  - Terminals can be detached into a new window via drag and drop
             :  - Input can be synchronized between terminals so commands typed in one
             :    terminal are replicated to the others
             :  - The grouping of terminals can be saved and loaded from disk
             :  - Terminals support custom titles
             :  - Color schemes are stored in files and custom color schemes can be created by
             :    simply creating a new file
             :  - Transparent background
             :  - Supports notifications when processes are completed out of view
             : 
             : The application was written using GTK 3 and an effort was made to conform to
             : GNOME Human Interface Guidelines (HIG).
```

### Zypper 命令：在 openSUSE 系统上查看包信息

[zypper][8] 是一个使用 libzypp 库的命令行包管理器。`zypper` 提供诸如软件仓库访问，安装依赖解决，软件包安装等等功能。

（LCTT 译注： 用 `zypper info` 查询 nano 包的信息）

```
$ zypper info nano

Loading repository data...
Reading installed packages...


Information for package nano:
-----------------------------
Repository     : Main Repository (OSS)              
Name           : nano                               
Version        : 2.4.2-5.3                          
Arch           : x86_64                             
Vendor         : openSUSE                           
Installed Size : 1017.8 KiB                         
Installed      : No                                 
Status         : not installed                      
Source package : nano-2.4.2-5.3.src                 
Summary        : Pico editor clone with enhancements
Description    :                                    
    GNU nano is a small and friendly text editor. It aims to emulate
    the Pico text editor while also offering a few enhancements.
```

### Pacman 命令：在 ArchLinux 及 Manjaro 系统上查看包信息

[Pacman][9] 意即<ruby>包管理器<rt>package manager</rt></ruby>实用工具。`pacman` 是一个用于安装、构建、删除、管理 Arch Linux 上包的命令行工具。它后端使用 libalpm（Arch Linux package Manager（ALPM）库）来完成所有功能。

（LCTT 译注： 用 `pacman -Qi` 来查询 bash 包信息）

```
$ pacman -Qi bash
Name            : bash
Version         : 4.4.012-2
Description     : The GNU Bourne Again shell
Architecture    : x86_64
URL             : http://www.gnu.org/software/bash/bash.html
Licenses        : GPL
Groups          : base
Provides        : sh
Depends On      : readline>=7.0  glibc  ncurses
Optional Deps   : bash-completion: for tab completion
Required By     : autoconf  automake  bison  bzip2  ca-certificates-utils  db
                  dhcpcd  diffutils  e2fsprogs  fakeroot  figlet  findutils
                  flex  freetype2  gawk  gdbm  gettext  gmp  grub  gzip  icu
                  iptables  keyutils  libgpg-error  libksba  libpcap  libpng
                  libtool  lvm2  m4  man-db  mkinitcpio  nano  neofetch  nspr
                  nss  openresolv  os-prober  pacman  pcre  pcre2  shadow
                  systemd  texinfo  vte-common  which  xdg-user-dirs  xdg-utils
                  xfsprogs  xorg-mkfontdir  xorg-xpr  xz
Optional For    : None
Conflicts With  : None
Replaces        : None
Installed Size  : 7.13 MiB
Packager        : Jan Alexander Steffens (heftig) 
Build Date      : Tue 14 Feb 2017 01:16:51 PM UTC
Install Date    : Thu 24 Aug 2017 06:08:12 AM UTC
Install Reason  : Explicitly installed
Install Script  : No
Validated By    : Signature
```

### apt-cache 命令：在 Debian/Ubuntu/Mint 系统上查看包信息

[apt-cache][10] 命令能显示 apt 内部数据库中的大量信息。这些信息是从 `sources.list` 中的不同的软件源中搜集而来，因此从某种意义上这些信息也可以被认为是某种缓存。这些信息搜集工作是在运行 `apt update` 命令时执行的。

（LCTT 译注：用管理员权限查询 apache2 包的信息）

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

### APT 命令：查看 Debian/Ubuntu/Mint 系统上的包信息

[APT][11] 意为<ruby>高级打包工具<rt>Advanced Packaging Tool</rt></ruby>，就像 DNF 将如何替代 YUM 一样，APT 是 apt-get 的替代物。它功能丰富的命令行工具包括了如下所有命令的功能如 `apt-cache`、`apt-search`、`dpkg`、`apt-cdrom`、`apt-config`、`apt-key` 等等，我们可以方便的通过 `apt` 来安装 `.dpkg` 包，但是我们却不能通过 `apt-get` 来完成这一点，还有一些其他的类似的功能也不能用 `apt-get` 来完成，所以 `apt-get` 因为没有解决上述功能缺乏的原因而被 `apt` 所取代。

（LCTT 译注： 用 `apt show` 查看 nano 包信息）

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

### dpkg 命令：查看Debian/Ubuntu/Mint系统上的包信息


[dpkg][12] 意指 <ruby>Debian 包管理器<rt>Debian package manager</rt></ruby>。`dpkg` 是用于 Debian 系统上安装、构建、移除以及管理 Debian 包的命令行工具。`dpkg` 使用 `aptitude`（因为它更为主流及用户友好）作为前端工具来完成所有的功能。其他的工具如` dpkg-deb` 和 `dpkg-query` 使用 `dpkg` 做为前端来实现功能。尽管系统管理员还是时不时会在必要时使用 `dpkg` 来完成一些软件安装的任务，他大多数情况下还是会因为 `apt`、`apt-get` 以及 `aptitude` 的健壮性而使用后者。

（LCTT 译注： 用 `dpkg -s` 查看 python 包的信息）

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

我们也可使用 `dpkg` 的 `-p` 选项，这个选项提供和 `dpkg -s` 相类似的信息，但是它还提供了包的校验值和包类型。

（LCTT 译注： 用 `dpkg -p` 查看 python3 包的信息）

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

### aptitude 命令：查看 Debian/Ubuntu/Mint 系统上的包信息


`aptitude` 是 Debian GNU/Linux 包管理系统的文本界面。它允许用户查看已安装的包的列表，以及完成诸如安装、升级、删除包之类的包管理任务。这些管理行为也能从图形接口来执行。

（LCTT 译注： 用 `aptitude show` 查看 htop 包信息）

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
译者：[DavidChenLiang](https://github.com/davidchenliang)
校对：[wxy](https://github.com/wxy)

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
