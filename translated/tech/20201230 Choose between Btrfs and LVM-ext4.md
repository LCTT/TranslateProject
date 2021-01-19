[#]: collector: (lujun9972)
[#]: translator: (Chao-zhi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Choose between Btrfs and LVM-ext4)
[#]: via: (https://fedoramagazine.org/choose-between-btrfs-and-lvm-ext4/)
[#]: author: (Troy Curtis Jr https://fedoramagazine.org/author/troycurtisjr/)

 Btrfs 和 LVM-ext4 该如何选择？
======

![][1]

图片来自 [Raul Petri][2] 发表在 [Unsplash][3]

[Fedora 33][4] 在桌面版本 [Btrfs][5] 中引入了新的默认文件系统。多年以来，Fedora 一直在 [Logical Volume Manager（LVM）][7] 卷之上使用 [ext4][6]，引入 Brtfs 对 Fedora 来说是一个很大的转变。更改默认文件系统需要[令人信服的原因 ][8]。虽然 Btrfs 是令人兴奋的下一代文件系统，但 LVM 上的 ext4 已经建立并稳定。本指南旨在探索每种功能的高级特性，并使其更容易在 Btrfs 和 LVM-ext4 之间进行选择。

### 先说结论

最简单的建议是坚持使用默认值。全新的 Fedora 33 安装默认为 Btrfs，升级之前的 Fedora 版本将继续使用最初安装的版本，通常是 lvm-ext4。对于现有的 Fedora 用户来说，获取 Btrfs 的最简单方式是全新安装。然而，全新安装比简单升级更具破坏性。除非有特殊需要，否则这种干扰可能是不必要的。Fedora 开发团队仔细考虑了这两个缺省值，因此对任何一个选择都要有信心。

### 那么所有其他文件系统呢？

现在有很多 [Linux 系统的文件系统 ][9]。在添加卷管理器、加密方法和存储机制的组合后，这一数字呈爆炸式增长。那么，为什么要关注 btrfs 和 lvm-ext4 呢？对于 Fedora 的用户来说，这两种设置可能是最常见的。LVM 之上的 ext4 成为 Fedora 11 中的默认磁盘布局，在此之前则使用的是 ext3。

既然 Btrfs 是 Fedora 33 的默认设置，那么绝大多数现有用户将会考虑是应该原地踏步还是向前更新。面对全新的 Fedora 33 安装，有经验的 Linux 用户可能会想知道是使用这个新的文件系统，还是退回到他们熟悉的文件系统。因此，在众多可能的存储选项中，许多 Fedora 用户会想知道如何在 Btrfs 和 lvm-ext4 之间进行选择。

### 两者的共性

尽管两个设置之间存在核心差异，但 Btrfs 和 lvm-ext4 实际上有很多共同之处。两者都是成熟且经过充分测试的存储技术。从 Fedora Core 的早期开始，LVM 就一直在使用，ext4 在 2009 年成为 Fedora 11 的默认版本 [10]。Btrfs 在 2009 年并入主流 Linux 内核，并且 [Facebook 广泛使用该文件系统 ][11]。SUSE Linux Enterprise 12 使其成为 [2014 年的默认版本 ][12]。因此，他们在生产力工具上都有充分的运行时间。

这两个系统都能很好地防止因意外停电而导致的文件系统损坏，尽管它们的实现方式不同。支持的配置包括使用单个驱动器和跨多个磁盘驱动器，并且这两种配置都能够创建近乎即时的快照。通过命令行和图形界面，存在多种工具来帮助管理这两个系统。这两种解决方案在家用台式机和高端服务器上都同样有效。

### LVM-ext4 的优势。

![LVM 上 ext4 的结构 ][13]。

[ext4 文件系统 ][14] 专注于高性能和可伸缩性，没有太多额外的花哨之处。它在很长一段时间内有效地防止碎片化，并提供了[很好的工具 ][15] 来判断何时出现碎片化。Ext4 是坚如磐石的，因为它构建在以前的 ext3 文件系统之上，带来了多年的系统内测试和错误修复。

Lvm-ext4 设置中的大多数高级功能都来自 LVM 本身。LVM 位于文件系统的“下方”，这意味着它支持任何文件系统。逻辑卷 （LV） 是通用的块设备，因此[虚拟机可以直接使用它们。][16] 这种灵活性允许每个逻辑卷使用正确的文件系统和正确的选项，以应对各种情况。这种分层方法还遵循了小工具协同工作的 Unix 理念。

硬件的[卷组 ][17]（VG） 抽象允许 LVM 创建灵活的逻辑卷。每个 LV 从同一存储池拉入，但具有自己的配置。调整卷的大小比调整物理分区的大小容易得多，因为数据的有序放置没有限制。LVM [物理卷 ][18]（PV） 可以是任意数量的分区，甚至可以在系统运行时在设备之间移动。

LVM 支持只读和读写[快照 ][19]，这使得从活动系统创建一致的备份变得很容易。每个快照都有一个定义的大小，更改源卷或快照卷将占用其中的空间。又或者，逻辑卷也可以是[精简资源调配池 ][20] 的一部分。这允许快照自动使用池中的数据，而不是使用在创建卷时定义的固定大小的区块。

#### 有多个磁盘驱动器的 LVM

当有多个设备时，LVM 确实会焕发能量。它具有对大多数 [RAID 级别 ][21] 的本地支持，每个逻辑卷可以具有不同的 RAID 级别。LVM 将自动为 RAID 配置选择适当的物理设备，或者用户可以直接指定它。基本的 RAID 支持包括用于性能的数据分条 （[RAID0][22]） 和用于冗余的镜像 （[RAID1][23]）。逻辑卷也可以使用 [RAID5][24]，[RAID6][25] 和 [RAID10][26] 等高级设置。LVM RAID 支持已经成熟，因为 LVM 在后台使用了 [mdadm][29] 使用的相同的 [device-mapper（dm）][27] 和 [multi-device（md）][28] 内核支持。

对于具有快速和慢速驱动器的系统，逻辑卷也可以是[缓存的卷 ][30]。经典示例是 SSD 和传统磁盘驱动器的组合。高速缓存的卷使用更快的驱动器来存储更频繁访问的数据（或用作写缓存），而慢速的驱动器使用批量数据。

LVM 中大量稳定的功能以及 ext4 的可靠性在既往的使用中早已被证明了。当然，具有更多功能会带来复杂性。在配置 LVM 时，为正确的功能找到正确的选项可能具有挑战性。对于单驱动器台式机系统，LVM 的功能（例如 RAID 和缓存卷）不适用。但是，逻辑卷比物理分区更灵活，快照也很有用。对于正常的桌面使用，LVM 的复杂性会成为常见的用户从可能遇到的问题中恢复的障碍。

### Btrfs 的优势

![Btrfs 结构 ][31]

从前几代文件系统中学到的经验指导了 [Btrfs][5] 内置的功能的设计。与 ext4 不同，它可以直接跨越多个设备，因此它具有通常仅在卷管理器中才能找到的功能。它还具有 Linux 文件系统空间中独有的功能 （[ZFS][32] 具有相似的功能集，但[不要在 Linux 内核中期望它 ][33]）。

#### Btrfs 的主要功能

也许最重要的功能是所有数据的校验和。校验和与写时复制一起提供了 [key 方法 ][34]，可确保在意外断电后确保文件系统的完整性。更独特的是，校验和可以检测数据本身中的错误。悄然的数据损坏（有时也称为 [bitrot][35]） 是大多数人意识到的更常见的现象。没有主动验证，损坏最终可能会传播到所有可用备份。这使用户没有有效的副本。通过透明地校验所有数据，Btrfs 能够立即检测到任何此类损坏。启用正确的 [dup 或 raid 选项 ][36]，文件系统也可以透明地修复损坏。

[写入时复制 ][37]（COW） 也是 Btrfs 的基本功能，因为它在提供文件系统完整性和即时子卷快照方面至关重要。从通用子卷创建快照后，快照会自动共享基础数据。另外，事后[重复数据删除 ][38] 使用相同的技术来消除相同的数据块。单个文件可以通过使用 [reflink 选项 ][39] 调用 _cp_ 来使用 COW 功能。Reflink 副本对于复制大型文件（例如虚拟机映像）特别有用，例如，随着时间的流逝，这些文件通常具有几乎相同的数据。

Btrfs 支持跨多个设备，而无需卷管理器。多设备支持可解锁数据镜像以实现冗余，而条带化则可提高性能。实验上还支持更高级的 RAID 级别，例如 [RAID 5][24] 和 [RAID 6][25]。与标准 RAID 设置不同，Btrfs _raid1_ 选项实际上允许奇数个设备。例如，即使它们的大小不同，它也可以使用 3 个设备。

所有 RAID 和 dup 选项都在文件系统级别指定。因此，各个子卷不能使用不同的选项。请注意，将 RAID 1 选项与多个设备一起使用意味着即使一个设备发生故障，并且校验和功能仍可保持数据本身的完整性，卷中的所有数据均可用。这超出了当前典型的 RAID 设置所能提供的范围。

#### 附加功能

Btrfs 还支持快速简便的远程备份。子卷快照可以[发送到远程系统 ][40] 进行存储。通过利用文件系统中固有的 COW 元数据，这些传输通过仅发送先前发送的快照中的增量更改而非常有效。诸如 [snapper][41] 之类的用户应用程序使管理这些快照变得容易。

另外，Btrfs 卷可以具有[透明压缩 ][42]，并且 _ [chattr + c][43] _ 将标记单个文件或目录以进行压缩。压缩不仅可以减少数据消耗的空间，还可以通过减少写入操作量来帮助延长 SSD 的寿命。压缩当然会带来额外的 CPU 开销，但是有很多选项可用于权衡取舍。

Btrfs 集成了文件系统和卷管理器功能，这意味着总体维护比 LVM-ext4 更简单。当然，这种集成的灵活性较低，但是对于大多数台式机甚至服务器而言，设置已足够。

### LVM 上使用 Btrfs

Btrfs 可以[就地转换 ext3/ext4 文件系统 ][44]。就地转换意味着没有数据可以复制出来然后再返回。数据块本身甚至都没有被修改。结果，现有 LVM-ext4 系统的一种选择是将 LVM 保留在原处，然后简单地将 ext4 转换为 Btrfs。虽然可行且受支持，但有一些原因使它不是最佳选择。

Btrfs 的吸引力之一是与卷管理器集成的文件系统附带的更轻松的管理。通过在 LVM 之上运行，还可以使用其他卷管理器来进行任何系统维护。同样，LVM 设置通常具有多个具有独立文件系统的固定大小的逻辑卷。虽然 Btrfs 在给定的计算机上支持多个卷，但是许多不错的功能都希望单个卷具有多个子卷。如果每个 LVM 卷都有一个独立的 Btrfs 卷，则用户仍然无法手动管理固定大小的 LVM 卷。但是，收缩挂载的 Btrfs 文件系统的能力确实使处理固定大小的卷的工作变得更轻松。通过在线收缩，无需启动[实时镜像 ][45]。

使用 Btrfs 的多设备支持时，必须仔细考虑逻辑卷的物理位置。对于 Btrfs 而言，每个 LV 都是一个单独的物理设备，如果实际情况并非如此，则某些数据可用性功能可能会做出错误的决定。例如，如果单个驱动器发生故障，对数据使用 _raid1_ 通常可以提供保护。如果实际逻辑卷在同一物理设备上，则没有冗余。

如果强烈需要某些特定的 LVM 功能，例如原始块设备或高速缓存的逻辑卷，则在 LVM 之上运行 Btrfs 是有意义的。在这种配置下，Btrfs 仍然提供其大多数优点，例如校验和和易于发送的增量快照。尽管使用 LVM 会产生一些操作开销，但 Btrfs 的这种开销并不比任何其他文件系统大。

### 总结

当尝试在 Btrfs 和 LVM-ext4 之间进行选择时，没有一个正确的答案。每个用户都有独特的要求，并且同一用户可能拥有具有不同需求的不同系统。看一下每个配置的功能集，并确定是否有令人心动的功能。如果没有，坚持默认值没有错。选择这两种设置都有很好的理由。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/choose-between-btrfs-and-lvm-ext4/

作者：[Troy Curtis Jr][a]
选题：[lujun9972][b]
译者：[Chao-zhi](https://github.com/Chao-zhi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/troycurtisjr/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/12/btrfs-lvm-ext4-816x345.jpg
[2]: https://unsplash.com/@raulpetri?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://fedoramagazine.org/announcing-fedora-33/
[5]: https://btrfs.wiki.kernel.org/index.php/Main_Page
[6]: https://ext4.wiki.kernel.org/index.php/Main_Page
[7]: https://man7.org/linux/man-pages/man8/lvm.8.html
[8]: https://fedoraproject.org/wiki/Changes/BtrfsByDefault
[9]: https://man7.org/linux/man-pages/man5/filesystems.5.html
[10]: https://docs.fedoraproject.org/en-US/Fedora/11/html/Release_Notes/index.html#sect-Release_Notes-Fedora_11_Overview
[11]: https://facebookmicrosites.github.io/btrfs/docs/btrfs-facebook.html
[12]: https://www.suse.com/releasenotes/x86_64/SUSE-SLES/12/#fate-317221
[13]: https://fedoramagazine.org/wp-content/uploads/2020/12/ext4-on-LVM.jpg
[14]: https://opensource.com/article/18/4/ext4-filesystem
[15]: https://man7.org/linux/man-pages/man8/e4defrag.8.html
[16]: https://libvirt.org/storage.html#StorageBackendLogical
[17]: https://www.redhat.com/sysadmin/create-volume-group
[18]: https://www.redhat.com/sysadmin/create-physical-volume
[19]: https://tldp.org/HOWTO/LVM-HOWTO/snapshotintro.html
[20]: https://man7.org/linux/man-pages/man7/lvmthin.7.html
[21]: https://rhea.dev/articles/2018-08/LVM-RAID-on-Fedora
[22]: https://en.wikipedia.org/wiki/Standard_RAID_levels#RAID_0
[23]: https://en.wikipedia.org/wiki/Standard_RAID_levels#RAID_1
[24]: https://en.wikipedia.org/wiki/Standard_RAID_levels#RAID_5
[25]: https://en.wikipedia.org/wiki/Standard_RAID_levels#RAID_6
[26]: https://en.wikipedia.org/wiki/Non-standard_RAID_levels#Linux_MD_RAID_10
[27]: https://man7.org/linux/man-pages/man8/dmsetup.8.html
[28]: https://man7.org/linux/man-pages/man4/md.4.html
[29]: https://fedoramagazine.org/managing-raid-arrays-with-mdadm/
[30]: https://man7.org/linux/man-pages/man7/lvmcache.7.html
[31]: https://fedoramagazine.org/wp-content/uploads/2020/12/Btrfs-Volume.jpg
[32]: https://en.wikipedia.org/wiki/ZFS
[33]: https://itsfoss.com/linus-torvalds-zfs/
[34]: https://btrfs.wiki.kernel.org/index.php/FAQ#Can_I_have_nodatacow_.28or_chattr_.2BC.29_but_still_have_checksumming.3F
[35]: https://arstechnica.com/information-technology/2014/01/bitrot-and-atomic-cows-inside-next-gen-filesystems/
[36]: https://man7.org/linux/man-pages/man8/mkfs.btrfs.8.html#DUP_PROFILES_ON_A_SINGLE_DEVICE
[37]: https://en.wikipedia.org/wiki/Copy-on-write
[38]: https://btrfs.wiki.kernel.org/index.php/Deduplication
[39]: https://btrfs.wiki.kernel.org/index.php/UseCases#How_do_I_copy_a_large_file_and_utilize_COW_to_keep_it_from_actually_being_copied.3F
[40]: https://fedoramagazine.org/btrfs-snapshots-backup-incremental/
[41]: http://snapper.io/
[42]: https://btrfs.wiki.kernel.org/index.php/Compression
[43]: https://www.man7.org/linux/man-pages/man1/chattr.1.html
[44]: https://btrfs.wiki.kernel.org/index.php/Conversion_from_Ext3
[45]: https://fedoramagazine.org/reclaim-hard-drive-space-with-lvm/
