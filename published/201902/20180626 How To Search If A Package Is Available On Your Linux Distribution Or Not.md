如何搜索一个包是否在你的 Linux 发行版中
======

如果你知道包名称，那么你可以直接安装所需的包。

在某些情况下，如果你不知道确切的包名称或者你想搜索某些包，那么你可以在发行版的包管理器的帮助下轻松搜索该包。搜索会自动包括已安装和可用的包。结果的格式取决于选项。如果你的查询没有输出任何信息，那么意味着没有匹配条件的包。这可以通过发行版的包管理器的各种选项来完成。我已经在本文中添加了所有可能的选项，你可以选择最好的和最合适你的选项。

或者，我们可以通过 `whohas` 命令实现这一点。它会从所有的主流发行版（例如 Debian、Ubuntu、 Fedora 等）中搜索，而不仅仅是你自己的系统发行版。

建议阅读：

- [适用于 Linux 的命令行包管理器列表以及用法][1]
- [Linux 包管理器的图形前端工具][2]

### 如何在 Debian/Ubuntu 中搜索一个包

我们可以使用 `apt`、`apt-cache` 和 `aptitude` 包管理器在基于 Debian 的发行版上查找给定的包。我为这个包管理器中包括了大量的选项。

我们可以在基于 Debian 的系统中使用三种方式完成此操作。

  * `apt` 命令
  * `apt-cache` 命令
  * `aptitude` 命令

#### 如何使用 apt 命令搜索一个包

APT 代表<ruby>高级包管理工具<rt>Advanced Packaging Tool</rt></ruby>（APT），它取代了 `apt-get`。它有功能丰富的命令行工具，包括所有功能包含在一个命令（`apt`）里，包括 `apt-cache`、`apt-search`、`dpkg`、`apt-cdrom`、`apt-config`、`apt-key` 等，还有其他几个独特的功能。

APT 是一个强大的命令行工具，它可以访问 libapt-pkg 底层库的所有特性，它可以用于安装、下载、删除、搜索和管理以及查询包的信息，另外它还包含一些较少使用的与包管理相关的命令行实用程序。

```
$ apt -q list nano vlc
Listing...
nano/artful,now 2.8.6-3 amd64 [installed]
vlc/artful 2.2.6-6 amd64
```

或者，我们可以使用以下格式搜索指定的包。

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

#### 如何使用 apt-cache 命令搜索一个包

`apt-cache` 会在 APT 的包缓存上执行各种操作。它会显示有关指定包的信息。`apt-cache` 不会改变系统的状态，但提供了从包的元数据中搜索和生成有趣输出的操作。

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

或者，我们可以使用以下格式搜索指定的包。

```
$ apt-cache policy vlc
vlc:
  Installed: (none)
  Candidate: 2.2.6-6
  Version table:
     2.2.6-6 500
        500 http://in.archive.ubuntu.com/ubuntu artful/universe amd64 Packages
```

或者，我们可以使用以下格式搜索给定的包。

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

#### 如何使用 aptitude 命令搜索一个包

`aptitude` 是一个基于文本的 Debian GNU/Linux 软件包系统的命令行界面。它允许用户查看包列表，并执行包管理任务，例如安装、升级和删除包，它可以从可视化界面或命令行执行操作。

```
$ aptitude search ^vlc
p   vlc                                                                                               - multimedia player and streamer                                                                             
p   vlc:i386                                                                                          - multimedia player and streamer                                                                             
p   vlc-bin                                                                                           - binaries from VLC                                                                                          
p   vlc-bin:i386                                                                                      - binaries from VLC                                                                                          
p   vlc-data                                                                                          - Common data for VLC                                                                                        
v   vlc-data:i386                                                                                     -                                                                                                            
p   vlc-l10n                                                                                          - Translations for VLC                                                                                       
v   vlc-l10n:i386                                                                                     -                                                                                                            
p   vlc-plugin-access-extra                                                                           - multimedia player and streamer (extra access plugins)                                                      
p   vlc-plugin-access-extra:i386                                                                      - multimedia player and streamer (extra access plugins)                                                      
p   vlc-plugin-base                                                                                   - multimedia player and streamer (base plugins)                                                              
p   vlc-plugin-base:i386                                                                              - multimedia player and streamer (base plugins)                                                              
p   vlc-plugin-fluidsynth                                                                             - FluidSynth plugin for VLC                                                                                  
p   vlc-plugin-fluidsynth:i386                                                                        - FluidSynth plugin for VLC                                                                                  
p   vlc-plugin-jack                                                                                   - Jack audio plugins for VLC                                                                                 
p   vlc-plugin-jack:i386                                                                              - Jack audio plugins for VLC                                                                                 
p   vlc-plugin-notify                                                                                 - LibNotify plugin for VLC                                                                                   
p   vlc-plugin-notify:i386                                                                            - LibNotify plugin for VLC                                                                                   
p   vlc-plugin-qt                                                                                     - multimedia player and streamer (Qt plugin)                                                                 
p   vlc-plugin-qt:i386                                                                                - multimedia player and streamer (Qt plugin)                                                                 
p   vlc-plugin-samba                                                                                  - Samba plugin for VLC                                                                                       
p   vlc-plugin-samba:i386                                                                             - Samba plugin for VLC                                                                                       
p   vlc-plugin-sdl                                                                                    - SDL video and audio output plugin for VLC                                                                  
p   vlc-plugin-sdl:i386                                                                               - SDL video and audio output plugin for VLC                                                                  
p   vlc-plugin-skins2                                                                                 - multimedia player and streamer (Skins2 plugin)                                                             
p   vlc-plugin-skins2:i386                                                                            - multimedia player and streamer (Skins2 plugin)                                                             
p   vlc-plugin-svg                                                                                    - SVG plugin for VLC                                                                                         
p   vlc-plugin-svg:i386                                                                               - SVG plugin for VLC                                                                                         
p   vlc-plugin-video-output                                                                           - multimedia player and streamer (video output plugins)                                                      
p   vlc-plugin-video-output:i386                                                                      - multimedia player and streamer (video output plugins)                                                      
p   vlc-plugin-video-splitter                                                                         - multimedia player and streamer (video splitter plugins)                                                    
p   vlc-plugin-video-splitter:i386                                                                    - multimedia player and streamer (video splitter plugins)                                                    
p   vlc-plugin-visualization                                                                          - multimedia player and streamer (visualization plugins)                                                     
p   vlc-plugin-visualization:i386                                                                     - multimedia player and streamer (visualization plugins)                                                     
p   vlc-plugin-vlsub                                                                                  - VLC extension to download subtitles from opensubtitles.org                                                 
p   vlc-plugin-zvbi                                                                                   - VBI teletext plugin for VLC                                                                                
p   vlc-plugin-zvbi:i386 
```

### 如何在 RHEL/CentOS 中搜索一个包

Yum（Yellowdog Updater Modified）是 Linux 操作系统中的包管理器实用程序之一。Yum 命令用于在一些基于 RedHat 的 Linux 发行版上，它用来安装、更新、搜索和删除软件包。

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

或者，我们可以使用以下命令搜索相同内容。

```
# yum list ftpd
```

### 如何在 Fedora 中搜索一个包

DNF 代表 Dandified yum。我们可以说 DNF 是下一代 yum 包管理器（Yum 的衍生品），它使用 hawkey/libsolv 库作为底层。Aleš Kozumplík 从 Fedora 18 开始开发 DNF，最终在 Fedora 22 中发布。

```
# dnf search ftpd
Last metadata expiration check performed 0:42:28 ago on Tue Jun  9 22:52:44 2018.
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

或者，我们可以使用以下命令搜索相同的内容。

```
# dnf list proftpd
Failed to synchronize cache for repo 'heikoada-terminix', disabling.
Last metadata expiration check: 0:08:02 ago on Tue 26 Jun 2018 04:30:05 PM IST.
Available Packages
proftpd.x86_64
```

### 如何在 Arch Linux 中搜索一个包

pacman 代表包管理实用程序（pacman）。它是一个用于安装、构建、删除和管理 Arch Linux 软件包的命令行实用程序。pacman 使用 libalpm（Arch Linux Package Management（ALPM）库）作为底层来执行所有操作。

在本例中，我将要搜索 chromium 包。

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

默认情况下，`-s` 选项内置 ERE（扩展正则表达式）会导致很多不需要的结果。使用以下格式会仅匹配包名称。

```
# pacman -Ss '^chromium-'
```

`pkgfile` 是一个用于在 Arch Linux 官方仓库的包中搜索文件的工具。

```
# pkgfile chromium
```

### 如何在 openSUSE 中搜索一个包

Zypper 是 SUSE 和 openSUSE 发行版的命令行包管理器。它用于安装、更新、搜索和删除包以及管理仓库，执行各种查询等。Zypper 命令行对接到 ZYpp 系统管理库（libzypp）。

```
# zypper search ftp
or
# zypper se ftp
Loading repository data...
Reading installed packages...
S | Name           | Summary                                 | Type   
--+----------------+-----------------------------------------+--------
  | proftpd        | Highly configurable GPL-licensed FTP -> | package
  | proftpd-devel  | Development files for ProFTPD           | package
  | proftpd-doc    | Documentation for ProFTPD               | package
  | proftpd-lang   | Languages for package proftpd           | package
  | proftpd-ldap   | LDAP Module for ProFTPD                 | package
  | proftpd-mysql  | MySQL Module for ProFTPD                | package
  | proftpd-pgsql  | PostgreSQL Module for ProFTPD           | package
  | proftpd-radius | Radius Module for ProFTPD               | package
  | proftpd-sqlite | SQLite Module for ProFTPD               | package
  | pure-ftpd      | A Lightweight, Fast, and Secure FTP S-> | package
  | vsftpd         | Very Secure FTP Daemon - Written from-> | package
```

### 如何使用 whohas 命令搜索一个包

`whohas` 命令是一个智能工具，从所有主流发行版中搜索指定包，如 Debian、Ubuntu、Gentoo、Arch、AUR、Mandriva、Fedora、Fink、FreeBSD 和 NetBSD。

```
$ whohas nano
Mandriva        nano-debug                         2.3.1-1mdv2010.2.x                                           http://sophie.zarb.org/rpms/0b33dc73bca710749ad14bbc3a67e15a
Mandriva        nano-debug                         2.2.4-1mdv2010.1.i                                           http://sophie.zarb.org/rpms/d9dfb2567681e09287b27e7ac6cdbc05
Mandriva        nano-debug                         2.2.4-1mdv2010.1.x                                           http://sophie.zarb.org/rpms/3299516dbc1538cd27a876895f45aee4
Mandriva        nano                               2.3.1-1mdv2010.2.x                                           http://sophie.zarb.org/rpms/98421c894ee30a27d9bd578264625220
Mandriva        nano                               2.3.1-1mdv2010.2.i                                           http://sophie.zarb.org/rpms/cea07b5ef9aa05bac262fc7844dbd223
Mandriva        nano                               2.2.4-1mdv2010.1.s                                           http://sophie.zarb.org/rpms/d61f9341b8981e80424c39c3951067fa
Mandriva        spring-mod-nanoblobs               0.65-2mdv2010.0.sr                                           http://sophie.zarb.org/rpms/74bb369d4cbb4c8cfe6f6028e8562460
Mandriva        nanoxml-lite                       2.2.3-4.1.4mdv2010                                           http://sophie.zarb.org/rpms/287a4c37bc2a39c0f277b0020df47502
Mandriva        nanoxml-manual-lite                2.2.3-4.1.4mdv2010                                           http://sophie.zarb.org/rpms/17dc4f638e5e9964038d4d26c53cc9c6
Mandriva        nanoxml-manual                     2.2.3-4.1.4mdv2010                                           http://sophie.zarb.org/rpms/a1b5092cd01fc8bb78a0f3ca9b90370b
Gentoo      nano                                   9999                                                         http://packages.gentoo.org/package/app-editors/nano 
Gentoo      nano                                   9999                                                         http://packages.gentoo.org/package/app-editors/nano 
Gentoo      nano                                   2.9.8                                                        http://packages.gentoo.org/package/app-editors/nano 
Gentoo      nano                                   2.9.7
```

如果你希望只从当前发行版仓库中搜索指定包，使用以下格式：

```
$ whohas -d Ubuntu vlc
Ubuntu      vlc                                    2.1.6-0ubuntu14.04 1M              all                       http://packages.ubuntu.com/trusty/vlc
Ubuntu      vlc                                    2.1.6-0ubuntu14.04 1M              all                       http://packages.ubuntu.com/trusty-updates/vlc
Ubuntu      vlc                                    2.2.2-5ubuntu0.16. 1M              all                       http://packages.ubuntu.com/xenial/vlc
Ubuntu      vlc                                    2.2.2-5ubuntu0.16. 1M              all                       http://packages.ubuntu.com/xenial-updates/vlc
Ubuntu      vlc                                    2.2.6-6            40K             all                       http://packages.ubuntu.com/artful/vlc
Ubuntu      vlc                                    3.0.1-3build1      32K             all                       http://packages.ubuntu.com/bionic/vlc
Ubuntu      vlc                                    3.0.2-0ubuntu0.1   32K             all                       http://packages.ubuntu.com/bionic-updates/vlc
Ubuntu      vlc                                    3.0.3-1            33K             all                       http://packages.ubuntu.com/cosmic/vlc
Ubuntu      browser-plugin-vlc                     2.0.6-2            55K             all                       http://packages.ubuntu.com/trusty/browser-plugin-vlc
Ubuntu      browser-plugin-vlc                     2.0.6-4            47K             all                       http://packages.ubuntu.com/xenial/browser-plugin-vlc
Ubuntu      browser-plugin-vlc                     2.0.6-4            47K             all                       http://packages.ubuntu.com/artful/browser-plugin-vlc
Ubuntu      browser-plugin-vlc                     2.0.6-4            47K             all                       http://packages.ubuntu.com/bionic/browser-plugin-vlc
Ubuntu      browser-plugin-vlc                     2.0.6-4            47K             all                       http://packages.ubuntu.com/cosmic/browser-plugin-vlc
Ubuntu      libvlc-bin                             2.2.6-6            27K             all                       http://packages.ubuntu.com/artful/libvlc-bin
Ubuntu      libvlc-bin                             3.0.1-3build1      17K             all                       http://packages.ubuntu.com/bionic/libvlc-bin
Ubuntu      libvlc-bin                             3.0.2-0ubuntu0.1   17K             all
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-search-if-a-package-is-available-on-your-linux-distribution-or-not/

作者：[Prakash Subramanian][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/prakash/
[1]:https://www.2daygeek.com/list-of-command-line-package-manager-for-linux/
[2]:https://www.2daygeek.com/list-of-graphical-frontend-tool-for-linux-package-manager/
