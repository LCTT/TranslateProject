[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Remove Physical Volume from a Volume Group in LVM)
[#]: via: (https://www.2daygeek.com/linux-remove-delete-physical-volume-pv-from-volume-group-vg-in-lvm/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何从 LVM 的卷组中删除物理卷？
======

如果 LVM 不再需要使用某个设备，你可以使用 vgreduce 命令从卷组中删除物理卷。

vgreduce 命令通过删除物理卷来缩小卷组的容量。

但要确保物理卷没有被任何逻辑卷使用，请使用 pvdisplay 命令。

如果物理卷仍在使用，你必须使用 pvmove 命令将数据转移到另一个物理卷。

数据转移后，它就可以从卷组中删除。

最后使用 pvremove 命令删除空物理卷上的 LVM 标签和 LVM 元数据。

  * **第一部分：[如何在 Linux 中创建/配置 LVM（逻辑卷管理）][1]**。
  * **第二部分：[如何在 Linux 中扩展/增加 LVM 大小（逻辑卷调整）][2]**。
  * **第三部分：[如何在 Linux 中减少/缩小 LVM 大小（逻辑卷调整）][3]**。



![][4]

### 1) 将扩展移动到现有物理卷上

使用 pvs 命令检查是否使用了所需的物理卷（我们计划删除 LVM 中的 **“/dev/sdb1”** 磁盘）。

```
# pvs -o+pv_used

PV VG Fmt Attr PSize PFree Used
/dev/sda1 myvg lvm2 a- 75.00G 14.00G 61.00G
/dev/sdb1 myvg lvm2 a- 50.00G 45.00G 5.00G
/dev/sdc1 myvg lvm2 a- 17.15G 12.15G 5.00G
```

如果使用了，请检查卷组中的其他物理卷是否有足够的空闲空间。

如果有的话，你可以在需要删除的设备上运行 pvmove 命令。扩展将被分配到其他设备上。

```
# pvmove /dev/sdb1

/dev/sdb1: Moved: 2.0%
…
/dev/sdb1: Moved: 79.2%
…
/dev/sdb1: Moved: 100.0%
```

当 pvmove 命令完成后。再次使用 pvs 命令检查物理卷是否有空闲。

```
# pvs -o+pv_used

PV VG Fmt Attr PSize PFree Used
/dev/sda1 myvg lvm2 a- 75.00G 9.00G 66.00G
/dev/sdb1 myvg lvm2 a- 50.00G 50.00G 0
/dev/sdc1 myvg lvm2 a- 17.15G 12.15G 5.00G
```

如果它是空闲的，使用 vgreduce 命令从卷组中删除物理卷 /dev/sdb1。

```
# vgreduce myvg /dev/sdb1
Removed "/dev/sdb1" from volume group "myvg"
```

最后，运行 pvremove 命令从 LVM 配置中删除磁盘。现在，磁盘已经完全从 LVM 中移除，可以用于其他用途。

```
# pvremove /dev/sdb1
Labels on physical volume "/dev/sdb1" successfully wiped.
```

### 2) 移动扩展到新磁盘

如果你在卷组中的其他物理卷上没有足够的可用扩展。使用以下步骤添加新的物理卷。

向存储组申请新的 LUN。分配完毕后，运行以下命令来**[在 Linux 中发现新添加的 LUN 或磁盘][5]**。

```
# ls /sys/class/scsi_host
host0
```

```
# echo "- - -" > /sys/class/scsi_host/host0/scan
```

```
# fdisk -l
```

操作系统中检测到磁盘后，使用 pvcreate 命令创建物理卷。

```
# pvcreate /dev/sdd1
Physical volume "/dev/sdd1" successfully created
```

使用以下命令将新的物理卷 /dev/sdd1 添加到现有卷组 vg01 中。

```
# vgextend vg01 /dev/sdd1
Volume group "vg01" successfully extended
```

现在，使用 pvs 命令查看你添加的新磁盘 **“/dev/sdd1”**。

```
# pvs -o+pv_used

PV VG Fmt Attr PSize PFree Used
/dev/sda1 myvg lvm2 a- 75.00G 14.00G 61.00G
/dev/sdb1 myvg lvm2 a- 50.00G 0 50.00G
/dev/sdc1 myvg lvm2 a- 17.15G 12.15G 5.00G
/dev/sdd1 myvg lvm2 a- 60.00G 60.00G 0
```

使用 pvmove 命令将数据从 /dev/sdb1 移动到 /dev/sdd1。

```
# pvmove /dev/sdb1 /dev/sdd1

/dev/sdb1: Moved: 10.0%
…
/dev/sdb1: Moved: 79.7%
…
/dev/sdb1: Moved: 100.0%
```

数据移动到新磁盘后。再次使用 pvs 命令检查物理卷是否空闲。

```
# pvs -o+pv_used

PV VG Fmt Attr PSize PFree Used
/dev/sda1 myvg lvm2 a- 75.00G 14.00G 61.00G
/dev/sdb1 myvg lvm2 a- 50.00G 50.00G 0
/dev/sdc1 myvg lvm2 a- 17.15G 12.15G 5.00G
/dev/sdd1 myvg lvm2 a- 60.00G 10.00G 50.00G
```

如果空闲，使用 vgreduce 命令从卷组中删除物理卷 /dev/sdb1。

```
# vgreduce myvg /dev/sdb1
Removed "/dev/sdb1" from volume group "myvg"
```

最后，运行 pvremove 命令从 LVM 配置中删除磁盘。现在，磁盘已经完全从 LVM 中移除，可以用于其他用途。

```
# pvremove /dev/sdb1
Labels on physical volume "/dev/sdb1" successfully wiped.
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-remove-delete-physical-volume-pv-from-volume-group-vg-in-lvm/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/create-lvm-storage-logical-volume-manager-in-linux/
[2]: https://www.2daygeek.com/extend-increase-resize-lvm-logical-volume-in-linux/
[3]: https://www.2daygeek.com/reduce-shrink-decrease-resize-lvm-logical-volume-in-linux/
[4]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[5]: https://www.2daygeek.com/scan-detect-luns-scsi-disks-on-redhat-centos-oracle-linux/
