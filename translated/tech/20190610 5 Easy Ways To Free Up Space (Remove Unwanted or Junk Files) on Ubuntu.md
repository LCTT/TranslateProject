[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 Easy Ways To Free Up Space (Remove Unwanted or Junk Files) on Ubuntu)
[#]: via: (https://www.2daygeek.com/linux-remove-delete-unwanted-junk-files-free-up-space-ubuntu-mint-debian/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

5种简单的方法来在 Ubuntu 上释放空间(移除不想要的或没有用的文件)
======

我们中的大多数人可能在系统磁盘存储不足的情况下执行这个操作。

我们中的大多数人可能在 Linux 系统磁盘存储不足的情况下执行这个操作。

它应该被经常执行，来为安装一个新的应用程序和处理其它文件弥补磁盘存储空间。

内务处理是 Linux 管理员的一个日常任务，管理员允许内务处理在阈值下维持磁盘利用率。

这里有一些我们可以清理我们系统空间的方法。

当你有 TB 级存储容量时，不需要清理你的系统。

但是，如果你空间有限，那么释放磁盘空间，变的不可避免。

在这篇文章中，我将向你展示一些最容易的或简单的方法来清理你的 Ubuntu 系统，获得更多空间。

### 在 Ubuntu 系统上如何检查可用的空间？

在你的系统上使用 **[df 命令][1]** 来检查当前磁盘利用率。

```
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
udev            975M     0  975M   0% /dev
tmpfs           200M  1.7M  198M   1% /run
/dev/sda1        30G   16G   13G  55% /
tmpfs           997M     0  997M   0% /dev/shm
tmpfs           5.0M  4.0K  5.0M   1% /run/lock
tmpfs           997M     0  997M   0% /sys/fs/cgroup
```

图形界面用户可以使用“磁盘利用率分析器工具”来查看当前利用率。
[![][2]![][2]][3]

### 1) 移除不再需要的软件包

下面的命令移除系统不再需要依赖的库和软件包。

这些软件包自动地安装来使一个被安装软件包满足的依赖关系。

同样，它移除安装在系统中的旧的 Linux 内核。

它移除不再被系统需要的孤立的软件包，但是不清除它们。

```
$ sudo apt-get autoremove
[sudo] password for daygeek:
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following packages will be REMOVED:
  apache2-bin apache2-data apache2-utils galera-3 libaio1 libapr1 libaprutil1
  libaprutil1-dbd-sqlite3 libaprutil1-ldap libconfig-inifiles-perl libdbd-mysql-perl
  libdbi-perl libjemalloc1 liblua5.2-0 libmysqlclient20 libopts25
  libterm-readkey-perl mariadb-client-10.1 mariadb-client-core-10.1 mariadb-common
  mariadb-server-10.1 mariadb-server-core-10.1 mysql-common sntp socat
0 upgraded, 0 newly installed, 25 to remove and 23 not upgraded.
After this operation, 189 MB disk space will be freed.
Do you want to continue? [Y/n]
```

为清除它们，与命令一起使用 `--purge` 选项。

```
$ sudo apt-get autoremove --purge
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following packages will be REMOVED:
  apache2-bin* apache2-data* apache2-utils* galera-3* libaio1* libapr1* libaprutil1*
  libaprutil1-dbd-sqlite3* libaprutil1-ldap* libconfig-inifiles-perl*
  libdbd-mysql-perl* libdbi-perl* libjemalloc1* liblua5.2-0* libmysqlclient20*
  libopts25* libterm-readkey-perl* mariadb-client-10.1* mariadb-client-core-10.1*
  mariadb-common* mariadb-server-10.1* mariadb-server-core-10.1* mysql-common* sntp*
  socat*
0 upgraded, 0 newly installed, 25 to remove and 23 not upgraded.
After this operation, 189 MB disk space will be freed.
Do you want to continue? [Y/n]
```

### 2) 清空回收站

这可能有风险，你可能有大量的无用数据存在于你的回收站中。

它占用你的系统空间。这是最好的一个方法来在你的系统上清理这些无用的数据，并获取一些可用的空间。

为清理这些，简单地使用文件管理器来清空你的回收站。
[![][2]![][2]][4]

### 3) 清理 APT 缓存文件

Ubuntu 使用 **[APT 命令][5]** (高级软件包工具)用于软件包管理，像：安装，移除，搜索等等。

默认情况下，每个 Linux 操作系统在它们各自的命令保留下载和安装的软件包的缓冲。

Ubuntu 也做相同的事，它以缓冲的形式在你的磁盘上保留它下载和安装的每次更新。

Ubuntu 在 /var/cache/apt/archives 目录中保留 DEB 软件包的缓冲文件。

随着时间推移，这些缓存可能快速增长，并在你的系统上占有很多空间。

运行下面的命令来检查当前 APT 缓存文件的使用率。

```
$ sudo du -sh /var/cache/apt
147M    /var/cache/apt
```

它清理过时的 deb 软件包。我想说，一点都清理不干净。

```
$ sudo apt-get autoclean
```

它移除所有在 apt 缓存中的软件包。

```
$ sudo apt-get clean
```

### 4) 卸载不使用的应用程序

我可能要求你来检查在你的系统上安装的软件包和游戏，，删除它们，如果你很少使用。

这可以简单地完成，通过 “Ubuntu 软件中心”。
[![][2]![][2]][6]

### 5) 清理缩略图缓存

缓存文件夹是程序存储它们可能再次需要的数据的地方，它是为速度保留的，而不是必需保留的。它可以被再次生成或再次下载。

假如它真的填满你的硬盘，那么你可以删除一些东西而不用担心。

运行下面的命令来检查当前 APT 缓存的利用率。

```
$ du -sh ~/.cache/thumbnails/
412K    /home/daygeek/.cache/thumbnails/
```

运行下面的命令来从你的系统中永久地删除它们。

```
$ rm -rf ~/.cache/thumbnails/*
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-remove-delete-unwanted-junk-files-free-up-space-ubuntu-mint-debian/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/how-to-check-disk-space-usage-using-df-command/
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: https://www.2daygeek.com/wp-content/uploads/2019/06/remove-delete-Unwanted-Junk-Files-free-up-space-ubuntu-mint-debian-1.jpg
[4]: https://www.2daygeek.com/wp-content/uploads/2019/06/remove-delete-Unwanted-Junk-Files-free-up-space-ubuntu-mint-debian-2.jpg
[5]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[6]: https://www.2daygeek.com/wp-content/uploads/2019/06/remove-delete-Unwanted-Junk-Files-free-up-space-ubuntu-mint-debian-3.jpg
