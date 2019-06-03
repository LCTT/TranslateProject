[#]: collector: (lujun9972)
[#]: translator: (way-ww)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10923-1.html)
[#]: subject: (How To Install/Uninstall Listed Packages From A File In Linux?)
[#]: via: (https://www.2daygeek.com/how-to-install-uninstall-listed-packages-from-a-file-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何在 Linux 上安装/卸载一个文件中列出的软件包？
======

在某些情况下，你可能想要将一个服务器上的软件包列表安装到另一个服务器上。例如，你已经在服务器 A 上安装了 15 个软件包并且这些软件包也需要被安装到服务器 B、服务器 C 上等等。

我们可以手动去安装这些软件但是这将花费大量的时间。你可以手动安装一俩个服务器，但是试想如果你有大概十个服务器呢。在这种情况下你无法手动完成工作，那么怎样才能解决问题呢？

不要担心我们可以帮你摆脱这样的情况和场景。我们在这篇文章中增加了四种方法来克服困难。

我希望这可以帮你解决问题。我已经在 Centos7 和 Ubuntu 18.04 上测试了这些命令。

我也希望这可以在其他发行版上工作。这仅仅需要使用该发行版的官方包管理器命令替代本文中的包管理器命令就行了。

如果想要 [检查 Linux 系统上已安装的软件包列表][1]，请点击链接。

例如，如果你想要在基于 RHEL 系统上创建软件包列表请使用以下步骤。其他发行版也一样。

```
# rpm -qa --last | head -15 | awk '{print $1}' > /tmp/pack1.txt

# cat /tmp/pack1.txt
mariadb-server-5.5.60-1.el7_5.x86_64
perl-DBI-1.627-4.el7.x86_64
perl-DBD-MySQL-4.023-6.el7.x86_64
perl-PlRPC-0.2020-14.el7.noarch
perl-Net-Daemon-0.48-5.el7.noarch
perl-IO-Compress-2.061-2.el7.noarch
perl-Compress-Raw-Zlib-2.061-4.el7.x86_64
mariadb-5.5.60-1.el7_5.x86_64
perl-Data-Dumper-2.145-3.el7.x86_64
perl-Compress-Raw-Bzip2-2.061-3.el7.x86_64
httpd-2.4.6-88.el7.centos.x86_64
mailcap-2.1.41-2.el7.noarch
httpd-tools-2.4.6-88.el7.centos.x86_64
apr-util-1.5.2-6.el7.x86_64
apr-1.4.8-3.el7_4.1.x86_64
```

### 方法一：如何在 Linux 上使用 cat 命令安装文件中列出的包？

为实现这个目标，我将使用简单明了的第一种方法。为此，创建一个文件并添加上你想要安装的包列表。

出于测试的目的，我们将只添加以下的三个软件包名到文件中。

```
# cat /tmp/pack1.txt

apache2
mariadb-server
nano
```

只要简单的运行 [apt 命令][2] 就能在 Ubuntu/Debian 系统上一次性安装所有的软件包。

```
# apt -y install $(cat /tmp/pack1.txt)

Reading package lists... Done
Building dependency tree
Reading state information... Done
The following packages were automatically installed and are no longer required:
  libopts25 sntp
Use 'sudo apt autoremove' to remove them.
Suggested packages:
  apache2-doc apache2-suexec-pristine | apache2-suexec-custom spell
The following NEW packages will be installed:
  apache2 mariadb-server nano
0 upgraded, 3 newly installed, 0 to remove and 24 not upgraded.
Need to get 339 kB of archives.
After this operation, 1,377 kB of additional disk space will be used.
Get:1 http://in.archive.ubuntu.com/ubuntu bionic-updates/main amd64 apache2 amd64 2.4.29-1ubuntu4.6 [95.1 kB]
Get:2 http://in.archive.ubuntu.com/ubuntu bionic/main amd64 nano amd64 2.9.3-2 [231 kB]
Get:3 http://in.archive.ubuntu.com/ubuntu bionic-updates/universe amd64 mariadb-server all 1:10.1.38-0ubuntu0.18.04.1 [12.9 kB]
Fetched 339 kB in 19s (18.0 kB/s)
Selecting previously unselected package apache2.
(Reading database ... 290926 files and directories currently installed.)
Preparing to unpack .../apache2_2.4.29-1ubuntu4.6_amd64.deb ...
Unpacking apache2 (2.4.29-1ubuntu4.6) ...
Selecting previously unselected package nano.
Preparing to unpack .../nano_2.9.3-2_amd64.deb ...
Unpacking nano (2.9.3-2) ...
Selecting previously unselected package mariadb-server.
Preparing to unpack .../mariadb-server_1%3a10.1.38-0ubuntu0.18.04.1_all.deb ...
Unpacking mariadb-server (1:10.1.38-0ubuntu0.18.04.1) ...
Processing triggers for ufw (0.36-0ubuntu0.18.04.1) ...
Setting up apache2 (2.4.29-1ubuntu4.6) ...
Processing triggers for ureadahead (0.100.0-20) ...
Processing triggers for install-info (6.5.0.dfsg.1-2) ...
Setting up nano (2.9.3-2) ...
update-alternatives: using /bin/nano to provide /usr/bin/editor (editor) in auto mode
update-alternatives: using /bin/nano to provide /usr/bin/pico (pico) in auto mode
Processing triggers for systemd (237-3ubuntu10.20) ...
Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
Setting up mariadb-server (1:10.1.38-0ubuntu0.18.04.1) ...
```

至于删除，需要使用相同的命令格式和适当的选项。

```
# apt -y remove $(cat /tmp/pack1.txt)
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following packages were automatically installed and are no longer required:
  apache2-bin apache2-data apache2-utils galera-3 libaio1 libapr1 libaprutil1 libaprutil1-dbd-sqlite3 libaprutil1-ldap libconfig-inifiles-perl libdbd-mysql-perl libdbi-perl libjemalloc1 liblua5.2-0
  libmysqlclient20 libopts25 libterm-readkey-perl mariadb-client-10.1 mariadb-client-core-10.1 mariadb-common mariadb-server-10.1 mariadb-server-core-10.1 mysql-common sntp socat
Use 'apt autoremove' to remove them.
The following packages will be REMOVED:
  apache2 mariadb-server nano
0 upgraded, 0 newly installed, 3 to remove and 24 not upgraded.
After this operation, 1,377 kB disk space will be freed.
(Reading database ... 291046 files and directories currently installed.)
Removing apache2 (2.4.29-1ubuntu4.6) ...
Removing mariadb-server (1:10.1.38-0ubuntu0.18.04.1) ...
Removing nano (2.9.3-2) ...
update-alternatives: using /usr/bin/vim.tiny to provide /usr/bin/editor (editor) in auto mode
Processing triggers for ufw (0.36-0ubuntu0.18.04.1) ...
Processing triggers for install-info (6.5.0.dfsg.1-2) ...
Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
```

使用 [yum 命令][3] 在基于 RHEL (如 Centos、RHEL (Redhat) 和 OEL (Oracle Enterprise Linux)) 的系统上安装文件中列出的软件包。

```
# yum -y install $(cat /tmp/pack1.txt)
```

使用以命令在基于 RHEL (如 Centos、RHEL (Redhat) 和 OEL (Oracle Enterprise Linux)) 的系统上卸载文件中列出的软件包。

```
# yum -y remove $(cat /tmp/pack1.txt)
```

使用以下 [dnf 命令][4] 在 Fedora 系统上安装文件中列出的软件包。

```
# dnf -y install $(cat /tmp/pack1.txt)
```

使用以下命令在 Fedora 系统上卸载文件中列出的软件包。

```
# dnf -y remove $(cat /tmp/pack1.txt)
```

使用以下 [zypper 命令][5] 在 openSUSE 系统上安装文件中列出的软件包。

```
# zypper -y install $(cat /tmp/pack1.txt)
```

使用以下命令从 openSUSE 系统上卸载文件中列出的软件包。

```
# zypper -y remove $(cat /tmp/pack1.txt)
```

使用以下 [pacman 命令][6] 在基于 Arch Linux (如 Manjaro 和 Antergos) 的系统上安装文件中列出的软件包。

```
# pacman -S $(cat /tmp/pack1.txt)
```

使用以下命令从基于 Arch Linux (如 Manjaro 和 Antergos) 的系统中卸载文件中列出的软件包。


```
# pacman -Rs $(cat /tmp/pack1.txt)
```

### 方法二：如何使用 cat 和 xargs 命令在 Linux 中安装文件中列出的软件包。

甚至，我更喜欢使用这种方法，因为这是一种非常简单直接的方法。

使用以下 `apt` 命令在基于 Debian 的系统 (如 Debian、Ubuntu 和 Linux Mint) 上安装文件中列出的软件包。

```
# cat /tmp/pack1.txt | xargs apt -y install
```

使用以下 `apt` 命令 从基于 Debian 的系统 (如 Debian、Ubuntu 和 Linux Mint) 上卸载文件中列出的软件包。

```
# cat /tmp/pack1.txt | xargs apt -y remove
```

使用以下 `yum` 命令在基于 RHEL (如 Centos，RHEL (Redhat) 和 OEL (Oracle Enterprise Linux)) 的系统上安装文件中列出的软件包。

```
# cat /tmp/pack1.txt | xargs yum -y install
```

使用以命令从基于 RHEL (如 Centos、RHEL (Redhat) 和 OEL (Oracle Enterprise Linux)) 的系统上卸载文件中列出的软件包。

```
# cat /tmp/pack1.txt | xargs yum -y remove
```

使用以下 `dnf` 命令在 Fedora 系统上安装文件中列出的软件包。

```
# cat /tmp/pack1.txt | xargs dnf -y install
```

使用以下命令从 Fedora 系统上卸载文件中列出的软件包。

```
# cat /tmp/pack1.txt | xargs dnf -y remove
```

使用以下 `zypper` 命令在 openSUSE 系统上安装文件中列出的软件包。


```
# cat /tmp/pack1.txt | xargs zypper -y install
```

使用以下命令从 openSUSE 系统上卸载文件中列出的软件包。

```
# cat /tmp/pack1.txt | xargs zypper -y remove
```

使用以下 `pacman` 命令在基于 Arch Linux (如 Manjaro 和 Antergos) 的系统上安装文件中列出的软件包。

```
# cat /tmp/pack1.txt | xargs pacman -S
```

使用下以命令从基于 Arch Linux (如 Manjaro 和 Antergos) 的系统上卸载文件中列出的软件包。

```
# cat /tmp/pack1.txt | xargs pacman -Rs
```

### 方法三 : 如何使用 For 循环在 Linux 上安装文件中列出的软件包

我们也可以使用 `for` 循环命令来实现此目的。

安装批量包可以使用以下一条 `for` 循环的命令。

```
# for pack in `cat /tmp/pack1.txt` ; do apt -y install $i; done
```

要使用 shell 脚本安装批量包，请使用以下 `for` 循环。

```
# vi /opt/scripts/bulk-package-install.sh

#!/bin/bash
for pack in `cat /tmp/pack1.txt`
do apt -y remove $pack
done
```

为 `bulk-package-install.sh` 设置可执行权限。

```
# chmod + bulk-package-install.sh
```

最后运行这个脚本。

```
# sh bulk-package-install.sh
```

### 方法四：如何使用 While 循环在 Linux 上安装文件中列出的软件包

我们也可以使用 `while` 循环命令来实现目的。

安装批量包可以使用以下一条 `while` 循环的命令。

```
# file="/tmp/pack1.txt"; while read -r pack; do apt -y install $pack; done < "$file"
```

要使用 shell 脚本安装批量包，请使用以下 `while` 循环。

```
# vi /opt/scripts/bulk-package-install.sh

#!/bin/bash
file="/tmp/pack1.txt"
while read -r pack
do apt -y remove $pack
done < "$file"
```

为 `bulk-package-install.sh` 设置可执行权限。

```
# chmod + bulk-package-install.sh
```

最后运行这个脚本。

```
# sh bulk-package-install.sh
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-install-uninstall-listed-packages-from-a-file-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[way-ww](https://github.com/way-ww)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-10116-1.html
[2]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[3]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[4]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[5]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[6]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/

