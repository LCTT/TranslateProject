How to use Linux lsblk Command to List Block Device Information
================================================================================
The command **lsblk** (list block devices) is used to list information about all available block devices, however, **it does not list information about RAM disks**. Examples of block devices are hard disk, flash drives, CD-ROM e.t.c

### How To Install lsblk ###

The command lsblk comes in the package util-linux-ng, now renamed util-linux. The package comes with several other utilities such as dmesg. To install lsblk download util-linux [here][1].

### How To Install lsblk In Fedora ###

Fedora users can install the package as follows:

    $ sudo yum install util-linux-ng

The command has several options:

### The Default Option ###

The command lsblk by default will list all block devices in a tree-like format. Open your terminal and type the command as follows:

    $ lsblk

The output is as follows: 

![lsblk default](http://linoxide.com/wp-content/uploads/2014/03/lsblk-default.jpg)

There are seven columns namely:

**NAME** : This is the device name.

**MAJ:MIN** : This column shows the major and minor device number.

**RM** : This column shows whether the device is removable or not. Note in this example the device sdb and sr0 have their RM values equals to 1 indicating they are removable.

**SIZE** : This is column give information on the size of the device. For example 298.1G indicate the device is 298.1GB and 1K indicate the device size is 1KB.

**RO** : This indicates whether a device is read-only. In this case all devices have a RO=0, indicating they are not read only.

**TYPE** :This column shows information whether the block device is a disk or a partition(part) within a disk. In this example sda and sdb are disks while sr0 is a read only memory (rom).

**MOUNTPOINT** : This column indicates mount point on which the device is mounted.

### List All Devices ###

The default option does not list all empty devices. To view these also use the command as follows:

    $ lsblk -a

This option will list all devices including empty ones.

![lsblk bytes sda](http://linoxide.com/wp-content/uploads/2014/03/lsblk-bytes-sda.png)

### List Device Permissions and Owner ###

The command lsblk can also be used to list the ownership of a particular device as well as the group the mode. This can be achieved as follows:

    $ lsblk -m

![lsblk  permissions](http://linoxide.com/wp-content/uploads/2014/03/lsblk-permissions.png)

### List Specific Devices ###

It is possible also to get information about a specific device only. This can be achieved by specifying the device name after the option supplied to lsblk. For example you would be interested to know your hard drive size in bytes. You can accomplish this by running the command as follows:

    $ lsblk -b /dev/sda

or if you prefer:

    $ lsblk --bytes /dev/sda

### List Devices Without Header in List Form ###

You can also combine several options to get a specific output. For example you might want to list the devices in a list format instead of the default tree format. You may also be interested in removing the header with the name of the different columns. The two different options can be combined to achieve the desired output as follows:

    $ lsblk -nl

or still you can use the option which will give the same output.

    $ lsblk --noheadings --list

![lsblk no header and list](http://linoxide.com/wp-content/uploads/2014/03/lsblk-no-header-and-list.png)

### List SCSI Devices ###

To get a list of SCSI devices only you can use the option -S. This option is capital S and it should not be confused with the option -s which prints dependencies in inverse order.

    $ lsblk -S

lsblk SCSI devices On the contrary the inverse option will give output as follows: Type the command:

    $ lsblk -s

or

    $ lsblk --inverse

lsblk inverse You can use lsblk to get more information about your block devices, try it out today!

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-lsblk-command/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:ftp://ftp.kernel.org/pub/linux/utils/util-linux/