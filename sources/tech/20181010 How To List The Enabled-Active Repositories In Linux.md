How To List The Enabled/Active Repositories In Linux
======
There are many ways to list enabled repositories in Linux.

Here we are going to show you the easy methods to list active repositories.

It will helps you to know what are the repositories enabled on your system.

Once you have this information in handy then you can add any repositories that you want if it’s not already enabled.

Say for example, if you would like to enable `epel repository` then you need to check whether the epel repository is enabled or not. In this case this tutorial would help you.

### What Is Repository?

A software repository is a central place which stores the software packages for the particular application.

All the Linux distributions are maintaining their own repositories and they allow users to retrieve and install packages on their machine.

Each vendor offered a unique package management tool to manage their repositories such as search, install, update, upgrade, remove, etc.

Most of the Linux distributions comes as freeware except RHEL and SUSE. To access their repositories you need to buy a subscriptions.

**Suggested Read :**
**(#)** [How To Add, Enable And Disable A Repository By Using The DNF/YUM Config Manager Command On Linux][1]
**(#)** [How To List Installed Packages By Size (Largest) On Linux][2]
**(#)** [How To View/List The Available Packages Updates In Linux][3]
**(#)** [How To View A Particular Package Installed/Updated/Upgraded/Removed/Erased Date On Linux][4]
**(#)** [How To View Detailed Information About A Package In Linux][5]
**(#)** [How To Search If A Package Is Available On Your Linux Distribution Or Not][6]
**(#)** [How To List An Available Package Groups In Linux][7]
**(#)** [Newbies corner – A Graphical frontend tool for Linux Package Manager][8]
**(#)** [Linux Expert should knows, list of Command line Package Manager & Usage][9]

### How To List The Enabled Repositories on RHEL/CentOS

RHEL & CentOS systems are using RPM packages hence we can use the `Yum Package Manager` to get this information.

YUM stands for Yellowdog Updater, Modified is an open-source command-line front-end package-management utility for RPM based systems such as Red Hat Enterprise Linux (RHEL) and CentOS.

Yum is the primary tool for getting, installing, deleting, querying, and managing RPM packages from distribution repositories, as well as other third-party repositories.

**Suggested Read :** [YUM Command To Manage Packages on RHEL/CentOS Systems][10]

RHEL based systems are mainly offering the below three major repositories. These repository will be enabled by default.

  * **`base:`** It’s containing all the core packages and base packages.
  * **`extras:`** It provides additional functionality to CentOS without breaking upstream compatibility or updating base components. It is an upstream repository, as well as additional CentOS packages.
  * **`updates:`** It’s offering bug fixed packages, Security packages and Enhancement packages.



```
# yum repolist
or
# yum repolist enabled

Loaded plugins: fastestmirror
Determining fastest mirrors
 选题模板.txt 中文排版指北.md comic core.md Dict.md lctt2014.md lctt2016.md lctt2018.md LCTT翻译规范.md LICENSE Makefile published README.md sign.md sources translated epel: ewr.edge.kernel.org
repo id repo name status
!base/7/x86_64 CentOS-7 - Base 9,911
!epel/x86_64 Extra Packages for Enterprise Linux 7 - x86_64 12,687
!extras/7/x86_64 CentOS-7 - Extras 403
!updates/7/x86_64 CentOS-7 - Updates 1,348
repolist: 24,349

```

### How To List The Enabled Repositories on Fedora

DNF stands for Dandified yum. We can tell DNF, the next generation of yum package manager (Fork of Yum) using hawkey/libsolv library for backend. Aleš Kozumplík started working on DNF since Fedora 18 and its implemented/launched in Fedora 22 finally.

Dnf command is used to install, update, search & remove packages on Fedora 22 and later system. It automatically resolve dependencies and make it smooth package installation without any trouble.

Yum replaced by DNF due to several long-term problems in Yum which was not solved. Asked why ? he did not patches the Yum issues. Aleš Kozumplík explains that patching was technically hard and YUM team wont accept the changes immediately and other major critical, YUM is 56K lines but DNF is 29K lies. So, there is no option for further development, except to fork.

**Suggested Read :** [DNF (Fork of YUM) Command To Manage Packages on Fedora System][11]

Fedora system is mainly offering the below two major repositories. These repository will be enabled by default.

  * **`fedora:`** It’s containing all the core packages and base packages.
  * **`updates:`** It’s offering bug fixed packages, Security packages and Enhancement packages from the stable release branch.



```
# dnf repolist
or
# dnf repolist enabled

Last metadata expiration check: 0:02:56 ago on Wed 10 Oct 2018 06:12:22 PM IST.
repo id repo name status
docker-ce-stable Docker CE Stable - x86_64 6
*fedora Fedora 26 - x86_64 53,912
home_mhogomchungu mhogomchungu's Home Project (Fedora_25) 19
home_moritzmolch_gencfsm Gnome Encfs Manager (Fedora_25) 5
mystro256-gnome-redshift Copr repo for gnome-redshift owned by mystro256 6
nodesource Node.js Packages for Fedora Linux 26 - x86_64 83
rabiny-albert Copr repo for albert owned by rabiny 3
*rpmfusion-free RPM Fusion for Fedora 26 - Free 536
*rpmfusion-free-updates RPM Fusion for Fedora 26 - Free - Updates 278
*rpmfusion-nonfree RPM Fusion for Fedora 26 - Nonfree 202
*rpmfusion-nonfree-updates RPM Fusion for Fedora 26 - Nonfree - Updates 95
*updates Fedora 26 - x86_64 - Updates 14,595

```

### How To List The Enabled Repositories on Debian/Ubuntu

Debian based systems are using APT/APT-GET package manager hence we can use the `APT/APT-GET Package Manager` to get this information.

APT stands for Advanced Packaging Tool (APT) which is replacement for apt-get, like how DNF came to picture instead of YUM. It’s feature rich command-line tools with included all the futures in one command (APT) such as apt-cache, apt-search, dpkg, apt-cdrom, apt-config, apt-key, etc..,. and several other unique features. For example we can easily install .dpkg packages through APT but we can’t do through Apt-Get similar more features are included into APT command. APT-GET replaced by APT Due to lock of futures missing in apt-get which was not solved.

Apt-Get stands for Advanced Packaging Tool (APT). apg-get is a powerful command-line tool which is used to automatically download and install new software packages, upgrade existing software packages, update the package list index, and to upgrade the entire Debian based systems.

```
# apt-cache policy
Package files:
 100 /var/lib/dpkg/status
 release a=now
 500 http://ppa.launchpad.net/peek-developers/stable/ubuntu artful/main amd64 Packages
 release v=17.10,o=LP-PPA-peek-developers-stable,a=artful,n=artful,l=Peek stable releases,c=main,b=amd64
 origin ppa.launchpad.net
 500 http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu artful/main amd64 Packages
 release v=17.10,o=LP-PPA-notepadqq-team-notepadqq,a=artful,n=artful,l=Notepadqq,c=main,b=amd64
 origin ppa.launchpad.net
 500 http://dl.google.com/linux/chrome/deb stable/main amd64 Packages
 release v=1.0,o=Google, Inc.,a=stable,n=stable,l=Google,c=main,b=amd64
 origin dl.google.com
 500 https://download.docker.com/linux/ubuntu artful/stable amd64 Packages
 release o=Docker,a=artful,l=Docker CE,c=stable,b=amd64
 origin download.docker.com
 500 http://security.ubuntu.com/ubuntu artful-security/multiverse amd64 Packages
 release v=17.10,o=Ubuntu,a=artful-security,n=artful,l=Ubuntu,c=multiverse,b=amd64
 origin security.ubuntu.com
 500 http://security.ubuntu.com/ubuntu artful-security/universe amd64 Packages
 release v=17.10,o=Ubuntu,a=artful-security,n=artful,l=Ubuntu,c=universe,b=amd64
 origin security.ubuntu.com
 500 http://security.ubuntu.com/ubuntu artful-security/restricted i386 Packages
 release v=17.10,o=Ubuntu,a=artful-security,n=artful,l=Ubuntu,c=restricted,b=i386
 origin security.ubuntu.com
.
.
 origin in.archive.ubuntu.com
 500 http://in.archive.ubuntu.com/ubuntu artful/restricted amd64 Packages
 release v=17.10,o=Ubuntu,a=artful,n=artful,l=Ubuntu,c=restricted,b=amd64
 origin in.archive.ubuntu.com
 500 http://in.archive.ubuntu.com/ubuntu artful/main i386 Packages
 release v=17.10,o=Ubuntu,a=artful,n=artful,l=Ubuntu,c=main,b=i386
 origin in.archive.ubuntu.com
 500 http://in.archive.ubuntu.com/ubuntu artful/main amd64 Packages
 release v=17.10,o=Ubuntu,a=artful,n=artful,l=Ubuntu,c=main,b=amd64
 origin in.archive.ubuntu.com
Pinned packages:

```

### How To List The Enabled Repositories on openSUSE

openSUSE system uses zypper package manager hence we can use the zypper Package Manager to get this information.

Zypper is a command line package manager for suse & openSUSE distributions. It’s used to install, update, search & remove packages & manage repositories, perform various queries, and more. Zypper command-line interface to ZYpp system management library (libzypp).

**Suggested Read :** [Zypper Command To Manage Packages On openSUSE & suse Systems][12]

```
# zypper repos

# | Alias | Name | Enabled | GPG Check | Refresh
--+-----------------------+-----------------------------------------------------+---------+-----------+--------
1 | packman-repository | packman-repository | Yes | (r ) Yes | Yes
2 | google-chrome | google-chrome | Yes | (r ) Yes | Yes
3 | home_lazka0_ql-stable | Stable Quod Libet / Ex Falso Builds (openSUSE_42.1) | Yes | (r ) Yes | No
4 | repo-non-oss | openSUSE-leap/42.1-Non-Oss | Yes | (r ) Yes | Yes
5 | repo-oss | openSUSE-leap/42.1-Oss | Yes | (r ) Yes | Yes
6 | repo-update | openSUSE-42.1-Update | Yes | (r ) Yes | Yes
7 | repo-update-non-oss | openSUSE-42.1-Update-Non-Oss | Yes | (r ) Yes | Yes

```

List Repositories with URI.

```
# zypper lr -u

# | Alias | Name | Enabled | GPG Check | Refresh | URI
--+-----------------------+-----------------------------------------------------+---------+-----------+---------+---------------------------------------------------------------------------------
1 | packman-repository | packman-repository | Yes | (r ) Yes | Yes | http://ftp.gwdg.de/pub/linux/packman/suse/openSUSE_Leap_42.1/
2 | google-chrome | google-chrome | Yes | (r ) Yes | Yes | http://dl.google.com/linux/chrome/rpm/stable/x86_64
3 | home_lazka0_ql-stable | Stable Quod Libet / Ex Falso Builds (openSUSE_42.1) | Yes | (r ) Yes | No | http://download.opensuse.org/repositories/home:/lazka0:/ql-stable/openSUSE_42.1/
4 | repo-non-oss | openSUSE-leap/42.1-Non-Oss | Yes | (r ) Yes | Yes | http://download.opensuse.org/distribution/leap/42.1/repo/non-oss/
5 | repo-oss | openSUSE-leap/42.1-Oss | Yes | (r ) Yes | Yes | http://download.opensuse.org/distribution/leap/42.1/repo/oss/
6 | repo-update | openSUSE-42.1-Update | Yes | (r ) Yes | Yes | http://download.opensuse.org/update/leap/42.1/oss/
7 | repo-update-non-oss | openSUSE-42.1-Update-Non-Oss | Yes | (r ) Yes | Yes | http://download.opensuse.org/update/leap/42.1/non-oss/

```

List Repositories by priority.

```
# zypper lr -p

# | Alias | Name | Enabled | GPG Check | Refresh | Priority
--+-----------------------+-----------------------------------------------------+---------+-----------+---------+---------
1 | packman-repository | packman-repository | Yes | (r ) Yes | Yes | 99
2 | google-chrome | google-chrome | Yes | (r ) Yes | Yes | 99
3 | home_lazka0_ql-stable | Stable Quod Libet / Ex Falso Builds (openSUSE_42.1) | Yes | (r ) Yes | No | 99
4 | repo-non-oss | openSUSE-leap/42.1-Non-Oss | Yes | (r ) Yes | Yes | 99
5 | repo-oss | openSUSE-leap/42.1-Oss | Yes | (r ) Yes | Yes | 99
6 | repo-update | openSUSE-42.1-Update | Yes | (r ) Yes | Yes | 99
7 | repo-update-non-oss | openSUSE-42.1-Update-Non-Oss | Yes | (r ) Yes | Yes | 99

```

### How To List The Enabled Repositories on ArchLinux

Arch Linux based systems are using pacman package manager hence we can use the pacman Package Manager to get this information.

pacman stands for package manager utility (pacman). pacman is a command-line utility to install, build, remove and manage Arch Linux packages. pacman uses libalpm (Arch Linux Package Management (ALPM) library) as a back-end to perform all the actions.

**Suggested Read :** [Pacman Command To Manage Packages On Arch Linux Based Systems][13]

```
# pacman -Syy
:: Synchronizing package databases...
 core 132.6 KiB 1524K/s 00:00 [############################################] 100%
 extra 1859.0 KiB 750K/s 00:02 [############################################] 100%
 community 3.5 MiB 149K/s 00:24 [############################################] 100%
 multilib 182.7 KiB 1363K/s 00:00 [############################################] 100%

```

### How To List The Enabled Repositories on Linux using INXI Utility

inxi is a nifty tool to check hardware information on Linux and offers wide range of option to get all the hardware information on Linux system that i never found in any other utility which are available in Linux. It was forked from the ancient and mindbendingly perverse yet ingenius infobash, by locsmif.

inxi is a script that quickly shows system hardware, CPU, drivers, Xorg, Desktop, Kernel, GCC version(s), Processes, RAM usage, and a wide variety of other useful information, also used for forum technical support & debugging tool.

Additionally this utility will display all the distribution repository data information such as RHEL, CentOS, Fedora, Debain, Ubuntu, LinuxMint, ArchLinux, openSUSE, Manjaro, etc.,

**Suggested Read :** [inxi – A Great Tool to Check Hardware Information on Linux][14]

```
# inxi -r
Repos: Active apt sources in file: /etc/apt/sources.list
 deb http://in.archive.ubuntu.com/ubuntu/ yakkety main restricted
 deb http://in.archive.ubuntu.com/ubuntu/ yakkety-updates main restricted
 deb http://in.archive.ubuntu.com/ubuntu/ yakkety universe
 deb http://in.archive.ubuntu.com/ubuntu/ yakkety-updates universe
 deb http://in.archive.ubuntu.com/ubuntu/ yakkety multiverse
 deb http://in.archive.ubuntu.com/ubuntu/ yakkety-updates multiverse
 deb http://in.archive.ubuntu.com/ubuntu/ yakkety-backports main restricted universe multiverse
 deb http://security.ubuntu.com/ubuntu yakkety-security main restricted
 deb http://security.ubuntu.com/ubuntu yakkety-security universe
 deb http://security.ubuntu.com/ubuntu yakkety-security multiverse
 Active apt sources in file: /etc/apt/sources.list.d/arc-theme.list
 deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /
 Active apt sources in file: /etc/apt/sources.list.d/snwh-ubuntu-pulp-yakkety.list
 deb http://ppa.launchpad.net/snwh/pulp/ubuntu yakkety main

```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-list-the-enabled-active-repositories-in-linux/

作者：[Prakash Subramanian][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/how-to-add-enable-disable-a-repository-dnf-yum-config-manager-on-linux/
[2]: https://www.2daygeek.com/how-to-list-installed-packages-by-size-largest-on-linux/
[3]: https://www.2daygeek.com/how-to-view-list-the-available-packages-updates-in-linux/
[4]: https://www.2daygeek.com/how-to-view-a-particular-package-installed-updated-upgraded-removed-erased-date-on-linux/
[5]: https://www.2daygeek.com/how-to-view-detailed-information-about-a-package-in-linux/
[6]: https://www.2daygeek.com/how-to-search-if-a-package-is-available-on-your-linux-distribution-or-not/
[7]: https://www.2daygeek.com/how-to-list-an-available-package-groups-in-linux/
[8]: https://www.2daygeek.com/list-of-graphical-frontend-tool-for-linux-package-manager/
[9]: https://www.2daygeek.com/list-of-command-line-package-manager-for-linux/
[10]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[11]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[12]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[13]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[14]: https://www.2daygeek.com/inxi-system-hardware-information-on-linux/
