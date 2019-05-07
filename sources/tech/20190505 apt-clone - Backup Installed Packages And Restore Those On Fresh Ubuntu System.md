[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (apt-clone : Backup Installed Packages And Restore Those On Fresh Ubuntu System)
[#]: via: (https://www.2daygeek.com/apt-clone-backup-installed-packages-and-restore-them-on-fresh-ubuntu-system/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

apt-clone : Backup Installed Packages And Restore Those On Fresh Ubuntu System
======

Package installation is become more easier on Ubuntu/Debian based systems when we use apt-clone utility.

apt-clone will work for you, if you want to build few systems with same set of packages.

It’s time consuming process if you want to build and install necessary packages manually on each systems.

It can be achieved in many ways and there are many utilities are available in Linux.

We have already wrote an article about **[Aptik][1]** in the past.

It’s one of the utility that allow Ubuntu users to backup and restore system settings and data

### What Is apt-clone?

[apt-clone][2] lets allow you to create backup of all installed packages for your Debian/Ubuntu systems that can be restored on freshly installed systems (or containers) or into a directory.

This backup can be restored on multiple systems with same operating system version and architecture.

### How To Install apt-clone?

The apt-clone package is available on Ubuntu/Debian official repository so, use **[apt Package Manager][3]** or **[apt-get Package Manager][4]** to install it.

Install apt-clone package using apt package manager.

```
$ sudo apt install apt-clone
```

Install apt-clone package using apt-get package manager.

```
$ sudo apt-get install apt-clone
```

### How To Backup Installed Packages Using apt-clone?

Once you have successfully installed the apt-clone package. Simply give a location where do you want to save the backup file.

We are going to save the installed packages backup under `/backup` directory.

The apt-clone utility will save the installed packages list into `apt-clone-state-Ubuntu18.2daygeek.com.tar.gz` file.

```
$ sudo apt-clone clone /backup
```

We can check the same by running the ls Command.

```
$ ls -lh /backup/
total 32K
-rw-r--r-- 1 root root 29K Apr 20 19:06 apt-clone-state-Ubuntu18.2daygeek.com.tar.gz
```

Run the following command to view the details of the backup file.

```
$ apt-clone info /backup/apt-clone-state-Ubuntu18.2daygeek.com.tar.gz
Hostname: Ubuntu18.2daygeek.com
Arch: amd64
Distro: bionic
Meta: libunity-scopes-json-def-desktop, ubuntu-desktop
Installed: 1792 pkgs (194 automatic)
Date: Sat Apr 20 19:06:43 2019
```

As per the above output, totally we have 1792 packages in the backup file.

### How To Restore The Backup Which Was Taken Using apt-clone?

You can use any of the remote copy utility to copy the files on remote server.

```
$ scp /backup/apt-clone-state-ubunt-18-04.tar.gz Destination-Server:/opt
```

Once you copy the file then perform the restore using apt-clone utility.

Run the following command to restore it.

```
$ sudo apt-clone restore /opt/apt-clone-state-Ubuntu18.2daygeek.com.tar.gz
```

Make a note, The restore will override your existing `/etc/apt/sources.list` and will install/remove packages. So be careful.

If you want to restore all the packages into a folder instead of actual restore, you can do it by using the following command.

```
$ sudo apt-clone restore /opt/apt-clone-state-Ubuntu18.2daygeek.com.tar.gz --destination /opt/oldubuntu
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/apt-clone-backup-installed-packages-and-restore-them-on-fresh-ubuntu-system/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/aptik-backup-restore-ppas-installed-apps-users-data/
[2]: https://github.com/mvo5/apt-clone
[3]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[4]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
