怎样用 parted 管理硬盘分区
======

众所周知，对硬盘分区是 Linux 管理员一项最重要的管理任务之一，他们不能不知道这个。

在最糟糕的时候，你至少每周会收到一次依赖小组的请求，而在更大的环境里会更加频繁 。

你可能会问为什么我们要用 `parted` 而不是 `fdisk`？ 它们有什么区别？好问题，我会告诉你这两者的区别。

  * `parted` 支持用户在大于 2TB 的硬盘上创建硬盘分区， 但 `fdisk` 命令不支持
  * 对比 `fdisk` 来说，`parted` 是一个更高级的工具
  * 支持更多的分区表类型，包括 GPT （LCTT 译注：全局唯一标识分区表）
  * 它允许用户调整分区大小， 但当缩减分区空间的时候，它没有如我意料的工作，多数情况下我会得到错误消息。所以我会建议用户不要用 `parted` 来缩减分区大小。

### 什么是 parted

`parted` 是一个操作硬盘分区的程序。它支持多种分区表类型，包括 MS-DOS 和 GPT。

它允许用户创建、删除、调整、缩减、移动和复制分区，以及重新组织硬盘的使用，复制数据到新的硬盘上。`gparted` 是 `parted` 的图形界面前端。

### 怎样安装 parted

大部分发行版已经预安装了 `parted`。如果没有，用下列命令来安装 `parted`。

对于 Debian/Ubuntu 用户, 使用 [APT-GET 命令][1] 或者 [APT 命令][2] 来安装 `parted`。

```
$ sudo apt install parted
```

对于 RHEL/CentOS 用户，用 [YUM 命令][3] 来安装 `parted`。

```
$ sudo yum install parted
```

对于 Fedora 用户，用 [DNF 命令][4] 来安装 `parted`。

```
$ sudo dnf install parted
```

对于 Arch Linux 用户，用 [Pacman 命令][5]来安装 `parted`。
```
$ sudo pacman -S parted

```

对于 openSUSE 用户， 用 [Zypper 命令][6]来安装 `parted`。

```
$ sudo zypper in parted
```

### 怎样启动 parted

下面的 `parted` 命令会自动选择 `/dev/sda` ，因为这是系统的第一个硬盘。

```
$ sudo parted
GNU parted 3.2
Using /dev/sda
Welcome to GNU parted! Type 'help' to view a list of commands.
(parted)
```

同时我们也可以用下面的命令来重新选择对应的的硬盘。

```
(parted) select /dev/sdb
Using /dev/sdb
(parted)
```

如果你想选择特定的硬盘, 用下列的格式来输入命令。 这次 ，我们将选择 `/dev/sdb`。

```
$ sudo parted [Device Name]
```

```
$ sudo parted /dev/sdb
GNU parted 3.2
Using /dev/sdb
Welcome to GNU parted! Type 'help' to view a list of commands.
(parted)
```

### 怎样用 parted 列出所有可用的硬盘

如果你不知道你的电脑上有什么硬盘，只需要运行下列命令，该命令会显示所有可用硬盘的名字，以及其它的有用信息比如储存空间、型号、扇区大小、硬盘标志以及分区信息。

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

上面的错误信息清晰地显示出硬盘  `/dev/sdb` 没有有效的<ruby>磁盘标签<rt>disk label</rt></ruby>。 它不会自动得到磁盘标签，所以， 我们便要自己设置硬盘标签。

### 怎样用 parted 创建硬盘分区

`parted` 允许用户创建主分区或者拓展分区。创建这两种类型的分区的步骤还是一样，但请确保你已经指定了需要的分区类型，比如 `primary` （主分区）或者 `extended` （扩展分区）。

为了演示这项操作 ，我们安装了一个新的 `50 GB` 的硬盘到到电脑上，挂载在 `/dev/sdb` 上。

有两种方法创建分区，第一种是更详细的方法，另一种只是一个命令。 在下面的例子中，我们将用更详细的方法添加一个主分区。提醒一下， 我们应该先设置磁盘标签，因为它不会自动设置任何标签。

在下面的例子中，我们将要创建一个 `10 GB` 的分区 

```
$ sudo parted /dev/sdb
GNU parted 3.2
Using /dev/sdb
Welcome to GNU parted! Type 'help' to view a list of commands.
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

同时，我们也可以使用单条 `parted` 命令

在下面的例子中，我们将在硬盘上创建一个 `10 GB` 的分区。 

```
$ sudo parted [Disk Name] [mkpart] [Partition Type] [Filesystem Type] [Partition Start Size] [Partition End Size]
```

```
$ sudo parted /dev/sdb mkpart primary ext4 10.0GB 20.0GB
Information: You may need to update /etc/fstab.
```

### 怎样使用所有剩余空间创建分区

你已经创建了除了 `/home` 之外等所有要求的分区，而且你想要用硬盘上所有剩余的空间来创建 `/home` 分区，要怎样做？可以使用下面的命令来创建分区。

下面的命令创建了一个 33.7 GB 的分区，从  `20 GB` 开始到  `53 GB` 结束。 `100%` 使用率允许用户用硬盘上所有剩余的空余空间。

```
$ sudo parted [Disk Name] [mkpart] [Partition Type] [Filesystem Type] [Partition Start Size] [Partition End Size]

$ sudo parted /dev/sdb mkpart primary ext4 20.0GB 100%
Information: You may need to update /etc/fstab.
```

### 怎样用 parted 列出所有的分区

你也许注意到了，我们已经在上述步骤中创建了三个分区，如果你想要列出所有在硬盘上可用的分区，可以使用 `print` 命令。

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

### 怎样用 mkfs 格式化分区

用户可以用 `mkfs` 命令格式化分区。下面的步骤会用 `mkfs` 来格式化分区。

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

同样的。

```
$ sudo mkfs.ext4 /dev/sdb2
$ sudo mkfs.ext4 /dev/sdb3
```

创建必要的文件夹然后将这些分区挂载在上面。

```
$ sudo mkdir /par1 /par2 /par3
```

```
$ sudo mount /dev/sdb1 /par1
$ sudo mount /dev/sdb2 /par2
$ sudo mount /dev/sdb3 /par3
```

运行下列命令来检查是否成功挂载上新创建的分区。

```
$ df -h /dev/sdb[1-3]
Filesystem Size Used Avail Use% Mounted on
/dev/sdb1 9.2G 37M 8.6G 1% /par1
/dev/sdb2 9.2G 37M 8.6G 1% /par2
/dev/sdb3 31G 49M 30G 1% /par3
```

### 怎样检查硬盘空闲空间

运行下列命令来检查硬盘上的空闲空间，这块硬盘上有 `25.7 GB` 的空闲空间。

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

### 怎样使用 parted 命令来重新调整分区大小

`parted` 允许用户重新调整分区大小。不过我已在文章的开头说了，不要缩小分区大小，不然会有许多错误。

运行下列命令来检查硬盘分区以及所有可用空间。 可以看到硬盘上有 `25.7GB` 的可用空间。

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

运行下列命令来重新调整分区大小。 我们将要重新调整（增加）分区 3 的结束位置，从 `28GB` 到 `33GB`。

```
$ sudo parted [Disk Name] [resizepart] [Partition Number] [Partition New End Size]

$ sudo parted /dev/sdb resizepart 3 33.0GB
Information: You may need to update /etc/fstab.
```

运行下列命令来确认分区是否已经扩容。可以看到，分区 3 已经从 `8GB` 增加到 `13GB`。

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

重新调整文件系统大小。

```
$ sudo resize2fs /dev/sdb3
resize2fs 1.43.4 (31-Jan-2017)
Resizing the filesystem on /dev/sdb3 to 3173952 (4k) blocks.
The filesystem on /dev/sdb3 is now 3173952 (4k) blocks long.
```

最后，确认分区是否已经扩容。

```
$ df -h /dev/sdb[1-3]
Filesystem Size Used Avail Use% Mounted on
/dev/sdb1 9.2G 5.1G 3.6G 59% /par1
/dev/sdb2 9.2G 2.1G 6.6G 24% /par2
/dev/sdb3 12G 1.1G 11G 10% /par3
```

### 怎样用 parted 删除分区

我们用 `rm` 命令方便地删除未使用的分区（如果该分区不会再被用到了）。下列步骤中，我们将会删除分区 3 （`/dev/sdb3`）。

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

我们也可以用下列的命令检查。可以看到，分区 3 已经被成功移除。

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

### 怎样用 parted 命令设置/更改分区标志

我们可以用下列的命令来轻易更改分区的标志。 我们将对 `/dev/sdb2` 设置 `lvm`  标志。

```
$ sudo parted [Disk Name] [set] [Partition Number] [Flags Name] [Flag On/Off]

$ sudo parted /dev/sdb set 2 lvm on
Information: You may need to update /etc/fstab.
```

我们可以列出分区来验证这次的更改。

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

如果你想知道可用的标志，只需要用如下的命令。

```
$ (parted) help set
 set NUMBER FLAG STATE change the FLAG on partition NUMBER

    NUMBER is the partition number used by Linux. On MS-DOS disk labels, the primary partitions number from 1 to 4, logical partitions from 5 onwards.
 FLAG is one of: boot, root, swap, hidden, raid, lvm, lba, hp-service, palo, prep, msftres, bios_grub, atvrecv, diag, legacy_boot, msftdata, irst, esp
 STATE is one of: on, off
```

如果你想知道 `parted` 的其它可用命令， 只需要去到 `help` 页面。

```
$ sudo parted
GNU parted 3.2
Using /dev/sda
Welcome to GNU parted! Type 'help' to view a list of commands.
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
 version display the version number and copyright information of GNU parted
(parted) quit
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-manage-disk-partitions-using-parted-command/

作者：[Magesh Maruthamuthu][a]
译者：[zyk2290](https://github.com/zyk2290)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/magesh/
[1]:https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[2]:https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[3]:https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[4]:https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[5]:https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[6]:https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
