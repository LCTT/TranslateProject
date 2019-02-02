[#]: collector: (lujun9972)
[#]: translator: ( dianbanjiu )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (fdisk – Easy Way To Manage Disk Partitions In Linux)
[#]: via: (https://www.2daygeek.com/linux-fdisk-command-to-manage-disk-partitions/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

fdisk – Easy Way To Manage Disk Partitions In Linux
======

Hard disks can be divided into one or more logical disks called partitions.

This division is described in the partition table (MBR or GPT) found in sector 0 of the disk.

Linux needs at least one partition, namely for its root file system and we can’t install Linux OS without partitions.

Once created, a partition must be formatted with an appropriate file system before files can be written to it.

To do so, we need some utility to perform this in Linux.

There are many utilities are available for that in Linux. We had written about **[Parted Command][1]** in the past and today we are going to discuss about fdisk.

fdisk command is one of the the best tool to manage disk partitions in Linux.

It supports maximum `2 TB`, and everyone prefer to go with fdisk.

This tool is used by vast of Linux admin because we don’t use more than 2TB now a days due to LVM and SAN. It’s used in most of the infra structure around the world.

Still if you want to create a large partitions, like more than 2TB then you have to go either **Parted Command** or **cfdisk Command**.

Disk partition and file system creations is one of the routine task for Linux admin.

If you are working on vast environment then you have to perform this task multiple times in a day.

### How Linux Kernel Understand Hard Disks?

As a human we can easily understand things but computer needs the proper naming conversion to understand each and everything.

In Linux, devices are located on `/dev` partition and Kernel understand the hard disk in the following format.

  * **`/dev/hdX[a-z]:`** IDE Disk is named hdX in Linux
  * **`/dev/sdX[a-z]:`** SCSI Disk is named sdX in Linux
  * **`/dev/xdX[a-z]:`** XT Disk is named sdX in Linux
  * **`/dev/vdX[a-z]:`** Virtual Hard Disk is named vdX in Linux
  * **`/dev/fdN:`** Floppy Drive is named fdN in Linux
  * **`/dev/scdN or /dev/srN:`** CD-ROM is named /dev/scdN or /dev/srN in Linux



### What Is fdisk Command?

fdisk stands for fixed disk or format disk is a cli utility that allow users to perform following actions on disks. It allows us to view, create, resize, delete, move and copy the partitions.

It understands MBR, Sun, SGI and BSD partition tables and it doesn’t understand GUID Partition Table (GPT) and it is not designed for large partitions.

fdisk allows us to create a maximum of four primary partitions per disk. One of these may be an extended partition and it holds multiple logical partitions.

1-4 is reserved for four primary partitions and Logical partitions start numbering from 5.
![][3]

### How To Install fdisk On Linux

You don’t need to install fdisk in Linux system because it has installed by default as part of core utility.

### How To List Available Disks Using fdisk Command

First we have to know what are the disks were added in the system before performing any action. To list all available disks on your system run the following command.

It lists possible information about the disks such as disk name, how many partitions are created in it, Disk Size, Disklabel type, Disk Identifier, Partition ID and Partition Type.

```
$ sudo fdisk -l
Disk /dev/sda: 30 GiB, 32212254720 bytes, 62914560 sectors
Units: sectors of 1 core.md Dict.md lctt2014.md lctt2016.md lctt2018.md LICENSE published README.md scripts sources translated 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0xeab59449

Device Boot Start End Sectors Size Id Type
/dev/sda1 core.md Dict.md lctt2014.md lctt2016.md lctt2018.md LICENSE published README.md scripts sources translated 20973568 62914559 41940992 20G 83 Linux


Disk /dev/sdb: 10 GiB, 10737418240 bytes, 20971520 sectors
Units: sectors of 1 core.md Dict.md lctt2014.md lctt2016.md lctt2018.md LICENSE published README.md scripts sources translated 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/sdc: 10 GiB, 10737418240 bytes, 20971520 sectors
Units: sectors of 1 core.md Dict.md lctt2014.md lctt2016.md lctt2018.md LICENSE published README.md scripts sources translated 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/sdd: 10 GiB, 10737418240 bytes, 20971520 sectors
Units: sectors of 1 core.md Dict.md lctt2014.md lctt2016.md lctt2018.md LICENSE published README.md scripts sources translated 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/sde: 10 GiB, 10737418240 bytes, 20971520 sectors
Units: sectors of 1 core.md Dict.md lctt2014.md lctt2016.md lctt2018.md LICENSE published README.md scripts sources translated 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
```

### How To List A Specific Disk Partitions Using fdisk Command

If you would like to see a specific disk and it’s partitions, use the following format.

```
$ sudo fdisk -l /dev/sda
Disk /dev/sda: 30 GiB, 32212254720 bytes, 62914560 sectors
Units: sectors of 1 core.md Dict.md lctt2014.md lctt2016.md lctt2018.md LICENSE published README.md scripts sources translated 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0xeab59449

Device Boot Start End Sectors Size Id Type
/dev/sda1 core.md Dict.md lctt2014.md lctt2016.md lctt2018.md LICENSE published README.md scripts sources translated 20973568 62914559 41940992 20G 83 Linux
```

### How To List Available Actions For fdisk Command

When you hit `m` in the fdisk command that will show you available actions for fdisk command.

```
$ sudo fdisk /dev/sdc

Welcome to fdisk (util-linux 2.30.1).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

Device does not contain a recognized partition table.
Created a new DOS disklabel with disk identifier 0xe944b373.

Command (m for help): m

Help:

 DOS (MBR)
 a toggle a bootable flag
 b edit nested BSD disklabel
 c toggle the dos compatibility flag

 Generic
 d delete a partition
 F list free unpartitioned space
 l list known partition types
 n add a new partition
 p print the partition table
 t change a partition type
 v verify the partition table
 i print information about a partition

 Misc
 m print this menu
 u change display/entry units
 x extra functionality (experts only)

 Script
 I load disk layout from sfdisk script file
 O dump disk layout to sfdisk script file

 Save & Exit
 w write table to disk and exit
 q quit without saving changes

 Create a new label
 g create a new empty GPT partition table
 G create a new empty SGI (IRIX) partition table
 o create a new empty DOS partition table
 s create a new empty Sun partition table
```

### How To List Partitions Types Using fdisk Command

When you hit `l` in the fdisk command that will show you an available partitions type for fdisk command.

```
$ sudo fdisk /dev/sdc

Welcome to fdisk (util-linux 2.30.1).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

Device does not contain a recognized partition table.
Created a new DOS disklabel with disk identifier 0x9ffd00db.

Command (m for help): l

 0 Empty 24 NEC DOS 81 Minix / old Lin bf Solaris
 1 FAT12 27 Hidden NTFS Win 82 Linux swap / So c1 DRDOS/sec (FAT-
 2 XENIX root 39 Plan 9 83 Linux c4 DRDOS/sec (FAT-
 3 XENIX usr 3c PartitionMagic 84 OS/2 hidden or c6 DRDOS/sec (FAT-
 4 FAT16 <32M 40 Venix 80286 85 Linux extended c7 Syrinx
 5 Extended 41 PPC PReP Boot 86 NTFS volume set da Non-FS data
 6 FAT16 42 SFS 87 NTFS volume set db CP/M / CTOS / .
 7 HPFS/NTFS/exFAT 4d QNX4.x 88 Linux plaintext de Dell Utility
 8 AIX 4e QNX4.x 2nd part 8e Linux LVM df BootIt
 9 AIX bootable 4f QNX4.x 3rd part 93 Amoeba e1 DOS access
 a OS/2 Boot Manag 50 OnTrack DM 94 Amoeba BBT e3 DOS R/O
 b W95 FAT32 51 OnTrack DM6 Aux 9f BSD/OS e4 SpeedStor
 c W95 FAT32 (LBA) 52 CP/M a0 IBM Thinkpad hi ea Rufus alignment
 e W95 FAT16 (LBA) 53 OnTrack DM6 Aux a5 FreeBSD eb BeOS fs
 f W95 Ext'd (LBA) 54 OnTrackDM6 a6 OpenBSD ee GPT
10 OPUS 55 EZ-Drive a7 NeXTSTEP ef EFI (FAT-12/16/
11 Hidden FAT12 56 Golden Bow a8 Darwin UFS f0 Linux/PA-RISC b
12 Compaq diagnost 5c Priam Edisk a9 NetBSD f1 SpeedStor
14 Hidden FAT16 <3 61 SpeedStor ab Darwin boot f4 SpeedStor
16 Hidden FAT16 63 GNU HURD or Sys af HFS / HFS+ f2 DOS secondary
17 Hidden HPFS/NTF 64 Novell Netware b7 BSDI fs fb VMware VMFS
18 AST SmartSleep 65 Novell Netware b8 BSDI swap fc VMware VMKCORE
1b Hidden W95 FAT3 70 DiskSecure Mult bb Boot Wizard hid fd Linux raid auto
1c Hidden W95 FAT3 75 PC/IX bc Acronis FAT32 L fe LANstep
1e Hidden W95 FAT1 80 Old Minix be Solaris boot ff BBT
```

### How To Create A Disk Partition Using fdisk Command

If you would like to create a new partition use the following steps. In my case, i'm going to create 4 partitions (3 Primary and 1 Extended) on `/dev/sdc` disk. To the same for other partitions too.

As this takes value from partition table so, hit `Enter` for first sector. Enter the size which you want to set for the partition (We can add a partition size using KB,MB,G and TB) for last sector.

For example, if you would like to add 1GB partition then the last sector value should be `+1G`. Once you have created 3 partitions, it will automatically change the partition type to extended as a default. If you still want to create a fourth primary partitions then hit `p` instead of default value `e`.

```
$ sudo fdisk /dev/sdc

Welcome to fdisk (util-linux 2.30.1).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.


Command (m for help): n
Partition type
 p primary (0 primary, 0 extended, 4 free)
 e extended (container for logical partitions)
Select (default p): Enter

Using default response p.
Partition number (1-4, default 1): Enter
First sector (2048-20971519, default 2048): Enter
Last sector, +sectors or +size{K,M,G,T,P} (2048-20971519, default 20971519): +1G

Created a new partition 1 of type 'Linux' and of size 1 GiB.

Command (m for help): p
Disk /dev/sdc: 10 GiB, 10737418240 bytes, 20971520 sectors
Units: sectors of 1 core.md Dict.md lctt2014.md lctt2016.md lctt2018.md LICENSE published README.md scripts sources translated 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x8cc8f9e5

Device Boot Start End Sectors Size Id Type
/dev/sdc1 2048 2099199 2097152 1G 83 Linux

Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.
```

### How To Create A Extended Disk Partition Using fdisk Command

Make a note, you have to use remaining all space when you create a extended partition because again you can able to create multiple logical partition in that.

```
$ sudo fdisk /dev/sdc

Welcome to fdisk (util-linux 2.30.1).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.


Command (m for help): n
Partition type
 p primary (3 primary, 0 extended, 1 free)
 e extended (container for logical partitions)
Select (default e): Enter

Using default response e.
Selected partition 4
First sector (6293504-20971519, default 6293504): Enter
Last sector, +sectors or +size{K,M,G,T,P} (6293504-20971519, default 20971519): Enter

Created a new partition 4 of type 'Extended' and of size 7 GiB.

Command (m for help): p
Disk /dev/sdc: 10 GiB, 10737418240 bytes, 20971520 sectors
Units: sectors of 1 core.md Dict.md lctt2014.md lctt2016.md lctt2018.md LICENSE published README.md scripts sources translated 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x8cc8f9e5

Device Boot Start End Sectors Size Id Type
/dev/sdc1 2048 2099199 2097152 1G 83 Linux
/dev/sdc2 2099200 4196351 2097152 1G 83 Linux
/dev/sdc3 4196352 6293503 2097152 1G 83 Linux
/dev/sdc4 6293504 20971519 14678016 7G 5 Extended

Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.
```

### How To View Unpartitioned Disk Space Using fdisk Command

As described in the above section, we have totally created 4 partitions (3 Primary and 1 Extended). Extended partition disk space will show unpartitioned until you create a logical partitions in that.

Use the following command to view the unpartitioned space for a disk. As per the below output we have `7GB` unpartitioned disk.

```
$ sudo fdisk /dev/sdc

Welcome to fdisk (util-linux 2.30.1).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.


Command (m for help): F
Unpartitioned space /dev/sdc: 7 GiB, 7515144192 bytes, 14678016 sectors
Units: sectors of 1 core.md Dict.md lctt2014.md lctt2016.md lctt2018.md LICENSE published README.md scripts sources translated 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes

 Start End Sectors Size
6293504 20971519 14678016 7G

Command (m for help): q
```

### How To Create A Logical Partition Using fdisk Command

Follow the same above procedure to create a logical partition once you have created the extended partition.
Here, i have created `1GB` of logical partition called `/dev/sdc5`, you can double confirm this by checking the partition table value.

```
$ sudo fdisk /dev/sdc

Welcome to fdisk (util-linux 2.30.1).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

Command (m for help): n
All primary partitions are in use.
Adding logical partition 5
First sector (6295552-20971519, default 6295552): Enter
Last sector, +sectors or +size{K,M,G,T,P} (6295552-20971519, default 20971519): +1G

Created a new partition 5 of type 'Linux' and of size 1 GiB.

Command (m for help): p
Disk /dev/sdc: 10 GiB, 10737418240 bytes, 20971520 sectors
Units: sectors of 1 core.md Dict.md lctt2014.md lctt2016.md lctt2018.md LICENSE published README.md scripts sources translated 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x8cc8f9e5

Device Boot Start End Sectors Size Id Type
/dev/sdc1 2048 2099199 2097152 1G 83 Linux
/dev/sdc2 2099200 4196351 2097152 1G 83 Linux
/dev/sdc3 4196352 6293503 2097152 1G 83 Linux
/dev/sdc4 6293504 20971519 14678016 7G 5 Extended
/dev/sdc5 6295552 8392703 2097152 1G 83 Linux

Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.
```

### How To Delete A Partition Using fdisk Command

If the partition is no more used in the system than we can remove it by using the below steps.

Make sure you have to enter the correct partition number to delete it. In this case, i'm going to remove `/dev/sdc2` partition.

```
$ sudo fdisk /dev/sdc

Welcome to fdisk (util-linux 2.30.1).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.


Command (m for help): d
Partition number (1-5, default 5): 2

Partition 2 has been deleted.

Command (m for help): p
Disk /dev/sdc: 10 GiB, 10737418240 bytes, 20971520 sectors
Units: sectors of 1 core.md Dict.md lctt2014.md lctt2016.md lctt2018.md LICENSE published README.md scripts sources translated 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x8cc8f9e5

Device Boot Start End Sectors Size Id Type
/dev/sdc1 2048 2099199 2097152 1G 83 Linux
/dev/sdc3 4196352 6293503 2097152 1G 83 Linux
/dev/sdc4 6293504 20971519 14678016 7G 5 Extended
/dev/sdc5 6295552 8392703 2097152 1G 83 Linux

Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.
```

### How To Format A Partition Or Create A FileSystem On The Partition

In computing, a file system or filesystem controls how data is stored and retrieved through inode tables.

Without a file system, the system can't find where the information is stored on the partition. Filesystem can be created in three ways. Here, i'm going to create a filesystem on `/dev/sdc1` partition.

```
$ sudo mkfs.ext4 /dev/sdc1
or
$ sudo mkfs -t ext4 /dev/sdc1
or
$ sudo mke2fs /dev/sdc1

mke2fs 1.43.5 (04-Aug-2017)
Creating filesystem with 262144 4k blocks and 65536 inodes
Filesystem UUID: c0a99b51-2b61-4f6a-b960-eb60915faab0
Superblock backups stored on blocks:
    32768, 98304, 163840, 229376

Allocating group tables: done
Writing inode tables: done
Creating journal (8192 blocks): done
Writing superblocks and filesystem accounting information: done
```

When you creating a filesystem on tha partition that will create the following important things on it.

  * **`Filesystem UUID:`** UUID stands for Universally Unique Identifier, UUIDs are used to identify block devices in Linux. It's 128 bit long numbers represented by 32 hexadecimal digits.
  * **`Superblock:`** Superblock stores metadata of the file system. If the superblock of a file system is corrupted, then the filesystem cannot be mounted and thus files cannot be accessed.
  * **`Inode:`** An inode is a data structure on a filesystem on a Unix-like operating system that stores all the information about a file except its name and its actual data.
  * **`Journal:`** A journaling filesystem is a filesystem that maintains a special file called a journal that is used to repair any inconsistencies that occur as the result of an improper shutdown of a computer.



### How To Mount A Partition In Linux

Once you have created the partition and filesystem then we need to mount the partition to use.

To do so, we need to create a mountpoint to mount the partition. Use mkdir command to create a mountpoint.

```
$ sudo mkdir -p /mnt/2g-new
```

For temporary mount, use the following command. You will be lose this mountpoint after rebooting your system.

```
$ sudo mount /dev/sdc1 /mnt/2g-new
```

For permanent mount, add the partition details in the fstab file. It can be done in two ways either adding device name or UUID value.

Permanent mount using Device Name:

```
# vi /etc/fstab

/dev/sdc1 /mnt/2g-new ext4 defaults 0 0
```

Permanent mount using UUID Value. To get a UUID of the partition use blkid command.

```
$ sudo blkid
/dev/sdc1: UUID="d17e3c31-e2c9-4f11-809c-94a549bc43b7" TYPE="ext2" PARTUUID="8cc8f9e5-01"
/dev/sda1: UUID="d92fa769-e00f-4fd7-b6ed-ecf7224af7fa" TYPE="ext4" PARTUUID="eab59449-01"
/dev/sdc3: UUID="ca307aa4-0866-49b1-8184-004025789e63" TYPE="ext4" PARTUUID="8cc8f9e5-03"
/dev/sdc5: PARTUUID="8cc8f9e5-05"

# vi /etc/fstab

UUID=d17e3c31-e2c9-4f11-809c-94a549bc43b7 /mnt/2g-new ext4 defaults 0 0
```

The same has been verified using df Command.

```
$ df -h
Filesystem Size Used Avail Use% Mounted on
udev 969M 0 969M 0% /dev
tmpfs 200M 7.0M 193M 4% /run
/dev/sda1 20G 16G 3.0G 85% /
tmpfs 997M 0 997M 0% /dev/shm
tmpfs 5.0M 4.0K 5.0M 1% /run/lock
tmpfs 997M 0 997M 0% /sys/fs/cgroup
tmpfs 200M 28K 200M 1% /run/user/121
tmpfs 200M 25M 176M 13% /run/user/1000
/dev/sdc1 1008M 1.3M 956M 1% /mnt/2g-new
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-fdisk-command-to-manage-disk-partitions/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/how-to-manage-disk-partitions-using-parted-command/
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: https://www.2daygeek.com/wp-content/uploads/2019/01/linux-fdisk-command-to-manage-disk-partitions-1a.png
