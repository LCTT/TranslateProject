[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12673-1.html)
[#]: subject: (How to Extend/Increase LVM’s in Linux)
[#]: via: (https://www.2daygeek.com/extend-increase-resize-lvm-logical-volume-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何在 Linux 中扩展/增加 LVM 大小（逻辑卷调整）
======

![](https://img.linux.net.cn/data/attachment/album/202010/01/234018qgnwilmmzom8xarb.jpg)

扩展逻辑卷非常简单，只需要很少的步骤，而且不需要卸载某个逻辑卷就可以在线完成。

LVM 的主要目的是灵活的磁盘管理，当你需要的时候，可以很方便地调整、扩展和缩小逻辑卷的大小。

如果你是逻辑卷管理（LVM） 新手，我建议你从我们之前的文章开始学习。

  * **第一部分：[如何在 Linux 中创建/配置 LVM（逻辑卷管理）][1]**

![](https://img.linux.net.cn/data/attachment/album/202010/01/233946ybwbnw4zanjbn00e.jpeg)

扩展逻辑卷涉及到以下步骤：

  * 检查逻辑卷（LV）所在的卷组中是否有足够的未分配磁盘空间
  * 如果有，你可以使用这些空间来扩展逻辑卷
  * 如果没有，请向系统中添加新的磁盘或 LUN
  * 将物理磁盘转换为物理卷（PV）
  * 扩展卷组
  * 增加逻辑卷大小
  * 扩大文件系统
  * 检查扩展的文件系统大小

### 如何创建 LVM 物理卷？

使用 `pvcreate` 命令创建 LVM 物理卷。

当在操作系统中检测到磁盘，使用 `pvcreate` 命令初始化 LVM 物理卷：

```
# pvcreate /dev/sdc
Physical volume "/dev/sdc" successfully created
```

**请注意：**

  * 上面的命令将删除磁盘 `/dev/sdc` 上的所有数据。
  * 物理磁盘可以直接添加到 LVM 物理卷中，而不是磁盘分区。

使用 `pvdisplay` 命令来显示你所创建的物理卷：

```
# pvdisplay /dev/sdc

"/dev/sdc" is a new physical volume of "10.00 GiB"
--- NEW Physical volume ---
PV Name               /dev/sdc
VG Name
PV Size               10.00 GiB
Allocatable           NO
PE Size               0
Total PE              0
Free PE               0
Allocated PE          0
PV UUID               69d9dd18-36be-4631-9ebb-78f05fe3217f
```

### 如何扩展卷组

使用以下命令在现有的卷组（VG）中添加一个新的物理卷：

```
# vgextend vg01 /dev/sdc
Volume group "vg01" successfully extended
```

使用 `vgdisplay` 命令来显示你所创建的物理卷：

```
# vgdisplay vg01
--- Volume group ---
VG Name              vg01
System ID
Format               lvm2
Metadata Areas       2
Metadata Sequence No 1
VG Access            read/write
VG Status            resizable
MAX LV               0
Cur LV               0
Open LV              0
Max PV               0
Cur PV               2
Act PV               2
VG Size              14.99 GiB
PE Size              4.00 MiB
Total PE             3840
Alloc PE / Size      1280 / 4.99
Free PE / Size       2560 / 9.99 GiB
VG UUID              d17e3c31-e2c9-4f11-809c-94a549bc43b7
```

### 如何扩展逻辑卷？

使用以下命令增加现有逻辑卷大小。

**逻辑卷扩展（`lvextend`）的常用语法：**

```
lvextend [要增加的额外空间] [现有逻辑卷名称]
```

使用下面的命令将现有的逻辑卷增加 10GB：

```
# lvextend -L +10G /dev/mapper/vg01-lv002
Rounding size to boundary between physical extents: 5.90 GiB
Size of logical volume vg01/lv002 changed from 5.00 GiB (1280 extents) to 15.00 GiB (3840 extents).
Logical volume var successfully resized
```

使用 PE 大小来扩展逻辑卷：

```
# lvextend -l +2560 /dev/mapper/vg01-lv002
```

要使用百分比（%）扩展逻辑卷，请使用以下命令：

```
# lvextend -l +40%FREE /dev/mapper/vg01-lv002
```

现在，逻辑卷已经扩展，你需要调整文件系统的大小以扩展逻辑卷内的空间：

对于基于 ext3 和 ext4 的文件系统，运行以下命令：

```
# resize2fs /dev/mapper/vg01-lv002
```

对于 xfs 文件系统，使用以下命令：

```
# xfs_growfs /dev/mapper/vg01-lv002
```

使用 [df 命令][3]查看文件系统大小：

```
# df -h /lvmtest1
Filesystem Size Used Avail Use% Mounted on
/dev/mapper/vg01-lv002 15360M 34M 15326M 4% /lvmtest1
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/extend-increase-resize-lvm-logical-volume-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-12670-1.html
[2]: https://www.2daygeek.com/wp-content/uploads/2020/09/extend-increase-resize-lvm-logical-volume-in-linux-3.png
[3]: https://www.2daygeek.com/linux-check-disk-space-usage-df-command/
