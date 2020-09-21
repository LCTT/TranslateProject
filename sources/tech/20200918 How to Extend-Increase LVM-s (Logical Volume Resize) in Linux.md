[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Extend/Increase LVM’s (Logical Volume Resize) in Linux)
[#]: via: (https://www.2daygeek.com/extend-increase-resize-lvm-logical-volume-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How to Extend/Increase LVM’s (Logical Volume Resize) in Linux
======

Expanding the logical volume is extremely easy, it takes very few steps and can be done online without unmounting a certain logical volume.

The main purpose of LVM is flexible disk management, which allows you to easily resize, extend and reduce the logical volume size when you need it.

If you are new to Logical Volume Management (LVM), I suggest you start with our previous article.

  * **Part-1: [How to Create/Configure LVM (Logical Volume Management) in Linux][1]**



![][2]

Expanding the logical volume involves the below steps.

  * Check if you have sufficient unallocated disk space in the volume group where the LV was residing.
  * If yes, you can use that space to extend the logical volume.
  * If not, add new disks or LUNs to your system.
  * Convert a physical disk as a physical volume (PV).
  * Extend the Volume Group
  * Increase the logical Volume
  * Grow the filesystem
  * Check the extended filesystem size



### How to Create LVM Physical Volumes

Create LVM physical volumes with the pvcreate command.

Once the disk is detected in the OS, use the pvcreate command to initialize the LVM PV (Physical Volumes).

```
# pvcreate /dev/sdc
Physical volume "/dev/sdc" successfully created
```

**Make a note:**

  * The above command erases any data on the given disk /dev/sdc.
  * Physical disk can be added directly into the LVM PV instead of the disk partition.



Use the pvdisplay command to display the PVs you have created.

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

### How to Extend the Volume Group

Use the following command to add a new physical volume to the existing volume group.

```
# vgextend vg01 /dev/sdc
Volume group "vg01" successfully extended
```

Use the vgdisplay command to display the PVs you have created.

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

### How to Extend the Logical Volume

Use the following command to increase the existing logical volume.

**Common syntax for logical volume extension (lvextend).**

```
lvextend [Additional space to be added] [Existing Logical Volume Name]
```

Use the below command to increase the existing logical volume additionally to 10GB.

```
# lvextend -L +10G /dev/mapper/vg01-lv002
Rounding size to boundary between physical extents: 5.90 GiB
Size of logical volume vg01/lv002 changed from 5.00 GiB (1280 extents) to 15.00 GiB (3840 extents).
Logical volume var successfully resized
```

To extend logical volume using PE size’s.

```
# lvextend -l +2560 /dev/mapper/vg01-lv002
```

To extend the logical volume using percentage (%), use the following command.

```
# lvextend -l +40%FREE /dev/mapper/vg01-lv002
```

Now, the logical volume is extended and you need to resize the file system to extend the space inside the logical volume.

For an ext3 and ext4 based file system, run the following command.

```
# resize2fs /dev/mapper/vg01-lv002
```

For the xfs file system, use the following command.

```
# xfs_growfs /dev/mapper/vg01-lv002
```

Use the **[df command][3]** to view the file system size.

```
# df -h /lvmtest1
Filesystem Size Used Avail Use% Mounted on
/dev/mapper/vg01-lv002 15360M 34M 15326M 4% /lvmtest1
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/extend-increase-resize-lvm-logical-volume-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/create-lvm-storage-logical-volume-manager-in-linux/
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: https://www.2daygeek.com/linux-check-disk-space-usage-df-command/
