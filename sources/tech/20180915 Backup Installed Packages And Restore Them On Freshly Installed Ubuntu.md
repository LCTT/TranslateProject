translating---geekpi

Backup Installed Packages And Restore Them On Freshly Installed Ubuntu
======

![](https://www.ostechnix.com/wp-content/uploads/2018/09/apt-clone-720x340.png)

Installing the same set of packages on multiple Ubuntu systems is time consuming and boring task. You don’t want to spend your time to install the same packages over and over on multiple systems. When it comes to install packages on similar architecture Ubuntu systems, there are many methods available to make this task easier. You could simply migrate your old Ubuntu system’s applications, settings and data to a newly installed system with a couple mouse clicks using [**Aptik**][1]. Or, you can take the [**backup entire list of installed packages**][2] using your package manager (Eg. APT), and install them later on a freshly installed system. Today, I learned that there is also yet another dedicated utility available to do this job. Say hello to **apt-clone** , a simple tool that lets you to create a list of installed packages for Debian/Ubuntu systems that can be restored on freshly installed systems or containers or into a directory.

Apt-clone will help you on situations where you want to,

  * Install consistent applications across multiple systems running with similar Ubuntu (and derivatives) OS.
  * Install same set of packages on multiple systems often.
  * Backup the entire list of installed applications and restore them on demand wherever and whenever necessary.



In this brief guide, we will be discussing how to install and use Apt-clone on Debian-based systems. I tested this utility on Ubuntu 18.04 LTS system, however it should work on all Debian and Ubuntu-based systems.

### Backup Installed Packages And Restore Them Later On Freshly Installed Ubuntu System

Apt-clone is available in the default repositories. To install it, just enter the following command from the Terminal:

```
$ sudo apt install apt-clone
```

Once installed, simply create the list of installed packages and save them in any location of your choice.

```
$ mkdir ~/mypackages

$ sudo apt-clone clone ~/mypackages
```

The above command saved all installed packages in my Ubuntu system in a file named **apt-clone-state-ubuntuserver.tar.gz** under **~/mypackages** directory.

To view the details of the backup file, run:

```
$ apt-clone info mypackages/apt-clone-state-ubuntuserver.tar.gz
Hostname: ubuntuserver
Arch: amd64
Distro: bionic
Meta:
Installed: 516 pkgs (33 automatic)
Date: Sat Sep 15 10:23:05 2018
```

As you can see, I have 516 packages in total in my Ubuntu server.

Now, copy this file on your USB or external drive and go to any other system that want to install the same set of packages. Or you can also transfer the backup file to the system on the network and install the packages by using the following command:

```
$ sudo apt-clone restore apt-clone-state-ubuntuserver.tar.gz
```

Please be mindful that this command will overwrite your existing **/etc/apt/sources.list** and will install/remove packages. You have been warned! Also, just make sure the destination system is on same arch and same OS. For example, if the source system is running with 18.04 LTS 64bit, the destination system must also has the same.

If you don’t want to restore packages on the system, you can simply use `--destination /some/location` option to debootstrap the clone into this directory.

```
$ sudo apt-clone restore apt-clone-state-ubuntuserver.tar.gz --destination ~/oldubuntu
```

In this case, the above command will restore the packages in a folder named **~/oldubuntu**.

For more details, refer help section:

```
$ apt-clone -h
```

Or, man pages:

```
$ man apt-clone
```

**Suggested read:**

+ [Systemback – Restore Ubuntu Desktop and Server to previous state][3]
+ [Cronopete – An Apple’s Time Machine Clone For Linux][4]

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!




--------------------------------------------------------------------------------

via: https://www.ostechnix.com/backup-installed-packages-and-restore-them-on-freshly-installed-ubuntu-system/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[1]: https://www.ostechnix.com/how-to-migrate-system-settings-and-data-from-an-old-system-to-a-newly-installed-ubuntu-system/
[2]: https://www.ostechnix.com/create-list-installed-packages-install-later-list-centos-ubuntu/#comment-12598

[3]: https://www.ostechnix.com/systemback-restore-ubuntu-desktop-and-server-to-previous-state/

[4]: https://www.ostechnix.com/cronopete-apples-time-machine-clone-linux/
