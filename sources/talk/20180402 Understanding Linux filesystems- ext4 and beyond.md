
理解 Linux 文件系统：ext4 以及更多文件系统
==========================================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_linux11x_cc.png?itok=XMDOouJR)

目前的大部分 Linux 文件系统都默认采用 ext4 文件系统, 正如以前的 Linux 发行版默认使用 ext3、ext2 以及更久前的 ext。对于不熟悉 Linux 或文件系统的朋友而言，你可能不清楚 ext4 相对于上一版本 ext3 带来了什么变化。你可能还想知道在一连串关于可替代文件系统例如 btrfs、xfs 和 zfs 的新闻不断被发表下，ext4 是否仍然能得到积极的发展 。
  
在一篇文章中，我们不可能覆盖文件系统的所有方面，但我们尝试让您尽快了解 Linux 默认文件系统的发展历史，包括它的产生以及未来发展。我仔细研究了 维基百科里的各种 ext 文件系统文章、kernel.org‘s 维基百科中关于 ext4 的条目以及结合自己的经验总结文件系统。

### ext 简史

#### MINIX 文件系统

在有 ext之前, 使用的是 MINIX 文件系统。如果你不熟悉 Linux 历史, 那么可以理解为 MINIX 相对于 IBM PC/AT 微型计算机来说是一个非常小的类 Unix 系统。Andrew Tannenbaum
为了教学的目的而开发了它并于1987年发布了源代码（印刷版！）。


![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/ibm_pc_at.jpg?itok=Tfk3hQYB)


虽然你可以读阅 MINIX 的源代码，但实际上它并不是免费的来源软件（FOSS）。Tannebaum 书的出版商要求你花69美元的许可费来操作 MINIX，而这笔费用包含在书籍的费用中。尽管 如此，在那时来说
非常便宜，并且 MINIX 的使用得到迅速发展，很快超过了 Tannebaum 当初使用它来教授操作系统编码的意图。在整个 20 世纪 90 年代，你可以发现 MINIX 安装在世界各个大学里面非常流行。
而此时，年轻的 Lius Torvalds 使用 MINIX 来开发原始 Linux 内核，并于 1991 年首次公布。而后在 1992 年 12 月在 GPL 下发布。

但是等等，这是一篇以*文件系统*为主题的文章不是吗？是的，MINIX 有自己的文件系统，早期的 Linux 版本依赖于它。就像 MINIX 一样，Linux 也可以含糊地被描述为同类的 “玩具” 示例————MINX 文件系统最多能处理
14个字符的文件名，并且只能处理 64MB 的存储空间。到了 1991 年，典型的硬盘尺寸已经达到了 40-140MB。很显然，Linux 需要一个更好的文件系统。

#### ext

当 Linus 开发出刚起步的 Linux 内核时，Rémy Card 开始开发第一个 ext 文件系统。 ext 文件系统在 1992 首次实现并发布 ———— 仅在 Linux 首次发布后的一年! ———— ext 解决了MINIX 
文件系统中最糟糕的问题。

1992年的 ext 使用在 Linux 内核中的新虚拟文件系统（VFS）抽象层。与之前的 MINIX 文件系统不同的是，ext 可以处理高达 2GB 存储空间并处理 255 个字符的文件名。

但 ext 并没有长时间占统治地位，主要是由于它的原始时间戳（每个文件仅有一个时间戳，而不是今天我们所熟悉的 inode 创建、文件访问和文件修改都有三个独立的标记。）仅仅一年后，ext2 就替代了它。

#### ext2

Rémy 很快就意识到 ext 的局限性，所以一年后他设计出 ext2 替代它。虽然 ext 是源自 "玩具”操作系统，但 ext2 从一开始就被设计为一个商业级文件系统，沿用 BSD 的Berkeley 文件系统原则。

Ext2 提供了 TB 级的千兆字节和文件系统规格的最大文件大小，使其在 20 世纪 90 年代牢牢地位于大联盟中。很快它被广泛地使用，无论是在 Linux 内核中还是最终在 MINIX 中，且第三方模块使其可以用于 MacOs 和 Windows。

但这里仍然有一些问题需要解决：ext2 文件系统与 20世纪90年代的大多数文件系统一样，如果在将要写入数据到磁盘的时候，系统发生奔溃或断电，则容易发生灾难性的数据损坏。
随着时间的推移，由于碎片（单个文件存储在多个位置，物理上其分散在旋转的磁盘上），它们也遭受了严重的性能损失。

尽管存在这些问题，但今天 ext2 还是用在某些特殊的情况下 ———— 最常见的是，作为便携式 USB 拇指驱动器的格式。

#### ext3

1998 年, 在 ext2 被采用后的6年后，Stephen Tweedie 宣布他正在致力于改进 ext2。这成了 ext3，并于 2001 年 11 月被 2.4.15 内核版本采用进主线 Linux。


![Packard Bell 计算机][2]

20世纪90年代中期的 Packard Bell 计算机, [Spacekid][3], [CC0][4]

在大部分情况下，Ext2 在 Linux 发行版中做得很好，但像 FAT、FAT32、HFS和当时的其他文件系统一样—— 在断电时容易发生灾难性的破坏。如果在将数据写入文件系统时候发生断电，则可能会将其留在所谓 *不一致* 的状态 —— 

事情只完成一半而另一半未完成。这可能导致大量文件丢失或损坏，这些文件与正在保存的文件无关甚至导致整个文件系统无法卸载。


Ext3 和 20世纪90年代后期的其他文件系统，如微软的 NTFS ，使用*日志*来解决这个问题。 日志是磁盘上的一种特殊分配，其写入是在存储在事务中；如果事务完成写入磁盘，则日志中的数据将提交给
文件系统它本身。如果文件在它提交操作前崩溃，则重新启动的系统识别其为未完成的事务而将其进行回滚，就像从未发生过一样。这意味着正在处理的文件可能依然会丢失，但文件系统本身保持一致，且其他所有数据都是安全的。

在使用 ext3 文件系统的 Linux 内核中实现了三个级别的日志记录方式: **journal** , **ordered** , and **writeback**.

  * **Journal** 是最低风险模式，在将数据和元数据提交给文件系统之前将其写入日志。这可以保证正在写入的文件与整个文件系统的一致性，但其显著降低了性能。
  * **Ordered** 是大多数 Linux 发行版默认是模式；ordered 模式将元数据写入日志且直接将数据提交到文件系统。顾名思义，这里的操作顺序是固定的：首先，元数据提交到日志；其次，数据写入文件系统，然后才将日志中关联的元数据更新到文件系统。这确保了在发生奔溃时，与未整写入相关联的元数据仍在日志汇总，且文件系统可以在回滚日志时清理那些不完整的写入事务。在 ordered 模式下，系统崩溃可能导致在崩溃期间文件被主动写入或损坏，但文件系统它本身 —— 以及未被主动写入的文件 —— 确保是安全的。
  * **Writeback** 是第三种 —— 且最不安全的日志模式。在 writeback 模式下,像 ordered 模式一样，元数据是被记录的，但数据不是。与 ordered 模式不同，元数据和数据都可以以任何有意义的顺序写入以获得最佳性能。这可以显著提高性能，但安全性低很多。尽管 wireteback 模式仍然保证文件系统本身的安全性，但在奔溃或之前写入的文件很容易丢失或损坏。


跟之前的 ext2 类似，ext3 使用 16 位内部寻址。这意味着对于有着 4K 块大小的 ext3 在最大规格为 16TiB 的文件系统中可以处理的最大文件大小为 2TiB。

#### ext4

Theodore Ts'o (是当时 ext3 主要开发人员) 在2006年宣布了 ext4 ,并于两年后在2.6.28内核版本中加入到了 Linux 主线。
Ts’o 将 ext4 描述为一个显著扩展 ext3 的临时技术，但它仍然依赖于旧技术。他预计 ext4 终将会被真正的下一代文件系统所取代。

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/dell_precision_380_workstation.jpeg?itok=3EjYXY2i)

Ext4 在功能上与 Ext3 在功能上非常相似，但大大支持文件系统、提高了对碎片的抵抗力，有更高的性能以及改进了时间戳。

### Ext4 vs ext3

Ext3 和 Ext4 有一些非常明确的差别，在这里集中讨论下。

#### 向后兼容性

Ext4 特地设计为尽可能地向后兼容 ext3。这不仅允许 ext3 文件系统升级到 ext4；也允许 ext4 驱动程序在 ext3 模式下自动挂载 ext3 文件系统，making

因此使它无需单独维护两个代码库。

#### 大文件系统

Ext3 文进系统使用 32 为寻址，将它们限制为 2 个 TiB 文件系统和16个TiB文件系统

（假设一个 4 KiB 块大小；一些 ext3 文件系统使用较小的块大小，因此对其进一步做了限制）。

Ext4 使用48位的内部寻址，理论上可以在文件系统上分配高达 16TiB 的文件，其中最高可达 1000 000 TiB（1EiB）。
有些用户区实用程序仍然将 ext4 早期实现限制为 16TiB文件系统，但截至2011年，e2fsprogs 已经直接支持 >16TiB ext4文件系统。例如，红帽企业 Linux 合同上仅支持最高 50TiB 的 ext4 文件系统，并建议不超过 100TiB的卷。

#### 分配改进

Ext4 在将存储快写入磁盘之前对存储块的分配方式进行了大量改进，这可以显著提高读写性能。

##### 区段（extent）

区段是一系列连续的物理块大小 (最多达 128 MiB，假设是一个 4KiB块大小），可以一次性保留和寻址。使用区段可以减少给定未见所需的 inode 数量，并显著减少碎片并提高写入大文件时的性能。

##### 多块分配

Ext3 为每一个新分配的块调用一次块分配器。当多个编写器同时打开时，这很容易导致严重的碎片。然而，ext4 使用延迟分配，这允许它合并写入并更好地决定如何为尚未提交的写入分配快

##### 持续的预分配

在为文件预分配磁盘空间时，大部分文件系统必须在创建时将零写入该文件的块中。Ext4 允许使用 `fallocate()`，它保证了空间的可用性（并试图为它找到连续的空间），而不需要县写入它。
这显著提高了写入和将来读取流和数据库应用程序的写入数据的性能。

##### 延迟分配

This is a chewy—and contentious—feature. Delayed allocation allows ext4 to wait to allocate the actual blocks it will write data to until it's ready to commit that data to disk. (By contrast, ext3 would allocate blocks immediately, even while the data was still flowing into a write cache.)

Delaying allocation of blocks as data accumulates in cache allows the filesystem to make saner choices about how to allocate those blocks, reducing fragmentation (write and, later, read) and increasing performance significantly. Unfortunately, it increases the potential for data loss in programs that have not been specifically written to call `fsync()` when the programmer wants to ensure data has been flushed entirely to disk.

Let's say a program rewrites a file entirely:

`fd=open("file" ,O_TRUNC); write(fd, data); close(fd);`

With legacy filesystems, `close(fd);` is sufficient to guarantee that the contents of `file` will be flushed to disk. Even though the write is not, strictly speaking, transactional, there's very little risk of losing the data if a crash occurs after the file is closed.

If the write does not succeed (due to errors in the program, errors on the disk, power loss, etc.), both the original version and the newer version of the file may be lost or corrupted. If other processes access the file as it is being written, they will see a corrupted version. And if other processes have the file open and do not expect its contents to change—e.g., a shared library mapped into multiple running programs—they may crash.

To avoid these issues, some programmers avoid using `O_TRUNC` at all. Instead, they might write to a new file, close it, then rename it over the old one:

`fd=open("newfile"); write(fd, data); close(fd); rename("newfile", "file");`

Under filesystems without delayed allocation, this is sufficient to avoid the potential corruption and crash problems outlined above: Since `rename()` is an atomic operation, it won't be interrupted by a crash; and running programs will continue to reference the old, now unlinked version of `file` for as long as they have an open filehandle to it. But because ext4's delayed allocation can cause writes to be delayed and re-ordered, the `rename("newfile","file")` may be carried out before the contents of `newfile` are actually written to disk, which opens the problem of parallel processes getting bad versions of `file` all over again.

To mitigate this, the Linux kernel (since version 2.6.30) attempts to detect these common code cases and force the files in question to be allocated immediately. This reduces, but does not prevent, the potential for data loss—and it doesn't help at all with new files. If you're a developer, please take note: The only way to guarantee data is written to disk immediately is to call `fsync()` appropriately.

#### Unlimited subdirectories

Ext3 was limited to a total of 32,000 subdirectories; ext4 allows an unlimited number. Beginning with kernel 2.6.23, ext4 uses HTree indices to mitigate performance loss with huge numbers of subdirectories.

#### Journal checksumming

Ext3 did not checksum its journals, which presented problems for disk or controller devices with caches of their own, outside the kernel's direct control. If a controller or a disk with its own cache did writes out of order, it could break ext3's journaling transaction order, potentially corrupting files being written to during (or for some time preceding) a crash.

In theory, this problem is resolved by the use of write barriers—when mounting the filesystem, you set `barrier=1` in the mount options, and the device will then honor `fsync()` calls all the way down to the metal. In practice, it's been discovered that storage devices and controllers frequently do not honor write barriers—improving performance (and benchmarks, where they're compared to their competitors) but opening up the possibility of data corruption that should have been prevented.

Checksumming the journal allows the filesystem to realize that some of its entries are invalid or out-of-order on the first mount after a crash. This thereby avoids the mistake of rolling back partial or out-of-order journal entries and further damaging the filesystem—even if the storage devices lie and don't honor barriers.

#### Fast filesystem checks

Under ext3, the entire filesystem—including deleted and empty files—required checking when `fsck` is invoked. By contrast, ext4 marks unallocated blocks and sections of the inode table as such, allowing `fsck` to skip them entirely. This greatly reduces the time to run `fsck` on most filesystems and has been implemented since kernel 2.6.24.

#### Improved timestamps

Ext3 offered timestamps granular to one second. While sufficient for most uses, mission-critical applications are frequently looking for much, much tighter time control. Ext4 makes itself available to those enterprise, scientific, and mission-critical applications by offering timestamps in the nanoseconds.

Ext3 filesystems also did not provide sufficient bits to store dates beyond January 18, 2038. Ext4 adds an additional two bits here, extending [the Unix epoch][5] another 408 years. If you're reading this in 2446 AD, you have hopefully already moved onto a better filesystem—but it'll make me posthumously very, very happy if you're still measuring the time since UTC 00:00, January 1, 1970.

#### Online defragmentation

Neither ext2 nor ext3 directly supported online defragmentation—that is, defragging the filesystem while mounted. Ext2 had an included utility, **e2defrag** , that did what the name implies—but it needed to be run offline while the filesystem was not mounted. (This is, obviously, especially problematic for a root filesystem.) The situation was even worse in ext3—although ext3 was much less likely to suffer from severe fragmentation than ext2 was, running **e2defrag** against an ext3 filesystem could result in catastrophic corruption and data loss.

Although ext3 was originally deemed "unaffected by fragmentation," processes that employ massively parallel write processes to the same file (e.g., BitTorrent) made it clear that this wasn't entirely the case. Several userspace hacks and workarounds, such as [Shake][6], addressed this in one way or another—but they were slower and in various ways less satisfactory than a true, filesystem-aware, kernel-level defrag process.

Ext4 addresses this problem head on with **e4defrag** , an online, kernel-mode, filesystem-aware, block-and-extent-level defragmentation utility.

### Ongoing ext4 development

Ext4 is, as the Monty Python plague victim once said, "not quite dead yet!" Although [its principal developer regards it][7] as a mere stopgap along the way to a truly [next-generation filesystem][8], none of the likely candidates will be ready (due to either technical or licensing problems) for deployment as a root filesystem for some time yet.

There are still a few key features being developed into future versions of ext4, including metadata checksumming, first-class quota support, and large allocation blocks.

#### Metadata checksumming

Since ext4 has redundant superblocks, checksumming the metadata within them offers the filesystem a way to figure out for itself whether the primary superblock is corrupt and needs to use an alternate. It is possible to recover from a corrupt superblock without checksumming—but the user would first need to realize that it was corrupt, and then try manually mounting the filesystem using an alternate. Since mounting a filesystem read-write with a corrupt primary superblock can, in some cases, cause further damage, this isn't a sufficient solution, even with a sufficiently experienced user!

Compared to the extremely robust per-block checksumming offered by next-gen filesystems such as btrfs or zfs, ext4's metadata checksumming is a pretty weak feature. But it's much better than nothing.

Although it sounds like a no-brainer—yes, checksum ALL THE THINGS!—there are some significant challenges to bolting checksums into a filesystem after the fact; see [the design document][9] for the gritty details.

#### First-class quota support

Wait, quotas?! We've had those since the ext2 days! Yes, but they've always been an afterthought, and they've always kinda sucked. It's probably not worth going into the hairy details here, but the [design document][10] lays out the ways quotas will be moved from userspace into the kernel and more correctly and performantly enforced.

#### Large allocation blocks

As time goes by, those pesky storage systems keep getting bigger and bigger. With some solid-state drives already using 8K hardware blocksizes, ext4's current limitation to 4K blocks gets more and more limiting. Larger storage blocks can decrease fragmentation and increase performance significantly, at the cost of increased "slack" space (the space left over when you only need part of a block to store a file or the last piece of a file).

You can view the hairy details in the [design document][11].

### Practical limitations of ext4

Ext4 is a robust, stable filesystem, and it's what most people should probably be using as a root filesystem in 2018. But it can't handle everything. Let's talk briefly about some of the things you shouldn't expect from ext4—now or probably in the future.

Although ext4 can address up to 1 EiB—equivalent to 1,000,000 TiB—of data, you really, really shouldn't try to do so. There are problems of scale above and beyond merely being able to remember the addresses of a lot more blocks, and ext4 does not now (and likely will not ever) scale very well beyond 50-100 TiB of data.

Ext4 also doesn't do enough to guarantee the integrity of your data. As big an advancement as journaling was back in the ext3 days, it does not cover a lot of the common causes of data corruption. If data is [corrupted][12] while already on disk—by faulty hardware, impact of cosmic rays (yes, really), or simple degradation of data over time—ext4 has no way of either detecting or repairing such corruption.

Building on the last two items, ext4 is only a pure filesystem, and not a storage volume manager. This means that even if you've got multiple disks—and therefore parity or redundancy, which you could theoretically recover corrupt data from—ext4 has no way of knowing that or using it to your benefit. While it's theoretically possible to separate a filesystem and storage volume management system in discrete layers without losing automatic corruption detection and repair features, that isn't how current storage systems are designed, and it would present significant challenges to new designs.

### Alternate filesystems

Before we get started, a word of warning: Be very careful with any alternate filesystem which isn't built into and directly supported as a part of your distribution's mainline kernel!

Even if a filesystem is safe, using it as the root filesystem can be absolutely terrifying if something hiccups during a kernel upgrade. If you aren't extremely comfortable with the idea of booting from alternate media and poking manually and patiently at kernel modules, grub configs, and DKMS from a chroot... don't go off the reservation with the root filesystem on a system that matters to you.

There may well be good reasons to use a filesystem your distro doesn't directly support—but if you do, I strongly recommend you mount it after the system is up and usable. (For example, you might have an ext4 root filesystem, but store most of your data on a zfs or btrfs pool.)

#### XFS

XFS is about as mainline as a non-ext filesystem gets under Linux. It's a 64-bit, journaling filesystem that has been built into the Linux kernel since 2001 and offers high performance for large filesystems and high degrees of concurrency (i.e., a really large number of processes all writing to the filesystem at once).

XFS became the default filesystem for Red Hat Enterprise Linux, as of RHEL 7. It still has a few disadvantages for home or small business users—most notably, it's a real pain to resize an existing XFS filesystem, to the point it usually makes more sense to create another one and copy your data over.

While XFS is stable and performant, there's not enough of a concrete end-use difference between it and ext4 to recommend its use anywhere that it isn't the default (e.g., RHEL7) unless it addresses a specific problem you're having with ext4, such as >50 TiB capacity filesystems.

XFS is not in any way a "next-generation" filesystem in the ways that ZFS, btrfs, or even WAFL (a proprietary SAN filesystem) are. Like ext4, it should most likely be considered a stopgap along the way towards [something better][8].

#### ZFS

ZFS was developed by Sun Microsystems and named after the zettabyte—equivalent to 1 trillion gigabytes—as it could theoretically address storage systems that large.

A true next-generation filesystem, ZFS offers volume management (the ability to address multiple individual storage devices in a single filesystem), block-level cryptographic checksumming (allowing detection of data corruption with an extremely high accuracy rate), [automatic corruption repair][12] (where redundant or parity storage is available), rapid [asynchronous incremental replication][13], inline compression, and more. [A lot more][14].

The biggest problem with ZFS, from a Linux user's perspective, is the licensing. ZFS was licensed CDDL, which is a semi-permissive license that conflicts with the GPL. There is a lot of controversy over the implications of using ZFS with the Linux kernel, with opinions ranging from "it's a GPL violation" to "it's a CDDL violation" to "it's perfectly fine, it just hasn't been tested in court." Most notably, Canonical has included ZFS code inline in its default kernels since 2016 without legal challenge so far.

At this time, even as a very avid ZFS user myself, I would not recommend ZFS as a root Linux filesystem. If you want to leverage the benefits of ZFS on Linux, set up a small root filesystem on ext4, then put ZFS on your remaining storage, and put data, applications, whatever you like on it—but keep root on ext4, until your distribution explicitly supports a zfs root.

#### btrfs

Btrfs—short for B-Tree Filesystem, and usually pronounced "butter"—was announced by Chris Mason in 2007 during his tenure at Oracle. Btrfs aims at most of the same goals as ZFS, offering multiple device management, per-block checksumming, asynchronous replication, inline compression, and [more][8].

As of 2018, btrfs is reasonably stable and usable as a standard single-disk filesystem but should probably not be relied on as a volume manager. It suffers from significant performance problems compared to ext4, XFS, or ZFS in many common use cases, and its next-generation features—replication, multiple-disk topologies, and snapshot management—can be pretty buggy, with results ranging from catastrophically reduced performance to actual data loss.

The ongoing status of btrfs is controversial; SUSE Enterprise Linux adopted it as its default filesystem in 2015, whereas Red Hat announced it would no longer support btrfs beginning with RHEL 7.4 in 2017. It is probably worth noting that production, supported deployments of btrfs use it as a single-disk filesystem, not as a multiple-disk volume manager a la ZFS—even Synology, which uses btrfs on its storage appliances, but layers it atop conventional Linux kernel RAID (mdraid) to manage the disks.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/ext4-filesystem

作者：[Jim Salter][a]
译者：[译者ID](https://github.com/HardworkFish)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jim-salter
[1]:https://opensource.com/file/391546
[2]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/packard_bell_pc.jpg?itok=VI8dzcwp (Packard Bell computer)
[3]:https://commons.wikimedia.org/wiki/File:Old_packard_bell_pc.jpg
[4]:https://creativecommons.org/publicdomain/zero/1.0/deed.en
[5]:https://en.wikipedia.org/wiki/Unix_time
[6]:https://vleu.net/shake/
[7]:http://www.linux-mag.com/id/7272/
[8]:https://arstechnica.com/information-technology/2014/01/bitrot-and-atomic-cows-inside-next-gen-filesystems/
[9]:https://ext4.wiki.kernel.org/index.php/Ext4_Metadata_Checksums
[10]:https://ext4.wiki.kernel.org/index.php/Design_For_1st_Class_Quota_in_Ext4
[11]:https://ext4.wiki.kernel.org/index.php/Design_for_Large_Allocation_Blocks
[12]:https://en.wikipedia.org/wiki/Data_degradation#Visual_example_of_data_degradation
[13]:https://arstechnica.com/information-technology/2015/12/rsync-net-zfs-replication-to-the-cloud-is-finally-here-and-its-fast/
[14]:https://arstechnica.com/information-technology/2014/02/ars-walkthrough-using-the-zfs-next-gen-filesystem-on-linux/
