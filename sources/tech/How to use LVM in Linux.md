Vic020 在被关，我就急

How to use LVM in Linux
================================================================================
Logical Volume Manager (LVM) is a versatile disk management system that can easily be used in Linux or similar operating systems. Traditional partitions are created in fixed sizes, and resizing them is a tedious process. On the other hand, LVM creates and manages "logical" volumes off of physical hard disks, and provides administrators the flexibility to extend and shrink logical volumes easily on demand without damaging stored data. Additional hard disks can be added to LVM at will, further increasing existing logical volumes. LVM does not need reboot as long as the kernel is aware of the existence of a partition.

LVM uses a hierarchical structure as it can be seen in the following diagram.

![](https://farm3.staticflickr.com/2910/14127487464_96b24a906b_z.jpg)

At the top, we have physical volumes. One or more physical volumes are used to create a volume group. Logical volumes are then created from these volume groups. As long as there is space available in the volume group, we can create logical volumes from the volume group. File system is created on these logical volumes, which are then mounted and accessible in the operating system.

### LVM Test Scenario ###

This tutorial will describe **how to use LVM to create and manage LVM volumes in Linux**. The tutorial will be divided into two parts. In the first part, we will create several logical volumes on one hard disk, and mount them in /lvm-mount directory. We will then resize the created volumes. In the second part, we will add additional volumes created from a second hard disk to LVM.

### Preparing Disk Partitions ###

Disk partitions are created using fdisk. We will create three partitions of 1 GB each, though identical sized partitions are not mandatory. Also, the partitions are created as type '8e' to make them compatible with LVM.

    # fdisk /dev/sdb 

----------

    Command (m for help): n ## new
    Command action
       e   extended
       p   primary partition (1-4)
    p ## primary
    
    Partition number (1-4): 1 ## partition number
    First cylinder (1-1044, default 1):  ## hit enter
    Last cylinder, +cylinders or +size{K,M,G} (1-1044, default 1044): +1G ## size
    
    Command (m for help): t ## change type
    Selected partition 1
    Hex code (type L to list codes): 8e ## code for LVM
    Changed system type of partition 1 to 8e (Linux LVM)

We repeat the same steps to create two other partitions. After the partitions are created, we should get an output similar to this:

    # fdisk -l 

----------

       Device Boot      Start         End      Blocks   Id  System
    /dev/sdb1               1         132     1060258+  8e  Linux LVM
    /dev/sdb2             133         264     1060290   8e  Linux LVM
    /dev/sdb3             265         396     1060290   8e  Linux LVM

### Preparing Physical Volumes ###

The newly created partitions are used to store physical volumes. LVM can work with different sized physical volumes.

    # pvcreate /dev/sdb1
    # pvcreate /dev/sdb2
    # pvcreate /dev/sdb3 

Physical volumes can be verified using the following command. The following section contains partial output. "/dev/sdb2" is a new physical volume of "1.01 GiB".

    # pvdisplay 

----------

      --- NEW Physical volume ---
      PV Name               /dev/sdb2
      VG Name
      PV Size               1.01 GiB
      Allocatable           NO
      PE Size               0
      Total PE              0
      Free PE               0
      Allocated PE          0
      PV UUID               jszvzz-ENA2-g5Pd-irhV-T9wi-ZfA3-0xo092

Physical volumes can be deleted using the following command.

    # pvremove /dev/sdb1 

### Preparing Volume Groups ###

The following command creates a volume group named 'volume-group1' by using the physical volumes /dev/sdb1, /dev/sdb2 and /dev/sdb3.

    # vgcreate volume-group1 /dev/sdb1 /dev/sdb2 /dev/sdb3

Volume groups can be verified using the following command.

    # vgdisplay 

----------

      --- Volume group ---
      VG Name               volume-group1
      System ID
      Format                lvm2
      Metadata Areas        3
      Metadata Sequence No  1
      VG Access             read/write
      VG Status             resizable
      MAX LV                0
      Cur LV                0
      Open LV               0
      Max PV                0
      Cur PV                3
      Act PV                3
      VG Size               3.02 GiB
      PE Size               4.00 MiB
      Total PE              774
      Alloc PE / Size       0 / 0
      Free  PE / Size       774 / 3.02 GiB
      VG UUID               bwd2pS-fkAz-lGVZ-qc7C-TaKv-fFUC-IzGNBK

We can view used/total size of the volume group from the output. Logical volumes take the space of the volume group. As long as there is free space available in the volume group, we can create logical volumes.

Volume groups can be deleted using the following command.

    # vgremove volume-group1 

### Creating Logical Volumes ###

The following command creates a logical volume named 'lv1' of size 100MB. We are using small sized partitions to reduce processing time. The logical volume will take its space from the volume group defined earlier.

    # lvcreate -L 100M -n lv1 volume-group1 

Logical volumes can be verified using the command lvdisplay.

    # lvdisplay 

----------

      --- Logical volume ---
      LV Name                /dev/volume-group1/lv1
      VG Name                volume-group1
      LV UUID                YNQ1aa-QVt1-hEj6-ArJX-I1Q4-y1h1-OFEtlW
      LV Write Access        read/write
      LV Status              available
      # open                 0
      LV Size                100.00 MiB
      Current LE             25
      Segments               1
      Allocation             inherit
      Read ahead sectors     auto
      - currently set to     256
      Block device           253:2

Now that the logical volume is ready, we can format and mount the logical volume like any other ext2/3/4 partition.

    # mkfs.ext4 /dev/volume-group1/lv1
    # mkdir /lvm-mount
    # mount /dev/volume-group1/lv1 /lvm-mount/ 

Once the logical volume is mounted, we can access it by reading/writing to the mount point /lvm-mount/. To create and mount additional logical volumes, we can repeat this process.

Finally, we can delete any logical volume with lvremove.

    # umount /lvm-mount/
    # lvremove /dev/volume-group1/lv1 

### Expanding an LVM Volume ###

The ability to resize a logical volume is the best part about using LVM. This section will discuss how we can expand an existing logical volume. We will be expanding the previously created logical volume 'lv1' to 200 MB.

Note that after resizing a logical volume, we also need to resize the file system to match. This extra step varies depending on which file system is created in the volume. In this tutorial, we created ext4 file system on 'lv1', so the instruction here focused on ext4 file system (it is compatible with ext2/3 file system as well). The sequence of the commands is important.

First, we unmount the volume.

    # umount /lvm-mount/ 

Then, the size of the volume is set to be 200M.

    # lvresize -L 200M /dev/volume-group1/lv1 

Next, the disk is checked for errors.

    # e2fsck -f /dev/volume-group1/lv1 

After that, the ext4 information is updated.

    # resize2fs /dev/volume-group1/lv1 

The logical volume should be extended to 200 MB by now. We can verify it by checking the LV status.

    # lvdisplay 

----------

      --- Logical volume ---
      LV Name                /dev/volume-group1/lv1
      VG Name                volume-group1
      LV UUID                9RtmMY-0RIZ-Dq40-ySjU-vmrj-f1es-7rXBwa
      LV Write Access        read/write
      LV Status              available
      # open                 0
      LV Size                200.00 MiB
      Current LE             50
      Segments               1
      Allocation             inherit
      Read ahead sectors     auto
      - currently set to     256
      Block device           253:2

Now the logical volume can be mounted again, and be used just like any partition.

### Shrinking an LVM Volume ###

This section will cover the method of reducing the size of an LVM. The sequence of the commands is important. Again, this instruction is valid for ext2/3/4 file system.

Note that reducing the size of the logical volume to a value less than stored data will end in loss of data.

First, the volume is unmounted.

    # umount /dev/volume-group1/lv1

Then, the volume is checked for errors.

    # e2fsck -f /dev/volume-group1/lv1 

Next, the ext4 information is updated.

    # resize2fs /dev/volume-group1/lv1 100M 

After that, the logical volume is reduced.

    # lvresize -L 100M /dev/volume-group1/lv1 

> WARNING: Reducing active logical volume to 100.00 MiB
>   THIS MAY DESTROY YOUR DATA (filesystem etc.)
> Do you really want to reduce lv1? [y/n]: y
>   Reducing logical volume lv1 to 100.00 MiB
>   Logical volume lv1 successfully resized

Finally, the updated size of the logical volume is verified.

    # lvdisplay 

----------

    --- Logical volume ---
      LV Name                /dev/volume-group1/lv1
      VG Name                volume-group1
      LV UUID                9RtmMY-0RIZ-Dq40-ySjU-vmrj-f1es-7rXBwa
      LV Write Access        read/write
      LV Status              available
      # open                 0
      LV Size                100.00 MiB
      Current LE             25
      Segments               1
      Allocation             inherit
      Read ahead sectors     auto
      - currently set to     256
      Block device           253:2

### Expanding a Volume Group ###

This section will cover the method of expanding a volume group by adding a new physical volume to the volume group. Let us assume that our volume group 'volume-group1' is full, and needs to be expanded. Our current hard disk (sdb) does not have any spare partitions, and we have added another hard disk (sdc). We will see how we can expand the volume group by adding a partition from sdc.

To check the current state of VG.

    # vgdisplay volume-group1 

----------

     --- Volume group ---
      VG Name               volume-group1
      System ID
      Format                lvm2
      Metadata Areas        3
      Metadata Sequence No  8
      VG Access             read/write
      VG Status             resizable
      MAX LV                0
      Cur LV                1
      Open LV               0
      Max PV                0
      Cur PV                3
      Act PV                3
      VG Size               3.02 GiB
      PE Size               4.00 MiB
      Total PE              774
      Alloc PE / Size       25 / 100.00 MiB
      Free  PE / Size       749 / 2.93 GiB
      VG UUID               bwd2pS-fkAz-lGVZ-qc7C-TaKv-fFUC-IzGNBK

First, we create a 2 GB partition sdc1 of type LVM (8e) as explained earlier in the tutorial. 

    # fdisk /dev/sdc 

----------

    Command (m for help): n
    Command action
       e   extended
       p   primary partition (1-4)
    p
    Partition number (1-4): 1
    First cylinder (1-1044, default 1):
    Using default value 1
    Last cylinder, +cylinders or +size{K,M,G} (1-1044, default 1044): +2G
    
    Command (m for help): t
    Selected partition 1
    Hex code (type L to list codes): 8e
    Changed system type of partition 1 to 8e (Linux LVM)
    
    Command (m for help): w
    The partition table has been altered!

Then, we create a physical volume /dev/sdc1.

    # pvcreate /dev/sdc1 

Now that the physical volume is ready, we can simply add it to the existing volume group 'volume-group1'.

    # vgextend volume-group1 /dev/sdc1 

We can verify it using vgdisplay.

    # vgdisplay 

----------

      --- Volume group ---
      VG Name               volume-group1
      System ID
      Format                lvm2
      Metadata Areas        4
      Metadata Sequence No  9
      VG Access             read/write
      VG Status             resizable
      MAX LV                0
      Cur LV                1
      Open LV               0
      Max PV                0
      Cur PV                4
      Act PV                4
      VG Size               5.03 GiB
      PE Size               4.00 MiB
      Total PE              1287
      Alloc PE / Size       25 / 100.00 MiB
      Free  PE / Size       1262 / 4.93 GiB
      VG UUID               bwd2pS-fkAz-lGVZ-qc7C-TaKv-fFUC-IzGNBK

Note that although we have used a separate disk for demonstration, any disk of type '8e' can be used for expanding a volume group.

To sum up, LVM is a very powerful tool for creating and managing resizable partitions. In this tutorial, we have seen how dynamic partitions can be created and used using LVM. We have also seen the method of expanding/reducing the logical volumes and volume groups, and adding new hard disks to LVM.

Hope this helps.

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/05/use-lvm-linux.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
