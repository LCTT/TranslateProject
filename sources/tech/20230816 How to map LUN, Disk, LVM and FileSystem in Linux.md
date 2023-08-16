[#]: subject: "How to map LUN, Disk, LVM and FileSystem in Linux"
[#]: via: "https://www.2daygeek.com/map-san-lun-physical-disk-filesystem-lvm-info-linux/"
[#]: author: "Rasool Cool https://www.2daygeek.com/author/rasool/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to map LUN, Disk, LVM and FileSystem in Linux
======

There are situations where you want to map storage LUN (Logical Unit Number), Block Device, LVM (LV & VG names) and File System (FS) information for FS expansion or Disaster Recovery (DR) operation.

This is a routine activity for most Linux administrators, and we usually use some script that displays the block device mapping against SAN LUN, and then we will manually add the LVM and File System information to complete the operation.

Going forward, you don’t need to manually intervene on this activity because these information can be mapped by shell script as shown below.

**Refer the following articles similar to this:**

  * **[How to Find SAN disk LUN id in Linux][1]**
  * **[How to map ASM disks to Physical disks in Linux][2]**
  * **[How to map SAN LUN, Disk and FileSystem in Linux][3]**



### Shell Script to map LUN, Disk, LVM and FileSystem in Linux

This small shell script helps you to identify which SAN disks are mapped to which Block devices, LV, VG and Filesystem on Linux.

**Make a Note:** We have excluded **‘sda’** disk because this is Operating System (OS) disk, which has multiple partitions.

```

    vi block_device_mapping_with_LUN_FS_LVM.sh

    #!/bin/bash
    for bdevice in `lsblk | grep disk | awk '{print $1}' | grep -v 'sda'`
    do
    for mpoint in `lsblk /dev/$bdevice | grep lvm | awk '{print $NF}'`
    do
    LVM_INFO=`lvs -o +devices | grep -i $bdevice | awk '{print $1,$2}'`
    LUN_ID=`lsscsi --scsi | grep $bdevice | awk '{print $NF}'`
    echo "$bdevice --> $mpoint --> $LVM_INFO --> $LUN_ID"
    done
    done

```

Set an executable permission to **‘block_device_mapping_with_LUN_FS_LVM.sh’** file.

```

    chmod +x block_device_mapping_with_LUN_FS_LVM.sh

```

Finally run the script to view the results.

```

    sh block_device_mapping_with_LUN_FS_LVM.sh

```

![][4]

**Make a Note:** In the above output, device **`sdb`** won’t show any LUN info because it’s a virtual disk added from VMWare end, which doesn’t have any LUN. Other 3 disks are mapped from Storage which is why can see LUN info.

If you would like to run the above script on the fly, use the following one liner script.

```

    for bdevice in `lsblk | grep disk | awk '{print $1}' | grep -v 'sda'`; do for mpoint in `lsblk /dev/$bdevice | grep lvm | awk '{print $NF}'`; do LVM_INFO=`lvs -o +devices | grep -i $bdevice | awk '{print $1,$2}'`; LUN_ID=`lsscsi --scsi | grep $bdevice | awk '{print $NF}'`; echo "$bdevice --> $mpoint --> $LVM_INFO --> $LUN_ID"; done; done

    sdb --> [SWAP] --> swap2lv swapvg --> -
    sdc --> /appserver --> appserver_lv appserver_vg --> 360000670000415600477312020662021
    sdd --> /data --> data_lv data_vg --> 360000670000415600477312020662022
    sde --> /backup --> backup_lv backup_vg --> 360000670000415600477312020662023

```

##### Wrapping Up

In this tutorial, we’ve shown you how to check LUN presented from SAN with underlying OS disk, LV Name, VG Name and associated Filesystem on Linux.

If you have any questions or feedback, feel free to comment below.

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/map-san-lun-physical-disk-filesystem-lvm-info-linux/

作者：[Rasool Cool][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/rasool/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/find-san-disk-lun-id-linux/
[2]: https://www.2daygeek.com/shell-script-map-oracle-asm-disks-physical-disk-lun-in-linux/
[3]: https://www.2daygeek.com/map-san-lun-physical-disk-filesystem-linux/
[4]: https://www.2daygeek.com/wp-content/uploads/2023/06/map-san-lun-physical-disk-filesystem-lvm-info-linux-1024x155.jpg
