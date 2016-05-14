如何在 CentOS 7 中添加新磁盘而不用重启系统
================================================================================

对大多数系统管理员来说扩充 Linux 服务器的磁盘空间是日常的工作之一。因此这篇文章会通过使用 Linux 命令，在 CentOS 7 系统上演示一些简单的操作步骤来扩充您的磁盘空间而不需要重启您的生产服务器。关于扩充和增加新的磁盘到 Linux 系统，我们会提及多种方法和多种可行性，可按您所需选择最适用的一种。 

### 1. 在虚拟机客户端扩充磁盘空间: ###

在为 Linux 系统增加磁盘卷之前，您首先需要添加一块新的物理磁盘，或在 VMware vShere、VMware 工作站以及你使用的其它虚拟环境软件中进行设置来增加一块虚拟磁盘的容量。

![Increase disk](http://blog.linoxide.com/wp-content/uploads/2016/02/1.png)

### 2. 检查磁盘空间: ###

运行如下命令来检查当前磁盘空间大小。

    # df -h
    # fdisk -l

![Fdisk check](http://blog.linoxide.com/wp-content/uploads/2016/02/2.png)

可以看到，虽然我们已经在后端给其增加到 50 GB 的空间，但此时的总磁盘大小仍然为 10 GB。

### 3. 扩展空间而无需重启虚拟机 ###

现在运行如下命令，通过重新扫描 SCSI （注：Small Computer System Interface 小型计算机系统接口）总线并添加 SCSI 设备，系统就可以扩展操作系统的物理卷磁盘空间，而且不需要重启虚拟机。

    # ls /sys/class/scsi_host/
    # echo "- - -" > /sys/class/scsi_host/host0/scan
    # echo "- - -" > /sys/class/scsi_host/host1/scan
    # echo "- - -" > /sys/class/scsi_host/host2/scan

使用下面的命令来检查 SCSI 设备的名称，然后重新扫描 SCSI 总线。

    # ls /sys/class/scsi_device/
    # echo 1 > /sys/class/scsi_device/0\:0\:0\:0/device/rescan
    # echo 1 > /sys/class/scsi_device/2\:0\:0\:0/device/rescan

如下图所示，会重新扫描 SCSI 总线，随后我们在虚拟机客户端设置的磁盘大小会正常显示。

![Rescan disk device](http://blog.linoxide.com/wp-content/uploads/2016/02/3.png)

### 4. 创建新磁盘分区: ###

一旦在系统中可以看到扩展的磁盘空间，就可以运行如下命令来格式化您的磁盘以创建一个新的分区。请按如下操作步骤来扩充您的物理磁盘卷。

    # fdisk /dev/sda
    Welcome to fdisk (util-linux 2.23.2) press the 'm' key for help
    Command (m for help): m
    Command action
    a toggle a bootable flag
    b edit bsd disklabel
    c toggle the dos compatibility flag
    d delete a partition
    g create a new empty GPT partition table
    G create an IRIX (SGI) partition table
    l list known partition types
    m print this menu
    n add a new partition
    o create a new empty DOS partition table
    p print the partition table
    q quit without saving changes
    s create a new empty Sun disklabel
    t change a partition's system id
    u change display/entry units
    v verify the partition table
    w write table to disk and exit
    x extra functionality (experts only)

    Command (m for help):

键入 'p' 来查看当前的分区表信息，然后键入 'n' 键来创建一个新的主分区，选择所有可用的扇区。 使用 't' 命令改变磁盘类型为 'Linux LVM'，然后选择编码 '8e' 或者默认不选，它默认的类型编码为 '83'。

现在输入  'w' 来保存分区表信息并且退出命令环境，如下示：

    Command (m for help): w
    The partition table has been altered!

    Calling ioctl() to re-read partition table.

    WARNING: Re-reading the partition table failed with error 16: Device or resource busy.
    The kernel still uses the old table. The new table will be used at
    the next reboot or after you run partprobe(8) or kpartx(8)

![New disk Volume](http://blog.linoxide.com/wp-content/uploads/2016/02/3A.png)

### 5. 创建物理卷: ###

根据上述提示，运行 'partprob' 或 'kpartx' 命令以使分区表生效，然后使用如下的命令来创建新的物理卷。

    # partprobe
    # pvresize /dev/sda3

要检查新创建的卷，运行如下的命令可以看出新的物理卷是否已经被创建，是否可用。接下来，我们就可以使用这个新的物理卷来扩展 'centos' 卷组了，如下示：

    # pvdisplay
    # vgextend centos /dev/sda3

![Extend volume Group](http://blog.linoxide.com/wp-content/uploads/2016/02/3B.png)

### 6. 扩展逻辑卷: ###

现在我们使用如下的命令扩展逻辑卷，以增加我们系统正使用的磁盘空间。

    # lvextend -L +40G /dev/mapper/centos-root

一旦返回增加成功的消息，就可以运行如下命令来扩展您的逻辑卷大小。

    # xfs_growfs /dev/mapper/centos-root

'/' 分区的大小已经成功的增加了，可以使用 'df' 命令来检查您磁盘驱动器的大小。如图示。

![Increase disk space](http://blog.linoxide.com/wp-content/uploads/2016/02/3C.png)

### 7. 通过增加新的磁盘来扩充根分区而不用重启系统: ###

这是第二种方法，它使用的命令非常简单， 用来增加 CentOS 7 系统上逻辑卷空间大小。

所以第一步是打开您的虚拟机客户端的设置页面，点击 ‘增加’ 按纽，然后继续下一步操作。

![Add new disk](http://blog.linoxide.com/wp-content/uploads/2016/02/3D.png)

选择新磁盘所需要的配置信息，如下图所示的，选择新磁盘的大小和它的类型。

![New disk setup](http://blog.linoxide.com/wp-content/uploads/2016/02/3E.png)

然后进入服务端重复如下的命令来扫描您的磁盘设备，以使新磁盘在系统中可见。

    # echo "- - -" > /sys/class/scsi_host/host0/scan
    # echo "- - -" > /sys/class/scsi_host/host1/scan
    # echo "- - -" > /sys/class/scsi_host/host2/scan

列出您的 SCSI 设备的名称：

    # ls /sys/class/scsi_device/
    # echo 1 > /sys/class/scsi_device/1\:0\:0\:0/device/rescan
    # echo 1 > /sys/class/scsi_device/2\:0\:0\:0/device/rescan
    # echo 1 > /sys/class/scsi_device/3\:0\:0\:0/device/rescan
    # fdisk -l

![Scanning new disk](http://blog.linoxide.com/wp-content/uploads/2016/02/3F.png)

一旦新增的磁盘可见，就可以运行下面的命令来创建新的物理卷，然后增加到卷组，如下示。

    # pvcreate /dev/sdb
    # vgextend centos /dev/sdb
    # vgdisplay

![Extending Volume Group](http://blog.linoxide.com/wp-content/uploads/2016/02/3G.png)

现在根据此磁盘的空间大小来扩展逻辑卷，然后添加到根分区。

    # lvextend -L +20G /dev/mapper/centos-root
    # xfs_growfs /dev/mapper/centos-root
    # df -h

![Increase / Partition](http://blog.linoxide.com/wp-content/uploads/2016/02/3H.png)

### 结论: ###

在 Linux CentOS 7 系统上管理磁盘分区的操作过程是非常简单的，可以使用这篇文章所述的操作步骤来扩充您的任意逻辑卷的磁盘空间。您不需要重启生产线上的服务器，只是简单的重扫描下 SCSI 设备，和扩展您想要的 LVM（逻辑卷管理）。我们希望这文章对您有用。请随意的发表有用的评论和建议。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/add-new-disk-centos-7-without-rebooting/

作者：[Kashif S][a]
译者：[runningwater](https://github.com/runningwater)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/kashifs/