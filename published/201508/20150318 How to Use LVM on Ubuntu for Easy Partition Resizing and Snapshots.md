Ubuntu 上使用 LVM 轻松调整分区并制作快照
================================================================================
![](http://cdn5.howtogeek.com/wp-content/uploads/2015/03/ximg_55035707bbd74.png.pagespeed.ic.9_yebxUF1C.png)

Ubuntu的安装器提供了一个轻松“使用LVM”的复选框。它的描述中说，启用逻辑卷管理可以让你制作快照，并更容易地调整硬盘分区大小——这里将为大家讲述如何完成这些操作。

LVM是一种技术，某种程度上和[RAID阵列][1]或[Windows上的“存储空间”][2]类似。虽然该技术在服务器上更为有用，但是它也可以在桌面端PC上使用。

### 你应该在新安装Ubuntu时使用LVM吗？ ###

第一个问题是，你是否想要在安装Ubuntu时使用LVM？如果是，那么Ubuntu让这一切变得很简单，只需要轻点鼠标就可以完成，但是该选项默认是不启用的。正如安装器所说的，它允许你调整分区、创建快照、将多个磁盘合并到一个逻辑卷等等——所有这一切都可以在系统运行时完成。不同于传统分区，你不需要关掉你的系统，从Live CD或USB驱动，然后[当这些分区不使用时才能调整][3]。

完全坦率地说，普通Ubuntu桌面用户可能不会意识到他们是否正在使用LVM。但是，如果你想要在今后做一些更高深的事情，那么LVM就会有所帮助了。LVM可能更复杂，可能会在你今后恢复数据时会导致问题——尤其是在你经验不足时。这里不会有显著的性能损失——LVM是彻底地在Linux内核中实现的。

![](http://cdn5.howtogeek.com/wp-content/uploads/2015/03/ximg_55035cbada6ae.png.pagespeed.ic.cnqyiKfCvi.png)

### 逻辑卷管理说明 ###

前面，我们已经[说明了何谓LVM][4]。概括来讲，它在你的物理磁盘和呈现在你系统中的分区之间提供了一个抽象层。例如，你的计算机可能装有两个硬盘驱动器，它们的大小都是 1 TB。你必须得在这些磁盘上至少分两个区，每个区大小 1 TB。

LVM就在这些分区上提供了一个抽象层。用于取代磁盘上的传统分区，LVM将在你对这些磁盘初始化后，将它们当作独立的“物理卷”来对待。然后，你就可以基于这些物理卷创建“逻辑卷”。例如，你可以将这两个 1 TB 的磁盘组合成一个 2 TB 的分区，你的系统将只看到一个 2 TB 的卷，而LVM将会在后台处理这一切。一组物理卷以及一组逻辑卷被称之为“卷组”，一个典型的系统只会有一个卷组。

该抽象层使得调整分区、将多个磁盘组合成单个卷、甚至为一个运行着的分区的文件系统创建“快照”变得十分简单，而完成所有这一切都无需先卸载分区。

注意，如果你没有创建备份，那么将多个磁盘合并成一个卷将会是个糟糕的想法。它就像RAID 0——如果你将两个 1 TB 的卷组合成一个 2 TB 的卷，只要其中一个硬盘失败，你将丢失该卷上的重要数据。所以，如果你要走这条路，那么备份就及其重要。

### 管理LVM卷的图形化工具 ###

通常，[LVM通过Linux终端命令来管理][5]。这在Ubuntu上也行得通，但是有个更简单的图形化方法可供大家采用。如果你是一个Linux用户，对GParted或者与其类似的分区管理器熟悉，算了，别瞎掰了——GParted根本不支持LVM磁盘。

然而，你可以使用Ubuntu附带的磁盘工具。该工具也被称之为GNOME磁盘工具，或者叫Palimpsest。点击dash中的图标来开启它吧，搜索“磁盘”然后敲击回车。不像GParted，该磁盘工具将会在“其它设备”下显示LVM分区，因此你可以根据需要格式化这些分区，也可以调整其它选项。该工具在Live CD或USB 驱动下也可以使用。

![](http://cdn5.howtogeek.com/wp-content/uploads/2015/03/ximg_550361b3772f7.png.pagespeed.ic.nZWwLJUywR.png)

不幸的是，该磁盘工具不支持LVM的大多数强大的特性，没有管理卷组、扩展分区，或者创建快照等选项。对于这些操作，你可以通过终端来实现，但是没有那个必要。相反，你可以打开Ubuntu软件中心，搜索关键字LVM，然后安装逻辑卷管理工具，你可以在终端窗口中运行**sudo apt-get install system-config-lvm**命令来安装它。安装完之后，你就可以从dash上打开逻辑卷管理工具了。

这个图形化配置工具是由红帽公司开发的，虽然有点陈旧了，但却是唯一的图形化方式，你可以通过它来完成上述操作，将那些终端命令抛诸脑后了。

比如说，你想要添加一个新的物理卷到卷组中。你可以打开该工具，选择未初始化条目下的新磁盘，然后点击“初始化条目”按钮。然后，你就可以在未分配卷下找到新的物理卷了，你可以使用“添加到现存卷组”按钮来将它添加到“ubuntu-vg”卷组，这是Ubuntu在安装过程中创建的卷组。

![](http://cdn5.howtogeek.com/wp-content/uploads/2015/03/ximg_550363106789c.png.pagespeed.ic.drVInt3Weq.png)

卷组视图会列出你所有的物理卷和逻辑卷的总览。这里，我们有两个横跨两个独立硬盘驱动器的物理分区，我们有一个交换分区和一个根分区，这是Ubuntu默认设置的分区图表。由于我们从另一个驱动器添加了第二个物理分区，现在那里有大量未使用空间。

![](http://cdn5.howtogeek.com/wp-content/uploads/2015/03/ximg_550363f631c19.png.pagespeed.ic.54E_Owcq8y.png)

要扩展逻辑分区到物理空间，你可以在逻辑视图下选择它，点击编辑属性，然后修改大小来扩大分区。你也可以在这里缩小分区。

![](http://cdn5.howtogeek.com/wp-content/uploads/2015/03/ximg_55036893712d3.png.pagespeed.ic.ce7y_Mt0uF.png)

system-config-lvm的其它选项允许你设置快照和镜像。对于传统桌面而言，你或许不需要这些特性，但是在这里也可以通过图形化处理。记住，你也可以[使用终端命令完成这一切][6]。

--------------------------------------------------------------------------------

via: http://www.howtogeek.com/211937/how-to-use-lvm-on-ubuntu-for-easy-partition-resizing-and-snapshots/

译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.howtogeek.com/162676/how-to-use-multiple-disks-intelligently-an-introduction-to-raid/
[2]:http://www.howtogeek.com/109380/how-to-use-windows-8s-storage-spaces-to-mirror-combine-drives/
[3]:http://www.howtogeek.com/114503/how-to-resize-your-ubuntu-partitions/
[4]:http://www.howtogeek.com/howto/40702/how-to-manage-and-use-lvm-logical-volume-management-in-ubuntu/
[5]:http://www.howtogeek.com/howto/40702/how-to-manage-and-use-lvm-logical-volume-management-in-ubuntu/
[6]:http://www.howtogeek.com/howto/40702/how-to-manage-and-use-lvm-logical-volume-management-in-ubuntu/
