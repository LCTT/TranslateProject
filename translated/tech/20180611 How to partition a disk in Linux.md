如何在 Linux 中使用 parted 对磁盘分区
==========

> 学习如何在 Linux 中使用 parted 命令来对存储设备分区。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus-storage.png?itok=95-zvHYl)

在 Linux 中创建和删除分区是一种常见的操作，因为存储设备（如硬盘驱动器和 USB 驱动器）在使用之前必须以某种方式进行结构化。在大多数情况下，大型存储设备被分为称为<ruby>分区<rt>partition</rt></ruby>的独立部分。分区操作允许您将硬盘分割成独立的部分，每个部分都像是一个硬盘驱动器一样。如果您运行多个操作系统，那么分区是非常有用的。

在 Linux 中有许多强大的工具可以创建、删除和操作磁盘分区。在本文中，我将解释如何使用 `parted` 命令，这对于大型磁盘设备和许多磁盘分区尤其有用。`parted` 与更常见的 `fdisk` 和 `cfdisk` 命令之间的区别包括:

* **GPT 格式：**`parted` 命令可以创建全局惟一的标识符分区表 [GPT][1]，而 `fdisk` 和 `cfdisk` 则仅限于 DOS 分区表。
* **更大的磁盘：** DOS 分区表可以格式化最多 2TB 的磁盘空间，尽管在某些情况下最多可以达到 16TB。然而，一个 GPT 分区表可以处理最多 8ZiB 的空间。
* **更多的分区：** 使用主分区和扩展分区，DOS 分区表只允许 16 个分区。在 GPT 中，默认情况下您可以得到 128 个分区，并且可以选择更多的分区。
* **可靠性：** 在 DOS 分区表中，只保存了一份分区表备份，在 GPT 中保留了两份分区表的备份（在磁盘的起始和结束部分），同时 GPT 还使用了 [CRC][2]  校验和来检查分区表的完整性，在 DOS 分区中并没有实现。

由于现在的磁盘更大，需要更灵活地使用它们，建议使用 `parted` 来处理磁盘分区。大多数时候，磁盘分区表是作为操作系统安装过程的一部分创建的。在向现有系统添加存储设备时，直接使用 `parted` 命令非常有用。

### 尝试一下 parted

下面解释了使用 `parted` 命令对存储设备进行分区的过程。为了尝试这些步骤，我强烈建议使用一块全新的存储设备或一种您不介意将其内容删除的设备。

#### 1、列出分区

使用 `parted -l` 来标识你要进行分区的设备。一般来说，第一个硬盘 （`/dev/sda` 或 `/dev/vda` ）保存着操作系统， 因此要寻找另一个磁盘，以找到你想要分区的磁盘 (例如，`/dev/sdb`、`/dev/sdc`、 `/dev/vdb `、`/dev/vdc` 等)。

```
$ sudo parted -l
[sudo] password for daniel: 
Model: ATA RevuAhn_850X1TU5 (scsi)
Disk /dev/vdc: 512GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags: 

Number  Start   End    Size   Type     File system  Flags
 1      1049kB  525MB  524MB  primary  ext4         boot
 2      525MB   512GB  512GB  primary               lvm
```

#### 2、打开存储设备

使用 `parted` 选中您要分区的设备。在这里例子中，是虚拟系统上的第三个磁盘（`/dev/vdc`）。指明你要使用哪一个设备非常重要。 如果你仅仅输入了 `parted`  命令而没有指定设备名字， 它会**随机**选择一个设备进行操作。

```
$ sudo parted /dev/vdc
GNU Parted 3.2
Using /dev/vdc
Welcome to GNU Parted! Type 'help' to view a list of commands.
(parted)
```

#### 3、 设定分区表

设置分区表为 GPT ，然后输入 `Yes` 开始执行。

```
(parted) mklabel gpt 
Warning: the existing disk label on /dev/vdc will be destroyed 
and all data on this disk will be lost. Do you want to continue? 
Yes/No? Yes
```

`mklabel` 和 `mktable` 命令用于相同的目的（在存储设备上创建分区表）。支持的分区表有：aix、amiga、bsd、dvh、gpt、mac、ms-dos、pc98、sun 和 loop。记住 `mklabel` 不会创建一个分区，而是创建一个分区表。

#### 4、 检查分区表

查看存储设备信息:

```
(parted) print 
Model: Virtio Block Device (virtblk) 
Disk /dev/vdc: 1396MB 
Sector size (logical/physical): 512B/512B 
Partition Table: gpt 
Disk Flags: 
Number Start End Size File system Name Flags
```

#### 5、 获取帮助

为了知道如何去创建一个新分区，输入： `(parted) help mkpart` 。

```
(parted) help mkpart 
  mkpart PART-TYPE [FS-TYPE] START END     make a partition

        PART-TYPE is one of: primary, logical, extended
        FS-TYPE is one of: btrfs, nilfs2, ext4, ext3, ext2, fat32, fat16, hfsx, hfs+, hfs, jfs, swsusp,
        linux-swap(v1), linux-swap(v0), ntfs, reiserfs, hp-ufs, sun-ufs, xfs, apfs2, apfs1, asfs, amufs5,
        amufs4, amufs3, amufs2, amufs1, amufs0, amufs, affs7, affs6, affs5, affs4, affs3, affs2, affs1,
        affs0, linux-swap, linux-swap(new), linux-swap(old)
        START and END are disk locations, such as 4GB or 10%.  Negative values count from the end of the
        disk.  For example, -1s specifies exactly the last sector.
        
        'mkpart' makes a partition without creating a new file system on the partition.  FS-TYPE may be
        specified to set an appropriate partition ID.
```

#### 6、 创建分区

为了创建一个新分区（在这个例子中，分区 0 有 1396MB），输入下面的命令：

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
Number Start   End     Size    File system Name Flags 
1      17.4kB  1396MB  1396MB  primary
```

文件系统类型（`fstype`）并不是在 `/dev/vdc1`上创建 ext4 文件系统。 DOS 分区表的分区类型是<ruby>主分区<rt>primary</rt></ruby>、<ruby>逻辑分区<rt>logical</rt></ruby>和<ruby>扩展分区<rt>extended</rt></ruby>。 在 GPT 分区表中，分区类型用作分区名称。 在 GPT 下必须提供分区名称；在上例中，`primary` 是分区名称，而不是分区类型。

#### 7、 保存退出

当你退出 `parted` 时，修改会自动保存。退出请输入如下命令：

```
(parted) quit
Information: You may need to update /etc/fstab.
$
```

### 谨记

当您添加新的存储设备时，请确保在开始更改其分区表之前确定正确的磁盘。如果您错误地更改了包含计算机操作系统的磁盘分区，会使您的系统无法启动。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/how-partition-disk-linux

作者：[Daniel Oh][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[amwps290](https://github.com/amwps290)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/daniel-oh
[1]:https://en.wikipedia.org/wiki/GUID_Partition_Table
[2]:https://en.wikipedia.org/wiki/Cyclic_redundancy_check
