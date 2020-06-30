[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12294-1.html)
[#]: subject: (How to Format a USB Disk as exFAT on Linux [Graphically and Command Line])
[#]: via: (https://itsfoss.com/format-exfat-linux/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

如何在 Linux 上将 USB 盘格式化为 exFAT
======

> 本教程教你如何在 Linux 系统上以 exFAT 格式格式化 USB 盘。同时包括 GUI 和命令行两种方法。

长期以来，[FAT][1] 是用于格式化磁盘文件系统的默认选择。它与几乎所有主要操作系统兼容。

FAT 文件系统的一个主要问题是你不能传输大于 4GB 的文件。这意味着即使你的 USB 盘有 32GB 的可用空间，如果你尝试传输 ISO 镜像或其他大于 4GB 的文件，传输也会失败。

这会[在 Linux 中创建 Windows 的可启动 USB 盘][2]的情况下造成问题。你不能使用 [NTFS][3]，并且 FAT 文件系统有 4GB 的大小限制。

为了克服 FAT 文件系统的限制，微软推出了 [exFAT 文件系统][4]。在本教程中，我将向你展示如何使用 exFAT 文件系统中格式化 USB 盘。

### 先决条件

从 [Linux kernel 5.4][7] 开始，Linux 内核本身中启用了 exFAT 文件系统支持。[检查正在运行的 Linux 内核版本][8]。如果是内核 5.4 或更高版本，那么应该没问题。

不然，你必须[启用 exFAT 支持][9]。在基于 Ubuntu 的发行版中，你可以安装以下软件包：

```
sudo apt install exfat-fuse exfat-utils
```

### 方法 1：使用 GNOME 磁盘工具将磁盘格式化为 exFAT

![][10]

使用 “[GNOME 磁盘][11]” 格式化驱动器是一项简单的工作。它预装在许多 Linux 发行版中。

插入外部 USB 盘。在菜单中查找 “Disk”，然后打开 “GNOME 磁盘” 应用。第一步，选择要格式化的驱动器，然后按照我的步骤操作。

**警告：请注意你要选择格式化的磁盘。请勿意外格式化主磁盘。**

![][12]

诸如 Ext4、NTFS、FAT 之类的常用文件系统将首先出现。要使用 exFAT，请选择 “其它”，然后单击 “下一步”。

![][13]

最后一步：在此页面上选择 exFAT 文件系统，然后单击 “创建”。完成了！

![][14]

看到在 Linux 中以图形方式创建 exFAT 磁盘有多么容易了吧？现在，让我向你展示终端方法。

### 方法 2：在 Linux 命令行中将磁盘格式化为 exFAT（适用于高级用户）

[fdisk][15] 是一个交互式命令行程序，它可在硬盘上创建和操作分区表和分区。实际上，它被认为是 [Linux 最佳分区工具][16]之一。

插入外部硬盘，然后在终端中输入以下命令：

```
sudo fdisk -l
```

![][17]

这将列出计算机中的所有硬盘和分区。识别出要在外部硬盘上格式化的分区。应该会提示磁盘大小。对我而言，USB 盘被标记为 `/dev/sdb1`。

识别出 USB 盘后，请使用以下命令将它格式化为 exfat。将 `/dev/sdXn` 替换为你的磁盘 ID。`LABEL` 是你要为磁盘命名的名称，例如 `Data`、`MyUSB` 等。

```
sudo mkfs.exfat -n LABEL /dev/sdXn
```

![][18]

可选地，运行 `fsck` 检查，以确保格式化正确。

```
sudo fsck.exfat /dev/sdXn
```

就是这样。享受 exFAT 盘吧。

### 你是否成功创建了exFAT 盘？

我希望你觉得本教程足够简单，并建立坚实的分区知识基础的第一步。

从长远来看，有时简单易用的技巧将让你拥有一个更好的 Linux。

--------------------------------------------------------------------------------

via: https://itsfoss.com/format-exfat-linux/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/File_Allocation_Table
[2]: https://itsfoss.com/bootable-windows-usb-linux/
[3]: https://en.wikipedia.org/wiki/NTFS
[4]: https://en.wikipedia.org/wiki/ExFAT
[5]: tmp.YPwoWNgq9W#graphical-method
[6]: tmp.YPwoWNgq9W#command-line
[7]: https://itsfoss.com/linux-kernel-5-4/
[8]: https://itsfoss.com/find-which-kernel-version-is-running-in-ubuntu/
[9]: https://itsfoss.com/mount-exfat/
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/format-exfat-linux.jpg?ssl=1
[11]: https://wiki.gnome.org/Apps/Disks
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/1.-gnome-disks-2.png?ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/2.-gnome-disks.jpg?ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/3.-gnome-disks.jpg?ssl=1
[15]: https://www.tldp.org/HOWTO/Partition/fdisk_partitioning.html
[16]: https://itsfoss.com/partition-managers-linux/
[17]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/sudo-fdisk-l-1.jpg?ssl=1
[18]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/sdXn.jpg?ssl=1
