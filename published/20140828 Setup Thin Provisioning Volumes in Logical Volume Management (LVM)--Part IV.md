在LVM中设置精简资源调配卷（第四部分）
================================================================================
逻辑卷管理有许多特性，比如像快照和精简资源调配。在先前（[第三部分][3]中），我们已经介绍了如何为逻辑卷创建快照。在本文中，我们将了解如何在LVM中设置精简资源调配。

![Setup Thin Provisioning in LVM](http://www.tecmint.com/wp-content/uploads/2014/08/Setup-Thin-Provisioning-in-LVM.jpg)

*在LVM中设置精简资源调配*

### 精简资源调配是什么？ ###

精简资源调配用于LVM以在精简池中创建虚拟磁盘。我们假定我服务器上有**15GB**的存储容量，而我已经有2个客户各自占去了5GB存储空间。你是第三个客户，你也请求5GB的存储空间。在以前，我们会提供整个5GB的空间（富卷）。然而，你可能只使用5GB中的2GB，其它3GB以后再去填满它。

而在精简资源调配中我们所做的是，在其中一个大卷组中定义一个精简池，再在精简池中定义一个精简卷。这样，不管你写入什么文件，它都会保存进去，而你的存储空间看上去就是5GB。然而，这所有5GB空间不会全部铺满整个硬盘。对其它客户也进行同样的操作，就像我说的，那儿已经有两个客户，你是第三个客户。

那么，让我们想想，我到底为客户分配了总计多少GB的空间呢？所有15GB的空间已经全部分配完了，如果现在有某个人来问我是否能提供5GB空间，我还可以分配给他么？答案是“可以”。在精简资源调配中，我可以为第四位客户分配5GB空间，即使我已经把那15GB的空间分配完了。

**警告**：从那15GB空间中，如果我们对资源调配超过15GB了，那就是过度资源调配了。

### 它是怎么工作的？我们又是怎样为客户提供存储空间的？ ###

我已经提供给你5GB空间，但是你可能只用了2GB，而其它3GB还空闲着。在富资源调配中，我们不能这么做，因为它一开始就分配了整个空间。

在精简资源调配中，如果我为你定义了5GB空间，它就不会在定义卷时就将整个磁盘空间全部分配，它会根据你的数据写入而增长，希望你看懂了！跟你一样，其它客户也不会使用全部卷，所以还是有机会为一个新客户分配5GB空间的，这称之为过度资源调配。

但是，必须对各个卷的增长情况进行监控，否则结局会是个灾难。在过度资源调配完成后，如果所有4个客户都尽量写入数据到磁盘，你将碰到问题了。因为这个动作会填满15GB的存储空间，甚至溢出，从而导致这些卷下线。

### 前置阅读 ###

- [在Linux中使用LVM构建灵活的磁盘存储（第一部分）][1]
- [在Linux中扩展/缩减LVM（第二部分）][2]
- [在 LVM中 录制逻辑卷快照并恢复（第三部分）][3]

#### 我的服务器设置 ####

    操作系统 — 安装有LVM的CentOS 6.5
    服务器IP — 192.168.0.200

### 步骤1： 设置精简池和卷 ###

理论讲太多了，让我们还是来点实际的吧，我们一起来设置精简池和精简卷。首先，我们需要一个大尺寸的卷组。这里，我创建了一个**15GB**的卷组用于演示。现在，用下面的命令来列出卷组。

    # vgcreate -s 32M vg_thin /dev/sdb1

![Listing Volume Group](http://www.tecmint.com/wp-content/uploads/2014/08/Listing-Volume-Group.jpg)

*列出卷组*

接下来，在创建精简池和精简卷之前，检查逻辑卷有多少空间可用。

    # vgs
    # lvs

![Check Logical Volume](http://www.tecmint.com/wp-content/uploads/2014/08/check-Logical-Volume.jpg)

*检查逻辑卷*

我们可以在上面的lvs命令输出中看到，只显示了一些默认逻辑用于文件系统和交换分区。

### 创建精简池 ###

使用以下命令在卷组（vg_thin）中创建一个15GB的精简池。

    # lvcreate -L 15G --thinpool tp_tecmint_pool vg_thin

- **-L** – 卷组大小
- **–thinpool** – 创建精简池
- **tp\_tecmint\_poolThin** - 精简池名称
- **vg\_thin** – 我们需要创建精简池的卷组名称

![Create Thin Pool](http://www.tecmint.com/wp-content/uploads/2014/08/Create-Thin-Pool.jpg)

*创建精简池*

使用‘lvdisplay’命令来查看详细信息。

    # lvdisplay vg_thin/tp_tecmint_pool

![Logical Volume Information](http://www.tecmint.com/wp-content/uploads/2014/08/Logical-Volume-Information.jpg)

*逻辑卷信息*

这里，我们还没有在该精简池中创建虚拟精简卷。在图片中，我们可以看到分配的精简池数据为**0.00%**。

### 创建精简卷 ###

现在，我们可以在带有-V（Virtual）选项的‘lvcreate’命令的帮助下，在精简池中定义精简卷了。

    # lvcreate -V 5G --thin -n thin_vol_client1 vg_thin/tp_tecmint_pool

我已经在我的**vg_thin**卷组中的**tp\_tecmint\_pool**内创建了一个精简虚拟卷，取名为**thin\_vol\_client1**。现在，使用下面的命令来列出逻辑卷。

    # lvs 

![List Logical Volumes](http://www.tecmint.com/wp-content/uploads/2014/08/List-Logical-Volumes.jpg)

*列出逻辑卷*

刚才，我们已经在上面创建了精简卷，这就是为什么没有数据，显示为**0.00%M**。

好吧，让我为其它2个客户再创建2个精简卷。这里，你可以看到在精简池（**tp\_tecmint\_pool**）下有3个精简卷了。所以，从这一点上看，我们开始明白，我已经使用所有15GB的精简池。

![Create Thin Volumes](http://www.tecmint.com/wp-content/uploads/2014/08/Create-Thin-Volumes.jpg)

### 创建文件系统 ###

现在，使用下面的命令为这3个精简卷创建挂载点并挂载，然后拷贝一些文件进去。

    # mkdir -p /mnt/client1 /mnt/client2 /mnt/client3

列出创建的目录。

    # ls -l /mnt/

![Creating Mount Points](http://www.tecmint.com/wp-content/uploads/2014/08/Creating-Mount-Points.jpg)

*创建挂载点*

使用‘mkfs’命令为这些创建的精简卷创建文件系统。

    # mkfs.ext4 /dev/vg_thin/thin_vol_client1 && mkfs.ext4 /dev/vg_thin/thin_vol_client2 && mkfs.ext4 /dev/vg_thin/thin_vol_client3

![Create File System](http://www.tecmint.com/wp-content/uploads/2014/08/Create-File-System.jpg)

*创建文件系统*

使用‘mount’命令来挂载所有3个客户卷到创建的挂载点。

    # mount /dev/vg_thin/thin_vol_client1 /mnt/client1/ && mount /dev/vg_thin/thin_vol_client2 /mnt/client2/ && mount /dev/vg_thin/thin_vol_client3 /mnt/client3/

使用‘df’命令来列出挂载点。

    # df -h

![Print Mount Points](http://www.tecmint.com/wp-content/uploads/2014/08/Print-Mount-Points.jpg)

*显示挂载点*

这里，我们可以看到所有3个客户卷已经挂载了，而每个客户卷只使用了3%的数据空间。那么，让我们从桌面添加一些文件到这3个挂载点，以填充一些空间。

![Add Files To Volumes](http://www.tecmint.com/wp-content/uploads/2014/08/Add-Files-To-Volumes.jpg)

*添加文件到卷*

现在列出挂载点，并查看每个精简卷使用的空间，然后列出精简池来查看池中已使用的大小。

    # df -h
    # lvdisplay vg_thin/tp_tecmint_pool

![Check Mount Point Size](http://www.tecmint.com/wp-content/uploads/2014/08/Check-Mount-Point-Size.jpg)

*检查挂载点大小*

![Check Thin Pool Size](http://www.tecmint.com/wp-content/uploads/2014/08/Check-Thin-Pool-Size.jpg)

*检查精简池大小*

上面的命令显示了3个挂载点及其使用大小百分比。

    13% of datas used out of 5GB for client1
    29% of datas used out of 5GB for client2
    49% of datas used out of 5GB for client3

在查看精简池时，我们看到总共只有**30%**的数据被写入，这是上面3个客户虚拟卷的总使用量。

### 过度资源调配 ###

现在，**第四个**客户来申请5GB的存储空间。我能给他吗？因为我已经把15GB的池分配给了3个客户。能不能再给另外一个客户分配5GB的空间呢？可以，这完全可能。在我们使用**过度资源调配**时，就可以实现。过度资源调配可以给我们比我们所拥有的更大的空间。

让我来为第四位客户创建5GB的空间，然后再验证一下大小吧。

    # lvcreate -V 5G --thin -n thin_vol_client4 vg_thin/tp_tecmint_pool
    # lvs

![Create thin Storage](http://www.tecmint.com/wp-content/uploads/2014/08/Create-thin-Storage.jpg)

*创建精简存储*

在精简池中，我只有15GB大小的空间，但是我已经在精简池中创建了4个卷，其总量达到了20GB。如果4个客户都开始写入数据到他们的卷，并将空间填满，到那时我们将面对严峻的形势。如果不填满空间，那不会有问题。

现在，我已经创建在**thin\_vol\_client4**中创建了文件系统，然后挂载到了**/mnt/client4**下，并且拷贝了一些文件到里头。

    # lvs

![Verify Thin Storage](http://www.tecmint.com/wp-content/uploads/2014/08/Verify-Thing-Storage.jpg)

*验证精简存储*

我们可以在上面的图片中看到，新创建的client 4总计使用空间达到了**89.34%**，而精简池的已用空间达到了**59.19**。如果所有这些用户不再过度对卷写入，那么它就不会溢出，下线。要避免溢出的话，我们需要扩展精简池大小。

**重要**：精简池只是一个逻辑卷，因此，如果我们需要对其进行扩展，我们可以使用和扩展逻辑卷一样的命令，但我们不能缩减精简池大小。

    # lvextend

这里，我们可以看到怎样来扩展逻辑精简池（**tp_tecmint_pool**）。

    # lvextend -L +15G /dev/vg_thin/tp_tecmint_pool

![Extend Thin Storage](http://www.tecmint.com/wp-content/uploads/2014/08/Extend-Thin-Storage.jpg)

*扩展精简存储*

接下来，列出精简池大小。

    # lvs

![Verify Thin Storage](http://www.tecmint.com/wp-content/uploads/2014/08/Verify-Thin-Storage.jpg)

*验证精简存储*

前面，我们的**tp_tecmint_pool**大小为15GB，而在对第四个精简卷进行过度资源配置后达到了20GB。现在，它扩展到了30GB，所以我们的过度资源配置又回归常态，而精简卷也不会溢出下线了。通过这种方式，我们可以添加更多的精简卷到精简池中。

在本文中，我们已经了解了怎样来使用一个大尺寸的卷组创建一个精简池，以及怎样通过过度资源配置在精简池中创建精简卷和扩着精简池。在下一篇文章中，我们将介绍怎样来移除逻辑卷。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/setup-thin-provisioning-volumes-in-lvm/

作者：[Babin Lonston][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/babinlonston/
[1]:http://linux.cn/article-3965-1.html
[2]:http://linux.cn/article-3974-1.html
[3]:http://linux.cn/article-4145-1.html
