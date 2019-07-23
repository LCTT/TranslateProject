[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Upgrade Debian 9 (Stretch) to Debian 10 (Buster) via Command Line)
[#]: via: (https://www.linuxtechi.com/upgrade-debian-9-to-debian-10-command-line/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

How to Upgrade Debian 9 (Stretch) to Debian 10 (Buster) via Command Line
======

Hello All!!!, Good to See you! So we saw how to install [Debian 10(Buster)][1] in the previous article. Today, we are going to learn how to upgrade from Debian 9 to Debian 10. Since we have already seen about Debian 10 and its features, let’s not go deep into it. But readers who didn’t have the chance to read that article, let’s give a quick update about Debian 10 and its new features.

<https://www.linuxtechi.com/wp-content/uploads/2019/07/Upgrade-Debian-9-to-Debian-10.jpg>

After almost two years of development, the team at Debian has finally released a stable version of Buster, code name for Debian 10. Buster is a LTS (Long Term Support) version and hence will be supported for the next 5 years by Debian.

### Debian 10 (Buster) – New Features

Debian 10 (Buster) comes packed with a lot of new features which could be rewarding to most of the Debian fans out there. Some of the features include:

  * GNOME Desktop 3.30
  * AppArmor enabled by default
  * Supports Linux Kernel 4.19.0-4
  * Supports OpenJDk 11.0
  * Moved from Nodejs 4-8 to Nodejs 10.15.2
  * Iptables replaced by NFTables



and a lot more.

### Step by Step Guide to Upgrade from Debian 9 to Debian 10

Before we start upgrading to Debian 10, let’s look at the prerequisites needed for the upgrade:

### Step 1) Debian upgrade prerequisites

  * A good internet connection
  * Root user permission
  * Data backup



It is extremely important to backup all your application code bases, data files, user account details, configuration files, so that you can always revert to the previous version if anything goes wrong during the upgrade.

### Step 2) Upgrade Debian 9 Existing Packages

Next step is to upgrade all your existing packages as any packages that are tagged as held back cannot be upgraded and there is a possibility the upgrade from Debian 9 to Debian 10 may fail or cause some issues. So, let’s not take any chances and better upgrade the packages. Use the following code to upgrade the packages:

```
root@linuxtechi:~$ sudo apt update && sudo apt upgrade -y
```

### Step 3) Modify Package Repository file (/etc/sources.list)

Next step is to modify package repository file “/etc/sources.list” where you need to replace the text “Stretch” with the text “Buster”.

But before you change anything, make sure to create a backup of the sources.list file as shown below:

```
root@linuxtechi:~$ sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
```

Now use below sed commands to replace the text ‘**stretch**‘ with ‘**buster**‘ in package repository file, example is shown below,

```
root@linuxtechi:~$ sudo sed -i 's/stretch/buster/g' /etc/apt/sources.list
root@linuxtechi:~$ sudo sed -i 's/stretch/buster/g' /etc/apt/sources.list.d/*.list
```

Once the text is updated, you need to update the package index like shown below:

```
root@linuxtechi:~$ sudo apt update
```

Before start upgrading  your existing Debian OS , let’s verify the current version using the following command,

```
root@linuxtechi:~$ cat /etc/*-release
PRETTY_NAME="Debian GNU/Linux 9 (stretch)"
NAME="Debian GNU/Linux"
VERSION_ID="9"
VERSION="9 (stretch)"
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"
root@linuxtechi:~$
```

### Step 4) Upgrade from Debian 9 to Debian 10

Once you made all the changes, it is time to upgrade from Debian 9 – Debian 10. But before that, make sure to update your packages again as shown below:

```
root@linuxtechi:~$ sudo apt update && sudo apt upgrade -y
```

During packages upgrade you will be prompted to start the services, so choose your preferred option

Once all the packages are updated in your system, it is time to upgrade your distribution package. Use the following code to upgrade the distribution:

```
root@linuxtechi:~$ sudo apt dist-upgrade -y
```

The upgrade process may take a few minutes depending upon your internet connection. Remember during the upgrade process, you’ll also be asked a few questions whether you need to restart the services during the packages are upgraded and whether you need to keep the existing configurations files. If you don’t want to make any custom changes, simply type “Y” and let the upgrade process continue.

### Step 5) Verify Upgrade

Once the upgrade process is completed, reboot your machine and check the version using the following command:

```
root@linuxtechi:~$ lsb_release -a
```

If you get the output as shown below:

```
Distributor ID: Debian
Description:    Debian GNU/Linux 10 (buster)
Release:        10
Codename:       buster
root@linuxtechi:~$
```

Yes, you have successfully upgraded from Debian 9 to Debian 10.

Alternate way to verify upgrade

```
root@linuxtechi:~$ cat /etc/*-release
PRETTY_NAME="Debian GNU/Linux 10 (buster)"
NAME="Debian GNU/Linux"
VERSION_ID="10"
VERSION="10 (buster)"
VERSION_CODENAME=buster
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"
root@linuxtechi:~$
```

### Conclusion

Hope the above step by step guide provided you with all the information needed to upgrade from Debian 9(Stretch) to Debian 10 (Buster) easily. Please give us your feedback, suggestions and your experiences with the all new Debian 10 in the comments section. For more such Linux tutorials and articles, keep visiting LinuxTechi.com every now and then.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/upgrade-debian-9-to-debian-10-command-line/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: https://www.linuxtechi.com/debian-10-buster-installation-guide/
