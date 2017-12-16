Easily Upgrade Ubuntu to a Newer Version with This Single Command
======
[zzupdate][1] is an open source command line utility that makes the task of upgrading Ubuntu Desktop and Server to newer versions a tad bit easier by combining several update commands into one single command.

Upgrading an Ubuntu system to a newer release is not a herculean task. Either with the GUI or with a couple of commands, you can easily upgrade your system to the latest release.

On the other hand, zzupdate written by Gianluigi 'Zane' Zanettini handles clean, update, autoremove, version upgrade and composer self-update for your Ubuntu system with just a single command.

It cleans up the local cache, updates available package information, and then perform a distribution upgrade. In the next step, it updates the Composer and removes the unused packages.

The script must run as root user.

### Installing zzupdate to upgrade Ubuntu to a newer version

![Upgrade Ubuntu to a newer version with a single command][2]

![Upgrade Ubuntu to a newer version with a single command][3]

To install zzupdate, execute the below command in a Terminal.
```
curl -s https://raw.githubusercontent.com/TurboLabIt/zzupdate/master/setup.sh | sudo sh
```

And then copy the provided sample configuration file to zzupdate.conf and set your preferences.
```
sudo cp /usr/local/turbolab.it/zzupdate/zzupdate.default.conf /etc/turbolab.it/zzupdate.conf
```

Once you have everything, just use the following command and it will start upgrading your Ubuntu system to a newer version (if there is any).

`sudo zzupdate`

Note that zzupdate upgrades the system to the next available version in case of a normal release. However, when you are running Ubuntu 16.04 LTS, it tries to search for the next long-term support version only and not the latest version available.

If you want to move out of the LTS release and upgrade to the latest release, you will have change some options.

For Ubuntu desktop, open **Software & Updates** and under **Updates** tab and change Notify me of a new Ubuntu version to  " **For any new version** ".

![Software Updater in Ubuntu][2]

![Software Updater in Ubuntu][4]

For Ubuntu server, edit the release-upgrades file.
```
vi /etc/update-manager/release-upgrades

Prompt=normal
```

### Configuring zzupdate [optional]

zzupdate options to configure
```
REBOOT=1
```

If this value is 1, a system restart is performed after an upgrade.
```
REBOOT_TIMEOUT=15
```

This sets up the reboot timeout to 900 seconds as some hardware takes much longer to reboot than others.
```
VERSION_UPGRADE=1
```

Executes version progression if an upgrade is available.
```
VERSION_UPGRADE_SILENT=0
```

Version progression occurs automatically.
```
COMPOSER_UPGRADE=1
```

Value '1' will automatically upgrade the composer.
```
SWITCH_PROMPT_TO_NORMAL=0
```

This features switches the Ubuntu Version updated to normal i.e. if you have an LTS release running, zzupdate won't upgrade it to Ubuntu 17.10 if its set to 0. It will search for an LTS version only. In contrast, value 1 searches for the latest release whether you are running an LTS or a normal release.

Once done, all you have to do is run in console to run a complete update of your Ubuntu system
```
sudo zzupdate
```

### Final Words

Though the upgrade process for Ubuntu is in itself an easy one, zzupdate reduces it to mere one command. No coding knowledge is necessary and the process is complete config file driven. I personally found itself a good tool to update several Ubuntu systems without the need of taking care of different things separately.

Are you willing to give it a try?

--------------------------------------------------------------------------------

via: https://itsfoss.com/zzupdate-upgrade-ubuntu/

作者：[Ambarish Kumar;Abhishek Prakash][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com
[1]:https://github.com/TurboLabIt/zzupdate
[2]:data:image/gif;base64,R0lGODdhAQABAPAAAP///wAAACwAAAAAAQABAEACAkQBADs=
[3]:https://itsfoss.com/wp-content/uploads/2017/11/upgrade-ubuntu-single-command-featured-800x450.jpg
[4]:https://itsfoss.com/wp-content/uploads/2017/11/software-update-any-new-version-800x378.jpeg
