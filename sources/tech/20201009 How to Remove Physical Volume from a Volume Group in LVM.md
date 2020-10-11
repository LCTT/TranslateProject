[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Remove Physical Volume from a Volume Group in LVM)
[#]: via: (https://www.2daygeek.com/linux-remove-delete-physical-volume-pv-from-volume-group-vg-in-lvm/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How to Remove Physical Volume from a Volume Group in LVM
======

If a device is no longer need for use by LVM, you can use the vgreduce command to remove physical volumes from a volume group.

The Vgreduce command shrinks the capacity of a volume group by removing a physical volume.

But make sure that the physical volume is not used by any logical volumes using the pvdisplay command.

If the physical volume is still being used, you must transfer the data to another physical volume using the pvmove command.

Once the data is moved, it can be removed from the volume group.

Finally use the pvremove command to remove the LVM label and LVM metadata on the empty physical volume.

  * **Part-1: [How to Create/Configure LVM (Logical Volume Management) in Linux][1]**
  * **Part-2: [How to Extend/Increase LVM’s (Logical Volume Resize) in Linux][2]**
  * **Part-3: [How to Reduce/Shrink LVM’s (Logical Volume Resize) in Linux][3]**



![][4]

### 1) Moving Extents to Existing Physical Volumes

Use the pvs command to check if the desired physical volume (we plan to remove the **“/dev/sdb1”** disk in LVM) is used or not.

```
# pvs -o+pv_used

PV VG Fmt Attr PSize PFree Used
/dev/sda1 myvg lvm2 a- 75.00G 14.00G 61.00G
/dev/sdb1 myvg lvm2 a- 50.00G 45.00G 5.00G
/dev/sdc1 myvg lvm2 a- 17.15G 12.15G 5.00G
```

If this is used, check to see if there are enough free extents on the other physics volumes in the volume group.

If so, you can run the pvmove command on the device you want to remove. Extents will be distributed to other devices.

```
# pvmove /dev/sdb1

/dev/sdb1: Moved: 2.0%
…
/dev/sdb1: Moved: 79.2%
…
/dev/sdb1: Moved: 100.0%
```

When the pvmove command is complete. Re-use the pvs command to check whether the physics volume is free or not.

```
# pvs -o+pv_used

PV VG Fmt Attr PSize PFree Used
/dev/sda1 myvg lvm2 a- 75.00G 9.00G 66.00G
/dev/sdb1 myvg lvm2 a- 50.00G 50.00G 0
/dev/sdc1 myvg lvm2 a- 17.15G 12.15G 5.00G
```

If it’s free, use the vgreduce command to remove the physical volume /dev/sdb1 from the volume group.

```
# vgreduce myvg /dev/sdb1
Removed "/dev/sdb1" from volume group "myvg"
```

Finally, run the pvremove command to remove the disk from the LVM configuration. Now, the disk is completely removed from the LVM and can be used for other purposes.

```
# pvremove /dev/sdb1
Labels on physical volume "/dev/sdb1" successfully wiped.
```

### 2) Moving Extents to a New Disk

If you don’t have enough free extents on the other physics volumes in the volume group. Add new physical volume using the steps below.

Request new LUNs from the storage team. Once this is allocated, run the following commands to **[discover newly added LUNs or disks in Linux][5]**.

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

Once the disk is detected in the OS, use the pvcreate command to create the physical volume.

```
# pvcreate /dev/sdd1
Physical volume "/dev/sdd1" successfully created
```

Use the following command to add new physical volume /dev/sdd1 to the existing volume group vg01.

```
# vgextend vg01 /dev/sdd1
Volume group "vg01" successfully extended
```

Now, use the pvs command to see the new disk **“/dev/sdd1”** that you have added.

```
# pvs -o+pv_used

PV VG Fmt Attr PSize PFree Used
/dev/sda1 myvg lvm2 a- 75.00G 14.00G 61.00G
/dev/sdb1 myvg lvm2 a- 50.00G 0 50.00G
/dev/sdc1 myvg lvm2 a- 17.15G 12.15G 5.00G
/dev/sdd1 myvg lvm2 a- 60.00G 60.00G 0
```

Use the pvmove command to move the data from /dev/sdb1 to /dev/sdd1.

```
# pvmove /dev/sdb1 /dev/sdd1

/dev/sdb1: Moved: 10.0%
…
/dev/sdb1: Moved: 79.7%
…
/dev/sdb1: Moved: 100.0%
```

After the data is moved to the new disk. Re-use the pvs command to check whether the physics volume is free.

```
# pvs -o+pv_used

PV VG Fmt Attr PSize PFree Used
/dev/sda1 myvg lvm2 a- 75.00G 14.00G 61.00G
/dev/sdb1 myvg lvm2 a- 50.00G 50.00G 0
/dev/sdc1 myvg lvm2 a- 17.15G 12.15G 5.00G
/dev/sdd1 myvg lvm2 a- 60.00G 10.00G 50.00G
```

If it’s free, use the vgreduce command to remove the physical volume /dev/sdb1 from the volume group.

```
# vgreduce myvg /dev/sdb1
Removed "/dev/sdb1" from volume group "myvg"
```

Finally, run the pvremove command to remove the disk from the LVM configuration. Now, the disk is completely removed from the LVM and can be used for other purposes.

```
# pvremove /dev/sdb1
Labels on physical volume "/dev/sdb1" successfully wiped.
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-remove-delete-physical-volume-pv-from-volume-group-vg-in-lvm/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/create-lvm-storage-logical-volume-manager-in-linux/
[2]: https://www.2daygeek.com/extend-increase-resize-lvm-logical-volume-in-linux/
[3]: https://www.2daygeek.com/reduce-shrink-decrease-resize-lvm-logical-volume-in-linux/
[4]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[5]: https://www.2daygeek.com/scan-detect-luns-scsi-disks-on-redhat-centos-oracle-linux/
