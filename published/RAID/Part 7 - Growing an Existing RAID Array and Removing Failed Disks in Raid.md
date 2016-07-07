在 Linux 下使用 RAID（七）：在 Raid 中扩展现有的 RAID 阵列和删除故障的磁盘
================================================================================

每个新手都会对阵列（array）这个词所代表的意思产生疑惑。阵列只是磁盘的一个集合。换句话说，我们可以称阵列为一个集合（set）或一组（group）。就像一组鸡蛋中包含6个一样。同样 RAID 阵列中包含着多个磁盘，可能是2，4，6，8，12，16等，希望你现在知道了什么是阵列。

在这里，我们将看到如何扩展现有的阵列或 RAID 组。例如，如果我们在阵列中使用2个磁盘形成一个 raid 1 集合，在某些情况，如果该组中需要更多的空间，就可以使用 mdadm -grow 命令来扩展阵列大小，只需要将一个磁盘加入到现有的阵列中即可。在说完扩展（添加磁盘到现有的阵列中）后，我们将看看如何从阵列中删除故障的磁盘。

![Grow Raid Array in Linux](http://www.tecmint.com/wp-content/uploads/2014/11/Growing-Raid-Array.jpg)

*扩展 RAID 阵列和删除故障的磁盘*

假设磁盘中的一个有问题了需要删除该磁盘，但我们需要在删除磁盘前添加一个备用磁盘来扩展该镜像，因为我们需要保存我们的数据。当磁盘发生故障时我们需要从阵列中删除它，这是这个主题中我们将要学习到的。

#### 扩展 RAID 的特性 ####

- 我们可以增加（扩展）任意 RAID 集合的大小。
- 我们可以在使用新磁盘扩展 RAID 阵列后删除故障的磁盘。
- 我们可以扩展 RAID 阵列而无需停机。

####要求 ####

- 为了扩展一个RAID阵列，我们需要一个已有的 RAID 组（阵列）。
- 我们需要额外的磁盘来扩展阵列。
- 在这里，我们使用一块磁盘来扩展现有的阵列。

在我们了解扩展和恢复阵列前，我们必须了解有关 RAID 级别和设置的基本知识。点击下面的链接了解这些。

- [介绍 RAID 的级别和概念][1]
- [使用 mdadm 工具创建软件 RAID 0 （条带化）][2]

#### 我的服务器设置 ####

    操作系统 	:	CentOS 6.5 Final
     IP地址	 	:	192.168.0.230
     主机名		:	grow.tecmintlocal.com
    2 块现有磁盘 	:	1 GB
    1 块额外磁盘	:	1 GB

在这里，我们已有一个 RAID ，有2块磁盘，每个大小为1GB，我们现在再增加一个磁盘到我们现有的 RAID 阵列中，其大小为1GB。

### 扩展现有的 RAID 阵列 ###

1、 在扩展阵列前，首先使用下面的命令列出现有的 RAID 阵列。

    # mdadm --detail /dev/md0

![Check Existing Raid Array](http://www.tecmint.com/wp-content/uploads/2014/11/Check-Existing-Raid-Array.png)

*检查现有的 RAID 阵列*

**注意**: 以上输出显示，已经有了两个磁盘在 RAID 阵列中，级别为 RAID 1。现在我们增加一个磁盘到现有的阵列里。

2、 现在让我们添加新的磁盘“sdd”，并使用`fdisk`命令来创建分区。

    # fdisk /dev/sdd

请使用以下步骤为 /dev/sdd 创建一个新的分区。

- 按 `n` 创建新的分区。
- 然后按 `P` 选择主分区。
- 接下来选择分区号为1。
- 只需按两次回车键选择默认值即可。
- 然后，按 `P` 来打印创建好的分区。
- 按 `L`，列出所有可用的类型。
- 按 `t` 去修改分区。
- 键入 `fd` 设置为 Linux 的 RAID 类型，然后按回车确认。
- 然后再次使用`p`查看我们所做的更改。
- 使用`w`保存更改。

![Create New Partition in Linux](http://www.tecmint.com/wp-content/uploads/2014/11/Create-New-sdd-Partition.png)

*为 sdd 创建新的分区*

3、 一旦新的 sdd 分区创建完成后，你可以使用下面的命令验证它。

    # ls -l /dev/ | grep sd

![Confirm sdd Partition](http://www.tecmint.com/wp-content/uploads/2014/11/Confirm-sdd-Partition.png)

*确认 sdd 分区*

4、 接下来，在添加到阵列前先检查磁盘是否有 RAID 分区。

    # mdadm --examine /dev/sdd1

![Check Raid on sdd Partition](http://www.tecmint.com/wp-content/uploads/2014/11/Check-Raid-on-sdd-Partition.png)

*在 sdd 分区中检查 RAID*

**注意**:以上输出显示，该盘有没有发现 super-blocks，意味着我们可以将新的磁盘添加到现有阵列。

5、 要添加新的分区 /dev/sdd1 到现有的阵列 md0，请使用以下命令。

    # mdadm --manage /dev/md0 --add /dev/sdd1

![Add Disk To Raid-Array](http://www.tecmint.com/wp-content/uploads/2014/11/Add-Disk-To-Raid-Array.png)

*添加磁盘到 RAID 阵列*

6、 一旦新的磁盘被添加后，在我们的阵列中检查新添加的磁盘。

    # mdadm --detail /dev/md0

![Confirm Disk Added to Raid](http://www.tecmint.com/wp-content/uploads/2014/11/Confirm-Disk-Added-To-Raid.png)

*确认将新磁盘添加到 RAID 中*

**注意**: 在上面的输出，你可以看到磁盘已经被添加作为备用的。在这里，我们的阵列中已经有了2个磁盘，但我们期待阵列中有3个磁盘，因此我们需要扩展阵列。

7、 要扩展阵列，我们需要使用下面的命令。

    # mdadm --grow --raid-devices=3 /dev/md0

![Grow Raid Array](http://www.tecmint.com/wp-content/uploads/2014/11/Grow-Raid-Array.png)

*扩展 Raid 阵列*

现在我们可以看到第三块磁盘(sdd1)已被添加到阵列中，在第三块磁盘被添加后，它将从另外两块磁盘上同步数据。

    # mdadm --detail /dev/md0

![Confirm Raid Array](http://www.tecmint.com/wp-content/uploads/2014/11/Confirm-Raid-Array.png)

*确认 Raid 阵列*

**注意**: 对于大容量磁盘会需要几个小时来同步数据。在这里，我们使用的是1GB的虚拟磁盘，所以它非常快在几秒钟内便会完成。

### 从阵列中删除磁盘 ###

8、 在数据被从其他两个磁盘同步到新磁盘`sdd1`后，现在三个磁盘中的数据已经相同了（镜像）。

正如我前面所说的，假定一个磁盘出问题了需要被删除。所以，现在假设磁盘`sdc1`出问题了，需要从现有阵列中删除。

在删除磁盘前我们要将其标记为失效，然后我们才可以将其删除。

    # mdadm --fail /dev/md0 /dev/sdc1
    # mdadm --detail /dev/md0

![Disk Fail in Raid Array](http://www.tecmint.com/wp-content/uploads/2014/11/Disk-Fail-in-Raid-Array.png)

*在 RAID 阵列中模拟磁盘故障*

从上面的输出中，我们清楚地看到，磁盘在下面被标记为 faulty。即使它是 faulty 的，我们仍然可以看到 raid 设备有3个，1个损坏了，状态是 degraded。

现在我们要从阵列中删除 faulty 的磁盘，raid 设备将像之前一样继续有2个设备。

    # mdadm --remove /dev/md0 /dev/sdc1

![Remove Disk in Raid Array](http://www.tecmint.com/wp-content/uploads/2014/11/Remove-Disk-in-Raid-Array.png)

*在 Raid 阵列中删除磁盘*

9、 一旦故障的磁盘被删除，然后我们只能使用2个磁盘来扩展 raid 阵列了。

    # mdadm --grow --raid-devices=2 /dev/md0
    # mdadm --detail /dev/md0

![Grow Disks in Raid Array](http://www.tecmint.com/wp-content/uploads/2014/11/Grow-Disks-in-Raid-Array.png)

*在 RAID 阵列扩展磁盘*

从上面的输出中可以看到，我们的阵列中仅有2台设备。如果你需要再次扩展阵列，按照如上所述的同样步骤进行。如果你需要添加一个磁盘作为备用，将其标记为 spare，因此，如果磁盘出现故障时，它会自动顶上去并重建数据。

### 结论 ###

在这篇文章中，我们已经看到了如何扩展现有的 RAID 集合，以及如何在重新同步已有磁盘的数据后从一个阵列中删除故障磁盘。所有这些步骤都可以不用停机来完成。在数据同步期间，系统用户，文件和应用程序不会受到任何影响。

在接下来的文章我将告诉你如何管理 RAID，敬请关注更新，不要忘了写评论。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/grow-raid-array-in-linux/

作者：[Babin Lonston][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/babinlonston/
[1]:https://linux.cn/article-6085-1.html
[2]:https://linux.cn/article-6087-1.html
