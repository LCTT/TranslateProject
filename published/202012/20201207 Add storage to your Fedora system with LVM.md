[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12936-1.html)
[#]: subject: (Add storage to your Fedora system with LVM)
[#]: via: (https://fedoramagazine.org/add-storage-to-your-fedora-system-with-lvm/)
[#]: author: (Tim Bosse https://fedoramagazine.org/author/maztaim/)

使用 LVM 为你的 Fedora 系统添加存储
======

![][1]

有时需要在系统中添加另一块磁盘。这就是<ruby>逻辑卷管理<rt>Logical Volume Management</rt></ruby>（LVM）的用武之地。LVM 的好处之处在于它相当灵活。有几种方法可以添加一块磁盘。这篇文章介绍了一种方法。

### 注意！

这篇文章并不包括将新的磁盘物理地安装到系统中的过程。请查阅你的系统和磁盘文档，了解如何正确地进行安装。

**重要：** 一定要确保你已经备份重要数据。如果新磁盘已有数据，那么本文中描述的步骤将破坏数据。

### 最好了解

本文并没有深入介绍 LVM 的每一个功能，重点是添加磁盘。但基本上你要了解，LVM 有<ruby>卷组<rt>volume group</rt></ruby>（VG），它由一个或多个分区和/或磁盘组成。你把这些分区或磁盘以<ruby>物理卷<rt>physical volume</rt></ruby>（PV）的方式添加到卷组。一个卷组可以分成许多<ruby>逻辑卷<rt>logical volume</rt></ruby>（LV）。逻辑卷可以作为文件系统、ramdisk 等其他存储使用。更多信息可以在[这里][2]中找到。

可以看作是，把物理卷形成一个存储池（一个卷组），然后从这个存储池中划分出逻辑卷，供你的系统直接使用。

### 准备

确保你能看到你要添加的磁盘。在添加磁盘之前使用 `lsblk` 查看哪些存储空间已经可用或正在使用。

```
$ lsblk
NAME                   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
zram0                  251:0    0  989M  0 disk [SWAP]
vda                    252:0    0   20G  0 disk
├─vda1                 252:1    0    1G  0 part /boot
└─vda2                 252:2    0   19G  0 part
└─fedora_fedora-root   253:0    0   19G  0 lvm  /
```

本文使用的是带有虚拟存储的虚拟机，因此设备名称以 `vda` 开头代表第一个磁盘，`vdb` 代表第二个磁盘，以此类推。你的设备名称可能不同。许多系统会将 `sda` 作为第一个物理磁盘，`sdb` 代表第二个磁盘，以此类推。

当已连接新磁盘，并且你的系统已备份且正在运行，再次使用 `lsblk` 来查看新的块设备。

```
$ lsblk
NAME                   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
zram0                  251:0    0  989M  0 disk [SWAP]
vda                    252:0    0   20G  0 disk
├─vda1                 252:1    0    1G  0 part /boot
└─vda2                 252:2    0   19G  0 part
└─fedora_fedora-root 253:0    0   19G  0 lvm  /
vdb                    252:16   0   10G  0 disk
```

现在有一个名为 `vdb` 的新设备。该设备的位置是 `/dev/vdb`。

```
$ ls -l /dev/vdb
brw-rw----. 1 root disk 252, 16 Nov 24 12:56 /dev/vdb
```

我们可以看到磁盘，但我们还不能用 LVM 来使用它。如果你运行 `blkid`，你应该不会看到它被列出。对于这个和之后的命令，你需要确保你的系统[已配置好，这样你可以使用 sudo][3]：

```
$ sudo blkid
/dev/vda1: UUID="4847cb4d-6666-47e3-9e3b-12d83b2d2448" BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="830679b8-01"
/dev/vda2: UUID="k5eWpP-6MXw-foh5-Vbgg-JMZ1-VEf9-ARaGNd" TYPE="LVM2_member" PARTUUID="830679b8-02"
/dev/mapper/fedora_fedora-root: UUID="f8ab802f-8c5f-4766-af33-90e78573f3cc" BLOCK_SIZE="4096" TYPE="ext4"
/dev/zram0: UUID="fc6d7a48-2bd5-4066-9bcf-f062b61f6a60" TYPE="swap"
```

### 将磁盘添加到 LVM 中

使用 `pvcreate` 初始化磁盘。你需要传递设备的完整路径。在这个例子中，它是 `/dev/vdb`。在你的系统中，它可能是 `/dev/sdb` 或其他设备名。

```
$ sudo pvcreate /dev/vdb
Physical volume "/dev/vdb" successfully created.
```

当你运行 `blkid` 时，你应该看到磁盘已经被初始化为一个 `LVM2_member`：

```
$ sudo blkid
/dev/vda1: UUID="4847cb4d-6666-47e3-9e3b-12d83b2d2448" BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="830679b8-01"
/dev/vda2: UUID="k5eWpP-6MXw-foh5-Vbgg-JMZ1-VEf9-ARaGNd" TYPE="LVM2_member" PARTUUID="830679b8-02"
/dev/mapper/fedora_fedora-root: UUID="f8ab802f-8c5f-4766-af33-90e78573f3cc" BLOCK_SIZE="4096" TYPE="ext4"
/dev/zram0: UUID="fc6d7a48-2bd5-4066-9bcf-f062b61f6a60" TYPE="swap"
/dev/vdb: UUID="4uUUuI-lMQY-WyS5-lo0W-lqjW-Qvqw-RqeroE" TYPE="LVM2_member"
```

你可以使用 `pvs` 列出当前所有可用的物理卷：

```
$ sudo pvs
PV         VG            Fmt  Attr PSize   PFree
/dev/vda2  fedora_fedora lvm2 a--  <19.00g     0
/dev/vdb                 lvm2 ---   10.00g 10.00g
```

`/dev/vdb` 被列为一个 PV （物理卷），但还没有分配到一个 VG （卷组）。

### 将物理卷添加到一个卷组

你可以使用 `vgs` 找到可用的卷组列表：

```
$ sudo vgs
VG            #PV #LV #SN Attr   VSize   VFree
fedora_fedora   1   1   0 wz--n- 19.00g    0
```

在本例中，只有一个卷组可用。接下来，将物理卷添加到 `fedora_fedora`：

```
$ sudo vgextend fedora_fedora /dev/vdb
Volume group "fedora_fedora" successfully extended
```

你现在应该看到物理卷已被添加到卷组中：

```
$ sudo pvs 
PV        VG            Fmt  Attr PSize   PFree
/dev/vda2 fedora_fedora lvm2 a–   <19.00g 0
/dev/vdb  fedora_fedora lvm2 a–   <10.00g <10.00g
```

看一下卷组：

```
$ sudo vgs
VG            #PV #LV #SN Attr  VSize  VFree
fedora_fedora 2   1   0   wz–n- 28.99g <10.00g
```

你也可以获得具体卷组和物理卷的详细列表：

```
$ sudo vgdisplay fedora_fedora
--- Volume group ---
VG Name               fedora_fedora
System ID
Format                lvm2
Metadata Areas        2
Metadata Sequence No  3
VG Access             read/write
VG Status             resizable
MAX LV                0
Cur LV                1
Open LV               1
Max PV                0
Cur PV                2
Act PV                2
VG Size               28.99 GiB
PE Size               4.00 MiB
Total PE              7422
Alloc PE / Size       4863 / 19.00 GiB
Free  PE / Size       2559 / 10.00 GiB
VG UUID               C5dL2s-dirA-SQ15-TfQU-T3yt-l83E-oI6pkp
```

看下物理卷：

```
$ sudo pvdisplay /dev/vdb
--- Physical volume ---
PV Name               /dev/vdb
VG Name               fedora_fedora
PV Size               10.00 GiB / not usable 4.00 MiB
Allocatable           yes
PE Size               4.00 MiB
Total PE              2559
Free PE               2559
Allocated PE          0
PV UUID               4uUUuI-lMQY-WyS5-lo0W-lqjW-Qvqw-RqeroE 
```

现在我们已经添加了磁盘，我们可以为逻辑卷 （LV） 分配空间：

```
$ sudo lvs
LV VG Attr LSize Pool Origin Data% Meta% Move Log Cpy%Sync Convert
root fedora_fedora -wi-ao---- 19.00g
```

看一下逻辑卷。下面是详细的逻辑卷信息：

```
$ sudo lvdisplay fedora_fedora/root
--- Logical volume ---
LV Path                /dev/fedora_fedora/root
LV Name                root
VG Name                fedora_fedora
LV UUID                yqc9cw-AvOw-G1Ni-bCT3-3HAa-qnw3-qUSHGM
LV Write Access        read/write
LV Creation host, time fedora, 2020-11-24 11:44:36 -0500
LV Status              available
LV Size                19.00 GiB
Current LE             4863
Segments               1
Allocation             inherit
Read ahead sectors     auto
- currently set to     256
Block device           253:0
```

查看根文件系统（`/`）的大小，并将它与逻辑卷大小进行比较。

```
$ df -h /
Filesystem                      Size  Used Avail Use% Mounted on
/dev/mapper/fedora_fedora-root   19G  1.4G   17G   8% /
```

逻辑卷和文件系统大小都为 19G。让我们给根逻辑卷（`root`）增加 5G。

```
$ sudo lvresize -L +5G fedora_fedora/root
Size of logical volume fedora_fedora/root changed from 19.00 GiB (4863 extents) to 24.00 GiB (6143 extents).
Logical volume fedora_fedora/root successfully resized.
```

我们现在有 24G 的逻辑卷可用。看看根文件系统（`/`）。

```
$ df -h /
Filesystem                      Size  Used Avail Use% Mounted on
/dev/mapper/fedora_fedora-root   19G  1.4G   17G   8% /
```

我们仍然显示只有 19G 的空闲空间，这是因为逻辑卷与文件系统不一样。要使用增加到逻辑卷的新空间，请调整文件系统的大小。

```
$ sudo resize2fs /dev/fedora_fedora/root
resize2fs 1.45.6 (20-Mar-2020)
Filesystem at /dev/fedora_fedora/root is mounted on /; on-line resizing required
old_desc_blocks = 3, new_desc_blocks = 3
The filesystem on /dev/fedora_fedora/root is now 6290432 (4k) blocks long.
```

看看文件系统的大小。

```
$ df -h /
Filesystem                      Size  Used Avail Use% Mounted on
/dev/mapper/fedora_fedora-root   24G  1.4G   21G   7% /
```

正如你所看到的，根文件系统（`/`）已经占用了逻辑卷上的所有可用空间，而且不需要重新启动。

现在你已经将一个磁盘初始化为物理卷，并使用新的物理卷扩展了卷组。之后，你增加了逻辑卷的大小，并调整了文件系统的大小，以使用逻辑卷的新空间。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/add-storage-to-your-fedora-system-with-lvm/

作者：[Tim Bosse][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/maztaim/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/11/lvm-add-disk-816x345.jpg
[2]: https://en.wikipedia.org/wiki/Logical_Volume_Manager_(Linux)
[3]: https://fedoramagazine.org/howto-use-sudo/