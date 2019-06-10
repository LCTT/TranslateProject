[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 Easy Ways To Free Up Space (Remove Unwanted or Junk Files) on Ubuntu)
[#]: via: (https://www.2daygeek.com/linux-remove-delete-unwanted-junk-files-free-up-space-ubuntu-mint-debian/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

5 Easy Ways To Free Up Space (Remove Unwanted or Junk Files) on Ubuntu
======

Most of us may perform this action whenever we fall into out of disk space on system.

Most of us may perform this action whenever we are running out of space on Linux system

It should be performed frequently, to make space for installing a new application and dealing with other files.

Housekeeping is one of the routine task of Linux administrator, which allow them to maintain the disk utilization is in under threshold.

There are several ways we can clean up our system space.

There is no need to clean up your system when you have TB of storage capacity.

But if your have limited space then freeing up disk space becomes a necessity.

In this article, I’ll show you some of the easiest or simple ways to clean up your Ubuntu system and get more space.

### How To Check Free Space On Ubuntu Systems?

Use **[df Command][1]** to check current disk utilization on your system.

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

GUI users can use “Disk Usage Analyzer tool” to view current usage.
[![][2]![][2]][3]

### 1) Remove The Packages That Are No Longer Required

The following command removes the dependency libs and packages that are no longer required by the system.

These packages were installed automatically to satisfy the dependencies of an installed package.

Also, it removes old Linux kernels that were installed in the system.

It removes orphaned packages which are not longer needed from the system, but not purges them.

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

To purge them, use the `--purge` option together with the command for that.

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

### 2) Empty The Trash Can

There might a be chance, that you may have a large amount of useless data residing in your trash can.

It takes up your system space. This is one of the best way to clear up those and get some free space on your system.

To clean up this, simple use the file manager to empty your trash can.
[![][2]![][2]][4]

### 3) Clean up the APT cache

Ubuntu uses **[APT Command][5]** (Advanced Package Tool) for package management like installing, removing, searching, etc,.

By default every Linux operating system keeps a cache of downloaded and installed packages on their respective directory.

Ubuntu also does the same, it keeps every updates it downloads and installs in a cache on your disk.

Ubuntu system keeps a cache of DEB packages in /var/cache/apt/archives directory.

Over time, this cache can quickly grow and hold a lot of space on your system.

Run the following command to check the current utilization of APT cache.

```
$ sudo du -sh /var/cache/apt
147M    /var/cache/apt
```

It cleans obsolete deb-packages. I mean to say, less than clean.

```
$ sudo apt-get autoclean
```

It removes all packages kept in the apt cache.

```
$ sudo apt-get clean
```

### 4) Uninstall the unused applications

I would request you to check the installed packages and games on your system and delete them if you are using rarely.

This can be easily done via “Ubuntu Software Center”.
[![][2]![][2]][6]

### 5) Clean up the thumbnail cache

The cache folder is a place where programs stored data they may need again, it is kept for speed but is not essential to keep. It can be generated again or downloaded again.

If it’s really filling up your hard drive then you can delete things without worrying.

Run the following command to check the current utilization of APT cache.

```
$ du -sh ~/.cache/thumbnails/
412K    /home/daygeek/.cache/thumbnails/
```

Run the following command to delete them permanently from your system.

```
$ rm -rf ~/.cache/thumbnails/*
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-remove-delete-unwanted-junk-files-free-up-space-ubuntu-mint-debian/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
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
