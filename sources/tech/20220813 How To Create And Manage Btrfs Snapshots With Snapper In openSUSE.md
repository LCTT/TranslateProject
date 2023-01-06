[#]: subject: "How To Create And Manage Btrfs Snapshots With Snapper In openSUSE"
[#]: via: "https://ostechnix.com/btrfs-snapshots-snapper/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How To Create And Manage Btrfs Snapshots With Snapper In openSUSE
======
Use Snapper To Automate Btrfs Snapshots

**Btrfs** is a Linux filesystem that has been adopted as the default filesystem in popular Linux distributions such as openSUSE and Fedora. It has many unique features that are not available in other filesystems. It is based on **copy-on-write**, allowing for efficient filesystem snapshots and clones. In this guide we will see whats is **Snapper**, and how to **create Btrfs filesystem snapshots with Snapper** on openSUSE Linux.

### What Is Snapper?

Snapper is a Linux filesystem snapshot management tool created by **Arvin Schnell**, a software developer at SUSE. Using Snapper, you can easily create, delete, compare, and undo changes between Btrfs filesystem snapshots.

Snapper is integrated into YaST and zypper to create and manage Btrfs snapshots in SUSE-based Linux systems. It can also be integrated with other distribution's package manager (E.g. DNF) using a plugin.

Snapper can automatically create a pair of snapshots before and after running YaST or zypper. You can also manually create a single snapshot from command line or using the YaST.

You can compare two snapshots and restore the previous snapshot when there is a problem. To put it in other words, Snapper can be used to view older versions of files and rollback to previous working system state if something goes wrong.

Snapper automatically creates the timeline of snapshots, so you can easily know when a snapshot is taken. The older snapshots are automatically cleaned up to save the disk space.

Snapper has both CLI and GUI interface (YaST module). So you can use Snapper on servers as well as desktops to snapshot the Btrfs filesystems.

Snapper is initially developed for SUSE and openSUSE only. Now, it works on any Linux distribution that supports Btrfs filesystem and thin-provisioned LVM based logical volumes.

Snapper supported EXT4 filesystem in the past, but it is discontinued now. Using Snapper on EXT4 filesystems is highly discouraged!

### Install Snapper In Linux

In order to use Snapper, the partitions should have Btrfs filesystems.

By default, SUSE and openSUSE use Btrfs filesystem for the **root** partition. If you choose to use Btrfs for your root filesystem during fresh **[openSUSE installation][1]**, Snapper will be automatically configured for YaST2 and Zypper. So whenever you use YaST2 or Zypper, the snapshots will be automatically taken. You can also manually take snapshots at any time.

On other Linux distributions, you may need to install Snapper and configure it with the distribution's default package manager.

To install Snapper in Arch Linux and its variants such as EndeavourOS and Manjaro Linux, run:

```
$ sudo pacman -S snapper
```

Install Snapper on Fedora:

```
$ sudo dnf install snapper
```

Install Snapper in Debian, Ubuntu:

```
$ sudo apt install snapper
```

It is also available for various other Linux distributions as well. Head over to **[Snapper download link][2]** and get the required version for your Linux version and install it.

As stated already, Snapper is integrated into YaST2 and Zypper, so the snapshot of root filesystem is automatically taken when each YaST/Zypper transaction is completed.

For other Linux distributions, you may need to install snapper plugins to integrate Snapper with your package managers.

For example, if you use Fedora, you can install **DNF snapper plugin** to snapshot filesystem automatically when running dnf command.

```
$ sudo dnf install snapper python3-dnf-plugin-snapper
```

### Create Btrfs Filesystem Snapshots With Snapper

All commands given below are tested on a latest openSUSE Tumbleweed edition.

#### 1. View Snapper Configuration

By default, YaST creates a snapper config called "root" for your root file system. You can list the existing snapshot configuration using command:

```
$ sudo snapper list-configs
```

**Sample output:**

```
Config | Subvolume
-------+----------
root   | /
```

![List Snapper Configuration][3]

The above command will

* create a new configuration file at `/etc/snapper/configs/root` based on the default template from `/usr/share/snapper/config-templates`.
* create a new subvolume at `/.snapshots` directory and store the future snapshots for the root configuration in this directory.

The snapper configuration for root is now active. From now on, Snapper will take automatic timeline snapshots at regular time intervals if automatic timeline snapshot feature is enabled.

#### 3. Configure Automatic Timeline Snapshots

Taking snapshots is automatically enabled if the root partition (/) is big enough (approximately **more than 16 GB**). If the root partition is smaller than 16 GB, all Snapper features and automatic snapshots are disabled to prevent a full `/` partition.

To check if automatic snapshots is enabled, edit `/etc/snapper/configs/root` file:

```
$ sudo nano /etc/snapper/configs/root
```

Make sure the following option is set to "yes".

```
TIMELINE_CREATE="yes"
```

If timeline is enabled, Snapper will create a snapshot once an hour by default.

To disable automatic timeline snapshots feature, simply set the above feature to "no".

```
TIMELINE_CREATE="no"
```

When automatic timeline snapshots feature is enabled, Snapper will keep a specific number of hourly, daily, weekly, monthly, and yearly snapshots based on the configuration settings defined in `/etc/snapper/configs/root` file.

Let us check current configuration settings:

```
[...]
TIMELINE_MIN_AGE="1800"
TIMELINE_LIMIT_HOURLY="10"
TIMELINE_LIMIT_DAILY="10"
TIMELINE_LIMIT_WEEKLY="0"
TIMELINE_LIMIT_MONTHLY="10"
TIMELINE_LIMIT_YEARLY="10"
[...]
```

As per the above configuration, Snapper will keep 100 hourly, 10 daily, 10 monthly, and 10 yearly snapshots if the automatic timeline snapshots feature is enabled.

#### 4. List Snapshots

To list the available snapshots using Snapper, run:

```
$ sudo snapper list
```

**Sample output:**

```
# | Type   | Pre # | Date                                | User | Used Space | Cleanup | Description           | Userdata     
----+--------+-------+-------------------------------------+------+------------+---------+-----------------------+--------------
 0  | single |       |                                     | root |            |         | current               |              
 1* | single |       | Thursday 04 August 2022 12:54:37 PM | root |  13.82 MiB |         | first root filesystem |              
 2  | single |       | Thursday 04 August 2022 05:16:07 PM | root |  20.25 MiB | number  | after installation    | important=yes
 3  | pre    |       | Thursday 04 August 2022 05:28:12 PM | root |   1.64 MiB | number  | zypp(packagekitd)     | important=yes
 4  | post   |     3 | Thursday 04 August 2022 05:29:38 PM | root |  27.98 MiB | number  |                       | important=yes
11  | pre    |       | Friday 05 August 2022 02:07:22 PM   | root |   4.12 MiB | number  | zypp(zypper)          | important=no 
12  | post   |    11 | Friday 05 August 2022 02:09:07 PM   | root |  33.29 MiB | number  |                       | important=no 
13  | pre    |       | Friday 05 August 2022 02:33:19 PM   | root | 176.00 KiB | number  | yast snapper          |              
14  | pre    |       | Friday 05 August 2022 02:39:30 PM   | root | 128.00 KiB | number  | zypp(zypper)          | important=no 
15  | post   |    14 | Friday 05 August 2022 02:39:48 PM   | root |   5.65 MiB | number  |                       | important=no 
16  | post   |    13 | Friday 05 August 2022 04:11:00 PM   | root |  32.00 KiB | number  |                       |              
17  | pre    |       | Friday 05 August 2022 04:11:27 PM   | root |  64.00 KiB | number  | yast snapper          |              
20  | post   |    17 | Friday 05 August 2022 06:48:50 PM   | root |   2.33 MiB | number  |                       |
```

![List Snapshots][4]

As you can see in the above output, There are three types of snapshots. They are known as **single**, **pre** and **post** respectively.

Each snapshot has an index number and the exact date and time of snapshot creation. The snapshot `#0` always refers to the current system.

The **single** snapshots are used for storing the file system state in a certain time. The single snapshots have no special relationship to other snapshots.

A pair of snapshots of root filesystem is created during each YaST or Zypper transaction. These snapshots are called **pre** and **post**.

One snapshot is created just before the transaction run (Pre). This means after a successful transaction check and successful transaction test. And another snapshot is created when the transaction has finished (Post).

Each "pre" snapshots belongs to a specific "post" snapshot. The post snapshots knows which pre snapshots belongs to it.

By having a pre and post snapshot, we can see what changes happened to the file system while YaST/Zypper was running.

How do you know Snapper actually snapshots the filesystem? Easy! Open YaST and do some configuration changes or install/remove a package using Zypper package manager. Snapper will automatically snapshot the filesystem during each transaction.

For example, I am going to install "gedit" package using zypper:

```
$ sudo zypper install gedit
```

Now list the snapshots using command:

```
$ sudo snapper list
```

**Sample output:**

```
# | Type   | Pre # | Date                                | User | Used Space | Cleanup | Description           | Userdata     
----+--------+-------+-------------------------------------+------+------------+---------+-----------------------+--------------
 0  | single |       |                                     | root |            |         | current               |              
 1* | single |       | Thursday 04 August 2022 12:54:37 PM | root |  56.28 MiB |         | first root filesystem |              
 2  | single |       | Thursday 04 August 2022 05:16:07 PM | root |  20.25 MiB | number  | after installation    | important=yes
 3  | pre    |       | Thursday 04 August 2022 05:28:12 PM | root |   1.64 MiB | number  | zypp(packagekitd)     | important=yes
 4  | post   |     3 | Thursday 04 August 2022 05:29:38 PM | root |  27.98 MiB | number  |                       | important=yes
11  | pre    |       | Friday 05 August 2022 02:07:22 PM   | root |   4.12 MiB | number  | zypp(zypper)          | important=no 
12  | post   |    11 | Friday 05 August 2022 02:09:07 PM   | root |  33.29 MiB | number  |                       | important=no 
13  | pre    |       | Friday 05 August 2022 02:33:19 PM   | root | 176.00 KiB | number  | yast snapper          |              
14  | pre    |       | Friday 05 August 2022 02:39:30 PM   | root | 128.00 KiB | number  | zypp(zypper)          | important=no 
15  | post   |    14 | Friday 05 August 2022 02:39:48 PM   | root |   5.65 MiB | number  |                       | important=no 
16  | post   |    13 | Friday 05 August 2022 04:11:00 PM   | root |  32.00 KiB | number  |                       |              
17  | pre    |       | Friday 05 August 2022 04:11:27 PM   | root |  64.00 KiB | number  | yast snapper          |              
20  | post   |    17 | Friday 05 August 2022 06:48:50 PM   | root |   2.74 MiB | number  |                       |              
21  | pre    |       | Tuesday 09 August 2022 04:10:44 PM  | root | 992.00 KiB | number  | zypp(zypper)          | important=no 
22  | post   |    21 | Tuesday 09 August 2022 04:10:49 PM  | root |   1.64 MiB | number  |                       | important=no
```

There it is! Snapper has taken a pre and post snapshots before and after zypper command is executed.

#### 5. View Snapshot Status

We can verify what has changed while YaST or Zypper was running.

To do so, simply run the following command with the index number of pre and post snapshots:

```
$ sudo snapper status 21..22
```

You will see whole list of newly added/removed files during the transaction.

```
[...]
c..... /usr/share/icons/hicolor/icon-theme.cache
+..... /usr/share/icons/hicolor/scalable/apps/org.gnome.gedit.svg
+..... /usr/share/icons/hicolor/symbolic/apps/org.gnome.gedit-symbolic.svg
+..... /usr/share/licenses/gedit
+..... /usr/share/licenses/gedit/COPYING
+..... /usr/share/man/man1/gedit.1.gz
+..... /usr/share/metainfo/org.gnome.gedit.appdata.xml
```

Here,

* 'c' means a file is modified.
* '+' means a file is added.
* '-' indicates a file is removed.

#### 6. View Snapshot Difference

We can also see the difference between pre and post snapshots.

```
$ sudo snapper diff 21..22
```

Or pass the "less" option to view the output page by page.

```
$ sudo snapper diff 21..22 | less
```

![View Snapshots Difference][5]

#### 7. Revert Or Undo Changes

If you don't like the changes made by YaST or Zypper, you can revert back to the previous system state by using command:

```
$ sudo snapper undochange 21..22
```

Snapper will revert all files (text and binary) including permissions, ownership and extended attributes and also remove and recreate files and directories. File timestamps are not reverted. Some files are excluded, e.g. `/etc/mtab`.

You need to reboot your system to take effect the changes. Because Snapper will not notify the Kernel about the changes like YaST or Zypper does.

#### 8. Manually Create Btrfs Snapshots

Snapper creates snapshots automatically. You can, however, manually create Btrfs snapshots as well.

To create a new snapshot, simply run:

```
$ sudo snapper create --desc "Snapshot After Fresh Installation"
```

Here, `--desc` indicates the description of the snapshot.

Let us check if the snapshot is created by listing the available snapshots.

```
$ sudo snapper list
```

**Sample output:**

```
# | Type   | Pre # | Date                                | User | Used Space | Cleanup | Description                       | Userdata     
----+--------+-------+-------------------------------------+------+------------+---------+-----------------------------------+--------------
 0  | single |       |                                     | root |            |         | current                           |              
 1* | single |       | Thursday 04 August 2022 12:54:37 PM | root |  16.00 KiB |         | first root filesystem             |              
 2  | single |       | Thursday 04 August 2022 05:16:07 PM | root |  20.25 MiB | number  | after installation                | important=yes
 3  | pre    |       | Thursday 04 August 2022 05:28:12 PM | root |   1.64 MiB | number  | zypp(packagekitd)                 | important=yes
 4  | post   |     3 | Thursday 04 August 2022 05:29:38 PM | root |  27.98 MiB | number  |                                   | important=yes
11  | pre    |       | Friday 05 August 2022 02:07:22 PM   | root |   4.12 MiB | number  | zypp(zypper)                      | important=no 
12  | post   |    11 | Friday 05 August 2022 02:09:07 PM   | root |  33.29 MiB | number  |                                   | important=no 
13  | pre    |       | Friday 05 August 2022 02:33:19 PM   | root | 176.00 KiB | number  | yast snapper                      |              
14  | pre    |       | Friday 05 August 2022 02:39:30 PM   | root | 128.00 KiB | number  | zypp(zypper)                      | important=no 
15  | post   |    14 | Friday 05 August 2022 02:39:48 PM   | root |   5.65 MiB | number  |                                   | important=no 
16  | post   |    13 | Friday 05 August 2022 04:11:00 PM   | root |  32.00 KiB | number  |                                   |              
17  | pre    |       | Friday 05 August 2022 04:11:27 PM   | root |  64.00 KiB | number  | yast snapper                      |              
20  | post   |    17 | Friday 05 August 2022 06:48:50 PM   | root |   2.33 MiB | number  |                                   |              
21  | single |       | Tuesday 09 August 2022 03:50:04 PM  | root |  16.00 KiB |         | Snapshot After Fresh Installation |
```

![Create Btrfs Snapshots][6]

#### 9. View Contents Of Snapshots

All the snapshots are kept under `/.snapshots` directory for root configuration. Each snapshot is stored in a separate directory. If you move into the snapshot directory, you will see the complete root filesystem.

```
$ sudo ls /.snapshots/17/snapshot
bin  boot  dev	etc  home  lib	lib64  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
```

![View Contents Of Filesystem Snapshots][7]

#### 10. Setup Snapper Config For HOME Directory

in SUSE/openSUSE, YaST doesn't setup Snapper for your `/home` directory. By default, it setup Snapper config for root filesystem only.

You to need to manually setup Snapper config for your HOME directory. To do so, run:

```
$ sudo snapper -c home create-config /home
```

The above command will

* create a new configuration file at `/etc/snapper/configs/home` based on the default template from `/usr/share/snapper/config-templates`.
* create a new subvolume at `/home/.snapshots` directory and store the future snapshots for the home configuration in this directory.

Verify if the configuration file for `/home` directory is created by listing the Snapper config files:

```
$ sudo snapper list-configs 
Config | Subvolume
-------+----------
home   | /home    
root   | /
```

Yes, it is created! From now on, you can view the list of snapshots for `/home` directory.

```
$ sudo snapper -c home list
 # | Type   | Pre # | Date                               | User | Used Space | Cleanup  | Description | Userdata
---+--------+-------+------------------------------------+------+------------+----------+-------------+---------
0  | single |       |                                    | root |            |          | current     |         
1  | single |       | Tuesday 09 August 2022 05:00:26 PM | root |  16.00 KiB | timeline | timeline    |
```

**Heads Up:** Please note that whenever you want to use Snapper for `/home` directory, you must use `-c home` option in all commands.

To manually create a snapshot for /home directory, run:

```
$ sudo snapper -c home create --description "First snapshot for /home directory"
```

#### 11. Rollback From Bootable Snapshots

Restoring your Linux system to previous known working state with Snapper is a quite helpful feature.

When you unknowingly misconfigured something or ended up with a broken system after system upgrade, you can easily rollback to previous state without losing any data.

Reboot your system. In the boot menu, choose **"Start bootloader from a read-only snapshot"** option.

![Start Bootloader From Read-only Snapshot][8]

The list of snapshots is listed by date in the next window. The most recent snapshot is listed first. Select the snapshot you want to boot and hit Enter to login.

![Select The Snapshot To Boot][9]

Log in to the system. Carefully check whether everything works as expected. Please note that you cannot write to any directory that is part of the snapshot. Data you write to other directories will not get lost, regardless of what you do next.

If **everything is OK** as expected, perform a rollback by running the following command from your Terminal.

```
$ sudo snapper rollback
```

**Sample output:**

```
Ambit is classic.
Creating read-only snapshot of default subvolume. (Snapshot 32.)
Creating read-write snapshot of current subvolume. (Snapshot 33.)
Setting default subvolume to snapshot 33.
```

![Rollback Snapshot][10]

Once the rollback is completed, reboot your system. On the boot screen, choose the default boot entry to reboot into the reinstated system. A snapshot of the file system status before the rollback is created. The default subvolume for root will be replaced with a fresh read-write snapshot.

You can optionally add a description for the snapshot with the `-d` option. This is useful to easily remember when you've done the rollback. For example:

```
New file system root since rollback on 13/08/2022
```

If your system is in a **state where you do not want to do a rollback**, don't anything. Just reboot to boot into the current system state. And then choose a different snapshot, or start the rescue system.

Please note that this feature supports only the root configuration.

#### 12. Delete Snapshots

To delete a snapshot, simply specify the configuration name and the snapshot number like below. The following commands will delete the snapshot 17 of root configuration:

```
$ sudo snapper -c root delete 17
```

Similarly, to **delete a snapshot of home configuration**, the command would be:

```
$ sudo snapper -c home delete <snapshot-no>
```

To delete multiple snapshots (E.g. 10 and 11) at once, specify the snapshots nos with space separated like below:

```
$ sudo snapper -c root delete 10 11
```

**Heads Up:** After deleting a pre snapshot, you should always delete the corresponding post snapshot and vice versa.

You can also delete a range of snapshots, for example snapshots 10 to 20 of home configuration, run:

```
$ sudo snapper -c home delete 10-20
```

To free the disk space used by the snapshot(s) immediately, use `--sync` option:

```
$ sudo snapper -c root delete --sync 30
```

### Troubleshooting - Reduce I/O Load

Snapper creates two snapshots and compares them during each YaST/Zypper transaction. This will cause high I/O load.

To reduce the I/O load, edit `/etc/snapper/configs/root` file:

```
$ sudo nano /etc/snapper/configs/root
```

Set **"no"** to the following parameters.

```
[...]
BACKGROUND_COMPARISON="no"
[...]
EMPTY_PRE_POST_CLEANUP="no"
```

![Reduce I/O Load][11]

The first line disables the background comparison and the second line disables daily cleanups. Save the file and close it.

### Snapper GUI

Snapper also has a graphical user interface where you can create and manage Btrfs filesystem snapshots with couple mouse clicks.

Launch Snapper from Menu. In openSUSE, it is available under different name called "YaST Filesystem Snapshots".

This is how Snapper GUI looks in openSUSE.

![Snapper Interface][12]

The above window shows the list of available snapshots under root configuration. You can switch to different configuration (E.g. home) from the "Current Configuration" drop-down box.

![Switch Configuration In Snapper GUI][13]

From here, you can create new snapshots, modify them and delete snapshots if they are no longer required.

#### Revert Changes Via Snapper GUI

To restore a snapshot, choose the snapshot of your choice from the list and click **"Show Changes"** button.

![Select Snapshot][14]

In the next window, choose the files and folders in the original snapshot to restore and finally click "Restore Selected" Button. You will be asked a confirmation to restore the snapshot. Click "Yes" to continue.

![Restore Snapshot][15]

The snapshot is restored!

### Conclusion

In this guide, we discussed what is Snapper and how can we use Snapper to create a Btrfs snapshot before and after running YaST or zypper, compare the two snapshots and revert between the two snapshots in openSUSE. We also looked at how to rollback from bootable read-only snapshot to restore your system to previous working state.

Finally, we learned how to use Snapper GUI tool to do all snapshot management operations via a graphical interface.

Snapper is an underrated tool that handles the filesystem snapshots like a breeze. You don't need any third-party filesystem snapshot tool if the underlying filesystem is Btrfs.

**Resources:**

* [Snapper GitHub Repository][16]
* [Snapper Website][17]

--------------------------------------------------------------------------------

via: https://ostechnix.com/btrfs-snapshots-snapper/

作者：[sk][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/install-opensuse-leap/
[2]: http://download.opensuse.org/repositories/filesystems:/snapper/
[3]: https://ostechnix.com/wp-content/uploads/2022/08/List-Snapper-Configuration.png
[4]: https://ostechnix.com/wp-content/uploads/2022/08/List-Snapshots.png
[5]: https://ostechnix.com/wp-content/uploads/2022/08/View-Snapshots-Difference.png
[6]: https://ostechnix.com/wp-content/uploads/2022/08/Create-Btrfs-Snapshots.png
[7]: https://ostechnix.com/wp-content/uploads/2022/08/View-Contents-Of-Filesystem-Snapshots.png
[8]: https://ostechnix.com/wp-content/uploads/2022/08/Start-Bootloader-From-Read-only-Snapshot.png
[9]: https://ostechnix.com/wp-content/uploads/2022/08/Select-The-Snapshot-To-Boot.png
[10]: https://ostechnix.com/wp-content/uploads/2022/08/Rollback-Snapshot.png
[11]: https://ostechnix.com/wp-content/uploads/2022/08/Reduce-IO-Load.png
[12]: https://ostechnix.com/wp-content/uploads/2022/08/Snapper-Interface.png
[13]: https://ostechnix.com/wp-content/uploads/2022/08/Switch-Configuration-In-Snapper-GUI.png
[14]: https://ostechnix.com/wp-content/uploads/2022/08/Select-Snapshot.png
[15]: https://ostechnix.com/wp-content/uploads/2022/08/Restore-Snapshot.png
[16]: https://github.com/openSUSE/snapper
[17]: http://snapper.io/
