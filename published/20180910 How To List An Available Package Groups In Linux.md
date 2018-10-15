如何在 Linux 中列出可用的软件包组
======

我们知道，如果想要在 Linux 中安装软件包，可以使用软件包管理器来进行安装。由于系统管理员需要频繁用到软件包管理器，所以它是 Linux 当中的一个重要工具。

但是如果想一次性安装一个软件包组，在 Linux 中有可能吗？又如何通过命令去实现呢？

在 Linux 中确实可以用软件包管理器来达到这样的目的。很多软件包管理器都有这样的选项来实现这个功能，但就我所知，`apt` 或 `apt-get` 软件包管理器却并没有这个选项。因此对基于 Debian 的系统，需要使用的命令是 `tasksel`，而不是 `apt` 或 `apt-get` 这样的官方软件包管理器。

在 Linux 中安装软件包组有很多好处。对于 LAMP 来说，安装过程会包含多个软件包，但如果安装软件包组命令来安装，只安装一个包就可以了。

当你的团队需要安装 LAMP，但不知道其中具体包含哪些软件包，这个时候软件包组就派上用场了。软件包组是 Linux 系统上一个很方便的工具，它能让你轻松地完成一组软件包的安装。

软件包组是一组用于公共功能的软件包，包括系统工具、声音和视频。 安装软件包组的过程中，会获取到一系列的依赖包，从而大大节省了时间。

**推荐阅读：**

- [如何在 Linux 上按照大小列出已安装的软件包][1]
- [如何在 Linux 上查看/列出可用的软件包更新][2]
- [如何在 Linux 上查看软件包的安装/更新/升级/移除/卸载时间][3]
- [如何在 Linux 上查看一个软件包的详细信息][4]
- [如何查看一个软件包是否在你的 Linux 发行版上可用][5]
- [萌新指导：一个可视化的 Linux 包管理工具][6]
- [老手必会：命令行软件包管理器的用法][7]

### 如何在 CentOS/RHEL 系统上列出可用的软件包组

RHEL 和 CentOS 系统使用的是 RPM 软件包，因此可以使用 `yum` 软件包管理器来获取相关的软件包信息。

`yum` 是 “Yellowdog Updater, Modified” 的缩写，它是一个用于基于 RPM 系统（例如 RHEL 和 CentOS）的，开源的命令行软件包管理工具。它是从发行版仓库或其它第三方库中获取、安装、删除、查询和管理 RPM 包的主要工具。

**推荐阅读：** [使用 yum 命令在 RHEL/CentOS 系统上管理软件包][8]

```
# yum grouplist
Loaded plugins: fastestmirror, security
Setting up Group Process
Loading mirror speeds from cached hostfile
 * epel: epel.mirror.constant.com
Installed Groups:
 Base
 E-mail server
 Graphical Administration Tools
 Hardware monitoring utilities
 Legacy UNIX compatibility
 Milkymist
 Networking Tools
 Performance Tools
 Perl Support
 Security Tools
Available Groups:
 Additional Development
 Backup Client
 Backup Server
 CIFS file server
 Client management tools
 Compatibility libraries
 Console internet tools
 Debugging Tools
 Desktop
.
.
Available Language Groups:
 Afrikaans Support [af]
 Albanian Support [sq]
 Amazigh Support [ber]
 Arabic Support [ar]
 Armenian Support [hy]
 Assamese Support [as]
 Azerbaijani Support [az]
.
.
Done
```

如果需要列出相关联的软件包，可以执行以下这个命令。下面的例子是列出和 “Performance Tools” 组相关联的软件包。

```
# yum groupinfo "Performance Tools"
Loaded plugins: fastestmirror, security
Setting up Group Process
Loading mirror speeds from cached hostfile
 * epel: ewr.edge.kernel.org

Group: Performance Tools
 Description: Tools for diagnosing system and application-level performance problems.
 Mandatory Packages:
 blktrace
 sysstat
 Default Packages:
 dstat
 iotop
 latencytop
 latencytop-tui
 oprofile
 perf
 powertop
 seekwatcher
 Optional Packages:
 oprofile-jit
 papi
 sdparm
 sg3_utils
 tiobench
 tuned
 tuned-utils
```

### 如何在 Fedora 系统上列出可用的软件包组

Fedora 系统使用的是 DNF 软件包管理器，因此可以通过 DNF 软件包管理器来获取相关的信息。

DNF 的含义是 “Dandified yum”。DNF 软件包管理器是 YUM 软件包管理器的一个分支，它使用 hawkey/libsolv 库作为后端。从 Fedora 18 开始，Aleš Kozumplík 开始着手 DNF 的开发，直到在 Fedora 22 开始加入到系统中。

`dnf` 命令可以在 Fedora 22 及更高版本上安装、更新、搜索和删除软件包， 它可以自动解决软件包的依赖关系并其顺利安装，不会产生问题。

YUM 被 DNF 取代是由于 YUM 中存在一些长期未被解决的问题。为什么 Aleš Kozumplík 没有对 yum 的这些问题作出修补呢，他认为补丁解决存在技术上的难题，而 YUM 团队也不会马上接受这些更改，还有一些重要的问题。而且 YUM 的代码量有 5.6 万行，而 DNF 只有 2.9 万行。因此已经不需要沿着 YUM 的方向继续开发了，重新开一个分支才是更好的选择。

**推荐阅读：** [在 Fedora 系统上使用 DNF 命令管理软件包][9]

```
# dnf grouplist
Last metadata expiration check: 0:00:00 ago on Sun 09 Sep 2018 07:10:36 PM IST.
Available Environment Groups:
 Fedora Custom Operating System
 Minimal Install
 Fedora Server Edition
 Fedora Workstation
 Fedora Cloud Server
 KDE Plasma Workspaces
 Xfce Desktop
 LXDE Desktop
 Hawaii Desktop
 LXQt Desktop
 Cinnamon Desktop
 MATE Desktop
 Sugar Desktop Environment
 Development and Creative Workstation
 Web Server
 Infrastructure Server
 Basic Desktop
Installed Groups:
 C Development Tools and Libraries
 Development Tools
Available Groups:
 3D Printing
 Administration Tools
 Ansible node
 Audio Production
 Authoring and Publishing
 Books and Guides
 Cloud Infrastructure
 Cloud Management Tools
 Container Management
 D Development Tools and Libraries
.
.
 RPM Development Tools
 Security Lab
 Text-based Internet
 Window Managers
 GNOME Desktop Environment
 Graphical Internet
 KDE (K Desktop Environment)
 Fonts
 Games and Entertainment
 Hardware Support
 Sound and Video
 System Tools
```

如果需要列出相关联的软件包，可以执行以下这个命令。下面的例子是列出和 “Editor” 组相关联的软件包。

```
# dnf groupinfo Editors
Last metadata expiration check: 0:04:57 ago on Sun 09 Sep 2018 07:10:36 PM IST.

Group: Editors
 Description: Sometimes called text editors, these are programs that allow you to create and edit text files. This includes Emacs and Vi.
 Optional Packages:
 code-editor
 cssed
 emacs
 emacs-auctex
 emacs-bbdb
 emacs-ess
 emacs-vm
 geany
 gobby
 jed
 joe
 leafpad
 nedit
 poedit
 psgml
 vim-X11
 vim-enhanced
 xemacs
 xemacs-packages-base
 xemacs-packages-extra
 xemacs-xft
 xmlcopyeditor
 zile
```

### 如何在 openSUSE 系统上列出可用的软件包组

openSUSE 系统使用的是 zypper 软件包管理器，因此可以通过 zypper 软件包管理器来获取相关的信息。

Zypper 是 suse 和 openSUSE 发行版的命令行包管理器。它可以用于安装、更新、搜索和删除软件包，还有管理存储库，执行各种查询等功能。 Zypper 命令行界面用到了 ZYpp 系统管理库（libzypp）。

**推荐阅读：** [在 openSUSE 和 suse 系统使用 zypper 命令管理软件包][10]

```
# zypper patterns
Loading repository data...
Warning: Repository 'Update Repository (Non-Oss)' appears to be outdated. Consider using a different mirror or server.
Warning: Repository 'Main Update Repository' appears to be outdated. Consider using a different mirror or server.
Reading installed packages...
S | Name | Version | Repository | Dependency
---|----------------------|---------------|-----------------------|-----------
 | 64bit | 20150918-25.1 | Main Repository (OSS) |
 | apparmor | 20150918-25.1 | Main Repository (OSS) |
i | apparmor | 20150918-25.1 | @System |
 | base | 20150918-25.1 | Main Repository (OSS) |
i+ | base | 20150918-25.1 | @System |
 | books | 20150918-25.1 | Main Repository (OSS) |
 | console | 20150918-25.1 | Main Repository (OSS) |
 | devel_C_C++ | 20150918-25.1 | Main Repository (OSS) |
i | enhanced_base | 20150918-25.1 | @System |
 | enlightenment | 20150918-25.1 | Main Repository (OSS) |
 | file_server | 20150918-25.1 | Main Repository (OSS) |
 | fonts | 20150918-25.1 | Main Repository (OSS) |
i | fonts | 20150918-25.1 | @System |
 | games | 20150918-25.1 | Main Repository (OSS) |
i | games | 20150918-25.1 | @System |
 | gnome | 20150918-25.1 | Main Repository (OSS) |
 | gnome_basis | 20150918-25.1 | Main Repository (OSS) |
i | imaging | 20150918-25.1 | @System |
 | kde | 20150918-25.1 | Main Repository (OSS) |
i+ | kde | 20150918-25.1 | @System |
 | kde_plasma | 20150918-25.1 | Main Repository (OSS) |
i | kde_plasma | 20150918-25.1 | @System |
 | lamp_server | 20150918-25.1 | Main Repository (OSS) |
 | laptop | 20150918-25.1 | Main Repository (OSS) |
i+ | laptop | 20150918-25.1 | @System |
 | lxde | 20150918-25.1 | Main Repository (OSS) |
 | lxqt | 20150918-25.1 | Main Repository (OSS) |
i | multimedia | 20150918-25.1 | @System |
 | network_admin | 20150918-25.1 | Main Repository (OSS) |
 | non_oss | 20150918-25.1 | Main Repository (OSS) |
i | non_oss | 20150918-25.1 | @System |
 | office | 20150918-25.1 | Main Repository (OSS) |
i | office | 20150918-25.1 | @System |
 | print_server | 20150918-25.1 | Main Repository (OSS) |
 | remote_desktop | 20150918-25.1 | Main Repository (OSS) |
 | x11 | 20150918-25.1 | Main Repository (OSS) |
i+ | x11 | 20150918-25.1 | @System |
 | x86 | 20150918-25.1 | Main Repository (OSS) |
 | xen_server | 20150918-25.1 | Main Repository (OSS) |
 | xfce | 20150918-25.1 | Main Repository (OSS) |
 | xfce_basis | 20150918-25.1 | Main Repository (OSS) |
 | yast2_basis | 20150918-25.1 | Main Repository (OSS) |
i | yast2_basis | 20150918-25.1 | @System |
 | yast2_install_wf | 20150918-25.1 | Main Repository (OSS) |
```

如果需要列出相关联的软件包，可以执行以下这个命令。下面的例子是列出和 “file_server” 组相关联的软件包。另外 `zypper` 还允许用户使用不同的选项执行相同的操作。

```
# zypper info file_server
Loading repository data...
Warning: Repository 'Update Repository (Non-Oss)' appears to be outdated. Consider using a different mirror or server.
Warning: Repository 'Main Update Repository' appears to be outdated. Consider using a different mirror or server.
Reading installed packages...

Information for pattern file_server:
------------------------------------
Repository : Main Repository (OSS)
Name : file_server
Version : 20150918-25.1
Arch : x86_64
Vendor : openSUSE
Installed : No
Visible to User : Yes
Summary : File Server
Description :
 File services to host files so that they may be accessed or retrieved by other computers on the same network. This includes the FTP, SMB, and NFS protocols.
Contents :
 S | Name | Type | Dependency
 ---|-------------------------------|---------|------------
 i+ | patterns-openSUSE-base | package | Required
 | patterns-openSUSE-file_server | package | Required
 | nfs-kernel-server | package | Recommended
 i | nfsidmap | package | Recommended
 i | samba | package | Recommended
 i | samba-client | package | Recommended
 i | samba-winbind | package | Recommended
 | tftp | package | Recommended
 | vsftpd | package | Recommended
 | yast2-ftp-server | package | Recommended
 | yast2-nfs-server | package | Recommended
 i | yast2-samba-server | package | Recommended
 | yast2-tftp-server | package | Recommended
```

如果需要列出相关联的软件包，可以执行以下这个命令。

```
# zypper pattern-info file_server
Loading repository data...
Warning: Repository 'Update Repository (Non-Oss)' appears to be outdated. Consider using a different mirror or server.
Warning: Repository 'Main Update Repository' appears to be outdated. Consider using a different mirror or server.
Reading installed packages...


Information for pattern file_server:
------------------------------------
Repository : Main Repository (OSS)
Name : file_server
Version : 20150918-25.1
Arch : x86_64
Vendor : openSUSE
Installed : No
Visible to User : Yes
Summary : File Server
Description :
 File services to host files so that they may be accessed or retrieved by other computers on the same network. This includes the FTP, SMB, and NFS protocols.
Contents :
 S | Name | Type | Dependency
 ---|-------------------------------|---------|------------
 i+ | patterns-openSUSE-base | package | Required
 | patterns-openSUSE-file_server | package | Required
 | nfs-kernel-server | package | Recommended
 i | nfsidmap | package | Recommended
 i | samba | package | Recommended
 i | samba-client | package | Recommended
 i | samba-winbind | package | Recommended
 | tftp | package | Recommended
 | vsftpd | package | Recommended
 | yast2-ftp-server | package | Recommended
 | yast2-nfs-server | package | Recommended
 i | yast2-samba-server | package | Recommended
 | yast2-tftp-server | package | Recommended
```

如果需要列出相关联的软件包，也可以执行以下这个命令。

```
# zypper info pattern file_server
Loading repository data...
Warning: Repository 'Update Repository (Non-Oss)' appears to be outdated. Consider using a different mirror or server.
Warning: Repository 'Main Update Repository' appears to be outdated. Consider using a different mirror or server.
Reading installed packages...

Information for pattern file_server:
------------------------------------
Repository : Main Repository (OSS)
Name : file_server
Version : 20150918-25.1
Arch : x86_64
Vendor : openSUSE
Installed : No
Visible to User : Yes
Summary : File Server
Description :
 File services to host files so that they may be accessed or retrieved by other computers on the same network. This includes the FTP, SMB, and NFS protocols.
Contents :
 S | Name | Type | Dependency
 ---|-------------------------------|---------|------------
 i+ | patterns-openSUSE-base | package | Required
 | patterns-openSUSE-file_server | package | Required
 | nfs-kernel-server | package | Recommended
 i | nfsidmap | package | Recommended
 i | samba | package | Recommended
 i | samba-client | package | Recommended
 i | samba-winbind | package | Recommended
 | tftp | package | Recommended
 | vsftpd | package | Recommended
 | yast2-ftp-server | package | Recommended
 | yast2-nfs-server | package | Recommended
 i | yast2-samba-server | package | Recommended
 | yast2-tftp-server | package | Recommended
```

如果需要列出相关联的软件包，也可以执行以下这个命令。

```
# zypper info -t pattern file_server
Loading repository data...
Warning: Repository 'Update Repository (Non-Oss)' appears to be outdated. Consider using a different mirror or server.
Warning: Repository 'Main Update Repository' appears to be outdated. Consider using a different mirror or server.
Reading installed packages...


Information for pattern file_server:
------------------------------------
Repository : Main Repository (OSS)
Name : file_server
Version : 20150918-25.1
Arch : x86_64
Vendor : openSUSE
Installed : No
Visible to User : Yes
Summary : File Server
Description :
 File services to host files so that they may be accessed or retrieved by other computers on the same network. This includes the FTP, SMB, and NFS protocols.
Contents :
 S | Name | Type | Dependency
 ---|-------------------------------|---------|------------
 i+ | patterns-openSUSE-base | package | Required
 | patterns-openSUSE-file_server | package | Required
 | nfs-kernel-server | package | Recommended
 i | nfsidmap | package | Recommended
 i | samba | package | Recommended
 i | samba-client | package | Recommended
 i | samba-winbind | package | Recommended
 | tftp | package | Recommended
 | vsftpd | package | Recommended
 | yast2-ftp-server | package | Recommended
 | yast2-nfs-server | package | Recommended
 i | yast2-samba-server | package | Recommended
 | yast2-tftp-server | package | Recommended
```

### 如何在 Debian/Ubuntu 系统上列出可用的软件包组

由于 APT 或 APT-GET 软件包管理器没有为基于 Debian/Ubuntu 的系统提供这样的选项，因此需要使用 `tasksel` 命令来获取相关信息。

[tasksel][11] 是 Debian/Ubuntu 系统上一个很方便的工具，只需要很少的操作就可以用它来安装好一组软件包。可以在 `/usr/share/tasksel` 目录下的 `.desc` 文件中安排软件包的安装任务。

默认情况下，`tasksel` 工具是作为 Debian 系统的一部分安装的，但桌面版 Ubuntu 则没有自带 `tasksel`，这个功能类似软件包管理器中的元包（meta-packages）。

`tasksel` 工具带有一个基于 zenity 的简单用户界面，例如命令行中的弹出图形对话框。

**推荐阅读：** [使用 tasksel 在 Debian/Ubuntu 系统上快速安装软件包组][12]

```
# tasksel --list-task
u kubuntu-live Kubuntu live CD
u lubuntu-live-gtk Lubuntu live CD (GTK part)
u ubuntu-budgie-live Ubuntu Budgie live CD
u ubuntu-live Ubuntu live CD
u ubuntu-mate-live Ubuntu MATE Live CD
u ubuntustudio-dvd-live Ubuntu Studio live DVD
u vanilla-gnome-live Ubuntu GNOME live CD
u xubuntu-live Xubuntu live CD
u cloud-image Ubuntu Cloud Image (instance)
u dns-server DNS server
u kubuntu-desktop Kubuntu desktop
u kubuntu-full Kubuntu full
u lamp-server LAMP server
u lubuntu-core Lubuntu minimal installation
u lubuntu-desktop Lubuntu Desktop
u lubuntu-gtk-core Lubuntu minimal installation (GTK part)
u lubuntu-gtk-desktop Lubuntu Desktop (GTK part)
u lubuntu-qt-core Lubuntu minimal installation (Qt part)
u lubuntu-qt-desktop Lubuntu Qt Desktop (Qt part)
u mail-server Mail server
u postgresql-server PostgreSQL database
i print-server Print server
u samba-server Samba file server
u tomcat-server Tomcat Java server
u ubuntu-budgie-desktop Ubuntu Budgie desktop
i ubuntu-desktop Ubuntu desktop
u ubuntu-mate-core Ubuntu MATE minimal
u ubuntu-mate-desktop Ubuntu MATE desktop
i ubuntu-usb Ubuntu desktop USB
u ubuntustudio-audio Audio recording and editing suite
u ubuntustudio-desktop Ubuntu Studio desktop
u ubuntustudio-desktop-core Ubuntu Studio minimal DE installation
u ubuntustudio-fonts Large selection of font packages
u ubuntustudio-graphics 2D/3D creation and editing suite
u ubuntustudio-photography Photograph touchup and editing suite
u ubuntustudio-publishing Publishing applications
u ubuntustudio-video Video creation and editing suite
u vanilla-gnome-desktop Vanilla GNOME desktop
u xubuntu-core Xubuntu minimal installation
u xubuntu-desktop Xubuntu desktop
u openssh-server OpenSSH server
u server Basic Ubuntu server
```

如果需要列出相关联的软件包，可以执行以下这个命令。下面的例子是列出和 “lamp-server” 组相关联的软件包。

```
# tasksel --task-desc "lamp-server"
Selects a ready-made Linux/Apache/MySQL/PHP server.
```

### 如何在基于 Arch Linux 的系统上列出可用的软件包组

基于 Arch Linux 的系统使用的是 pacman 软件包管理器，因此可以通过 pacman 软件包管理器来获取相关的信息。

pacman 是 “package manager” 的缩写。`pacman` 可以用于安装、构建、删除和管理 Arch Linux 软件包。`pacman` 使用 libalpm（Arch Linux Package Management 库，ALPM）作为后端来执行所有操作。

**推荐阅读：** [使用 pacman 在基于 Arch Linux 的系统上管理软件包][13]

```
# pacman -Sg
base-devel
base
multilib-devel
gnome-extra
kde-applications
kdepim
kdeutils
kdeedu
kf5
kdemultimedia
gnome
plasma
kdegames
kdesdk
kdebase
xfce4
fprint
kdegraphics
kdenetwork
kdeadmin
kf5-aids
kdewebdev
.
.
dlang-ldc
libretro
ring
lxqt
non-daw
non
alsa
qtcurve
realtime
sugar-fructose
tesseract-data
vim-plugins
```

如果需要列出相关联的软件包，可以执行以下这个命令。下面的例子是列出和 “gnome” 组相关联的软件包。

```
# pacman -Sg gnome
gnome baobab
gnome cheese
gnome eog
gnome epiphany
gnome evince
gnome file-roller
gnome gdm
gnome gedit
gnome gnome-backgrounds
gnome gnome-calculator
gnome gnome-calendar
gnome gnome-characters
gnome gnome-clocks
gnome gnome-color-manager
gnome gnome-contacts
gnome gnome-control-center
gnome gnome-dictionary
gnome gnome-disk-utility
gnome gnome-documents
gnome gnome-font-viewer
.
.
gnome sushi
gnome totem
gnome tracker
gnome tracker-miners
gnome vino
gnome xdg-user-dirs-gtk
gnome yelp
gnome gnome-boxes
gnome gnome-software
gnome simple-scan

```

也可以执行以下这个命令实现同样的效果。

```
# pacman -S gnome
:: There are 64 members in group gnome:
:: Repository extra
 1) baobab 2) cheese 3) eog 4) epiphany 5) evince 6) file-roller 7) gdm 8) gedit 9) gnome-backgrounds 10) gnome-calculator 11) gnome-calendar 12) gnome-characters 13) gnome-clocks
 14) gnome-color-manager 15) gnome-contacts 16) gnome-control-center 17) gnome-dictionary 18) gnome-disk-utility 19) gnome-documents 20) gnome-font-viewer 21) gnome-getting-started-docs
 22) gnome-keyring 23) gnome-logs 24) gnome-maps 25) gnome-menus 26) gnome-music 27) gnome-photos 28) gnome-screenshot 29) gnome-session 30) gnome-settings-daemon 31) gnome-shell
 32) gnome-shell-extensions 33) gnome-system-monitor 34) gnome-terminal 35) gnome-themes-extra 36) gnome-todo 37) gnome-user-docs 38) gnome-user-share 39) gnome-video-effects 40) grilo-plugins
 41) gvfs 42) gvfs-afc 43) gvfs-goa 44) gvfs-google 45) gvfs-gphoto2 46) gvfs-mtp 47) gvfs-nfs 48) gvfs-smb 49) mousetweaks 50) mutter 51) nautilus 52) networkmanager 53) orca 54) rygel
 55) sushi 56) totem 57) tracker 58) tracker-miners 59) vino 60) xdg-user-dirs-gtk 61) yelp
:: Repository community
 62) gnome-boxes 63) gnome-software 64) simple-scan

Enter a selection (default=all): ^C
Interrupt signal received

```

可以执行以下命令检查相关软件包的数量。

```
# pacman -Sg gnome | wc -l
64
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-list-an-available-package-groups-in-linux/

作者：[Prakash Subramanian][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[1]: https://www.2daygeek.com/how-to-list-installed-packages-by-size-largest-on-linux/
[2]: https://www.2daygeek.com/how-to-view-list-the-available-packages-updates-in-linux/
[3]: https://www.2daygeek.com/how-to-view-a-particular-package-installed-updated-upgraded-removed-erased-date-on-linux/
[4]: https://www.2daygeek.com/how-to-view-detailed-information-about-a-package-in-linux/
[5]: https://www.2daygeek.com/how-to-search-if-a-package-is-available-on-your-linux-distribution-or-not/
[6]: https://www.2daygeek.com/list-of-graphical-frontend-tool-for-linux-package-manager/
[7]: https://www.2daygeek.com/list-of-command-line-package-manager-for-linux/
[8]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[9]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[10]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[11]: https://wiki.debian.org/tasksel
[12]: https://www.2daygeek.com/tasksel-install-group-of-software-in-a-single-click-or-single-command-on-debian-ubuntu/
[13]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/

