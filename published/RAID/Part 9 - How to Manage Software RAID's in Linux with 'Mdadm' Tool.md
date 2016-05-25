在 Linux 下使用 RAID（九）：如何使用 ‘Mdadm’ 工具管理软件 RAID
================================================================================

无论你以前有没有使用 RAID 阵列的经验，以及是否完成了 [此 RAID 系列][1] 的所有教程，一旦你在 Linux 中熟悉了 `mdadm --manage` 命令的使用，管理软件 RAID 将不是很复杂的任务。

![在 Linux 中使用 mdadm 管理 RAID 设备 - 第9部分](http://www.tecmint.com/wp-content/uploads/2015/10/Manage-Raid-with-Mdadm-Tool-in-Linux.jpg)

*在 Linux 中使用 mdadm 管理 RAID 设备 - 第9部分*

在本教程中，我们会再介绍此工具提供的功能，这样当你需要它，就可以派上用场。

#### RAID 测试方案 ####

在本系列的最后一篇文章中，我们将使用一个简单的 RAID 1（镜像）阵列，它由两个 8GB 的磁盘（/dev/sdb 和 /dev/sdc）和一个备用设备（/dev/sdd）来演示，但在此使用的方法也适用于其他类型的配置。也就是说，放心去用吧，把这个页面添加到浏览器的书签，然后让我们开始吧。

### 了解 mdadm 的选项和使用方法 ###

幸运的是，mdadm 有一个内建的 `--help` 参数来对每个主要的选项提供说明文档。

因此，让我们开始输入：

    # mdadm --manage --help

就会使我们看到 `mdadm --manage` 能够执行哪些任务：

![Manage RAID with mdadm Tool](http://www.tecmint.com/wp-content/uploads/2015/10/mdadm-Usage-in-Linux.png)

*使用 mdadm 工具来管理 RAID*

正如我们在上面的图片看到，管理一个 RAID 阵列可以在任意时间执行以下任务：

- （重新）将设备添加到阵列中
- 把设备标记为故障
- 从阵列中删除故障设备
- 使用备用设备更换故障设备
- 先创建部分阵列
- 停止阵列
- 标记阵列为 ro（只读）或 rw（读写）

### 使用 mdadm 工具管理 RAID 设备 ###

需要注意的是，如果用户忽略 `--manage` 选项，mdadm 默认使用管理模式。请记住这一点，以避免出现最坏的情况。

上图中的高亮文本显示了管理 RAID 的基本语法：

    # mdadm --manage RAID options devices

让我们来演示几个例子。

#### ​例1：为 RAID 阵列添加设备 ####

你通常会添加新设备来更换故障的设备，或者使用空闲的分区以便在出现故障时能及时替换：

    # mdadm --manage /dev/md0 --add /dev/sdd1

![Add Device to Raid Array](http://www.tecmint.com/wp-content/uploads/2015/10/Add-Device-to-Raid-Array.png)

*添加设备到 Raid 阵列*

#### ​例2：把一个 RAID 设备标记为故障并从阵列中移除 ####

在从逻辑阵列中删除该设备前，这是强制性的步骤，然后才能从机器中取出它 - 注意顺序（如果弄错了这些步骤，最终可能会造成实际设备的损害）：

    # mdadm --manage /dev/md0 --fail /dev/sdb1

请注意在前面的例子中，知道如何添加备用设备来自动更换出现故障的磁盘。在此之后，[恢复和重建 raid 数据][2] 就开始了：

![Recover and Rebuild Raid Data](http://www.tecmint.com/wp-content/uploads/2015/10/Recover-and-Rebuild-Raid-Data.png)

*恢复和重建 raid 数据*

一旦设备已被手动标记为故障，你就可以安全地从阵列中删除它：

    # mdadm --manage /dev/md0 --remove /dev/sdb1

#### 例3：重新添加设备，来替代阵列中已经移除的设备 ####

到现在为止，我们有一个工作的 RAID 1 阵列，它包含了2个活动的设备：/dev/sdc1 和 /dev/sdd1。现在让我们试试重新添加 /dev/sdb1 到/dev/md0：

    # mdadm --manage /dev/md0 --re-add /dev/sdb1

我们会碰到一个错误:

	# mdadm: --re-add for /dev/sdb1 to /dev/md0 is not possible

因为阵列中的磁盘已经达到了最大的数量。因此，我们有两个选择：a）将 /dev/sdb1 添加为备用的，如例1；或 b）从阵列中删除 /dev/sdd1 然后重新添加 /dev/sdb1。

我们选择选项 b），先停止阵列然后重新启动：

    # mdadm --stop /dev/md0
    # mdadm --assemble /dev/md0 /dev/sdb1 /dev/sdc1

如果上面的命令不能成功添加 /dev/sdb1 到阵列中，使用例1中的命令来完成。

mdadm 能检测到新添加的设备并将其作为备用设备，当添加完成后它会开始重建数据，它也被认为是 RAID 中的活动设备：

![Raid Rebuild Status](http://www.tecmint.com/wp-content/uploads/2015/10/Raid-Rebuild-Status.png)

*重建 Raid 的状态*

#### 例4：使用特定磁盘更换 RAID 设备 ####

在阵列中使用备用磁盘更换磁盘很简单：

    # mdadm --manage /dev/md0 --replace /dev/sdb1 --with /dev/sdd1

![Replace Raid Device](http://www.tecmint.com/wp-content/uploads/2015/10/Replace-Raid-device.png)

*更换 Raid 设备*

这会导致 `--replace` 指定的设备被标记为故障，而 `--with`指定的设备添加到 RAID 中来替代它：

![Check Raid Rebuild Status](http://www.tecmint.com/wp-content/uploads/2015/10/Check-Raid-Rebuild-Status.png)

*检查 Raid 重建状态*

#### ​例5：标记 RAID 阵列为 ro 或 rw ####

创建阵列后，你必须在它上面创建一个文件系统并将其挂载到一个目录下才能使用它。你可能不知道，RAID 也可以被设置为 ro，使其只读；或者设置为 rw，就可以同时写入了。

要标记该设备为 ro，首先需要将其卸载：

    # umount /mnt/raid1
    # mdadm --manage /dev/md0 --readonly
    # mount /mnt/raid1
    # touch /mnt/raid1/test1

![Set Permissions on Raid Array](http://www.tecmint.com/wp-content/uploads/2015/10/Set-Permissions-on-Raid-Array.png)

*在 RAID 阵列上设置权限*

要配置阵列允许写入操作需要使用 `--readwrite` 选项。请注意，在设置 rw 标志前，你需要先卸载设备并停止它：

    # umount /mnt/raid1
    # mdadm --manage /dev/md0 --stop
    # mdadm --assemble /dev/md0 /dev/sdc1 /dev/sdd1
    # mdadm --manage /dev/md0 --readwrite
    # touch /mnt/raid1/test2

![Allow Read Write Permission on Raid](http://www.tecmint.com/wp-content/uploads/2015/10/Allow-Write-Permission-on-Raid.png)

*配置 Raid 允许读写操作*

### 总结 ###

在本系列中，我们已经解释了如何建立一个在企业环境中使用的软件 RAID 阵列。如果你按照这些文章所提供的例子进行配置，在 Linux 中你会充分领会到软件 RAID 的价值。

如果你碰巧任何问题或有建议，请随时使用下面的方式与我们联系。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/manage-software-raid-devices-in-linux-with-mdadm/

作者：[GABRIEL CÁNEPA][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:https://linux.cn/article-6085-1.html
[2]:https://linux.cn/article-6448-1.html
