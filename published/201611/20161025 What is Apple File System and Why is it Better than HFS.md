苹果新的文件系统 APFS 比 HFS+ 强在哪里？
===============

![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/09/apple-file-system-hero-icon.jpg "What is Apple File System and Why is it Better than HFS+?s")

如果你一直关注苹果最新版的 macOS 的消息，你可能已经注意到苹果文件系统 APFS。这是不太让人感冒的话题之一。然而，它是支撑了操作系统用户体验的核心结构。APFS 将在 2017 年之前完成，不过你现在可以在 Sierra（最新版的 macOS） 上面体验一番开发者预览版。

### 特色与改进

先快速科普一下，**文件系统**是操作系统用于存储和检索数据的基本结构，不同的文件系统采用不同的方式来实现这个任务。随着计算机变得越来越快，新生代的文件系统已经从计算机速度的提升中获益，以提供新功能和适应现代存储需求。

HFS+，作为今天新一代 Mac 的附带文件系统，已经 18 岁了。它的祖先 HFS 比 Tom Cruise 的兄弟情影片“壮志凌云”还要老。它有点像一辆老丰田。它仍然可以工作（也许惊人的好），但是它不再得到人们的嘉奖。

APFS 不完全是 HFS+ 的升级版，因为相对现在而言，它是一个大幅度的飞跃。虽然这对苹果用户来说是一个重大的升级，但似乎这看起来更像是苹果赶上了其它系统，而不是超越了它们。然而，更新还进展得非常慢。

### 克隆和数据完整性

![apfs-cloning](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/apfs-cloning.png "apfs-cloning")

APFS 使用称为写时复制（copy-on-write）的方案来生成重复文件的即时克隆。在 HFS+ 下，当用户复制文件的时候，每一个比特（二进制中的“位”）都会被复制。而 APFS 则通过操作元数据并分配磁盘空间来创建克隆。但是，在修改复制的文件之前都不会复制任何比特。当克隆体与原始副本分离的时候，那些改动（并且只有那些改动）才会被保存。

写时复制还提高了数据的完整性。在其它系统下，如果你卸载卷导致覆写操作挂起的话，你可能会发现你的文件系统有一部分与其它部分不同步。写时复制则通过将改动写入到可用的磁盘空间而不是覆盖旧文件来避免这个问题。直到写入操作成功完成前，旧文件都是正式版本。只有当新文件被成功复制时，旧文件才会被清除。

### 系统快照

![apfs-snapshots](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/apfs-snapshots.png "apfs-snapshots")

快照是写时复制架构给你带来的一个主要的升级。快照是文件系统在某个时间点的一个只读的可装载映像。随着文件系统发生改动，只有改动的比特会被更改。这可以让备份更简单，更可靠。考虑到时间机器（一个苹果出品的备份工具）已经成为硬链接的痛点，这可能是一个重大的升级。

### 输入/输出的服务质量（QoS）

你可能已经在你的路由器说明书看到了服务质量（QoS）这个名词。QoS 优先分配带宽使用以避免降低优先任务的速度。在你的路由器上，它采用用户定义的规则来为指定任务提供最大的带宽。据报道，苹果的 QoS 会优先考虑用户操作，例如活跃窗口。而诸如时间机器备份这些后台任务将会被降级。所以，这意味着更少的闲暇时光了？

### 本地加密

![apfs-encryption-1](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/apfs-encryption-1.jpg "apfs-encryption-1")

在后斯诺登时代，加密成为众所关注的了。越来越多的苹果产品正在强调其系统安全性。内置强大的加密机制并不让人感到意外。包括 APFS 在内，苹果正在采用更加细致入微的加密方案，要么不加密，要么就将加密进行到底。用户可以使用单个密钥来为所有数据加密，或者使用多个加密密钥分别锁定单个文件和文件夹。当然，你也可以不加密，只要你对坏蛋无所忌惮。

### 固态硬盘和闪存优化

![apfs-ssd-storage](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/apfs-ssd-storage.jpg "apfs-ssd-storage")

闪存优化已经被列为 APFS 的一个亮点功能，不过它的实现并没有那么振奋人心。苹果选择将一些典型的固态硬盘芯片的处理功能迁移到操作系统，而没有深度系统集成的优势。这更像是让文件系统感知固态硬盘，而不是为它们做优化。

### 动态分区调整

![apfs-partition-resizing](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2016/10/apfs-partition-resizing.jpg "apfs-partition-resizing")

APFS 驱动器的逻辑分区可以动态调整自身大小。用户只需指定所需分区的数量，然后文件系统会在运行时进行磁盘分配。每个分区只占用其用于存储文件的磁盘空间。剩余的磁盘空间会由任何分区获取。这种设计很整洁，不过比起其它文件系统，这更像是元文件夹。

### 结论

这是否重要？对于开发者和高级用户来说真是棒极了。对于一般的 Mac 用户应该没有太多的外部差异。虽然升级是重大的举措，但仍然存在一些缺失的部分。本地压缩显然还没有，对用户数据进行的校验也没有。当然，2017 年还没到，一切皆有可能，让我们拭目以待。

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/apple-file-system-better-than-hfs/

作者：[Alexander Fox][a]
译者：[OneNewLife](https://github.com/OneNewLife)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/alexfox-2-2-2/
[1]:https://www.maketecheasier.com/apple-file-system-better-than-hfs/#respond
[3]:https://www.maketecheasier.com/schedule-windows-empty-recycle-bin/
[4]:https://www.maketecheasier.com/manage-automatic-wordpress-updates/
[5]:mailto:?subject=What%20is%20Apple%20File%20System%20and%20Why%20is%20it%20Better%20than%20HFS+?&body=https%3A%2F%2Fwww.maketecheasier.com%2Fapple-file-system-better-than-hfs%2F
[6]:http://twitter.com/share?url=https%3A%2F%2Fwww.maketecheasier.com%2Fapple-file-system-better-than-hfs%2F&text=What+is+Apple+File+System+and+Why+is+it+Better+than+HFS%2B%3F
[7]:http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.maketecheasier.com%2Fapple-file-system-better-than-hfs%2F
[8]:https://www.maketecheasier.com/category/mac-tips/
