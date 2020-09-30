[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Create/Configure LVM (Logical Volume Management) in Linux)
[#]: via: (https://www.2daygeek.com/create-lvm-storage-logical-volume-manager-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How to Create/Configure LVM (Logical Volume Management) in Linux
======

Logical Volume Manager (LVM) plays an important role in the Linux operating system by improving the availability, disk I/O, performance and capability of disk management.

LVM is a widely used technique that is extremely flexible for disk management.

This adds an extra layer between the physical disks and the file system, allowing you to create a logical volume instead of a physical disk.

LVM allows you to easily resize, extend and decrease the logical volume when you need it.

![][1]

### How to Create LVM Physical Volumes

You can use any disk, RAID array, SAN disk, or a partition as the LVM physical volume.

Let’s imagine, you have already added three disks, these disks are /dev/sdb, and /dev/sdc, /dev/sdd.

Run the following commands to **[discover newly added LUNs or disks in Linux][2]**.

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

**General syntax for the creation of a physical volume (pvcreate).**

```
pvcreate [Physical Volume Name]
```

Once the disk is detected in the OS, use the pvcreate command to initialize the LVM PV (Physical Volumes).

```
# pvcreate /dev/sdb /dev/sdc /dev/sdd
Physical volume "/dev/sdb" successfully created
Physical volume "/dev/sdc" successfully created
Physical volume "/dev/sdd" successfully created
```

**Make a note:**

  * The above command erases any data on the given disks /dev/sdb, /dev/sdc and /dev/sdd.
  * Physical disk can be added directly into the LVM PV instead of the disk partition.



Use the pvdisplay and pvs commands to display the PVs you have created. The pvs command shows summarize output and the pvdisplay shows the detailed output of the PVs.

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

### How to Create a Volume Group

Volume group is the another layer in LVM structure. Basically the volume group consists of the LVM physical volumes you created. You can add physical volume to an existing volume group or create a new volume group for physical volume as needed.

**General syntax for Volume Group creation (vgcreate).**

```
vgcreate [Volume Group Name] [Physical Volume Name]
```

Use the following command to add a new physical volume to the new volume group.

```
# vgcreate vg01 /dev/sdb /dev/sdc /dev/sdd
Volume group "vg01" successfully created
```

**Make a note:** By default, it uses 4MB for physical extent, but you can change it based on your need.

Use the vgs and vgdisplay commands to display information about the VG you created.

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

### How to Extent Volume Group

If you do not have space in the VG, Use the following command to add a new physical volume to the existing volume group.

**Common syntax for Volume Group extension (vgextend).**

```
vgextend [Existing Volume Group Name] [Physical Volume Name]
```

```
# vgextend vg01 /dev/sde
    Volume group "vg01" successfully extended
```

### How to Create Logical Volume Using GB Size’s

Logical Volume is the top layer in LVM structure. Logical volumes are block devices created from the volume group. It acts as a virtual disk partition and can be easily managed using LVM commands.

You can use the lvcreate command to create a logical volume.

**General syntax for creating logical volume (lvcreate)**

```
lvcreate –n [Logical Volume Name] –L [Logical Volume Size] [Name of the Volume Group where the LV to be created]
```

Run the below command to create a logical volume lv001 of size 10 GB.

```
# lvcreate -n lv001 -L 10G vg01
Logical volume "lv001" created
```

Use the lvs and lvdisplay commands to display information about the LVs you have created.

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

### How to Create Logical Volume Using PE Size’s

Alternatively, you can create Logical Volumes Using Physical Extends (PE) size.

### How to Calculate PE Value?

It’s very simple, for example, if you have a volume group of 10 GB, then what is the PE size?

By default, it uses 4MB for the physical extent, but check the correct PE size by running the vgdisplay command, as this can be changed based on requirements.

```
10GB = 10240MB / 4MB (PE Size) = 2560 PEs
```

**Common syntax for Logical Volume Creation with PE Size’s (lvcreate).**

```
lvcreate –n [Logical Volume Name] –l [Physical Extends (PE) Size] [Name of the Volume Group where the LV to be created]
```

To create 10GB of logical volume using the PE size the command would be:

```
# lvcreate -n lv001 -l 2560 vg01
```

### How to Create File system

You cannot use a logical volume until you create a valid file system.

**General syntax to create a file system.**

```
mkfs –t [File System Type] /dev/[Name of the Volume Group where LV resides]/[LV name]
```

Use the below command to format the logical volume lv001 with the ext4 file system.

```
# mkfs -t ext4 /dev/vg01/lv001
```

For xfs file system.

```
# mkfs -t xfs /dev/vg01/lv001
```

### Mounting Logical Volume

Finally, you need to mount the logical volume to use it. Make sure to add an entry to **/etc/fstab** so that it loads automatically when the system boots.

Create a directory to mount the logical volume.

```
# mkdir /lvmtest
```

Use the mount command to **[mount the logical volume][3]**.

```
# mount /dev/vg01/lv001 /lvmtest
```

Add new logical volume details to the **[/etc/fstab file][4]** to mount automatically when the system starts.

```
# vi /etc/fstab
/dev/vg01/lv001 /lvmtest xfs defaults 0 0
```

Check the newly mounted volume using the **[df command][5]**.

```
# df -h /lvmtest
Filesystem Size Used Avail Use% Mounted on
/dev/mapper/vg01-lv001 15360M 34M 15326M 4% /lvmtest
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/create-lvm-storage-logical-volume-manager-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: https://www.2daygeek.com/scan-detect-luns-scsi-disks-on-redhat-centos-oracle-linux/
[3]: https://www.2daygeek.com/mount-unmount-file-system-partition-in-linux/
[4]: https://www.2daygeek.com/understanding-linux-etc-fstab-file/
[5]: https://www.2daygeek.com/linux-check-disk-space-usage-df-command/
