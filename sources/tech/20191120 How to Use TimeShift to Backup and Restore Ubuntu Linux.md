[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Use TimeShift to Backup and Restore Ubuntu Linux)
[#]: via: (https://www.linuxtechi.com/timeshift-backup-restore-ubuntu-linux/)
[#]: author: (James Kiarie https://www.linuxtechi.com/author/james/)

How to Use TimeShift to Backup and Restore Ubuntu Linux
======

Have you ever wondered how you can backup and restore your **Ubuntu** or **Debian system** ? **Timeshift** is a free and opensource tool that allows you to create incremental snapshots of your filesystem. You can create a snapshot using either **RSYNC** or **BTRFS**.

[![TimeShift-Backup-Restore-Tool-Ubuntu][1]][2]

With that. let’s delve in and install Timeshift. For this tutorial, we shall install on Ubuntu 18.04 LTS system.

### Installing TimeShift on Ubuntu / Debian Linux

TimeShift is not hosted officially on Ubuntu and Debian repositories. With that in mind, we are going to run the command below to add the PPA:

```
# add-apt-repository -y ppa:teejee2008/ppa
```

![Add-timeshift-repository][1]

Next, update the system packages with the command:

```
# apt update
```

After a successful system update, install timeshift by running following apt command :

```
# apt install timeshift
```

![apt-install-timeshift][1]

### Preparing a backup storage device

Best practice demands that we save the system snapshot on a separate storage volume, aside from the system’s hard drive. For this guide, we are using a 16 GB flash drive as the secondary drive on which we are going to save the snapshot.

```
# lsblk | grep sdb
```

![lsblk-sdb-ubuntu][1]

For the flash drive to be used as a backup location for the snapshot, we need to create a partition table on the device. Run the following commands:

```
# parted /dev/sdb  mklabel gpt
# parted /dev/sdb  mkpart primary 0% 100%
# mkfs.ext4  /dev/sdb1
```

![create-partition-table-on-drive-ubuntu][1]

After creating a partition table on the USB flash drive, we are all set to begin creating filesystem’s snapshots!

### Using Timeshift to create snapshots

To launch Timeshift, use the application menu to search for the  Timeshift application.

![Access-Timeshift-Ubuntu][1]

Click on the Timeshift icon and the system will prompt you for the Administrator’s password. Provide the password and click on Authenticate

![Authentication-required-ubuntu][1]

Next, select your preferred snapshot type.

![Select-Rsync-option-timeshift][1]

Click ‘**Next**’.  Select the destination drive for the snapshot. In this case, my location is the external USB drive labeled as **/dev/sdb**

![Select-snapshot location][1]

Next, define the snapshot levels. Levels refer to the intervals during which the snapshots are created.  You can choose to have either monthly, weekly, daily, or hourly snapshot levels.

![Select-snapshot-levels-Timeshift][1]

Click ‘Finish’

On the next Window, click on the ‘**Create**’ button to begin creating the snapshot. Thereafter, the system will begin creating the snapshot.

![Create-snapshot-timeshift][1]

Finally, your snapshot will be displayed as shown

![Snapshot-created-TimeShift][1]

### Restoring Ubuntu / Debian from a snapshot

Having created a system snapshot, let’s now see how you can restore your system from the same snapshot. On the same Timeshift window, click on the snapshot and click on the ‘**Restore**’ button as shown.

![Restore-snapshot-timeshift][1]

Next, you will be prompted to select the target device.  leave the default selection and hit ‘**Next**’.

![Select-target-device-timeshift][1]

A dry run will be performed by Timeshift before the restore process commences.

![Comparing-files-Dry-Run-timeshift][1]

In the next window, hit the ‘**Next**’  button to confirm actions displayed.

![Confirm-actions-timeshift][1]

You’ll get a warning and a disclaimer as shown. Click ‘**Next**’ to initialize the restoration process.

Thereafter, the restore process will commence and finally, the system will thereafter reboot into an earlier version as defined by the snapshot.

![Restoring-snapshot-timeshift][1]

**Conclusion**

As you have seen it quite easy to use TimeShift to restore your system from a snapshot. It comes in handy when backing up system files and allows you to recover in the event of a system fault. So don’t get scared to tinker with your system or mess up. TimeShift will give you the ability to go back to a point in time when everything was running smoothly.

  * [Facebook][3]
  * [Twitter][4]
  * [LinkedIn][5]
  * [Reddit][6]



--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/timeshift-backup-restore-ubuntu-linux/

作者：[James Kiarie][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/james/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: https://www.linuxtechi.com/wp-content/uploads/2019/11/TimeShift-Backup-Restore-Tool-Ubuntu.png
[3]: http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.linuxtechi.com%2Ftimeshift-backup-restore-ubuntu-linux%2F&t=How%20to%20Use%20TimeShift%20to%20Backup%20and%20Restore%20Ubuntu%20Linux
[4]: http://twitter.com/share?text=How%20to%20Use%20TimeShift%20to%20Backup%20and%20Restore%20Ubuntu%20Linux&url=https%3A%2F%2Fwww.linuxtechi.com%2Ftimeshift-backup-restore-ubuntu-linux%2F&via=Linuxtechi
[5]: http://www.linkedin.com/shareArticle?mini=true&url=https%3A%2F%2Fwww.linuxtechi.com%2Ftimeshift-backup-restore-ubuntu-linux%2F&title=How%20to%20Use%20TimeShift%20to%20Backup%20and%20Restore%20Ubuntu%20Linux
[6]: http://www.reddit.com/submit?url=https%3A%2F%2Fwww.linuxtechi.com%2Ftimeshift-backup-restore-ubuntu-linux%2F&title=How%20to%20Use%20TimeShift%20to%20Backup%20and%20Restore%20Ubuntu%20Linux
