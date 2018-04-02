How To Manage Disk Partitions Using Parted Command
======
Translating by zyk2290

We all knows disk partitions is one of the important task for Linux administrator. They can not survive without knowing this.

In worst cases, at least once in a week they would get this request from dependent team but in big environment admins used to get this request very often.

You may ask why we need to use parted instead of fdisk? What is the difference? It’s a good question, i will give you more details about this.

  * Parted allow users to create a partition when the disk size is larger than 2TB but fdisk doesn’t allow.
  * Parted is a higher-level tool than fdisk.
  * It supports multiple partition table which includes GPT.
  * It allows users to resize the partition but while shrinking the partition it does not worked as expected and i got error most of the time so, i would advise users to do not shrink the partition.



### What Is Parted

Parted is a program to manipulate disk partitions. It supports multiple partition table formats, including MS-DOS and GPT.

It allows user to create, delete, resize, shrink, move and copy partitions, reorganizing disk usage, and copying data to new hard disks. GParted is a GUI frontend of parted.

### How To Install Parted

Parted package is pre-installed on most of the Linux distribution. If not, use the following commands to install parted package.

For **`Debian/Ubuntu`** , use [APT-GET Command][1] or [APT Command][2] to install parted.
```
$ sudo apt install parted

```

For **`RHEL/CentOS`** , use [YUM Command][3] to install parted.
```
$ sudo yum install parted

```

For **`Fedora`** , use [DNF Command][4] to install parted.
```
$ sudo dnf install parted

```

For **`Arch Linux`** , use [Pacman Command][5] to install parted.
```
$ sudo pacman -S parted

```

For **`openSUSE`** , use [Zypper Command][6] to install parted.
```
$ sudo zypper in parted

```

### How To Launch Parted

The below parted command picks the `/dev/sda` disk automatically, because this is the first hard drive in this system.
```
$ sudo parted
GNU Parted 3.2
Using /dev/sda
Welcome to GNU Parted! Type 'help' to view a list of commands.
(parted)

```

Also we can go to the corresponding disk by selecting the appropriate disk using below command.
```
(parted) select /dev/sdb
Using /dev/sdb
(parted)

```

If you wants to go to particular disk, use the following format. In our case we are going to use `/dev/sdb`.
```
$ sudo parted [Device Name]

$ sudo parted /dev/sdb
GNU Parted 3.2
Using /dev/sdb
Welcome to GNU Parted! Type 'help' to view a list of commands.
(parted)

```

### How To List Available Disks Using Parted Command

If you don’t know what are the disks are added in your system. Just run the following command, which will display all the available disks name, and other useful information such as Disk Size, Model, Sector Size, Partition Table, Disk Flags, and partition information.
```
$ sudo parted -l
Model: ATA VBOX HARDDISK (scsi)
Disk /dev/sda: 32.2GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:

Number Start End Size Type File system Flags
 1 1049kB 32.2GB 32.2GB primary ext4 boot


Error: /dev/sdb: unrecognised disk label
Model: ATA VBOX HARDDISK (scsi)
Disk /dev/sdb: 53.7GB
Sector size (logical/physical): 512B/512B
Partition Table: unknown
Disk Flags:

```

The above error message clearly shows there is no valid disk label for the disk `/dev/sdb`. Hence, we have to set `disk label` first as it doesn’t take any label automatically.

### How To Create Disk Partition Using Parted Command

Parted allows us to create primary or extended partition. Procedure is same for both but make sure you have to pass an appropriate partition type like `primary` or `extended` while creating the partition.

To perform this activity, we have added a new `50GB` hard disk in the system, which falls under `/dev/sdb`.

In two ways we can create a partition, one is detailed way and other one is single command. In the below example we are going to add one primary partition in detailed way. Make a note, we should set `disk label` first as it doesn’t take any label automatically.

We are going to create a new partition with `10GB` of disk in the below example.
```
$ sudo parted /dev/sdb
GNU Parted 3.2
Using /dev/sdb
Welcome to GNU Parted! Type 'help' to view a list of commands.
(parted) mklabel msdos
(parted) unit GB
(parted) mkpart
Partition type? primary/extended? primary
File system type? [ext2]? ext4
Start? 0.00GB
End? 10.00GB
(parted) print
Model: ATA VBOX HARDDISK (scsi)
Disk /dev/sdb: 53.7GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:

Number Start End Size Type File system Flags
 1 0.00GB 10.0GB 10.0GB primary ext4 lba

(parted) quit
Information: You may need to update /etc/fstab.

```

Alternatively we can create a new partition using single parted command.

We are going to create second partition with `10GB` of disk in the below example.
```
$ sudo parted [Disk Name] [mkpart] [Partition Type] [Filesystem Type] [Partition Start Size] [Partition End Size]

$ sudo parted /dev/sdb mkpart primary ext4 10.0GB 20.0GB
Information: You may need to update /etc/fstab.

```

### How To Create A Partition With All Remaining Space

You have created all required partitions except `/home` and you wants to use all the remaining space to `/home` partition, how to do that? use the following command to create a partition.

The below command create a new partition with 33.7GB, which starts from `20GB` and ends with `53GB`. `100%` end size will allow users to create a new partition with remaining all available space in the disk.
```
$ sudo parted [Disk Name] [mkpart] [Partition Type] [Filesystem Type] [Partition Start Size] [Partition End Size]

$ sudo parted /dev/sdb mkpart primary ext4 20.0GB 100%
Information: You may need to update /etc/fstab.

```

### How To List All Partitions using Parted

As you aware of, we have created three partitions in the above step and if you want to list all available partitions on the disk use the print command.
```
$ sudo parted /dev/sdb print
Model: ATA VBOX HARDDISK (scsi)
Disk /dev/sdb: 53.7GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:

Number Start End Size Type File system Flags
 1 1049kB 10.0GB 9999MB primary ext4
 2 10.0GB 20.0GB 9999MB primary ext4
 3 20.0GB 53.7GB 33.7GB primary ext4

```

### How To Create A File System On Partition Using mkfs

Users can create a file system on the partition using mkfs. Follow the below procedure to create a filesystem using mkfs.
```
$ sudo mkfs.ext4 /dev/sdb1
mke2fs 1.43.4 (31-Jan-2017)
Creating filesystem with 2621440 4k blocks and 656640 inodes
Filesystem UUID: 415cf467-634c-4403-8c9f-47526bbaa381
Superblock backups stored on blocks:
    32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632

Allocating group tables: done
Writing inode tables: done
Creating journal (16384 blocks): done
Writing superblocks and filesystem accounting information: done

```

Do the same for other partitions as well.
```
$ sudo mkfs.ext4 /dev/sdb2
$ sudo mkfs.ext4 /dev/sdb3

```

Create necessary folders and mount the partitions on that.
```
$ sudo mkdir /par1 /par2 /par3

$ sudo mount /dev/sdb1 /par1
$ sudo mount /dev/sdb2 /par2
$ sudo mount /dev/sdb3 /par3

```

Run the following command to check newly mounted partitions.
```
$ df -h /dev/sdb[1-3]
Filesystem Size Used Avail Use% Mounted on
/dev/sdb1 9.2G 37M 8.6G 1% /par1
/dev/sdb2 9.2G 37M 8.6G 1% /par2
/dev/sdb3 31G 49M 30G 1% /par3

```

### How To Check Free Space On The Disk

Run the following command to check available free space on the disk. This disk has `25.7GB` of free disk space.
```
$ sudo parted /dev/sdb print free
Model: ATA VBOX HARDDISK (scsi)
Disk /dev/sdb: 53.7GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:

Number Start End Size Type File system Flags
 32.3kB 1049kB 1016kB Free Space
 1 1049kB 10.0GB 9999MB primary ext4
 2 10.0GB 20.0GB 9999MB primary ext4
 3 20.0GB 28.0GB 8001MB primary ext4
 28.0GB 53.7GB 25.7GB Free Space

```

### How To Resize Partition Using Parted Command

Parted allow users to resize the partitions to big and smaller size. As i told in the beginning of the article, do not shrink partitions because this leads to face disk error issue.

Run the following command to check disk partitions and available free space. I could see `25.7GB` of free space on this disk.
```
$ sudo parted /dev/sdb print free
Model: ATA VBOX HARDDISK (scsi)
Disk /dev/sdb: 53.7GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:

Number Start End Size Type File system Flags
 32.3kB 1049kB 1016kB Free Space
 1 1049kB 10.0GB 9999MB primary ext4
 2 10.0GB 20.0GB 9999MB primary ext4
 3 20.0GB 28.0GB 8001MB primary ext4
 28.0GB 53.7GB 25.7GB Free Space

```

Run the following command to resize the partition. We are going to resize (increase) the partition 3 end size from `28GB to 33GB`.
```
$ sudo parted [Disk Name] [resizepart] [Partition Number] [Partition New End Size]

$ sudo parted /dev/sdb resizepart 3 33.0GB
Information: You may need to update /etc/fstab.

```

Run the following command to verify whether this partition is increased or not. Yes, i could see the partition 3 got increased from `8GB to 13GB`.
```
$ sudo parted /dev/sdb print
Model: ATA VBOX HARDDISK (scsi)
Disk /dev/sdb: 53.7GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:

Number Start End Size Type File system Flags
 1 1049kB 10.0GB 9999MB primary ext4
 2 10.0GB 20.0GB 9999MB primary ext4
 3 20.0GB 33.0GB 13.0GB primary ext4

```

Resize the file system to grow the resized partition.
```
$ sudo resize2fs /dev/sdb3
resize2fs 1.43.4 (31-Jan-2017)
Resizing the filesystem on /dev/sdb3 to 3173952 (4k) blocks.
The filesystem on /dev/sdb3 is now 3173952 (4k) blocks long.

```

Finally, check whether the mount point has been successfully increased or not.
```
$ df -h /dev/sdb[1-3]
Filesystem Size Used Avail Use% Mounted on
/dev/sdb1 9.2G 5.1G 3.6G 59% /par1
/dev/sdb2 9.2G 2.1G 6.6G 24% /par2
/dev/sdb3 12G 1.1G 11G 10% /par3

```

### How To Remove Partition Using Parted Command

We can simple remove the unused partition (if the partition is no longer use) using rm command. See the procedure below. We are going to remove partition 3 `/dev/sdb3` in this example.
```
$ sudo parted [Disk Name] [rm] [Partition Number]

$ sudo parted /dev/sdb rm 3
Warning: Partition /dev/sdb3 is being used. Are you sure you want to continue?
Yes/No? Yes
Error: Partition(s) 3 on /dev/sdb have been written, but we have been unable to inform the kernel of the change, probably because it/they are in use. As a result, the old partition(s) will remain in use.
You should reboot now before making further changes.
Ignore/Cancel? Ignore
Information: You may need to update /etc/fstab.

```

We can check the same using below command. Yes, i could see that partition 3 has been removed successfully.
```
$ sudo parted /dev/sdb print
Model: ATA VBOX HARDDISK (scsi)
Disk /dev/sdb: 53.7GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:

Number Start End Size Type File system Flags
 1 1049kB 10.0GB 9999MB primary ext4
 2 10.0GB 20.0GB 9999MB primary ext4

```

### How To Set/Change Partition Flag Using Parted Command

We can easily change the partition flag using below command. We are going to set `lvm` flag to partition 2 `/dev/sdb2`.
```
$ sudo parted [Disk Name] [set] [Partition Number] [Flags Name] [Flag On/Off]

$ sudo parted /dev/sdb set 2 lvm on
Information: You may need to update /etc/fstab.

```

We can verify this modification by listing disk partitions.
```
$ sudo parted /dev/sdb print
Model: ATA VBOX HARDDISK (scsi)
Disk /dev/sdb: 53.7GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:

Number Start End Size Type File system Flags
 1 1049kB 10.0GB 9999MB primary ext4
 2 10.0GB 20.0GB 9999MB primary ext4 lvm

```

To know list of available flags, use the following command.
```
$ (parted) help set
 set NUMBER FLAG STATE change the FLAG on partition NUMBER

    NUMBER is the partition number used by Linux. On MS-DOS disk labels, the primary partitions number from 1 to 4, logical partitions from 5 onwards.
 FLAG is one of: boot, root, swap, hidden, raid, lvm, lba, hp-service, palo, prep, msftres, bios_grub, atvrecv, diag, legacy_boot, msftdata, irst, esp
 STATE is one of: on, off

```

If you want to know the available options in parted, just navigate to `help` page.
```
$ sudo parted
GNU Parted 3.2
Using /dev/sda
Welcome to GNU Parted! Type 'help' to view a list of commands.
(parted) help
 align-check TYPE N check partition N for TYPE(min|opt) alignment
 help [COMMAND] print general help, or help on COMMAND
 mklabel,mktable LABEL-TYPE create a new disklabel (partition table)
 mkpart PART-TYPE [FS-TYPE] START END make a partition
 name NUMBER NAME name partition NUMBER as NAME
 print [devices|free|list,all|NUMBER] display the partition table, available devices, free space, all found partitions, or a particular partition
 quit exit program
 rescue START END rescue a lost partition near START and END
 resizepart NUMBER END resize partition NUMBER
 rm NUMBER delete partition NUMBER
 select DEVICE choose the device to edit
 disk_set FLAG STATE change the FLAG on selected device
 disk_toggle [FLAG] toggle the state of FLAG on selected device
 set NUMBER FLAG STATE change the FLAG on partition NUMBER
 toggle [NUMBER [FLAG]] toggle the state of FLAG on partition NUMBER
 unit UNIT set the default unit to UNIT
 version display the version number and copyright information of GNU Parted
(parted) quit

```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-manage-disk-partitions-using-parted-command/

作者：[Magesh Maruthamuthu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/magesh/
[1]:https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[2]:https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[3]:https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[4]:https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[5]:https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[6]:https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
