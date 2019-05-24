[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (12 Methods To Check The Hard Disk And Hard Drive Partition On Linux)
[#]: via: (https://www.2daygeek.com/linux-command-check-hard-disks-partitions/)
[#]: author: (Vinoth Kumar https://www.2daygeek.com/author/vinoth/)

12 Methods To Check The Hard Disk And Hard Drive Partition On Linux
======

Usually Linux admins check the available hard disk and it’s partitions whenever they want to add a new disks or additional partition in the system.

We used to check the partition table of our hard disk to view the disk partitions.

This will help you to view how many partitions were already created on the disk. Also, it allow us to verify whether we have any free space or not.

In general hard disks can be divided into one or more logical disks called partitions.

Each partitions can be used as a separate disk with its own file system and partition information is stored in a partition table.

It’s a 64-byte data structure. The partition table is part of the master boot record (MBR), which is a small program that is executed when a computer boots.

The partition information are saved in the 0 the sector of the disk. Make a note, all the partitions must be formatted with an appropriate file system before files can be written to it.

This can be verified using the following 12 methods.

  * **`fdisk:`** manipulate disk partition table
  * **`sfdisk:`** display or manipulate a disk partition table
  * **`cfdisk:`** display or manipulate a disk partition table
  * **`parted:`** a partition manipulation program
  * **`lsblk:`** lsblk lists information about all available or the specified block devices.
  * **`blkid:`** locate/print block device attributes.
  * **`hwinfo:`** hwinfo stands for hardware information tool is another great utility that used to probe for the hardware present in the system.
  * **`lshw:`** lshw is a small tool to extract detailed information on the hardware configuration of the machine.
  * **`inxi:`** inxi is a command line system information script built for for console and IRC.
  * **`lsscsi:`** list SCSI devices (or hosts) and their attributes
  * **`cat /proc/partitions:`**
  * **`ls -lh /dev/disk/:`** The directory contains Disk manufacturer name, serial number, partition ID and real block device files, Those were symlink with real block device files.



### How To Check Hard Disk And Hard Drive Partition In Linux Using fdisk Command?

**[fdisk][1]** stands for fixed disk or format disk is a cli utility that allow users to perform following actions on disks. It allows us to view, create, resize, delete, move and copy the partitions.

```
# fdisk -l

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
Disklabel type: dos
Disk identifier: 0x8cc8f9e5

Device Boot Start End Sectors Size Id Type
/dev/sdc1 2048 2099199 2097152 1G 83 Linux
/dev/sdc3 4196352 6293503 2097152 1G 83 Linux
/dev/sdc4 6293504 20971519 14678016 7G 5 Extended
/dev/sdc5 6295552 8392703 2097152 1G 83 Linux


Disk /dev/sdd: 10 GiB, 10737418240 bytes, 20971520 sectors
Units: sectors of 1 core.md Dict.md lctt2014.md lctt2016.md lctt2018.md LICENSE published README.md scripts sources translated 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/sde: 10 GiB, 10737418240 bytes, 20971520 sectors
Units: sectors of 1 core.md Dict.md lctt2014.md lctt2016.md lctt2018.md LICENSE published README.md scripts sources translated 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
```

### How To Check Hard Disk And Hard Drive Partition In Linux Using sfdisk Command?

sfdisk is a script-oriented tool for partitioning any block device. sfdisk supports MBR (DOS), GPT, SUN and SGI disk labels, but no longer provides any functionality for CHS (Cylinder-Head-Sector) addressing.

```
# sfdisk -l

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
Disklabel type: dos
Disk identifier: 0x8cc8f9e5

Device Boot Start End Sectors Size Id Type
/dev/sdc1 2048 2099199 2097152 1G 83 Linux
/dev/sdc3 4196352 6293503 2097152 1G 83 Linux
/dev/sdc4 6293504 20971519 14678016 7G 5 Extended
/dev/sdc5 6295552 8392703 2097152 1G 83 Linux


Disk /dev/sdd: 10 GiB, 10737418240 bytes, 20971520 sectors
Units: sectors of 1 core.md Dict.md lctt2014.md lctt2016.md lctt2018.md LICENSE published README.md scripts sources translated 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/sde: 10 GiB, 10737418240 bytes, 20971520 sectors
Units: sectors of 1 core.md Dict.md lctt2014.md lctt2016.md lctt2018.md LICENSE published README.md scripts sources translated 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
```

### How To Check Hard Disk And Hard Drive Partition In Linux Using cfdisk Command?

cfdisk is a curses-based program for partitioning any block device. The default device is /dev/sda. It provides basic partitioning functionality with a user-friendly interface.

```
# cfdisk /dev/sdc
 Disk: /dev/sdc
 Size: 10 GiB, 10737418240 bytes, 20971520 sectors
 Label: dos, identifier: 0x8cc8f9e5

 Device Boot Start End Sectors Size Id Type
>> /dev/sdc1 2048 2099199 2097152 1G 83 Linux
 Free space 2099200 4196351 2097152 1G
 /dev/sdc3 4196352 6293503 2097152 1G 83 Linux
 /dev/sdc4 6293504 20971519 14678016 7G 5 Extended
 ├─/dev/sdc5 6295552 8392703 2097152 1G 83 Linux
 └─Free space 8394752 20971519 12576768 6G



 ┌───────────────────────────────────────────────────────────────────────────────┐
 │ Partition type: Linux (83) │
 │Filesystem UUID: d17e3c31-e2c9-4f11-809c-94a549bc43b7 │
 │ Filesystem: ext2 │
 │ Mountpoint: /part1 (mounted) │
 └───────────────────────────────────────────────────────────────────────────────┘
 [Bootable] [ Delete ] [ Quit ] [ Type ] [ Help ] [ Write ]
 [ Dump ]

 Quit program without writing changes
```

### How To Check Hard Disk And Hard Drive Partition In Linux Using parted Command?

**[parted][2]** is a program to manipulate disk partitions. It supports multiple partition table formats, including MS-DOS and GPT. It is useful for creating space for new operating systems, reorganising disk usage, and copying data to new hard disks.

```
# parted -l

Model: ATA VBOX HARDDISK (scsi)
Disk /dev/sda: 32.2GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:

Number Start End Size Type File system Flags
 1 10.7GB 32.2GB 21.5GB primary ext4 boot


Model: ATA VBOX HARDDISK (scsi)
Disk /dev/sdb: 10.7GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:

Model: ATA VBOX HARDDISK (scsi)
Disk /dev/sdc: 10.7GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:

Number Start End Size Type File system Flags
 1 1049kB 1075MB 1074MB primary ext2
 3 2149MB 3222MB 1074MB primary ext4
 4 3222MB 10.7GB 7515MB extended
 5 3223MB 4297MB 1074MB logical


Model: ATA VBOX HARDDISK (scsi)
Disk /dev/sdd: 10.7GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:

Model: ATA VBOX HARDDISK (scsi)
Disk /dev/sde: 10.7GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:
```

### How To Check Hard Disk And Hard Drive Partition In Linux Using lsblk Command?

lsblk lists information about all available or the specified block devices. The lsblk command reads the sysfs filesystem and udev db to gather information.

If the udev db is not available or lsblk is compiled without udev support than it tries to read LABELs, UUIDs and filesystem types from the block device. In this case root permissions are necessary. The command prints all block devices (except RAM disks) in a tree-like format by default.

```
# lsblk
NAME MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
sda 8:0 0 30G 0 disk
└─sda1 8:1 0 20G 0 part /
sdb 8:16 0 10G 0 disk
sdc 8:32 0 10G 0 disk
├─sdc1 8:33 0 1G 0 part /part1
├─sdc3 8:35 0 1G 0 part /part2
├─sdc4 8:36 0 1K 0 part
└─sdc5 8:37 0 1G 0 part
sdd 8:48 0 10G 0 disk
sde 8:64 0 10G 0 disk
sr0 11:0 1 1024M 0 rom
```

### How To Check Hard Disk And Hard Drive Partition In Linux Using blkid Command?

blkid is a command-line utility to locate/print block device attributes. It uses libblkid library to get disk partition UUID in Linux system.

```
# blkid
/dev/sda1: UUID="d92fa769-e00f-4fd7-b6ed-ecf7224af7fa" TYPE="ext4" PARTUUID="eab59449-01"
/dev/sdc1: UUID="d17e3c31-e2c9-4f11-809c-94a549bc43b7" TYPE="ext2" PARTUUID="8cc8f9e5-01"
/dev/sdc3: UUID="ca307aa4-0866-49b1-8184-004025789e63" TYPE="ext4" PARTUUID="8cc8f9e5-03"
/dev/sdc5: PARTUUID="8cc8f9e5-05"
```

### How To Check Hard Disk And Hard Drive Partition In Linux Using hwinfo Command?

**[hwinfo][3]** stands for hardware information tool is another great utility that used to probe for the hardware present in the system and display detailed information about varies hardware components in human readable format.

```
# hwinfo --block --short
disk:
 /dev/sdd VBOX HARDDISK
 /dev/sdb VBOX HARDDISK
 /dev/sde VBOX HARDDISK
 /dev/sdc VBOX HARDDISK
 /dev/sda VBOX HARDDISK
partition:
 /dev/sdc1 Partition
 /dev/sdc3 Partition
 /dev/sdc4 Partition
 /dev/sdc5 Partition
 /dev/sda1 Partition
cdrom:
 /dev/sr0 VBOX CD-ROM
```

### How To Check Hard Disk And Hard Drive Partition In Linux Using lshw Command?

**[lshw][4]** (stands for Hardware Lister) is a small nifty tool that generates detailed reports about various hardware components on the machine such as memory configuration, firmware version, mainboard configuration, CPU version and speed, cache configuration, usb, network card, graphics cards, multimedia, printers, bus speed, etc.

```
# lshw -short -class disk -class volume
H/W path Device Class Description
===================================================
/0/3/0.0.0 /dev/cdrom disk CD-ROM
/0/4/0.0.0 /dev/sda disk 32GB VBOX HARDDISK
/0/4/0.0.0/1 /dev/sda1 volume 19GiB EXT4 volume
/0/5/0.0.0 /dev/sdb disk 10GB VBOX HARDDISK
/0/6/0.0.0 /dev/sdc disk 10GB VBOX HARDDISK
/0/6/0.0.0/1 /dev/sdc1 volume 1GiB Linux filesystem partition
/0/6/0.0.0/3 /dev/sdc3 volume 1GiB EXT4 volume
/0/6/0.0.0/4 /dev/sdc4 volume 7167MiB Extended partition
/0/6/0.0.0/4/5 /dev/sdc5 volume 1GiB Linux filesystem partition
/0/7/0.0.0 /dev/sdd disk 10GB VBOX HARDDISK
/0/8/0.0.0 /dev/sde disk 10GB VBOX HARDDISK
```

### How To Check Hard Disk And Hard Drive Partition In Linux Using inxi Command?

**[inxi][5]** is a nifty tool to check hardware information on Linux and offers wide range of option to get all the hardware information on Linux system that i never found in any other utility which are available in Linux. It was forked from the ancient and mindbendingly perverse yet ingenius infobash, by locsmif.

```
# inxi -Dp
Drives: HDD Total Size: 75.2GB (22.3% used)
 ID-1: /dev/sda model: VBOX_HARDDISK size: 32.2GB
 ID-2: /dev/sdb model: VBOX_HARDDISK size: 10.7GB
 ID-3: /dev/sdc model: VBOX_HARDDISK size: 10.7GB
 ID-4: /dev/sdd model: VBOX_HARDDISK size: 10.7GB
 ID-5: /dev/sde model: VBOX_HARDDISK size: 10.7GB
Partition: ID-1: / size: 20G used: 16G (85%) fs: ext4 dev: /dev/sda1
 ID-3: /part1 size: 1008M used: 1.3M (1%) fs: ext2 dev: /dev/sdc1
 ID-4: /part2 size: 976M used: 2.6M (1%) fs: ext4 dev: /dev/sdc3
```

### How To Check Hard Disk And Hard Drive Partition In Linux Using lsscsi Command?

Uses information in sysfs (Linux kernel series 2.6 and later) to list SCSI devices (or hosts) currently attached to the system. Options can be used to control the amount and form of information provided for each device.

By default in this utility device node names (e.g. “/dev/sda” or “/dev/root_disk”) are obtained by noting the major and minor numbers for the listed device obtained from sysfs

```
# lsscsi
[0:0:0:0] cd/dvd VBOX CD-ROM 1.0 /dev/sr0
[2:0:0:0] disk ATA VBOX HARDDISK 1.0 /dev/sda
[3:0:0:0] disk ATA VBOX HARDDISK 1.0 /dev/sdb
[4:0:0:0] disk ATA VBOX HARDDISK 1.0 /dev/sdc
[5:0:0:0] disk ATA VBOX HARDDISK 1.0 /dev/sdd
[6:0:0:0] disk ATA VBOX HARDDISK 1.0 /dev/sde
```

### How To Check Hard Disk And Hard Drive Partition In Linux Using ProcFS?

The proc filesystem (procfs) is a special filesystem in Unix-like operating systems that presents information about processes and other system information.

It’s sometimes referred to as a process information pseudo-file system. It doesn’t contain ‘real’ files but runtime system information (e.g. system memory, devices mounted, hardware configuration, etc).

```
# cat /proc/partitions
major minor #blocks name

 11 0 1048575 sr0
 8 0 31457280 sda
 8 1 20970496 sda1
 8 16 10485760 sdb
 8 32 10485760 sdc
 8 33 1048576 sdc1
 8 35 1048576 sdc3
 8 36 1 sdc4
 8 37 1048576 sdc5
 8 48 10485760 sdd
 8 64 10485760 sde
```

### How To Check Hard Disk And Hard Drive Partition In Linux Using /dev/disk Path?

This directory contains four directories, it’s by-id, by-uuid, by-path and by-partuuid. Each directory contains some useful information and it’s symlinked with real block device files.

```
# ls -lh /dev/disk/by-id
total 0
lrwxrwxrwx 1 root root 9 Feb 2 23:08 ata-VBOX_CD-ROM_VB0-01f003f6 -> ../../sr0
lrwxrwxrwx 1 root root 9 Feb 3 00:14 ata-VBOX_HARDDISK_VB26e827b5-668ab9f4 -> ../../sda
lrwxrwxrwx 1 root root 10 Feb 3 00:14 ata-VBOX_HARDDISK_VB26e827b5-668ab9f4-part1 -> ../../sda1
lrwxrwxrwx 1 root root 9 Feb 2 23:39 ata-VBOX_HARDDISK_VB3774c742-fb2b3e4e -> ../../sdd
lrwxrwxrwx 1 root root 9 Feb 2 23:39 ata-VBOX_HARDDISK_VBe72672e5-029a918e -> ../../sdc
lrwxrwxrwx 1 root root 10 Feb 2 23:39 ata-VBOX_HARDDISK_VBe72672e5-029a918e-part1 -> ../../sdc1
lrwxrwxrwx 1 root root 10 Feb 2 23:39 ata-VBOX_HARDDISK_VBe72672e5-029a918e-part3 -> ../../sdc3
lrwxrwxrwx 1 root root 10 Feb 2 23:39 ata-VBOX_HARDDISK_VBe72672e5-029a918e-part4 -> ../../sdc4
lrwxrwxrwx 1 root root 10 Feb 2 23:39 ata-VBOX_HARDDISK_VBe72672e5-029a918e-part5 -> ../../sdc5
lrwxrwxrwx 1 root root 9 Feb 2 23:39 ata-VBOX_HARDDISK_VBed1cf451-9f51c5f6 -> ../../sdb
lrwxrwxrwx 1 root root 9 Feb 2 23:39 ata-VBOX_HARDDISK_VBf242dbdd-49a982eb -> ../../sde
```

Output of by-uuid

```
# ls -lh /dev/disk/by-uuid
total 0
lrwxrwxrwx 1 root root 10 Feb 2 23:39 ca307aa4-0866-49b1-8184-004025789e63 -> ../../sdc3
lrwxrwxrwx 1 root root 10 Feb 2 23:39 d17e3c31-e2c9-4f11-809c-94a549bc43b7 -> ../../sdc1
lrwxrwxrwx 1 root root 10 Feb 3 00:14 d92fa769-e00f-4fd7-b6ed-ecf7224af7fa -> ../../sda1
```

Output of by-path

```
# ls -lh /dev/disk/by-path
total 0
lrwxrwxrwx 1 root root 9 Feb 2 23:08 pci-0000:00:01.1-ata-1 -> ../../sr0
lrwxrwxrwx 1 root root 9 Feb 3 00:14 pci-0000:00:0d.0-ata-1 -> ../../sda
lrwxrwxrwx 1 root root 10 Feb 3 00:14 pci-0000:00:0d.0-ata-1-part1 -> ../../sda1
lrwxrwxrwx 1 root root 9 Feb 2 23:39 pci-0000:00:0d.0-ata-2 -> ../../sdb
lrwxrwxrwx 1 root root 9 Feb 2 23:39 pci-0000:00:0d.0-ata-3 -> ../../sdc
lrwxrwxrwx 1 root root 10 Feb 2 23:39 pci-0000:00:0d.0-ata-3-part1 -> ../../sdc1
lrwxrwxrwx 1 root root 10 Feb 2 23:39 pci-0000:00:0d.0-ata-3-part3 -> ../../sdc3
lrwxrwxrwx 1 root root 10 Feb 2 23:39 pci-0000:00:0d.0-ata-3-part4 -> ../../sdc4
lrwxrwxrwx 1 root root 10 Feb 2 23:39 pci-0000:00:0d.0-ata-3-part5 -> ../../sdc5
lrwxrwxrwx 1 root root 9 Feb 2 23:39 pci-0000:00:0d.0-ata-4 -> ../../sdd
lrwxrwxrwx 1 root root 9 Feb 2 23:39 pci-0000:00:0d.0-ata-5 -> ../../sde
```

Output of by-partuuid

```
# ls -lh /dev/disk/by-partuuid
total 0
lrwxrwxrwx 1 root root 10 Feb 2 23:39 8cc8f9e5-01 -> ../../sdc1
lrwxrwxrwx 1 root root 10 Feb 2 23:39 8cc8f9e5-03 -> ../../sdc3
lrwxrwxrwx 1 root root 10 Feb 2 23:39 8cc8f9e5-04 -> ../../sdc4
lrwxrwxrwx 1 root root 10 Feb 2 23:39 8cc8f9e5-05 -> ../../sdc5
lrwxrwxrwx 1 root root 10 Feb 3 00:14 eab59449-01 -> ../../sda1
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-command-check-hard-disks-partitions/

作者：[Vinoth Kumar][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/vinoth/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-fdisk-command-to-manage-disk-partitions/
[2]: https://www.2daygeek.com/how-to-manage-disk-partitions-using-parted-command/
[3]: https://www.2daygeek.com/hwinfo-check-display-detect-system-hardware-information-linux/
[4]: https://www.2daygeek.com/lshw-find-check-system-hardware-information-details-linux/
[5]: https://www.2daygeek.com/inxi-system-hardware-information-on-linux/
