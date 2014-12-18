迁移LVM分区到新的逻辑卷/驱动器（第六部分）
================================================================================

这是我们正在进行的LVM系列的第六部分。在本文中，我们将为大家展示怎样在线将现存的逻辑卷迁移到其它新的驱动器。在开始之前，我想要先来介绍一下LVM迁移及其特性。

![LVM Storage Migration](http://www.tecmint.com/wp-content/uploads/2014/10/LVM-Migrations.png)

*LVM存储迁移*


### 什么是LVM迁移？ ###

**LVM**迁移是LVM众多优秀特性之一，通过它，我们可以迁移逻辑卷到一个新的磁盘而不会丢失数据，也不用关机操作。该特性的功能是将数据从旧磁盘移动到新磁盘。通常，我们只是在一些磁盘发生错误时，才将数据从一个磁盘迁移到另外一个磁盘存储。

### 迁移特性 ###

- 将逻辑卷从一个磁盘移动到另一个磁盘。
- 我们可以使用任何类型的磁盘，如SATA、SSD、SAS、SAN storage iSCSI或者FC。
- 在线迁移磁盘，而且数据不会丢失。

在LVM迁移中，我们将交换各个卷、文件系统以及位于已有的存储中的数据。例如，如果我们有一个单一逻辑卷，它已经映射到了物理卷，而该物理卷是一个物理硬盘驱动器。

现在，如果我们需要升级服务器存储为SSD硬盘驱动器，我们首先需要考虑什么？重新格式化磁盘？不！我们不必重新格式化服务器，LVM可以选择将这些旧的SATA驱动器上的数据迁移到新的SSD驱动器上。在线迁移将会支持任何类型的磁盘，不管是本地驱动器，还是SAN或者光纤通道都可以。

#### 我的服务器设置 ####

    操作系统：	 CentOS 6.5 Final
    IP地址：	  192.168.0.224
    系统主机名：	lvmmig.tecmintlocal.com

### 步骤1： 检查当前驱动器 ###

**1.**假设我们已经有一个名为“**vdb**”的虚拟驱动器，它已经被映射到了其中一个逻辑卷“**tecmint_lv**”。现在，我们想要迁移“**vdb**”这个逻辑卷到其它某个新的存储设备中。在开始之前，首先在下面所示的**fdisk**和lvs命令的帮助下验证该虚拟驱动器。

    # fdisk -l | grep vd
    # lvs

![Check Logical Volume Disk](http://www.tecmint.com/wp-content/uploads/2014/10/Check-Logical-Volume-Disk.png)

*检查逻辑卷磁盘*

### 步骤2： 检查新添加的驱动器 ###

**2.**在我们确认了现存驱动器后，现在是时候来将新的SSD驱动器连接到系统并在fdisk命令的帮助下验证新添加的驱动器了。

    # fdisk -l | grep dev

![Check New Added Drive](http://www.tecmint.com/wp-content/uploads/2014/10/Check-New-Added-Drive.png)

*检查新添加的驱动器*

**注意**：你看到上面屏幕中的内容了吗？新的驱动器已经被成功添加了，其名称为“**/dev/sda**”。

### 步骤3： 检查当前逻辑和物理卷 ###

**3.**现在，让我们开始创建物理卷、卷组和逻辑卷以用于迁移。在创建卷时，确保检查**/mnt/lvm**挂载点下的当前逻辑卷的数据。用以下命令来列出挂载点并检查数据。

    # df -h
    # cd /mnt/lvm
    # cat tecmint.txt

![Check Logical Volume Data](http://www.tecmint.com/wp-content/uploads/2014/10/Check-Logical-Volume-Data.png)

*检查逻辑卷数据*

**注意**：出于演示的目的，我们已经在**/mnt/lvm**挂载点下创建了两个文件，我们将在线将这些数据迁移到新的驱动器中。

**4.**在迁移之前，确保对确认与物理卷相关的逻辑卷和卷组名称，并且确认哪个物理卷用于容纳该卷组和逻辑卷。

    # lvs
    # vgs -o+devices | grep tecmint_vg

![Confirm Logical Volume Names](http://www.tecmint.com/wp-content/uploads/2014/10/Confirm-Logical-Volume-Names.png)

*确认逻辑卷名称*

**注意**：看到上面屏幕中的内容了吗？“**vdb**”容纳了卷组**tecmint_vg**。

### 步骤4： 创建新物理卷 ###

**5.**在在我们新添加的SSD驱动器中创建物理卷之前，我们需要使用fdisk来定义分区。在创建分区时，别忘了修改分区类型为LVM（8e）。

    # pvcreate /dev/sda1 -v
    # pvs

![Create Physical Volume](http://www.tecmint.com/wp-content/uploads/2014/10/Create-Physical-Volume.png)

*创建物理卷*

**6.**接下来，使用‘vgextend命令’来添加新创建的物理卷到现存卷组tecmint_vg。

    # vgextend tecmint_vg /dev/sda1
    # vgs

![Add Physical Volume](http://www.tecmint.com/wp-content/uploads/2014/10/Add-Physical-Volume.png)

*添加物理卷*

**7.**要获得卷组的完整信息列表，请使用‘vgdisplay’命令。

    # vgdisplay tecmint_vg -v

![List Volume Group Info](http://www.tecmint.com/wp-content/uploads/2014/10/List-Volume-Group-Info.png)

*列出卷组信息*

**注意**：在上面屏幕中，我们可以看到在输出结果的结束处，我们的PV已经添加到了卷组中。

**8.**如果我们需要知道更多关于哪些设备被映射的信息，请使用‘**dmsetup**’依赖命令。

    # lvs -o+devices
    # dmsetup deps /dev/tecmint_vg/tecmint_lv

在上面的结果中，有个**1个**依赖（PV）或（驱动器），而这里**17**被列出了。如果你想要检查设备，那些关联的有着主、次设备号的驱动器，以确认，使用下面的命令。

    # ls -l /dev | grep vd

![List Device Information](http://www.tecmint.com/wp-content/uploads/2014/10/List-Device-Information.png)

*列出设备信息*

**注意**：在上面的命令中，我们可以看到主设备号是**252**，次设备号是**17**，它连接到了**vdb1**。希望你理解了上面命令的输出。

### 步骤5： LVM镜像法 ###

**9.**现在，该使用镜像法来进行迁移了。使用‘**lvconvert**’命令来将数据从旧逻辑卷迁移到新驱动器。

    # lvconvert -m 1 /dev/tecmint_vg/tecmint_lv /dev/sda1

- **-m** = 镜像
- **1** = 添加单个镜像

![Mirroring Method Migration](http://www.tecmint.com/wp-content/uploads/2014/10/Mirroring-Method-Migration.png)

*镜像法迁移*

**注意**：上面的迁移过程根据卷的大小会花费一段时间。

**10.**在迁移过程完成后，验证转换的镜像。

    # lvs -o+devices

![Verify Converted Mirror](http://www.tecmint.com/wp-content/uploads/2014/10/Verify-Converted-Mirror.png)

*验证转换的镜像*

**11.**当你确认转换的镜像没有任何问题后，你可以移除旧的虚拟磁盘**vdb1**。**-m**选项将移除镜像，先前我们使用**l**来添加镜像。

    # lvconvert -m 0 /dev/tecmint_vg/tecmint_lv /dev/vdb1

![Remove Virtual Disk](http://www.tecmint.com/wp-content/uploads/2014/10/Remove-Virtual-Disk.png)

*移除虚拟磁盘*

**12.**在旧虚拟磁盘移除后，你可以使用以下命令来再次检查逻辑卷设备。

    # lvs -o+devices
    # dmsetup deps /dev/tecmint_vg/tecmint_lv
    # ls -l /dev | grep sd

![Check New Mirrored Device](http://www.tecmint.com/wp-content/uploads/2014/10/Check-New-Mirrored-Device.png)

*检查新镜像的设备*

在上面的图片中，你看到了吗？我们的逻辑卷现在依赖于**8,1**，名称为**sda1**。这说明我们的迁移过程已经完成了。

**13.**现在验证我们从旧驱动器上迁移过来的文件。如果在新驱动器中的数据与原数据一样，那就说明我们每一步都完成得很完美。

    # cd /mnt/lvm/
    # cat tecmin.txt 

![Check Mirrored Data](http://www.tecmint.com/wp-content/uploads/2014/10/Check-Mirrored-Data.png)

*检查镜像的数据*


    # vgreduce /dev/tecmint_vg /dev/vdb1
    # vgs -o+devices

**14.**在所有的都被完美创建后，现在该从卷组中删除**vdb1**并进行再次确认，哪些设备依赖于我们的卷组。

**15.**在从卷组**tecmint_vg**移除vdb1后，我们的逻辑卷还在那儿，因为我们已经将它从**vdb1**迁移到了**sda1**。

    # lvs

![Delete Virtual Disk](http://www.tecmint.com/wp-content/uploads/2014/10/Delete-Virtual-Disk.png)

*删除虚拟磁盘*

### 步骤6： LVM pvmove镜像法 ###

**16.**我们可以使用带有‘**-n**’（逻辑卷名称）选项的‘**pvmove**’命令来取代‘**lvconvert**’镜像命令，在两个设备间进行数据镜像。

    # pvmove -n /dev/tecmint_vg/tecmint_lv /dev/vdb1 /dev/sda1

该命令是在两个设备间镜像数据的最简单的一个，但是在真实环境中，**镜像**比**pvmove**使用得更为频繁。

### 结尾 ###

在本文中，我们介绍了怎样将逻辑卷从一个驱动器迁移到另一个驱动器。希望你已经掌握了逻辑卷管理中这一新的技巧。对于该配置，必须建立在掌握逻辑卷管理基础技能的基础上。对于基础配置，请参阅本文顶部需求章节中提供的链接。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/lvm-storage-migration/#comment-331336

作者：[Babin Lonston][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/babinlonston/
