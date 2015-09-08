如何在Linux中整理磁盘碎片
================================================================================
![](https://www.maketecheasier.com/assets/uploads/2015/07/defragment-linux-featured.png)

有一神话是linux的磁盘从来不需要整理碎片。在大多数情况下这是真的，大多数因为是使用的是优秀的日志系统（ext2、3、4等等）来处理文件系统。然而，在一些特殊情况下，碎片仍旧会产生。如果正巧发生在你身上，解决方法很简单。

### 什么是磁盘碎片 ###

碎片发生在不同的小块中更新文件时，但是这些快没有形成连续完整的文件而是分布在磁盘的各个角落中。这对于FAT和FAT32文件系统而言是这样的。这在NTFS中有所减轻，在Linux(extX)中几乎不会发生。下面是原因。

在像FAT和FAT32这类文件系统中，文件紧挨着写入到磁盘中。文件之间没有空间来用于增长或者更新：

![](https://www.maketecheasier.com/assets/uploads/2015/07/defragment-linux-fragmented.png)

NTFS中在文件之间保留了一些空间，因此有空间进行增长。因为块之间的空间是有限的，碎片也会随着时间出现。

![](https://www.maketecheasier.com/assets/uploads/2015/07/defragment-linux-ntfs.png)

Linux的日志文件系统采用了一个不同的方案。与文件之间挨着不同，每个文件分布在磁盘的各处，每个文件之间留下了大量的剩余空间。这里有很大的空间用于更新和增长，并且碎片很少会发生。

![](https://www.maketecheasier.com/assets/uploads/2015/07/defragment-linux-journal.png)

此外，碎片一旦出现了，大多数Linux文件系统会尝试将文件和块重新连续起来。

### Linux中的磁盘整理 ###

除非你用的是一个很小的硬盘或者空间不够了，不然Linux很少会需要磁盘整理。一些可能需要磁盘整理的情况包括：

- 如果你编辑的是大型视频文件或者原生照片，但磁盘空间有限
- if you use older hardware like an old laptop, and you have a small hard drive
- 如果你的磁盘开始满了（大约使用了85%）
- 如果你的家目录中有许多小分区

最好的解决方案是购买一个大硬盘。如果不可能，磁盘碎片整理就很有用了。

### 如何检查碎片 ###

`fsck`命令会为你做这个 -也就是说如果你可以在liveCD中运行它，那么就可以**卸载所有的分区**。

这一点很重要：**在已经挂载的分区中运行fsck将会严重危害到你的数据和磁盘**。

你已经被警告过了。开始之前，先做一个完整的备份。

**免责声明**: 本文的作者与Make Tech Easier将不会对您的文件、数据、系统或者其他损害负责。你需要自己承担风险。如果你继续，你需要接收并了解这点。

你应该启动到一个live会话中（如安装磁盘，系统救援CD等）并运行`fsck`卸载分区。要检查是否有任何问题，请在运行root权限下面的命令：

    fsck -fn [/path/to/your/partition]

您可以检查一下运行中的分区的路径

    sudo fdisk -l

有一个（相对）安全地在已挂载的分区中运行`fsck`的方法是使用‘-n’开关。这会让分区处在只读模式而不能创建任何文件。当然，这里并不能保证安全，你应该在创建备份之后进行。在ext2中，运行

    sudo fsck.ext2 -fn /path/to/your/partition

会产生大量的输出-- 大多数错误信息的原因是分区已经挂载了。最后会给出一个碎片相关的信息。

![](https://www.maketecheasier.com/assets/uploads/2015/07/defragment-linux-fsck.png)

如果碎片大于20%了，那么你应该开始整理你的磁盘碎片了。

### 如何简单地在Linux中整理碎片 ###

你要做的是备份你**所有**的文件和数据到另外一块硬盘中（手动**复制**他们）。格式化分区然后重新复制回去（不要使用备份软件）。日志系统会把它们作为新的文件，并将它们整齐地放置到磁盘中而不产生碎片。

要备份你的文件，运行

    cp -afv [/path/to/source/partition]/* [/path/to/destination/folder]

记住星号（*）是很重要的。

注意：通常认为复制大文件或者大量文件，使用dd或许是最好的。这是一个非常底层的操作，它会复制一切，包含空闲的空间甚至是留下的垃圾。这不是我们想要的，因此这里最好使用`cp`。

现在你只需要删除源文件。

    sudo rm -rf [/path/to/source/partition]/*

**可选**：你可以将空闲空间置零。你也可以用格式化来达到这点，但是例子中你并没有复制整个分区而仅仅是大文件（这很可能会造成碎片）。这恐怕不能成为一个选项。

    sudo dd if=/dev/zero of=[/path/to/source/partition]/temp-zero.txt

等待它结束。你可以用`pv`来监测进程。

    sudo apt-get install pv
    sudo pv -tpreb | of=[/path/to/source/partition]/temp-zero.txt

![](https://www.maketecheasier.com/assets/uploads/2015/07/defragment-linux-dd.png)

这就完成了，只要删除临时文件就行。

    sudo rm [/path/to/source/partition]/temp-zero.txt

待你清零了空闲空间（或者跳过了这步）。重新复制回文件，将第一个cp命令翻转一下：

    cp -afv [/path/to/original/destination/folder]/* [/path/to/original/source/partition]

### 使用 e4defrag ###

如果你想要简单的方法，安装`e2fsprogs`，

    sudo apt-get install e2fsprogs

用root权限在分区中运行 `e4defrag`。如果你不想卸载分区，你可以使用它的挂载点而不是路径。要整理整个系统的碎片，运行：

    sudo e4defrag  /

在挂载的情况下不保证成功（你也应该保证在它运行时停止使用你的系统），但是它比服务全部文件再重新复制回来简单多了。

### 总结 ###

linux系统中很少会出现碎片因为它的文件系统有效的数据处理。如果你因任何原因产生了碎片，简单的方法是重新分配你的磁盘如复制所有文件并复制回来，或者使用`e4defrag`。然而重要的是保证你数据的安全，因此在进行任何可能影响你全部或者大多数文件的操作之前，确保你的文件已经被备份到了另外一个安全的地方去了。

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/defragment-linux/

作者：[Attila Orosz][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/attilaorosz/
