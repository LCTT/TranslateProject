[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to upgrade Debian 9 (Stretch) to Debian 10 (Buster))
[#]: via: (https://www.2daygeek.com/how-to-upgrade-debian-9-stretch-to-debian-10-buster/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How to upgrade Debian 9 (Stretch) to Debian 10 (Buster)
======

Debian 10 “Buster” was released on July 06th 2019, after 25 months of development with lot of new features and updated packages.

It’s Long Term Support (LTS) release and will be supported for the next 5 years.

This new release contains totally over 57703 packages, over 35532 software packages has been updated to latest version (It is 62% of all packages in stretch), it includes over 13370 new packages.

**`Note:`** Don’t forget to take backup of your important data. If something goes wrong you can restore the data from the backup after fresh installation.

Backup can be done using either rsnapshot or timeshift.

Debian 10 “buster” Release notes can be found in the following link.

  * **[Debian 10 (Buster) Release Notes][1]**



### How to Perform The Upgrade from Debian 9 (Stretch) to Debian 10 (Buster)?

Upgrading the Debian system (Debian based systems as well) is an easy and painless task. It can be done through **[APT Package Manager][2]**.

To do so, follow the below steps. Make sure that your current Debian system is up-to-date.

Update your existing software to latest available version using the following commands.

### Step-1:

Refresh the repositories index by running the following command.

```
$ sudo apt update
```

Run the following command to install the available updates on system.

```
$ sudo apt upgrade
```

Run the following command to perform the available minor upgrade with in version.

```
$ sudo apt full-upgrade
```

By default, it will remove obsolete packages by running the above command. However, I advise you to run the below commands.

```
$ sudo apt autoremove

$ sudo apt clean
```

You may need to reboot the system after a new kernel is installed. Run the following command for reboot.

```
$ sudo shutdown -r now
```

Finally check the currently installed version.

```
$ lsb_release -a

No LSB modules are available.
Distributor ID: Debian
Description:    Debian GNU/Linux 9.9 (stretch)
Release:        9.9
Codename:       stretch
```

### Step-2: Update/Modify the /etc/apt/sources.list file

After reboot, modify the sources.list file and point from Debian 9 (Stretch) to Debian 10 (Buster).

First backup the config files using the **[cp command][3]**.

```
$ sudo cp  /etc/apt/sources.list /root
$ sudo cp -r /etc/apt/sources.list.d/ /root
```

Modify the “sources.list” file and point to Debian 10 (Buster).

```
$ sudo sed -i 's/stretch/buster/g' /etc/apt/sources.list
$ sudo sed -i 's/stretch/buster/g' /etc/apt/sources.list.d/*
```

Refresh the repositories index by running the following command.

```
$ sudo apt update
```

Run the following command to install the available updates on system. During the upgrade you may need to confirm for service restart and config file replace so, just follow on-screen instructions.

The upgrade may take some time depending upon  the number of updates and your Internet speed.

```
$ sudo apt upgrade
```

Run the following command to perform a complete upgrade of the system.

```
$ sudo apt full-upgrade
```

By default, the above command will remove obsolete packages. However, I advise you to run the below commands once again.

```
$ sudo apt autoremove

$ sudo apt clean
```

Finally reboot the system to boot with Debian 10 Buster.

```
$ sudo shutdown -r now
```

The upgraded Debian version can be verified by running the following command.

```
$ lsb_release -a

No LSB modules are available.
Distributor ID: Debian
Description:    Debian GNU/Linux 10 (buster)
Release:        10
Codename:       buster
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-upgrade-debian-9-stretch-to-debian-10-buster/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.linuxtechnews.com/debian-10-buster-released-after-2-years-of-continuous-development/
[2]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[3]: https://www.2daygeek.com/copy-cp-command-examples-to-copy-files-folders-in-linux/
