Linux 的 EXT4 文件系统简介
============================================================

### 让我们大概地从 EXT4  的历史、特性以及最佳实践这几个方面来学习它和之前的所有的 EXT 文件系统有何不同。

![An introduction to the EXT4 filesystem](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/hard_drives.png?itok=yZWyaSO6 "An introduction to the EXT4 filesystem")
>图片来自 : [WIlliam][8][ Warby][9]. 由 [Jason Baker][10] 编辑. Creative Commons [BY-SA 2.0][11].

在之前关于 Linux 文件系统的文章里，我写过一篇 [an introduction to Linux filesystems][12] 和一些更高级的概念例如 [everything is a file][13]. 我想要更深入地了解 EXT 文件系统的特性的详细内容，但是首先让我们来回答一个问题，“什么样才算是一个文件系统 ？” 一个文件系统应该涵盖以下所有点：

1.  **数据存储:** 对于任何一个文件系统来说，一个最主要的功能就是能够被当作一个容器结构来存储和恢复数据。

2.  **命名空间:** 命名空间是一个提供了命名规则和数据结构的用于命名与组织的方法学。

3.  **安全模型:** 一个用于定义访问权限的策略。

4.  **API:** 指的是调用了操作这个系统的对象的系统方法，这些对象诸如目录和文件。

5.  **实现:** 能够实现以上几点的软件。

本文内容的讨论主要集中于上述几点中的第一项并探索为一个 EXT 文件系统的数据存储提供逻辑框架的元数据结构。

### EXT 文件系统历史

虽然 EXT 文件系统是为 Linux 编写的，但其真正起源于 Minix 操作系统和 Minix 文件系统，而 Minix 最早发布于 1987，早于 Linux 5 年。如果我们从 EXT 文件系统大家族的 Minix 起源来观察其历史与技术发展那么理解 EXT4 文件系统就会简单得多。

### Minix

当 Linux Torvalds 在写最初的 Linux 内核的时候，他需要一个文件系统但是他又不想自己写一个。于是他简单地把 [Minix 文件系统][14] 加了进去，这个 Minix 文件系统是由 [Andrew S. Tanenbaum][15] 写的同时也是 Tanenbaum 的 Minix 操作系统的一部分。[Minix][16] 是一个类 Unix 风格的操作系统，最初编写它的原因是用于教育。Minx 的代码是自由可用的且经过适当的许可的，所以 Torvalds 可以把它用 Linux 的最初版本里。

Minix 有以下这些结构，其中的大部分位于生成文件系统的分区中：

*   [**boot 扇区**][6] 是硬盘驱动安装后的第一个扇区。这个 boot 块包含了一个非常小的 boot 记录和一个分区表。

*   每一个分区的第一个块都是一个包含了元数据的 **superblock** ，这些元数据定义了其他文件系统的结构并将其定位于物理硬盘的具体分区上。

*   一个 **inode 位图块** 决定了哪些 inode 是在使用中的，哪一些是未使用的。

*   **inode** 在硬盘上有它们自己的空间。每一个 inode 都包含了一个文件的信息包括其所处的数据块的位置，也就是该文件所处的区域。

*   一个 **区位图** 用于保持追踪数据区域的使用和未使用情况。

*   一个 **数据区**, 这里是数据存储的地方。

对上述了两种位图类型来说，一个 bit 表示一个制定的数据区或者一个指定的 inode. 如果这个 bit 是 0 则表示这个数据区或者这个 inode 是可以使用的，如果是 1 则表示正在使用中。

那么，[inode][17] 又是什么呢 ? 就是 index-node (索引节点)的简写。 inode 是位于磁盘上的一个 256 字节的块，用于存储和该 inode 对应的文件的相关数据。这些数据包含了文件的大小、文件的所有者和所属组的用户的 ID、文件模式（即访问权限）以及三个时间戳用于指定：该文件最后的访问时间、该文件的最后修改时间和该 inode 中的数据的最后修改时间。

同时，这个 inode 还包含了指向了其所对应的文件的数据在硬盘中的位置。在 Minix 和 EXT1-3 文件系统中，inode 表示的是一系列的的数据区和块。Minix 文件系统的 inode 支持 9 个数据块包括 7 个直接数据块和 2 个间接数据块。如果你想要更深入的了解，这里有一个优秀的 PDF 详细地描述了 [Minix 文件系统街头][18] 。同时你也可以在维基百科上对 [inode 指针结构][19] 做一个快速的浏览。

### EXT

原生的 [EXT 文件系统][20] (指经过扩展的) 是由 [Rémy Card][21] 编写并于 1992 年与 Linux 一同发行。主要是为了克服 Minix 文件系统中的一些文件大小限制的问题。其中，最主要的结构变化就是文件系统中的元数据。它基于 Unix 文件系统 （UFS），也被称为伯克利快速文件系统（FFS）。我发现只有很少一部分关于 EXT 文件系统的发行信息是可以被验证的，显然这是因为其存在着严重的问题并且它很快地被 EXT2 文件系统取代了。

### EXT2

[EXT2 文件系统][22] 就相当地成功，它在 Linux 发行版中存活了多年。它是我在 1997 年开始使用 Red Hat Linux 时认识的第一个文件系统。实际上，EXT2 文件系统有着和 EXT 文件系统基本相同的元数据结构。然而 EXT2 更高瞻远瞩，因为其元数据结构之间留有很多磁盘空间供将来使用。

和 Minix 类似，EXT2 也有一个[boot 扇区][23] ，它是硬盘驱动安装后的第一个扇区。它包含了少量的 boot 记录和一个分区表。接着 boot 扇区之后是一些保留的空间，它跨越引导记录和通常位于下一个柱面的硬盘驱动器上的第一个分区之间的空间。 [GRUB2] [24] - 也可能是GRUB1 - 将此空间用于其部分启动代码。

每个 EXT2 分区中的空间分为各柱面组，它允许更精细地管理数据空间。 根据我的经验，每一组大小通常约为8MB。 下面的图1显示了一个柱面组的基本结构。 柱面中的数据分配单元是块，通常大小为4K。

![cylindergroup-01_1.png](https://opensource.com/sites/default/files/images/life-uploads/cylindergroup-01_1.png)

Figure 1: The structure of a cylinder group in the EXT filesystems

The first block in the cylinder group is a superblock, which contains the metadata that defines the other filesystem structures and locates them on the physical disk. Some of the additional groups in the partition will have backup superblocks, but not all. A damaged superblock can be replaced by using a disk utility such as **dd** to copy the contents of a backup superblock to the primary superblock. It does not happen often, but once, many years ago, I had a damaged superblock, and I was able to restore its contents using one of the backup superblocks. Fortunately, I had been foresighted and used the **dumpe2fs** command to dump the descriptor information of the partitions on my system.

Following is the partial output from the **dumpe2fs** command. It shows the metadata contained in the superblock, as well as data about each of the first two cylinder groups in the filesystem.

```
# dumpe2fs /dev/sda1
Filesystem volume name:   boot 
Last mounted on:          /boot 
Filesystem UUID:          79fc5ed8-5bbc-4dfe-8359-b7b36be6eed3 
Filesystem magic number:  0xEF53 
Filesystem revision #:    1 (dynamic) 
Filesystem features:      has_journal ext_attr resize_inode dir_index filetype needs_recovery extent 64bit flex_bg sparse_super large_file huge_file dir nlink extra_isize 
Filesystem flags:         signed_directory_hash 
Default mount options:    user_xattr acl 
Filesystem state:         clean 
Errors behavior:          Continue 
Filesystem OS type:       Linux 
Inode count:              122160 
Block count:              488192 
Reserved block count:     24409 
Free blocks:              376512 
Free inodes:              121690 
First block:              0 
Block size:               4096 
Fragment size:            4096 
Group descriptor size:    64 
Reserved GDT blocks:      238 
Blocks per group:         32768 
Fragments per group:      32768 
Inodes per group:         8144 
Inode blocks per group:   509 
Flex block group size:    16 
Filesystem created:       Tue Feb  7 09:33:34 2017 
Last mount time:          Sat Apr 29 21:42:01 2017 
Last write time:          Sat Apr 29 21:42:01 2017 
Mount count:              25 
Maximum mount count:      -1 
Last checked:             Tue Feb  7 09:33:34 2017 
Check interval:           0 (<none>) 
Lifetime writes:          594 MB 
Reserved blocks uid:      0 (user root) 
Reserved blocks gid:      0 (group root) 
First inode:              11 
Inode size:               256 
Required extra isize:     32 
Desired extra isize:      32 
Journal inode:            8 
Default directory hash:   half_md4 
Directory Hash Seed:      c780bac9-d4bf-4f35-b695-0fe35e8d2d60 
Journal backup:           inode blocks 
Journal features:         journal_64bit 
Journal size:             32M 
Journal length:           8192 
Journal sequence:         0x00000213 
Journal start:            0 

Group 0: (Blocks 0-32767) 
 Primary superblock at 0, Group descriptors at 1-1 
 Reserved GDT blocks at 2-239 
 Block bitmap at 240 (+240) 
 Inode bitmap at 255 (+255) 
 Inode table at 270-778 (+270) 
 24839 free blocks, 7676 free inodes, 16 directories 
 Free blocks: 7929-32767 
 Free inodes: 440, 470-8144 
Group 1: (Blocks 32768-65535) 
 Backup superblock at 32768, Group descriptors at 32769-32769 
 Reserved GDT blocks at 32770-33007 
 Block bitmap at 241 (bg #0 + 241) 
 Inode bitmap at 256 (bg #0 + 256)
 Inode table at 779-1287 (bg #0 + 779) 
 8668 free blocks, 8142 free inodes, 2 directories 
 Free blocks: 33008-33283, 33332-33791, 33974-33975, 34023-34092, 34094-34104, 34526-34687, 34706-34723, 34817-35374, 35421-35844, 35935-36355, 36357-36863, 38912-39935, 39940-40570, 42620-42623, 42655, 42674-42687, 42721-42751, 42798-42815, 42847, 42875-42879, 42918-42943, 42975, 43000-43007, 43519, 43559-44031, 44042-44543, 44545-45055, 45116-45567, 45601-45631, 45658-45663, 45689-45695, 45736-45759, 45802-45823, 45857-45887, 45919, 45950-45951, 45972-45983, 46014-46015, 46057-46079, 46112-46591, 46921-47103, 49152-49395, 50027-50355, 52237-52255, 52285-52287, 52323-52351, 52383, 52450-52479, 52518-52543, 52584-52607, 52652-52671, 52734-52735, 52743-53247 
 Free inodes: 8147-16288 
Group 2: (Blocks 65536-98303) 
 Block bitmap at 242 (bg #0 + 242) 
 Inode bitmap at 257 (bg #0 + 257) 
 Inode table at 1288-1796 (bg #0 + 1288) 
 6326 free blocks, 8144 free inodes, 0 directories 
 Free blocks: 67042-67583, 72201-72994, 80185-80349, 81191-81919, 90112-94207 
 Free inodes: 16289-24432 
Group 3: (Blocks 98304-131071)

<snip>
```

Each cylinder group has its own inode bitmap that is used to determine which inodes are used and which are free within that group. The inodes have their own space in each group. Each inode contains information about one file, including the locations of the data blocks belonging to the file. The block bitmap keeps track of the used and free data blocks within the filesystem. Notice that there is a great deal of data about the filesystem in the output shown above. On very large filesystems the group data can run to hundreds of pages in length. The group metadata includes a listing of all of the free data blocks in the group.

The EXT filesystem implemented data-allocation strategies that ensured minimal file fragmentation. Reducing fragmentation improved filesystem performance. Those strategies are described below, in the section on EXT4.

The biggest problem with the EXT2 filesystem, which I encountered on some occasions, was that it could take many hours to recover after a crash because the **fsck** (file system check) program took a very long time to locate and correct any inconsistencies in the filesystem. It once took over 28 hours on one of my computers to fully recover a disk upon reboot after a crash—and that was when disks were measured in the low hundreds of megabytes in size.

### EXT3

The [EXT3 filesystem][25] had the singular objective of overcoming the massive amounts of time that the **fsck** program required to fully recover a disk structure damaged by an improper shutdown that occurred during a file-update operation. The only addition to the EXT filesystem was the [journal][26], which records in advance the changes that will be performed to the filesystem. The rest of the disk structure is the same as it was in EXT2.

Instead of writing data to the disk's data areas directly, as in previous versions, the journal in EXT3 writes file data, along with its metadata, to a specified area on the disk. Once the data is safely on the hard drive, it can be merged in or appended to the target file with almost zero chance of losing data. As this data is committed to the data area of the disk, the journal is updated so that the filesystem will remain in a consistent state in the event of a system failure before all the data in the journal is committed. On the next boot, the filesystem will be checked for inconsistencies, and data remaining in the journal will then be committed to the data areas of the disk to complete the updates to the target file.

Journaling does reduce data-write performance, however there are three options available for the journal that allow the user to choose between performance and data integrity and safety. My personal preference is on the side of safety because my environments do not require heavy disk-write activity.

The journaling function reduces the time required to check the hard drive for inconsistencies after a failure from hours (or even days) to mere minutes, at the most. I have had many issues over the years that have crashed my systems. The details could fill another article, but suffice it to say that most were self-inflicted, like kicking out a power plug. Fortunately, the EXT journaling filesystems have reduced that bootup recovery time to two or three minutes. In addition, I have never had a problem with lost data since I started using EXT3 with journaling.

The journaling feature of EXT3 can be turned off and it then functions as an EXT2 filesystem. The journal itself still exists, empty and unused. Simply remount the partition with the mount command using the type parameter to specify EXT2\. You may be able to do this from the command line, depending upon which filesystem you are working with, but you can change the type specifier in the **/etc/fstab** file and then reboot. I strongly recommend against mounting an EXT3 filesystem as EXT2 because of the additional potential for lost data and extended recovery times.

An existing EXT2 filesystem can be upgraded to EXT3 with the addition of a journal using the following command.

```
tune2fs -j /dev/sda1
```

Where **/dev/sda1** is the drive and partition identifier. Be sure to change the file type specifier in **/etc/fstab** and remount the partition or reboot the system to have the change take effect.

### EXT4

The [EXT4 filesystem][27] primarily improves performance, reliability, and capacity. To improve reliability, metadata and journal checksums were added. To meet various mission-critical requirements, the filesystem timestamps were improved with the addition of intervals down to nanoseconds. The addition of two high-order bits in the timestamp field defers the [Year 2038 problem][28] until 2446—for EXT4 filesystems, at least.

In EXT4, data allocation was changed from fixed blocks to extents. An extent is described by its starting and ending place on the hard drive. This makes it possible to describe very long, physically contiguous files in a single inode pointer entry, which can significantly reduce the number of pointers required to describe the location of all the data in larger files. Other allocation strategies have been implemented in EXT4 to further reduce fragmentation.

EXT4 reduces fragmentation by scattering newly created files across the disk so that they are not bunched up in one location at the beginning of the disk, as many early PC filesystems did. The file-allocation algorithms attempt to spread the files as evenly as possible among the cylinder groups and, when fragmentation is necessary, to keep the discontinuous file extents as close as possible to others in the same file to minimize head seek and rotational latency as much as possible. Additional strategies are used to pre-allocate extra disk space when a new file is created or when an existing file is extended. This helps to ensure that extending the file will not automatically result in its becoming fragmented. New files are never allocated immediately after existing files, which also prevents fragmentation of the existing files.

Aside from the actual location of the data on the disk, EXT4 uses functional strategies, such as delayed allocation, to allow the filesystem to collect all the data being written to the disk before allocating space to it. This can improve the likelihood that the data space will be contiguous.

Older EXT filesystems, such as EXT2 and EXT3, can be mounted as EXT4 to make some minor performance gains. Unfortunately, this requires turning off some of the important new features of EXT4, so I recommend against this.

EXT4 has been the default filesystem for Fedora since Fedora 14\. An EXT3 filesystem can be upgraded to EXT4 using the [procedure ][29]described in the Fedora documentation, however its performance will still suffer due to residual EXT3 metadata structures. The best method for upgrading to EXT4 from EXT3 is to back up all the data on the target filesystem partition, use the **mkfs** command to write an empty EXT4 filesystem to the partition, and then restore all the data from the backup.

### Inode

The inode, described previously, is a key component of the metadata in EXT filesystems. Figure 2 shows the relationship between the inode and the data stored on the hard drive. This diagram is the directory and inode for a single file which, in this case, may be highly fragmented. The EXT filesystems work actively to reduce fragmentation, so it is very unlikely you will ever see a file with this many indirect data blocks or extents. In fact, as you will see below, fragmentation is extremely low in EXT filesystems, so most inodes will use only one or two direct data pointers and none of the indirect pointers.

![inodesanddataallocation-01_0.png](https://opensource.com/sites/default/files/images/life-uploads/inodesanddataallocation-01_0.png)

Figure 2: The inode stores information about each file and enables the EXT filesystem to locate all data belonging to it.

The inode does not contain the name of the file. Access to a file is via the directory entry, which itself is the name of the file and contains a pointer to the inode. The value of that pointer is the inode number. Each inode in a filesystem has a unique ID number, but inodes in other filesystems on the same computer (and even the same hard drive) can have the same inode number. This has implications for [links][30], and this discussion is beyond the scope of this article.

The inode contains the metadata about the file, including its type and permissions as well as its size. The inode also contains space for 15 pointers that describe the location and length of data blocks or extents in the data portion of the cylinder group. Twelve of the pointers provide direct access to the data extents and should be sufficient to handle most files. However, for files that have significant fragmentation, it becomes necessary to have some additional capabilities in the form of indirect nodes. Technically these are not really inodes, so I use the term "node" here for convenience.

An indirect node is a normal data block in the filesystem that is used only for describing data and not for storage of metadata, thus more than 15 entries can be supported. For example, a block size of 4K can support 512 4-byte indirect nodes, allowing **12 (direct) + 512 (indirect) = 524** extents for a single file. Double and triple indirect node support is also supported, but most of us are unlikely to encounter files requiring that many extents.

### Data fragmentation

For many older PC filesystems, such as FAT (and all its variants) and NTFS, fragmentation has been a significant problem resulting in degraded disk performance. Defragmentation became an industry in itself with different brands of defragmentation software that ranged from very effective to only marginally so.

Linux's extended filesystems use data-allocation strategies that help to minimize fragmentation of files on the hard drive and reduce the effects of fragmentation when it does occur. You can use the **fsck** command on EXT filesystems to check the total filesystem fragmentation. The following example checks the home directory of my main workstation, which was only 1.5% fragmented. Be sure to use the **-n** parameter, because it prevents **fsck** from taking any action on the scanned filesystem.

```
fsck -fn /dev/mapper/vg_01-home
```

I once performed some theoretical calculations to determine whether disk defragmentation might result in any noticeable performance improvement. While I did make some assumptions, the disk performance data I used were from a new 300GB, Western Digital hard drive with a 2.0ms track-to-track seek time. The number of files in this example was the actual number that existed in the filesystem on the day I did the calculation. I did assume that a fairly large amount of the fragmented files (20%) would be touched each day.

| **Total files** | **271,794** |
| % fragmentation | 5.00% |
| Discontinuities | 13,590 |
|   |   |
| % fragmented files touched per day | 20% (assume) |
| Number of additional seeks | 2,718 |
| Average seek time | 10.90 ms |
| Total additional seek time per day | 29.63 sec |
|   | 0.49 min |
|   |   |
| Track-to-track seek time | 2.00 ms |
| Total additional seek time per day | 5.44 sec |
|   | 0.091 min |

Table 1: The theoretical effects of fragmentation on disk performance

I have done two calculations for the total additional seek time per day, one based on the track-to-track seek time, which is the more likely scenario for most files due to the EXT file allocation strategies, and one for the average seek time, which I assumed would make a fair worst-case scenario.

As you can see from Table 1, the impact of fragmentation on a modern EXT filesystem with a hard drive of even modest performance would be minimal and negligible for the vast majority of applications. You can plug the numbers from your environment into your own similar spreadsheet to see what you might expect in the way of performance impact. This type of calculation most likely will not represent actual performance, but it can provide a bit of insight into fragmentation and its theoretical impact on a system.

Most of my partitions are around 1.5% or 1.6% fragmented; I do have one that is 3.3% fragmented but that is a large, 128GB filesystem with fewer than 100 very large ISO image files; I've had to expand the partition several times over the years as it got too full.

That is not to say that some application environments don't require greater assurance of even less fragmentation. The EXT filesystem can be tuned with care by a knowledgeable admin who can adjust the parameters to compensate for specific workload types. This can be done when the filesystem is created or later using the **tune2fs** command. The results of each tuning change should be tested, meticulously recorded, and analyzed to ensure optimum performance for the target environment. In the worst case, where performance cannot be improved to desired levels, other filesystem types are available that may be more suitable for a particular workload. And remember that it is common to mix filesystem types on a single host system to match the load placed on each filesystem.

Due to the low amount of fragmentation on most EXT filesystems, it is not necessary to defragment. In any event, there is no safe defragmentation tool for EXT filesystems. There are a few tools that allow you to check the fragmentation of an individual file or the fragmentation of the remaining free space in a filesystem. There is one tool, **e4defrag**, which will defragment a file, directory, or filesystem as much as the remaining free space will allow. As its name implies, it only works on files in an EXT4 filesystem, and it does have some limitations.

If it becomes necessary to perform a complete defragmentation on an EXT filesystem, there is only one method that will work reliably. You must move all the files from the filesystem to be defragmented, ensuring that they are deleted after being safely copied to another location. If possible, you could then increase the size of the filesystem to help reduce future fragmentation. Then copy the files back onto the target filesystem. Even this does not guarantee that all the files will be completely defragmented.

### Conclusions

The EXT filesystems have been the default for many Linux distributions for more than 20 years. They offer stability, high capacity, reliability, and performance while requiring minimal maintenance. I have tried other filesystems but always return to EXT. Every place I have worked with Linux has used the EXT filesystems and found them suitable for all the mainstream loads used on them. Without a doubt, the EXT4 filesystem should be used for most Linux systems unless there is a compelling reason to use another filesystem.

--------------------------------------------------------------------------------

作者简介：

David Both - David Both 是一名 Linux 于开源的贡献者，目前居住在北卡罗莱纳州的罗利。他从事 IT 行业有 40 余年并在 IBM 中从事 OS/2 培训约 20 余年。在 IBM 就职期间，他在 1981 年为最早的 IBM PC 写了一个培训课程。他已经为红帽教授了 RHCE 课程，曾在 MCI Worldcom，思科和北卡罗来纳州工作。 他使用 Linux 和开源软件工作了近 20 年。

-------------------

via: https://opensource.com/article/17/5/introduction-ext4-filesystem

作者：[David Both ][a]
译者：[chenxinlong](https://github.com/chenxinlong)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dboth
[1]:https://opensource.com/resources/what-is-linux?src=linux_resource_menu
[2]:https://opensource.com/resources/what-are-linux-containers?src=linux_resource_menu
[3]:https://developers.redhat.com/promotions/linux-cheatsheet/?intcmp=7016000000127cYAAQ
[4]:https://developers.redhat.com/cheat-sheet/advanced-linux-commands-cheatsheet?src=linux_resource_menu&intcmp=7016000000127cYAAQ
[5]:https://opensource.com/tags/linux?src=linux_resource_menu
[6]:https://en.wikipedia.org/wiki/Boot_sector
[7]:https://opensource.com/article/17/5/introduction-ext4-filesystem?rate=B4QU3W_JYmEKsIKZf5yqMpztt7CRF6uzC0wfNBidEbs
[8]:https://www.flickr.com/photos/wwarby/11644168395
[9]:https://www.flickr.com/photos/wwarby/11644168395
[10]:https://opensource.com/users/jason-baker
[11]:https://creativecommons.org/licenses/by/2.0/
[12]:https://opensource.com/life/16/10/introduction-linux-filesystems
[13]:https://opensource.com/life/15/9/everything-is-a-file
[14]:https://en.wikipedia.org/wiki/MINIX_file_system
[15]:https://en.wikipedia.org/wiki/Andrew_S._Tanenbaum
[16]:https://en.wikipedia.org/wiki/MINIX
[17]:https://en.wikipedia.org/wiki/Inode
[18]:http://ohm.hgesser.de/sp-ss2012/Intro-MinixFS.pdf
[19]:https://en.wikipedia.org/wiki/Inode_pointer_structure
[20]:https://en.wikipedia.org/wiki/Extended_file_system
[21]:https://en.wikipedia.org/wiki/R%C3%A9my_Card
[22]:https://en.wikipedia.org/wiki/Ext2
[23]:https://en.wikipedia.org/wiki/Boot_sector
[24]:https://opensource.com/article/17/2/linux-boot-and-startup
[25]:https://en.wikipedia.org/wiki/Ext3
[26]:https://en.wikipedia.org/wiki/Journaling_file_system
[27]:https://en.wikipedia.org/wiki/Ext4
[28]:https://en.wikipedia.org/wiki/Year_2038_problem
[29]:https://docs.fedoraproject.org/en-US/Fedora/14/html/Storage_Administration_Guide/ext4converting.html
[30]:https://en.wikipedia.org/wiki/Hard_link
[31]:https://opensource.com/user/14106/feed
[32]:https://opensource.com/article/17/5/introduction-ext4-filesystem#comments
[33]:https://opensource.com/users/dboth
