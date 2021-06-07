[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12740-1.html)
[#]: subject: (How to Reduce/Shrink LVM’s \(Logical Volume Resize\) in Linux)
[#]: via: (https://www.2daygeek.com/reduce-shrink-decrease-resize-lvm-logical-volume-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何在 Linux 中减少/缩小 LVM 大小（逻辑卷调整）
======

![](https://img.linux.net.cn/data/attachment/album/202010/21/210459ydp5an23nfzgglyy.jpg)

减少/缩小逻辑卷是数据损坏的最高风险。

所以，如果可能的话，尽量避免这种情况，但如果没有其他选择的话，那就继续。

缩减 LVM 之前，建议先做一个备份。

当你在 LVM 中的磁盘空间耗尽时，你可以通过缩小现有的没有使用全部空间的 LVM，而不是增加一个新的物理磁盘，在卷组上腾出一些空闲空间。

**需要注意的是：** 在 GFS2 或者 XFS 文件系统上不支持缩小。

如果你是逻辑卷管理 （LVM） 的新手，我建议你从我们之前的文章开始学习。

* **第一部分：[如何在 Linux 中创建/配置 LVM（逻辑卷管理）][1]**
* **第二部分：[如何在 Linux 中扩展/增加 LVM（逻辑卷调整）][2]**

![](https://img.linux.net.cn/data/attachment/album/202010/21/210610kikq1xynfje7hjaa.jpeg)

减少逻辑卷涉及以下步骤：

  * 卸载文件系统
  * 检查文件系统是否有任何错误
  * 缩小文件系统的大小
  * 缩小逻辑卷的大小
  * 重新检查文件系统是否存在错误（可选）
  * 挂载文件系统
  * 检查减少后的文件系统大小

**比如：** 你有一个 **100GB** 的没有使用全部空间的 LVM，你想把它减少到 **80GB**，这样 **20GB** 可以用于其他用途。

```
# df -h /testlvm1

Filesystem              Size Used Avail Use% Mounted on
/dev/mapper/vg01-lv002  100G 15G  85G   12%  /testlvm1
```

### 卸载文件系统

使用 `umount` 命令卸载文件系统：

```
# umount /testlvm1
```

### 检查文件系统是否有任何错误

使用 `e2fsck` 命令检查文件系统是否有错误：

```
# e2fsck -f /dev/mapper/vg01-lv002

e2fsck 1.42.9 (28-Dec-2013)
Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory structure
Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information
/dev/mapper/vg01-lv002: 13/6553600 files (0.0% non-contiguous), 12231854/26212352 blocks
```

### 缩小文件系统

下面的命令将把 `testlvm1` 文件系统从 **100GB** 缩小到 **80GB**。

**文件系统大小调整的常用语法（`resize2fs`）**：

```
resize2fs [现有逻辑卷名] [新的文件系统大小]
```

实际命令如下：

```
# resize2fs /dev/mapper/vg01-lv002 80G

resize2fs 1.42.9 (28-Dec-2013)
Resizing the filesystem on /dev/mapper/vg01-lv002 to 28321400 (4k) blocks.
The filesystem on /dev/mapper/vg01-lv002 is now 28321400 blocks long.
```

### 减少逻辑卷 （LVM） 容量

现在使用 `lvreduce` 命令缩小逻辑卷（LVM） 的大小。通过下面的命令， `/dev/mapper/vg01-lv002` 将把逻辑卷 （LVM） 从 100GB 缩小到 80GB。

**LVM 缩减 （`lvreduce`） 的常用语法**：

```
lvreduce [新的 LVM 大小] [现有逻辑卷名称]
```

实际命令如下：

```
# lvreduce -L 80G /dev/mapper/vg01-lv002

WARNING: Reducing active logical volume to 80.00 GiB
THIS MAY DESTROY YOUR DATA (filesystem etc.)
Do you really want to reduce lv002? [y/n]: y
Reducing logical volume lv002 to 80.00 GiB
Logical volume lv002 successfully resized
```

### 可选：检查文件系统是否有错误

缩减 LVM 后再次检查文件系统是否有错误：

```
# e2fsck -f /dev/mapper/vg01-lv002

e2fsck 1.42.9 (28-Dec-2013)
Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory structure
Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information
/dev/mapper/vg01-lv002: 13/4853600 files (0.0% non-contiguous), 1023185/2021235 blocks
```

### 挂载文件系统并检查缩小后的大小

最后挂载文件系统，并检查缩小后的文件系统大小。

使用 `mount` 命令[挂载逻辑卷][4]：

```
# mount /testlvm1
```

使用 [df 命令][5]检查挂载的卷。

```
# df -h /testlvm1

Filesystem              Size Used Avail Use% Mounted on
/dev/mapper/vg01-lv002  80G  15G  65G   18%  /testlvm1
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/reduce-shrink-decrease-resize-lvm-logical-volume-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-12670-1.html
[2]: https://linux.cn/article-12673-1.html
[3]: https://www.2daygeek.com/wp-content/uploads/2020/09/reduce-shrink-decrease-resize-lvm-logical-volume-in-linux-1.png
[4]: https://www.2daygeek.com/mount-unmount-file-system-partition-in-linux/
[5]: https://www.2daygeek.com/linux-check-disk-space-usage-df-command/
