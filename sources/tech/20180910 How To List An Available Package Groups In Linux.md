How To List An Available Package Groups In Linux
======
As we know, if we want to install any packages in Linux we need to use the distribution package manager to get it done.

Package manager is playing major role in Linux as this used most of the time by admin.

If you would like to install group of package in one shot what would be the possible option.

Is it possible in Linux? if so, what would be the command for it.

Yes, this can be done in Linux by using the package manager. Each package manager has their own option to perform this task, as i know apt or apt-get package manager doesn’t has this option.

For Debian based system we need to use tasksel command instead of official package managers called apt or apt-get.

What is the benefit if we install group of package in Linux? Yes, there is lot of benefit is available in Linux when we install group of package because if you want to install LAMP separately we need to include so many packages but that can be done using single package when we use group of package command.

Say for example, as you get a request from Application team to install LAMP but you don’t know what are the packages needs to be installed, this is where group of package comes into picture.

Group option is a handy tool for Linux systems which will install Group of Software in a single click on your system without headache.

A package group is a collection of packages that serve a common purpose, for instance System Tools or Sound and Video. Installing a package group pulls a set of dependent packages, saving time considerably.

**Suggested Read :**
**(#)** [How To List Installed Packages By Size (Largest) On Linux][1]
**(#)** [How To View/List The Available Packages Updates In Linux][2]
**(#)** [How To View A Particular Package Installed/Updated/Upgraded/Removed/Erased Date On Linux][3]
**(#)** [How To View Detailed Information About A Package In Linux][4]
**(#)** [How To Search If A Package Is Available On Your Linux Distribution Or Not][5]
**(#)** [Newbies corner – A Graphical frontend tool for Linux Package Manager][6]
**(#)** [Linux Expert should knows, list of Command line Package Manager & Usage][7]

### How To List An Available Package Groups In CentOS/RHEL Systems

RHEL & CentOS systems are using RPM packages hence we can use the `Yum Package Manager` to get this information.

YUM stands for Yellowdog Updater, Modified is an open-source command-line front-end package-management utility for RPM based systems such as Red Hat Enterprise Linux (RHEL) and CentOS.

Yum is the primary tool for getting, installing, deleting, querying, and managing RPM packages from distribution repositories, as well as other third-party repositories.

**Suggested Read :** [YUM Command To Manage Packages on RHEL/CentOS Systems][8]

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

If you would like to list what are the packages is associated on it, run the below command. In this example we are going to list what are the packages is associated with “Performance Tools” group.

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

### How To List An Available Package Groups In Fedora

Fedora system uses DNF package manager hence we can use the Dnf Package Manager to get this information.

DNF stands for Dandified yum. We can tell DNF, the next generation of yum package manager (Fork of Yum) using hawkey/libsolv library for backend. Aleš Kozumplík started working on DNF since Fedora 18 and its implemented/launched in Fedora 22 finally.

Dnf command is used to install, update, search & remove packages on Fedora 22 and later system. It automatically resolve dependencies and make it smooth package installation without any trouble.

Yum replaced by DNF due to several long-term problems in Yum which was not solved. Asked why ? he did not patches the Yum issues. Aleš Kozumplík explains that patching was technically hard and YUM team wont accept the changes immediately and other major critical, YUM is 56K lines but DNF is 29K lies. So, there is no option for further development, except to fork.

**Suggested Read :** [DNF (Fork of YUM) Command To Manage Packages on Fedora System][9]

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

If you would like to list what are the packages is associated on it, run the below command. In this example we are going to list what are the packages is associated with “Editor” group.

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

### How To List An Available Package Groups In openSUSE System

openSUSE system uses zypper package manager hence we can use the zypper Package Manager to get this information.

Zypper is a command line package manager for suse & openSUSE distributions. It’s used to install, update, search & remove packages & manage repositories, perform various queries, and more. Zypper command-line interface to ZYpp system management library (libzypp).

**Suggested Read :** [Zypper Command To Manage Packages On openSUSE & suse Systems][10]

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

If you would like to list what are the packages is associated on it, run the below command. In this example we are going to list what are the packages is associated with “file_server” group.
Additionally zypper command allows a user to perform the same action with different options.

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

If you would like to list what are the packages is associated on it, run the below command.

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

If you would like to list what are the packages is associated on it, run the below command.

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

If you would like to list what are the packages is associated on it, run the below command.

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

### How To List An Available Package Groups In Debian/Ubuntu Systems

Since APT or APT-GET package manager doesn’t offer this option for Debian/Ubuntu based systems hence, we are using tasksel command to get this information.

[Tasksel][11] is a handy tool for Debian/Ubuntu systems which will install Group of Software in a single click on your system. Tasks are defined in `.desc` files and located at `/usr/share/tasksel`.

By default, tasksel tool installed on Debian system as part of Debian installer but it’s not installed on Ubuntu desktop editions. This functionality is similar to that of meta-packages, like how package managers have.

Tasksel tool offer a simple user interface based on zenity (popup Graphical dialog box in command line).

**Suggested Read :** [Tasksel – Install Group of Software in A Single Click on Debian/Ubuntu][12]

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

If you would like to list what are the packages is associated on it, run the below command. In this example we are going to list what are the packages is associated with “file_server” group.

```
# tasksel --task-desc "lamp-server"
Selects a ready-made Linux/Apache/MySQL/PHP server.
```

### How To List An Available Package Groups In Arch Linux based Systems

Arch Linux based systems are using pacman package manager hence we can use the pacman Package Manager to get this information.

pacman stands for package manager utility (pacman). pacman is a command-line utility to install, build, remove and manage Arch Linux packages. pacman uses libalpm (Arch Linux Package Management (ALPM) library) as a back-end to perform all the actions.

**Suggested Read :** [Pacman Command To Manage Packages On Arch Linux Based Systems][13]

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

If you would like to list what are the packages is associated on it, run the below command. In this example we are going to list what are the packages is associated with “gnome” group.

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

Alternatively we can check the same by running following command.

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

To know exactly how many packages is associated on it, run the following command.

```
# pacman -Sg gnome | wc -l
64

```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-list-an-available-package-groups-in-linux/

作者：[Prakash Subramanian][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
