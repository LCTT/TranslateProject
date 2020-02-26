[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11196-1.html)
[#]: subject: (5 Free Partition Managers for Linux)
[#]: via: (https://itsfoss.com/partition-managers-linux/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

5 个免费的 Linux 分区管理器
======

> 以下是我们推荐的 Linux 分区工具。它们能让你删除、添加、调整或缩放 Linux 系统上的磁盘分区。

通常，你在安装操作系统时决定磁盘分区。但是，如果你需要在安装后的某个时间修改分区，该怎么办？你无法回到系统安装阶段。因此，这就需要分区管理器（或准确地说是磁盘分区管理器）上场了。

在大多数情况下，你无需单独安装分区管理器，因为它已预先安装。此外，值得注意的是，你可以选择基于命令行或有 GUI 的分区管理器。

**注意！**

> 磁盘分区是一项有风险的任务。除非绝对必要，否则不要这样做。
> 
> 如果你使用的是基于命令行的分区工具，那么需要学习完成任务的命令。否则，你可能最终会擦除整个磁盘。

### Linux 中的 5 个管理磁盘分区的工具

![][1]

下面的列表没有特定的排名顺序。大多数分区工具应该存在于 Linux 发行版的仓库中。

#### GParted

![GParted][2]

这可能是 Linux 发行版中最流行的基于 GUI 的分区管理器。你可能已在某些发行版中预装它。如果还没有，只需在软件中心搜索它即可完成安装。

它会在启动时直接提示你以 root 用户进行身份验证。所以，你根本不需要在这里使用终端。身份验证后，它会分析设备，然后让你调整磁盘分区。如果发生数据丢失或意外删除文件，你还可以找到“尝试数据救援”的选项。

- [GParted][3]

#### GNOME Disks

![Gnome Disks][4]

一个基于 GUI 的分区管理器，随 Ubuntu 或任何基于 Ubuntu 的发行版（如 Zorin OS）一起出现。

它能让你删除、添加、缩放和微调分区。如果你遇到故障，它甚至可以[在 Ubuntu 中格式化 USB][6] 来帮助你救援机器。

你甚至可以借助此工具尝试修复分区。它的选项还包括编辑文件系统、创建分区镜像、还原镜像以及对分区进行基准测试。

- [GNOME Disks][7]

#### KDE Partition Manager

![Kde Partition Manager][8]

KDE Partition Manager 应该已经预装在基于 KDE 的 Linux 发行版上了。但是，如果没有，你可以在软件中心搜索并轻松安装它。

如果你不是预装的，那么可能会在尝试启动时通知你没有管理权限。没有管理员权限，你无法做任何事情。因此，在这种情况下，请输入以下命令：

```
sudo partitionmanager
```

它将扫描你的设备，然后你就可以创建、移动、复制、删除和缩放分区。你还可以导入/导出分区表及使用其他许多调整选项。

- [KDE Partition Manager][9]

#### Fdisk（命令行）

![Fdisk][10]

[fdisk][11] 是一个命令行程序，它在每个类 Unix 的系统中都有。不要担心，即使它需要你启动终端并输入命令，但这并不是很困难。但是，如果你在使用基于文本的程序时感到困惑，那么你应该继续使用上面提到的 GUI 程序。它们都做同样的事情。

要启动 `fdisk`，你必须是 root 用户并指定管理分区的设备。以下是该命令的示例：

```
sudo fdisk /dev/sdc
```

你可以参考 [Linux 文档项目的维基页面][12]以获取命令列表以及有关其工作原理的更多详细信息。

#### GNU Parted（命令行）

![Gnu Parted][13]

这是在你 Linux 发行版上预安装的另一个命令行程序。你需要输入下面的命令启动：

```
sudo parted
```

### 总结

我不会忘了说 [QtParted][15] 是分区管理器的替代品之一。但它已经几年没有维护，因此我不建议使用它。

你如何看待这里提到的分区管理器？我有错过你最喜欢的吗？让我知道，我将根据你的建议更新这个 Linux 分区管理器列表。

--------------------------------------------------------------------------------

via: https://itsfoss.com/partition-managers-linux/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/07/disk-partitioning-tools-linux.jpg?resize=800%2C450&ssl=1
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/07/g-parted.png?ssl=1
[3]: https://gparted.org/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/07/gnome-disks.png?ssl=1
[6]: https://itsfoss.com/format-usb-drive-sd-card-ubuntu/
[7]: https://wiki.gnome.org/Apps/Disks
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/07/kde-partition-manager.jpg?resize=800%2C404&ssl=1
[9]: https://kde.org/applications/system/org.kde.partitionmanager
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/07/fdisk.jpg?fit=800%2C496&ssl=1
[11]: https://en.wikipedia.org/wiki/Fdisk
[12]: https://www.tldp.org/HOWTO/Partition/fdisk_partitioning.html
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/07/gnu-parted.png?fit=800%2C559&ssl=1
[15]: http://qtparted.sourceforge.net/
