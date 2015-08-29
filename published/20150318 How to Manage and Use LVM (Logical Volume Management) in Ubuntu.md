如何在 Ubuntu 中管理和使用 逻辑卷管理 LVM
================================================================================
![](http://cdn5.howtogeek.com/wp-content/uploads/2011/02/652x202xbanner-1.png.pagespeed.ic.VGSxDeVS9P.png)

在我们之前的文章中，我们介绍了[什么是 LVM 以及能用 LVM 做什么][1]，今天我们会给你介绍一些 LVM 的主要管理工具，使得你在设置和扩展安装时更游刃有余。

正如之前所述，LVM 是介于你的操作系统和物理硬盘驱动器之间的抽象层。这意味着你的物理硬盘驱动器和分区不再依赖于他们所在的硬盘驱动和分区。而是你的操作系统所见的硬盘驱动和分区可以是由任意数目的独立硬盘汇集而成的或是一个软件磁盘阵列。

要管理 LVM，这里有很多可用的 GUI 工具，但要真正理解 LVM 配置发生的事情，最好要知道一些命令行工具。这当你在一个服务器或不提供 GUI 工具的发行版上管理 LVM 时尤为有用。

LVM 的大部分命令和彼此都非常相似。每个可用的命令都由以下其中之一开头：

- Physical Volume （物理卷） = pv
- Volume Group （卷组）= vg
- Logical Volume （逻辑卷）= lv

物理卷命令用于在卷组中添加或删除硬盘驱动。卷组命令用于为你的逻辑卷操作更改显示的物理分区抽象集。逻辑卷命令会以分区形式显示卷组，使得你的操作系统能使用指定的空间。

### 可下载的 LVM 备忘单 ###

为了帮助你理解每个前缀可用的命令，我们制作了一个备忘单。我们会在该文章中介绍一些命令，但仍有很多你可用但没有介绍到的命令。

该列表中的所有命令都要以 root 身份运行，因为你更改的是会影响整个机器系统级设置。

![](http://cdn5.howtogeek.com/wp-content/uploads/2011/01/lvm-cheatsheet.png)

### 如何查看当前 LVM 信息 ###

你首先需要做的事情是检查你的 LVM 设置。s 和 display 命令可以和物理卷(pv)、卷组(vg)以及逻辑卷(lv)一起使用，是一个找出当前设置的好起点。

display 命令会格式化输出信息，因此比 s 命令更易于理解。对每个命令你会看到名称和 pv/vg 的路径，它还会给出空闲和已使用空间的信息。

![](http://cdn5.howtogeek.com/wp-content/uploads/2011/01/539x225xpvdisplay.png.pagespeed.ic.u2XV5LBTYa.png)

最重要的信息是 PV 名称和 VG 名称。用这两部分信息我们可以继续进行 LVM 设置。

### 创建一个逻辑卷 ###

逻辑卷是你的操作系统在 LVM 中使用的分区。创建一个逻辑卷，首先需要拥有一个物理卷和卷组。下面是创建一个新的逻辑卷所需要的全部命令。

#### 创建物理卷 ####

我们会从一个全新的没有任何分区和信息的硬盘开始。首先找出你将要使用的磁盘。(/dev/sda, sdb, 等)

> 注意：记住所有的命令都要以 root 身份运行或者在命令前面添加 'sudo' 。

    fdisk -l

如果之前你的硬盘从未格式化或分区过，在 fdisk 的输出中你很可能看到类似下面的信息。这完全正常，因为我们会在下面的步骤中创建需要的分区。

![](http://cdn5.howtogeek.com/wp-content/uploads/2011/02/fdisk.png.pagespeed.ce.AmAEsxm-7Q.png)

我们的新磁盘位置是 /dev/sdb，让我们用 fdisk 命令在磁盘上创建一个新的分区。

这里有大量能创建新分区的 GUI 工具，包括 [Gparted][2]，但由于我们已经打开了终端，我们将使用 fdisk 命令创建需要的分区。

在终端中输入以下命令：

    fdisk /dev/sdb

这会使你进入到一个特殊的 fdisk 提示符中。

![](http://cdn5.howtogeek.com/wp-content/uploads/2011/02/627x145xfdisk00.png.pagespeed.ic.I7S8bjoXQG.png)

以指定的顺序输入命令创建一个使用新硬盘 100% 空间的主分区并为 LVM 做好了准备。如果你需要更改分区的大小或想要多个分区，我建议使用 GParted 或自己了解一下关于 fdisk 命令的使用。

**警告：下面的步骤会格式化你的硬盘驱动。确保在进行下面步骤之前你的硬盘驱动中没有任何有用的信息。**

- n = 创建新分区
- p = 创建主分区
- 1 = 成为磁盘上的首个分区

输入 enter 键两次以接受默认的第一个和最后一个柱面。

![](http://cdn5.howtogeek.com/wp-content/uploads/2011/02/562x216xfdisk01.png.pagespeed.ic.DsSZ38kWcA.png)

用下面的命令准备 LVM 所使用的分区。

- t = 更改分区类型
- 8e = 更改为 LVM 分区类型

核实并将信息写入硬盘。

- p = 查看分区设置使得在写入更改到磁盘之前可以回看
- w = 写入更改到磁盘

![](http://cdn5.howtogeek.com/wp-content/uploads/2011/02/560x339xfdisk03.png.pagespeed.ic.FC8foICZsb.png)

运行这些命令之后，会退出 fdisk 提示符并返回到终端的 bash 提示符中。

输入 pvcreate /dev/sdb1 在刚创建的分区上新建一个 LVM 物理卷。

你也许会问为什么我们不用一个文件系统格式化分区，不用担心，该步骤在后面。

![](http://cdn5.howtogeek.com/wp-content/uploads/2011/02/pvcreate.png.pagespeed.ce.W7VAr-ig3t.png)

#### 创建卷组 ####

现在我们有了一个指定的分区和创建好的物理卷，我们需要创建一个卷组。很幸运这只需要一个命令。

    vgcreate vgpool /dev/sdb1

![](http://cdn5.howtogeek.com/wp-content/uploads/2011/02/vgcreate.png.pagespeed.ce.fVLzSmPZou.png)

vgpool 是新创建的卷组的名称。你可以使用任何你喜欢的名称，但建议标签以 vg 开头，以便后面你使用它时能意识到这是一个卷组。

#### 创建逻辑卷 ####

创建 LVM 将使用的逻辑卷：

    lvcreate -L 3G -n lvstuff vgpool

![](http://cdn5.howtogeek.com/wp-content/uploads/2011/02/lvcreate.png.pagespeed.ce.vupLB-LJEW.png)

-L 命令指定逻辑卷的大小，在该情况中是 3 GB，-n 命令指定卷的名称。 指定 vgpool  以便 lvcreate 命令知道从什么卷获取空间。

#### 格式化并挂载逻辑卷 ####

最后一步是用一个文件系统格式化新的逻辑卷。如果你需要选择一个 Linux 文件系统的帮助，请阅读 [如果根据需要选取最合适的文件系统][3]。

    mkfs -t ext3 /dev/vgpool/lvstuff

![](http://cdn5.howtogeek.com/wp-content/uploads/2011/02/571x424xmkfs.png.pagespeed.ic.ERMan1Mz0P.png)

创建挂载点并将卷挂载到你可以使用的地方。

    mkdir /mnt/stuff
    mount -t ext3 /dev/vgpool/lvstuff /mnt/stuff

![](http://cdn5.howtogeek.com/wp-content/uploads/2011/02/510x69xmount.png.pagespeed.ic.k0i1tvqgcV.png)

#### 重新设置逻辑卷大小 ####

逻辑卷的一个好处是你能使你的存储物理地变大或变小，而不需要移动所有东西到一个更大的硬盘。另外，你可以添加新的硬盘并同时扩展你的卷组。或者如果你有一个不使用的硬盘，你可以从卷组中移除它使得逻辑卷变小。

这里有三个用于使物理卷、卷组和逻辑卷变大或变小的基础工具。

注意：这些命令中的每个都要以 pv、vg 或 lv 开头，取决于你的工作对象。

- resize – 能压缩或扩展物理卷和逻辑卷，但卷组不能
- extend – 能使卷组和逻辑卷变大但不能变小
- reduce – 能使卷组和逻辑卷变小但不能变大

让我们来看一个如何向刚创建的逻辑卷 "lvstuff" 添加新硬盘驱动的例子。

#### 安装并格式化新硬盘驱动 ####

按照上面创建新分区并更改分区类型为 LVM(8e) 的步骤安装一个新硬盘驱动。然后用 pvcreate 命令创建一个 LVM 能识别的物理卷。

#### 添加新硬盘到卷组 ####

要添加新的硬盘到一个卷组，你只需要知道你的新分区，在我们的例子中是 /dev/sdc1，以及想要添加到的卷组的名称。

这会添加新物理卷到已存在的卷组中。

    vgextend vgpool /dev/sdc1

![](http://cdn5.howtogeek.com/wp-content/uploads/2011/02/vgextend.png.pagespeed.ce.atRPT1yg5f.png)

#### 扩展逻辑卷 ####

调整逻辑卷的大小，我们需要指出的是通过大小而不是设备来扩展。在我们的例子中，我们会添加一个 8GB 的硬盘驱动到我们的 3GB vgpool。我们可以用 lvextend 或 lvresize 命令使该空间可用。

    lvextend -L8G /dev/vgpool/lvstuff

![](http://cdn5.howtogeek.com/wp-content/uploads/2011/02/lvextend1.png.pagespeed.ce.6scXbQVUTT.png)

当这个命令工作的时候你会发现它实际上重新设置逻辑卷大小为 8GB 而不是我们期望的将 8GB 添加到已存在的卷上。要添加剩余的可用 3GB 你需要用下面的命令。

    lvextend -L+3G /dev/vgpool/lvstuff

![](http://cdn5.howtogeek.com/wp-content/uploads/2011/02/430x85xlvextend2.png.pagespeed.ic.7aBiTBrW03.png)

现在我们的逻辑卷已经是 11GB 大小了。

#### 扩展文件系统 ####

逻辑卷是 11GB 大小但是上面的文件系统仍然只有 3GB。要使文件系统使用整个的 11GB 可用空间你需要用 resize2fs 命令。你只需要指定 resize2fs 到 11GB 逻辑卷它就会帮你完成其余的工作。

    resize2fs /dev/vgpool/lvstuff

![](http://cdn5.howtogeek.com/wp-content/uploads/2011/02/650x150xresize2fs.png.pagespeed.ic.Mx74EdMuk_.png)

**注意：如果你使用除 ext3/4 之外的文件系统，请查看调整你的文件系统大小的工具。**

#### 压缩逻辑卷 ####

如果你想从卷组中移除一个硬盘驱动你可以按照上面的步骤反向操作，并用 lvreduce 或 vgreduce 命令代替。

1. 调整文件系统大小 (调整之前确保已经移动文件到硬盘驱动安全的地方)
1. 减小逻辑卷 (除了 + 可以扩展大小，你也可以用 - 压缩大小)
1. 用 vgreduce 从卷组中移除硬盘

#### 备份逻辑卷 ####

快照是一些新的高级文件系统提供的功能，但是 ext3/4 文件系统并没有快照的功能。LVM 快照最棒的是你的文件系统永不掉线，你可以拥有你想要的任何大小而不需要额外的硬盘空间。

![](http://cdn5.howtogeek.com/wp-content/uploads/2011/02/652x202xbanner-2.png.pagespeed.ic.VtOUuqYX1W.png)

LVM 获取快照的时候，会有一张和逻辑卷完全相同的“照片”，该“照片”可以用于在不同的硬盘上进行备份。生成一个备份的时候，任何需要添加到逻辑卷的新信息会如往常一样写入磁盘，但会跟踪更改使得原始快照永远不会损毁。

要创建一个快照，我们需要创建拥有足够空闲空间的逻辑卷，用于保存我们备份的时候会写入该逻辑卷的任何新信息。如果驱动并不是经常写入，你可以使用很小的一个存储空间。备份完成的时候我们只需要移除临时逻辑卷，原始逻辑卷会和往常一样。

#### 创建新快照 ####

创建 lvstuff 的快照，用带 -s 标记的 lvcreate 命令。

    lvcreate -L512M -s -n lvstuffbackup /dev/vgpool/lvstuff

![](http://cdn5.howtogeek.com/wp-content/uploads/2011/02/597x68xlvcreate-snapshot.png.pagespeed.ic.Rw2ivtcpPg.png)

这里我们创建了一个只有 512MB 的逻辑卷，因为该硬盘实际上并不会使用。512MB 的空间会保存备份时产生的任何新数据。

#### 挂载新快照 ####

和之前一样，我们需要创建一个挂载点并挂载新快照，然后才能从中复制文件。

    mkdir /mnt/lvstuffbackup
    mount /dev/vgpool/lvstuffbackup /mnt/lvstuffbackup

![](http://cdn5.howtogeek.com/wp-content/uploads/2011/02/565x68xmount-snapshot.png.pagespeed.ic.pVMkhK1o4x.png)

#### 复制快照和删除逻辑卷 ####

你剩下需要做的是从 /mnt/lvstuffbackup/ 中复制所有文件到一个外部的硬盘或者打包所有文件到一个文件。

**注意：tar -c 会创建一个归档文件，-f 要指出归档文件的名称和路径。要获取 tar 命令的帮助信息，可以在终端中输入 man tar。**

    tar -cf /home/rothgar/Backup/lvstuff-ss /mnt/lvstuffbackup/

![](http://cdn5.howtogeek.com/wp-content/uploads/2011/02/627x67xsnapshot-backup.png.pagespeed.ic.tw-2AK_lfZ.png)

记住备份时候写到 lvstuff 的所有文件都会在我们之前创建的临时逻辑卷中被跟踪。确保备份的时候你有足够的空闲空间。

备份完成后，卸载卷并移除临时快照。

    umount /mnt/lvstuffbackup
    lvremove /dev/vgpool/lvstuffbackup/

![](http://cdn5.howtogeek.com/wp-content/uploads/2011/02/630x102xlvremove.png.pagespeed.ic.yBWk47X6lF.png)

#### 删除逻辑卷 ####

要删除一个逻辑卷，你首先需要确保卷已经卸载，然后你可以用 lvremove 命令删除它。逻辑卷删除后你可以移除卷组，卷组删除后你可以删除物理卷。

这是所有移除我们创建的卷和组的命令。

    umount /mnt/lvstuff
    lvremove /dev/vgpool/lvstuff
    vgremove vgpool
    pvremove /dev/sdb1 /dev/sdc1

![](http://cdn5.howtogeek.com/wp-content/uploads/2011/02/580x185xdelete-lvm.png.pagespeed.ic.3zJTo0Zu9k.png)

这些已经囊括了关于 LVM 你需要了解的大部分知识。如果你有任何关于这些讨论的经验，请在下面的评论框中和大家分享。

--------------------------------------------------------------------------------

via: http://www.howtogeek.com/howto/40702/how-to-manage-and-use-lvm-logical-volume-management-in-ubuntu/

译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://linux.cn/article-5953-1.html
[2]:http://www.howtogeek.com/howto/17001/how-to-format-a-usb-drive-in-ubuntu-using-gparted/
[3]:http://www.howtogeek.com/howto/33552/htg-explains-which-linux-file-system-should-you-choose/