[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12864-1.html)
[#]: subject: (Reclaim hard-drive space with LVM)
[#]: via: (https://fedoramagazine.org/reclaim-hard-drive-space-with-lvm/)
[#]: author: (Troy Curtis Jr https://fedoramagazine.org/author/troycurtisjr/)

使用 LVM 扩展卷空间
======

![](https://img.linux.net.cn/data/attachment/album/202011/27/193719d3df4p4z748f33f3.jpg)

LVM 是一个逻辑卷管理工具，包括分配磁盘、条带化、镜像和调整逻辑卷的大小。它在 Fedora 安装中被普遍使用（在 BTRFS 作为默认文件系统之前是 LVM + Ext4）。但是你是否曾经遇到过启动系统时，GNOME 提示 home 卷几乎没有空间了！幸运的是，很有可能有一些空间在另一个卷中，而未被使用，可以用于重新分配。下面就来看看如何用 LVM 回收硬盘空间。

在卷之间轻松重新分配空间的关键是[逻辑卷管理器（LVM）][2]。Fedora 32 及以前的系统默认使用 LVM 来划分磁盘空间。这种技术类似于标准的硬盘分区，但 LVM 更加灵活。LVM 不仅可以实现灵活的卷大小管理，还可以实现一些高级功能，比如读写快照、在多个硬盘上进行数据条带化或镜像、将高速硬盘作为慢速硬盘的缓存等等。所有这些高级选项可能会让人有点不知所措，但调整卷的大小很简单的。

### LVM 基础

**卷组**（VG）作为 LVM 系统中的主要容器。默认情况下，Fedora 只定义了一个卷组，但你可以根据需要定义多个卷组。实际的硬盘和硬盘分区被添加到卷组中作为**物理卷**（PV）。物理卷会将可用的空间添加到卷组中。一个典型的 Fedora 安装有一个格式化的启动分区，其余的硬盘是一个配置为 LVM 物理卷的分区。

从这个可用空间池中，卷组分配了一个或多个**逻辑卷**（LV）。这些卷类似于硬盘分区，但没有磁盘上连续空间的限制。LVM 的逻辑卷甚至可以跨越多个设备！就像硬盘分区一样，逻辑卷有一个定义的大小，可以包含任何文件系统，然后可以挂载到特定的目录。

### 需要什么

在 gnome-disks 应用中确认系统使用 LVM ，并确保其他卷中有可用的空间。如果没有可以从另一个卷中回收的空间，这个指南就没有用。还需要一个 [Fedora 临场 CD/USB][3]。任何需要收缩的文件系统都必须卸载。从<ruby>临场<rt>Live</rt></ruby>镜像运行，可以让硬盘上的所有卷保持未挂载状态，甚至包括像 `/` 和 `/home` 这样的重要目录。

![Use gnome-disks to verify free space][4]

### 一句话警告

按照这个指南，应该不会丢失任何数据，但它确实会使用一些非常底层和强大的命令。一个错误可能会破坏硬盘上的所有数据。所以要先备份磁盘上的所有数据！

### 调整 LVM 卷的大小

开始时，启动 Fedora 临场镜像并在对话框中选择 “Try Fedora”。接下来，使用 “Run Command” 启动 “blivet-gui” 应用（按 `Alt-F2`，输入 `blivet-gui`，然后按回车）。选择左侧 “LVM” 下的卷组。逻辑卷在右边。

![Explore logical volumes in blivet-gui][5]

逻辑卷标签由卷组名称和逻辑卷名称组成。在本例中，卷组是 `fedora_localhost-live`，分配了 `home`、`root` 和 `swap` 逻辑卷。要找到完整的卷，选择每一个卷，点击“齿轮”图标，然后选择 “resize”。调整大小对话框中的滑块表示卷的允许大小。左边的最小值是文件系统中已经使用的空间，所以这是最小可能的尺寸大小（不删除数据）。右边的最大值是基于卷组中的最大可用空间。

![Resize dialog in blivet-gui][6]

灰色的 “resize” 选项意味着该卷已经满了，而且卷组中没有可用空间。

现在可以更改大小了！查看所有的卷，就像上面的截图那样，找到一个有足够空间的卷。并像上面的截图那样，在所有的卷中找到一个有大量额外空间的卷。向左移动滑块来设置新的大小。腾出足够的空间对整个卷有用，但仍然要为未来的数据增长留出足够的空间。否则，这个卷将是下一个被填满的卷。

点击 “resize”，注意卷列表中出现了一个新项目：“free space”。现在选择这次要调整的卷，并将滑块一直向右移动。按 “resize” 键，并查看新改进的卷的布局。然而，硬盘驱动器上的任何东西现在都还没有改变。点击“勾选”选项将更改提交到磁盘。

![Review changes in blivet-gui][7]

查看更改的摘要，如果一切看起来都是正确的，点击 “Ok” 继续。等待 “blivet-gui” 完成。现在重新启动回到 Fedora，可以使用之前被充满的卷上的新空间了。

### 为未来计划

要知道任何特定卷在未来需要多少空间是很困难的。与其立即分配所有可用的空闲空间，不如考虑在卷组中留出空闲空间。事实上，Fedora Server 默认在卷组中保留空间。当一个卷处于在线和使用中时，扩展卷是可能的。不需要临场镜像或重启。当一个卷几乎满的时候，可以使用部分可用空间轻松扩展卷并继续工作。遗憾的是，默认的磁盘管理器 gnome-disks 不支持 LVM 卷的大小调整，所以安装 [blivet-gui][8] 作为图形化管理工具。另外，还有一个简单的终端命令来扩展卷：

```
lvresize -r -L +1G /dev/fedora_localhost-live/root
```

### 总结

用 LVM 回收硬盘空间只是 LVM 功能的表面。大多数人，特别是在桌面中，可能不需要更高级的功能。然而，当需要的时候，LVM 就在那里，尽管它的实现可能会变得有点复杂。从 [Fedora 33][10] 开始，[BTRFS][9] 是默认的文件系统，没有 LVM。BTRFS 可以更容易管理，同时对于大多数常见的使用来说也足够灵活。查看最近 [Fedora Magazine 关于 BTRFS 的文章][11]了解更多。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/reclaim-hard-drive-space-with-lvm/

作者：[Troy Curtis Jr][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/troycurtisjr/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/11/lvm-resize-816x345.jpg
[2]: http://sourceware.org/lvm2/
[3]: https://getfedora.org/en/workstation/download/
[4]: https://fedoramagazine.org/wp-content/uploads/2020/11/gnome-disks.png
[5]: https://fedoramagazine.org/wp-content/uploads/2020/11/blivet-overview.png
[6]: https://fedoramagazine.org/wp-content/uploads/2020/11/blivet-resize-1024x525.png
[7]: https://fedoramagazine.org/wp-content/uploads/2020/11/blivet-summary-1024x525.png
[8]: https://fedoraproject.org/wiki/Blivet-gui
[9]: https://fedoramagazine.org/btrfs-coming-to-fedora-33/
[10]: https://fedoramagazine.org/whats-new-fedora-33-workstation/
[11]: https://fedoramagazine.org/btrfs-snapshots-backup-incremental/
