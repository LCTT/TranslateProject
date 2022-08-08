[#]: subject: "How to Upgrade to Linux Mint 21 [Step by Step Tutorial]"
[#]: via: "https://itsfoss.com/upgrade-linux-mint-version/"
[#]: author: "Abhishek Prakash https://itsfoss.com/"
[#]: collector: "lkxed"
[#]: translator: "robsean"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Upgrade to Linux Mint 21 [Step by Step Tutorial]
======
This is a regularly updated guide for upgrading an existing Linux Mint install to a new available version.

There are three sections in this article that show the steps for upgrading between various major versions of Linux Mint:

* Section 1 is about upgrading to Mint 21 from Mint 20.3 (GUI upgrade tool)
* Section 2 is about upgrading to Mint 20 from Mint 19.3 (Command-line based upgrader)
* Section 3 is about upgrading to Mint 19 from Mint 18.3 (if someone is still using it)

You can follow the appropriate steps based on your current Mint version and requirement.

This is a regularly updated guide for upgrading an existing Linux Mint install to a new available version.

The guide has been updated with the steps for upgrading to Linux Mint 21 from Mint 20.3. Linux Mint now has a GUI tool to upgrade to the latest version.

### Things to know before you upgrade to Linux Mint 21

Before you go on upgrading to Linux Mint 21, you should consider the following:

* Do you really need to upgrade? Linux Mint 20.x is supported for several more years.
* You’ll need a good speed internet connection to download upgrades of around 1.4 GB.
* It may take a couple of hours to complete the upgrade procedure based on your internet speed. You must have patience.
* It is a good idea to make a live USB of Linux Mint 21 and try it in a live session to see if it is compatible with your hardware. Newer kernels might have issues with older hardware, so testing it before the real upgrade or install can save you a lot of frustration.
* A fresh installation is always better than a major version upgrade but installing Linux Mint 21 from scratch would mean losing your existing data. You must take backup on an external disk.
* Though upgrades are mostly safe, it’s not 100% failproof. You must have system snapshots and proper backups.
* You can upgrade to Linux Mint 21 only from Linux Mint 20.3 Cinnamon, Xfce and MATE. [Check your Linux Mint version][1] first. If you are using Linux Mint 20.2 or 20.1, you need to upgrade to 20.3 first from the Update Manager. If you are using Linux Mint 19, I advise you to go for a fresh installation rather than upgrading to several Mint versions.

Once you know what you will do, let’s see how to upgrade to Linux Mint 21.

### Upgrading to Linux Mint 21 from 20.3

Check your Linux Mint version and ensure that you are using Mint 20.3. You cannot upgrade to Mint 21 from Mint 20.1 or 20.2.

#### Step 1: Update your system by installing any available updates

Launch the Update Manager with Menu -> Administration -> Update Manager. Check if there are any package updates available. If yes, install all the software updates first.

![Check for Pending Software Updates][2]

You may also use this command in the terminal for this step:

```
sudo apt update && sudo apt upgrade -y
```

#### Step 2: Make a backup of your files on an external disk [Optional yet recommended]

Timeshift is a good tool for creating system snapshots, but it’s not the ideal tool for your documents, pictures, and other such non-system, personal files. I advise making a backup on an external disk. It’s just for the sake of data safety.

When I say making a backup on an external disk, I mean to simply copy and paste your Pictures, Documents, Downloads, and Videos directory on an external USB disk.

If you don’t have a disk of that much size, at least copy the most important files you cannot afford to lose.

#### Step 3: Install the upgrade tool

Now that your system is updated, you are ready to upgrade to Linux Mint 21. Linux Mint team provides a GUI tool called [mintupgrade][3] for upgrading Linux Mint 20.3 to Linux Mint 21.

You can install this tool using the command below:

```
sudo apt install mintupgrade
```

#### Step 4: Run GUI Tool from the terminal

You cannot find the new GUI tool listed in the App menu. To launch, you need to enter the following command in the terminal:

```
sudo mintupgrade
```

This simple yet comprehensive tool takes you through the upgrading process.

![Mint Upgrade Tool Home Page][4]

After some initial tests, it will prompt for a Timeshift Backup. If you already have a backup created, you are good to go.

![Upgrade Tool Prompting No Timeshift Snapshots][5]

Else, you need to [create a backup][6] here since it is mandatory to continue.

![Taking Snapshot With Timeshift][7]

Some PPAs might be already available for Ubuntu 22.04 and thus for Mint 21. But if the PPA or repository is not available for the new version, it may impact the upgrade procedure with broken dependencies. You will be prompted the same within the upgrade tool.

![Kazam PPA Does Not Support Jammy][8]

Here, I used [Kazam latest versio][9]n through its PPA. The same PPA is supported only up to Impish, showing the error since Linux Mint 21 is based on Jammy.

You will be given the option to disable the PPAs through Software Sources within the upgrade tool.

![Disable Unsupported PPAs in Software Sources][10]

Since the PPA is disabled, the package becomes ‘foreign’ because the version available from the repository doesn’t match the ones from Mint repositories. So you need to downgrade the packages to a version available on the repository.

![Downgrade Package to Avoid Conflicts][11]

The upgrade tool now lists the changes that need to be carried out.

![List Changes That Need to be Done][12]

Upon accepting, the tool will start downloading packages.

![Phase 2 – Simulation and Package Download][13]

![Package Downloading][14]

![Upgrading Phase][15]

It will list orphan packages, that can be removed. You can either remove the whole suggestions by pressing the “Fix” button or will keep certain packages.

#### Keep Certain Orphan packages

In order to keep packages from the orphan packages list, you need to go to the preferences from the hamburger menu on top left.

![Selecting Orphan Packages You Want to Keep with Preferences][16]

From the preference dialog box, you need to go to **Orphan Packages** and use the “plus” symbol to add packages by name.

![Specify Name of the Package to Keep][17]

Once done, it will continue upgrading and after some time, you will be prompted a successful update notification.

![Upgrade Successful][18]

At this point, you need to reboot your system. Upon rebooting, you will be in the new Linux Mint 21.

![Neofetch Output Linux Mint 21][19]

### How to upgrade to Linux Mint 20

Before you go on upgrading to Linux Mint 20, you should consider the following:

* Do you really need to upgrade? Linux Mint 19.x is supported till 2023.
* If you [have a 32-bit system][20], you cannot install or upgrade to Mint 20.
* You’ll need a good speed internet connection to download upgrades of around 1.4 GB in size.
* Based on your internet speed, it may take a couple of hours to complete the upgrade procedure. You must have patience.
* It is a good idea to make a live USB of Linux Mint 20 and try it in a live session to see if it is compatible with your hardware. Newer kernels might have issues with older hardware and hence testing it before the real upgrade or install can save you a lot of frustration.
* A fresh installation is always better than a major version upgrade but [installing Linux Mint][21] 20 from scratch would mean you’ll lose your existing data. You must take backup on an external disk.
* Though upgrades are mostly safe, it’s not 100% fail proof. You must have system snapshots and proper backups.
* You can upgrade to Linux Mint 20 only from Linux Mint 19.3 Cinnamon, Xfce and MATE. [Check your Linux Mint version][22] first. If you are using Linux Mint 19.2 or 19.1, you need to upgrade to 19.3 first from the Update Manager. If you are using Linux Mint 18, I advise you go for a fresh installation rather than upgrading to several Mint versions.
* The upgrade process is done via command line utility. If you don’t like using terminal and commands, avoid upgrading and go for a fresh installation.

Once you know what you are going to do, let’s see how to upgrade to Linux Mint 20.

![A Video from YouTube][23]

[Subscribe to our YouTube channel for more Linux videos][24]

#### Step 1: Make sure you have a 64-bit system

Linux Mint 20 is a 64-bit only system. If you have a 32-bit Mint 19 installed, you cannot upgrade to Linux Mint 20.

In a terminal, use the following command to see whether you are using 64-bit operating system or not.

```
dpkg --print-architecture
```

![Mint 20 Upgrade Check Architecture][25]

#### Step 2: Update your system by installing any available updates

Launch the Update Manager with Menu -> Administration -> Update Manager. Check if there are any package updates available. If yes, install all the software updates first.

![Check for pending software updates][26]

You may also use this command in the terminal for this step:

```
sudo apt update && sudo apt upgrade -y
```

#### Step 3: Create a system snapshot with Timeshift [Optional yet recommended]

[Creating a system snapshot with Timeshift][27] will save you if your upgrade procedure is interrupted or if you face any other issue. **You can even revert to Mint 19.3 this way**.

Suppose your upgrade failed for power interruption or some other reason and you end up with a broken, unusable Linux Mint 19. You can plug in a live Linux Mint USB and run Timeshift from the live environment. It will automatically locate your backup location and will allow you to restore your broken Mint 19 system.

This also means that you should keep a live Linux Mint 19 USB handy specially if you don’t have access to a working computer that you can use to create live Linux Mint USB in the rare case the upgrade fails.

![Create a system snapshot in Linux Mint][28]

#### Step 4: Make a backup of your files on an external disk [Optional yet recommended]

Timeshift is a good tool for creating system snapshots but it’s not the ideal tool for your documents, pictures and other such non-system, personal files. I advise making a backup on an external disk. It’s just for the sake of data safety.

When I say making a backup on an external disk, I mean to simply copy and paste your Pictures, Documents, Downloads, Videos directory on an external USB disk.

If you don’t have a disk of that much of a size, at least copy the most important files that you cannot afford to lose.

#### Step 5: Disable PPAs and third-party repositories [Optional yet recommended]

It’s natural that you might have installed applications using some [PPA][29] or other repositories.

Some PPAs might be already available for Ubuntu 20.04 and thus for Mint 20. But if the PPA or repository is not available for the new version, it may impact the upgrade procedure with broken dependencies.

For this reason, it is advised that you disable the PPAs and third-party repositories. You may also delete the applications installed via such external sources if it is okay with you and doesn’t result in config data loss.

In the Software Sources tool, disable additional repositories, disable PPAs.

![Disable Ppa Mint Upgrade][30]

You should also **downgrade and then remove foreign packages** available in the maintenance tab.

For example, I installed Shutter using a PPA. I disabled its PPA. Now the package becomes ‘foreign’ because the version available from the repository doesn’t match the ones from Mint repositories.

![Foreign Package Linux Mint][31]

#### Step 6: Install the upgrade tool

Now that your system is updated, you are ready for upgrading to Linux Mint 20. Linux Mint team provides a command line tool called [mintupgrade][32] for the sole purpose of upgrading Linux Mint 19.3 to Linux Mint 20.

You can install this tool using the command below:

```
sudo apt install mintupgrade
```

#### Step 7: Run an upgrade sanity check

The mintupgrade tool lets you run a sanity check by simulating initial part of the upgrade.

You can run this check to see what kind of changes will be made to your system, which packages will be upgraded. It will also show the packages that cannot be upgraded and must be removed.

```
mintupgrade check
```

There won’t be any real changes on your system yet (even if it feels like it is going to make some changes).

This step is important and helpful in determining whether your system can be upgrade to Mint 20 or not.

![Mint Upgrade Check][33]

If this steps fails half-way through type **mintupgrade restore-sources** to go back to your original APT configuration.

#### Step 8: Download package upgrades

Once you are comfortable with the output of mintupgrade check, you can download the Mint 20 upgrade packages.

Depending on your internet connection, it may take some time in downloading these upgrades. Make sure your system is connected to a power source.

While the packages are being downloaded, you can continue using your system for regular work.

```
mintupgrade download
```

![Mint 20 Upgrade Download][34]

Note that this command points your system to the Linux Mint 20 repositories. If you want to go back to Linux Mint 19.3 after using this command, you still can do that with the command “**mintupgrade restore-sources**“.

#### Step 9: Install the Upgrades [Point of no return]

Now that you have everything ready, you can upgrade to Linux Mint 20 using this command:

```
mintupgrade upgrade
```

Give it some time to install the new packages and upgrade your Mint to the newer version. Once the procedure finishes, it will ask you to reboot.

![Linux Mint 20 Upgrade Finish][35]

#### Enjoy Linux Mint 20

Once you reboot your system, you’ll see the Mint 20 welcome screen. Enjoy the new version.

![Welcome To Linux Mint 20][36]

### Upgrading to Mint 19 from Mint 18

The steps for upgrading to Linux Mint 19 from 18.3 is pretty much the same as the steps you saw for Mint 20. The only change is in checking for display manager.

I’ll quickly mention the steps here. If you want more details, you can refer to Mint 20 upgrade procedure.

**Step1:** Create a system snapshot with Timeshift [Optional yet recommended]

**Step2:** Make a backup of your files on an external disk [Optional yet recommended]

**Step 3: Make sure you are using LightDM**

You must use [LightDM display manager][37] for Mint 19. To check which display manager you are using, type the command:

```
cat /etc/X11/default-display-manager
```

If the result is “/usr/sbin/**lightdm**“, you have LightDM and you are good to go.

![LightDM Display Manager in Linux Mint][38]

On the other hand, if the result is “/usr/sbin/**mdm**“, you need to install LightDM, [switch to LightDM][39] and removing MDM. Use this command to install LightDM:

```
apt install lightdm lightdm-settings slick-greeter
```

While installing, it will ask you to choose the display manager. You need to select LightDM.

Once you have set LightDM as your display manager, remove MDM and reboot using these commands:

```
apt remove --purge mdm mint-mdm-themes*
sudo dpkg-reconfigure lightdm
sudo reboot
```

**Step 4: Update your system by installing any available updates**

```
sudo apt update && sudo apt upgrade -y
```

**Step 5: Install the upgrade tool**

```
sudo apt install mintupgrade
```

**Step 6: Check upgrade**

```
mintupgrade check
```

**Step 7: Download package upgrades**

```
mintupgrade download
```

**Step 8: Apply upgrades**

```
mintupgrade upgrade
```

Enjoy Linux Mint 19.

### Did you upgrade to Linux Mint 21?

Upgrading to Linux Mint 20 might not be a friendly experience but upgrading to Mint 21 is made a lot more simple with the new dedicated GUI upgrade tool.

I hope you find the tutorial helpful. Did you upgrade to Linux Mint 21 or you opted for a fresh installation?

If you faced any issues or if you have any questions about the upgrade procedure, please feel free to ask in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/upgrade-linux-mint-version/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/check-linux-mint-version/
[2]: https://itsfoss.com/wp-content/uploads/2022/08/check-for-pending-software-updates.png
[3]: https://github.com/linuxmint/mintupgrade/blob/master/usr/bin/mintupgrade
[4]: https://itsfoss.com/wp-content/uploads/2022/08/mint-upgrade-tool-home-page.png
[5]: https://itsfoss.com/wp-content/uploads/2022/08/upgrade-tool-prompting-no-timeshift-snapshots.png
[6]: https://itsfoss.com/backup-restore-linux-timeshift/
[7]: https://itsfoss.com/wp-content/uploads/2022/08/taking-snapshot-with-timeshift.png
[8]: https://itsfoss.com/wp-content/uploads/2022/08/kazam-ppa-does-not-support-jammy.png
[9]: https://itsfoss.com/kazam-screen-recorder/
[10]: https://itsfoss.com/wp-content/uploads/2022/08/disable-unsupported-ppas-in-software-sources.png
[11]: https://itsfoss.com/wp-content/uploads/2022/08/downgrade-package-to-avoid-conflicts.png
[12]: https://itsfoss.com/wp-content/uploads/2022/08/list-changes-that-need-to-be-done.png
[13]: https://itsfoss.com/wp-content/uploads/2022/08/phase-2-simulation-and-package-download-.png
[14]: https://itsfoss.com/wp-content/uploads/2022/08/package-downloading.png
[15]: https://itsfoss.com/wp-content/uploads/2022/08/upgrading-phase.png
[16]: https://itsfoss.com/wp-content/uploads/2022/08/selecting-orphan-packages-you-want-to-keep-with-preferences.png
[17]: https://itsfoss.com/wp-content/uploads/2022/08/specify-name-of-the-package-to-keep.png
[18]: https://itsfoss.com/wp-content/uploads/2022/08/upgrade-successful-800x494.png
[19]: https://itsfoss.com/wp-content/uploads/2022/08/neofetch-output-linux-mint-21.png
[20]: https://itsfoss.com/32-bit-64-bit-ubuntu/
[21]: https://itsfoss.com/guide-install-linux-mint-16-dual-boot-windows/
[22]: https://itsfoss.com/check-linux-mint-version/
[23]: https://youtu.be/LYnXEaiAjsk
[24]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[25]: https://itsfoss.com/wp-content/uploads/2020/07/mint-20-upgrade-check-architecture.jpg
[26]: https://itsfoss.com/wp-content/uploads/2020/07/update-manager-linux-mint.jpg
[27]: https://itsfoss.com/backup-restore-linux-timeshift/
[28]: https://itsfoss.com/wp-content/uploads/2018/07/snapshot-linux-mint-timeshift.jpeg
[29]: https://itsfoss.com/ppa-guide/
[30]: https://itsfoss.com/wp-content/uploads/2020/07/disable-ppa-mint-upgrade.jpg
[31]: https://itsfoss.com/wp-content/uploads/2020/07/foreign-package-linux-mint.jpg
[32]: https://github.com/linuxmint/mintupgrade/blob/master/usr/bin/mintupgrade
[33]: https://itsfoss.com/wp-content/uploads/2020/07/mint-upgrade-check.jpg
[34]: https://itsfoss.com/wp-content/uploads/2020/07/mint-upgrade-download.jpg
[35]: https://itsfoss.com/wp-content/uploads/2020/07/linux-mint-20-upgrade-finish.jpg
[36]: https://itsfoss.com/wp-content/uploads/2020/07/welcome-to-linux-mint-20.jpg
[37]: https://wiki.archlinux.org/index.php/LightDM
[38]: https://itsfoss.com/wp-content/uploads/2018/07/lightdm-linux-mint.jpeg
[39]: https://itsfoss.com/switch-gdm-and-lightdm-in-ubuntu-14-04/
