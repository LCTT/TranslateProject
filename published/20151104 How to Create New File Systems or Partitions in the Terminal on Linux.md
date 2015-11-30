如何在 Linux 终端下创建新的文件系统/分区
================================================================================
![](https://www.maketecheasier.com/assets/uploads/2015/03/cfdisk-feature-image.png)

在 Linux 中创建分区或新的文件系统通常意味着一件事：安装 Gnome Parted 分区编辑器（GParted）。对于大多数 Linux 用户而言，这是唯一的办法。不过，你是否考虑过在终端创建这些分区和文件系统？当然可以！以下就是方法！

### 使用 CFdisk 创建一个基本的 Linux 分区 ###

以下是如何在命令行中创建一个基本的 Linux 分区的正确方案。要做的第一件事就是先打开你的终端。若你已打开，你需要找到你想要创建分区的磁盘。这可以使用一个简单的命令来找到。

    lsblk

![cfdisk-lsblk](https://www.maketecheasier.com/assets/uploads/2015/03/cfdisk-lsblk.png)

当你运行了 `lsblk`，你应该会看到当前系统上每个磁盘的详细列表。看看这个列表，然后找出你想要使用的磁盘。在本文中，我将使用 `sdb` 来进行演示。

在终端输入这个命令。它会显示一个功能强大的基于终端的分区编辑程序。

    sudo cfdisk /dev/sdb

![cfdisk-empty-layout](https://www.maketecheasier.com/assets/uploads/2015/03/cfdisk-empty-layout.png)

**注意**: 使用在 `lsblk` 命令输出的你想要使用的磁盘来替换 `sdb`。 

当输入此命令后，你将进入分区编辑器中，然后访问你想改变的磁盘。

由于磁盘分区的不同，这取决于用户的需求，这部分的指南将在 **如何建立一个分离的 Linux home/root 分区布局**。

首先，需要创建根分区。这需要根据磁盘的字节数来进行分割。我测试的磁盘是 32 GB。

在 CFdisk 中使用键盘上的方向键选择需要分配的空间。你找到后，请使用箭头键选择 [ NEW ]，然后按 Enter 键。

![cfdisk-create-root-partition](https://www.maketecheasier.com/assets/uploads/2015/03/cfdisk-create-root-partition.png)

该程序会要求你输入分区大小。一旦你指定好大小后，按 Enter 键。这将被称为根分区（或 /dev/sdb1）。

接下来该创建 home 分区（/dev/sdb2）了。你需要在 CFdisk 中再选择一些空闲分区。使用箭头选择 [ NEW ] 选项，然后按 Enter 键。输入你的 home 分区的大小，然后按 Enter 键来创建它。

![cfdisk-create-home-partition](https://www.maketecheasier.com/assets/uploads/2015/03/cfdisk-create-home-partition.png)

最后，需要创建交换分区。像前两次一样，先找一些空闲分区，并使用箭头选择 [ NEW ] 选项。之后，算下你 Linux 想使用多大的交换分区。

**注意**: 交换分区通常和计算机的内存差不多大。

![cfdisk-specify-partition-type-swap](https://www.maketecheasier.com/assets/uploads/2015/03/cfdisk-specify-partition-type-swap.png)

现在，创建了交换分区，该指定其类型。使用上下箭头来选择它。之后，使用左右箭头选择 [ TYPE ] 。找到 Linux swap 选项，然后按 Enter 键。

![cfdisk-write-partition-table](https://www.maketecheasier.com/assets/uploads/2015/03/cfdisk-write-partition-table.jpg)

所有分区创建后。然后就是将其写入到磁盘。使用右箭头键，选择 [ WRITE ] 选项，然后按 Enter 键。这将直接将新创建的分布写入到磁盘中。

### 使用 mkfs 创建文件系统 ###

有时候，你并不需要一个整个重新分区，你只想要创建一个文件系统而已。你可以在终端直接使用 `mkfs` 命令来实现。

![cfdisk-mkfs-list-partitions-lsblk](https://www.maketecheasier.com/assets/uploads/2015/10/cfdisk-mkfs-list-partitions-lsblk.png)

首先，找出你要使用的磁盘。在终端输入 `lsblk` 找出来。它会打印出列表，之后只要找到你想创建文件系统的分区或盘符。

在这个例子中，我将使用第二个硬盘的 `/dev/sdb1` 作为第一个分区。可以对 `/dev/sdb` 使用 mkfs（这将会使用整个分区）。

![cfdisk-mkfs-make-file-system-ext4](https://www.maketecheasier.com/assets/uploads/2015/10/cfdisk-mkfs-make-file-system-ext4.png)

要在一个特定的分区上创建新文件系统，只需输入

    sudo mkfs.ext4 /dev/sdb1

在终端。应当指出的是，`mkfs.ext4` 可以换成任何你想要使用的的文件系统。

### 结论 ###

虽然使用图形工具编辑文件系统和分区更容易，但终端可以说是更有效的。终端的加载速度更快，点击几个按钮即可。GParted 和其它工具一样，它也是一个完整的工具。我希望在本教程的帮助下，你会明白如何在终端中高效的编辑文件系统。

你是否更喜欢使用基于终端的方法在 Linux 上编辑分区？不管是不是，请在下面告诉我们。

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/create-file-systems-partitions-terminal-linux/

作者：[Derrik Diener][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/derrikdiener/
