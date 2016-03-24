RHCSA 系列（六）: 使用 Parted 和 SSM 来配置和加密系统存储
================================================================================
在本篇文章中，我们将讨论在 RHEL 7 中如何使用传统的工具来设置和配置本地系统存储，并介绍系统存储管理器（也称为 SSM），它将极大地简化上面的任务。

![配置和加密系统存储](http://www.tecmint.com/wp-content/uploads/2015/04/Configure-and-Encrypt-System-Storage.png)

*RHCSA: 配置和加密系统存储 – Part 6*

请注意，我们将在这篇文章中展开这个话题，但由于该话题的宽泛性，我们将在下一期中继续介绍有关它的描述和使用。

### 在 RHEL 7 中创建和修改分区 ###

在 RHEL 7 中， parted 是默认的用来处理分区的程序，且它允许你：

- 展示当前的分区表
- 操纵（扩大或缩小分区的大小）现有的分区
- 利用空余的磁盘空间或额外的物理存储设备来创建分区

强烈建议你在试图增加一个新的分区或对一个现有分区进行更改前，你应当确保该设备上没有任何一个分区正在使用（`umount /dev/分区`），且假如你正使用设备的一部分来作为 swap 分区，在进行上面的操作期间，你需要将它禁用（`swapoff -v /dev/分区`） 。

实施上面的操作的最简单的方法是使用一个安装介质例如一个 RHEL 7 的 DVD 或 USB 安装盘以急救模式启动 RHEL（`Troubleshooting` → `Rescue a Red Hat Enterprise Linux system`），然后当让你选择一个选项来挂载现有的 Linux 安装时，选择“跳过”这个选项，接着你将看到一个命令行提示符，在其中你可以像下图显示的那样开始键入与在一个未被使用的物理设备上创建一个正常的分区时所用的相同的命令。

![RHEL 7 急救模式](http://www.tecmint.com/wp-content/uploads/2015/04/RHEL-7-Rescue-Mode.png)

*RHEL 7 急救模式*

要启动 parted，只需键入：

    # parted /dev/sdb

其中 `/dev/sdb` 是你将要创建新分区所在的设备；然后键入 `print` 来显示当前设备的分区表：

![创建新的分区](http://www.tecmint.com/wp-content/uploads/2015/04/Create-New-Partition.png)

*创建新的分区*

正如你所看到的那样，在这个例子中，我们正在使用一个 5 GB 的虚拟驱动器。现在我们将要创建一个 4 GB 的主分区，然后将它格式化为 xfs 文件系统，它是 RHEL 7 中默认的文件系统。

你可以从一系列的文件系统中进行选择。你将需要使用 `mkpart` 来手动地创建分区，接着和平常一样，用 `mkfs.类型` 来对分区进行格式化，因为 `mkpart` 并不支持许多现代的文件系统的到即开即用。

在下面的例子中，我们将为设备设定一个标记，然后在 `/dev/sdb` 上创建一个主分区 `(p)`，它从设备的 0% 开始，并在 4000MB(4 GB) 处结束。

![在 Linux 中设定分区名称](http://www.tecmint.com/wp-content/uploads/2015/04/Label-Partition.png)

*标记分区的名称*

接下来，我们将把分区格式化为 xfs 文件系统，然后再次打印出分区表，以此来确保更改已被应用。

    # mkfs.xfs /dev/sdb1
    # parted /dev/sdb print

![在 Linux 中格式化分区](http://www.tecmint.com/wp-content/uploads/2015/04/Format-Partition-in-Linux.png)

*格式化分区为 XFS 文件系统*

对于旧一点的文件系统，在 parted 中你可以使用 `resize` 命令来改变分区的大小。不幸的是，这只适用于 ext2, fat16, fat32, hfs, linux-swap, 和 reiserfs （若 libreiserfs 已被安装）。

因此，改变分区大小的唯一方式是删除它然后再创建它（所以，确保你对你的数据做了完整的备份！）。毫无疑问，在 RHEL 7 中默认的分区方案是基于 LVM 的。

使用 parted 来移除一个分区，可以用：

    # parted /dev/sdb print
    # parted /dev/sdb rm 1

![在 Linux 中移除分区](http://www.tecmint.com/wp-content/uploads/2015/04/Remove-Partition-in-Linux.png)

*移除或删除分区*

### 逻辑卷管理(LVM) ###

一旦一个磁盘被分好了分区，再去更改分区的大小就是一件困难或冒险的事了。基于这个原因，假如我们计划在我们的系统上对分区的大小进行更改，我们应当考虑使用 LVM 的可能性，而不是使用传统的分区系统。这样多个物理设备可以组成一个逻辑组，以此来存放任意数目的逻辑卷，而逻辑卷的增大或减少不会带来任何麻烦。

简单来说，你会发现下面的示意图对记住 LVM 的基础架构或许有用。

![LVM 的基本架构](http://www.tecmint.com/wp-content/uploads/2015/04/LVM-Diagram.png)

*LVM 的基本架构*

#### 创建物理卷，卷组和逻辑卷 ####

遵循下面的步骤是为了使用传统的卷管理工具来设置 LVM。由于你可以通过阅读这个网站上的 LVM 系列来扩展这个话题，我将只是概要的介绍设置 LVM 的基本步骤，然后与使用 SSM 来实现相同功能做个比较。

**注**: 我们将使用整个磁盘 `/dev/sdb` 和 `/dev/sdc` 来作为物理卷（PV），但是否执行相同的操作完全取决于你。

**1. 使用 /dev/sdb 和 /dev/sdc 中 100% 的可用磁盘空间来创建分区 `/dev/sdb1` 和 `/dev/sdc1`：**

    # parted /dev/sdb print
    # parted /dev/sdc print

![创建新分区](http://www.tecmint.com/wp-content/uploads/2015/04/Create-New-Partitions.png)

*创建新分区*

**2. 分别在 /dev/sdb1 和 /dev/sdc1 上共创建 2 个物理卷。**

    # pvcreate /dev/sdb1
    # pvcreate /dev/sdc1

![创建两个物理卷](http://www.tecmint.com/wp-content/uploads/2015/04/Create-Physical-Volumes.png)

*创建两个物理卷*

记住，你可以使用 pvdisplay /dev/sd{b,c}1 来显示有关新建的物理卷的信息。

**3. 在上一步中创建的物理卷之上创建一个卷组（VG）：**

    # vgcreate tecmint_vg /dev/sd{b,c}1

![在 Linux 中创建卷组](http://www.tecmint.com/wp-content/uploads/2015/04/Create-Volume-Group.png)

*创建卷组*

记住，你可使用 vgdisplay tecmint_vg 来显示有关新建的卷组的信息。

**4. 像下面那样，在卷组 tecmint_vg 之上创建 3 个逻辑卷（LV）：**

    # lvcreate -L 3G -n vol01_docs tecmint_vg       [vol01_docs → 3 GB]
    # lvcreate -L 1G -n vol02_logs tecmint_vg       [vol02_logs → 1 GB]
    # lvcreate -l 100%FREE -n vol03_homes tecmint_vg    [vol03_homes → 6 GB]

![在 LVM 中创建逻辑卷](http://www.tecmint.com/wp-content/uploads/2015/04/Create-Logical-Volumes.png)

*创建逻辑卷*

记住，你可以使用 lvdisplay tecmint_vg 来显示有关在 tecmint_vg 之上新建的逻辑卷的信息。

**5. 格式化每个逻辑卷为 xfs 文件系统格式（假如你计划在以后将要缩小卷的大小，请别使用 xfs 文件系统格式！）：**

    # mkfs.xfs /dev/tecmint_vg/vol01_docs
    # mkfs.xfs /dev/tecmint_vg/vol02_logs
    # mkfs.xfs /dev/tecmint_vg/vol03_homes

**6. 最后，挂载它们：**

    # mount /dev/tecmint_vg/vol01_docs /mnt/docs
    # mount /dev/tecmint_vg/vol02_logs /mnt/logs
    # mount /dev/tecmint_vg/vol03_homes /mnt/homes

#### 移除逻辑卷，卷组和物理卷 ####

**7.现在我们将进行与刚才相反的操作并移除逻辑卷、卷组和物理卷：**

    # lvremove /dev/tecmint_vg/vol01_docs
    # lvremove /dev/tecmint_vg/vol02_logs
    # lvremove /dev/tecmint_vg/vol03_homes
    # vgremove /dev/tecmint_vg
    # pvremove /dev/sd{b,c}1

**8. 现在，让我们来安装 SSM，我们将看到如何只用一步就完成上面所有的操作！**

    # yum update && yum install system-storage-manager

我们将和上面一样，使用相同的名称和大小：

    # ssm create -s 3G -n vol01_docs -p tecmint_vg --fstype ext4 /mnt/docs /dev/sd{b,c}1
    # ssm create -s 1G -n vol02_logs -p tecmint_vg --fstype ext4 /mnt/logs /dev/sd{b,c}1
    # ssm create -n vol03_homes -p tecmint_vg --fstype ext4 /mnt/homes /dev/sd{b,c}1

是的! SSM 可以让你：

- 初始化块设备来作为物理卷
- 创建一个卷组
- 创建逻辑卷
- 格式化逻辑卷，以及
- 只使用一个命令来挂载它们

**9. 现在，我们可以使用下面的命令来展示有关物理卷、卷组或逻辑卷的信息：**

    # ssm list dev
    # ssm list pool
    # ssm list vol

![检查有关物理卷、卷组或逻辑卷的信息](http://www.tecmint.com/wp-content/uploads/2015/04/Display-LVM-Information.png)

*检查有关物理卷、卷组或逻辑卷的信息*

**10. 正如我们知道的那样， LVM 的一个显著的特点是可以在不停机的情况下更改（增大或缩小）逻辑卷的大小：**

假定在 vol02_logs 上我们用尽了空间，而 vol03_homes 还留有足够的空间。我们将把 vol03_homes 的大小调整为 4 GB，并使用剩余的空间来扩展 vol02_logs：

    # ssm resize -s 4G /dev/tecmint_vg/vol03_homes

再次运行 `ssm list pool`，并记录 tecmint_vg 中的剩余空间的大小：

![查看卷的大小](http://www.tecmint.com/wp-content/uploads/2015/04/Check-LVM-Free-Space.png)

*查看卷的大小*

然后执行：

    # ssm resize -s+1.99 /dev/tecmint_vg/vol02_logs

**注**: 在 `-s` 后的加号暗示特定值应该被加到当前值上。

**11. 使用 ssm 来移除逻辑卷和卷组也更加简单，只需使用：**

    # ssm remove tecmint_vg

这个命令将返回一个提示，询问你是否确认删除卷组和它所包含的逻辑卷：

![移除逻辑卷和卷组](http://www.tecmint.com/wp-content/uploads/2015/04/Remove-LV-VG.png)

*移除逻辑卷和卷组*

### 管理加密的卷 ###

SSM 也给系统管理员提供了为新的或现存的卷加密的能力。首先，你将需要安装 cryptsetup 软件包：

    # yum update && yum install cryptsetup

然后写出下面的命令来创建一个加密卷，你将被要求输入一个密码来增强安全性：

    # ssm create -s 3G -n vol01_docs -p tecmint_vg --fstype ext4 --encrypt luks /mnt/docs /dev/sd{b,c}1
    # ssm create -s 1G -n vol02_logs -p tecmint_vg --fstype ext4 --encrypt luks /mnt/logs /dev/sd{b,c}1
    # ssm create -n vol03_homes -p tecmint_vg --fstype ext4 --encrypt luks /mnt/homes /dev/sd{b,c}1

我们的下一个任务是往 /etc/fstab 中添加条目来让这些逻辑卷在启动时可用，而不是使用设备识别编号(/dev/something)。

我们将使用每个逻辑卷的 UUID （使得当我们添加其他的逻辑卷或设备后，我们的设备仍然可以被唯一的标记），而我们可以使用 blkid 应用来找到它们的 UUID：

    # blkid -o value UUID /dev/tecmint_vg/vol01_docs
    # blkid -o value UUID /dev/tecmint_vg/vol02_logs
    # blkid -o value UUID /dev/tecmint_vg/vol03_homes

在我们的例子中：

![找到逻辑卷的 UUID](http://www.tecmint.com/wp-content/uploads/2015/04/Logical-Volume-UUID.png)

*找到逻辑卷的 UUID*

接着，使用下面的内容来创建 /etc/crypttab 文件(请更改 UUID 来适用于你的设置)：

    docs UUID=ba77d113-f849-4ddf-8048-13860399fca8 none
    logs UUID=58f89c5a-f694-4443-83d6-2e83878e30e4 none
    homes UUID=92245af6-3f38-4e07-8dd8-787f4690d7ac none

然后在 /etc/fstab 中添加如下的条目。请注意到 device_name (/dev/mapper/device_name) 是出现在 /etc/crypttab 中第一列的映射标识：

    # Logical volume vol01_docs:
    /dev/mapper/docs        /mnt/docs       ext4    defaults        0       2
    # Logical volume vol02_logs
    /dev/mapper/logs        /mnt/logs       ext4    defaults        0       2
    # Logical volume vol03_homes
    /dev/mapper/homes       /mnt/homes      ext4    defaults        0       2

现在重启（`systemctl reboot`），则你将被要求为每个逻辑卷输入密码。随后，你可以通过检查相应的挂载点来确保挂载操作是否成功：

![确保逻辑卷挂载点](http://www.tecmint.com/wp-content/uploads/2015/04/Verify-LV-Mount-Points.png)

*确保逻辑卷挂载点*

### 总结 ###

在这篇教程中，我们开始探索如何使用传统的卷管理工具和 SSM 来设置和配置系统存储，SSM 也在一个软件包中集成了文件系统和加密功能。这使得对于任何系统管理员来说，SSM 是一个非常有价值的工具。

假如你有任何的问题或评论，请让我们知晓 – 请随意使用下面的评论框来与我们保存联系！

--------------------------------------------------------------------------------

via: http://www.tecmint.com/rhcsa-exam-create-format-resize-delete-and-encrypt-partitions-in-linux/

作者：[Gabriel Cánepa][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/create-lvm-storage-in-linux/
