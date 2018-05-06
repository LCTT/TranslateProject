zzupdate - Single Command To Upgrade Ubuntu
======
Ubuntu 18.04 was already out and got good feedback from multiple community because Ubuntu 18.04 is the most exciting release of Ubuntu in years.

By default Ubuntu and it’s derivatives can be upgraded from one version to another version using standard commands, which is official and recommended way to upgrade the system to latest version.

### Ubuntu 18.04 Features/Highlights

This release is contains vast of improvement and features and i picked only major things. Navigate to [Ubuntu 18.04 official][1] release page, if you want to know more detailed release information.

  * It ships with Linux kernel 4.15, which delivers new features inherited from upstream.
  * It feature the latest GNOME 3.28
  * It offers minimal install option similar to RHEL, this allow users to install basic desktop environment with a web browser and core system utilities.
  * For new installs, a swap file will be used by default instead of a swap partition.
  * You can enable Livepatch to install Kernel updates without rebooting.
  * laptops will automatically suspend after 20 minutes of inactivity while on battery power
  * 32-bit installer images are no longer provided for Ubuntu Desktop



**Note :**
1) Don’t forget to take backup of your important/valuable data. If something goes wrong we will install freshly and restore the data.
2) Upgrade will take time based on your Internet connection and application which you have installed.

### What Is zzupdate?

We can upgrade Ubuntu PC/Server from one version to another version with just a single command using [zzupdate][2] utility. It’s a free and open source utility and it doesn’t required any scripting knowledge to work on this because it’s purely configfile-driven script.

There were two shell files are available in the utility, which make the utility to do the work as expected. The provided setup.sh auto-installs/updates the code and makes the script available as a new, simple shell command (zzupdate). The zzupdate.sh will do the actual upgrade from one version to next available version.

### How To Install zzupdate?

To install zzupdate, just execute the following command.
```
$ curl -s https://raw.githubusercontent.com/TurboLabIt/zzupdate/master/setup.sh | sudo sh
.
.
Installing...
-------------
Cloning into 'zzupdate'...
remote: Counting objects: 57, done.
remote: Total 57 (delta 0), reused 0 (delta 0), pack-reused 57
Unpacking objects: 100% (57/57), done.
Checking connectivity... done.
Already up-to-date.

Setup completed!
----------------
See https://github.com/TurboLabIt/zzupdate for the quickstart guide.

```

To upgrade the Ubuntu system from one version to another version, you don’t want to run multiple commands and also no need to initiate the reboot. Just fire the below zzupdate command and sit back rest it will take care.

Make a note, When you are upgrading the remote system, i would advise you to use any of the one below utility because it will help you to reconnect the session in case of any disconnection.

**Suggested Read :** [How To Keep A Process/Command Running After Disconnecting SSH Session][3]

### How To Configure zzupdate [optional]

By default zzupdate works out of the box and no need to configure anything. It’s optional and if you want to configure something yes, you can. To do so, copy the provided sample configuration file `zzupdate.default.conf` to your own `zzupdate.conf` and set your preference.
```
$ sudo cp /usr/local/turbolab.it/zzupdate/zzupdate.default.conf /etc/turbolab.it/zzupdate.conf

```

Open the file and the default values are below.
```
$ sudo nano /etc/turbolab.it/zzupdate.conf

REBOOT=1
REBOOT_TIMEOUT=15
VERSION_UPGRADE=1
VERSION_UPGRADE_SILENT=0
COMPOSER_UPGRADE=1
SWITCH_PROMPT_TO_NORMAL=0

```

  * **`REBOOT=1 :`**System will automatically reboot once upgrade is done.
  * **`REBOOT_TIMEOUT=15 :`**Default time out value for reboot.
  * **`VERSION_UPGRADE=1 :`**It perform version upgrade from one version to another.
  * **`VERSION_UPGRADE_SILENT=0 :`**It disable automatic upgrade perform version upgrade from one version to another.
  * **`COMPOSER_UPGRADE=1 :`**This will automatically upgrade the composer.
  * **`SWITCH_PROMPT_TO_NORMAL=0 :`**If it’s “0” then it looks for same kind of version upgrade. If you are running on LTS version then it will looking for LTS version upgrade and not for the normal release upgrade. If it’s “1” then it looks for the latest release whether you are running an LTS or a normal release.



I’m currently running Ubuntu 17.10 and see the details.
```
$ cat /etc/*-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=17.10
DISTRIB_CODENAME=artful
DISTRIB_DESCRIPTION="Ubuntu 17.10"
NAME="Ubuntu"
VERSION="17.10 (Artful Aardvark)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 17.10"
VERSION_ID="17.10"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=artful
UBUNTU_CODENAME=artful

```

To upgrade the Ubuntu to latest release, just execute the below command.
```
$ sudo zzupdate

O===========================================================O
 zzupdate - Wed May 2 17:31:16 IST 2018
O===========================================================O

Self-update and update of other zzScript
----------------------------------------
.
.
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.

Updating...
----------
Already up-to-date.

Setup completed!
----------------
See https://github.com/TurboLabIt/zzupdate for the quickstart guide.

Channel switching is disabled: using pre-existing setting
---------------------------------------------------------

Cleanup local cache
-------------------

Update available packages informations
--------------------------------------
Hit:1 https://download.docker.com/linux/ubuntu artful InRelease
Ign:2 http://dl.google.com/linux/chrome/deb stable InRelease
Hit:3 http://security.ubuntu.com/ubuntu artful-security InRelease
Hit:4 http://in.archive.ubuntu.com/ubuntu artful InRelease
Hit:5 http://dl.google.com/linux/chrome/deb stable Release
Hit:6 http://in.archive.ubuntu.com/ubuntu artful-updates InRelease
Hit:7 http://in.archive.ubuntu.com/ubuntu artful-backports InRelease
Hit:9 http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu artful InRelease
Hit:10 http://ppa.launchpad.net/papirus/papirus/ubuntu artful InRelease
Hit:11 http://ppa.launchpad.net/twodopeshaggy/jarun/ubuntu artful InRelease
.
.
UPGRADE PACKAGES
----------------
Reading package lists...
Building dependency tree...
Reading state information...
Calculating upgrade...
The following packages were automatically installed and are no longer required:
.
.
Interactively upgrade to a new release, if any
----------------------------------------------

Reading cache

Checking package manager
Reading package lists... Done
Building dependency tree
Reading state information... Done
Ign http://dl.google.com/linux/chrome/deb stable InRelease
Hit https://download.docker.com/linux/ubuntu artful InRelease
Hit http://security.ubuntu.com/ubuntu artful-security InRelease
Hit http://dl.google.com/linux/chrome/deb stable Release
Hit http://in.archive.ubuntu.com/ubuntu artful InRelease
Hit http://in.archive.ubuntu.com/ubuntu artful-updates InRelease
Hit http://in.archive.ubuntu.com/ubuntu artful-backports InRelease
Hit http://ppa.launchpad.net/notepadqq-team/notepadqq/ubuntu artful InRelease
Hit http://ppa.launchpad.net/papirus/papirus/ubuntu artful InRelease
Hit http://ppa.launchpad.net/twodopeshaggy/jarun/ubuntu artful InRelease
Fetched 0 B in 6s (0 B/s)
Reading package lists... Done
Building dependency tree
Reading state information... Done

```

We need to disable `Third Party` repository by hitting the `Enter` button to move forward the upgrade.
```
Updating repository information

Third party sources disabled

Some third party entries in your sources.list were disabled. You can
re-enable them after the upgrade with the 'software-properties' tool
or your package manager.

To continue please press [ENTER]
.
.
Get:35 http://in.archive.ubuntu.com/ubuntu bionic-updates/universe i386 Packages [2,180 B]
Get:36 http://in.archive.ubuntu.com/ubuntu bionic-updates/universe Translation-en [1,644 B]
Fetched 38.2 MB in 6s (1,276 kB/s)

Checking package manager
Reading package lists... Done
Building dependency tree
Reading state information... Done

Calculating the changes

Calculating the changes

```

Start Downloading the `Ubuntu 18.04 LTS` packages, It will take a while based on your Internet connection. Its time to have a cup of coffee.
```
Do you want to start the upgrade?


63 installed packages are no longer supported by Canonical. You can
still get support from the community.

4 packages are going to be removed. 175 new packages are going to be
installed. 1307 packages are going to be upgraded.

You have to download a total of 999 M. This download will take about
12 minutes with your connection.

Installing the upgrade can take several hours. Once the download has
finished, the process cannot be canceled.

Continue [yN] Details [d]y
Fetching
Get:1 http://in.archive.ubuntu.com/ubuntu bionic/main amd64 base-files amd64 10.1ubuntu2 [58.2 kB]
Get:2 http://in.archive.ubuntu.com/ubuntu bionic/main amd64 debianutils amd64 4.8.4 [85.7 kB]
Get:3 http://in.archive.ubuntu.com/ubuntu bionic/main amd64 bash amd64 4.4.18-2ubuntu1 [614 kB]
Get:4 http://in.archive.ubuntu.com/ubuntu bionic/main amd64 locales all 2.27-3ubuntu1 [3,612 kB]
.
.
Get:1477 http://in.archive.ubuntu.com/ubuntu bionic/main amd64 liblouisutdml-bin amd64 2.7.0-1 [9,588 B]
Get:1478 http://in.archive.ubuntu.com/ubuntu bionic/universe amd64 libtbb2 amd64 2017~U7-8 [110 kB]
Get:1479 http://in.archive.ubuntu.com/ubuntu bionic/main amd64 libyajl2 amd64 2.1.0-2build1 [20.0 kB]
Get:1480 http://in.archive.ubuntu.com/ubuntu bionic/main amd64 usb-modeswitch amd64 2.5.2+repack0-2ubuntu1 [53.6 kB]
Get:1481 http://in.archive.ubuntu.com/ubuntu bionic/main amd64 usb-modeswitch-data all 20170806-2 [30.7 kB]
Get:1482 http://in.archive.ubuntu.com/ubuntu bionic/main amd64 xbrlapi amd64 5.5-4ubuntu2 [61.8 kB]
Fetched 999 MB in 6s (721 kB/s)

```

Few services need to be restart, While installing new packages. Hit `Yes` button, it will automatically restart the required services.
```
Upgrading
Inhibiting until Ctrl+C is pressed...
Preconfiguring packages ...
Preconfiguring packages ...
Preconfiguring packages ...
Preconfiguring packages ...
(Reading database ... 441375 files and directories currently installed.)
Preparing to unpack .../base-files_10.1ubuntu2_amd64.deb ...
Warning: Stopping motd-news.service, but it can still be activated by:
 motd-news.timer
Unpacking base-files (10.1ubuntu2) over (9.6ubuntu102) ...
Setting up base-files (10.1ubuntu2) ...
Installing new version of config file /etc/debian_version ...
Installing new version of config file /etc/issue ...
Installing new version of config file /etc/issue.net ...
Installing new version of config file /etc/lsb-release ...
motd-news.service is a disabled or a static unit, not starting it.
(Reading database ... 441376 files and directories currently installed.)
.
.
Progress: [ 80%]

Progress: [ 85%]

Progress: [ 90%]

Progress: [ 95%]

```

It’s time to remove obsolete (Which is anymore needed for system) packages. Hit `y` to remove it.
```
Searching for obsolete software
 ing package lists... 97%
 ding package lists... 98%
Reading package lists... Done
Building dependency tree
Reading state information... Done
Reading state information... 23%
Reading state information... 47%
Reading state information... 71%
Reading state information... 94%
Reading state information... Done

Remove obsolete packages?


88 packages are going to be removed.

Continue [yN] Details [d]y
.
.
.
done
Removing perlmagick (8:6.9.7.4+dfsg-16ubuntu6) ...
Removing snapd-login-service (1.23-0ubuntu1) ...
Processing triggers for libc-bin (2.27-3ubuntu1) ...
Processing triggers for man-db (2.8.3-2) ...
Processing triggers for dbus (1.12.2-1ubuntu1) ...
Fetched 0 B in 0s (0 B/s)

```

Upgrade is successfully completed and need to restart the system. Hit `Y` to restart the system.
```
System upgrade is complete.

Restart required

To finish the upgrade, a restart is required.
If you select 'y' the system will be restarted.

Continue [yN]y

```

**`Note :`** Few times, it will ask you to confirm the configuration file replacement to move forward the installation.

See the upgraded system details.
```
$ cat /etc/*-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=18.04
DISTRIB_CODENAME=bionic
DISTRIB_DESCRIPTION="Ubuntu 18.04 LTS"
NAME="Ubuntu"
VERSION="18.04 LTS (Bionic Beaver)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 18.04 LTS"
VERSION_ID="18.04"
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
VERSION_CODENAME=bionic
UBUNTU_CODENAME=bionic

```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/zzupdate-single-command-to-upgrade-ubuntu-18-04/

作者：[PRAKASH SUBRAMANIAN][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/prakash/
[1]:https://wiki.ubuntu.com/BionicBeaver/ReleaseNotes
[2]:https://github.com/TurboLabIt/zzupdate
[3]:https://www.2daygeek.com/how-to-keep-a-process-command-running-after-disconnecting-ssh-session/
