在 LVM中 录制逻辑卷快照并恢复（第三部分）
================================================================================
**LVM快照**是以空间换时间时间的方式制作的lvm卷副本。它只在lvm中工作，并只在源逻辑卷发生改变时占用快照卷的空间。如果源卷的变化达到1GB这么大，快照卷同样也会产生这样大的改变。因而，对于空间有效利用的最佳途径，就是总是进行小的修改。如果快照将存储空间消耗殆尽，我们可以使用lvextend来扩容。而如果我们需要缩减快照所占用卷的大小，可以使用lvreduce。

![Take Snapshot in LVM](http://www.tecmint.com/wp-content/uploads/2014/08/Take-Snapshot-in-LVM.jpg)

*在LVM中录制快照*

如果我们在创建快照后意外地删除了无论什么文件，我们没有必要担心，因为快照里包含了我们所删除的文件的原始文件。创建快照时，很有可能文件已经存在了。不要改变快照卷，保持创建时的样子，因为它用于快速恢复。

快照不可以用于备份选项。备份是某些数据的基础副本，因此我们不能使用快照作为备份的一个选择。

#### 前置阅读 ####

- [在Linux中使用LVM构建灵活的磁盘存储（第一部分）][1]
- [在Linux中扩展/缩减LVM（第二部分）][2]

### 我的服务器设置 ###

- 操作系统 — 安装有LVM的CentOS 6.5
- 服务器IP — 192.168.0.200

#### 步骤1： 创建LVM快照 ####

首先，使用‘**vgs**’命令检查卷组中的空闲空间以创建新的快照。

    # vgs
    # lvs

![Check LVM Disk Space](http://www.tecmint.com/wp-content/uploads/2014/08/Check-LVM-Disk-Space.jpg)

*检查LVM磁盘空间*

正如你所见，在**vgs**命令输出中，我们可以看到有8GB的剩余空闲空间。所以，让我们为我的名为**tecmint_datas**的卷创建快照。处于演示的目的，我将会使用以下命令来创建1GB的快照卷。

    # lvcreate -L 1GB -s -n tecmint_datas_snap /dev/vg_tecmint_extra/tecmint_datas        

或者

    # lvcreate --size 1G --snapshot --name tecmint_datas_snap /dev/vg_tecmint_extra/tecmint_datas

上面的两个命令都是干得同一件事：

- **-s** – 创建快照
- **-n** – 为快照命名

![Create LVM Snapshot](http://www.tecmint.com/wp-content/uploads/2014/08/Create-LVM-Snapshot.jpg)

*创建LVM快照*

此处，是对上面高亮要点的说明。

1. 我在此创建的快照的大小。
2. 创建快照。
3. 创建快照名。
4. 新的快照名。
5. 要创建快照的卷。

如果你想要移除快照，可以使用‘**lvremove**’命令。

	# lvremove /dev/vg_tecmint_extra/tecmint_datas_snap

![Remove LVM Snapshot](http://www.tecmint.com/wp-content/uploads/2014/08/Remove-LVM-Snapshot.jpg)

*移除LVM快照*

现在，使用以下命令列出新创建的快照。

	# lvs

![Verify LVM Snapshot](http://www.tecmint.com/wp-content/uploads/2014/08/Verify-LVM-Snapshot.jpg)

*验证LVM快照*

上面的你看到了吧，成功创建了一个快照。上面我用箭头标出了快照创建的源，它就是**tecmint_datas**。是的，因为我已经为**tecmint_datas l-volume**创建了一个快照。

![Check LVM Snapshot Space](http://www.tecmint.com/wp-content/uploads/2014/08/Check-LVM-Snapshot-Space.jpg)

*检查LVM快照空间*

让我们添加一些新文件到**tecmint_datas**里头。现在卷里大概有650MB左右的数据，而我我们的快照有1GB大。因此，有足够的空间在快照卷里备份我们的修改。这里我们可以使用下面的命令来查看到，我们的快照当前的状态。

    # lvs

![Check Snapshot Status](http://www.tecmint.com/wp-content/uploads/2014/08/Check-Snapshot-Status.jpg)

*检查快照状态*

你看到了，现在已经用掉了**51%**的快照卷，你要对你的文件作更多的修改都没有问题。使用下面的命令来查看更多详细信息。

    # lvdisplay vg_tecmint_extra/tecmint_data_snap

![View Snapshot Information](http://www.tecmint.com/wp-content/uploads/2014/08/Snapshot-Information.jpg)

*查看快照信息*

再来对上面图片中高亮的要点作个清楚的说明。

1. 快照逻辑卷名称。
2. 当前使用的卷组名。
3. 读写模式下的快照卷，我们甚至可以挂载并使用该卷。
4. 快照创建时间。这个很重要，因为快照将跟踪此时间之后的每个改变。
5. 该快照属于tecmint_datas逻辑卷。
6. 逻辑卷在线并可用。
7. 我们录制快照的源卷大小。
8. 写时复制表大小，Cow = copy on Write，这是说对tecmint_data卷所作的任何改变都会写入此快照。
9. 当前使用的快照大小，我们的tecmint_data有10GB，而我们的快照大小是1GB，这就意味着我们的数据大概有650MB。所以，如果tecmint_datas中的文件增长到2GB，现在的51%中的内容将增加到超过所分配的快照的大小，当然，我们在创建快照时会出现问题。这就意味着我们需要扩展逻辑卷大小（快照逻辑卷）
10. 给出快照组块的大小。

现在，让我们复制超过1GB的文件到**tecmint_datas**。让我们看看会发生什么。如果你那么做了，你将会见到‘**Input/output error**’这样的错误信息，它告诉你快照超出空间大小了。

![Add Files to Snapshot](http://www.tecmint.com/wp-content/uploads/2014/08/Add-Files-to-Snapshot.jpg)

*添加文件到快照*

如果该逻辑卷满了，它就会自动丢失新的数据，我们就不能再使用了，就算我们去扩展快照卷的大小也不行。最好的方法就是在创建快照时，创建一个和源一样大小的快照卷。**tecmint_datas**的大小是10GB，如果我们创建一个10GB大小的快照，它就永远都不会像上面那样超载，因为它有足够的空间来录制你的逻辑卷的快照。

#### 步骤2： 在LVM中扩展快照 ####

如果我们需要在超过容量前扩展快照卷的大小，我们可以使用以下命令来完成此项任务。

    # lvextend -L +1G /dev/vg_tecmint_extra/tecmint_data_snap

现在，那里有总计2GB大小的快照空间。

![Extend LVM Snapshot](http://www.tecmint.com/wp-content/uploads/2014/08/Extend-LVM-Snapshot.jpg)

*扩展LVM快照*

接下来，使用以下命令来验证新的大小和写时复制表。

    # lvdisplay /dev/vg_tecmint_extra/tecmint_data_snap

要知道快照卷的大小使用**%**。

    # lvs

![Check Size of Snapshot](http://www.tecmint.com/wp-content/uploads/2014/08/Check-Size-of-Snapshot.jpg)

*检查快照大小*

然而，如果你的快照大小和源卷一样，我们就没有必要担心这些问题了。

#### 步骤3： 恢复快照或合并 ####

要恢复快照，我们首先需要卸载文件系统。

    # unmount /mnt/tecmint_datas/

![Un-mount File System](http://www.tecmint.com/wp-content/uploads/2014/08/Unmount-File-System.jpg)

*卸载文件系统*

只想检查挂载点是否卸载成功，可以使用下面的命令。

    # df -h

![Check File System Mount Points](http://www.tecmint.com/wp-content/uploads/2014/08/Check-Mount-Points.jpg)

*检查文件系统挂载点*

这里，我们的挂载已经被卸载，所以我们可以继续恢复快照。要恢复快照，可以使用**lvconvert**命令。

    # lvconvert --merge /dev/vg_tecmint_extra/tecmint_data_snap

![Restore LVM Snapshot](http://www.tecmint.com/wp-content/uploads/2014/08/Restore-Snapshot.jpg)

*恢复LVM快照*

在合并完成后，快照卷将被自动移除。现在我们可以使用**df**命令来查看分区大小。

    # df -Th

![Check Size of Snapshot](http://www.tecmint.com/wp-content/uploads/2014/08/Check-Snapshot-Space.jpg)

在快照卷自动移除后，你可以用下面的命令查看逻辑卷大小。

    # lvs

![Check Size of Logical Volume](http://www.tecmint.com/wp-content/uploads/2014/08/Check-Size-of-LV.jpg)

*检查逻辑卷大小*

**重要**：要自动扩展快照，我们可以通过修改配置文件来进行。对于手动扩展，我们可以使用lvextend。

使用你喜欢的编辑器打开lvm配置文件。

    # vim /etc/lvm/lvm.conf

搜索单词autoextend。默认情况下，该值和下图中的类似。

![LVM Configuration](http://www.tecmint.com/wp-content/uploads/2014/08/LVM-Configuration.jpg)

*LVM配置*

修改此处的**100**为**75**，这样自动扩展的起始点就是**75**，而自动扩展百分比为20，它将自动扩容**百分之20**。

如果快照卷达到**75%**，它会自动为快照卷扩容**20%**。这样，我们可以自动扩容了。使用**wq!**来保存并退出。

这将把快照从超载导致下线事故中拯救出来，这也会帮助你节省更多时间。LVM是我们扩容以及获得其它众多特性如精简资源调配、拆卸、虚拟卷和使用精简池的唯一方法，让我们在下一个话题中来讨论吧。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/take-snapshot-of-logical-volume-and-restore-in-lvm/

作者：[Babin Lonston][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/babinlonston/
[1]:http://linux.cn/article-3965-1.html
[2]:http://linux.cn/article-3974-1.html
