How to partition a disk in Linux
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus-storage.png?itok=95-zvHYl)

Creating and deleting partitions in Linux is a regular practice because storage devices (such as hard drives and USB drives) must be structured in some way before they can be used. In most cases, large storage devices are divided into separate sections called partitions. Partitioning also allows you to divide your hard drive into isolated sections, where each section behaves as its own hard drive. Partitioning is particularly useful if you run multiple operating systems.

There are lots of powerful tools for creating, removing, and otherwise manipulating disk partitions in Linux. In this article, I'll explain how to use the `parted` command, which is particularly useful with large disk devices and many disk partitions. Differences between `parted` and the more common `fdisk` and `cfdisk` commands include:

  * **GPT format:** The `parted` command can create a Globally Unique Identifiers Partition Table [GPT][1]), while `fdisk` and `cfdisk` are limited to DOS partition tables.
  * **Larger disks:** A DOS partition table can format up to 2TB of disk space, although up to 16TB is possible in some cases. However, a GPT partition table can address up to 8ZiB of space.
  * **More partitions:** Using primary and extended partitions, DOS partition tables allow only 16 partitions. With GPT, you get up to 128 partitions by default and can choose to have many more.
  * **Reliability:** Only one copy of the partition table is stored in a DOS partition. GPT keeps two copies of the partition table (at the beginning and the end of the disk). The GPT also uses a [CRC][2] checksum to check the partition table integrity, which is not done with DOS partitions.



With today's larger disks and the need for more flexibility in working with them, using `parted` to work with disk partitions is recommended. Most of the time, disk partition tables are created as part of the operating system installation process. Direct use of the `parted` command is most useful when adding a storage device to an existing system.

### Give 'parted' a try

`parted` command. To try these steps, I strongly recommend using a brand new storage device or one where you don't mind wiping out the contents.

The following explains the process of partitioning a storage device with thecommand. To try these steps, I strongly recommend using a brand new storage device or one where you don't mind wiping out the contents.

**1\. List the partitions:** Use `parted -l` to identify the storage device you want to partition. Typically, the first hard disk (`/dev/sda` or `/dev/vda`) will contain the operating system, so look for another disk to find the one you want (e.g., `/dev/sdb`, `/dev/sdc`, `/dev/vdb`, `/dev/vdc`, etc.).
```
$ sudo parted -l

[sudo] password for daniel:

Model: ATA RevuAhn_850X1TU5 (scsi)

Disk /dev/vdc: 512GB

Sector size (logical/physical): 512B/512B

Partition Table: msdos

Disk Flags:



Number  Start   End    Size   Type     File system  Flags

 1      1049kB  525MB  524MB  primary  ext4         boot

 2      525MB   512GB  512GB  primary               lvm

```

**2\. Open the storage device:** Use `parted` to begin working with the selected storage device. In this example, the device is the third disk on a virtual system (`/dev/vdc`). It is important to indicate the specific device you want to use. If you just type `parted` with no device name, it will randomly select a storage device to modify.
```
$ sudo parted /dev/vdc

GNU Parted 3.2

Using /dev/vdc

Welcome to GNU Parted! Type 'help' to view a list of commands.

(parted)

```

**3\. Set the partition table:** Set the partition table type to GPT, then type  "Yes" to accept it.
```
(parted) mklabel gpt

Warning: the existing disk label on /dev/vdc will be destroyed

and all data on this disk will be lost. Do you want to continue?

Yes/No? Yes

```

The `mklabel` and `mktable` commands are used for the same purpose (making a partition table on a storage device). The supported partition tables are: aix, amiga, bsd, dvh, gpt, mac, ms-dos, pc98, sun, and loop. Remember `mklabel` will not make a partition, rather it will make a partition table.

**4\. Review the partition table:** Show information about the storage device.
```
(parted) print

Model: Virtio Block Device (virtblk)

Disk /dev/vdc: 1396MB

Sector size (logical/physical): 512B/512B

Partition Table: gpt

Disk Flags:

Number Start End Size File system Name Flags

```

**5\. Get help:** To find out how to make a new partition, type: `(parted) help mkpart`.
```
(parted) help mkpart

  mkpart PART-TYPE [FS-TYPE] START END     make a partition



        PART-TYPE is one of: primary, logical, extended

        FS-TYPE is one of: btrfs, nilfs2, ext4, ext3, ext2, fat32, fat16, hfsx, hfs+, hfs, jfs, swsusp,

        linux-swap(v1), linux-swap(v0), ntfs, reiserfs, hp-ufs, sun-ufs, xfs, apfs2, apfs1, asfs, amufs5,

        amufs4, amufs3, amufs2, amufs1, amufs0, amufs, affs7, affs6, affs5, affs4, affs3, affs2, affs1,

        affs0, linux-swap, linux-swap(new), linux-swap(old)

        START and END are disk locations, such as 4GB or 10%.  Negative values count from the end of the

        disk.  For example, -1s specifies exactly the last sector.

       

        'mkpart' makes a partition without creating a new file system on the partition.  FS-TYPE may be

        specified to set an appropriate partition ID.

```

**6\. Make a partition:** To make a new partition (in this example, 1,396MB on partition 0), type the following:
```
(parted) mkpart primary 0 1396MB



Warning: The resulting partition is not properly aligned for best performance

Ignore/Cancel? I



(parted) print

Model: Virtio Block Device (virtblk)

Disk /dev/vdc: 1396MB

Sector size (logical/physical): 512B/512B

Partition Table: gpt

Disk Flags:

Number Start   End     Size    File system Name Flags

1      17.4kB  1396MB  1396MB  primary

```

Filesystem type (fstype) will not create an ext4 filesystem on `/dev/vdc1`. A DOS partition table's partition types are primary, logical, and extended. In a GPT partition table, the partition type is used as the partition name. Providing a partition name under GPT is a must; in the above example, primary is the name, not the partition type.

**7\. Save and quit:** Changes are automatically saved when you quit `parted`. To quit, type the following:
```
(parted) quit

Information: You may need to update /etc/fstab.

$

```

### Words to the wise

Make sure to identify the correct disk before you begin changing its partition table when you add a new storage device. If you mistakenly change the disk partition that contains your computer's operating system, you could make your system unbootable.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/how-partition-disk-linux

作者：[Daniel Oh][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/daniel-oh
[1]:https://en.wikipedia.org/wiki/GUID_Partition_Table
[2]:https://en.wikipedia.org/wiki/Cyclic_redundancy_check
