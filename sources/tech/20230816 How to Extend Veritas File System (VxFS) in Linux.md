[#]: subject: "How to Extend Veritas File System (VxFS) in Linux"
[#]: via: "https://www.2daygeek.com/extend-increase-vxvm-volume-vxfs-filesystem-linux/"
[#]: author: "Jayabal Thiyagarajan https://www.2daygeek.com/author/jayabal/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Extend Veritas File System (VxFS) in Linux
======

Extending the VxFX file system is a routine task for a Linux/Unix administrator and this can be done online with a few steps described in the below article:

In this scenario, the Disk Group doesn’t have sufficient free space, so we will be adding a new disk in the existing Disk Group (DG) and then resizing it.

**Related Articles:**

  * **[How to Create VxVM Volume and Filesystem in Linux][1]**
  * **[How to Create Shared VxFS FileSystem on Linux][2]**



### Step-1: Identifying Filesystem

Check the Filesystem to be increased/extended using the **[df command][3]** and note down the Disk Group (DG) and Volume name from the below output, which will be used later while running vxdg and vxresize commands.

```

    df -hP /data

    Filesystem                  Size  Used Avail Use% Mounted on
    /dev/vx/dsk/testdg/testvol  9.0G  8.4G 0.6G  95%  /data

```

As per the above output, the VxFS filesystem size is **‘9.0 GB’** and we would like to extend additionally **‘5 GB’** and post this activity the VxFS size would be **`'14 GB'`**.

In this case, the DG name is **‘testdg’** and Volume name is **‘testvol’**.

### Step-2: Getting a new Disk/LUN

The new disk must be mapped to the host by the storage team, which may require CR approval, so raise the CR and add the necessary task to the relevant teams, and also include a Rollout/Rollback plan for this activity.

### Step-3: Scanning a Disk/LUN

Once Storage team mapped the new LUN to the host, obtain the LUN id and keep it handy.

Scan the LUN using the below command to discover them at OS level.

```

    for disk_scan in `ls /sys/class/scsi_host`; do echo "Scanning $disk_scan…Completed"; echo "- - -" > /sys/class/scsi_host/$disk_scan/scan; done

    Scanning host0...Completed
    Scanning host1...Completed
    .
    .
    Scanning host[N]...Completed

```

Once the scanning is complete, use the below command to find out if the given LUN is found at the OS level.

```

    lsscsi --scsi | grep -i [Last_Five_Digit_of_LUN]

```

### Step-4: Finding Disks in VxVM

By default, all available disks are visible to Veritas Volume Manager (VxVM), which can be listed by using the **vxdisk** command as shown below.

```

    vxdisk -e list

    DEVICE       TYPE           DISK        GROUP        STATUS               OS_NATIVE_NAME   ATTR
    emc_01       auto:cdsdisk   disk1       testdg       online               sdd              -
    emc_02       auto:cdsdisk   disk2       testdg       online               sde              -
    emc_03       auto:none      -           -            online invalid       sdf              -
    sda          auto:LVM       -           -            LVM                  sda              -
    sdb          auto:LVM       -           -            LVM                  sdb              -

```

The disk **`'sdf'`** STATUS shows as **`"Online invalid"`** indicates that this disk is not under VxVM control. However, use **smartctl** command to double check the LUN id to ensure that you are picking the correct disk.

```

    smartctl -a /dev/sd[x]|grep -i unit

```

If the disk is not populated to VxVM, execute the below command to scan the disk devices in the operating system device tree.

```

    vxdisk scandisks

```

### Step-5: Initializing Disk in VxVM

Once the disk is visible to VxVM at **step #4** , then initialize the disk using the **vxdisksetup** command as shown below:

```

    vxdisksetup -i sdf

```

The above command brings the disk **‘sdf’** to the Veritas Volume Manager (VxVM) and the disk status changed to **`"online"`** now.

![][4]

### Step-6: Adding Disk to Disk Group (DG) in VxVM

The **vxdg** command performs various administrative operations on disk groups. In this example, we will be using it for adding a new disk to the existing Disk Group (DG).

```

    Syntax:
    vxdg -g [DG_Name] adddisk [Any_Name_to_Disk_as_per_Your_Wish=Device_Name]

```

```

    vxdg -g testdg adddisk disk3=emc_03

```

After ran the above command, **DISK** name is **`'disk3'`** and **GROUP** name is **`'testdg'`** were updated for **’emc_03′** device as shown below:

```

    vxdisk -e list

    DEVICE       TYPE           DISK        GROUP        STATUS               OS_NATIVE_NAME   ATTR
    emc_01       auto:cdsdisk   disk1       testdg       online               sdd              -
    emc_02       auto:cdsdisk   disk2       testdg       online               sde              -
    emc_03       auto:none      disk3       testdg       online               sdf              -
    sda          auto:LVM       -           -            LVM                  sda              -
    sdb          auto:LVM       -           -            LVM                  sdb              -

```

### Step-7: Checking free space in the Disk Group (DG)

To determine how much free space is available for a concatenated volume, run:

```

    vxassist -g testdg maxsize

```

### Step-8: Extending VxVM Volume and VxFS Filesystem

We have added **‘5GB’** LUN for this activity, so extending the VxVM volume and VxFS filesystem additionally **`'5GB'`** as shown below:

```

    Syntax:
    vxresize -b -g [DG_Name] [Volume_Name] +[Size_to_be_Increased]

```

```

    vxresize -b -g testdg testvol +5g

```

  * **Where:**
  * vxresize : Command
  * -b : Perform the resize operation in the background (optional).
  * -g : Limits operation of the command to the given disk group, as specified by disk group ID or disk group name.
  * testdg : Our DiskGroup (DG) Name
  * testvol : Our Volume Name
  * +5g : This volume will be increased additionaly 5GB.



### Step-9: Checking Extended VxFS Filesystem

Finally, check the extended VxFS of **‘/data’** using the df command:

```

    df -hP /data

    Filesystem                  Size  Used Avail Use% Mounted on
    /dev/vx/dsk/testdg/testvol  14G   8.4G 5.6G  68%  /data

```

##### Conclusion

In this tutorial, we’ve shown you how to add a new disk to the existing Disk Group (DG), and extend VxVM Volume and VxFS Filesystem in Linux with few easy steps.

If you have any questions or feedback, feel free to comment below.

Kindly support us by sharing this article with wider circle.

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/extend-increase-vxvm-volume-vxfs-filesystem-linux/

作者：[Jayabal Thiyagarajan][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/jayabal/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/create-vxvm-volume-vxfs-filesystem-linux/
[2]: https://www.2daygeek.com/create-veritas-shared-vxfs-file-system-linux/
[3]: https://www.2daygeek.com/linux-check-disk-space-usage-df-command/
[4]: https://www.2daygeek.com/wp-content/uploads/2023/07/extend-increase-vxvm-volume-vxfs-filesystem-linux-1024x201.jpg
