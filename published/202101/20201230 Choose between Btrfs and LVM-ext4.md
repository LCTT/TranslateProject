[#]: collector: (lujun9972)
[#]: translator: (Chao-zhi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13043-1.html)
[#]: subject: (Choose between Btrfs and LVM-ext4)
[#]: via: (https://fedoramagazine.org/choose-between-btrfs-and-lvm-ext4/)
[#]: author: (Troy Curtis Jr https://fedoramagazine.org/author/troycurtisjr/)

Btrfs 和 LVM-ext4 该如何选择？
======

![](https://img.linux.net.cn/data/attachment/album/202101/23/133137m2wfkiq8ykyvwyhv.jpg)

[Fedora 33][4] 在其各类桌面版本中引入了新的默认文件系统 [Btrfs][5]。多年以来，Fedora 一直在 <ruby>[逻辑卷管理][7]<rt>Logical Volume Manager</rt></ruby>（LVM） 卷之上使用 [ext4][6]，引入 Brtfs 对 Fedora 来说是一个很大的转变。更改默认文件系统需要 [令人信服的原因][8]。虽然 Btrfs 是令人兴奋的下一代文件系统，但 LVM 上的 ext4 是成熟而稳定的。本指南旨在探索各自的高级特性，使得更容易在 Btrfs 和 LVM-ext4 之间进行选择。

### 先说结论

最简单的建议是坚持使用默认值。全新安装的 Fedora 33 环境默认为 Btrfs，升级之前的 Fedora 版本将继续使用最初安装的设置，通常是 LVM-ext4。对于现有的 Fedora 用户来说，获取 Btrfs 的最简单方式是全新安装。然而，全新安装比简单升级更具破坏性。除非有特殊需要，否则这种干扰可能是不必要的。Fedora 开发团队仔细考虑了这两个默认值，因此对任何一个选择都要有信心。

### 那么其他文件系统呢？

现在有很多 [Linux 系统的文件系统][9]。在加上卷管理器、加密方法和存储机制的组合后，这一数字呈爆炸式增长。那么，为什么要关注 btrfs 和 LVM-ext4 呢？对于 Fedora 的用户来说，这两种设置可能是最常见的。在 Fedora 11 中，LVM 之上的 ext4 成为了默认磁盘布局，在此之前则使用的是 ext3。

既然 Btrfs 是 Fedora 33 的默认设置，那么绝大多数现有用户会考虑是应该原地踏步还是向前跳跃。面对全新安装的 Fedora 33 环境，有经验的 Linux 用户可能会想知道是使用这个新的文件系统，还是退回到他们熟悉的文件系统。因此，在众多可能的存储选项中，许多 Fedora 用户会想知道如何在 Btrfs 和 LVM-ext4 之间进行选择。

### 两者的共性

尽管两个文件系统之间存在核心差异，但 Btrfs 和 LVM-ext4 实际上有很多共同之处。两者都是成熟且经过充分测试的存储技术。从 Fedora Core 的早期开始，就一直在使用 LVM，而 ext4 在  [2009 年成为 Fedora 11 的默认设置][10]。Btrfs 在 2009 年并入 Linux 主线内核，并且  [Facebook 广泛使用了该文件系统][11]。SUSE Linux Enterprise 12 [在 2014 年使其成为默认文件系统][12]。因此，它在生产环境中也有着长久的运行时间。

这两个系统都能很好地防止因意外停电而导致的文件系统损坏，尽管它们的实现方式不同。它们支持的配置包括使用单盘设置和跨越多个设备，并且这两种配置都能够创建近乎即时的快照。有各种工具可以帮助管理这两种系统，包括命令行和图形界面。这两种解决方案在家用台式机和高端服务器上都同样有效。

### LVM-ext4 的优势

![LVM 上 ext4 的结构][13]

[ext4 文件系统][14] 专注于高性能和可伸缩性，没有太多额外的花哨之处。它能有效地防止长时间后的碎片化，并当碎片化出现后提供了 [很好的工具][15]。ext4 之所以坚如磐石，是因为它构建在前代的 ext3 文件系统之上，带来了多年的系统内测试和错误修复。

LVM-ext4 环境中的大多数高级功能都来自 LVM 本身。LVM 位于文件系统的“下方”，这意味着它支持任何文件系统。<ruby>逻辑卷<rt>Logical volume</rt></ruby>（LV）是通用的块设备，因此 [虚拟机可以直接使用它们][16]。这种灵活性使得每个逻辑卷都可以使用合适的文件系统，用合适的选项应对各种情况。这种分层方法还遵循了“小工具协同工作”的 Unix 哲学。

从硬件抽象出来的<ruby>[卷组][17]<rt>volume group</rt></ruby>（VG）允许 LVM 创建灵活的逻辑卷。每个逻辑卷都提取自同一个存储池，但具有自己的设置。调整卷的大小比调整物理分区的大小容易得多，因为没有数据有序放置的限制。LVM <ruby>[物理卷][18]<rt>physical volume</rt></ruby>（PV）可以是任意数量的分区，甚至可以在系统运行时在设备之间移动。

LVM 支持只读和读写的 [快照][19]，这使得从活动系统创建一致的备份变得很容易。每个快照都有一个定义的大小，更改源卷或快照卷将占用其中的空间。又或者，逻辑卷也可以是<ruby>[稀疏配置池][20]<rt>thinly provisioned pool</rt></ruby>的一部分。这允许快照自动使用池中的数据，而不是使用在创建卷时定义的固定大小的块。

#### 有多个磁盘驱动器的 LVM

当有多个设备时，LVM 才真正大放异彩。它原生支持大多数 [RAID 级别][21]，每个逻辑卷可以具有不同的 RAID 级别。LVM 将自动为 RAID 配置选择适当的物理设备，或者用户可以直接指定它。基本的 RAID 支持包括用于性能的数据条带化（[RAID0][22]）和用于冗余的镜像（[RAID1][23]）。逻辑卷也可以使用 [RAID5][24]、[RAID6][25] 和 [RAID10][26] 等高级设置。LVM RAID 支持已经成熟，因为 LVM 在底层使用的 [设备映射器（dm）][27] 和 [多设备（md）][28] 内核支持， 与 [mdadm][29] 使用的一样。

对于具有快速和慢速驱动器的系统，逻辑卷也可以是 [缓存卷][30]。经典示例是 SSD 和传统磁盘驱动器的组合。缓存卷使用较快的驱动器来存储更频繁访问的数据（或用作写缓存），而慢速的驱动器则用于处理大量数据。

LVM 中大量稳定的功能以及 ext4 的可靠性在既往的使用中早已被证明了。当然，功能越多就越复杂。在配置 LVM 时，要找到合适的功能选项是很有挑战性的。对于单驱动器的台式机系统，LVM 的功能（例如 RAID 和缓存卷）不适用。但是，逻辑卷比物理分区更灵活，快照也很有用。对于正常的桌面使用，LVM 的复杂性会成为典型的用户可能遇到的问题恢复的障碍。

### Btrfs 的优势

![Btrfs 结构][31]

从前几代文件系统中学到的经验指导了构建到 [Btrfs][5] 的功能设计。与 ext4 不同，它可以直接跨越多个设备，因此它具有通常仅在卷管理器中才能找到的功能。它还具有 Linux 文件系统空间中独有的功能（[ZFS][32] 具有相似的功能集，但[不要指望它在 Linux 内核中出现][33]）。

#### Btrfs 的主要功能

也许最重要的功能是对所有数据进行<ruby>校验和<rt>checksumming</rt></ruby>。校验和与<ruby>[写时复制][37]<rt>copy-on-write</rt></ruby>（COW）一起，提供了在意外断电后确保文件系统完整性的 [关键方法][34]。更独特的是，校验和可以检测数据本身中的错误。悄然的数据损坏（有时也称为 [bitrot][35]）比大多数人意识到的更常见。如果没有主动验证，损坏最终可能会传播到所有可用的备份中。这使得用户没有有效的副本。通过透明地校验所有数据，Btrfs 能够立即检测到任何此类损坏。启用正确的 [dup 或 raid 选项][36]，文件系统也可以透明地修复损坏。

写时复制也是 Btrfs 的基本功能，因为它在提供文件系统完整性和即时子卷快照方面至关重要。从公共子卷创建快照后，快照会自动共享底层数据。另外，事后的<ruby>[重复数据删除][38]<rt>deduplication</rt></ruby> 使用相同的技术来消除相同的数据块。单个文件可以通过使用  `cp` 的 [reflink 选项][39] 来使用 COW 功能。reflink 副本对于复制大型文件（例如虚拟机镜像）特别有用，这些文件往往随着时间的推移具有大部分相同的数据。

Btrfs 支持跨越多个设备，而无需卷管理器。多设备支持可提供数据镜像功能以实现冗余和条带化以提高性能。此外，还实验性地支持更高级的 RAID 级别，例如 [RAID 5][24] 和 [RAID 6][25]。与标准 RAID 设置不同，Btrfs 的 RAID1 实际上允许奇数个设备。例如，它可以使用 3 个设备，即使它们的大小不同。

所有 RAID 和 dup 选项都是在文件系统级别指定的。因此，各个子卷不能使用不同的选项。请注意，使用多设备的 RAID1 选项意味着即使一个设备发生故障，卷中的所有数据都是可用的，并且校验功能可以保持数据本身的完整性。这超出了当前典型的 RAID 设置所能提供的范围。

#### 附加功能

Btrfs 还支持快速简便的远程备份。子卷快照可以 [发送到远程系统][40] 进行存储。通过利用文件系统中固有的 COW 元数据，这些传输通过仅发送先前发送的快照中的增量更改而非常有效。诸如 [snapper][41] 之类的用户应用程序使管理这些快照变得容易。

另外，Btrfs 卷可以具有 [透明压缩][42] 功能，并且 [chattr +c][43] 可以标记进行压缩的单个文件或目录。压缩不仅可以减少数据消耗的空间，还可以通过减少写入操作量来帮助延长 SSD 的寿命。压缩当然会带来额外的 CPU 开销，但是有很多选项就可以权衡取舍。

Btrfs 集成了文件系统和卷管理器功能，这意味着总体维护比 LVM-ext4 更简单。当然，这种集成的灵活性较低，但是对于大多数台式机甚至服务器而言，设置已足够。

### LVM 上使用 Btrfs

Btrfs 可以 [就地转换 ext3/ext4 文件系统][44]。就地转换意味着无需将数据复制出来然后再复制回去。数据块本身甚至都不需要修改。因此，对于现有的 LVM-ext4 系统，一种选择是将 LVM 保留在原处，然后简单地将 ext4 转换为 Btrfs。虽然可行且受支持，但有一些原因使它不是最佳选择。

Btrfs 的吸引力之一是与卷管理器集成的文件系统所带来的更轻松的管理。要是在 LVM 之上运行，对于系统维护，仍然要对额外的卷管理器进行一些设置。同样，LVM 设置通常具有多个固定大小的逻辑卷，并具有独立文件系统。虽然 Btrfs 支持给定的计算机上的多个卷，但是许多不错的功能都需要单一卷具有多个子卷。如果每个 LVM 卷都有一个独立的 Btrfs 卷，则用户仍然需要手动管理固定大小的 LVM 卷。虽然能够收缩挂载的 Btrfs 文件系统的能力确实使处理固定大小的卷的工作变得更轻松。通过在线收缩功能，就无需启动 [实时镜像][45] 了。

在使用 Btrfs 的多设备支持时，必须仔细考虑逻辑卷的物理位置。对于 Btrfs 而言，每个逻辑卷都是一个单独的物理设备，如果实际情况并非如此，则某些数据可用性功能可能会做出错误的决定。例如，如果单个驱动器发生故障，对数据使用 RAID1 通常可以提供保护。如果实际逻辑卷在同一物理设备上，则没有冗余。

如果强烈需要某些特定的 LVM 功能，例如原始块设备或高速缓存的逻辑卷，则在 LVM 之上运行 Btrfs 是有意义的。在这种配置下，Btrfs 仍然提供其大多数优点，例如校验和和易于发送的增量快照。尽管使用 LVM 会产生一些操作开销，但 Btrfs 的这种开销并不比任何其他文件系统大。

### 总结

当尝试在 Btrfs 和 LVM-ext4 之间进行选择时，没有一个正确的答案。每个用户都有独特的要求，并且同一用户可能拥有具有不同需求的不同系统。看一下每个配置的功能集，并确定是否有令人心动的功能。如果没有，坚持默认值没有错。选择这两种设置都有很好的理由。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/choose-between-btrfs-and-lvm-ext4/

作者：[Troy Curtis Jr][a]
选题：[lujun9972][b]
译者：[Chao-zhi](https://github.com/Chao-zhi)
校对：[wxy](https://github.com/wxy)

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
