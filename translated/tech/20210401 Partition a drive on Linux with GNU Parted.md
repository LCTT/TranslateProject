[#]: subject: (Partition a drive on Linux with GNU Parted)
[#]: via: (https://opensource.com/article/21/4/linux-parted-cheat-sheet)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (hwlife)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

在 Linxu 上使用 GNU Parted 对磁盘分区
======
了解对新的储存设备分区的基础知识，然后下载我们的备忘表隔，保持信息交流方便。

![Cheat Sheet cover image][1]

在 21 世纪，我们倾向于数据存储是理所当然的。我们有许多存储介质，相对价格便宜，而且有许多不同的可用类型。不论你获得的免费云存储空间有多少，没有比有一个物理硬盘空间来存储重要的数据更好了(容量真的很大或者当你在一个慢速网络上时) 。然而，理想的磁盘分区是没有几块硬盘买回来就是现成的，至少，如果你买了一块新硬盘或者用不同分区安装一个系统，你需要知道怎么在 Linux 上为磁盘分区。 

这篇文章介绍 GNU Parted ，磁盘分区最好的工具之一。如果你偏向使用图形化程序替代终端命令行，阅读我的 [为 Linux 格式化驱动器][2] 这篇文章。

### 磁盘卷标，分区和文件系统

技术上来说，一个硬盘驱动器不需要很多软件来服务于存储设备。然而，使用一个驱动器没有现代化的转换技术比如分区表和文件系统是困难的，不切实际的，对你的数据是不安全的。

这里有三个你需要知道的关于硬盘驱动器的重要概念：

 
 * A **磁盘卷标** 或者 **分区表** 是放置在磁盘驱动器起始位置的元数据，它为计算机读取关于可用存储是何种类型，磁盘驱动器的位置等信息做提示。
 * A **分区**  是一个证明文件系统所在位置的边界。举个例子，如果你有一个 512GB 的硬盘，你可以用占用所有磁盘容量 (512GB) 分成一个分区，或者分成两个分区，每个占用 256GB ，或者分成三个分区占用一些其他大小变化等等。 
 * A **文件系统** 是一个硬盘驱动器和计算机两者约定俗成的存储体系。计算机必须知道怎样读取文件系统上拼合在一起存储在驱动器上的的数据，并且知道怎样写入数据到文件系统并保持数据的完整性。
  

GNU Parted 程序管理前两个概念：磁盘卷标和分区。Parted 对文件系统有所了解，但是它留下了文件系统详细操作给了其他类似 `mkfs` 这样的工具。

**[下载 [GNU Parted 备忘表格][3]]**

### 查找磁盘驱动器

使用 GNU Parted 之前，你必须在你的系统上确定你的驱动器所在位置。首先，连接你想要格式化你的系统的磁盘驱动器，然后用 `parted` 命令查看连接到你的计算机的内容：


```
$ parted /dev/sda print devices
/dev/sda (2000GB)
/dev/sdb (1000GB)
/dev/sdc (1940MB)
```
你最新连接设备的名称在字母表上晚于连接时间更长的设备。举个例子，`/dev/sdc` 最有可能是我刚刚连接的磁盘。我能通过它的容量大小来确认，相比于我的工作站上的主要驱动器的 TB 大小来说，因为我知道我插入的 U 盘 只有 2GB (1940MB 足够接近) 大小。如果你不能确定，你可以得到的更多关于你想要分区的驱动器的信息：


```
$ parted /dev/sdc print
Model: Yoyodyne Tiny Drive 1.0 (scsi)    
Disk /dev/sdc: 1940MB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:

Number  Start   End     Size    File system  Name  Flags
 1      1049kB  2048kB  1024kB  BS           Bloat  Hidden
 2      2049kB  1939MB  1937MB  FAT32        MyDrive
```

有些驱动器比其他驱动器有更多的元数据。这个磁盘证明它自己的物理驱动器商标是 Yoyodyne ，此外，在磁盘的起始包含了一个小的有些臃肿的隐藏分区和一个兼容 Windows 的 FAT32 分区。这确实是我要重新打算格式化的驱动器。

继续之前， _确认_ 你已经证实你要分区正确的驱动器。  _重新分区错误的驱动器会导致数据丢失。_ 为了安全起见，在文章中整个潜在的破环性命令都引用为在你的系统中不太可能有的 `/dev/sdX` 设备。

### 创建磁盘卷标或者分区表

要在磁盘上创建一个分区，驱动器必须要有一个磁盘卷标。磁盘卷标也被叫做 _分区表_，所以 Parted 对两个术语都接受。

要创建一个磁盘卷标，使用 `mklabel` 或 `mktable` 子命令:


```
`$ parted /dev/sdX mklabel gpt`
```

这个命令在位于 `/dev/sdX` 的驱动器前面创建了一个 **gpt**  的标签，删除了任何可能存在的标签。这是一个快速的过程因为所有关于被替换的分区信息都存在于元数据。


### 创建分区

要在磁盘创建分区，使用 `mkpart` 子命令，后跟分区的可选名称，再跟分区的开始和结束位置。如果你在磁盘上只需要一个分区，那么大小调整是容易的：开始位置输入 1 ，结束位置输入 100% 。使用 `--align opt` 参数允许 Parted 调整分区边界位置便于磁盘获得最佳性能：


```
$ parted /dev/sdX --align opt \
mkpart example 1 100%
```

用 `print` 子命令查看你的新分区：


```
$ parted /dev/sdX print
Model: Yoyodyne Tiny Drive 1.0 (scsi)
Disk /dev/sdi: 1940MB
Sector size (logical/physical): 512B/512B
Partition Table: gpt
Disk Flags:

Number  Start   End     Size  
 1      1049kB  1939MB  1938MB
```

你不必使用整个磁盘作为一个分区。分区的优势是在一个磁盘上可以存在多个文件系统，它们之间不会相互干扰。但调整分区的时候，你可以使用 `unit` 子命令来设置你想用的测量方法。Parted 理解扇区，柱面，磁头，字节，KB ，MB ，GB ，TB 和百分比。

你也可以指定你打算使用分区的文件系统。这并不能够完全创建文件系统，但是它为你以后方便使用提供了元数据。

将磁盘对半分，一个是 XFS 文件系统，另一个是 EXT4 文件系统：


```
$ parted /dev/sdX --align opt \
mkpart xfs 1 50%
$ parted /dev/sdX --align opt \
mkpart ext4 51% 100%
```

### 命令分区

除了标记分区用于什么文件系统之外，你也可以为每个分区命名。一些文件管理器和工具可以读取分区名称，能够帮助你区分驱动器。例如，我经常有几个不同的驱动器连接到我的媒体工作站，每个属于一个不同的项目。当创建这些驱动器的时候，我把分区和文件系统名称都命名了，以至于不论我怎么看我的系统，重要数据的位置都被清楚的标记。

要命名一个分区，你必须知道它的序号：


```
$ parted /dev/sdX print
[...]
Number  Start   End     Size   File system  Name     Flags
 1      1049kB  990MB   989MB  xfs          example
 2      1009MB  1939MB  930MB  ext4         noname
```

要命名分区 1：


```
$ parted /dev/sdX name 1 example
$ parted /dev/sdX print
[...]
Number  Start   End     Size   File system  Name     Flags
 1      1049kB  990MB   989MB  xfs          example
 2      1009MB  1939MB  930MB  ext4         noname
```

### 创建文件系统

要让你的驱动器能够正常使用，你必须在新分区上创建一个文件系统。GNU Parted 没有这样做，因为它只是一个分区管理器。在磁盘上使用 `mkfs` 命令来创建文件系统，而且有些对你有帮助的工具使用别名来创建特定种类的文件系统。例如， `mkfs.ext4` 创建 EXT4 文件系统， `mkfs.xfs` 创建 XFS 文件系统等等。

你的分区位于磁盘驱动器的 "内部" ，所以不用在  `/dev/sdX` 上创建文件系统，只需要在第一个分区创建你的 `/dev/sdX1` 文件系统， `/dev/sdX2` 是第二个文件系统，以此类推。

这里是一个创建 XFS 文件系统的例子：


```
`$ sudo mkfs.xfs -L mydrive /dev/sdX1`
```

### 下载我们的备注表格

Parted 是一个灵活而强大的工具。如本文所示，你可以发出命令，或者激活一个交互模式以不断 "连接" 你指定的驱动器:


```
$ parted /dev/sdX
(parted) print
[...]
Number  Start   End     Size   File system  Name     Flags
 1      1049kB  990MB   989MB  xfs          example
 2      1009MB  1939MB  930MB  ext4         noname

(parted) name 1 mydrive
(parted)
```

如果你打算经常使用 Parted ， [下载我们的 GNU Parted 备忘表格][3]以至于你可以方便使用所有的子命令。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/linux-parted-cheat-sheet

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[hwlife](https://github.com/hwlife)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coverimage_cheat_sheet.png?itok=lYkNKieP (Cheat Sheet cover image)
[2]: https://opensource.com/article/18/11/partition-format-drive-linux#gui
[3]: https://opensource.com/downloads/parted-cheat-sheet
