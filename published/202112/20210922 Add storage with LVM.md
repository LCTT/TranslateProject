[#]: subject: "Add storage with LVM"
[#]: via: "https://opensource.com/article/21/9/add-storage-lvm"
[#]: author: "Ayush Sharma https://opensource.com/users/ayushsharma"
[#]: collector: "lujun9972"
[#]: translator: "perfiffer"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14080-1.html"

使用 LVM 添加存储
======

> LVM 为你配置存储的方式提供了极大的灵活性。

![](https://img.linux.net.cn/data/attachment/album/202112/13/235125wn99nloup38jnkoo.jpg)

<ruby>逻辑卷管理器<rt>Logical Volume Manager</rt></ruby>（LVM）允许在操作系统和硬件之间建立一个抽象层。通常，你的操作系统会查找磁盘（`/dev/sda`、`/dev/sdb` 等）和这些磁盘中的分区（`/dev/sda1`、`/dev/sdb1` 等）。

LVM 在操作系统和磁盘之间创建了一个虚拟层。LVM 不是一个驱动器持有一定数量的分区，而是创建一个统一的存储池（称为<ruby>卷组<rt>Volume Group</rt></ruby>），跨越任意数量的物理驱动器（称为<ruby>物理卷<rt>Physical Volume</rt></ruby>）。使用卷组中可用的存储，LVM 可以为你的操作系统提供类似磁盘和分区的功能。

操作系统完全没有意识到它被“欺骗”了。

![Drive space][2]

由于 LVM 虚拟地创建卷组和逻辑卷，因此即使在系统运行时，也可以轻松调整它们的大小或移动它们，或者创建新卷。此外，LVM 提供了其它情况下不存在的特性，比如创建逻辑卷的活动快照时无需首先卸载磁盘。

LVM 中的卷组是一个命名的虚拟容器，将底层物理磁盘组合在一起。它充当一个池，可以从中创建不同大小的<ruby>逻辑卷<rt>Logical Volume</rt></ruby>。逻辑卷包含实际的文件系统并且可以跨越多个磁盘，并且不需要物理上连续。

### 特性

  * 分区名称通常具有系统名称，例如 `/dev/sda1`。LVM 具有便于人们理解的名称，例如 `home` 或者 `media`。
  * 分区的总大小受底层物理磁盘大小的限制。在 LVM 中，卷可以跨越多个磁盘，并且仅受 LVM 中所有物理磁盘总大小的限制。
  * 分区通常只有在磁盘未使用且已卸载时才能调整大小、移动或删除。LVM 卷可以在系统运行时进行操作。
  * 只能通过分配与分区相邻的可用空间来扩展分区。LVM 卷可以从任何地方占用可用空间。  
  * 扩展分区涉及移动数据以腾出可用空间，这非常耗时，并且可能会在断电期间导致数据丢失。LVM 卷可以从卷组中的任何地方占用可用空间，甚至可以在另一块磁盘上。
  * 因为在 LVM 中创建卷非常容易，所以它鼓励创建不同的卷，例如创建单独的卷来测试功能或尝试不同的操作系统。对于分区，此过程将非常耗时并且容易出错。
  * 快照只能在 LVM 中创建。它允许你创建当前逻辑卷的时间点镜像，即使在系统运行时也可以。这非常适合备份。

### 测试设置

作为演示，假设你的系统具有以下驱动器配置：

```
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0   8G  0 disk
`-xvda1 202:1    0   8G  0 part /
xvdb    202:16   0   1G  0 disk
xvdc    202:32   0   1G  0 disk
xvdd    202:48   0   2G  0 disk
xvde    202:64   0   5G  0 disk
xvdf    202:80   0   8G  0 disk
```

#### 步骤 1. 初始化磁盘以用于 LVM

运行 `pvcreate /dev/xvdb /dev/xvdc /dev/xvdd /dev/xvde /dev/xvdf`。输出应如下：

```
Physical volume "/dev/xvdb" successfully created
Physical volume "/dev/xvdc" successfully created
Physical volume "/dev/xvdd" successfully created
Physical volume "/dev/xvde" successfully created
Physical volume "/dev/xvdf" successfully created
```

使用 `pvs` 或者 `pvdisplay` 查看结果：

```
"/dev/xvde" is a new physical volume of "5.00 GiB"
--- NEW Physical volume ---
PV Name               /dev/xvde
VG Name
PV Size               5.00 GiB
Allocatable           NO
PE Size               0
Total PE              0
Free PE               0
Allocated PE          0
PV UUID               728JtI-ffZD-h2dZ-JKnV-8IOf-YKdS-8srJtn

"/dev/xvdb" is a new physical volume of "1.00 GiB"
--- NEW Physical volume ---
PV Name               /dev/xvdb
VG Name
PV Size               1.00 GiB
Allocatable           NO
PE Size               0
Total PE              0
Free PE               0
Allocated PE          0
PV UUID               zk1phS-7uXc-PjBP-5Pv9-dtAV-zKe6-8OCRkZ

"/dev/xvdd" is a new physical volume of "2.00 GiB"
--- NEW Physical volume ---
PV Name               /dev/xvdd
VG Name
PV Size               2.00 GiB
Allocatable           NO
PE Size               0
Total PE              0
Free PE               0
Allocated PE          0
PV UUID               R0I139-Ipca-KFra-2IZX-o9xJ-IW49-T22fPc

"/dev/xvdc" is a new physical volume of "1.00 GiB"
--- NEW Physical volume ---
PV Name               /dev/xvdc
VG Name
PV Size               1.00 GiB
Allocatable           NO
PE Size               0
Total PE              0
Free PE               0
Allocated PE          0
PV UUID               FDzcVS-sq22-2b13-cYRj-dXHf-QLjS-22Meae

"/dev/xvdf" is a new physical volume of "8.00 GiB"
--- NEW Physical volume ---
PV Name               /dev/xvdf
VG Name
PV Size               8.00 GiB
Allocatable           NO
PE Size               0
Total PE              0
Free PE               0
Allocated PE          0
PV UUID               TRVSH9-Bo5D-JHHb-g0NX-8IoS-GG6T-YV4d0p
```

#### 步骤 2. 创建卷组

运行 `vgcreate myvg /dev/xvdb /dev/xvdc /dev/xvdd /dev/xvde /dev/xvdf`。通过 `vgs` 或者 `vgdisplay` 查看结果：

```
--- Volume group ---
VG Name               myvg
System ID
Format                lvm2
Metadata Areas        5
Metadata Sequence No  1
VG Access             read/write
VG Status             resizable
MAX LV                0
Cur LV                0
Open LV               0
Max PV                0
Cur PV                5
Act PV                5
VG Size               16.98 GiB
PE Size               4.00 MiB
Total PE              4347
Alloc PE / Size       0 / 0
Free  PE / Size       4347 / 16.98 GiB
VG UUID               ewrrWp-Tonj-LeFa-4Ogi-BIJJ-vztN-yrepkh
```

#### 步骤 3: 创建逻辑卷

运行以下命令：

```
lvcreate myvg --name media --size 4G
lvcreate myvg --name home --size 4G
```

使用 `lvs` 或者 `lvdisplay` 验证结果：

```
--- Logical volume ---
LV Path                /dev/myvg/media
LV Name                media
VG Name                myvg
LV UUID                LOBga3-pUNX-ZnxM-GliZ-mABH-xsdF-3VBXFT
LV Write Access        read/write
LV Creation host, time ip-10-0-5-236, 2017-02-03 05:29:15 +0000
LV Status              available
# open                 0
LV Size                4.00 GiB
Current LE             1024
Segments               1
Allocation             inherit
Read ahead sectors     auto
- currently set to     256
Block device           252:0

--- Logical volume ---
LV Path                /dev/myvg/home
LV Name                home
VG Name                myvg
LV UUID                Hc06sl-vtss-DuS0-jfqj-oNce-qKf6-e5qHhK
LV Write Access        read/write
LV Creation host, time ip-10-0-5-236, 2017-02-03 05:29:40 +0000
LV Status              available
# open                 0
LV Size                4.00 GiB
Current LE             1024
Segments               1
Allocation             inherit
Read ahead sectors     auto
- currently set to     256
Block device           252:1
```

#### 步骤 4: 创建文件系统

使用以下命令创建文件系统：

```
vgcreate myvg /dev/xvdb /dev/xvdc /dev/xvdd /dev/xvde /dev/xvdf
mkfs.ext3 /dev/myvg/media
mkfs.ext3 /dev/myvg/home
```

挂载它：

```
mount /dev/myvg/media /media
mount /dev/myvg/home /home
```

使用 `lsblk` 命令查看完整配置：

```
NAME         MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda         202:0    0   8G  0 disk
`-xvda1      202:1    0   8G  0 part /
xvdb         202:16   0   1G  0 disk
xvdc         202:32   0   1G  0 disk
xvdd         202:48   0   2G  0 disk
xvde         202:64   0   5G  0 disk
`-myvg-media 252:0    0   4G  0 lvm  /media
xvdf         202:80   0   8G  0 disk
`-myvg-home  252:1    0   4G  0 lvm  /home
```

#### 步骤 5: 扩展 LVM

添加一块新的 `/dev/xvdg` 磁盘。要扩展 `home` 卷，运行以下命令：

```
pvcreate /dev/xvdg
vgextend myvg /dev/xvdg
lvextend -l 100%FREE /dev/myvg/home
resize2fs /dev/myvg/home
```

运行 `df -h`，你应该可以看到新的磁盘大小。

就是这样！

LVM 为你配置存储的方式提供了极大的灵活性。尝试一下，并享受 LVM 的乐趣！

本文首发于 [作者个人博客][4]，经授权改编。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/add-storage-lvm

作者：[Ayush Sharma][a]
选题：[lujun9972][b]
译者：[perfiffer](https://github.com/perfiffer)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ayushsharma
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus-storage.png?itok=95-zvHYl (Storage units side by side)
[2]: https://opensource.com/sites/default/files/lvm.png (Drive space)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://notes.ayushsharma.in/2017/02/working-with-logical-volume-manager-lvm
