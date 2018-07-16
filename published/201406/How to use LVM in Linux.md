Linux LVM简明教程
================================================================================
逻辑卷管理LVM是一个多才多艺的硬盘系统工具。无论在Linux或者其他类似的系统，都是非常的好用。传统分区使用固定大小分区，重新调整大小十分麻烦。但是，LVM可以创建和管理“逻辑”卷，而不是直接使用物理硬盘。可以让管理员弹性的管理逻辑卷的扩大缩小，操作简单，而不损坏已存储的数据。可以随意将新的硬盘添加到LVM，以直接扩展已经存在的逻辑卷。LVM并不需要重启就可以让内核知道分区的存在。

LVM使用分层结构，如下图所示。

![](https://farm3.staticflickr.com/2910/14127487464_96b24a906b_z.jpg)

图中顶部，首先是实际的物理磁盘及其划分的分区和其上的物理卷（PV）。一个或多个物理卷可以用来创建卷组（VG）。然后基于卷组可以创建逻辑卷（LV）。只要在卷组中有可用空间，就可以随心所欲的创建逻辑卷。文件系统就是在逻辑卷上创建的，然后可以在操作系统挂载和访问。

### LVM测试说明 ###

本文将介绍**怎么在linux中创建和管理LVM卷**。我们将会分成两个部分。第一个部分，我们首先要在一个硬盘上创建多个逻辑卷，然后将它们挂载在/lvm-mount目录。然后我们将要对创建好的卷调整大小。而第二部分，我们将会从另外一块硬盘增加额外的卷到LVM中。

### 准备磁盘分区 ###

通过使用fdisk，创建磁盘分区。我们需要创建3个1G分区，注意，并不要求分区的大小一致。同样，分区需要使用‘8e’类型来使他们可用于LVM。

    # fdisk /dev/sdb 

----------

    Command (m for help): n ## 新建
    Command action
       e   extended
       p   primary partition (1-4)
    p ## 主分区
    
    Partition number (1-4): 1 ## 分区号
    First cylinder (1-1044, default 1):  ## 回车用默认的1
    Last cylinder, +cylinders or +size{K,M,G} (1-1044, default 1044): +1G ## 大小
    
    Command (m for help): t ## 改变类型
    Selected partition 1
    Hex code (type L to list codes): 8e ## LVM 的分区代码
    Changed system type of partition 1 to 8e (Linux LVM)

重复上面的操作来创建其他两个分区。分区创建完成后，我们应该有类似如下的输出：

    # fdisk -l 

----------

       Device Boot      Start         End      Blocks   Id  System
    /dev/sdb1               1         132     1060258+  8e  Linux LVM
    /dev/sdb2             133         264     1060290   8e  Linux LVM
    /dev/sdb3             265         396     1060290   8e  Linux LVM

### 准备物理卷(PV) ###

刚创建的分区是用来储存物理卷的。LVM可以使用不同大小的物理卷。

    # pvcreate /dev/sdb1
    # pvcreate /dev/sdb2
    # pvcreate /dev/sdb3 

使用下列命令检查物理卷的创建情况。下面截取部分输出。"/dev/sdb2"是一个新的"1.01 GiB"物理卷。

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

使用下列命令可以删除物理卷。

    # pvremove /dev/sdb1 

### 准备卷组(VG) ###

下列命令用来创建名为'volume-group1'的卷组，使用/dev/sdb1, /dev/sdb2 和 /dev/sdb3创建。

    # vgcreate volume-group1 /dev/sdb1 /dev/sdb2 /dev/sdb3

使用下列命令可以来验证卷组。

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

从输出中，我们可以看见卷组的使用量/总量。物理卷给卷组提供空间。只要在这个卷组中还有可用空间，我们就可以随意创建逻辑卷。

使用下列命令删除卷组。

    # vgremove volume-group1 

### 创建逻辑卷(LV) ###

下列命令创建一个名为'1v1'、大小为100MB的逻辑卷。我们使用小分区减少执行时间。这个逻辑卷使用之前创建的卷组的空间。

    # lvcreate -L 100M -n lv1 volume-group1 

逻辑卷可使用lvdisplay命令查看。

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

现在逻辑卷已经准备好了，我们可以格式化和挂载逻辑卷，就像其它ext2/3/4分区一样！

    # mkfs.ext4 /dev/volume-group1/lv1
    # mkdir /lvm-mount
    # mount /dev/volume-group1/lv1 /lvm-mount/ 

一旦逻辑卷挂载，我们就可以到挂载点 /lvm-mount/ 上读写了。要创建和挂载其它的逻辑卷，我们重复这个过程。

最后，使用lvremove我们可以删除逻辑卷。

    # umount /lvm-mount/
    # lvremove /dev/volume-group1/lv1 

### 扩展一个LVM卷 ###

调整逻辑卷大小的功能是LVM最有用的功能。这个部分会讨论我们怎么样扩展一个存在的逻辑卷。下面，我们将会扩展先前创建的逻辑卷‘lv1’扩大到200MB。

注意，调整逻辑卷大小之后，也需要对文件系统调整大小进行匹配。这个额外的步骤各不相同，取决于创建文件系统的类型。在本文中，我们使用'lv1'创建了ext4类型的文件系统，所以这里的操作是针对ext4文件系统的。（ext2/3文件系统也类同）。命令的执行顺序是很重要的。

首先，我们卸载掉lv1卷

    # umount /lvm-mount/ 

然后，设置卷的大小为200M

    # lvresize -L 200M /dev/volume-group1/lv1 

接下来，检查磁盘错误

    # e2fsck -f /dev/volume-group1/lv1 

运行以下命令扩展文件系统以后，ext4信息就更新了。

    # resize2fs /dev/volume-group1/lv1 

现在，这个逻辑卷应该已经扩展到200MB了。我们检查LV的状态来验证。

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

现在，这个逻辑卷可以再次挂载，同样这个方法也可用于其他分区。

### 缩减一个LVM卷 ###

这章节介绍缩减LVM卷大小的方法。命令的顺序同样重要。并且，下列命令对ext2/3/4文件系统同样有效。

注意减少逻辑卷的大小值若小于储存的数据大小，存储在后面的数据会丢失。

首先，卸载掉卷。

    # umount /dev/volume-group1/lv1

然后，检测磁盘错误。

    # e2fsck -f /dev/volume-group1/lv1 

接下来缩小文件系统，更新ext4信息。

    # resize2fs /dev/volume-group1/lv1 100M 

完成以后，减少逻辑卷大小

    # lvresize -L 100M /dev/volume-group1/lv1 

> WARNING: Reducing active logical volume to 100.00 MiB
>   THIS MAY DESTROY YOUR DATA (filesystem etc.)
> Do you really want to reduce lv1? [y/n]: y
>   Reducing logical volume lv1 to 100.00 MiB
>   Logical volume lv1 successfully resized

最后，验证调整后的逻辑卷大小。

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

### 扩展一个卷组 ###

本节将讨论扩展卷组的方法，将一个物理卷添加到卷组。让我们假设我们的卷组'volume-group1'已经满了，需要扩大。手上的硬盘（sdb）已经没有其他空闲分区，我们添加了另外一个硬盘（sdc）。我们将看到如何把sdc的分区添加到卷组以扩展。

检测现在卷组状态

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

首先，我们创建一个2GB分区sdc1，类型为LVM（8e），如教程前所述。

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

然后，我们创建一个物理卷 /dev/sdc1

    # pvcreate /dev/sdc1 

现在，物理卷已经准备好了，我们可以简单地将它增加到已存在的卷组'volume-group1'上。

    # vgextend volume-group1 /dev/sdc1 

使用vgdisplay来验证（可以看到卷组大小已经增大）。

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

注意，尽管我们使用一个单独的磁盘做示范，其实只要是‘8e’类型的磁盘分区都可以用来扩展卷组。

总结一下，LVM是一个非常给力的工具，用来创建和管理可变大小的分区。本文中，我们已经看见了动态分区如何在LVM中创建和使用。我们也看见了扩展/缩小逻辑卷和卷组的方法，和如何增加一个新的磁盘到LVM。

希望对你有帮助。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/05/use-lvm-linux.html

译者：[Vic___](http://www.vicyu.net) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
