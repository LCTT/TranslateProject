[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11770-1.html)
[#]: subject: (App Highlight: Open Source Disk Partitioning Tool GParted)
[#]: via: (https://itsfoss.com/gparted/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

应用推荐：开源磁盘分区工具 GParted
======

![](https://img.linux.net.cn/data/attachment/album/202001/10/220015lp58jjjt22xfppjj.jpg)

> GParted 是一个可用于 Linux 发行版的非常受欢迎且免费的分区编辑器。在这里，我们简要地介绍一下它提供的功能。

### GParted：一个自由开源的图形化分区管理器

![][1]

GParted 无疑是 [Linux 下的最好的分区管理器][2]之一。用户界面非常简单而可以完成任务。

在某些情况下，你最终还是会使用 [GParted][3] 来修复或格式化你的 USB 驱动器。我有一个[在 Ubuntu 中使用“磁盘”应用程序不能格式化的 USB 磁盘][4]，而这是 GParted 用来救援的地方。

所以，它是一个非常有用的工具，有很多出色的功能。让我为你们重点介绍一下。

> 警告！
> 
> 进行磁盘分区是一件危险的工作。除非绝对必要，否则不要做。否则，你可能最终擦除了整个磁盘。

### GParted 的功能

从简单地格式化任务到重要的分区任务，你可以使用 GParted 做很多事。我将使用一些屏幕截图突出关键功能，以帮助你在安装它前进一步了解它。

#### 创建分区表

你可以为新磁盘创建一个新的分区表，也可以擦除你现存的磁盘内容来修改分区表。

![][5]

你能够选择 msdos、gpt、atari，以及更多类型的分区表。

#### 创建、移动、标记、删除和修改分区表

你可以使用 GParted 中一系列选项来轻松地创建、标记、删除或修改分区表。

![][6]

当然，你必须要谨慎你要做的事情。

好的是，GParted 可以确保你不能直接应用任何更改 —— 在你点击应用更改之前，它将排队你选择的操作/任务，并在你执行前最后再要求确认一次。

顶部的对号标记符号 `✓` 可以让你确认更改，然后你的更改才会生效。

这是分区可用选项的另一个屏幕截图：

![][7]

#### 尝试数据救援

除了编辑分区以外，你也可以试着使用“尝试数据救援”功能以[在 Linux 中恢复丢失的数据][8]，如下面的屏幕截图所示。

![][9]

值得注意的是，默认情况下你没有安装此功能 —— 你只是能看到这个选项。因此，要使这个数据恢复功能可以正常工作，你必须使用下面的命令来单独地安装 gpart (在基于 Ubuntu/Debian 的发行版上)：

```
sudo apt install gpart
```

除了所有这些关键功能以外，它支持各种存储设备和文件系统。你可以从其官方网站的[功能列表][10]中了解到更多信息。

### 在 Ubuntu 和其它 Linux 发行版上安装 GParted

你可能已经预安装了 GParted 。所以，务必核实一下。如果你尚未安装它，则可以进入软件中心安装它。

如果你想使用终端，简单地键入下面的命令：

```
sudo apt install gparted
```

如上所述，如果你想要使用数据恢复选项，除了安装 gparted 软件包外，还应该安装 gpart 软件包。

如果你使用的是其它 Linux 发行版，你可以在各自的软件管理器中找到它，或者直接查看[官方下载操作说明][11]。

- [下载 GParted][11]

### 总结

当涉及处理磁盘管理和分区时，GParted 是一个非常有用且重要的工具。但是，因为显而易见的原因，当你使用它时，你必须要小心。

你尝试过 GParted 吗？你在 Linux 上使用的其它哪个分区工具？请在下面的评论中分享你的经验。

--------------------------------------------------------------------------------

via: https://itsfoss.com/gparted/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

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
