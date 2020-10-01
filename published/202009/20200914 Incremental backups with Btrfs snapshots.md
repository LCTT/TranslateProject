[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12653-1.html)
[#]: subject: (Incremental backups with Btrfs snapshots)
[#]: via: (https://fedoramagazine.org/btrfs-snapshots-backup-incremental/)
[#]: author: (Alessio https://fedoramagazine.org/author/alciregi/)

使用 Btrfs 快照进行增量备份
======

![](https://img.linux.net.cn/data/attachment/album/202009/26/112524cppfppjpvplyjzyx.jpg)

<ruby>快照<rt>snapshot</rt></ruby>是 Btrfs 的一个有趣的功能。快照是一个子卷的副本。生成快照是立即的。然而，生成快照与执行 `rsync` 或 `cp` 不同，快照并不是一创建就会占用空间。

> 编者注：来自 [BTRFS Wiki][2]：快照简单的来说就是一个子卷，它使用 Btrfs 的 COW 功能与其他子卷共享其数据（和元数据）。

占用的空间将随着原始子卷或快照本身（如果它是可写的）的数据变化而增加。子卷中已添加/修改的文件和已删除的文件仍然存在于快照中。这是一种方便的备份方式。

### 使用快照进行备份

快照驻留在子卷所在的同一磁盘上。你可以像浏览普通目录一样浏览它，并按照生成快照时的状态恢复文件的副本。顺便说一下，在快照子卷的同一磁盘上生成快照并不是一个理想的备份策略：如果硬盘坏了，快照也会丢失。快照的一个有趣的功能是可以将快照发送到另一个位置。快照可以被发送到外部硬盘或通过 SSH 发送到远程系统（目标文件系统也需要格式化为 Btrfs）。要实现这个，需要使用命令 `btrfs send` 和 `btrfs receive`。

### 生成快照

要使用 `btrfs send` 和 `btrfs receive` 命令，重要的是要将快照创建为只读，而快照默认是可写的。

下面的命令将对 `/home` 子卷进行快照。请注意 `-r` 标志代表只读。

```
sudo btrfs subvolume snapshot -r /home /.snapshots/home-day1
```

快照的名称可以是当前日期，而不是 `day1`，比如 `home-$(date +%Y%m%d)`。快照看起来像普通的子目录。你可以把它们放在任何你喜欢的地方。目录 `/.snapshots` 可能是一个不错的选择，以保持它们的整洁和避免混淆。

> 编者注：快照不会对自己进行递归快照。如果你创建了一个子卷的快照，子卷所包含的每一个子卷或快照都会被映射到快照里面的一个同名的空目录。

### 使用 btrfs send 进行备份

在本例中，U 盘中的目标 Btrfs 卷被挂载为 `/run/media/user/mydisk/bk`。发送快照到目标卷的命令是：

```
sudo btrfs send /.snapshots/home-day1 | sudo btrfs receive /run/media/user/mydisk/bk
```

这被称为初始启动，它相当于一个完整的备份。这个任务需要一些时间，取决于 `/home` 目录的大小。显然，后续的增量发送只需要更短的时间。

### 增量备份

快照的另一个有用的功能是能够以增量的方式执行发送任务。让我们再来生成一个快照。

```
sudo btrfs subvolume snapshot -r /home /.snapshots/home-day2
```

为了执行增量发送任务，需要指定上一个快照作为基础，并且这个快照必须存在于源文件和目标文件中。请注意 `-p` 选项。

```
sudo btrfs send -p /.snapshot/home-day1 /.snapshot/home-day2 | sudo btrfs receive /run/media/user/mydisk/bk
```

再来一次（一天之后）：

```
sudo btrfs subvolume snapshot -r /home /.snapshots/home-day3

sudo btrfs send -p /.snapshot/home-day2 /.snapshot/home-day3 | sudo btrfs receive /run/media/user/mydisk/bk
```

### 清理

操作完成后，你可以保留快照。但如果你每天都执行这些操作，你可能最终会有很多快照。这可能会导致混乱，并可能会在你的磁盘上使用大量的空间。因此，如果你认为你不再需要一些快照，删除它们是一个很好的建议。

请记住，为了执行增量发送，你至少需要最后一个快照。这个快照必须存在于源文件和目标文件中。

```
sudo btrfs subvolume delete /.snapshot/home-day1
sudo btrfs subvolume delete /.snapshot/home-day2
sudo btrfs subvolume delete /run/media/user/mydisk/bk/home-day1
sudo btrfs subvolume delete /run/media/user/mydisk/bk/home-day2
```

注意：第 3 天的快照被保存在源文件和目标文件中。这样，明天（第 4 天），你就可以执行新的增量 `btrfs send`。

最后的建议是，如果 U 盘的空间很大，可以考虑在目标盘中保留多个快照，而在源盘中只保留最后一个快照。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/btrfs-snapshots-backup-incremental/

作者：[Alessio][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/alciregi/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/08/butterfs-816x346.png
[2]: https://btrfs.wiki.kernel.org/index.php/SysadminGuide#Snapshots
