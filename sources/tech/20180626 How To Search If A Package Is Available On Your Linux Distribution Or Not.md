How To Search If A Package Is Available On Your Linux Distribution Or Not
======
You can directly install the require package which you want if you know the package name.

In some cases, if you don’t know the exact package name or you want to search some packages then you can easily search that package with help of distribution package manager.

Searches automatically include both installed and available packages.

The format of the results depends upon the option. If the query produces no information, there are no packages matching the criteria.

This can be done through distribution package managers with variety of options.

I had added all the possible options in this article and you can select which is the best and suitable for you.

Alternatively we can achieve this through **whohas** command. This will search the given package to all the major distributions (such as Debian, Ubuntu, Fedora, etc.,) not only your own system distribution.

**Suggested Read :**
**(#)** [List of Command line Package Managers For Linux & Usage][1]
**(#)** [A Graphical frontend tool for Linux Package Manager][2]

### How to Search a Package in Debian/Ubuntu

We can use apt, apt-cache and aptitude package managers to find a given package on Debian based distributions. I had included vast of options with this package managers.

We can done this on three ways in Debian based systems.

  * apt command
  * apt-cache command
  * aptitude command



### How to search a package using apt command

APT stands for Advanced Packaging Tool (APT) which is replacement for apt-get. It’s feature rich command-line tools with included all the futures in one command (APT) such as apt-cache, apt-search, dpkg, apt-cdrom, apt-config, apt-key, etc..,. and several other unique features.

APT is a powerful command-line tool for installing, downloading, removing, searching and managing as well as querying information about packages as a low-level access to all features of the libapt-pkg library. It’s contains some less used command-line utilities related to package management.
```
$ apt -q list nano vlc
Listing...
nano/artful,now 2.8.6-3 amd64 [installed]
vlc/artful 2.2.6-6 amd64

```

Alternatively we can search a given package using below format.
```
$ apt search ^vlc
Sorting... Done
Full Text Search... Done
vlc/artful 2.2.6-6 amd64
 multimedia player and streamer

vlc-bin/artful 2.2.6-6 amd64
 binaries from VLC

vlc-data/artful,artful 2.2.6-6 all
 Common data for VLC

vlc-l10n/artful,artful 2.2.6-6 all
 Translations for VLC

vlc-plugin-access-extra/artful 2.2.6-6 amd64
 multimedia player and streamer (extra access plugins)

vlc-plugin-base/artful 2.2.6-6 amd64
 multimedia player and streamer (base plugins)

```

### How to search a package using apt-cache command

apt-cache performs a variety of operations on APT’s package cache. Displays information about the given packages. apt-cache does not manipulate the state of the system but does provide operations to search and generate interesting output from the package metadata.
```
$ apt-cache search nano | grep ^nano
nano - small, friendly text editor inspired by Pico
nano-tiny - small, friendly text editor inspired by Pico - tiny build
nanoblogger - Small weblog engine for the command line
nanoblogger-extra - Nanoblogger plugins
nanoc - static site generator written in Ruby
nanoc-doc - static site generator written in Ruby - documentation
nanomsg-utils - nanomsg utilities
nanopolish - consensus caller for nanopore sequencing data

```

Alternatively we can search a given package using below format.
```
$ apt-cache policy vlc
vlc:
 Installed: (none)
 Candidate: 2.2.6-6
 Version table:
 2.2.6-6 500
 500 http://in.archive.ubuntu.com/ubuntu artful/universe amd64 Packages

```

Alternatively we can search a given package using below format.
```
$ apt-cache pkgnames vlc
vlc-bin
vlc-plugin-video-output
vlc-plugin-sdl
vlc-plugin-svg
vlc-plugin-samba
vlc-plugin-fluidsynth
vlc-plugin-qt
vlc-plugin-skins2
vlc-plugin-visualization
vlc-l10n
vlc-plugin-notify
vlc-plugin-zvbi
vlc-plugin-vlsub
vlc-plugin-jack
vlc-plugin-access-extra
vlc
vlc-data
vlc-plugin-video-splitter
vlc-plugin-base

```

### How to search a package using aptitude command

aptitude is a text-based interface to the Debian GNU/Linux package system. It allows the user to view the list of packages and to perform package management tasks such as installing, upgrading, and removing packages. Actions may be performed from a visual interface or from the command-line.
```
$ aptitude search ^vlc
p vlc - multimedia player and streamer
p vlc:i386 - multimedia player and streamer
p vlc-bin - binaries from VLC
p vlc-bin:i386 - binaries from VLC
p vlc-data - Common data for VLC
v vlc-data:i386 -
p vlc-l10n - Translations for VLC
v vlc-l10n:i386 -
p vlc-plugin-access-extra - multimedia player and streamer (extra access plugins)
p vlc-plugin-access-extra:i386 - multimedia player and streamer (extra access plugins)
p vlc-plugin-base - multimedia player and streamer (base plugins)
p vlc-plugin-base:i386 - multimedia player and streamer (base plugins)
p vlc-plugin-fluidsynth - FluidSynth plugin for VLC
p vlc-plugin-fluidsynth:i386 - FluidSynth plugin for VLC
p vlc-plugin-jack - Jack audio plugins for VLC
p vlc-plugin-jack:i386 - Jack audio plugins for VLC
p vlc-plugin-notify - LibNotify plugin for VLC
p vlc-plugin-notify:i386 - LibNotify plugin for VLC
p vlc-plugin-qt - multimedia player and streamer (Qt plugin)
p vlc-plugin-qt:i386 - multimedia player and streamer (Qt plugin)
p vlc-plugin-samba - Samba plugin for VLC
p vlc-plugin-samba:i386 - Samba plugin for VLC
p vlc-plugin-sdl - SDL video and audio output plugin for VLC
p vlc-plugin-sdl:i386 - SDL video and audio output plugin for VLC
p vlc-plugin-skins2 - multimedia player and streamer (Skins2 plugin)
p vlc-plugin-skins2:i386 - multimedia player and streamer (Skins2 plugin)
p vlc-plugin-svg - SVG plugin for VLC
p vlc-plugin-svg:i386 - SVG plugin for VLC
p vlc-plugin-video-output - multimedia player and streamer (video output plugins)
p vlc-plugin-video-output:i386 - multimedia player and streamer (video output plugins)
p vlc-plugin-video-splitter - multimedia player and streamer (video splitter plugins)
p vlc-plugin-video-splitter:i386 - multimedia player and streamer (video splitter plugins)
p vlc-plugin-visualization - multimedia player and streamer (visualization plugins)
p vlc-plugin-visualization:i386 - multimedia player and streamer (visualization plugins)
p vlc-plugin-vlsub - VLC extension to download subtitles from opensubtitles.org
p vlc-plugin-zvbi - VBI teletext plugin for VLC
p vlc-plugin-zvbi:i386

```

### How to Search a Package in RHEL/CentOS

Yum (Yellowdog Updater Modified) is one of the package manager utility in Linux operating system. Yum command is used to install, update, search & remove packages on some Linux distributions based on RedHat.
```
# yum search ftpd
Loaded plugins: fastestmirror, refresh-packagekit, security
Loading mirror speeds from cached hostfile
 * base: centos.hyve.com
 * epel: mirrors.coreix.net
 * extras: centos.hyve.com
 * rpmforge: www.mirrorservice.org
 * updates: mirror.sov.uk.goscomb.net
============================================================== N/S Matched: ftpd ===============================================================
nordugrid-arc-gridftpd.x86_64 : ARC gridftp server
pure-ftpd.x86_64 : Lightweight, fast and secure FTP server
vsftpd.x86_64 : Very Secure Ftp Daemon

 Name and summary matches only, use "search all" for everything.

```

Alternatively we can search the same using below command.
```
# yum list ftpd

```

### How to Search a Package in Fedora

DNF stands for Dandified yum. We can tell DNF, the next generation of yum package manager (Fork of Yum) using hawkey/libsolv library for backend. Aleš Kozumplík started working on DNF since Fedora 18 and its implemented/launched in Fedora 22 finally.
```
# dnf search ftpd
Last metadata expiration check performed 0:42:28 ago on Tue Jun 9 22:52:44 2018.
============================== N/S Matched: ftpd ===============================
proftpd-utils.x86_64 : ProFTPD - Additional utilities
pure-ftpd-selinux.x86_64 : SELinux support for Pure-FTPD
proftpd-devel.i686 : ProFTPD - Tools and header files for developers
proftpd-devel.x86_64 : ProFTPD - Tools and header files for developers
proftpd-ldap.x86_64 : Module to add LDAP support to the ProFTPD FTP server
proftpd-mysql.x86_64 : Module to add MySQL support to the ProFTPD FTP server
proftpd-postgresql.x86_64 : Module to add PostgreSQL support to the ProFTPD FTP
 : server
vsftpd.x86_64 : Very Secure Ftp Daemon
proftpd.x86_64 : Flexible, stable and highly-configurable FTP server
owfs-ftpd.x86_64 : FTP daemon providing access to 1-Wire networks
perl-ftpd.noarch : Secure, extensible and configurable Perl FTP server
pure-ftpd.x86_64 : Lightweight, fast and secure FTP server
pyftpdlib.noarch : Python FTP server library
nordugrid-arc-gridftpd.x86_64 : ARC gridftp server

```

Alternatively we can search the same using below command.
```
# dnf list proftpd
Failed to synchronize cache for repo 'heikoada-terminix', disabling.
Last metadata expiration check: 0:08:02 ago on Tue 26 Jun 2018 04:30:05 PM IST.
Available Packages
proftpd.x86_64

```

### How to Search a Package in Arch Linux

pacman stands for package manager utility (pacman). pacman is a command-line utility to install, build, remove and manage Arch Linux packages. pacman uses libalpm (Arch Linux Package Management (ALPM) library) as a back-end to perform all the actions.

In my case, i’m going to search chromium package.
```
# pacman -Ss chromium
extra/chromium 48.0.2564.116-1
 The open-source project behind Google Chrome, an attempt at creating a safer, faster, and more stable browser
extra/qt5-webengine 5.5.1-9 (qt qt5)
 Provides support for web applications using the Chromium browser project
community/chromium-bsu 0.9.15.1-2
 A fast paced top scrolling shooter
community/chromium-chromevox latest-1
 Causes the Chromium web browser to automatically install and update the ChromeVox screen reader extention. Note: This
 package does not contain the extension code.
community/fcitx-mozc 2.17.2313.102-1
 Fcitx Module of A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese
 Input)

```

By default `-s`‘s builtin ERE (Extended Regular Expressions) can cause a lot of unwanted results. Use the following format to match the package name only.
```
# pacman -Ss '^chromium-'

```

pkgfile is a tool for searching files from packages in the Arch Linux official repositories.
```
# pkgfile chromium

```

### How to Search a Package in openSUSE

Zypper is a command line package manager for suse & openSUSE distributions. It’s used to install, update, search & remove packages & manage repositories, perform various queries, and more. Zypper command-line interface to ZYpp system management library (libzypp).
```
# zypper search ftp
or
# zypper se ftp
Loading repository data...
Reading installed packages...
S | Name | Summary | Type
--+----------------+-----------------------------------------+--------
 | proftpd | Highly configurable GPL-licensed FTP -> | package
 | proftpd-devel | Development files for ProFTPD | package
 | proftpd-doc | Documentation for ProFTPD | package
 | proftpd-lang | Languages for package proftpd | package
 | proftpd-ldap | LDAP Module for ProFTPD | package
 | proftpd-mysql | MySQL Module for ProFTPD | package
 | proftpd-pgsql | PostgreSQL Module for ProFTPD | package
 | proftpd-radius | Radius Module for ProFTPD | package
 | proftpd-sqlite | SQLite Module for ProFTPD | package
 | pure-ftpd | A Lightweight, Fast, and Secure FTP S-> | package
 | vsftpd | Very Secure FTP Daemon - Written from-> | package

```

### How to Search a Package using whohas command

whohas command such a intelligent tools which search a given package to all the major distributions such as Debian, Ubuntu, Gentoo, Arch, AUR, Mandriva, Fedora, Fink, FreeBSD, NetBSD.
```
$ whohas nano
Mandriva nano-debug 2.3.1-1mdv2010.2.x http://sophie.zarb.org/rpms/0b33dc73bca710749ad14bbc3a67e15a
Mandriva nano-debug 2.2.4-1mdv2010.1.i http://sophie.zarb.org/rpms/d9dfb2567681e09287b27e7ac6cdbc05
Mandriva nano-debug 2.2.4-1mdv2010.1.x http://sophie.zarb.org/rpms/3299516dbc1538cd27a876895f45aee4
Mandriva nano 2.3.1-1mdv2010.2.x http://sophie.zarb.org/rpms/98421c894ee30a27d9bd578264625220
Mandriva nano 2.3.1-1mdv2010.2.i http://sophie.zarb.org/rpms/cea07b5ef9aa05bac262fc7844dbd223
Mandriva nano 2.2.4-1mdv2010.1.s http://sophie.zarb.org/rpms/d61f9341b8981e80424c39c3951067fa
Mandriva spring-mod-nanoblobs 0.65-2mdv2010.0.sr http://sophie.zarb.org/rpms/74bb369d4cbb4c8cfe6f6028e8562460
Mandriva nanoxml-lite 2.2.3-4.1.4mdv2010 http://sophie.zarb.org/rpms/287a4c37bc2a39c0f277b0020df47502
Mandriva nanoxml-manual-lite 2.2.3-4.1.4mdv2010 http://sophie.zarb.org/rpms/17dc4f638e5e9964038d4d26c53cc9c6
Mandriva nanoxml-manual 2.2.3-4.1.4mdv2010 http://sophie.zarb.org/rpms/a1b5092cd01fc8bb78a0f3ca9b90370b
Gentoo nano 9999 http://packages.gentoo.org/package/app-editors/nano
Gentoo nano 9999 http://packages.gentoo.org/package/app-editors/nano
Gentoo nano 2.9.8 http://packages.gentoo.org/package/app-editors/nano
Gentoo nano 2.9.7 http://packages.gentoo.org/package/app-editors/nano

```

If you want to search a given package to only current distribution repository, use the below format.
```
$ whohas -d Ubuntu vlc
Ubuntu vlc 2.1.6-0ubuntu14.04 1M all http://packages.ubuntu.com/trusty/vlc
Ubuntu vlc 2.1.6-0ubuntu14.04 1M all http://packages.ubuntu.com/trusty-updates/vlc
Ubuntu vlc 2.2.2-5ubuntu0.16. 1M all http://packages.ubuntu.com/xenial/vlc
Ubuntu vlc 2.2.2-5ubuntu0.16. 1M all http://packages.ubuntu.com/xenial-updates/vlc
Ubuntu vlc 2.2.6-6 40K all http://packages.ubuntu.com/artful/vlc
Ubuntu vlc 3.0.1-3build1 32K all http://packages.ubuntu.com/bionic/vlc
Ubuntu vlc 3.0.2-0ubuntu0.1 32K all http://packages.ubuntu.com/bionic-updates/vlc
Ubuntu vlc 3.0.3-1 33K all http://packages.ubuntu.com/cosmic/vlc
Ubuntu browser-plugin-vlc 2.0.6-2 55K all http://packages.ubuntu.com/trusty/browser-plugin-vlc
Ubuntu browser-plugin-vlc 2.0.6-4 47K all http://packages.ubuntu.com/xenial/browser-plugin-vlc
Ubuntu browser-plugin-vlc 2.0.6-4 47K all http://packages.ubuntu.com/artful/browser-plugin-vlc
Ubuntu browser-plugin-vlc 2.0.6-4 47K all http://packages.ubuntu.com/bionic/browser-plugin-vlc
Ubuntu browser-plugin-vlc 2.0.6-4 47K all http://packages.ubuntu.com/cosmic/browser-plugin-vlc
Ubuntu libvlc-bin 2.2.6-6 27K all http://packages.ubuntu.com/artful/libvlc-bin
Ubuntu libvlc-bin 3.0.1-3build1 17K all http://packages.ubuntu.com/bionic/libvlc-bin
Ubuntu libvlc-bin 3.0.2-0ubuntu0.1 17K all http://packages.ubuntu.com/bionic-updates/libvlc-bin

```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-search-if-a-package-is-available-on-your-linux-distribution-or-not/

作者：[Prakash Subramanian][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/prakash/
[1]:https://www.2daygeek.com/list-of-command-line-package-manager-for-linux/
[2]:https://www.2daygeek.com/list-of-graphical-frontend-tool-for-linux-package-manager/
