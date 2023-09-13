[#]: subject: "Working with Btrfs – General Concepts"
[#]: via: "https://fedoramagazine.org/working-with-btrfs-general-concepts/"
[#]: author: "Andreas Hartmann https://fedoramagazine.org/author/hartan/"
[#]: collector: "lkxed"
[#]: translator: "A2ureStone"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

使用 Btrfs – 基础概念
======
![][1]
图片来自 [Unsplash][3] 上的 [Heliberto Arias][2] 

这篇文章是更近一步研究 Btrfs 系列文章中的一篇。Btrfs 是自 Fedora Linux 33 开始 Fedora Workstation 和 Fedora Silverblue 的默认文件系统。

### 介绍

文件系统是现代计算机的基础之一。它是任何操作系统必不可少的一部分，且通常不为人注意。但是，像 Btrfs 这样的现代文件系统提供许多很棒的特性去方便地使用计算机。例如，它可以无感地为你压缩文件，或者为增量备份建立可靠的基础。

这篇文章将带你浏览 Btrfs 文件系统是如何工作的，有什么特性。既不会过多涉及技术细节和底层实现，系列后续的文章会详细介绍一些重要特性。

### 什么是文件系统

如何你基本了解过文件系统是如何工作的，那么下面的内容对你应该是不陌生的，你可以直接跳到下一节。否则，请先阅读下面对文件系统的简短介绍。

简单来说，文件系统允许你的 PC 去寻找存储在磁盘上的数据。这听起来像是微不足道的工作，但实际上时至今日各种类型的非易失性存储设备（比如 HDDs，SSDs，SD cards，等等）仍然与 1970 年代 PC 被发明之处基本相同：一个（巨大的）存储块集合。

块是最小的可寻址存储单元。PC 上的每个文件内容被存储在多个块中。一个块通常是 4096 字节的大小。这取决于你的硬件和在这之上的软件（即文件系统）。

文件系统允许我们从海量的存储块中查找文件的内容。这通过所谓的 *inodes* 去实现的。inode 在特殊格式的存储块里记录文件的信息。这包含文件的大小，哪里去寻找组成文件内容的存储块，访问规则（即谁可读，可写，可执行）等等。

下面是 inode 的示意图：

![A text file “myfile.txt” and a hypothetical example of its representation on disk. All the squares are individual storage blocks.][4]

inode 的结构对文件系统的功能有巨大的影响，因此它是任何文件系统许多重要的数据结构之一。出于这个原因，每个文件系统有各自的inode 结构。如果你想了解更多信息，看看下面链接关于 Btrfs 文件系统 inode 结构的链接。想要知道图上每一项表示什么含义，你可以参考 ext4 文件系统的 inode 结构。

### 写时拷贝文件系统

比如说，Btrfs 与 ext4 相比杰出的特性之一，Btrfs 是一个写 Cow（Copy-on-Write）文件系统。当一个文件被改变和回写磁盘，它不会写回它原来的地方，而是被复制和存储在磁盘上的新位置。从这个意义上，可以简单地认为 Cow 是一种 ”重定向“，因为文件写入被重定向到不同的存储块上。

这听起来很浪费，但实际上并不是。这是因为被修改的数据无论如何一定会被写到磁盘上，不管文件系统是如何工作的。Btrfs 仅仅是确保了数据被写入在之前没被占据的块上，所以旧数据保持完整。唯一的缺点就是这种行为会导致文件碎片化比其他文件系统要快。在日常的电脑使用中，你不太可能会注意到这点。

Cow 的优势在哪里？简单的说：文件被修改和编辑的历史被保存了下来。Btrfs 保存文件旧版本的引用（inodes）可以轻易地被访问。这个引用是在某一刻文件系统状态的快照。这将是这系列文章里的单独的一篇，所以暂时留到后面介绍。

除了保存文件历史，Cow 文件系统永远处于一个一致性的状态，即使之前的文件系统事务（比如写入一个文件）没有完成（例如断电）。这是因为文件系统的元数据更新也是 Cow ：文件系统本身永远不会被覆写，所以中断不会使其处于部分写入的状态。

### 对文件的写时拷贝

你可以视文件名为对 inodes 的指针。在写入文件的时候，Btrfs 创建一个被修改文件内容的拷贝，和一个新的 inode (元数据)，然后使你的文件名指向新的 inode ，旧的 inode 保持不变。下面是一个假设示例来阐述这点：

![Continuation of the example above: 3 more bytes of data were added][5]

这里 “myfile.txt“ 增加了三个字节。传统的文件系统会更新中间的 “Data” 块去包含新的内容。Cow 文件系统不会改变旧的数据块（图中灰色），写入（复制）更改的数据和元数据在新的地方。重要的是，只有被改变的数据块被复制，而不是全部文件。

如果没有空闲的块去写入新内容，Btrfs 将从被旧文件版本占据的数据块中回收空间（除非他们是快照的一部分，本系列后续文章会看到）。

### 对目录的写时拷贝

从文件系统的角度看，目录只是特殊类型的文件。相比于常规的文件，文件系统直接解释数据块的内容。一个目录有自身的元数据（inode，就像上面说的文件一样）去记录访问权限或修改时间。最简单的形式，存在目录里的数据（被叫作目录项）是一个 inode 引用的列表，每个 inode 又是另外的文件或目录。但是，现代文件系统在目录项中存储至少一个文件名和对应的 inode 。

之前指出写入一个文件会创建之前 inode 的拷贝然后修改对应的内容。从根本上，这产生了一个和之前无关的新的 inode 。为了让被修改的文件对文件系统可见，所有包含这个文件引用的目录项都会被更新。

这是一个递归的过程！因为一个目录本身是一个带有 inode 的文件。修改目录里的任何一项都会为这个目录文件创建新的 inode 。这会沿着文件系统树递归直到文件系统的根。

所以，一个引用被保存在任何目录下，只要这些目录都不被删除和覆写，就可以遍历之前旧状态的文件系统树。这就是快照的功能。

### 后续文章可以期待的内容

Btrfs 不只是一个 Cow 文件系统。它目标是实现高级特性的同时关注容错、修复和易于管理（参见文档）。本系列未来的文章将会专门介绍这些特性。

* 子卷 – 文件系统中的文件系统
* 快照 – 回到过去
* 压缩 – 透明节省存储空间
* 配额组 – 限制文件系统大小
* RAID – 替代 mdadm 配置

这远非 Btrfs 特性的详尽列表。如果你想全面地了解可用特性，查看 Wiki 和 Docs 。

### 总结

我希望我已能激起你进一步了解 PC 文件系统的兴趣。如果目前你有任何疑问，请在评论区留言讨论以便在日后文章中探讨，同时，你也可以自行学习文中提供的相关资源。如果你发现 Btrfs 中某项特别有趣的功能，也欢迎在评论区提出。如果某个主题收到足够的关注，我可能会在系列文章中新增相关内容。下一篇文章再见！

### 参考资料

1. [https://btrfs.wiki.kernel.org/index.php/Data_Structures#btrfs_inode_item][6]
2. [https://ext4.wiki.kernel.org/index.php/Ext4_Disk_Layout#Inode_Table][7]
3. [https://btrfs.readthedocs.io/en/latest/Introduction.html][8]
4. [https://btrfs.wiki.kernel.org/index.php/Main_Page][9]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/working-with-btrfs-general-concepts/

作者：[Andreas Hartmann][a]
选题：[lkxed][b]
译者：[A2ureStone](https://github.com/A2ureStone)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/hartan/
[b]: https://github.com/lkxed
[1]: https://fedoramagazine.org/wp-content/uploads/2022/07/working_w_btrfs_general-816x345.jpg
[2]: https://unsplash.com/@helibertoarias?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/hdd?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://fedoramagazine.org/wp-content/uploads/2022/07/file_regular.png
[5]: https://fedoramagazine.org/wp-content/uploads/2022/07/file_cow.png
[6]: https://btrfs.wiki.kernel.org/index.php/Data_Structures#btrfs_inode_item
[7]: https://ext4.wiki.kernel.org/index.php/Ext4_Disk_Layout#Inode_Table
[8]: https://btrfs.readthedocs.io/en/latest/Introduction.html
[9]: https://btrfs.wiki.kernel.org/index.php/Main_Page
