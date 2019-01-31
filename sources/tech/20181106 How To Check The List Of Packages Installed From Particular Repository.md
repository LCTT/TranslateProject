[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (How To Check The List Of Packages Installed From Particular Repository?)
[#]: via: (https://www.2daygeek.com/how-to-check-the-list-of-packages-installed-from-particular-repository/)
[#]: author: (Prakash Subramanian https://www.2daygeek.com/author/prakash/)
[#]: url: ( )

How To Check The List Of Packages Installed From Particular Repository?
======

If you would like to check the list of package installed from particular repository then you are in the right place to get it done.

Why we need this detail? It may helps you to isolate the installed packages list based on the repository.

Like, it’s coming from distribution official repository or these are coming from PPA or these are coming from other resources, etc.,

You may want to know what are the packages came from third party repositories to keep eye on those to avoid any damages on your system.

So many third party repositories and PPAs are available for Linux. These repositories are included set of packages which is not available in distribution repository due to some limitation.

It helps administrator to easily install some of the important packages which is not available in the distribution official repository. Installing third party repository on production system is not advisable as this may not properly maintained by the repository maintainer due to many reasons.

So, you have to decide whether you want to install or not. I can say, we can believe some of the third party repositories which is well maintained and suggested by Linux distributions like [EPEL repository][1], Copr (Cool Other Package Repo), etc,.

If you would like to see the list of package was installed from the corresponding repo, use the following commands based on your distributions.

[List of Major repositories][2] and it’s details are below.

  * **`CentOS:`** [EPEL][1], [ELRepo][3], etc is [CentOS Community Approved Repositories][4].
  * **`Fedora:`** [RPMfusion repo][5] is commonly used by most of the [Fedora][6] users.
  * **`ArchLinux:`** ArchLinux community repository contains packages that have been adopted by Trusted Users from the Arch User Repository.
  * **`openSUSE:`** [Packman repo][7] offers various additional packages for openSUSE, especially but not limited to multimedia related applications and libraries that are on the openSUSE Build Service application blacklist. It’s the largest external repository of openSUSE packages.
  * **`Ubuntu:`** Personal Package Archives (PPAs) are a kind of repository. Developers create them in order to distribute their software. You can find this information on the PPA’s Launchpad page. Also, you can enable Cananical partners repositories.



### What Is Repository?

A software repository is a central place which stores the software packages for the particular application.

All the Linux distributions are maintaining their own repositories and they allow users to retrieve and install packages on their machine.

Each vendor offered a unique package management tool to manage their repositories such as search, install, update, upgrade, remove, etc.

Most of the Linux distributions comes as freeware except RHEL and SUSE. To access their repositories you need to buy a subscriptions.

### How To Check The List Of Packages Installed From Particular Repository on RHEL/CentOS Systems?

This can be done in multiple ways. Here we will be giving you all the possible options and you can choose which one is best for you.

### Method-1: Using Yum Command

RHEL & CentOS systems are using RPM packages hence we can use the [Yum Package Manager][8] to get this information.

YUM stands for Yellowdog Updater, Modified is an open-source command-line front-end package-management utility for RPM based systems such as Red Hat Enterprise Linux (RHEL) and CentOS.

Yum is the primary tool for getting, installing, deleting, querying, and managing RPM packages from distribution repositories, as well as other third-party repositories.

```
[[email protected] ~]# yum list installed | grep @epel
apachetop.x86_64 0.15.6-1.el7 @epel
aria2.x86_64 1.18.10-2.el7.1 @epel
atop.x86_64 2.3.0-8.el7 @epel
axel.x86_64 2.4-9.el7 @epel
epel-release.noarch 7-11 @epel
lighttpd.x86_64 1.4.50-1.el7 @epel
```

Alternatively, you can use the yum command with other option to get the same details like above.

```
# yum repo-pkgs epel list installed
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * epel: epel.mirror.constant.com
Installed Packages
apachetop.x86_64 0.15.6-1.el7 @epel
aria2.x86_64 1.18.10-2.el7.1 @epel
atop.x86_64 2.3.0-8.el7 @epel
axel.x86_64 2.4-9.el7 @epel
epel-release.noarch 7-11 @epel
lighttpd.x86_64 1.4.50-1.el7 @epel
```

### Method-2: Using Yumdb Command

Yumdb info provides information similar to yum info but additionally it provides package checksum data, type, user info (who installed the package). Since yum 3.2.26 yum has started storing additional information outside of the rpmdatabase (where user indicates it was installed by the user, and dep means it was brought in as a dependency).

```
# yumdb search from_repo epel* |egrep -v '(from_repo|^$)'
Loaded plugins: fastestmirror
apachetop-0.15.6-1.el7.x86_64
aria2-1.18.10-2.el7.1.x86_64
atop-2.3.0-8.el7.x86_64
axel-2.4-9.el7.x86_64
epel-release-7-11.noarch
lighttpd-1.4.50-1.el7.x86_64
```

### Method-3: Using Repoquery Command

repoquery is a program for querying information from YUM repositories similarly to rpm queries.

```
# repoquery -a --installed --qf "%{ui_from_repo} %{name}" | grep '^@epel'
@epel apachetop
@epel aria2
@epel atop
@epel axel
@epel epel-release
@epel lighttpd
```

### How To Check The List Of Packages Installed From Particular Repository on Fedora System?

DNF stands for Dandified yum. We can tell DNF, the next generation of yum package manager (Fork of Yum) using hawkey/libsolv library for back-end. Aleš Kozumplík started working on DNF since Fedora 18 and its implemented/launched in Fedora 22 finally.

[Dnf command][9] is used to install, update, search & remove packages on Fedora 22 and later system. It automatically resolve dependencies and make it smooth package installation without any trouble.

```
# dnf list installed | grep @updates
NetworkManager.x86_64 1:1.12.4-2.fc29 @updates
NetworkManager-adsl.x86_64 1:1.12.4-2.fc29 @updates
NetworkManager-bluetooth.x86_64 1:1.12.4-2.fc29 @updates
NetworkManager-libnm.x86_64 1:1.12.4-2.fc29 @updates
NetworkManager-libreswan.x86_64 1.2.10-1.fc29 @updates
NetworkManager-libreswan-gnome.x86_64 1.2.10-1.fc29 @updates
NetworkManager-openvpn.x86_64 1:1.8.8-1.fc29 @updates
NetworkManager-openvpn-gnome.x86_64 1:1.8.8-1.fc29 @updates
NetworkManager-ovs.x86_64 1:1.12.4-2.fc29 @updates
NetworkManager-ppp.x86_64 1:1.12.4-2.fc29 @updates
.
.
```

Alternatively, you can use the dnf command with other option to get the same details like above.

```
# dnf repo-pkgs updates list installed
Installed Packages
NetworkManager.x86_64 1:1.12.4-2.fc29 @updates
NetworkManager-adsl.x86_64 1:1.12.4-2.fc29 @updates
NetworkManager-bluetooth.x86_64 1:1.12.4-2.fc29 @updates
NetworkManager-libnm.x86_64 1:1.12.4-2.fc29 @updates
NetworkManager-libreswan.x86_64 1.2.10-1.fc29 @updates
NetworkManager-libreswan-gnome.x86_64 1.2.10-1.fc29 @updates
NetworkManager-openvpn.x86_64 1:1.8.8-1.fc29 @updates
NetworkManager-openvpn-gnome.x86_64 1:1.8.8-1.fc29 @updates
NetworkManager-ovs.x86_64 1:1.12.4-2.fc29 @updates
.
.
```

### How To Check The List Of Packages Installed From Particular Repository on openSUSE System?

Zypper is a command line package manager which makes use of libzypp. [Zypper command][10] provides functions like repository access, dependency solving, package installation, etc.

```
zypper search -ir "Update Repository (Non-Oss)"
Loading repository data...
Reading installed packages...

S | Name | Summary | Type
---+----------------------------+---------------------------------------------------+--------
i | gstreamer-0_10-fluendo-mp3 | GStreamer plug-in from Fluendo for MP3 support | package
i+ | openSUSE-2016-615 | Test-update for openSUSE Leap 42.2 Non Free | patch
i+ | openSUSE-2017-724 | Security update for unrar | patch
i | unrar | A program to extract, test, and view RAR archives | package
```

Alternatively, we can use repo id instead of repo name.

```
zypper search -ir 2
Loading repository data...
Reading installed packages...

S | Name | Summary | Type
---+----------------------------+---------------------------------------------------+--------
i | gstreamer-0_10-fluendo-mp3 | GStreamer plug-in from Fluendo for MP3 support | package
i+ | openSUSE-2016-615 | Test-update for openSUSE Leap 42.2 Non Free | patch
i+ | openSUSE-2017-724 | Security update for unrar | patch
i | unrar | A program to extract, test, and view RAR archives | package
```

### How To Check The List Of Packages Installed From Particular Repository on ArchLinux System?

[Pacman command][11] stands for package manager utility. pacman is a simple command-line utility to install, build, remove and manage Arch Linux packages. Pacman uses libalpm (Arch Linux Package Management (ALPM) library) as a back-end to perform all the actions.

```
$ paclist community
acpi 1.7-2
acpid 2.0.30-1
adapta-maia-theme 3.94.0.149-1
android-tools 9.0.0_r3-1
blueman 2.0.6-1
brotli 1.0.7-1
.
.
ufw 0.35-5
unace 2.5-10
usb_modeswitch 2.5.2-1
viewnior 1.7-1
wallpapers-2018 1.0-1
xcursor-breeze 5.11.5-1
xcursor-simpleandsoft 0.2-8
xcursor-vanilla-dmz-aa 0.4.5-1
xfce4-whiskermenu-plugin-gtk3 2.3.0-1
zeromq 4.2.5-1
```

### How To Check The List Of Packages Installed From Particular Repository on Debian Based Systems?

For Debian based systems, it can be done using grep command.

If you want to know the list of installed repositories on your system, use the following command.

```
$ ls -lh /var/lib/apt/lists/ | uniq
total 370M
-rw-r--r-- 1 root root 10K Oct 26 10:53 archive.canonical.com_ubuntu_dists_bionic_InRelease
-rw-r--r-- 1 root root 6.4K Oct 26 10:53 archive.canonical.com_ubuntu_dists_bionic_partner_binary-amd64_Packages
-rw-r--r-- 1 root root 6.4K Oct 26 10:53 archive.canonical.com_ubuntu_dists_bionic_partner_binary-i386_Packages
-rw-r--r-- 1 root root 3.2K Jun 12 21:19 archive.canonical.com_ubuntu_dists_bionic_partner_i18n_Translation-en
drwxr-xr-x 2 _apt root 4.0K Jul 25 08:44 auxfiles
-rw-r--r-- 1 root root 3.7K Oct 16 15:13 download.virtualbox.org_virtualbox_debian_dists_bionic_contrib_binary-amd64_Packages
-rw-r--r-- 1 root root 7.2K Oct 16 15:13 download.virtualbox.org_virtualbox_debian_dists_bionic_contrib_Contents-amd64.lz4
-rw-r--r-- 1 root root 4.4K Oct 16 15:13 download.virtualbox.org_virtualbox_debian_dists_bionic_InRelease
-rw-r--r-- 1 root root 34 Mar 19 2018 download.virtualbox.org_virtualbox_debian_dists_bionic_non-free_Contents-amd64.lz4
-rw-r--r-- 1 root root 6.4K Sep 21 09:42 in.archive.ubuntu.com_ubuntu_dists_bionic-backports_Contents-amd64.lz4
-rw-r--r-- 1 root root 6.4K Sep 21 09:42 in.archive.ubuntu.com_ubuntu_dists_bionic-backports_Contents-i386.lz4
-rw-r--r-- 1 root root 73K Nov 6 11:16 in.archive.ubuntu.com_ubuntu_dists_bionic-backports_InRelease
.
.
-rw-r--r-- 1 root root 29 May 11 06:39 security.ubuntu.com_ubuntu_dists_bionic-security_main_dep11_icons-64x64.tar.gz
-rw-r--r-- 1 root root 747K Nov 5 23:57 security.ubuntu.com_ubuntu_dists_bionic-security_main_i18n_Translation-en
-rw-r--r-- 1 root root 2.8K Oct 9 22:37 security.ubuntu.com_ubuntu_dists_bionic-security_multiverse_binary-amd64_Packages
-rw-r--r-- 1 root root 3.7K Oct 9 22:37 security.ubuntu.com_ubuntu_dists_bionic-security_multiverse_binary-i386_Packages
-rw-r--r-- 1 root root 1.8K Jul 24 23:06 security.ubuntu.com_ubuntu_dists_bionic-security_multiverse_i18n_Translation-en
-rw-r--r-- 1 root root 519K Nov 5 20:12 security.ubuntu.com_ubuntu_dists_bionic-security_universe_binary-amd64_Packages
-rw-r--r-- 1 root root 517K Nov 5 20:12 security.ubuntu.com_ubuntu_dists_bionic-security_universe_binary-i386_Packages
-rw-r--r-- 1 root root 11K Nov 6 05:36 security.ubuntu.com_ubuntu_dists_bionic-security_universe_dep11_Components-amd64.yml.gz
-rw-r--r-- 1 root root 8.9K Nov 6 05:36 security.ubuntu.com_ubuntu_dists_bionic-security_universe_dep11_icons-48x48.tar.gz
-rw-r--r-- 1 root root 16K Nov 6 05:36 security.ubuntu.com_ubuntu_dists_bionic-security_universe_dep11_icons-64x64.tar.gz
-rw-r--r-- 1 root root 315K Nov 5 20:12 security.ubuntu.com_ubuntu_dists_bionic-security_universe_i18n_Translation-en
```

To get the list of installed packages from the `security.ubuntu.com` repository.

```
$ grep Package /var/lib/apt/lists/security.ubuntu.com_*_Packages | awk '{print $2;}'
amd64-microcode
apache2
apache2-bin
apache2-data
apache2-dbg
apache2-dev
.
.
znc
znc-dev
znc-perl
znc-python
znc-tcl
zsh-static
zziplib-bin
```

The security repository containing multiple branches (main, multiverse and universe) and if you would like to list out the installed packages from the particular repository `universe` then use the following format.

```
$ grep Package /var/lib/apt/lists/security.ubuntu.com_ubuntu_dists_bionic-security_universe*_Packages | awk '{print $2;}'
ant
ant-doc
ant-optional
apache2-suexec-custom
apache2-suexec-pristine
apparmor-easyprof
apport-kde
apport-noui
apport-valgrind
apt-transport-https
.
.
xul-ext-gdata-provider
xul-ext-lightning
xvfb
znc
znc-dev
znc-perl
znc-python
znc-tcl
zsh-static
zziplib-bin
```

one more example for `ppa.launchpad.net` repository.

```
$ grep Package /var/lib/apt/lists/ppa.launchpad.net_*_Packages | awk '{print $2;}'
notepadqq
notepadqq-gtk
notepadqq-common
notepadqq
notepadqq-gtk
notepadqq-common
numix-gtk-theme
numix-icon-theme
numix-icon-theme-circle
numix-icon-theme-square
numix-gtk-theme
numix-icon-theme
numix-icon-theme-circle
numix-icon-theme-square
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-check-the-list-of-packages-installed-from-particular-repository/

作者：[Prakash Subramanian][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/install-enable-epel-repository-on-rhel-centos-scientific-linux-oracle-linux/
[2]: https://www.2daygeek.com/category/repository/
[3]: https://www.2daygeek.com/install-enable-elrepo-on-rhel-centos-scientific-linux/
[4]: https://www.2daygeek.com/additional-yum-repositories-for-centos-rhel-fedora-systems/
[5]: https://www.2daygeek.com/install-enable-rpm-fusion-repository-on-centos-fedora-rhel/
[6]: https://fedoraproject.org/wiki/Third_party_repositories
[7]: https://www.2daygeek.com/install-enable-packman-repository-on-opensuse-leap/
[8]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[9]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[10]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[11]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
