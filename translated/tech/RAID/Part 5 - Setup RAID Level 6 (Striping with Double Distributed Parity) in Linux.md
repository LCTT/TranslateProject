
在 Linux 中安装 RAID 6（条带化双分布式奇偶校验） - 第5部分
================================================================================
RAID 6 是 RAID 5 的升级版，它有两个分布式奇偶校验，即时两个磁盘发生故障后依然有容错能力。两并列的磁盘发生故障时，系统的关键任务仍然能运行。它与 RAID 5 相似，但性能更健壮，因为它多用了一个磁盘来进行奇偶校验。

在之前的文章中，我们已经在 RAID 5 看了分布式奇偶校验，但在本文中，我们将看到的是 RAID 6 双分布式奇偶校验。不要期望比其他 RAID 有额外的性能，我们仍然需要安装一个专用的 RAID 控制器。在 RAID 6 中，即使我们失去了2个磁盘，我们仍可以取回数据通过更换磁盘，然后从校验中构建数据。

![Setup RAID 6 in CentOS](http://www.tecmint.com/wp-content/uploads/2014/11/Setup-RAID-6-in-Linux.jpg)

在 Linux 中安装 RAID 6 

要建立一个 RAID 6，一组最少需要4个磁盘。RAID 6 甚至在有些设定中会有多组磁盘，当读取数据时，它会同时从所有磁盘读取，所以读取速度会更快，当写数据时，因为它要将数据写在条带化的多个磁盘上，所以性能会较差。 

现在，很多人都在讨论为什么我们需要使用 RAID 6，它的性能和其他 RAID 相比并不太好。提出这个问题首先需要知道的是，如果需要高容错的必须选择 RAID 6。在每一个对数据库的高可用性要求较高的环境中，他们需要 RAID 6 因为数据库是最重要，无论花费多少都需要保护其安全，它在视频流环境中也是非常有用的。

#### RAID 6 的的优点和缺点 ####

- 性能很不错。
- RAID 6 非常昂贵，因为它要求两个独立的磁盘用于奇偶校验功能。
- 将失去两个磁盘的容量来保存奇偶校验信息（双奇偶校验）。
- 不存在数据丢失，即时两个磁盘损坏。我们可以在更换损坏的磁盘后从校验中重建数据。
- 读性能比 RAID 5 更好，因为它从多个磁盘读取，但对于没有专用的 RAID 控制器的设备写性能将非常差。

#### 要求 ####

要创建一个 RAID 6 最少需要4个磁盘.你也可以添加更多的磁盘，但你必须有专用的 RAID 控制器。在软件 RAID 中，我们在 RAID 6 中不会得到更好的性能，所以我们需要一个物理 RAID 控制器。

这些是新建一个 RAID 需要的设置，我们建议先看完以下 RAID 文章。

- [Linux 中 RAID 的基本概念 – 第一部分][1]
- [在 Linux 上创建软件 RAID 0 (条带化)  – 第二部分][2]
- [在 Linux 上创建软件 RAID 1 (镜像) – 第三部分][3]

#### My Server Setup ####

    Operating System :	CentOS 6.5 Final
    IP Address	 :	192.168.0.228
    Hostname	 :	rd6.tecmintlocal.com
    Disk 1 [20GB]	 :	/dev/sdb
    Disk 2 [20GB]	 :	/dev/sdc
    Disk 3 [20GB]	 :	/dev/sdd
    Disk 4 [20GB]	 : 	/dev/sde

这篇文章是9系列 RAID 教程的第5部分，在这里我们将看到我们如何在 Linux 系统或者服务器上创建和设置软件 RAID 6 或条带化双分布式奇偶校验，使用四个 20GB 的磁盘 /dev/sdb, /dev/sdc, /dev/sdd 和 /dev/sde.

### 第1步：安装 mdadm 工具，并检查磁盘 ###

1.如果你按照我们最进的两篇 RAID 文章（第2篇和第3篇），我们已经展示了如何安装‘mdadm‘工具。如果你直接看的这篇文章，我们先来解释下在Linux系统中如何使用‘mdadm‘工具来创建和管理 RAID，首先根据你的 Linux 发行版使用以下命令来安装。

    # yum install mdadm		[on RedHat systems]
    # apt-get install mdadm 	[on Debain systems]

2.安装该工具后，然后来验证需要的四个磁盘，我们将会使用下面的‘fdisk‘命令来检验用于创建 RAID 的磁盘。

    # fdisk -l | grep sd

![Check Hard Disk in Linux](http://www.tecmint.com/wp-content/uploads/2014/11/Verify-Linux-Disks.png)

在 Linux 中检查磁盘

3.在创建 RAID 磁盘前，先检查下我们的磁盘是否创建过 RAID 分区。

    # mdadm -E /dev/sd[b-e]
    # mdadm --examine /dev/sdb /dev/sdc /dev/sdd /dev/sde

![Check Raid on Disk](http://www.tecmint.com/wp-content/uploads/2014/11/Check-Disk-Raid.png)

在磁盘上检查 Raid 分区 

**注意**: 在上面的图片中，没有检测到任何 super-block 或者说在四个磁盘上没有 RAID 存在。现在我们开始创建 RAID 6。

### 第2步：为 RAID 6 创建磁盘分区 ###

4.现在为 raid 创建分区‘/dev/sdb‘, ‘/dev/sdc‘, ‘/dev/sdd‘ 和 ‘/dev/sde‘使用下面 fdisk 命令。在这里，我们将展示如何创建分区在 sdb 磁盘，同样的步骤也适用于其他分区。

**创建 /dev/sdb 分区**

    # fdisk /dev/sdb

请按照说明进行操作，如下图所示创建分区。

- 按 ‘n’ 创建新的分区。
- 然后按 ‘P’ 选择主分区。
- 接下来选择分区号为1。
- 只需按两次回车键选择默认值即可。
- 然后，按 ‘P’ 来打印创建好的分区。
- 按 ‘L’，列出所有可用的类型。
- 按 ‘t’ 去修改分区。
- 键入 ‘fd’ 设置为 Linux 的 RAID 类型，然后按 Enter 确认。
- 然后再次使用‘p’查看我们所做的更改。
- 使用‘w’保存更改。

![Create sdb Partition](http://www.tecmint.com/wp-content/uploads/2014/11/Create-sdb-Partition.png)

创建 /dev/sdb 分区

**创建 /dev/sdc 分区**

    # fdisk /dev/sdc

![Create sdc Partition](http://www.tecmint.com/wp-content/uploads/2014/11/Create-sdc-Partition.png)

创建 /dev/sdc 分区

**创建 /dev/sdd 分区**

    # fdisk /dev/sdd

![Create sdd Partition](http://www.tecmint.com/wp-content/uploads/2014/11/Create-sdd-Partition.png)

创建 /dev/sdd 分区

**创建 /dev/sde 分区**

    # fdisk /dev/sde

![Create sde Partition](http://www.tecmint.com/wp-content/uploads/2014/11/Create-sde-Partition.png)

创建 /dev/sde 分区

5.创建好分区后，检查磁盘的 super-blocks 是个好的习惯。如果 super-blocks 不存在我们可以按前面的创建一个新的 RAID。

    # mdadm -E /dev/sd[b-e]1
    
    
    或者
    
    # mdadm --examine /dev/sdb1 /dev/sdc1 /dev/sdd1 /dev/sde1

![Check Raid on New Partitions](http://www.tecmint.com/wp-content/uploads/2014/11/Check-Raid-on-New-Partitions.png)

在新分区中检查 Raid 

### 步骤3：创建 md 设备（RAID） ###

6，现在是时候来创建 RAID 设备‘md0‘ （即 /dev/md0）并应用 RAID 级别在所有新创建的分区中，确认 raid 使用以下命令。

    # mdadm --create /dev/md0 --level=6 --raid-devices=4 /dev/sdb1 /dev/sdc1 /dev/sdd1 /dev/sde1
    # cat /proc/mdstat

![Create Raid 6 Device](http://www.tecmint.com/wp-content/uploads/2014/11/Create-Raid-6-Device.png)

创建 Raid 6 设备

7.你还可以使用 watch 命令来查看当前 raid 的进程，如下图所示。

    # watch -n1 cat /proc/mdstat

![Check Raid 6 Process](http://www.tecmint.com/wp-content/uploads/2014/11/Check-Raid-6-Process.png)

检查 Raid 6 进程

8.使用以下命令验证 RAID 设备。

# mdadm -E /dev/sd[b-e]1

**注意**::上述命令将显示四个磁盘的信息，这是相当长的，所以没有截取其完整的输出。

9.接下来，验证 RAID 阵列，以确认 re-syncing 被启动。

    # mdadm --detail /dev/md0

![Check Raid 6 Array](http://www.tecmint.com/wp-content/uploads/2014/11/Check-Raid-6-Array.png)

检查 Raid 6 阵列

### 第4步：在 RAID 设备上创建文件系统 ###

10.使用 ext4 为‘/dev/md0‘创建一个文件系统并将它挂载在 /mnt/raid5 。这里我们使用的是 ext4，但你可以根据你的选择使用任意类型的文件系统。

    # mkfs.ext4 /dev/md0

![Create File System on Raid](http://www.tecmint.com/wp-content/uploads/2014/11/Create-File-System-on-Raid.png)

在 Raid 6 上创建文件系统

11.挂载创建的文件系统到 /mnt/raid6，并验证挂载点下的文件，我们可以看到 lost+found 目录。

    # mkdir /mnt/raid6
    # mount /dev/md0 /mnt/raid6/
    # ls -l /mnt/raid6/

12.在挂载点下创建一些文件，在任意文件中添加一些文字并验证其内容。

    # touch /mnt/raid6/raid6_test.txt
    # ls -l /mnt/raid6/
    # echo "tecmint raid setups" > /mnt/raid6/raid6_test.txt
    # cat /mnt/raid6/raid6_test.txt

![Verify Raid Content](http://www.tecmint.com/wp-content/uploads/2014/11/Verify-Raid-Content.png)

验证 Raid 内容

13.在 /etc/fstab 中添加以下条目使系统启动时自动挂载设备，环境不同挂载点可能会有所不同。

    # vim /etc/fstab
    
    /dev/md0                /mnt/raid6              ext4    defaults        0 0

![Automount Raid 6 Device](http://www.tecmint.com/wp-content/uploads/2014/11/Automount-Raid-Device.png)

自动挂载 Raid 6 设备

14.接下来，执行‘mount -a‘命令来验证 fstab 中的条目是否有错误。

    # mount -av

![Verify Raid Automount](http://www.tecmint.com/wp-content/uploads/2014/11/Verify-Automount-Raid-Devices.png)

验证 Raid 是否自动挂载

### 第5步：保存 RAID 6 的配置 ###

15.请注意默认 RAID 没有配置文件。我们需要使用以下命令手动保存它，然后检查设备‘/dev/md0‘的状态。

    # mdadm --detail --scan --verbose >> /etc/mdadm.conf
    # mdadm --detail /dev/md0

![Save Raid 6 Configuration](http://www.tecmint.com/wp-content/uploads/2014/11/Check-Raid-Status.png)

保存 Raid 6 配置

![Check Raid 6 Status](http://www.tecmint.com/wp-content/uploads/2014/11/Check-Raid-Status.png)

检查 Raid 6 状态

### 第6步：添加备用磁盘 ###

16.现在，它使用了4个磁盘，并且有两个作为奇偶校验信息来使用。在某些情况下，如果任意一个磁盘出现故障，我们仍可以得到数据，因为在 RAID 6 使用双奇偶校验。

如果第二个磁盘也出现故障，在第三块磁盘损坏前我们可以添加一个​​新的。它可以作为一个备用磁盘并入 RAID 集合，但我在创建  raid 集合前没有定义备用的磁盘。但是，在磁盘损坏后或者创建 RAId 集合时我们可以添加一块磁盘。现在，我们已经创建好了 RAID，下面让我演示如何添加备用磁盘。

为了达到演示的目的，我已经热插入了一个新的 HDD 磁盘（即 /dev/sdf），让我们来验证接入的磁盘。

    # ls -l /dev/ | grep sd

![Check New Disk](http://www.tecmint.com/wp-content/uploads/2014/11/Check-New-Disk.png)

检查新 Disk

17.现在再次确认新连接的磁盘没有配置过 RAID ，使用 mdadm 来检查。

    # mdadm --examine /dev/sdf

![Check Raid on New Disk](http://www.tecmint.com/wp-content/uploads/2014/11/Check-Raid-on-New-Disk.png)

在新磁盘中检查 Raid 

**注意**: 像往常一样，我们早前已经为四个磁盘创建了分区，同样，我们使用 fdisk 命令为新插入的磁盘创建新分区。

    # fdisk /dev/sdf

![Create sdf Partition](http://www.tecmint.com/wp-content/uploads/2014/11/Create-Partition-on-sdf.png)

为 /dev/sdf 创建分区

18.在 /dev/sdf 创建新的分区后，在新分区上确认 raid，包括/dev/md0 raid 设备的备用磁盘，并验证添加的设备。

    # mdadm --examine /dev/sdf
    # mdadm --examine /dev/sdf1
    # mdadm --add /dev/md0 /dev/sdf1
    # mdadm --detail /dev/md0

![Verify Raid on sdf Partition](http://www.tecmint.com/wp-content/uploads/2014/11/Verify-Raid-on-sdf.png)

在 sdf 分区上验证 Raid  

![Add sdf Partition to Raid](http://www.tecmint.com/wp-content/uploads/2014/11/Add-sdf-Partition-to-Raid.png)

为 RAID 添加 sdf 分区

![Verify sdf Partition Details](http://www.tecmint.com/wp-content/uploads/2014/11/Verify-sdf-Details.png)

验证 sdf 分区信息

### 第7步：检查 RAID 6 容错 ###

19.现在，让我们检查备用驱动器是否能自动工作，当我们阵列中的任何一个磁盘出现故障时。为了测试，我亲自将一个磁盘模拟为故障设备。

在这里，我们标记 /dev/sdd1 为故障磁盘。

    # mdadm --manage --fail /dev/md0 /dev/sdd1

![Check Raid 6 Fault Tolerance](http://www.tecmint.com/wp-content/uploads/2014/11/Check-Raid-6-Failover.png)

检查 Raid 6 容错

20.让我们查看 RAID 的详细信息，并检查备用磁盘是否开始同步。

    # mdadm --detail /dev/md0

![Check Auto Raid Syncing](http://www.tecmint.com/wp-content/uploads/2014/11/Check-Auto-Raid-Syncing.png)

检查 Raid 自动同步

**哇塞!** 这里，我们看到备用磁盘激活了，并开始重建进程。在底部，我们可以看到有故障的磁盘 /dev/sdd1 标记为 faulty。可以使用下面的命令查看进程重建。

    # cat /proc/mdstat

![Raid 6 Auto Syncing](http://www.tecmint.com/wp-content/uploads/2014/11/Raid-6-Auto-Syncing.png)

Raid 6 自动同步

### 结论: ###

在这里，我们看到了如何使用四个磁盘设置 RAID 6。这种 RAID 级别是具有高冗余的昂贵设置之一。在接下来的文章中，我们将看到如何建立一个嵌套的 RAID 10 甚至更多。至此，请继续关注 TECMINT。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/create-raid-6-in-linux/

作者：[Babin Lonston][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/babinlonston/
[1]:http://www.tecmint.com/understanding-raid-setup-in-linux/
[2]:http://www.tecmint.com/create-raid0-in-linux/
[3]:http://www.tecmint.com/create-raid1-in-linux/
