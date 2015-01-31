    Vic020

4 lvcreate Command Examples on Linux
================================================================================
Logical volume management (LVM) is a widely-used technique and extremely flexible disk management scheme. It basically contain three basic command :

a. Creates the physical volumes using **pvcreate**
b. Create the volume group and add partition into volume group using **vgcreate**
c. Create a new logical volume using **lvcreate**

![](http://www.ehowstuff.com/wp-content/uploads/2015/01/lvm-diagram1.jpg)

The following examples focus on the command to create a logical volume in an existing volume group, **lvcreate**. **lvcreate** is the command do allocating logical extents from the free physical extent pool of that volume group. Normally logical volumes use up any space available on the underlying physical volumes on a next-free basis. Modifying the logical volume will frees and reallocates space in the physical volumes. The following **lvcreate** command has been tested on linux CentOS 5, CentOS 6, CentOS 7, RHEL 5, RHEl 6 and RHEL 7 version.

### 4 lvcreate Command Examples on Linux : ###

1. The following command creates a logical volume 15 gigabytes in size in the volume group vg_newlvm :

    [root@centos7 ~]# lvcreate -L 15G vg_newlvm

2. The following command creates a 2500 MB linear logical volume named centos7_newvol in the volume group
vg_newlvm, creating the block device /dev/vg_newlvm/centos7_newvol :

    [root@centos7 ~]# lvcreate -L 2500 -n centos7_newvol vg_newlvm

3. You can use the -l argument of the **lvcreate** command to specify the size of the logical volume in extents. You can also use this argument to specify the percentage of the volume group to use for the logical volume. The following command creates a logical volume called centos7_newvol that uses 50% of the total space in volume group vg_newlvm :

    [root@centos7 ~]# lvcreate -l 50%VG -n centos7_newvol vg_newlvm

4. The following command creates a logical volume called centos7_newvol that uses all of the unallocated space in the volume group vg_newlvm :

    [root@centos7 ~]# lvcreate --name centos7_newvol -l 100%FREE vg_newlvm

To see more **lvcreate** command options, issue the following command :

    [root@centos7 ~]# lvcreate --help

----------

      lvcreate: Create a logical volume
    
    lvcreate
            [-A|--autobackup {y|n}]
            [-a|--activate [a|e|l]{y|n}]
            [--addtag Tag]
            [--alloc AllocationPolicy]
            [--cachemode CacheMode]
            [-C|--contiguous {y|n}]
            [-d|--debug]
            [-h|-?|--help]
            [--ignoremonitoring]
            [--monitor {y|n}]
            [-i|--stripes Stripes [-I|--stripesize StripeSize]]
            [-k|--setactivationskip {y|n}]
            [-K|--ignoreactivationskip]
            {-l|--extents LogicalExtentsNumber[%{VG|PVS|FREE}] |
             -L|--size LogicalVolumeSize[bBsSkKmMgGtTpPeE]}
            [-M|--persistent {y|n}] [--major major] [--minor minor]
            [-m|--mirrors Mirrors [--nosync] [{--mirrorlog {disk|core|mirrored}|--corelog}]]
            [-n|--name LogicalVolumeName]
            [--noudevsync]
            [-p|--permission {r|rw}]
            [--[raid]minrecoveryrate Rate]
            [--[raid]maxrecoveryrate Rate]
            [-r|--readahead ReadAheadSectors|auto|none]
            [-R|--regionsize MirrorLogRegionSize]
            [-T|--thin  [-c|--chunksize  ChunkSize]
              [--discards {ignore|nopassdown|passdown}]
              [--poolmetadatasize MetadataSize[bBsSkKmMgG]]]
              [--poolmetadataspare {y|n}]
            [--thinpool ThinPoolLogicalVolume{Name|Path}]
            [-t|--test]
            [--type VolumeType]
            [-v|--verbose]
            [-W|--wipesignatures {y|n}]
            [-Z|--zero {y|n}]
            [--version]
            VolumeGroupName [PhysicalVolumePath...]
    
    lvcreate
            { {-s|--snapshot} OriginalLogicalVolume[Path] |
              [-s|--snapshot] VolumeGroupName[Path] -V|--virtualsize VirtualSize}
              {-T|--thin} VolumeGroupName[Path][/PoolLogicalVolume]
                          -V|--virtualsize VirtualSize}
            [-c|--chunksize]
            [-A|--autobackup {y|n}]
            [--addtag Tag]
            [--alloc AllocationPolicy]
            [-C|--contiguous {y|n}]
            [-d|--debug]
            [--discards {ignore|nopassdown|passdown}]
            [-h|-?|--help]
            [--ignoremonitoring]
            [--monitor {y|n}]
            [-i|--stripes Stripes [-I|--stripesize StripeSize]]
            [-k|--setactivationskip {y|n}]
            [-K|--ignoreactivationskip]
            {-l|--extents LogicalExtentsNumber[%{VG|FREE|ORIGIN}] |
             -L|--size LogicalVolumeSize[bBsSkKmMgGtTpPeE]}
            [--poolmetadatasize MetadataVolumeSize[bBsSkKmMgG]]
            [-M|--persistent {y|n}] [--major major] [--minor minor]
            [-n|--name LogicalVolumeName]
            [--noudevsync]
            [-p|--permission {r|rw}]
            [-r|--readahead ReadAheadSectors|auto|none]
            [-t|--test]
            [--thinpool ThinPoolLogicalVolume[Path]]
            [-v|--verbose]
            [--version]
            [PhysicalVolumePath...]

--------------------------------------------------------------------------------

via: http://www.ehowstuff.com/4-lvcreate-command-examples-on-linux/

作者：[skytech][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ehowstuff.com/author/mhstar/
