[#]: subject: "How to find SAN LUN Mapped to VxVM Disk in Linux"
[#]: via: "https://www.2daygeek.com/find-san-lun-mapping-with-vxvm-disk-veritas-linux/"
[#]: author: "Prakash Subramanian https://www.2daygeek.com/author/prakash/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to find SAN LUN Mapped to VxVM Disk in Linux
======

We’ve written several articles in the past to find LUN ID mapped to Block device/disk, but when you’re managing a **[VCS cluster][1]** there are some situations where you might want to map a LUN ID against a VxVM (Veritas Volume Manager ) disk for VxFS file system expansion.

This short article describes how to find the LUN number associated with a VxVM disk in Linux

**Recommended Read:**

  * **[How to Find SAN disk LUN id in Linux][2]**
  * **[How to map ASM disks to Physical disks in Linux][3]**
  * **[How to map SAN LUN, Disk and FileSystem in Linux][4]**
  * **[How to map LUN, Disk, LVM and File System in Linux][5]**



### Shell Script to find LUN Number Mapped to VxVM Disk in Linux

This handy shell script helps you to identify which storage LUN associated to which VxVM disk on Linux.

#### How this script works

This script follow the below steps to collect and print these information’s.

  * It collects the list of active **‘Disk Group’ (DG)** on the system
  * Find the **‘Device Names’** associated with the respective DGs.
  * Next, it lists the **‘Block Devices’** mapped with the respective devices.
  * Finally collects the **LUN IDs** associated with these block devices and prints them all together like DG name, block device name and LUN numbers.



```

    vi VxVM_disk_mapping_with_LUN_number.sh

    #!/bin/bash
    ###########################################################
    # Purpose: Mapping LUN Number to VxVM Disk in Linux
    # Author: 2DayGeek
    # Version: v1.0
    ###########################################################

    echo "DG_Name           Block_Device            LUN_Number"
    echo "-------------------------------------------------------------------"
    for dg_name in `vxdg list | awk '{print $1}' | grep -v NAME`
    do
     for d_name in `vxdisk -e list | grep -i $dg_name | awk '{print $1}'
      do
        for b_device in `vxdisk list $d_name | grep -w state=enabled | awk '{print $1}' | head -1`
        do
         echo "$dg_name --> $b_device --> $(lsscsi --scsi | grep $b_device | awk '{print $NF}'"
        done
      done
    done | column -t

```

Set an executable permission to shell script file.

```

    chmod +x VxVM_disk_mapping_with_LUN_number.sh

```

Finally execute the script to view the results.

```

    sh VxVM_disk_mapping_with_LUN_number.sh

```

Your output will resemble this. However, the DG name, Block devices and LUN would differ from this.

![][6]

If you would like to run the above script on the fly, use the following one liner script.

```

    # for dg_name in `vxdg list | awk '{print $1}' | grep -v NAME`; do for d_name in `vxdisk -e list | grep -i $dg_name | awk '{print $1}'; do for b_device in `vxdisk list $d_name | grep -w state=enabled | awk '{print $1}' | head -1`; do echo "$dg_name --> $b_device --> $(lsscsi --scsi | grep $b_device | awk '{print $NF}'"; done; done; done | column -t

    apachedg   -->  sde -->  3600d0230000000000e11404639558823
    apachedg   -->  sdf -->  3600d0230000000000e11404639558824
    apachedg   -->  sdg -->  3600d0230000000000e11404639558825
    sftpdg     -->  sdh -->  3600d0230000000000e11404639558826
    sftpdg     -->  sdi -->  3600d0230000000000e11404639558827

```

##### Wrapping Up

In this tutorial, we have shown you how to find the LUN number mapped with VxVM (Veritas Volume Manager) disk in Linux.

If you have any questions or feedback, feel free to comment below.

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/find-san-lun-mapping-with-vxvm-disk-veritas-linux/

作者：[Prakash Subramanian][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/category/veritas-cluster/
[2]: https://www.2daygeek.com/find-san-disk-lun-id-linux/
[3]: https://www.2daygeek.com/shell-script-map-oracle-asm-disks-physical-disk-lun-in-linux/
[4]: https://www.2daygeek.com/map-san-lun-physical-disk-filesystem-linux/
[5]: https://www.2daygeek.com/map-san-lun-physical-disk-filesystem-lvm-info-linux/
[6]: https://www.2daygeek.com/wp-content/uploads/2023/07/find-san-lun-mapping-with-vxvm-disk-veritas-linux-1024x298.jpg
