[#]: subject: "How To Upgrade To Fedora 36 From Fedora 35 [Workstation And Server]"
[#]: via: "https://ostechnix.com/upgrade-to-fedora-36-from-fedora-35/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How To Upgrade To Fedora 36 From Fedora 35 [Workstation And Server]
======
A Step By Step Guide To Upgrade Fedora 35 To Fedora 36

Fedora 36 has been released! This step by step tutorial tutorial explains how to upgrade to Fedora 36 from Fedora 35 and older versions. If you're already using Fedora 35, you can now safely upgrade to Fedora 36 desktop or server edition for latest features, performance and stability improvements.

### Prerequisites

Before upgrading to Fedora 36, you need to do a few important tasks.

1. It is strongly RECOMMENDED to Backup your important data before upgrading to Fedora 36. This should be your first step when you want to upgrade any system, regardless of the underlying operating system. Make sure you've backup of all important files, directories, configuration settings, browser bookmarks, and dot files etc.
2. Fedora 36 upgrade will probably take several minutes to complete. So make sure you've stable Internet connection and uninterrupted power supply.
3. During upgrade, your system will reboot automatically to apply updates. So ensure that there aren't any important jobs currently running (E.g. Scheduled backups).
4. See the Fedora 36 common issues and decide if you want to proceed.
5. Upgrades to the very next release (e.g. 35 to 36) as well as upgrades skipping one release (e.g. 34 to 36) are both supported. Upgrades across more than two releases are not supported. For example - you can't go from Fedora 33 to 36. It might work sometimes. However, if you encounter with any issues, you won't get any support. In such cases, first upgrade to next release (i.e. 33 to 34) and then try to upgrade from 34 to 36. It is always recommended to upgrade to next release before it reaches EOL.

Well, without further ado, let us start Fedora 36 upgrade task!

### Upgrade to Fedora 36 From Fedora 35

We can upgrade to Fedora 36 via GNOME software (GUI) and from command line (CLI). First, we will see the Graphical method using GNOME Software. This is suitable for those who use Fedora desktop edition.

Before get started, update your Fedora 35 system:

```
$ sudo dnf --refresh update
```

```
$ sudo dnf upgrade
```

Reboot your system to apply the updates:

```
$ sudo reboot
```

Let us check the current version using the following commands:

```
$ cat /etc/fedora-release
```

To view the detailed version output, run this instead:

```
$ cat /etc/os-release
```

![Display Fedora Version][1]

Now, follow any one of the below methods to upgrade Fedora to 36 desktop or server.

#### 1. Upgrade To Fedora 36 Workstation Via GNOME Software

**Step 1:** Open your Gnome Software Center and go to **Updates** section. You will see a notification that says - **Fedora 36 Now Available**. Click the Download button to download Fedora 36 packages.

![Download Fedora 36 From Gnome Software][2]

The required packages will be downloaded now. This will take a while depending on the Internet speed.

![Downloading Fedora Linux 36][3]

**Step 2:** Once the download is complete, you will be prompted to restart and upgrade. Click the "Restart & Upgrade" button to continue installing the updates.

![Click Restart And Upgrade Button][4]

**Step 3:** A new pop up window will appear and prompt you to click **Restart & Install Upgrade**. Just click on it to reboot your Fedora system.

![Click Restart And Install Upgrade Button][5]

After system reboot, the downloaded packages will be installed. This will take a while depending on the number of packages to install. Make sure your system is plugged into the power outlet and you have uninterrupted power supply.

![Installing Updates][6]

After installing the updates, the system will automatically reboot into the brand new Fedora 36 desktop.

You can check if your Fedora system is up-to-date under **Updates** section in Gnome Software.

![Check For Updates In Gnome Software][7]

Congratulations! We've successfully upgraded to Fedora 36!

**Step 4:** Open a Terminal window and check the installed Fedora version using command:

```
$ cat /etc/fedora-release 
Fedora release 36 (Thirty Six)
```

To view the detailed output, run:

```
$ cat /etc/os-release
```

**Sample output:**

```
NAME="Fedora Linux"
VERSION="36 (Workstation Edition)"
ID=fedora
VERSION_ID=36
VERSION_CODENAME=""
PLATFORM_ID="platform:f36"
PRETTY_NAME="Fedora Linux 36 (Workstation Edition)"
ANSI_COLOR="0;38;2;60;110;180"
LOGO=fedora-logo-icon
CPE_NAME="cpe:/o:fedoraproject:fedora:36"
HOME_URL="https://fedoraproject.org/"
DOCUMENTATION_URL="https://docs.fedoraproject.org/en-US/fedora/f36/system-administrators-guide/"
SUPPORT_URL="https://ask.fedoraproject.org/"
BUG_REPORT_URL="https://bugzilla.redhat.com/"
REDHAT_BUGZILLA_PRODUCT="Fedora"
REDHAT_BUGZILLA_PRODUCT_VERSION=36
REDHAT_SUPPORT_PRODUCT="Fedora"
REDHAT_SUPPORT_PRODUCT_VERSION=36
PRIVACY_POLICY_URL="https://fedoraproject.org/wiki/Legal:PrivacyPolicy"
VARIANT="Workstation Edition"
VARIANT_ID=workstation
```

![Check Fedora 36 Version From Terminal][8]

Alternatively, You can check the Fedora version under **Settings -> About** section.

![Check Fedora 36 Version From Settings Section][9]

#### 2. Upgrade To Fedora 36 Server From Commandline

This method is for those who runs Fedora server edition in their system.

**Step 1:** Update Fedora 35 server using command:

```
$ sudo dnf --refresh update
```

```
$ sudo dnf upgrade
```

Reboot your system to apply the updates.

```
$ sudo reboot
```

**Step 2:** Install dnf upgrade plugin by running the following command:

```
$ sudo dnf install dnf-plugin-system-upgrade
```

**Step 3:** Download Fedora 36 packages using command:

```
$ sudo dnf system-upgrade download --releasever=36
```

This command will download all latest packages and display the summary of what packages are going to be replaced, updated, upgraded, or downgraded. This task should take several minutes to complete as it downloads a lot of packages.

If some of your packages have unsatisfied dependencies, the upgrade will refuse to continue until you run it again with an extra `--allowerasing` option.

```
$ sudo dnf system-upgrade download --releasever=36 --allowerasing
```

**Step 4:** Once all packages are downloaded, run the following command to start actual upgrade.

```
$ sudo dnf system-upgrade reboot
```

Your system will reboot automatically and upgrade task will start to install all downloaded packages.

Upon successful upgrade, the system reboots into the new Fedora 36 server edition.

That's it. Start using your newly upgraded Fedora 36 server system.

### Fedora Post-upgrade Tasks

In this section, we will discuss about a few post-upgrade tasks such as changing the hostname, removing unwanted packages, updating configuration files, deleting orphaned symlinks, and cleaning up old kernels etc.

The steps provided below are applicable for both Fedora desktop and server editions.

#### 1. Change Hostname

I usually use distribution's name as hostname. For example, the hostname for my Fedora 34 desktop would be **fedora34**. If you're anything like me, change the hostname to match with your current version.

To **change hostname**, run:

```
$ sudo hostnamectl set-hostname fedora36
```

#### 2. Clean DNF Metadata Cache

After upgrade, the cached metadata and transacation can cleared using the following commands:

```
$ sudo dnf system-upgrade clean
```

```
$ sudo dnf clean packages
```

#### 3. Remove Old Packages

List all packages with broken or unsatisfied dependencies, run:

```
$ sudo dnf update
```

```
$ sudo dnf repoquery --unsatisfied
```

List all duplicate packages using command:

```
$ sudo dnf repoquery --duplicates
```

List all packages that are not in the repositories:

```
$ sudo dnf list extras
```

If you don't need them anymore, simply run the following commands to remove old, and unused packages.

```
$ sudo dnf remove $(sudo dnf repoquery --extras --exclude=kernel,kernel-*)
```

```
$ sudo dnf autoremove
```

#### 4. Clean Up Retired Packages

A few packages will be retired in each Fedora release. They could be obsolete or the maintainer abandoned the packages. The retired packages packages will not get any updates. Not even security updates.

To remove obsolete and retired packages, run:

```
$ sudo dnf install remove-retired-packages
```

```
$ remove-retired-packages
```

#### 5. Update System Configuration Files

To update system configuration files, use `rpmconf` tool.

To install `rpmconf` tool, run:

```
$ sudo dnf install rpmconf
```

Once the install is complete, run the following command:

```
$ sudo rpmconf -a
```

#### 6. Clean Up Old Kernels

The `dnf autoremove` command will not remove any unused kernels to avoid unintentional Kernel removals. If you want to remove old kernels, you can use the following command:

```
$ sudo dnf remove $(dnf repoquery --installonly --latest-limit=-3)
```

The above command will remove all old kernels and retain only the latest 3 kernels.

**Heads Up:** It is HIGHLY RECOMMENDED to **keep at least two kernels**. Because, if there is a problem in the current Kernel version after upgrading, you can safely switch to the older kernel.

#### 7. Remove Broken Symlinks

After system upgrade, there would be some unused symlinks left in your system. You need to **find and delete the dangling soft links or symlinks** that don't point anywhere.

To find broken symlinks in `/usr` directory, run:

```
$ sudo symlinks -r /usr | grep dangling
```

To remove the dangling symlinks, run:

```
$ sudo symlinks -r -d /usr
```

### Conclusion

In this guide, we have seen how to upgrade to Fedora 36 from Fedora 35 via Gnome Software center and from terminal. At the end, we included a few post-upgrade steps that needs to done to cleanup the fedora system.

--------------------------------------------------------------------------------

via: https://ostechnix.com/upgrade-to-fedora-36-from-fedora-35/

作者：[sk][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/wp-content/uploads/2022/05/Display-Fedora-Version.png
[2]: https://ostechnix.com/wp-content/uploads/2022/05/Download-Fedora-36-From-Gnome-Software.png
[3]: https://ostechnix.com/wp-content/uploads/2022/05/Downloading-Fedora-Linux-36.png
[4]: https://ostechnix.com/wp-content/uploads/2022/05/Click-Restart-And-Upgrade-Button.png
[5]: https://ostechnix.com/wp-content/uploads/2022/05/Click-Restart-And-Install-Upgrade-Button.png
[6]: https://ostechnix.com/wp-content/uploads/2022/05/Installing-Updates.png
[7]: https://ostechnix.com/wp-content/uploads/2022/05/Check-For-Updates-In-Gnome-Software.png
[8]: https://ostechnix.com/wp-content/uploads/2022/05/Check-Fedora-36-Version-From-Terminal.png
[9]: https://ostechnix.com/wp-content/uploads/2022/05/Check-Fedora-36-Version-From-Settings-Section.png
