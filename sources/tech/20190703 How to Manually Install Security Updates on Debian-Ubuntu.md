[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Manually Install Security Updates on Debian/Ubuntu?)
[#]: via: (https://www.2daygeek.com/manually-install-security-updates-ubuntu-debian/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How to Manually Install Security Updates on Debian/Ubuntu?
======

Installing a package in Linux from command line is a simple task.

In a single command or combining of multiple commands could make you to complete your task easily.

The same can be done for security updates as well.

In this tutorial, we will show you how to check available security update and install them on Debian based systems such as Ubuntu, LinuxMint, etc,.

It can be done using three methods. All these methods are described in this article in details.

As a Linux administrator, you should keep your system up-to-date, that makes your system more secure. It protects your system against unwanted attack.

If you are not able to patch entire system with all updates due to some application dependency. At-least, you should install only security patches to make your system 100% compliance.

### How to Install unattended-upgrades package in Debian/Ubuntu?

By default `unattended-upgrades` package should be installed on your system. But in case if it’s not installed use the following command to install it.

Use **[APT-GET Command][1]** or **[APT Command][2]** to install unattended-upgrades package.

```
$ sudo apt-get install unattended-upgrades
or
$ sudo apt install unattended-upgrades
```

### Method-1: How to Check if any Security Updates are available in Debian/Ubuntu?

It’s always a good practice to check list of available security updates before performing the patch installation. It will give you the list of packages that are going to be updated in your system.

**What’s dry run?** Most of the Linux commands have a dry run option, which stimulate the actual output but nothing will be downloaded or installed.

To do so, you need to add `--dry-run` option with unattended-upgrades command.

```
$ sudo unattended-upgrade --dry-run -d

Initial blacklisted packages:
Initial whitelisted packages:
Starting unattended upgrades script
Allowed origins are: o=Ubuntu,a=bionic, o=Ubuntu,a=bionic-security, o=UbuntuESM,a=bionic
Using (^linux-image-[0-9]+\.[0-9\.]+-.*|^linux-headers-[0-9]+\.[0-9\.]+-.*|^linux-image-extra-[0-9]+\.[0-9\.]+-.*|^linux-modules-[0-9]+\.[0-9\.]+-.*|^linux-modules-extra-[0-9]+\.[0-9\.]+-.*|^linux-signed-image-[0-9]+\.[0-9\.]+-.*|^kfreebsd-image-[0-9]+\.[0-9\.]+-.*|^kfreebsd-headers-[0-9]+\.[0-9\.]+-.*|^gnumach-image-[0-9]+\.[0-9\.]+-.*|^.*-modules-[0-9]+\.[0-9\.]+-.*|^.*-kernel-[0-9]+\.[0-9\.]+-.*|^linux-backports-modules-.*-[0-9]+\.[0-9\.]+-.*|^linux-modules-.*-[0-9]+\.[0-9\.]+-.*|^linux-tools-[0-9]+\.[0-9\.]+-.*|^linux-cloud-tools-[0-9]+\.[0-9\.]+-.*) regexp to find kernel packages
Using (^linux-image-4\.15\.0\-51\-generic$|^linux-headers-4\.15\.0\-51\-generic$|^linux-image-extra-4\.15\.0\-51\-generic$|^linux-modules-4\.15\.0\-51\-generic$|^linux-modules-extra-4\.15\.0\-51\-generic$|^linux-signed-image-4\.15\.0\-51\-generic$|^kfreebsd-image-4\.15\.0\-51\-generic$|^kfreebsd-headers-4\.15\.0\-51\-generic$|^gnumach-image-4\.15\.0\-51\-generic$|^.*-modules-4\.15\.0\-51\-generic$|^.*-kernel-4\.15\.0\-51\-generic$|^linux-backports-modules-.*-4\.15\.0\-51\-generic$|^linux-modules-.*-4\.15\.0\-51\-generic$|^linux-tools-4\.15\.0\-51\-generic$|^linux-cloud-tools-4\.15\.0\-51\-generic$) regexp to find running kernel packages
Checking: apt ([])
adjusting candidate version: apt=1.6.6ubuntu0.1
Checking: apt-utils ([])
adjusting candidate version: apt-utils=1.6.6ubuntu0.1
Checking: bash ([])
.
.
Checking: xxd ([, ])
pkgs that look like they should be upgraded: binutils
binutils-common
binutils-x86-64-linux-gnu
cpp
cpp-7
dbus
dbus-user-session
dbus-x11
firefox
firefox-locale-en
g++
g++-7
gcc
gcc-7
gcc-7-base
gcc-8-base
libasan4
libatomic1
libbinutils
libcc1-0
libcilkrts5
libdbus-1-3
libdbus-1-dev
libgcc-7-dev
libgcc1
libgfortran4
libgomp1
libitm1
liblsan0
libmpx2
libquadmath0
libstdc++-7-dev
libstdc++6
libtsan0
libubsan0
vim-common
vim-tiny
xxd
```

If the above command output says **“No packages found that can be upgraded unattended and no pending auto-removals”** in the Terminal, this implies your System is up-to-date.

### How to Install available Security Updates in Debian/Ubuntu?

If your got any package updates in the above command output. Then run the following command to install them.

```
$ sudo unattended-upgrade -d
```

Alternatively this can be done from apt-get command. It’s bit tricky. However, i would suggest users to go with first option.

### Method-2: How to Check if any Security Updates are available in Debian/Ubuntu Using apt-get Command?

Run the following command to check list of available security updates in your Debian/Ubuntu system

```
$ sudo apt-get -s dist-upgrade | grep "^Inst" | grep -i securi

Inst libquadmath0 [8.2.0-1ubuntu2~18.04] (8.3.0-6ubuntu1~18.04.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64]) []
Inst libitm1 [8.2.0-1ubuntu2~18.04] (8.3.0-6ubuntu1~18.04.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64]) []
Inst gcc-8-base [8.2.0-1ubuntu2~18.04] (8.3.0-6ubuntu1~18.04.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64]) [libmpx2:amd64 libgcc1:amd64 libtsan0:amd64 liblsan0:amd64 libgomp1:amd64 libatomic1:amd64 libcc1-0:amd64 libstdc++6:amd64 ]
Inst libgcc1 [1:8.2.0-1ubuntu2~18.04] (1:8.3.0-6ubuntu1~18.04.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64]) [libmpx2:amd64 libtsan0:amd64 liblsan0:amd64 libgomp1:amd64 libatomic1:amd64 libcc1-0:amd64 libstdc++6:amd64 ]
Inst libmpx2 [8.2.0-1ubuntu2~18.04] (8.3.0-6ubuntu1~18.04.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64]) [libtsan0:amd64 liblsan0:amd64 libgomp1:amd64 libatomic1:amd64 libcc1-0:amd64 libstdc++6:amd64 ]
Inst liblsan0 [8.2.0-1ubuntu2~18.04] (8.3.0-6ubuntu1~18.04.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64]) [libtsan0:amd64 libgomp1:amd64 libatomic1:amd64 libcc1-0:amd64 libstdc++6:amd64 ]
Inst libtsan0 [8.2.0-1ubuntu2~18.04] (8.3.0-6ubuntu1~18.04.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64]) [libgomp1:amd64 libatomic1:amd64 libcc1-0:amd64 libstdc++6:amd64 ]
Inst libcc1-0 [8.2.0-1ubuntu2~18.04] (8.3.0-6ubuntu1~18.04.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64]) [libgomp1:amd64 libatomic1:amd64 libstdc++6:amd64 ]
Inst libatomic1 [8.2.0-1ubuntu2~18.04] (8.3.0-6ubuntu1~18.04.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64]) [libgomp1:amd64 libstdc++6:amd64 ]
Inst libgomp1 [8.2.0-1ubuntu2~18.04] (8.3.0-6ubuntu1~18.04.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64]) [libstdc++6:amd64 ]
Inst libstdc++6 [8.2.0-1ubuntu2~18.04] (8.3.0-6ubuntu1~18.04.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64])
Inst libdbus-1-dev [1.12.2-1ubuntu1] (1.12.2-1ubuntu1.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64]) []
Inst dbus-user-session [1.12.2-1ubuntu1] (1.12.2-1ubuntu1.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64]) []
Inst dbus-x11 [1.12.2-1ubuntu1] (1.12.2-1ubuntu1.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64]) []
Inst dbus [1.12.2-1ubuntu1] (1.12.2-1ubuntu1.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64]) []
Inst libdbus-1-3 [1.12.2-1ubuntu1] (1.12.2-1ubuntu1.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64])
Inst xxd [2:8.0.1453-1ubuntu1] (2:8.0.1453-1ubuntu1.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64])
Inst vim-tiny [2:8.0.1453-1ubuntu1] (2:8.0.1453-1ubuntu1.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64]) []
Inst vim-common [2:8.0.1453-1ubuntu1] (2:8.0.1453-1ubuntu1.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [all])
Inst binutils-x86-64-linux-gnu [2.30-21ubuntu1~18.04] (2.30-21ubuntu1~18.04.2 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64]) [binutils:amd64 ]
Inst binutils-common [2.30-21ubuntu1~18.04] (2.30-21ubuntu1~18.04.2 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64]) [binutils:amd64 libbinutils:amd64 ]
Inst binutils [2.30-21ubuntu1~18.04] (2.30-21ubuntu1~18.04.2 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64]) [libbinutils:amd64 ]
Inst libbinutils [2.30-21ubuntu1~18.04] (2.30-21ubuntu1~18.04.2 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64])
Inst libasan4 [7.3.0-27ubuntu1~18.04] (7.4.0-1ubuntu1~18.04.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64]) []
Inst libubsan0 [7.3.0-27ubuntu1~18.04] (7.4.0-1ubuntu1~18.04.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64]) []
Inst libcilkrts5 [7.3.0-27ubuntu1~18.04] (7.4.0-1ubuntu1~18.04.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64]) []
Inst g++-7 [7.3.0-27ubuntu1~18.04] (7.4.0-1ubuntu1~18.04.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64]) []
Inst gcc-7 [7.3.0-27ubuntu1~18.04] (7.4.0-1ubuntu1~18.04.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64]) []
Inst libstdc++-7-dev [7.3.0-27ubuntu1~18.04] (7.4.0-1ubuntu1~18.04.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64]) []
Inst libgcc-7-dev [7.3.0-27ubuntu1~18.04] (7.4.0-1ubuntu1~18.04.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64]) []
Inst libgfortran4 [7.3.0-27ubuntu1~18.04] (7.4.0-1ubuntu1~18.04.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64]) []
Inst cpp-7 [7.3.0-27ubuntu1~18.04] (7.4.0-1ubuntu1~18.04.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64]) []
Inst gcc-7-base [7.3.0-27ubuntu1~18.04] (7.4.0-1ubuntu1~18.04.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64])
Inst cpp [4:7.3.0-3ubuntu2.1] (4:7.4.0-1ubuntu2.3 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64])
Inst firefox [67.0.1+build1-0ubuntu0.18.04.1] (67.0.2+build2-0ubuntu0.18.04.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64])
Inst firefox-locale-en [67.0.1+build1-0ubuntu0.18.04.1] (67.0.2+build2-0ubuntu0.18.04.1 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64])
Inst gcc [4:7.3.0-3ubuntu2.1] (4:7.4.0-1ubuntu2.3 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64])
Inst g++ [4:7.3.0-3ubuntu2.1] (4:7.4.0-1ubuntu2.3 Ubuntu:18.04/bionic-updates, Ubuntu:18.04/bionic-security [amd64])
```

### How to Install available Security Updates in Debian/Ubuntu Using apt-get Command?

If you found any package updates in the above output. Finally run the following command to install them.

```
$ sudo apt-get -s dist-upgrade | grep "^Inst" | grep -i securi | awk -F " " {'print $2'} | xargs apt-get install
```

Alternatively this can be done from apt command. It’s bit tricky. However, i would suggest users to go with first option.

### Method-3: How to Check if any Security Updates are available in Debian/Ubuntu Using apt Command?

Run the following command to check list of available security updates in your Debian/Ubuntu system

```
$ sudo apt list --upgradable | grep -e "-security"

binutils/bionic-updates,bionic-security 2.30-21ubuntu1~18.04.2 amd64 [upgradable from: 2.30-21ubuntu1~18.04]
binutils-common/bionic-updates,bionic-security 2.30-21ubuntu1~18.04.2 amd64 [upgradable from: 2.30-21ubuntu1~18.04]
binutils-x86-64-linux-gnu/bionic-updates,bionic-security 2.30-21ubuntu1~18.04.2 amd64 [upgradable from: 2.30-21ubuntu1~18.04]
cpp/bionic-updates,bionic-security 4:7.4.0-1ubuntu2.3 amd64 [upgradable from: 4:7.3.0-3ubuntu2.1]
cpp-7/bionic-updates,bionic-security 7.4.0-1ubuntu1~18.04.1 amd64 [upgradable from: 7.3.0-27ubuntu1~18.04]
dbus/bionic-updates,bionic-security 1.12.2-1ubuntu1.1 amd64 [upgradable from: 1.12.2-1ubuntu1]
dbus-user-session/bionic-updates,bionic-security 1.12.2-1ubuntu1.1 amd64 [upgradable from: 1.12.2-1ubuntu1]
dbus-x11/bionic-updates,bionic-security 1.12.2-1ubuntu1.1 amd64 [upgradable from: 1.12.2-1ubuntu1]
firefox/bionic-updates,bionic-security 67.0.2+build2-0ubuntu0.18.04.1 amd64 [upgradable from: 67.0.1+build1-0ubuntu0.18.04.1]
firefox-locale-en/bionic-updates,bionic-security 67.0.2+build2-0ubuntu0.18.04.1 amd64 [upgradable from: 67.0.1+build1-0ubuntu0.18.04.1]
g++/bionic-updates,bionic-security 4:7.4.0-1ubuntu2.3 amd64 [upgradable from: 4:7.3.0-3ubuntu2.1]
g++-7/bionic-updates,bionic-security 7.4.0-1ubuntu1~18.04.1 amd64 [upgradable from: 7.3.0-27ubuntu1~18.04]
gcc/bionic-updates,bionic-security 4:7.4.0-1ubuntu2.3 amd64 [upgradable from: 4:7.3.0-3ubuntu2.1]
gcc-7/bionic-updates,bionic-security 7.4.0-1ubuntu1~18.04.1 amd64 [upgradable from: 7.3.0-27ubuntu1~18.04]
gcc-7-base/bionic-updates,bionic-security 7.4.0-1ubuntu1~18.04.1 amd64 [upgradable from: 7.3.0-27ubuntu1~18.04]
gcc-8-base/bionic-updates,bionic-security 8.3.0-6ubuntu1~18.04.1 amd64 [upgradable from: 8.2.0-1ubuntu2~18.04]
libasan4/bionic-updates,bionic-security 7.4.0-1ubuntu1~18.04.1 amd64 [upgradable from: 7.3.0-27ubuntu1~18.04]
libatomic1/bionic-updates,bionic-security 8.3.0-6ubuntu1~18.04.1 amd64 [upgradable from: 8.2.0-1ubuntu2~18.04]
libbinutils/bionic-updates,bionic-security 2.30-21ubuntu1~18.04.2 amd64 [upgradable from: 2.30-21ubuntu1~18.04]
libcc1-0/bionic-updates,bionic-security 8.3.0-6ubuntu1~18.04.1 amd64 [upgradable from: 8.2.0-1ubuntu2~18.04]
libcilkrts5/bionic-updates,bionic-security 7.4.0-1ubuntu1~18.04.1 amd64 [upgradable from: 7.3.0-27ubuntu1~18.04]
libdbus-1-3/bionic-updates,bionic-security 1.12.2-1ubuntu1.1 amd64 [upgradable from: 1.12.2-1ubuntu1]
libdbus-1-dev/bionic-updates,bionic-security 1.12.2-1ubuntu1.1 amd64 [upgradable from: 1.12.2-1ubuntu1]
libgcc-7-dev/bionic-updates,bionic-security 7.4.0-1ubuntu1~18.04.1 amd64 [upgradable from: 7.3.0-27ubuntu1~18.04]
libgcc1/bionic-updates,bionic-security 1:8.3.0-6ubuntu1~18.04.1 amd64 [upgradable from: 1:8.2.0-1ubuntu2~18.04]
libgfortran4/bionic-updates,bionic-security 7.4.0-1ubuntu1~18.04.1 amd64 [upgradable from: 7.3.0-27ubuntu1~18.04]
libgomp1/bionic-updates,bionic-security 8.3.0-6ubuntu1~18.04.1 amd64 [upgradable from: 8.2.0-1ubuntu2~18.04]
libitm1/bionic-updates,bionic-security 8.3.0-6ubuntu1~18.04.1 amd64 [upgradable from: 8.2.0-1ubuntu2~18.04]
liblsan0/bionic-updates,bionic-security 8.3.0-6ubuntu1~18.04.1 amd64 [upgradable from: 8.2.0-1ubuntu2~18.04]
libmpx2/bionic-updates,bionic-security 8.3.0-6ubuntu1~18.04.1 amd64 [upgradable from: 8.2.0-1ubuntu2~18.04]
libquadmath0/bionic-updates,bionic-security 8.3.0-6ubuntu1~18.04.1 amd64 [upgradable from: 8.2.0-1ubuntu2~18.04]
libstdc++-7-dev/bionic-updates,bionic-security 7.4.0-1ubuntu1~18.04.1 amd64 [upgradable from: 7.3.0-27ubuntu1~18.04]
libstdc++6/bionic-updates,bionic-security 8.3.0-6ubuntu1~18.04.1 amd64 [upgradable from: 8.2.0-1ubuntu2~18.04]
libtsan0/bionic-updates,bionic-security 8.3.0-6ubuntu1~18.04.1 amd64 [upgradable from: 8.2.0-1ubuntu2~18.04]
libubsan0/bionic-updates,bionic-security 7.4.0-1ubuntu1~18.04.1 amd64 [upgradable from: 7.3.0-27ubuntu1~18.04]
vim-common/bionic-updates,bionic-updates,bionic-security,bionic-security 2:8.0.1453-1ubuntu1.1 all [upgradable from: 2:8.0.1453-1ubuntu1]
vim-tiny/bionic-updates,bionic-security 2:8.0.1453-1ubuntu1.1 amd64 [upgradable from: 2:8.0.1453-1ubuntu1]
xxd/bionic-updates,bionic-security 2:8.0.1453-1ubuntu1.1 amd64 [upgradable from: 2:8.0.1453-1ubuntu1]
```

### How to Install available Security Updates in Debian/Ubuntu Using apt Command?

If you found any package updates in the above output. Finally run the following command to install them.

```
$ sudo apt list --upgradable | grep -e "-security" | awk -F "/" '{print $1}' | xargs apt install
```

Also, the following file will give you the packages update count.

```
$ sudo cat /var/lib/update-notifier/updates-available

190 packages can be updated.
39 updates are security updates.
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/manually-install-security-updates-ubuntu-debian/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[2]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
