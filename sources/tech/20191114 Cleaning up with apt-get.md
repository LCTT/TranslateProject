[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cleaning up with apt-get)
[#]: via: (https://www.networkworld.com/article/3453032/cleaning-up-with-apt-get.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Cleaning up with apt-get
======
Most of us with Debian-based systems use apt-get routinely to install packages and upgrades, but how often do we pull out the cleaning tools? Let's check out some of the tool's options for cleaning up after itself.
[Félix Prado Modified by IDG Comm.][1] [(CC0)][2]

Running **apt-get** commands on a Debian-based system is routine. Packages are updated fairly frequently and commands like **apt-get update** and **apt-get upgrade** make the process quite easy. On the other hand, how often do you use **apt-get clean**, **apt-get autoclean** or **apt-get autoremove**?

These commands clean up after apt-get's installation operations and remove files that are still on your system but are no longer needed – often because the application that required them is no longer installed.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][3]

### apt-get clean

The apt-get clean command clears the local repository of retrieved package files that are left in **/var/cache**. The directories it cleans out are **/var/cache/apt/archives/** and **/var/cache/apt/archives/partial/**. The only files it leaves in **/var/cache/apt/archives** are the **lock** file and the **partial** subdirectory.

[][4]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][4]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

You might have a number of files in the directory prior to running the clean operation:

```
/var/cache/apt/archives/db5.3-util_5.3.28+dfsg1-0.6ubuntu1_amd64.deb
/var/cache/apt/archives/db-util_1%3a5.3.21~exp1ubuntu2_all.deb
/var/cache/apt/archives/lock
/var/cache/apt/archives/postfix_3.4.5-1ubuntu1_amd64.deb
/var/cache/apt/archives/sasl2-bin_2.1.27+dfsg-1build3_amd64.deb
```

You should only have these afterwards:

```
$ sudo ls -lR /var/cache/apt/archives
/var/cache/apt/archives:
total 4
-rw-r----- 1 root root    0 Jan  5  2018 lock
drwx------ 2 _apt root 4096 Nov 12 07:24 partial

/var/cache/apt/archives/partial:
total 0                 <== empty
```

The **apt-get clean** command is generally used to clear disk space as needed, generally as part of regularly scheduled maintenance.

### apt-get autoclean

The **apt-get** **autoclean** option, like **apt-get clean**, clears the local repository of retrieved package files, but it only removes files that can no longer be downloaded and are virtually useless. It helps to keep your cache from growing too large.

### apt-get autoremove

The **autoremove** option removes packages that were automatically installed because some other package required them but, with those other packages removed, they are no longer needed. Sometimes, an upgrade will suggest that you run this command.

```
The following packages were automatically installed and are no longer required:
  g++-8 gir1.2-mutter-4 libapache2-mod-php7.2 libcrystalhd3
  libdouble-conversion1 libgnome-desktop-3-17 libigdgmm5 libisl19 libllvm8
  liblouisutdml8 libmutter-4-0 libmysqlclient20 libpoppler85 libstdc++-8-dev
  libtagc0 libvpx5 libx265-165 php7.2 php7.2-cli php7.2-common php7.2-json
  php7.2-opcache php7.2-readline
Use 'sudo apt autoremove' to remove them.                       <==
```

The packages to be removed are often called "unused dependencies". In fact, a good practice to follow is to use **autoremove** after uninstalling a package to be sure that no unneeded files are left behind.

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3453032/cleaning-up-with-apt-get.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://unsplash.com/photos/nbKaLT4cmRM
[2]: https://creativecommons.org/publicdomain/zero/1.0/
[3]: https://www.networkworld.com/newsletters/signup.html
[4]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
