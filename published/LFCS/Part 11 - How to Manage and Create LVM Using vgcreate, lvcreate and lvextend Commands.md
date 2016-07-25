LFCS 系列第十一讲：如何使用命令 vgcreate、lvcreate 和 lvextend 管理和创建 LVM
========================================================================================

由于 LFCS 考试中的一些改变已在 2016 年 2 月 2 日生效，我们添加了一些必要的专题到 [LFCS 系列][1]。我们也非常推荐备考的同学，同时阅读 [LFCE 系列][2]。

![](http://www.tecmint.com/wp-content/uploads/2016/03/Manage-LVM-and-Create-LVM-Partition-in-Linux.png)

*LFCS：管理 LVM 和创建 LVM 分区*

在安装 Linux 系统的时候要做的最重要的决定之一便是给系统文件、home 目录等分配空间。在这个地方犯了错，再要扩大空间不足的分区，那样既麻烦又有风险。

**逻辑卷管理** （**LVM**）相较于传统的分区管理有许多优点，已经成为大多数（如果不能说全部的话） Linux 发行版安装时的默认选择。LVM 最大的优点应该是能方便的按照你的意愿调整（减小或增大）逻辑分区的大小。

LVM 的组成结构：

* 把一块或多块硬盘或者一个或多个分区配置成物理卷（PV）。
* 一个用一个或多个物理卷创建出的卷组（**VG**）。可以把一个卷组想象成一个单独的存储单元。
* 在一个卷组上可以创建多个逻辑卷。每个逻辑卷相当于一个传统意义上的分区 —— 优点是它的大小可以根据需求重新调整大小，正如之前提到的那样。

本文，我们将使用三块 **8 GB** 的磁盘（**/dev/sdb**、**/dev/sdc** 和 **/dev/sdd**）分别创建三个物理卷。你既可以直接在整个设备上创建 PV，也可以先分区在创建。

在这里我们选择第一种方式，如果你决定使用第二种（可以参考本系列[第四讲：创建分区和文件系统][3]）确保每个分区的类型都是 `8e`。

### 创建物理卷，卷组和逻辑卷

要在 **/dev/sdb**、**/dev/sdc** 和 **/dev/sdd**上创建物理卷，运行：

```
# pvcreate /dev/sdb /dev/sdc /dev/sdd
```

你可以列出新创建的 PV ，通过：

```
# pvs
```

并得到每个 PV 的详细信息，通过：

```
# pvdisplay /dev/sdX
```

（**X** 即 b、c 或 d）

如果没有输入 `/dev/sdX` ，那么你将得到所有 PV 的信息。

使用 /dev/sdb` 和 `/dev/sdc` 创建卷组 ，命名为 `vg00` (在需要时是可以通过添加其他设备来扩展空间的，我们等到说明这点的时候再用，所以暂时先保留 `/dev/sdd`）：

```
# vgcreate vg00 /dev/sdb /dev/sdc
```

就像物理卷那样，你也可以查看卷组的信息，通过：

```
# vgdisplay vg00
```

由于 `vg00` 是由两个 **8 GB** 的磁盘组成的，所以它将会显示成一个 **16 GB** 的硬盘：

![](http://www.tecmint.com/wp-content/uploads/2016/03/List-LVM-Volume-Groups.png)

*LVM 卷组列表*

当谈到创建逻辑卷，空间的分配必须考虑到当下和以后的需求。根据每个逻辑卷的用途来命名是一个好的做法。

举个例子，让我们创建两个 LV，命名为 `vol_projects` （**10 GB**） 和 `vol_backups` （剩下的空间）， 在日后分别用于部署项目文件和系统备份。

参数 `-n` 用于为 LV 指定名称，而 `-L` 用于设定固定的大小，还有 `-l` （小写的 L）在 VG 的预留空间中用于指定百分比大小的空间。

```
# lvcreate -n vol_projects -L 10G vg00
# lvcreate -n vol_backups -l 100%FREE vg00
```

和之前一样，你可以查看 LV 的列表和基础信息，通过：

```
# lvs
```

或是查看详细信息，通过：

```
# lvdisplay
```

若要查看单个 **LV** 的信息，使用 **lvdisplay** 加上 **VG** 和 **LV** 作为参数，如下：

```
# lvdisplay vg00/vol_projects
```

![](http://www.tecmint.com/wp-content/uploads/2016/03/List-Logical-Volume.png)

*逻辑卷列表*

如上图，我们看到 LV 已经被创建成存储设备了（参考  LV Path 那一行）。在使用每个逻辑卷之前，需要先在上面创建文件系统。

这里我们拿 ext4 来做举例，因为对于每个 LV 的大小， ext4 既可以增大又可以减小（相对的 xfs 就只允许增大）：

```
# mkfs.ext4 /dev/vg00/vol_projects
# mkfs.ext4 /dev/vg00/vol_backups
```

我们将在下一节向大家说明，如何调整逻辑卷的大小并在需要的时候添加额外的外部存储空间。

### 调整逻辑卷大小和扩充卷组

现在设想以下场景。`vol_backups` 中的空间即将用完，而 `vol_projects` 中还有富余的空间。由于 LVM 的特性，我们可以轻易的减小后者的大小（比方说 **2.5 GB**），并将其分配给前者，与此同时调整每个文件系统的大小。

幸运的是这很简单，只需：

```
# lvreduce -L -2.5G -r /dev/vg00/vol_projects
# lvextend -l +100%FREE -r /dev/vg00/vol_backups
```

![](http://www.tecmint.com/wp-content/uploads/2016/03/Resize-Reduce-Logical-Volume-and-Volume-Group.png)

*减小逻辑卷和卷组*

在调整逻辑卷的时候，其中包含的减号 `(-)` 或加号 `(+)` 是十分重要的。否则 LV 将会被设置成指定的大小，而非调整指定大小。

有些时候，你可能会遭遇那种无法仅靠调整逻辑卷的大小就可以解决的问题，那时你就需要购置额外的存储设备了，你可能需要再加一块硬盘。这里我们将通过添加之前配置时预留的 PV （`/dev/sdd`），用以模拟这种情况。

想把 `/dev/sdd` 加到 `vg00`，执行：

```
# vgextend vg00 /dev/sdd
```

如果你在运行上条命令的前后执行 vgdisplay `vg00` ，你就会看出 VG 的大小增加了。

```
# vgdisplay vg00
```

![](http://www.tecmint.com/wp-content/uploads/2016/03/List-Volume-Group-Size.png)

*查看卷组磁盘大小*

现在，你可以使用新加的空间，按照你的需求调整现有 LV 的大小，或者创建一个新的 LV。

### 在启动和需求时挂载逻辑卷

当然，如果我们不打算实际的使用逻辑卷，那么创建它们就变得毫无意义了。为了更好的识别逻辑卷，我们需要找出它的 `UUID` （用于识别一个格式化存储设备的唯一且不变的属性）。

要做到这点，可使用 blkid 加每个设备的路径来实现：

```
# blkid /dev/vg00/vol_projects
# blkid /dev/vg00/vol_backups
```

![](http://www.tecmint.com/wp-content/uploads/2016/03/Find-Logical-Volume-UUID.png)

*寻找逻辑卷的 UUID*

为每个 LV 创建挂载点：

```
# mkdir /home/projects
# mkdir /home/backups
```

并在 `/etc/fstab` 插入相应的条目（确保使用之前获得的UUID）：

```
UUID=b85df913-580f-461c-844f-546d8cde4646 /home/projects    ext4 defaults 0 0
UUID=e1929239-5087-44b1-9396-53e09db6eb9e /home/backups ext4    defaults 0 0
```

保存并挂载 LV：

```
# mount -a
# mount | grep home
```

![](http://www.tecmint.com/wp-content/uploads/2016/03/Mount-Logical-Volumes-on-Linux-1.png)

*挂载逻辑卷*

在涉及到 LV 的实际使用时，你还需要按照曾在本系列[第八讲：管理用户和用户组][4]中讲解的那样，为其设置合适的 `ugo+rwx`。

### 总结

本文介绍了 [逻辑卷管理][5]，一个用于管理可扩展存储设备的多功能工具。与 RAID（曾在本系列讲解过的 [第六讲：组装分区为RAID设备——创建和管理系统备份][6]）结合使用，你将同时体验到（LVM 带来的）可扩展性和（RAID 提供的）冗余。

在这类的部署中，你通常会在 `RAID` 上发现 `LVM`，这就是说，要先配置好 RAID 然后它在上面配置 LVM。

如果你对本问有任何的疑问和建议，可以直接在下方的评论区告诉我们。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/manage-and-create-lvm-parition-using-vgcreate-lvcreate-and-lvextend/

作者：[Gabriel Cánepa][a]
译者：[martin2011qi](https://github.com/martin2011qi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/gacanepa/
[1]: https://linux.cn/article-7161-1.html
[2]: http://www.tecmint.com/installing-network-services-and-configuring-services-at-system-boot/
[3]: https://linux.cn/article-7187-1.html
[4]: https://linux.cn/article-7418-1.html
[5]: https://linux.cn/article-3965-1.html
[6]: https://linux.cn/article-7229-1.html
