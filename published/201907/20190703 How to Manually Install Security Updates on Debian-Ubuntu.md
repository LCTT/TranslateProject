[#]: collector: (lujun9972)
[#]: translator: (hopefully2333)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11132-1.html)
[#]: subject: (How to Manually Install Security Updates on Debian/Ubuntu?)
[#]: via: (https://www.2daygeek.com/manually-install-security-updates-ubuntu-debian/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何在 Debian/Ubuntu 上手动安装安全更新？
======

在 Linux 上通过命令行安装一个包程序是一件简单的事。在一行命令中组合使用多个命令能让你更加简单地完成任务。

安全更新也同样如此。

在这个教程里面，我们会向你展示如何查看可用的安全更新，以及如何在 Ubuntu、LinuxMint 等等这些基于 Debian 的系统中安装它们。

有三种方法可以完成这件事，下面会详细地描述这三种方法。

作为一个 Linux 管理员，你应该让你的系统保持为最新，这会让你的系统更安全，保护你的系统抵抗意想不到的攻击。

如果你因为一些应用的依赖问题不能解决，导致不能给所有的系统进行全部更新。那至少，你应该打上安全补丁来让你的系统 100% 符合要求。

### 方法一：如何检查 Debian/Ubuntu 中是否有任何可用的安全更新？

在进行补丁安装之前，检查可用安全更新列表始终是一个好习惯。它会为你提供将在你的系统中进行更新的软件包的列表。

默认情况下，你的系统上应该是已经安装了 `unattended-upgrades` 包的。但是如果你的系统没有装这个包，那么请使用下面的命令来安装它。

使用 [APT-GET 命令][1] 或者 [APT 命令][2] 来安装 `unattended-upgrades` 包。

```
$ sudo apt-get install unattended-upgrades
或
$ sudo apt install unattended-upgrades
```

**什么是试运行?** 大多数的 Linux 命令都有一个试运行选项，它会给出实际的输出但不会下载或安装任何东西。

为此，你需要在 `unattended-upgrades` 命令中添加 `--dry-run` 选项。

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

如果在终端里，上面的命令输出说 “No packages found that can be upgraded unattended and no pending auto-removals”，这意味着你的系统已经是最新的了。

#### 如何在 Debian/Ubuntu 中安装可用的安全更新？

如果你在上面的命令输出中获得了任意的软件包更新，就运行下面的命令来安装它们。

```
$ sudo unattended-upgrade -d
```

除此之外，你也可以使用 `apt-get` 命令来进行安装。但是这个方法有点棘手，我会建议用户用第一个选项。

### 方法二：如何使用 apt-get 命令在 Debian/Ubuntu 中检查是否有可用的安全更新？

在你的 Debian/Ubuntu 系统中运行下面的命令来查看可用安全更新的列表。

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

#### 如何使用 apt-get 命令在 Debian/Ubuntu 系统中安装可用的安全更新？

如果你在上面命令的输出中发现任何的软件包更新。就运行下面的命令来安装它们。

```
$ sudo apt-get -s dist-upgrade | grep "^Inst" | grep -i securi | awk -F " " {'print $2'} | xargs apt-get install
```

除此之外，也可以使用 `apt` 命令来完成。但是这个方法有点棘手，我会建议用户用第一个方式。

### 方法三：如何使用 apt 命令在 Debian/Ubuntu 系统中检查是否有可用的安全更新？

在 Debian/Ubuntu 系统中运行下面的命令来查看可用安全更新的列表。

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

#### 如何在 Debian/Ubuntu 系统中使用 apt 命令来安装可用的安全更新？

如果你在上面命令的输出中发现任何的软件包更新。就运行下面的命令来安装它们。

```
$ sudo apt list --upgradable | grep -e "-security" | awk -F "/" '{print $1}' | xargs apt install
```

同样，下面的文件也会告诉你更新包的总数。

```
$ sudo cat /var/lib/update-notifier/updates-available

190 packages can be updated.
39 updates are security updates.
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/manually-install-security-updates-ubuntu-debian/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[hopefully2333](https://github.com/hopefully2333)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[2]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
