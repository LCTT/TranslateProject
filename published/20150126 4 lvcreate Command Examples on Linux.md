4 个 lvcreate 常用命令举例
================================================================================
逻辑卷管理（LVM）是广泛使用的技术，并拥有极其灵活磁盘管理方案。主要包含3个基础命令：

1. 创建物理卷使用**pvcreate**
2. 创建卷组并给卷组增加分区**vgcreate**
3. 创建新的逻辑卷使用**lvcreate**

![](http://www.ehowstuff.com/wp-content/uploads/2015/01/lvm-diagram1.jpg)

下列例子主要讲述在已经存在的卷组上使用**lvcreate**创建逻辑卷。**lvcreate**命令可以在卷组的可用物理扩展池中分配逻辑扩展。通常，逻辑卷可以随意使用底层逻辑卷上的任意空间。修改逻辑卷将释放或重新分配物理卷的空间。这些例子已经在CentOS 5, CentOS 6, CentOS 7, RHEL 5, RHEl 6 和 RHEL 7 版本中测试通过。

### 4个lvcreate命令例子 ###

1. 在名为vg_newlvm的卷组中创建15G大小的逻辑卷：

    	[root@centos7 ~]# lvcreate -L 15G vg_newlvm

2. 在名为vg_newlvm的卷组中创建大小为2500MB的逻辑卷，并命名为centos7_newvol，这样就创建了块设备/dev/vg_newlvm/centos7_newvol：

    	[root@centos7 ~]# lvcreate -L 2500 -n centos7_newvol vg_newlvm

3. 可以使用**lvcreate**命令的参数-l来指定逻辑卷扩展的大小。也可以使用这个参数以卷组的大小百分比来扩展逻辑卷。这下列的命令创建了centos7_newvol卷组的50%大小的逻辑卷vg_newlvm:

    	[root@centos7 ~]# lvcreate -l 50%VG -n centos7_newvol vg_newlvm

4. 使用卷组剩下的所有空间创建逻辑卷

   	  	[root@centos7 ~]# lvcreate --name centos7_newvol -l 100%FREE vg_newlvm

更多帮助，使用**lvcreate**命令--help选项来查看：

    [root@centos7 ~]# lvcreate --help

----------

      lvcreate: Create a logical volume（创建逻辑卷）
    
    lvcreate
            [-A|--autobackup {y|n}]（自动备份）
            [-a|--activate [a|e|l]{y|n}]
            [--addtag Tag]（增加标签）
            [--alloc AllocationPolicy]（分配策略）
            [--cachemode CacheMode]（Cache模式）
            [-C|--contiguous {y|n}]
            [-d|--debug]
            [-h|-?|--help]
            [--ignoremonitoring]（忽略监控）
            [--monitor {y|n}]（监控）
            [-i|--stripes Stripes [-I|--stripesize StripeSize]]
            [-k|--setactivationskip {y|n}]
            [-K|--ignoreactivationskip]
            {-l|--extents LogicalExtentsNumber[%{VG|PVS|FREE}] |（逻辑扩展数）
             -L|--size LogicalVolumeSize[bBsSkKmMgGtTpPeE]}（逻辑卷大小）
            [-M|--persistent {y|n}] [--major major] [--minor minor]
            [-m|--mirrors Mirrors [--nosync] [{--mirrorlog {disk|core|mirrored}|--corelog}]]（镜像）
            [-n|--name LogicalVolumeName]（逻辑卷名字）
            [--noudevsync]
            [-p|--permission {r|rw}]
            [--[raid]minrecoveryrate Rate]
            [--[raid]maxrecoveryrate Rate]
            [-r|--readahead ReadAheadSectors|auto|none]（读取头扇区）
            [-R|--regionsize MirrorLogRegionSize]（镜像逻辑区域尺寸）
            [-T|--thin  [-c|--chunksize  ChunkSize]（块大小）
              [--discards {ignore|nopassdown|passdown}]
              [--poolmetadatasize MetadataSize[bBsSkKmMgG]]]
              [--poolmetadataspare {y|n}]
            [--thinpool ThinPoolLogicalVolume{Name|Path}] （精简池逻辑卷）
            [-t|--test]
            [--type VolumeType]（卷类型）
            [-v|--verbose]
            [-W|--wipesignatures {y|n}]
            [-Z|--zero {y|n}]
            [--version]
            VolumeGroupName [PhysicalVolumePath...]
    

--------------------------------------------------------------------------------

via: http://www.ehowstuff.com/4-lvcreate-command-examples-on-linux/

作者：[skytech][a]
译者：[Vic020](https://github.com/Vic020)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ehowstuff.com/author/mhstar/
