如何在现有的 Linux 系统上添加新的磁盘
============================================================

作为一个系统管理员，我们会有这样的一些需求：作为升级服务器容量的一部分，或者有时出现磁盘故障时更换磁盘，我们需要将新的硬盘配置到现有服务器。

在这篇文章中，我会向你逐步介绍添加新硬盘到现有 **RHEL/CentOS** 或者 **Debian/Ubuntu Linux** 系统的步骤。

**推荐阅读：** [如何将超过 2TB 的新硬盘添加到现有 Linux][1]。

重要：请注意这篇文章的目的只是告诉你如何创建新的分区，而不包括分区扩展或者其它选项。

我使用 [fdisk 工具][2] 完成这些配置。

我已经添加了一块 **20GB** 容量的硬盘，挂载到了 `/data` 分区。

`fdisk` 是一个在 Linux 系统上用于显示和管理硬盘和分区命令行工具。

```
# fdisk -l
```

这个命令会列出当前分区和配置。

[
 ![查看 Linux 分区详情](http://www.tecmint.com/wp-content/uploads/2017/03/Find-Linux-Partition-Details.png) 
][3]

*查看 Linux 分区详情*

添加了 20GB 容量的硬盘后，`fdisk -l` 的输出像下面这样。

```
# fdisk -l
```
[
 ![查看新分区详情](http://www.tecmint.com/wp-content/uploads/2017/03/Find-New-Partition-Details.png) 
][4]

*查看新分区详情*

新添加的磁盘显示为 `/dev/xvdc`。如果我们添加的是物理磁盘，基于磁盘类型它会显示为类似 `/dev/sda`。这里我使用的是虚拟磁盘。

要在特定硬盘上分区，例如 `/dev/xvdc`。

```
# fdisk /dev/xvdc
```

常用的 fdisk 命令。

*	`n` - 创建分区
*	`p` - 打印分区表 
*	`d` - 删除一个分区
*	`q` - 不保存更改退出
*	`w` - 保存更改并退出

这里既然我们是要创建一个分区，就用 `n` 选项。

[
 ![在 Linux 上创建新分区](http://www.tecmint.com/wp-content/uploads/2017/03/Create-New-Partition-in-Linux.png) 
][5]

*在 Linux 上创建新分区*

创建主分区或者扩展分区。默认情况下我们最多可以有 4 个主分区。

[
 ![创建主分区](http://www.tecmint.com/wp-content/uploads/2017/03/Create-Primary-Partition.png) 
][6]

*创建主分区*

按需求输入分区编号。推荐使用默认的值 `1`。

[
 ![分配分区编号](http://www.tecmint.com/wp-content/uploads/2017/03/Assign-a-Partition-Number.png) 
][7]

*分配分区编号*

输入第一个扇区的大小。如果是一个新的磁盘，通常选择默认值。如果你是在同一个磁盘上创建第二个分区，我们需要在前一个分区的最后一个扇区的基础上加 `1`。

[
 ![为分区分配扇区](http://www.tecmint.com/wp-content/uploads/2017/03/Assign-Sector-to-Partition.png) 
][8]

*为分区分配扇区*

输入最后一个扇区或者分区大小的值。通常推荐输入分区的大小。总是添加前缀 `+` 以防止值超出范围错误。

[
 ![分配分区大小](http://www.tecmint.com/wp-content/uploads/2017/03/Assign-Partition-Size.png) 
][9]

*分配分区大小*

保存更改并退出。

[
 ![保存分区更改](http://www.tecmint.com/wp-content/uploads/2017/03/Save-Partition-Changes.png) 
][10]

*保存分区更改*

现在使用 **mkfs** 命令格式化磁盘。

```
# mkfs.ext4 /dev/xvdc1
```
[
 ![格式化新分区](http://www.tecmint.com/wp-content/uploads/2017/03/Format-New-Partition.png) 
][11]

*格式化新分区*

格式化完成后，按照下面的命令挂载分区。

```
# mount /dev/xvdc1 /data
```

在 `/etc/fstab` 文件中添加条目以便永久启动时自动挂载。

```
/dev/xvdc1	/data	ext4	defaults     0   0
```

##### 总结

现在你知道如何使用 [fdisk 命令][12] 在新磁盘上创建分区并挂载了。

当处理分区、尤其是编辑已配置磁盘的时候，我们需要格外的小心。请分享你的反馈和建议吧。

--------------------------------------------------------------------------------

作者简介：

我的工作内容包括 IBM-AIX、Solaris、HP-UX 多种平台以及存储技术 ONTAP 和 OneFS，并具有 Oracle 数据库的经验。

-----------------------

via: http://www.tecmint.com/add-new-disk-to-an-existing-linux/

作者：[Lakshmi Dhandapani][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/lakshmi/
[1]:https://linux.cn/article-8398-1.html
[2]:http://www.tecmint.com/fdisk-commands-to-manage-linux-disk-partitions/
[3]:http://www.tecmint.com/wp-content/uploads/2017/03/Find-Linux-Partition-Details.png
[4]:http://www.tecmint.com/wp-content/uploads/2017/03/Find-New-Partition-Details.png
[5]:http://www.tecmint.com/wp-content/uploads/2017/03/Create-New-Partition-in-Linux.png
[6]:http://www.tecmint.com/wp-content/uploads/2017/03/Create-Primary-Partition.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/03/Assign-a-Partition-Number.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/03/Assign-Sector-to-Partition.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/03/Assign-Partition-Size.png
[10]:http://www.tecmint.com/wp-content/uploads/2017/03/Save-Partition-Changes.png
[11]:http://www.tecmint.com/wp-content/uploads/2017/03/Format-New-Partition.png
[12]:http://www.tecmint.com/fdisk-commands-to-manage-linux-disk-partitions/
[13]:http://www.tecmint.com/author/lakshmi/
[14]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[15]:http://www.tecmint.com/free-linux-shell-scripting-books/
