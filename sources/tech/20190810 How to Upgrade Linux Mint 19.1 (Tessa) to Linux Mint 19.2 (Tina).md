[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Upgrade Linux Mint 19.1 (Tessa) to Linux Mint 19.2 (Tina)?)
[#]: via: (https://www.2daygeek.com/upgrade-linux-mint-19-1-tessa-to-linux-mint-19-2-tina/)
[#]: author: (2daygeek http://www.2daygeek.com/author/2daygeek/)

How to Upgrade Linux Mint 19.1 (Tessa) to Linux Mint 19.2 (Tina)?
======

Linux Mint 19.2 “Tina” was released on Aug 02nd 2019, it is a long term support release, which is based on Ubuntu 18.04 LTS (Bionic Beaver).

It will be supported until 2023. It comes with updated software and brings refinements and many new features to make your desktop even more comfortable to use.

Linux Mint 19.2 features with Cinnamon 4.2, Linux kernel 4.15, and Ubuntu 18.04 package base.

**`Note:`**` ` Don’t forget to take backup of your important data. If something goes wrong you can restore the data from the backup after fresh installation.

Backup can be done either rsnapshot or timeshift.

Linux Mint 19.2 “Tina” Release notes can be found in the following link.

  * **[Linux Mint 19.2 (Tina) Release Notes][1]**



There are three ways that we can upgrade to Linux Mint 19.2 “Tina”.

  * Upgrade Linux Mint 19.2 (Tina) Using Native Method
  * Upgrade Linux Mint 19.2 (Tina) Using Mintupgrade Utility
  * Upgrade Linux Mint 19.2 (Tina) Using GUI



### How to Perform The Upgrade from Linux Mint 19.1 (Tessa) to Linux Mint 19.2 (Tina)?

Upgrading the Linux Mint system is an easy and painless task. It can be done three ways.

### Method-1: Upgrade Linux Mint 19.2 (Tina) Using Native Method

This is one of the native and standard method to perform the upgrade for Linux Mint system.

To do so, follow the below procedures.

Make sure that your current Linux Mint system is up-to-date.

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

By default, it will remove obsolete packages by running the above command. However, i advise you to run the below commands.

```
$ sudo apt autoremove

$ sudo apt clean
```

You may need to reboot the system, if a new kernel is installed. If so, run the following command.

```
$ sudo shutdown -r now
```

Finally check the currently installed version.

```
$ lsb_release -a

No LSB modules are available.
Distributor ID: Linux Mint
Description:    Linux Mint 19.1 (Tessa)
Release:        19.1
Codename:       Tessa
```

### Step-2: Update/Modify the /etc/apt/sources.list file

After reboot, modify the sources.list file and point from Linux Mint 19.1 (Tessa) to Linux Mint 19.2 (Tina).

First backup the below config files using the cp command.

```
$ sudo cp  /etc/apt/sources.list /root
$ sudo cp -r /etc/apt/sources.list.d/ /root
```

Modify the “sources.list” file and point to Linux Mint 19.1 (Tina).

```
$ sudo sed -i 's/tessa/tina/g' /etc/apt/sources.list
$ sudo sed -i 's/tessa/tina/g' /etc/apt/sources.list.d/*
```

Refresh the repositories index by running the following command.

```
$ sudo apt update
```

Run the following command to install the available updates on system. During the upgrade you may need to confirm for service restart and config file replace so, just follow on-screen instructions.

The upgrade may take some time depending on the number of updates and your Internet speed.

```
$ sudo apt upgrade
```

Run the following command to perform a complete upgrade of the system.

```
$ sudo apt full-upgrade
```

By default, the above command will remove obsolete packages. However, i advise you to run the below commands once again.

```
$ sudo apt autoremove

$ sudo apt clean
```

Finally reboot the system to boot with Linux Mint 19.2 (Tina).

```
$ sudo shutdown -r now
```

The upgraded Linux Mint version can be verified by running the following command.

```
$ lsb_release -a

No LSB modules are available.
Distributor ID: Linux Mint
Description:    Linux Mint 19.2 (Tina)
Release:        19.2
Codename:       Tina
```

### Method-2: Upgrade Linux Mint 19.2 (Tina) Using Mintupgrade Utility

This is Mint official utility that allow us to perform the smooth upgrade for Linux Mint system.

Use the below command to install mintupgrade package.

```
$ sudo apt install mintupgrade
```

Make sure you have installed the latest version of mintupgrade package.

```
$ apt version mintupgrade
```

Run the below command as a normal user to simulate an upgrade and follow on-screen instructions.

```
$ mintupgrade check
```

Use the below command to download the packages necessary to upgrade to Linux Mint 19.2 (Tina) and follow on screen instructions.

```
$ mintupgrade download
```

Run the following command to apply the upgrades and follow on-screen instructions.

```
$ mintupgrade upgrade
```

Once upgrade done successfully, Reboot the system and check the upgraded version.

```
$ lsb_release -a

No LSB modules are available.
Distributor ID: Linux Mint
Description:    Linux Mint 19.2 (Tina)
Release:        19.2
Codename:       Tina
```

### Method-3: Upgrade Linux Mint 19.2 (Tina) Using GUI

Alternatively, we can perform the upgrade through GUI.

### Step-1:

Create a system snapshot through Timeshift. If anything goes wrong, you can easily restore your operating system to its previous state.

### Step-2:

Open the Update Manager, click on the Refresh button to check for any new version of mintupdate and mint-upgrade-info. If there are updates for these packages, apply them.

Launch the System Upgrade by clicking on “Edit-&gt;Upgrade to Linux Mint 19.2 Tina”.
[![][2]![][2]][3]

Follow the instructions on the screen. If asked whether to keep or replace configuration files, choose to replace them.
[![][2]![][2]][4]

### Step-3:

Once the upgrade is finished, reboot your computer.

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/upgrade-linux-mint-19-1-tessa-to-linux-mint-19-2-tina/

作者：[2daygeek][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.2daygeek.com/author/2daygeek/
[b]: https://github.com/lujun9972
[1]: https://www.linuxtechnews.com/linux-mint-19-2-tina-released-check-what-is-new-feature/
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: https://www.2daygeek.com/wp-content/uploads/2019/08/linux-mint-19-2-tina-mintupgrade.png
[4]: https://www.2daygeek.com/wp-content/uploads/2019/08/linux-mint-19-2-tina-mintupgrade-1.png
