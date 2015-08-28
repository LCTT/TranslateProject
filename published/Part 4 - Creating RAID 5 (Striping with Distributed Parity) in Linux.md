在 Linux 下使用 RAID（四）：创建 RAID 5（条带化与分布式奇偶校验）
================================================================================

在 RAID 5 中，数据条带化后存储在分布式奇偶校验的多个磁盘上。分布式奇偶校验的条带化意味着它将奇偶校验信息和条带化数据分布在多个磁盘上，这样会有很好的数据冗余。

![Setup Raid 5 in CentOS](http://www.tecmint.com/wp-content/uploads/2014/11/setup-raid-5-in-linux.jpg)

*在 Linux 中配置 RAID 5*

对于此 RAID 级别它至少应该有三个或更多个磁盘。RAID 5 通常被用于大规模生产环境中，以花费更多的成本来提供更好的数据冗余性能。

#### 什么是奇偶校验？ ####

奇偶校验是在数据存储中检测错误最简单的常见方式。奇偶校验信息存储在每个磁盘中，比如说，我们有4个磁盘，其中相当于一个磁盘大小的空间被分割去存储所有磁盘的奇偶校验信息。如果任何一个磁盘出现故障，我们可以通过更换故障磁盘后，从奇偶校验信息重建得到原来的数据。

#### RAID 5 的优点和缺点 ####

- 提供更好的性能。
- 支持冗余和容错。
- 支持热备份。
- 将用掉一个磁盘的容量存储奇偶校验信息。
- 单个磁盘发生故障后不会丢失数据。我们可以更换故障硬盘后从奇偶校验信息中重建数据。
- 适合于面向事务处理的环境，读操作会更快。
- 由于奇偶校验占用资源，写操作会慢一些。
- 重建需要很长的时间。

#### 要求 ####

创建 RAID 5 最少需要3个磁盘，你也可以添加更多的磁盘，前提是你要有多端口的专用硬件 RAID 控制器。在这里，我们使用“mdadm”包来创建软件 RAID。

mdadm 是一个允许我们在 Linux 下配置和管理 RAID 设备的包。默认情况下没有 RAID 的配置文件，我们在创建和配置 RAID 后必须将配置文件保存在一个单独的文件 mdadm.conf 中。

在进一步学习之前，我建议你通过下面的文章去了解 Linux 中 RAID 的基础知识。

- [介绍 RAID 的级别和概念][1]
- [使用 mdadm 工具创建软件 RAID 0 （条带化）][2]
- [用两块磁盘创建 RAID 1（镜像）][3]

#### 我的服务器设置 ####

    操作系统 :	CentOS 6.5 Final
    IP 地址  :	192.168.0.227
    主机名	 :	rd5.tecmintlocal.com
    磁盘 1 [20GB]	 :	/dev/sdb
    磁盘 2 [20GB]	 :	/dev/sdc
    磁盘 3 [20GB]	 :	/dev/sdd

这是9篇系列教程的第4部分，在这里我们要在 Linux 系统或服务器上使用三个20GB（名为/dev/sdb, /dev/sdc 和 /dev/sdd）的磁盘建立带有分布式奇偶校验的软件 RAID 5。

### 第1步：安装 mdadm 并检验磁盘 ###

1、 正如我们前面所说，我们使用 CentOS 6.5 Final 版本来创建 RAID 设置，但同样的做法也适用于其他 Linux 发行版。

    # lsb_release -a
    # ifconfig | grep inet

![Setup Raid 5 in CentOS](http://www.tecmint.com/wp-content/uploads/2014/11/CentOS-6.5-Summary.png)

*CentOS 6.5 摘要*

2、 如果你按照我们的 RAID 系列去配置的，我们假设你已经安装了“mdadm”包，如果没有，根据你的 Linux 发行版使用下面的命令安装。

    # yum install mdadm		[在 RedHat 系统]
    # apt-get install mdadm 	[在 Debain 系统]

3、 “mdadm”包安装后，先使用`fdisk`命令列出我们在系统上增加的三个20GB的硬盘。

    # fdisk -l | grep sd

![Install mdadm Tool in CentOS](http://www.tecmint.com/wp-content/uploads/2014/11/Install-mdadm-Tool.png)

*安装 mdadm 工具*

4、 现在该检查这三个磁盘是否存在 RAID 块，使用下面的命令来检查。

    # mdadm -E /dev/sd[b-d]
    # mdadm --examine /dev/sdb /dev/sdc /dev/sdd # 或

![Examine Drives For Raid](http://www.tecmint.com/wp-content/uploads/2014/11/Examine-Drives-For-Raid.png)

*检查 Raid 磁盘*

**注意**: 上面的图片说明，没有检测到任何超级块。所以，这三个磁盘中没有定义 RAID。让我们现在开始创建一个吧！

### 第2步：为磁盘创建 RAID 分区 ###

5、 首先，在创建 RAID 前磁盘（/dev/sdb, /dev/sdc 和 /dev/sdd）必须有分区，因此，在进行下一步之前，先使用`fdisk`命令进行分区。

    # fdisk /dev/sdb
    # fdisk /dev/sdc
    # fdisk /dev/sdd

#### 创建 /dev/sdb 分区 ####

请按照下面的说明在 /dev/sdb 硬盘上创建分区。

- 按 `n` 创建新的分区。
- 然后按 `P` 选择主分区。选择主分区是因为还没有定义过分区。
- 接下来选择分区号为1。默认就是1。
- 这里是选择柱面大小，我们没必要选择指定的大小，因为我们需要为 RAID 使用整个分区，所以只需按两次 Enter 键默认将整个容量分配给它。
- 然后，按 `P` 来打印创建好的分区。
- 改变分区类型，按 `L`可以列出所有可用的类型。
- 按 `t` 修改分区类型。
- 这里使用`fd`设置为 RAID 的类型。
- 然后再次使用`p`查看我们所做的更改。
- 使用`w`保存更改。

![Create sdb Partition](http://www.tecmint.com/wp-content/uploads/2014/11/Create-sdb-Partition1.png)

*创建 sdb 分区*

**注意**: 我们仍要按照上面的步骤来创建 sdc 和 sdd 的分区。

#### 创建 /dev/sdc 分区 ####

现在，通过下面的截图给出创建 sdc 和 sdd 磁盘分区的方法，或者你可以按照上面的步骤。

    # fdisk /dev/sdc

![Create sdc Partition](http://www.tecmint.com/wp-content/uploads/2014/11/Create-sdc-Partition1.png)

*创建 sdc 分区*

#### 创建 /dev/sdd 分区 ####

    # fdisk /dev/sdd

![Create sdd Partition](http://www.tecmint.com/wp-content/uploads/2014/11/Create-sdd-Partition1.png)

*创建 sdd 分区*

6、 创建分区后，检查三个磁盘 sdb, sdc, sdd 的变化。

    # mdadm --examine /dev/sdb /dev/sdc /dev/sdd
    # mdadm -E /dev/sd[b-c]  # 或

![Check Partition Changes](http://www.tecmint.com/wp-content/uploads/2014/11/Check-Changes-on-Partitions.png)

*检查磁盘变化*

**注意**: 在上面的图片中，磁盘的类型是 fd。

7、 现在在新创建的分区检查 RAID 块。如果没有检测到超级块，我们就能够继续下一步，在这些磁盘中创建一个新的 RAID 5 配置。

![Check Raid on Partition](http://www.tecmint.com/wp-content/uploads/2014/11/Check-Raid-on-Partitions.png)

*在分区中检查 RAID *

### 第3步：创建 md 设备 md0 ###

8、 现在使用所有新创建的分区(sdb1, sdc1 和 sdd1)创建一个 RAID 设备“md0”（即 /dev/md0），使用以下命令。

    # mdadm --create /dev/md0 --level=5 --raid-devices=3 /dev/sdb1 /dev/sdc1 /dev/sdd1
    # mdadm -C /dev/md0 -l=5 -n=3 /dev/sd[b-d]1   # 或

9、 创建 RAID 设备后，检查并确认 RAID，从 mdstat 中输出中可以看到包括的设备的 RAID 级别。

    # cat /proc/mdstat

![Verify Raid Device](http://www.tecmint.com/wp-content/uploads/2014/11/Verify-Raid-Device.png)

*验证 Raid 设备*

如果你想监视当前的创建过程，你可以使用`watch`命令，将 `cat /proc/mdstat` 传递给它，它会在屏幕上显示且每隔1秒刷新一次。

    # watch -n1 cat /proc/mdstat

![Monitor Raid Process](http://www.tecmint.com/wp-content/uploads/2014/11/Monitor-Raid-Process.png)

*监控 RAID 5 构建过程*

![Raid 5 Process Summary](http://www.tecmint.com/wp-content/uploads/2014/11/Raid-Process-Summary.png)

*Raid 5 过程概要*

10、 创建 RAID 后，使用以下命令验证 RAID 设备

    # mdadm -E /dev/sd[b-d]1

![Verify Raid Level](http://www.tecmint.com/wp-content/uploads/2014/11/Verify-Raid-Level.png)

*验证 Raid 级别*

**注意**: 因为它显示三个磁盘的信息，上述命令的输出会有点长。

11、 接下来，验证 RAID 阵列，假定包含 RAID 的设备正在运行并已经开始了重新同步。

    # mdadm --detail /dev/md0

![Verify Raid Array](http://www.tecmint.com/wp-content/uploads/2014/11/Verify-Raid-Array.png)

*验证 RAID 阵列*

### 第4步：为 md0 创建文件系统###

12、 在挂载前为“md0”设备创建 ext4 文件系统。

    # mkfs.ext4 /dev/md0

![Create md0 Filesystem](http://www.tecmint.com/wp-content/uploads/2014/11/Create-md0-Filesystem.png)

*创建 md0 文件系统*

13、 现在，在`/mnt`下创建目录 raid5，然后挂载文件系统到 /mnt/raid5/ 下，并检查挂载点下的文件，你会看到 lost+found 目录。

    # mkdir /mnt/raid5
    # mount /dev/md0 /mnt/raid5/
    # ls -l /mnt/raid5/

14、 在挂载点 /mnt/raid5 下创建几个文件，并在其中一个文件中添加一些内容然后去验证。

    # touch /mnt/raid5/raid5_tecmint_{1..5}
    # ls -l /mnt/raid5/
    # echo "tecmint raid setups" > /mnt/raid5/raid5_tecmint_1
    # cat /mnt/raid5/raid5_tecmint_1
    # cat /proc/mdstat

![Mount Raid 5 Device](http://www.tecmint.com/wp-content/uploads/2014/11/Mount-Raid-Device.png)

*挂载 RAID 设备*

15、 我们需要在 fstab 中添加条目，否则系统重启后将不会显示我们的挂载点。编辑 fstab 文件添加条目，在文件尾追加以下行。挂载点会根据你环境的不同而不同。

    # vim /etc/fstab
    
    /dev/md0                /mnt/raid5              ext4    defaults        0 0

![Raid 5 Automount](http://www.tecmint.com/wp-content/uploads/2014/11/Raid-Device-Automount.png)

*自动挂载 RAID 5*

16、 接下来，运行`mount -av`命令检查 fstab 条目中是否有错误。

    # mount -av

![Check Fstab Errors](http://www.tecmint.com/wp-content/uploads/2014/11/Check-Fstab-Errors.png)

*检查 Fstab 错误*

### 第5步：保存 Raid 5 的配置 ###

17、 在前面章节已经说过，默认情况下 RAID 没有配置文件。我们必须手动保存。如果此步中没有跟随不属于 md0 的 RAID 设备，它会是一些其他随机数字。

所以，我们必须要在系统重新启动之前保存配置。如果配置保存它在系统重新启动时会被加载到内核中然后 RAID 也将被加载。

    # mdadm --detail --scan --verbose >> /etc/mdadm.conf

![Save Raid 5 Configuration](http://www.tecmint.com/wp-content/uploads/2014/11/Save-Raid-5-Configuration.png)

*保存 RAID 5 配置*

注意：保存配置将保持 md0 设备的 RAID 级别稳定不变。

### 第6步：添加备用磁盘 ###

18、 备用磁盘有什么用？它是非常有用的，如果我们有一个备用磁盘，当我们阵列中的任何一个磁盘发生故障后，这个备用磁盘会进入激活重建过程，并从其他磁盘上同步数据，这样就有了冗余。

更多关于添加备用磁盘和检查 RAID 5 容错的指令，请阅读下面文章中的第6步和第7步。

- [在 RAID 5 中添加备用磁盘][4]

### 结论 ###

在这篇文章中，我们已经看到了如何使用三个磁盘配置一个 RAID 5 。在接下来的文章中，我们将看到如何故障排除并且当 RAID 5 中的一个磁盘损坏后如何恢复。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/create-raid-5-in-linux/

作者：[Babin Lonston][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/babinlonston/
[1]:https://linux.cn/article-6085-1.html
[2]:https://linux.cn/article-6087-1.html
[3]:https://linux.cn/article-6093-1.html
[4]:http://www.tecmint.com/create-raid-6-in-linux/
