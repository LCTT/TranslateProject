[#]: subject: (Partition a drive on Linux with GNU Parted)
[#]: via: (https://opensource.com/article/21/4/linux-parted-cheat-sheet)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (hwlife)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Partition a drive on Linux with GNU Parted
======
Learn the basics of partitioning a new storage device, then download our
cheat sheet to keep info close at hand.
![Cheat Sheet cover image][1]

In the 21st century, we tend to take data storage for granted. We have lots of it, it's relatively affordable, and there are many different types of storage available. No matter how much cloud storage space you're given for free, there's nothing quite like having a physical hard drive for your really important (or really big, when you live on a slow network) data. However, few hard drives are sold right off the shelf, ready to use—in an ideal configuration, at least. Whether you're buying a new drive or setting up a system with a different configuration, you need to know how to partition a drive on Linux.

This article demonstrates GNU Parted, one of the best tools for partitioning drives. If you prefer to use a graphical application instead of a terminal command, read my article on [formatting drives for Linux][2].

### Disk labels, partitions, and filesystems

A hard drive doesn't _technically_ require much software to serve as a storage device. However, using a drive without modern conventions like a partition table and filesystem is difficult, impractical, and unsafe for your data.

There are three important concepts you need to know about hard drives:

  * A **disk label** or **partition table** is metadata placed at the start of a drive, serving as a clue for the computer reading it about what kind of storage is available and where it's located on the drive.
  * A **partition** is a boundary identifying where a filesystem is located. For instance, if you have a 512GB drive, you can have a partition on that device that takes up the entire drive (512GB), or two partitions that each take 256GB each, or three partitions taking up some other variation of sizes, and so on.
  * A **filesystem** is a storage scheme agreed upon by a hard drive and a computer. A computer must know how to read a filesystem to piece together all the data stored on the drive, and it must know how to write data back to the filesystem to maintain the data's integrity.



The GNU Parted application manages the first two concepts: disk labels and partitions. Parted has some awareness of filesystems, but it leaves the details of filesystem implementation to other tools like `mkfs`.

**[Download the [GNU Parted cheat sheet][3]]**

### Locating the drive

Before using GNU Parted, you must be certain where your drive is located on your system. First, attach the hard drive you want to format to your system, and then use the `parted` command to see what's attached to your computer:


```
$ parted /dev/sda print devices
/dev/sda (2000GB)
/dev/sdb (1000GB)
/dev/sdc (1940MB)
```

The device you most recently attached gets a name later in the alphabet than devices that have been attached longer. In this example, `/dev/sdc` is most likely the drive I just attached. I can confirm that by its size because I know that the USB thumb drive I attached is only 2GB (1940MB is close enough), compared to my workstation's main drives, which are terabytes in size. If you're not sure, then you can get more information about the drive you think is the one you want to partition:


```
$ parted /dev/sdc print
Model: Yoyodyne Tiny Drive 1.0 (scsi)    
Disk /dev/sdc: 1940MB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:

Number  Start   End     Size    File system  Name  Flags
 1      1049kB  2048kB  1024kB  BS           Bloat  Hidden
 2      2049kB  1939MB  1937MB  FAT32        MyDrive
```

Some drives provide more metadata than others. This one identifies itself as a drive from Yoyodyne, which is exactly the branding on the physical drive. Furthermore, it contains a small hidden partition at the front of the drive with some bloatware followed by a Windows-compatible FAT32 partition. This is definitely the drive I intend to reformat.

Before continuing, _make sure_ you have identified the correct drive you want to partition. _Repartitioning the wrong drive results in lost data._ For safety, all potentially destructive commands in this article reference the `/dev/sdX` device, which you are unlikely to have on your system.

### Creating a disk label or partition table

To create a partition on a drive, the drive must have a disk label. A disk label is also called a _partition table_, so Parted accepts either term.

To create a disk label, use the `mklabel` or `mktable` subcommand:


```
`$ parted /dev/sdX mklabel gpt`
```

This command creates a **gpt** label at the front of the drive located at `/dev/sdX`, erasing any label that may exist. This is a quick process because all that's being replaced is metadata about partitions.

### Creating a partition

To create a partition on a drive, use the `mkpart` subcommand, followed by an optional name for your partition, followed by the partition's start and end points. If you only need one partition on your drive, then sizing is easy: start at 1 and end at 100%. Use the `--align opt` option to allow Parted to adjust the position of the partition boundaries for best performance:


```
$ parted /dev/sdX --align opt \
mkpart example 1 100%
```

View your new partition with the `print` subcommand:


```
$ parted /dev/sdX print
Model: Yoyodyne Tiny Drive 1.0 (scsi)
Disk /dev/sdi: 1940MB
Sector size (logical/physical): 512B/512B
Partition Table: gpt
Disk Flags:

Number  Start   End     Size  
 1      1049kB  1939MB  1938MB
```

You don't have to use the whole disk for one partition. The advantage to a partition is that more than one filesystem can exist on a drive without interfering with the other partition(s). When sizing partitions, you can use the `unit` subcommand to set what kind of measurements you want to use. Parted understands sectors, cylinders, heads, bytes, kilobytes, megabytes, gigabytes, terabytes, and percentages.

You can also specify what filesystem you intend to use a partition for. This doesn't create the filesystem, but it does provide metadata that could be useful to you later.

Here's a 50-50 split, one for an XFS filesystem and another for an EXT4 filesystem:


```
$ parted /dev/sdX --align opt \
mkpart xfs 1 50%
$ parted /dev/sdX --align opt \
mkpart ext4 51% 100%
```

### Naming a partition

In addition to marking what filesystem a partition is for, you can also name each partition. Some file managers and utilities read partition names, which can help you identify drives. For instance, I often have several different drives attached on my media workstation, each belonging to a different project. When creating these drives, I name both the partition and the filesystem so that, no matter how I'm looking at my system, the locations with important data are clearly labeled.

To name a partition, you must know its number:


```
$ parted /dev/sdX print
[...]
Number  Start   End     Size   File system  Name     Flags
 1      1049kB  990MB   989MB  xfs          example
 2      1009MB  1939MB  930MB  ext4         noname
```

To name partition 1:


```
$ parted /dev/sdX name 1 example
$ parted /dev/sdX print
[...]
Number  Start   End     Size   File system  Name     Flags
 1      1049kB  990MB   989MB  xfs          example
 2      1009MB  1939MB  930MB  ext4         noname
```

### Create a filesystem

For your drive to be useful, you must create a filesystem in your new partition. GNU Parted doesn't do that because it's only a partition manager. The Linux command to create a filesystem on a drive is `mkfs`, but there are helpful utilities aliased for you to use to create a specific kind of filesystem. For instance, `mkfs.ext4` creates an EXT4 filesystem, while `mkfs.xfs` creates an XFS filesystem, and so on.

Your partition is located "in" the drive, so instead of creating a filesystem on `/dev/sdX`, you create your filesystem in `/dev/sdX1` for the first partition, `/dev/sdX2` for the second partition, and so on.

Here's an example of creating an XFS filesystem:


```
`$ sudo mkfs.xfs -L mydrive /dev/sdX1`
```

### Download our cheat sheet

Parted is a flexible and powerful command. You can issue it commands, as demonstrated in this article, or activate an interactive mode so that you're constantly "connected" to a drive you specify:


```
$ parted /dev/sdX
(parted) print
[...]
Number  Start   End     Size   File system  Name     Flags
 1      1049kB  990MB   989MB  xfs          example
 2      1009MB  1939MB  930MB  ext4         noname

(parted) name 1 mydrive
(parted)
```

If you intend to use Parted often, [download our GNU Parted cheat sheet][3] so that you have all the subcommands you need close at hand.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/linux-parted-cheat-sheet

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coverimage_cheat_sheet.png?itok=lYkNKieP (Cheat Sheet cover image)
[2]: https://opensource.com/article/18/11/partition-format-drive-linux#gui
[3]: https://opensource.com/downloads/parted-cheat-sheet
