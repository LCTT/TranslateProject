[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Add storage to your Fedora system with LVM)
[#]: via: (https://fedoramagazine.org/add-storage-to-your-fedora-system-with-lvm/)
[#]: author: (Tim Bosse https://fedoramagazine.org/author/maztaim/)

Add storage to your Fedora system with LVM
======

![][1]

Sometimes there is a need to add another disk to your system. This is where Logical Volume Management (LVM) comes in handy. The cool thing about LVM is that it’s fairly flexible. There are several ways to add a disk. This article describes one way to do it.

### Heads up!

This article does not cover the process of physically installing a new disk drive into your system. Consult your system and disk documentation on how to do that properly.

**Important:** Always make sure you have backups of important data. The steps described in this article will destroy data if it already exists on the new disk.

### Good to know

This article doesn’t cover every LVM feature deeply; the focus is on adding a disk. But basically, LVM has _volume groups_, made up of one or more partitions and/or disks. You add the partitions or disks as _physical volumes_. A volume group can be broken down into many _logical volumes_. Logical volumes can be used as any other storage for filesystems, ramdisks, etc. More information can be found [here][2].

Think of the _physical volumes_ as forming a pool of storage (a _volume group_) from which you then carve out _logical volumes_ for your system to use directly.

### Preparation

Make sure you can see the disk you want to add. Use _lsblk_ prior to adding the disk to see what storage is already available or in use.

```
$ lsblk
NAME                   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
zram0                  251:0    0  989M  0 disk [SWAP]
vda                    252:0    0   20G  0 disk
├─vda1                 252:1    0    1G  0 part /boot
└─vda2                 252:2    0   19G  0 part
└─fedora_fedora-root   253:0    0   19G  0 lvm  /
```

This article uses a virtual machine with virtual storage. Therefore the device names start with _vda_ for the first disk, _vdb_ for the second, and so on. The name of your device may be different. Many systems will see physical disks as _sda_ for the first disk, _sdb_ for the second, and so on.

Once the new disk has been connected and your system is back up and running, use _lsblk_ again to see the new block device.

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

There is now a new device named _vdb_. The location for the device is _/dev/vdb_.

```
$ ls -l /dev/vdb
brw-rw----. 1 root disk 252, 16 Nov 24 12:56 /dev/vdb
```

We can see the disk, but we cannot use it with LVM yet. If you run _blkid_ you should not see it listed. For this and following commands, you’ll need to ensure your system is [configured so you can use _sudo_][3]:

```
$ sudo blkid
/dev/vda1: UUID="4847cb4d-6666-47e3-9e3b-12d83b2d2448" BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="830679b8-01"
/dev/vda2: UUID="k5eWpP-6MXw-foh5-Vbgg-JMZ1-VEf9-ARaGNd" TYPE="LVM2_member" PARTUUID="830679b8-02"
/dev/mapper/fedora_fedora-root: UUID="f8ab802f-8c5f-4766-af33-90e78573f3cc" BLOCK_SIZE="4096" TYPE="ext4"
/dev/zram0: UUID="fc6d7a48-2bd5-4066-9bcf-f062b61f6a60" TYPE="swap"
```

### Add the disk to LVM

Initialize the disk using _pvcreate_. You need to pass the full path to the device. In this example it is _/dev/vdb_; on your system it may be _/dev/sdb_ or another device name.

```
$ sudo pvcreate /dev/vdb
Physical volume "/dev/vdb" successfully created.
```

You should see the disk has been initialized as an LVM2_member when you run _blkid_:

```
$ sudo blkid
/dev/vda1: UUID="4847cb4d-6666-47e3-9e3b-12d83b2d2448" BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="830679b8-01"
/dev/vda2: UUID="k5eWpP-6MXw-foh5-Vbgg-JMZ1-VEf9-ARaGNd" TYPE="LVM2_member" PARTUUID="830679b8-02"
/dev/mapper/fedora_fedora-root: UUID="f8ab802f-8c5f-4766-af33-90e78573f3cc" BLOCK_SIZE="4096" TYPE="ext4"
/dev/zram0: UUID="fc6d7a48-2bd5-4066-9bcf-f062b61f6a60" TYPE="swap"
/dev/vdb: UUID="4uUUuI-lMQY-WyS5-lo0W-lqjW-Qvqw-RqeroE" TYPE="LVM2_member"
```

You can list all physical volumes currently available using _pvs_:

```
$ sudo pvs
PV         VG            Fmt  Attr PSize   PFree
/dev/vda2  fedora_fedora lvm2 a--  <19.00g     0
/dev/vdb                 lvm2 ---   10.00g 10.00g
```

_/dev/vdb_ is listed as a PV (phsyical volume), but it isn’t assigned to a VG (Volume Group) yet.

### Add the pysical volume to a volume group

You can find a list of available volume groups using _vgs_:

```
$ sudo vgs
VG            #PV #LV #SN Attr   VSize   VFree
fedora_fedora   1   1   0 wz--n- 19.00g    0
```

In this example, there is only one volume group available. Next, add the physical volume to _fedora_fedora_:

```
$ sudo vgextend fedora_fedora /dev/vdb
Volume group "fedora_fedora" successfully extended
```

You should now see the physical volume is added to the volume group:

```
$ sudo pvs
PV        VG            Fmt  Attr PSize   PFree
/dev/vda2 fedora_fedora lvm2 a–   <19.00g 0
/dev/vdb  fedora_fedora lvm2 a–   <10.00g <10.00g
```

Look at the volume groups:

```
$ sudo vgs
VG            #PV #LV #SN Attr  VSize  VFree
fedora_fedora 2   1   0   wz–n- 28.99g <10.00g
```

You can get a detailed list of the specific volume group and physical volumes as well:

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

Look at the PV:

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

Now that we have added the disk, we can allocate space to logical volumes (LVs):

```
$ sudo lvs
LV VG Attr LSize Pool Origin Data% Meta% Move Log Cpy%Sync Convert
root fedora_fedora -wi-ao---- 19.00g
```

Look at the logical volumes. Here’s a detailed look at the root LV:

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

Look at the size of the root filesystem and compare it to the logical volume size.

```
$ df -h /
Filesystem                      Size  Used Avail Use% Mounted on
/dev/mapper/fedora_fedora-root   19G  1.4G   17G   8% /
```

The logical volume and the filesystem both agree the size is 19G. Let’s add 5G to the root logical volume:

```
$ sudo lvresize -L +5G fedora_fedora/root
Size of logical volume fedora_fedora/root changed from 19.00 GiB (4863 extents) to 24.00 GiB (6143 extents).
Logical volume fedora_fedora/root successfully resized.
```

We now have 24G available to the logical volume. Look at the _/_ filesystem.

```
$ df -h /
Filesystem                      Size  Used Avail Use% Mounted on
/dev/mapper/fedora_fedora-root   19G  1.4G   17G   8% /
```

We are still showing only 19G free. This is because the logical volume is not the same as the filesytem. To use the new space added to the logical volume, resize the filesystem.

```
$ sudo resize2fs /dev/fedora_fedora/root
resize2fs 1.45.6 (20-Mar-2020)
Filesystem at /dev/fedora_fedora/root is mounted on /; on-line resizing required
old_desc_blocks = 3, new_desc_blocks = 3
The filesystem on /dev/fedora_fedora/root is now 6290432 (4k) blocks long.
```

Look at the size of the filesystem.

```
$ df -h /
Filesystem                      Size  Used Avail Use% Mounted on
/dev/mapper/fedora_fedora-root   24G  1.4G   21G   7% /
```

As you can see, the root file system _(/)_ has taken all of the space available on the logical volume and no reboot was needed.

You have now initialized a disk as a physical volume, and extended the volume group with the new physical volume. After that you increased the size of the logical volume, and resized the filesystem to use the new space from the logical volume.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/add-storage-to-your-fedora-system-with-lvm/

作者：[Tim Bosse][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/maztaim/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/11/lvm-add-disk-816x345.jpg
[2]: https://en.wikipedia.org/wiki/Logical_Volume_Manager_(Linux)
[3]: https://fedoramagazine.org/howto-use-sudo/
