[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (App Highlight: Open Source Disk Partitioning Tool GParted)
[#]: via: (https://itsfoss.com/gparted/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

应用程序推荐：开源磁盘分区工具 GParted
======

_**摘要：GParted 是一个非常流行的自由的可用于 Linux 发行版的分区编辑器。在这里，我们简单地看看它提供了什么。**_

### GParted：一个基于自由和开放源码的图形化分区管理器

![][1]

GParted 无疑是[在 Linux 下的最好的分区管理器][2]之一。用户界面非常简单，可用完成任务。

在一些情况下，你最终也需要使用 [GParted][3] 来修复或格式化你的 USB 驱动器。我有一个[我不能在 Ubuntu 中格式化的 USB 磁盘][4]，使用该“磁盘”应用程序 – 这里是 GParted 用来救援的地方。

所以，它是非常有用的工具，有很多好的特色。让我为你们推荐一下。

警告！

玩弄磁盘分区是一件危险的工作。除非绝对必要，否则不要做。否则，你可能最终会擦除整个磁盘。

### GParted 的特色

你可以使用 GParted 做很多事，排列一下简单地格式化任务到重要的分区任务。我将使用一些屏幕截图推荐关键特色，以帮助你在安装它前了解更多信息。

#### 创建分区表

你可以为你的新的磁盘创建一个新的分区表，或者擦除你现存的磁盘内容来修改分区表。

![][5]

你将能够选择 msdos ，gpt ，atari ，以及更多类型的分区表。

#### 创建，移动，标记，删除和修改分区表

你可以使用 GParted 中一系列可用的选项来简单地创建，标记，删除或修改分区表。

![][6]

当然，你将不得不小心你想做什么。

好的一些东西是，GParted 确保你不能直接应用任何更改 – 在你点击应用更改之前，它将排队你选择的操作/任务，并询问另外一处最后的确认。

在顶部的对号标记符号 ✓ 允许你来确认更改，只有你更改时开始生效。

这样有另一个你可用的分区选项的屏幕截图：

![][7]

#### 尝试数据救援

除了编辑分区，你也可以尝试使用“**尝试数据救援**”特色以[在Linux 中恢复你丢失的数据][8]，像下面的屏幕截图所示。

![][9]

值得注意的是，默认情况下你没有安装这个功能 – 你仅能看到可见的选项。所以，对于数据恢复特色作业来说，你必需使用下面的命令来单独地安装 gpart (在基于 Ubuntu/Debian 的发行版上)：

```
sudo apt install gpart
```

除了所有关键的特色外，它支持大量的存储设备和文件系统。在它们的官方网站上，你可以从[特色列表][10]中学到很多。

### 在 Ubuntu 和其它 Linux 发行版上安装 GParted

你可能已经预先安装 GParted 。所以，务必核实一下。如果你没有安装它，你可以前往进入软件中心安装它。

以备你想使用终端，简单地键入下面的命令：

```
sudo apt install gparted
```

像我如上所述，如果你想要数据恢复选项，除了 gparted 软件包外，你应该安装 gpart 软件包。

如果你正在使用一些其它 Linux 发行版，你可以在各自的软件管理器中找到它，或者简单地查看[官方下载操作指南][11]。

[下载 GParted][11]

**总结**

当涉及处理磁盘管理和分区时，GParted 是一个非常有用和重要的工具。但是，因为显而易见的原因，当你使用它时，你将不得不小心。

你尝试过 GParted 吗？你在 Linux 上使用的其它分区工具是什么？请在下面的评论中分享你的体验。

--------------------------------------------------------------------------------

via: https://itsfoss.com/gparted/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/gparted-screenshot.png?ssl=1
[2]: https://itsfoss.com/partition-managers-linux/
[3]: https://gparted.org/
[4]: https://itsfoss.com/format-usb-drive-sd-card-ubuntu/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/gparted-create-partition-table.png?ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/gparted-modify-partitions.png?ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/gparted-partition-options.png?ssl=1
[8]: https://itsfoss.com/recover-deleted-files-linux/
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/gparted-attempt-data-rescue-feature.png?ssl=1
[10]: https://gparted.org/features.php
[11]: https://gparted.org/download.php
