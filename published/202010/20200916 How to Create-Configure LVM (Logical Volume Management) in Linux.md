[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12670-1.html)
[#]: subject: (How to Create/Configure LVM in Linux)
[#]: via: (https://www.2daygeek.com/create-lvm-storage-logical-volume-manager-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何在 Linux 中创建/配置 LVM（逻辑卷管理）
======

![](https://img.linux.net.cn/data/attachment/album/202010/01/111414m2y0mdhgvd9j1bgv.jpg)

<ruby>逻辑卷管理<rt>Logical Volume Management</rt></ruby>（LVM）在 Linux 系统中扮演着重要的角色，它可以提高可用性、磁盘 I/O、性能和磁盘管理的能力。

LVM 是一种被广泛使用的技术，对于磁盘管理来说，它是非常灵活的。

它在物理磁盘和文件系统之间增加了一个额外的层，允许你创建一个逻辑卷而不是物理磁盘。

LVM 允许你在需要的时候轻松地调整、扩展和减少逻辑卷的大小。

![](https://img.linux.net.cn/data/attachment/album/202010/01/111230el14fubc4ku55o3k.jpeg)

### 如何创建 LVM 物理卷？

你可以使用任何磁盘、RAID 阵列、SAN 磁盘或分区作为 LVM <ruby>物理卷<rt>Physical Volume</rt></ruby>（PV）。

让我们想象一下，你已经添加了三个磁盘，它们是 `/dev/sdb`、`/dev/sdc` 和 `/dev/sdd`。

运行以下命令来[发现 Linux 中新添加的 LUN 或磁盘][2]：

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

**创建物理卷 （`pvcreate`） 的一般语法：**

```
pvcreate [物理卷名]
```

当在系统中检测到磁盘，使用 `pvcreate` 命令初始化 LVM PV：

```
# pvcreate /dev/sdb /dev/sdc /dev/sdd
Physical volume "/dev/sdb" successfully created
Physical volume "/dev/sdc" successfully created
Physical volume "/dev/sdd" successfully created
```

**请注意：**

  * 上面的命令将删除给定磁盘 `/dev/sdb`、`/dev/sdc` 和 `/dev/sdd` 上的所有数据。
  * 物理磁盘可以直接添加到 LVM PV 中，而不必是磁盘分区。

使用 `pvdisplay` 和 `pvs` 命令来显示你创建的 PV。`pvs` 命令显示的是摘要输出，`pvdisplay` 显示的是 PV 的详细输出：

```
# pvs
PV VG Fmt Attr PSize PFree
/dev/sdb lvm2 a-- 15.00g 15.00g
/dev/sdc lvm2 a-- 15.00g 15.00g
/dev/sdd lvm2 a-- 15.00g 15.00g
```

```
# pvdisplay

"/dev/sdb" is a new physical volume of "15.00 GiB"
--- NEW Physical volume ---
PV Name               /dev/sdb
VG Name
PV Size               15.00 GiB
Allocatable           NO
PE Size               0
Total PE              0
Free PE               0
Allocated PE          0
PV UUID               69d9dd18-36be-4631-9ebb-78f05fe3217f

"/dev/sdc" is a new physical volume of "15.00 GiB"
--- NEW Physical volume ---
PV Name               /dev/sdc
VG Name
PV Size               15.00 GiB
Allocatable           NO
PE Size               0
Total PE              0
Free PE               0
Allocated PE          0
PV UUID               a2092b92-af29-4760-8e68-7a201922573b

"/dev/sdd" is a new physical volume of "15.00 GiB"
--- NEW Physical volume ---
PV Name               /dev/sdd
VG Name
PV Size               15.00 GiB
Allocatable           NO
PE Size               0
Total PE              0
Free PE               0
Allocated PE          0
PV UUID               d92fa769-e00f-4fd7-b6ed-ecf7224af7faS
```

### 如何创建一个卷组

<ruby>卷组<rt>Volume Group</rt></ruby>（VG）是 LVM 结构中的另一层。基本上，卷组由你创建的 LVM 物理卷组成，你可以将物理卷添加到现有的卷组中，或者根据需要为物理卷创建新的卷组。

**创建卷组 （`vgcreate`） 的一般语法：**

```
vgcreate [卷组名] [物理卷名]
```

使用以下命令将一个新的物理卷添加到新的卷组中：

```
# vgcreate vg01 /dev/sdb /dev/sdc /dev/sdd
Volume group "vg01" successfully created
```

**请注意：**默认情况下，它使用 4MB 的<ruby>物理范围<rt>Physical Extent</rt></ruby>（PE），但你可以根据你的需要改变它。

使用 `vgs` 和 `vgdisplay` 命令来显示你创建的 VG 的信息：

```
# vgs vg01
VG #PV #LV #SN Attr VSize VFree
vg01 3 0 0 wz--n- 44.99g 44.99g
```

```
# vgdisplay vg01
--- Volume group ---
VG Name              vg01
System ID
Format               lvm2
Metadata Areas       3
Metadata Sequence No 1
VG Access            read/write
VG Status            resizable
MAX LV               0
Cur LV               0
Open LV              0
Max PV               0
Cur PV               3
Act PV               3
VG Size              44.99 GiB
PE Size              4.00 MiB
Total PE             11511
Alloc PE / Size      0 / 0
Free PE / Size       11511 / 44.99 GiB
VG UUID              d17e3c31-e2c9-4f11-809c-94a549bc43b7
```

### 如何扩展卷组

如果 VG 没有空间，请使用以下命令将新的物理卷添加到现有卷组中。

**卷组扩展 （`vgextend`）的一般语法：**

```
vgextend [已有卷组名] [物理卷名]
```

```
# vgextend vg01 /dev/sde
    Volume group "vg01" successfully extended
```

### 如何以 GB 为单位创建逻辑卷？

<ruby>逻辑卷<rt>Logical Volume</rt></ruby>（LV）是 LVM 结构中的顶层。逻辑卷是由卷组创建的块设备。它作为一个虚拟磁盘分区，可以使用 LVM 命令轻松管理。

你可以使用 `lvcreate` 命令创建一个新的逻辑卷。

**创建逻辑卷（`lvcreate`） 的一般语法：**

```
lvcreate –n [逻辑卷名] –L [逻辑卷大小] [要创建的 LV 所在的卷组名称]
```

运行下面的命令，创建一个大小为 10GB 的逻辑卷 `lv001`：

```
# lvcreate -n lv001 -L 10G vg01
Logical volume "lv001" created
```

使用 `lvs` 和 `lvdisplay` 命令来显示你所创建的 LV 的信息：

```
# lvs /dev/vg01/lvol01
LV VG Attr LSize Pool Origin Data% Move Log Cpy%Sync Convert
lv001 vg01 mwi-a-m-- 10.00g lv001_mlog 100.00
```

```
# lvdisplay /dev/vg01/lv001
--- Logical volume ---
LV Path                /dev/vg01/lv001
LV Name                lv001
VG Name                vg01
LV UUID                ca307aa4-0866-49b1-8184-004025789e63
LV Write Access        read/write
LV Creation host, time localhost.localdomain, 2020-09-10 11:43:05 -0700
LV Status              available
# open                 0
LV Size                10.00 GiB
Current LE             2560
Segments               1
Allocation             inherit
Read ahead sectors     auto
- currently set to     256
Block device           253:4
```

### 如何以 PE 大小创建逻辑卷？

或者，你可以使用物理范围（PE）大小创建逻辑卷。

### 如何计算 PE 值？

很简单，例如，如果你有一个 10GB 的卷组，那么 PE 大小是多少？

默认情况下，它使用 4MB 的物理范围，但可以通过运行 `vgdisplay` 命令来检查正确的 PE 大小，因为这可以根据需求进行更改。

```
10GB = 10240MB / 4MB （PE 大小） = 2560 PE
```

**用 PE 大小创建逻辑卷 （`lvcreate`） 的一般语法：**

```
lvcreate –n [逻辑卷名] –l [物理扩展 （PE） 大小] [要创建的 LV 所在的卷组名称]
```

要使用 PE 大小创建 10GB 的逻辑卷，命令如下：

```
# lvcreate -n lv001 -l 2560 vg01
```

### 如何创建文件系统

在创建有效的文件系统之前，你不能使用逻辑卷。

**创建文件系统的一般语法：**

```
mkfs –t [文件系统类型] /dev/[LV 所在的卷组名称]/[LV 名称]
```

使用以下命令将逻辑卷 `lv001` 格式化为 ext4 文件系统：

```
# mkfs -t ext4 /dev/vg01/lv001
```

对于 xfs 文件系统：

```
# mkfs -t xfs /dev/vg01/lv001
```

### 挂载逻辑卷

最后，你需要挂载逻辑卷来使用它。确保在 `/etc/fstab` 中添加一个条目，以便系统启动时自动加载。

创建一个目录来挂载逻辑卷：

```
# mkdir /lvmtest
```

使用挂载命令[挂载逻辑卷][3]：

```
# mount /dev/vg01/lv001 /lvmtest
```

在 [/etc/fstab 文件][4]中添加新的逻辑卷详细信息，以便系统启动时自动挂载：

```
# vi /etc/fstab
/dev/vg01/lv001 /lvmtest xfs defaults 0 0
```

使用 [df 命令][5]检查新挂载的卷：

```
# df -h /lvmtest
Filesystem Size Used Avail Use% Mounted on
/dev/mapper/vg01-lv001 15360M 34M 15326M 4% /lvmtest
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/create-lvm-storage-logical-volume-manager-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/wp-content/uploads/2020/09/create-lvm-storage-logical-volume-manager-in-linux-2.png
[2]: https://www.2daygeek.com/scan-detect-luns-scsi-disks-on-redhat-centos-oracle-linux/
[3]: https://www.2daygeek.com/mount-unmount-file-system-partition-in-linux/
[4]: https://www.2daygeek.com/understanding-linux-etc-fstab-file/
[5]: https://www.2daygeek.com/linux-check-disk-space-usage-df-command/
