hankchow translating

Check Linux Distribution Name and Version
======
You have joined new company and want to install some software’s which is requested by DevApp team, also want to restart few of the service after installation. What to do?

In this situation at least you should know what Distribution & Version is running on it. It will help you perform the activity without any issue.

Administrator should gather some of the information about the system before doing any activity, which is first task for him.

There are many ways to find the Linux distribution name and version. You might ask, why i want to know this basic things?

We have four major distributions such as RHEL, Debian, openSUSE & Arch Linux. Each distribution comes with their own package manager which help us to install packages on the system.

If you don’t know the distribution name then you wont be able to perform the package installation.

Also you won’t able to run the proper command for service bounces because most of the distributions implemented systemd command instead of SysVinit script.

It’s good to have the basic commands which will helps you in many ways.

Use the following Methods to Check Your Linux Distribution Name and Version.

### List of methods

  * lsb_release command
  * /etc/*-release file
  * uname command
  * /proc/version file
  * dmesg Command
  * YUM or DNF Command
  * RPM command
  * APT-GET command



### Method-1: lsb_release Command

LSB stands for Linux Standard Base that prints distribution-specific information such as Distribution name, Release version and codename.
```
# lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description: Ubuntu 16.04.3 LTS
Release: 16.04
Codename: xenial

```

### Method-2: /etc/arch-release /etc/os-release File

release file typically known as Operating system identification. The `/etc` directory contains many files that contains various information about the distribution. Each distribution has their own set of files, which display this information.

The below set of files are present on Ubuntu/Debian system.
```
# cat /etc/issue
Ubuntu 16.04.3 LTS \n \l

# cat /etc/issue.net
Ubuntu 16.04.3 LTS

# cat /etc/lsb-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=16.04
DISTRIB_CODENAME=xenial
DISTRIB_DESCRIPTION="Ubuntu 16.04.3 LTS"

# cat /etc/os-release
NAME="Ubuntu"
VERSION="16.04.3 LTS (Xenial Xerus)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 16.04.3 LTS"
VERSION_ID="16.04"
HOME_URL="http://www.ubuntu.com/"
SUPPORT_URL="http://help.ubuntu.com/"
BUG_REPORT_URL="http://bugs.launchpad.net/ubuntu/"
VERSION_CODENAME=xenial
UBUNTU_CODENAME=xenial

# cat /etc/debian_version
9.3

```

The below set of files are present on RHEL/CentOS/Fedora system. The `/etc/redhat-release` & `/etc/system-release` files symlinks with `/etc/[distro]-release` file.
```
# cat /etc/centos-release
CentOS release 6.9 (Final)

# cat /etc/fedora-release
Fedora release 27 (Twenty Seven)

# cat /etc/os-release
NAME=Fedora
VERSION="27 (Twenty Seven)"
ID=fedora
VERSION_ID=27
PRETTY_NAME="Fedora 27 (Twenty Seven)"
ANSI_COLOR="0;34"
CPE_NAME="cpe:/o:fedoraproject:fedora:27"
HOME_URL="https://fedoraproject.org/"
SUPPORT_URL="https://fedoraproject.org/wiki/Communicating_and_getting_help"
BUG_REPORT_URL="https://bugzilla.redhat.com/"
REDHAT_BUGZILLA_PRODUCT="Fedora"
REDHAT_BUGZILLA_PRODUCT_VERSION=27
REDHAT_SUPPORT_PRODUCT="Fedora"
REDHAT_SUPPORT_PRODUCT_VERSION=27
PRIVACY_POLICY_URL="https://fedoraproject.org/wiki/Legal:PrivacyPolicy"

# cat /etc/redhat-release
Fedora release 27 (Twenty Seven)

# cat /etc/system-release
Fedora release 27 (Twenty Seven)

```

### Method-3: uname Command

uname (stands for unix name) is an utility that prints the system information like kernel name, version and other details about the system and the operating system running on it.

**Suggested Read :** [6 Methods To Check The Running Linux Kernel Version On System][1]
```
# uname -a
Linux localhost.localdomain 4.12.14-300.fc26.x86_64 #1 SMP Wed Sep 20 16:28:07 UTC 2017 x86_64 x86_64 x86_64 GNU/Linux

```

The above colored words describe the version of operating system as Fedora Core 26.

### Method-4: /proc/version File

This file specifies the version of the Linux kernel, the version of gcc used to compile the kernel, and the time of kernel compilation. It also contains the kernel compiler’s user name (in parentheses).
```
# cat /proc/version
Linux version 4.12.14-300.fc26.x86_64 ([email protected]) (gcc version 7.2.1 20170915 (Red Hat 7.2.1-2) (GCC) ) #1 SMP Wed Sep 20 16:28:07 UTC 2017

```

### Method-5: dmesg Command

dmesg (stands for display message or driver message) is a command on most Unix-like operating systems that prints the message buffer of the kernel.
```
# dmesg | grep "Linux"
[ 0.000000] Linux version 4.12.14-300.fc26.x86_64 ([email protected]) (gcc version 7.2.1 20170915 (Red Hat 7.2.1-2) (GCC) ) #1 SMP Wed Sep 20 16:28:07 UTC 2017
[ 0.001000] SELinux: Initializing.
[ 0.001000] SELinux: Starting in permissive mode
[ 0.470288] SELinux: Registering netfilter hooks
[ 0.616351] Linux agpgart interface v0.103
[ 0.630063] usb usb1: Manufacturer: Linux 4.12.14-300.fc26.x86_64 ehci_hcd
[ 0.688949] usb usb2: Manufacturer: Linux 4.12.14-300.fc26.x86_64 ohci_hcd
[ 2.564554] SELinux: Disabled at runtime.
[ 2.564584] SELinux: Unregistering netfilter hooks

```

### Method-6: Yum/Dnf Command

Yum (Yellowdog Updater Modified) is one of the package manager utility in Linux operating system. Yum command is used to install, update, search & remove packages on some Linux distributions based on RedHat.

**Suggested Read :** [YUM Command To Manage Packages on RHEL/CentOS Systems][2]
```
# yum info nano
Loaded plugins: fastestmirror, ovl
Loading mirror speeds from cached hostfile
 * base: centos.zswap.net
 * extras: mirror2.evolution-host.com
 * updates: centos.zswap.net
Available Packages
Name : nano
Arch : x86_64
Version : 2.3.1
Release : 10.el7
Size : 440 k
Repo : base/7/x86_64
Summary : A small text editor
URL : http://www.nano-editor.org
License : GPLv3+
Description : GNU nano is a small and friendly text editor.

```

The below yum repolist command shows that Base, Extras, and Updates repositories are coming from CentOS 7 repository.
```
# yum repolist
Loaded plugins: fastestmirror, ovl
Loading mirror speeds from cached hostfile
 * base: centos.zswap.net
 * extras: mirror2.evolution-host.com
 * updates: centos.zswap.net
repo id repo name status
base/7/x86_64 CentOS-7 - Base 9591
extras/7/x86_64 CentOS-7 - Extras 388
updates/7/x86_64 CentOS-7 - Updates 1929
repolist: 11908

```

We can also use Dnf command to check distribution name and version.

**Suggested Read :** [DNF (Fork of YUM) Command To Manage Packages on Fedora System][3]
```
# dnf info nano
Last metadata expiration check: 0:01:25 ago on Thu Feb 15 01:59:31 2018.
Installed Packages
Name : nano
Version : 2.8.7
Release : 1.fc27
Arch : x86_64
Size : 2.1 M
Source : nano-2.8.7-1.fc27.src.rpm
Repo : @System
From repo : fedora
Summary : A small text editor
URL : https://www.nano-editor.org
License : GPLv3+
Description : GNU nano is a small and friendly text editor.

```

### Method-7: RPM Command

RPM stands for RedHat Package Manager is a powerful, command line Package Management utility for Red Hat based system such as CentOS, Oracle Linux & Fedora. This help us to identify the running system version.

**Suggested Read :** [RPM commands to manage packages on RHEL based systems][4]
```
# rpm -q nano
nano-2.8.7-1.fc27.x86_64

```

### Method-8: APT-GET Command

Apt-Get stands for Advanced Packaging Tool (APT). apg-get is a powerful command-line tool which is used to automatically download and install new software packages, upgrade existing software packages, update the package list index, and to upgrade the entire Debian based systems.

**Suggested Read :** [Apt-Get & Apt-Cache commands to manage packages on Debian Based Systems][5]
```
# apt-cache policy nano
nano:
 Installed: 2.5.3-2ubuntu2
 Candidate: 2.5.3-2ubuntu2
 Version table:
 * 2.5.3-2ubuntu2 500
 500 http://nova.clouds.archive.ubuntu.com/ubuntu xenial-updates/main amd64 Packages
 100 /var/lib/dpkg/status
 2.5.3-2 500
 500 http://nova.clouds.archive.ubuntu.com/ubuntu xenial/main amd64 Packages

```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/check-find-linux-distribution-name-and-version/

作者：[Magesh Maruthamuthu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/magesh/
[1]:https://www.2daygeek.com/check-find-determine-running-installed-linux-kernel-version/
[2]:https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[3]:https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[4]:https://www.2daygeek.com/rpm-command-examples/
[5]:https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
