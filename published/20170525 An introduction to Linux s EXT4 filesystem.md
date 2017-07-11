Linux 的 EXT4 文件系统的历史、特性以及最佳实践
============================================================

> 让我们大概地从 EXT4 的历史、特性以及最佳实践这几个方面来学习它和之前的几代 EXT 文件系统有何不同。

在之前关于 Linux 文件系统的文章里，我写过一篇 [Linux 文件系统介绍][12] 和一些更高级的概念例如 [一切都是文件][13]。现在我想要更深入地了解 EXT 文件系统的特性的详细内容，但是首先让我们来回答一个问题，“什么样才算是一个文件系统 ？” 一个文件系统应该涵盖以下所有特点：

1. **数据存储：** 对于任何一个文件系统来说，一个最主要的功能就是能够被当作一个结构化的容器来存储和获取数据。
2. **命名空间：** 命名空间是一个提供了用于命名与组织数据的命名规则和数据结构的方法学。
3. **安全模型：** 一个用于定义访问权限的策略。
4. **API：** 操作这个系统的对象的系统功能调用，这些对象诸如目录和文件。
5. **实现：** 能够实现以上几点的软件。

本文内容的讨论主要集中于上述几点中的第一项，并探索为一个 EXT 文件系统的数据存储提供逻辑框架的元数据结构。

### EXT 文件系统历史

虽然 EXT 文件系统是为 Linux 编写的，但其真正起源于 Minix 操作系统和 Minix 文件系统，而 Minix 最早发布于 1987，早于 Linux 5 年。如果我们从 EXT 文件系统大家族的 Minix 起源来观察其历史与技术发展那么理解 EXT4 文件系统就会简单得多。

### Minix

当 Linux Torvalds 在写最初的 Linux 内核的时候，他需要一个文件系统但是他又不想自己写一个。于是他简单地把 [Minix 文件系统][14] 加了进去，这个 Minix 文件系统是由 [Andrew S. Tanenbaum][15] 写的，同时它也是 Tanenbaum 的 Minix 操作系统的一部分。[Minix][16] 是一个类 Unix 风格的操作系统，最初编写它的原因是用于教育用途。Minix 的代码是自由可用的并有适当的许可协议，所以 Torvalds 可以把它用 Linux 的最初版本里。

Minix 有以下这些结构，其中的大部分位于生成文件系统的分区中：

* [**引导扇区**][6] 是硬盘安装后的第一个扇区。这个引导块包含了一个非常小的引导记录和一个分区表。
* 每一个分区的第一个块都是一个包含了元数据的**超级块（superblock）** ，这些元数据定义了其他的文件系统结构并将其定位于物理硬盘的具体分区上。
* 一个 **inode 位图块** 决定了哪些 inode 是在使用中的，哪一些是未使用的。
* **inode** 在硬盘上有它们自己的空间。每一个 inode 都包含了一个文件的信息，包括其所处的数据块的位置，也就是该文件所处的区域。
* 一个 **区位图** 用于保持追踪数据区域的使用和未使用情况。
* 一个 **数据区**, 这里是数据存储的地方。

对上述了两种位图类型来说，一个位（bit）表示一个指定的数据区或者一个指定的 inode。 如果这个位是 0 则表示这个数据区或者这个 inode 是未使用的，如果是 1 则表示正在使用中。

那么，[inode][17] 又是什么呢 ? 就是 index-node (索引节点)的简写。 inode 是位于磁盘上的一个 256 字节的块，用于存储和该 inode 对应的文件的相关数据。这些数据包含了文件的大小、文件的所有者和所属组的用户 ID、文件模式（即访问权限）以及三个时间戳用于指定：该文件最后的访问时间、该文件的最后修改时间和该 inode 中的数据的最后修改时间。

同时，这个 inode 还包含了位置数据，指向了其所对应的文件数据在硬盘中的位置。在 Minix 和 EXT 1-3 文件系统中，这是一个数据区和块的列表。Minix 文件系统的 inode 支持 9 个数据块，包括 7 个直接数据块和 2 个间接数据块。如果你想要更深入的了解，这里有一个优秀的 PDF 详细地描述了 [Minix 文件系统结构][18] 。同时你也可以在维基百科上对 [inode 指针结构][19] 做一个快速了解。

### EXT

原生的 [EXT 文件系统][20] (意即扩展的（extended）) 是由 [Rémy Card][21] 编写并于 1992 年与 Linux 一同发行。主要是为了克服 Minix 文件系统中的一些文件大小限制的问题。其中，最主要的结构变化就是文件系统中的元数据。它基于 Unix 文件系统 （UFS），其也被称为伯克利快速文件系统（FFS）。我发现只有很少一部分关于 EXT 文件系统的发行信息是可以被确证的，显然这是因为其存在着严重的问题，并且它很快地被 EXT2 文件系统取代了。

### EXT2

[EXT2 文件系统][22] 就相当地成功，它在 Linux 发行版中存活了多年。它是我在 1997 年开始使用 Red Hat Linux 5.0 时接触的第一个文件系统。实际上，EXT2 文件系统有着和 EXT 文件系统基本相同的元数据结构。然而 EXT2 更高瞻远瞩，因为其元数据结构之间留有很多供将来使用的磁盘空间。

和 Minix 类似，EXT2 也有一个[引导扇区][23] ，它是硬盘安装后的第一个扇区。它包含了非常小的引导记录和一个分区表。接着引导扇区之后是一些保留的空间，它填充了引导记录和硬盘驱动器上的第一个分区（通常位于下一个柱面）之间的空间。[GRUB2][24] - 也可能是 GRUB1 - 将此空间用于其部分引导代码。

每个 EXT2 分区中的空间被分为柱面组（cylinder group），它允许更精细地管理数据空间。 根据我的经验，每一组大小通常约为 8MB。 下面的图 1 显示了一个柱面组的基本结构。 柱面中的数据分配单元是块，通常大小为 4K。

![cylindergroup-01_1.png](https://opensource.com/sites/default/files/images/life-uploads/cylindergroup-01_1.png)

*图 1： EXT 文件系统中的柱面组的结构*

柱面组中的第一个块是一个超级块（superblock），它包含了元数据，定义了其它文件系统的结构并将其定位于物理硬盘的具体分区上。分区中有一些柱面组还会有备用超级块，但并不是所有的柱面组都有。我们可以使用例如 `dd` 等磁盘工具来拷贝备用超级块的内容到主超级块上，以达到修复损坏的超级块的目的。虽然这种情况不会经常发生，但是在几年前我的一个超级块损坏了，我就是用这种方法来修复的。幸好，我很有先见之明地使用了 `dumpe2fs` 命令来备份了我的系统上的分区描述符信息。

以下是 `dumpe2fs` 命令的一部分输出。这部分输出主要是超级块上包含的一些元数据，同时也是文件系统上的前两个柱面组的数据。

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

<截断>
```

每一个柱面组都有自己的 inode 位图，用于判定该柱面组中的哪些 inode 是使用中的而哪些又是未被使用的。每一个柱面组的 inode 都有它们自己的空间。每一个 inode 都包含了一个文件的相关信息，包括属于该文件的数据块的位置。而块位图纪录了文件系统中的使用中和非使用中的数据块。请注意，在上面的输出中有大量关于文件系统的数据。在非常大的文件系统上，柱面组的数据可以多达数百页的长度。柱面组的元数据包括组中所有空闲数据块的列表。

EXT 文件系统实现了数据分配策略以确保产生最少的文件碎片。减少文件碎片可以提高文件系统的性能。这些策略会在下面的 EXT4 中描述到。

我所遇见的关于 EXT2 文件系统最大的问题是 `fsck` (文件系统检查) 程序这一环节占用了很长一段时间来定位和校准文件系统中的所有的不一致性，从而导致在系统崩溃（crash）后其会花费了数个小时来修复。有一次我的其中一台电脑在崩溃后重新启动时共花费了 28 个小时恢复磁盘，而且并且是在磁盘被检测量只有几百兆字节大小的情况下。

### EXT3

[EXT3 文件系统][25]是应一个目标而生的，就是克服 `fsck` 程序需要完全恢复在文件更新操作期间发生的不正确关机而损坏的磁盘结构所需的大量时间。它对 EXT 文件系统的唯一新增功能就是 [日志][26]，它将提前记录将对文件系统执行的更改。 EXT3 的磁盘结构的其余部分与 EXT2 中的相同。

除了同先前的版本一样直接写入数据到磁盘的数据区域外，EXT3 上的日志会将文件数据随同元数据写入到磁盘上的一个指定数据区域。一旦这些（日志）数据安全地到达硬盘，它就可以几乎零丢失率地被合并或被追加到目标文件上。当这些数据被提交到磁盘上的数据区域上，这些日志就会随即更新，这样在日志中的所有数据提交之前，系统发生故障时文件系统将保持一致状态。在下次启动时，将检查文件系统的不一致性，然后将仍保留在日志中的数据提交到磁盘的数据区，以完成对目标文件的更新。

日志功能确实降低了数据写入性能，但是有三个可用于日志的选项，允许用户在性能和数据完整性、安全性之间进行选择。 我的个人更偏向于选择安全性，因为我的环境不需要大量的磁盘写入活动。

日志功能将失败后检查硬盘驱动器所需的时间从几小时（甚至几天）减少到了几分钟。 多年来，我遇到了很多导致我的系统崩溃的问题。要详细说的话恐怕还得再写一篇文章，但这里需要说明的是大多数是我自己造成的，就比如不小心踢掉电源插头。 幸运的是，EXT 日志文件系统将启动恢复时间缩短到两三分钟。此外，自从我开始使用带日志记录的 EXT3，我从来没有遇到丢失数据的问题。

EXT3 的日志功能可以关闭，然后其功能就等同于 EXT2 文件系统了。 该日志本身仍然是存在的，只是状态为空且未使用。 只需在 `mount` 命令中使用文件系统类型参数来重新挂载即可指定为 EXT2。 你可以从命令行执行此操作，但是具体还是取决于你正在使用的文件系统，不过你也可以更改 `/etc/fstab` 文件中的类型说明符，然后重新启动。 我强烈建议不要将 EXT3 文件系统挂载为 EXT2 ，因为这会有丢失数据和增加恢复时间的潜在可能性。

EXT2 文件系统可以使用如下命令来通过日志升级到 EXT3 。

```
tune2fs -j /dev/sda1
```

`/dev/sda1` 表示驱动器和分区的标识符。同时要注意修改 `/etc/fstab` 中的文件系统类型标识符并重新挂载分区，或者重启系统以确保修改生效。

### EXT4

[EXT4 文件系统][27]主要提高了性能、可靠性和容量。为了提高可靠性，它新增了元数据和日志校验和。同时为了满足各种关键任务要求，文件系统新增了纳秒级别的时间戳，并在时间戳字段中添加了两个高位来延缓时间戳的 [2038 年问题][28] ，这样 EXT4 文件系统至少可用到 2446 年。

在 EXT4 中，数据分配从固定块改为扩展盘区（extent）方式，扩展盘区由硬盘驱动器上的开始和结束位置来描述。这使得可以在单个 inode 指针条目中描述非常长的物理上连续的文件，这可以显著减少描述大文件中所有数据的位置所需的指针数。其它在 EXT4 中已经实施的分配策略可以进一步减少碎片化。

EXT4 通过将新创建的文件散布在磁盘上，使其不会像早期的 PC 文件系统一样全部聚集在磁盘起始位置，从而减少了碎片。文件分配算法尝试在柱面组中尽可能均匀地散布文件，并且当文件（由于太大）需要分段存储时，使不连续的文件扩展盘区尽可能靠近同一文件中的其他部分，以尽可能减少磁头寻道和电机旋转等待时间。当创建新文件或扩展现有文件时，使用其它策略来预先分配额外的磁盘空间。这有助于确保扩展文件时不会自动导致其分段。新文件不会紧挨这现有文件立即分配空间，这也可以防止现有文件的碎片化。

除了磁盘上数据的实际位置外，EXT4 使用诸如延迟分配的功能策略，以允许文件系统在分配空间之前收集到所有正在写入磁盘的数据，这可以提高数据空间连续的可能性。

较旧的 EXT 文件系统（如 EXT2 和 EXT3）可以作为 EXT4 进行 `mount` ，以使其性能获得较小的提升。但不幸的是，这需要关闭 EXT4 的一些重要的新功能，所以我建议不要这样做。

自 Fedora 14 以来，EXT4 一直是 Fedora 的默认文件系统。我们可以使用 Fedora 文档中描述的 [流程][29] 将 EXT3 文件系统升级到 EXT4，但是由于仍然存留的之前的 EXT3 元数据结构，它的性能仍将受到影响。从 EXT3 升级到 EXT4 的最佳方法是备份目标文件系统分区上的所有数据，使用 `mkfs` 命令将空 EXT4 文件系统写入分区，然后从备份中恢复所有数据。

### Inode

之前介绍过的 inode 是 EXT 文件系统中的元数据的关键组件。 图 2 显示了 inode 和存储在硬盘驱动器上的数据之间的关系。 该图是单个文件的目录和 inode，在这种情况下，可能会产生高度碎片化。 EXT 文件系统可以主动地减少碎片，所以不太可能会看到有这么多间接数据块或扩展盘区的文件。 实际上，你在下面将会看到，EXT 文件系统中的碎片非常低，所以大多数 inode 只使用一个或两个直接数据指针，而不使用间接指针。

![inodesanddataallocation-01_0.png](https://opensource.com/sites/default/files/images/life-uploads/inodesanddataallocation-01_0.png)

*图 2 ：inode 存储有关每个文件的信息，并使 EXT 文件系统能够查找属于它的所有数据。*

inode 不包含文件的名称。通过目录项访问文件，目录项本身就是文件的名称，并包含指向 inode 的指针。该指针的值是 inode 号。文件系统中的每个 inode 都具有唯一的 ID 号，但同一台计算机上的其它文件系统（甚至是相同的硬盘驱动器）中的 inode 可以具有相同的 inode 号。这对 [硬链接][30] 存在影响，但是这个讨论超出了本文的范围。

inode 包含有关该文件的元数据，包括其类型和权限以及其大小。 inode 还包含 15 个指针的空位，用于描述柱面组数据部分中数据块或扩展盘区的位置和长度。12 个指针提供对数据扩展盘区的直接访问，应该足以满足大多数文件的需求。然而，对于具有明显分段的文件，需要以间接节点（node）的形式提供一些额外的容量——从技术上讲，这些不是真正的“inode”，所以为了方便起见我在这里使用这个术语“节点（node）”。

间接节点是文件系统中的正常数据块，它仅用于描述数据而不用于存储元数据，因此可以支持超过 15 个条目。例如，4K 的块大小可以支持 512 个 4 字节的间接节点，允许单个文件有 **12（直接）+ 512（间接）= 524** 个扩展盘区。还支持双重和三重间接节点，但我们大多数人不太可能遇到需要那么多扩展盘区的文件。

### 数据碎片

对于许多较旧的 PC 文件系统，如 FAT（及其所有变体）和 NTFS，碎片一直是导致磁盘性能下降的重大问题。 碎片整理本身就成为一个行业，有各种品牌的整理软件，其效果范围从非常有效到仅仅是微乎其微。

Linux 的扩展文件系统使用数据分配策略，有助于最小化硬盘驱动器上的文件碎片，并在发生碎片时减少碎片的影响。 你可以使用 EXT 文件系统上的 `fsck` 命令检查整个文件系统的碎片。 以下示例检查我的主工作站的家目录，只有 1.5％ 的碎片。 确保使用 `-n` 参数，因为它会防止 `fsck` 对扫描的文件系统采取任何操作。

```
fsck -fn /dev/mapper/vg_01-home
```

我曾经进行过一些理论计算，以确定磁盘碎片整理是否会产生任何明显的性能提升。 我做了一些假设条件，我使用的磁盘性能数据来自一个新的 300GB 的西部数字硬盘驱动器，具有 2.0ms 的轨到轨寻道时间。 此示例中的文件数是我在计算的当天的文件系统中存在的实际数。 我假设每天有相当大量的碎片化文件（约 20％）会被用到。

| **全部文件** | **271,794** |
|---|---|
| 碎片率 %  | 5.00% |
| 不连续数 | 13,590 |
|   |   |
| % 每天用到的碎片化文件 | 20% （假设） |
| 额外寻道次数 | 2,718 |
| 平均寻道时间 | 10.90 ms |
| 每天全部的额外寻道时间 | 29.63 sec |
|   | 0.49 min |
|   |   |
| 轨到轨寻道时间 | 2.00 ms |
| 每天全部的额外寻道时间 | 5.44 sec |
|   | 0.091 min |

*表 1: 碎片对磁盘性能的理论影响*

我对每天的全部的额外寻道时间进行了两次计算，一次是轨到轨寻道时间，这是由于 EXT 文件分配策略而导致大多数文件最可能的情况，一个是平均寻道时间，我假设这是一个合理的最坏情况。

从表 1 可以看出，对绝大多数应用程序而言，碎片化甚至对性能适中的硬盘驱动器上的现代 EXT 文件系统的影响是微乎其微的。您可以将您的环境中的数字插入到您自己的类似电子表格中，以了解你对性能影响的期望。这种类型的计算不一定能够代表实际的性能，但它可以提供一些对碎片化及其对系统的理论影响的洞察。

我的大部分分区的碎片率都在 1.5％ 左右或 1.6％，我有一个分区有 3.3％ 的碎片，但是这是一个大约 128GB 文件系统，具有不到 100 个非常大的 ISO 映像文件；多年来，我扩展过该分区几次，因为它已经太满了。

这并不是说一些应用的环境并不需要更少的碎片的环境。 EXT 文件系统可以由有经验和知识的管理员小心调整，管理员可以针对特定的工作负载类型调整参数。这个工作可以在文件系统创建的时候或稍后使用 `tune2fs` 命令时完成。每一次调整变化的结果应进行测试，精心的记录和分析，以确保目标环境的最佳性能。在最坏的情况下，如果性能不能提高到期望的水平，则其他文件系统类型可能更适合特定的工作负载。并记住，在单个主机系统上混用文件系统类型以匹配每个文件系统上的不同负载是常见的。

由于大多数 EXT 文件系统的碎片数量较少，因此无需进行碎片整理。目前，EXT 文件系统没有安全的碎片整理工具。有几个工具允许你检查单个文件的碎片程度或文件系统中剩余可用空间的碎片程度。有一个工具，`e4defrag`，它可以对允许使用的剩余可用空间、目录或文件系统进行碎片整理。顾名思义，它只适用于 EXT4 文件系统中的文件，并且它还有一其它的些限制。

如果有必要在 EXT 文件系统上执行完整的碎片整理，则只有一种方法能够可靠地工作。你必须将文件系统中的所有要进行碎片整理的文件移动从而进行碎片整理，并在确保安全复制到其他位置后将其删除。如果可能，你可以增加文件系统的大小，以帮助减少将来的碎片。然后将文件复制回目标文件系统。但是其实即使这样也不能保证所有文件都被完全去碎片化。

### 总结

EXT 文件系统在一些 Linux 发行版本上作为默认文件系统已经超过二十多年了。它们用最少的维护代价提供了稳定性、高可用性、可靠性和性能。我尝试过一些其它的文件系统但最终都还是回归到 EXT。每一个我在工作中使用到 Linux 的地方都使用到了 EXT 文件系统，同时我发现了它们适用于任何主流负载。毫无疑问，EXT4 文件系统应该被用于大部分的 Linux 文件系统上，除非我们有明显需要使用其它文件系统的理由。


--------------------------------------------------------------------------------

作者简介：

David Both - David Both 是一名 Linux 于开源的贡献者，目前居住在北卡罗莱纳州的罗利。他从事 IT 行业有 40 余年并在 IBM 中从事 OS/2 培训约 20 余年。在 IBM 就职期间，他在 1981 年为最早的 IBM PC 写了一个培训课程。他已经为红帽教授了 RHCE 课程，曾在 MCI Worldcom，思科和北卡罗来纳州工作。 他使用 Linux 和开源软件工作了近 20 年。

-------------------

via: https://opensource.com/article/17/5/introduction-ext4-filesystem

作者：[David Both][a]
译者：[chenxinlong](https://github.com/chenxinlong)
校对：[wxy](https://github.com/wxy)

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
