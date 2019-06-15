[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Check Whether The Given Package Is Installed Or Not On Debian/Ubuntu System?)
[#]: via: (https://www.2daygeek.com/how-to-check-whether-the-given-package-is-installed-or-not-on-ubuntu-debian-system/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How To Check Whether The Given Package Is Installed Or Not On Debian/Ubuntu System?
======

We have recently published an article about bulk package installation.

While doing that, i was struggled to get the installed package information and did a small google search and found few methods about it.

I would like to share it in our website so, that it will be helpful for others too.

There are numerous ways we can achieve this.

I have add seven ways to achieve this. However, you can choose the preferred method for you.

Those methods are listed below.

  * **`apt-cache Command:`** apt-cache command is used to query the APT cache or package metadata.
  * **`apt Command:`** APT is a powerful command-line tool for installing, downloading, removing, searching and managing packages on Debian based systems.
  * **`dpkg-query Command:`** dpkg-query is a tool to query the dpkg database.
  * **`dpkg Command:`** dpkg is a package manager for Debian based systems.
  * **`which Command:`** The which command returns the full path of the executable that would have been executed when the command had been entered in terminal.
  * **`whereis Command:`** The whereis command used to search the binary, source, and man page files for a given command.
  * **`locate Command:`** locate command works faster than the find command because it uses updatedb database, whereas the find command searches in the real system.



### Method-1 : How To Check Whether The Given Package Is Installed Or Not On Ubuntu System Using apt-cache Command?

apt-cache command is used to query the APT cache or package metadata from APT’s internal database.

It will search and display an information about the given package. It shows whether the package is installed or not, installed package version, source repository information.

The below output clearly showing that `nano` package has already installed in the system. Since installed part is showing the installed version of nano package.

```
# apt-cache policy nano
nano:
  Installed: 2.9.3-2
  Candidate: 2.9.3-2
  Version table:
 *** 2.9.3-2 500
        500 http://in.archive.ubuntu.com/ubuntu bionic/main amd64 Packages
        100 /var/lib/dpkg/status
```

### Method-2 : How To Check Whether The Given Package Is Installed Or Not On Ubuntu System Using apt Command?

APT is a powerful command-line tool for installing, downloading, removing, searching and managing as well as querying information about packages as a low-level access to all features of the libapt-pkg library. It’s contains some less used command-line utilities related to package management.

```
# apt -qq list nano
nano/bionic,now 2.9.3-2 amd64 [installed]
```

### Method-3 : How To Check Whether The Given Package Is Installed Or Not On Ubuntu System Using dpkg-query Command?

dpkg-query is a tool to show information about packages listed in the dpkg database.

In the below output first column showing `ii`. It means, the given package has already installed in the system.

```
# dpkg-query --list | grep -i nano
ii  nano    2.9.3-2    amd64    small, friendly text editor inspired by Pico
```

### Method-4 : How To Check Whether The Given Package Is Installed Or Not On Ubuntu System Using dpkg Command?

DPKG stands for Debian Package is a tool to install, build, remove and manage Debian packages, but unlike other package management systems, it cannot automatically download and install packages or their dependencies.

In the below output first column showing `ii`. It means, the given package has already installed in the system.

```
# dpkg -l | grep -i nano
ii  nano     2.9.3-2    amd64   small, friendly text editor inspired by Pico
```

### Method-5 : How To Check Whether The Given Package Is Installed Or Not On Ubuntu System Using which Command?

The which command returns the full path of the executable that would have been executed when the command had been entered in terminal.

It’s very useful when you want to create a desktop shortcut or symbolic link for executable files.

Which command searches the directories listed in the current user’s PATH environment variable not for all the users. I mean, when you are logged in your own account and you can’t able to search for root user file or directory.

If the following output shows the given package binary or executable file location then the given package has already installed in the system. If not, the package is not installed in system.

```
# which nano
/bin/nano
```

### Method-6 : How To Check Whether The Given Package Is Installed Or Not On Ubuntu System Using whereis Command?

The whereis command used to search the binary, source, and man page files for a given command.

If the following output shows the given package binary or executable file location then the given package has already installed in the system. If not, the package is not installed in system.

```
# whereis nano
nano: /bin/nano /usr/share/nano /usr/share/man/man1/nano.1.gz /usr/share/info/nano.info.gz
```

### Method-7 : How To Check Whether The Given Package Is Installed Or Not On Ubuntu System Using locate Command?

locate command works faster than the find command because it uses updatedb database, whereas the find command searches in the real system.

It uses a database rather than hunting individual directory paths to get a given file.

locate command doesn’t pre-installed in most of the distributions so, use your distribution package manager to install it.

The database is updated regularly through cron. Even, we can update it manually.

If the following output shows the given package binary or executable file location then the given package has already installed in the system. If not, the package is not installed in system.

```
# locate --basename '\nano'
/usr/bin/nano
/usr/share/nano
/usr/share/doc/nano
```
--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-check-whether-the-given-package-is-installed-or-not-on-ubuntu-debian-system/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
