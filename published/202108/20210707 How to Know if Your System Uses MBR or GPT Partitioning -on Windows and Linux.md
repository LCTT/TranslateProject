[#]: subject: (How to Know if Your System Uses MBR or GPT Partitioning [on Windows and Linux])
[#]: via: (https://itsfoss.com/check-mbr-or-gpt/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (alim0x)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13727-1.html)

如何在 Windows 和 Linux 上确定系统使用的是 MBR 还是 GPT 分区
======

![](https://img.linux.net.cn/data/attachment/album/202108/28/165508gqjyigp3yz3gy6yy.jpg)

在你安装 Linux 或任何其他系统的时候，了解你的磁盘的正确分区方案是非常关键的。

目前有两种流行的分区方案，老一点的 MBR 和新一些的 GPT。现在大多数的电脑使用 GPT。

在制作临场镜像或可启动 USB 设备时，一些工具（比如 [Rufus][1]）会问你在用的磁盘分区情况。如果你在 MBR 分区的磁盘上选择 GPT 方案的话，制作出来的可启动 USB 设备可能会不起作用。

在这个教程里，我会展示若干方法，来在 Windows 和 Linux 系统上检查磁盘分区方案。

### 在 Windows 上检查系统使用的是 MBR 还是 GPT

尽管在 Windows 上包括命令行在内有不少方法可以检查磁盘分区方案，这里我还是使用图形界面的方式查看。

按下 Windows 按键然后搜索“disk”，然后点击“**创建并格式化硬盘分区**”。

![][2]

在这里，**右键点击**你想要检查分区方案的磁盘。在右键菜单里**选择属性**。

![右键点击磁盘并选择属性][3]

在属性窗口，切换到**卷**标签页，寻找**磁盘分区形式**属性。

![在卷标签页寻找磁盘分区形式属性][4]

正如你在上面截图所看到的，磁盘正在使用 GPT 分区方案。对于一些其他系统，它可能显示的是 MBR 或 MSDOS 分区方案。

现在你知道如何在 Windows 下检查磁盘分区方案了。在下一部分，你会学到如何在 Linux 下进行检查。

### 在 Linux 上检查系统使用的是 MBR 还是 GPT

在 Linux 上也有不少方法可以检查磁盘分区方案使用的是 MBR 还是 GPT。既有命令行方法也有图形界面工具。

让我先给你演示一下命令行方法，然后再看看一些图形界面的方法。

#### 在 Linux 使用命令行检查磁盘分区方案

命令行的方法应该在所有 Linux 发行版上都有效。

打开终端并使用 `sudo` 运行下列命令：

```
sudo parted -l
```

上述命令实际上是一个基于命令行的 [Linux 分区管理器][5]。命令参数 `-l` 会列出系统中的所有磁盘以及它们的详情，里面包含了分区方案信息。

在命令输出中，寻找以 **Partition Table**（分区表）开头的行：

![][6]

在上面的截图中，磁盘使用的是 GPT 分区方案。如果是 **MBR**，它会显示为 **msdos**。

你已经学会了命令行的方式。但如果你不习惯使用终端，你还可以使用图形界面工具。

#### 使用 GNOME Disks 工具检查磁盘信息

Ubuntu 和一些其它基于 GNOME 的发行版内置了叫做 Disks 的图形工具，你可以用它管理系统中的磁盘。

你也可以使用它来获取磁盘的分区类型。

![][7]

#### 使用 Gparted 图形工具检查磁盘信息

如果你没办法使用 GNOME Disks 工具，别担心，还有其它工具可以使用。

其中一款流行的工具是 Gparted。你应该可以在大多数 Linux 发行版的软件源中找到它。如果系统中没有安装的话，使用你的发行版的软件中心或 [包管理器][9] 来 [安装 Gparted][8]。

在 Gparted 中，通过菜单选择 **View->Device Information**（查看—>设备信息）。它会在左下区域显示磁盘信息，这些信息中包含分区方案信息。

![][10]

看吧，也不是太复杂，对吗？现在你了解了好几种途径来确认你的系统使用的是 GPT 还是 MBR 分区方案。

同时我还要提一下，有时候磁盘还会有 [混合分区方案][11]。这不是很常见，大多数时候分区不是 MBR 就是 GPT。

有任何问题或建议，请在下方留下评论。

--------------------------------------------------------------------------------

via: https://itsfoss.com/check-mbr-or-gpt/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[alim0x](https://github.com/alim0x)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://rufus.ie/en_US/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/03/disc-management-windows.png?resize=800%2C561&ssl=1
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/gpt-check-windows-1.png?resize=800%2C603&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/gpt-check-windows-2-1.png?resize=800%2C600&ssl=1
[5]: https://itsfoss.com/partition-managers-linux/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/07/check-if-mbr-or-gpt-in-Linux.png?resize=800%2C446&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/07/check-if-mbr-or-gpt-in-Linux-gui.png?resize=800%2C548&ssl=1
[8]: https://itsfoss.com/gparted/
[9]: https://itsfoss.com/package-manager/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/07/check-disk-partitioning-scheme-linux-gparted.jpg?resize=800%2C555&ssl=1
[11]: https://www.rodsbooks.com/gdisk/hybrid.html
