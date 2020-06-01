[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Format a USB Disk as exFAT on Linux [Graphically and Command Line])
[#]: via: (https://itsfoss.com/format-exfat-linux/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

How to Format a USB Disk as exFAT on Linux [Graphically and Command Line]
======

_**Brief: This tutorial teaches you how to format a USB disk in exFAT format on Linux systems. Both GUI and command line methods have been discussed.**_

For a long time [FAT][1] has been the default choice of filesystem for formatting disks. It is compatible with pretty much all the major operating systems.

The one major problem with FAT filesystem is that you cannot transfer a file larger than 4 GB. This means even if your USB disk has 32 GB of free space, if you try to transfer a ISO image or some other file greater than 4 GB in size, the transfer will fail.

This creates a problem in situation like when you are [creating a bootable USB of Windows in Linux][2]. You cannot use [NTFS][3] and FAT filesystem has that 4 GB size restrictions.

To overcome the limitations of FAT filesystem, Microsoft came up with [exFAT filesystem][4]. And in this tutorial, I’ll show you how to format a USB disk in exFAT filesystem.

  * [Format disk as exFAT using graphical tool][5]
  * [Format disk as exFAT using command line][6]



P**rerequisite**

Starting [Linux kernel 5.4][7], exFAT filesystem support is enabled in Linux kernel itself. [Check which Linux kernel version you are running][8]. If it is kernel 5.4 or higher, you should be fine.

Otherwise, you’ll have to [enable exFAT support][9] explicitly. In Ubuntu-based distributions, you can use these packages for this purpose:

**sudo apt install exfat-fuse exfat-utils**

### Method 1: Format disk as exFAT using GNOME Disks tool

![][10]

Formatting a drive using [GNOME Disks][11] is a straightforward job. It comes preinstalled in a number of Linux distributions.

Plug in your external USB disk. Now, look for Disks in menu and open the GNOME Disks application. As a first step choose the drive that you want to format and follow the steps with me.

_**Warning: Pay attention to the disk you are selecting to format. Don’t format your main disk accidentally.**_

![][12]

The commonly used file systems like Ext4, NTFS, FAT will appear first. To use exFAT, choose “**Other**” and then click on “**Next**“.

![][13]

Final step: choose exFAT file system on this screen and then click **Create**. Job done!

![][14]

See how easy it was to create a exFAT disk in Linux graphically? Now, let me show you the terminal method as well.

### Method 2: Format disk as exFAT in Linux command line (for advanced users)

[fdisk][15] is a dialogue-driven command-line utility that creates and manipulates partition tables and partitions on a hard disk. In fact, it is considered one of the [best partitioning tools for Linux][16].

Plug in your external hard disk then type the following command in the terminal:

```
sudo fdisk -l
```

![][17]

This will list down all the hard disks and partitions in your computer. Identify the partition that you want to format in your external hard disk. Size of the disks should give you a hint. For me, the USB disk was labelled as /dev/sdb1.

Once you have identified your USB disk, format it as exfat using the command below. Replace /dev/sdXn with your disk’s device ID. LABEL is basically the name you want to give to your disk like Data, MyUSB etc.

```
sudo mkfs.exfat -n LABEL /dev/sdXn
```

![][18]

Optionally, run fsck check to make sure the formatting has been done properly.

```
sudo fsck.exfat /dev/sdXn
```

That’s it. Enjoy the exFAT disk.

### Did you succeed to create exFAT disk?

I hope you find this tutorial simple enough, and a step forward to build a solid partitioning knowledge foundation.

Sometimes easy and simple tips and tricks will make you a better Linux in the long term. Our frequent readers know that first hand but if you discovered It’s FOSS recently, you may take the opportunity to explore our handy tutorials.

Don’t forget to subscribe and let me know your questions and suggestions in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/format-exfat-linux/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/File_Allocation_Table
[2]: https://itsfoss.com/bootable-windows-usb-linux/
[3]: https://en.wikipedia.org/wiki/NTFS
[4]: https://en.wikipedia.org/wiki/ExFAT
[5]: tmp.YPwoWNgq9W#graphical-method
[6]: tmp.YPwoWNgq9W#command-line
[7]: https://itsfoss.com/linux-kernel-5-4/
[8]: https://itsfoss.com/find-which-kernel-version-is-running-in-ubuntu/
[9]: https://itsfoss.com/mount-exfat/
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/format-exfat-linux.jpg?ssl=1
[11]: https://wiki.gnome.org/Apps/Disks
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/1.-gnome-disks-2.png?ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/2.-gnome-disks.jpg?ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/3.-gnome-disks.jpg?ssl=1
[15]: https://www.tldp.org/HOWTO/Partition/fdisk_partitioning.html
[16]: https://itsfoss.com/partition-managers-linux/
[17]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/sudo-fdisk-l-1.jpg?ssl=1
[18]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/sdXn.jpg?ssl=1
