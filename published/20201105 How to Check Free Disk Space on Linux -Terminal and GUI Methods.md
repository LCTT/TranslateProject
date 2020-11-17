[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12831-1.html)
[#]: subject: (How to Check Free Disk Space on Linux [Terminal and GUI Methods])
[#]: via: (https://itsfoss.com/check-free-disk-space-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何在 Linux 上检查可用的磁盘空间
======

![](https://img.linux.net.cn/data/attachment/album/202011/17/111346h0vrdvldsy6hlhlh.jpg)

> 我已经使用了多少磁盘空间？

在 Linux 上查找可用磁盘空间的最简单的方法是[使用 df 命令][1] 。`df` 命令从字面意思上代表着<ruby>磁盘可用空间<rt>disk free</rt></ruby>，很明显，它将向你显示在 Linux 系统上的可用磁盘空间。

```
df -h
```

使用 `-h` 选项，它将以人类可读的格式（MB 和 GB）来显示磁盘空间。

这里是针对我 Dell XPS 系统的 `df` 命令的输出，它使用了加密磁盘并且只安装了 Linux：

![在 Linux 中使用 df 命令检查可用磁盘空间][2]

如果上面的输出使你感到困惑，不用担心。我将介绍一些关于在 Linux 中检查可用磁盘空间的东西。我也将为桌面 Linux 用户展示 GUI 方法。

### 方法 1: 使用 df 命令来检查在 Linux 中的可用磁盘空间（并理解它的输出）

当你使用 `df` 命令来检查磁盘空间时，它将显示一组“文件系统”，包括它们的大小、使用的空间和可用的空间。你实际的磁盘通常应该下面列表中的一个:

  * `/dev/sda`
  * `/dev/sdb`
  * `/dev/nvme0n1p`

这不是硬性的标准，但是它可以给予你一个指示，它可以让你能够很容易地从一堆文字中辨别出真正的磁盘。

你的 Linux 系统在你的磁盘上可能有一些用于引导 分区、EFI 分区、根分区、交换分区、家目录等的分区。在这种情况下，这些分区在“磁盘名称”的结尾处使用一个数字来标示，像 `/dev/sda1`、`/dev/nvme0n1p2` 等等。

你可以从它们的挂载点来辨认出哪个分区是用于做什么的。根分区挂载在 `/`、EFI 分区在 `/boot/EFI` 等等。

就我的情况来说，我已经使用了根分区下磁盘空间（232 GB）的 41% 。如果你有 2 到 3 个大分区（像根分区、家目录分区等等），你将不得不在这里计算一下已使用的磁盘空间。

![理解 df 命令输出][3]

  * `tmpfs`：[tmpfs][4]（临时文件系统）用于在虚拟存储器中保持文件。你可以随意地忽略这个虚拟文件系统。
  * `udev`：[udev 文件系统][5] 用于存储插入到你系统的设备（像 USB、网卡、CD ROM 等等）的相关信息。你也可以忽略它。
  * `/dev/loop`: 它们是环回设备。由于 snap 应用程序，在 Ubuntu 中查看磁盘时，你将看到很多的这样的设备。环回设备是虚拟设备，它们允许普通文件作为块设备文件来访问。使用环回设备，snap 应用程序在它们自己的虚拟磁盘中进行沙盒处理。尽管它们是在根分区下，但是你不需要单独计算它们使用的磁盘空间。

#### 丢失了磁盘空间？检查你是否挂载了所有是磁盘和分区

记住，`df` 命令仅显示已挂载文件系统的磁盘空间。如果你在同一块磁盘上使用多个 Linux 发行版（或者多个操作系统），或者在你的系统上有多个磁盘，你需要先挂载它们，以便查看在这些分区和磁盘上的可用磁盘空间。

例如，我的 [Intel NUC][6] 有两个 SSD 磁盘，并且在其上有 4 个或 5 个 Linux 分区。仅当我明确地挂载它们时，`df` 命令才会显示更多磁盘。

![][7]

你可以使用 `lsblk` 命令来查看在你系统上的所有磁盘和分区。

![][8]

在你有了磁盘分区名称后，你可以用这种方式来挂载它:

```
sudo mount /dev/sdb2 /mnt
```

我希望这种方法能够给你提供一个在 Linux 上检查硬盘驱动器空间的好主意。让我们看看如何在 GUI 下来完成。

### 方法 2: 在 GUI 下检查可用磁盘使用情况

在 Ubuntu 中使用 “Disk Usage Analyzer” 工具来在 GUI 的方式下检查可用磁盘空间是很容易的。

![Disk Usage Analyzer 工具][9]

在这里，你将看到所有实际的磁盘和分区。你可能需要单击一些分区来挂载它们。它显示所有已挂载分区的磁盘使用情况。

![磁盘使用情况检查][10]

#### 使用 GNOME 的 Disks 实用程序来检查可用磁盘空间

除此之外，GNOME 的 Disks 实用程序也是非常容易使用的工具。

![GNOME 的 Disks 工具][11]

启动工具和选择磁盘。选择一个分区来查看可用磁盘空间。如果没有挂载分区，那么先通过单击 “▶” 图标来挂载它。

![检查 Ubuntu 的桌面版本的可用磁盘空间][12]

我认为在 Linux 上的所有主要桌面环境都有某种图形工具来检查磁盘使用情况。你可以在你是桌面 Linux 系统的菜单中搜索它。

### 结束语

当然，有很多方法和工具来检查磁盘空间。为此，我向你显示了最常用的命令行方法和 GUI 方法。

我也解释一些可能会让你很难理解磁盘使用情况的东西。希望你喜欢它。

如果你有问题或建议，请在评论区告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/check-free-disk-space-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://linuxhandbook.com/df-command/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/free-disk-space-linux-df-command-output.png?resize=786%2C475&ssl=1
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/df-command-output.png?resize=800%2C600&ssl=1
[4]: https://www.kernel.org/doc/html/latest/filesystems/tmpfs.html
[5]: https://wiki.debian.org/udev
[6]: https://itsfoss.com/install-linux-on-intel-nuc/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/df-command-ubuntu-1.png?resize=786%2C443&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/lsblk-command-to-see-disks-linux.png?resize=786%2C538&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/disk-usage-analyzer-tool-linux.jpg?resize=800%2C250&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/free-disk-space-ubuntu-desktop.png?resize=800%2C648&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/disks-tool-linux.jpg?resize=800%2C250&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/free-disk-space-check-ubuntu-desktop.png?resize=800%2C600&ssl=1
