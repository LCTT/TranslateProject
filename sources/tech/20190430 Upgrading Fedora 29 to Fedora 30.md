[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Upgrading Fedora 29 to Fedora 30)
[#]: via: (https://fedoramagazine.org/upgrading-fedora-29-to-fedora-30/)
[#]: author: (Ryan Lerch https://fedoramagazine.org/author/ryanlerch/)

Upgrading Fedora 29 to Fedora 30
======

![][1]

Fedora 30 i[s available now][2]. You’ll likely want to upgrade your system to the latest version of Fedora. Fedora Workstation has a graphical upgrade method. Alternatively, Fedora offers a command-line method for upgrading Fedora 29 to Fedora 30.

### Upgrading Fedora 29 Workstation to Fedora 30

Soon after release time, a notification appears to tell you an upgrade is available. You can click the notification to launch the **GNOME Software** app. Or you can choose Software from GNOME Shell.

Choose the _Updates_ tab in GNOME Software and you should see a screen informing you that Fedora 30 is Now Available.

If you don’t see anything on this screen, try using the reload button at the top left. It may take some time after release for all systems to be able to see an upgrade available.

Choose _Download_ to fetch the upgrade packages. You can continue working until you reach a stopping point, and the download is complete. Then use GNOME Software to restart your system and apply the upgrade. Upgrading takes time, so you may want to grab a coffee and come back to the system later.

### Using the command line

If you’ve upgraded from past Fedora releases, you are likely familiar with the _dnf upgrade_ plugin. This method is the recommended and supported way to upgrade from Fedora 29 to Fedora 30. Using this plugin will make your upgrade to Fedora 30 simple and easy.

##### 1\. Update software and back up your system

Before you do anything, you will want to make sure you have the latest software for Fedora 29 before beginning the upgrade process. To update your software, use _GNOME Software_ or enter the following command in a terminal.

```
sudo dnf upgrade --refresh
```

Additionally, make sure you back up your system before proceeding. For help with taking a backup, see [the backup series][3] on the Fedora Magazine.

##### 2\. Install the DNF plugin

Next, open a terminal and type the following command to install the plugin:

```
sudo dnf install dnf-plugin-system-upgrade
```

##### 3\. Start the update with DNF

Now that your system is up-to-date, backed up, and you have the DNF plugin installed, you can begin the upgrade by using the following command in a terminal:

```
sudo dnf system-upgrade download --releasever=30
```

This command will begin downloading all of the upgrades for your machine locally to prepare for the upgrade. If you have issues when upgrading because of packages without updates, broken dependencies, or retired packages, add the _‐‐allowerasing_ flag when typing the above command. This will allow DNF to remove packages that may be blocking your system upgrade.

##### 4\. Reboot and upgrade

Once the previous command finishes downloading all of the upgrades, your system will be ready for rebooting. To boot your system into the upgrade process, type the following command in a terminal:

```
sudo dnf system-upgrade reboot
```

Your system will restart after this. Many releases ago, the _fedup_ tool would create a new option on the kernel selection / boot screen. With the _dnf-plugin-system-upgrade_ package, your system reboots into the current kernel installed for Fedora 29; this is normal. Shortly after the kernel selection screen, your system begins the upgrade process.

Now might be a good time for a coffee break! Once it finishes, your system will restart and you’ll be able to log in to your newly upgraded Fedora 30 system.

![][4]

### Resolving upgrade problems

On occasion, there may be unexpected issues when you upgrade your system. If you experience any issues, please visit the [DNF system upgrade wiki page][5] for more information on troubleshooting in the event of a problem.

If you are having issues upgrading and have third-party repositories installed on your system, you may need to disable these repositories while you are upgrading. For support with repositories not provided by Fedora, please contact the providers of the repositories.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/upgrading-fedora-29-to-fedora-30/

作者：[Ryan Lerch][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/ryanlerch/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/04/29-30-816x345.jpg
[2]: https://fedoramagazine.org/announcing-fedora-30/
[3]: https://fedoramagazine.org/taking-smart-backups-duplicity/
[4]: https://cdn.fedoramagazine.org/wp-content/uploads/2016/06/Screenshot_f23-ws-upgrade-test_2016-06-10_110906-1024x768.png
[5]: https://fedoraproject.org/wiki/DNF_system_upgrade#Resolving_post-upgrade_issues
