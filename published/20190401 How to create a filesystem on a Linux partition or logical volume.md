[#]: collector: (lujun9972)
[#]: translator: (liujing97)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10705-1.html)
[#]: subject: (How to create a filesystem on a Linux partition or logical volume)
[#]: via: (https://opensource.com/article/19/4/create-filesystem-linux-partition)
[#]: 作者: (Kedar Vijay Kulkarni (Red Hat) https://opensource.com/users/kkulkarn)

如何在 Linux 分区或逻辑卷中创建文件系统
======

> 学习在你的系统中创建一个文件系统，并且长期或者非长期地挂载它。

![Filing papers and documents][1]

在计算技术中，文件系统控制如何存储和检索数据，并且帮助组织存储媒介中的文件。如果没有文件系统，信息将被存储为一个大数据块，而且你无法知道一条信息在哪结束，下一条信息在哪开始。文件系统通过为存储数据的文件提供名称，并且在文件系统中的磁盘上维护文件和目录表以及它们的开始和结束位置、总的大小等来帮助管理所有的这些信息。

在 Linux 中，当你创建一个硬盘分区或者逻辑卷之后，接下来通常是通过格式化这个分区或逻辑卷来创建文件系统。这个操作方法假设你已经知道如何创建分区或逻辑卷，并且你希望将它格式化为包含有文件系统，并且挂载它。

### 创建文件系统

假设你为你的系统添加了一块新的硬盘并且在它上面创建了一个叫 `/dev/sda1` 的分区。

1、为了验证 Linux 内核已经发现这个分区，你可以 `cat` 出 `/proc/partitions` 的内容，就像这样：

```
[root@localhost ~]# cat /proc/partitions
major minor  #blocks  name

 253            0   10485760 vda
 253            1       8192000 vda1
  11            0       1048575 sr0
  11            1       374 sr1
   8            0   10485760 sda
   8            1   10484736 sda1
 252            0       3145728 dm-0
 252            1       2097152 dm-1
 252            2       1048576 dm-2
   8    16      1048576 sdb
```


2、决定你想要去创建的文件系统种类，比如 ext4、XFS，或者其他的一些。这里是一些可选项：

```
[root@localhost ~]# mkfs.<tab><tab>
mkfs.btrfs mkfs.cramfs mkfs.ext2 mkfs.ext3 mkfs.ext4 mkfs.minix mkfs.xfs
```


3、为了这次练习的目的，选择 ext4。（我喜欢 ext4，因为如果你需要的话，它可以允许你去压缩文件系统，这对于 XFS 并不简单。）这里是完成它的方法（输出可能会因设备名称或者大小而不同）：

```
[root@localhost ~]# mkfs.ext4 /dev/sda1
mke2fs 1.42.9 (28-Dec-2013)
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
Stride=0 blocks, Stripe width=8191 blocks
194688 inodes, 778241 blocks
38912 blocks (5.00%) reserved for the super user
First data block=0
Maximum filesystem blocks=799014912
24 block groups
32768 blocks per group, 32768 fragments per group
8112 inodes per group
Superblock backups stored on blocks:
     32768, 98304, 163840, 229376, 294912

Allocating group tables: done
Writing inode tables: done
Creating journal (16384 blocks): done
Writing superblocks and filesystem accounting information: done
```

4、在上一步中，如果你想去创建不同的文件系统，请使用不同变种的 `mkfs` 命令。

### 挂载文件系统

当你创建好文件系统后，你可以在你的操作系统中挂载它。

1、首先，识别出新文件系统的 UUID 编码。使用 `blkid` 命令列出所有可识别的块存储设备并且在输出信息中查找 `sda1`：

```
[root@localhost ~]# blkid
/dev/vda1: UUID="716e713d-4e91-4186-81fd-c6cfa1b0974d" TYPE="xfs"
/dev/sr1: UUID="2019-03-08-16-17-02-00" LABEL="config-2" TYPE="iso9660"
/dev/sda1: UUID="wow9N8-dX2d-ETN4-zK09-Gr1k-qCVF-eCerbF" TYPE="LVM2_member"
/dev/mapper/test-test1: PTTYPE="dos"
/dev/sda1: UUID="ac96b366-0cdd-4e4c-9493-bb93531be644" TYPE="ext4"
[root@localhost ~]#
```

2、运行下面的命令挂载 `/dev/sd1` 设备：

```
[root@localhost ~]# mkdir /mnt/mount_point_for_dev_sda1
[root@localhost ~]# ls /mnt/
mount_point_for_dev_sda1
[root@localhost ~]# mount -t ext4 /dev/sda1 /mnt/mount_point_for_dev_sda1/
[root@localhost ~]# df -h
Filesystem Size Used Avail Use% Mounted on
/dev/vda1 7.9G 920M 7.0G 12% /
devtmpfs 443M 0 443M 0% /dev
tmpfs 463M 0 463M 0% /dev/shm
tmpfs 463M 30M 434M 7% /run
tmpfs 463M 0 463M 0% /sys/fs/cgroup
tmpfs 93M 0 93M 0% /run/user/0
/dev/sda1 2.9G 9.0M 2.7G 1% /mnt/mount_point_for_dev_sda1
[root@localhost ~]#
```

命令 `df -h` 显示了每个文件系统被挂载的挂载点。查找 `/dev/sd1`。上面的挂载命令使用的设备名称是 `/dev/sda1`。用 `blkid` 命令中的 UUID 编码替换它。注意，在 `/mnt` 下一个被新创建的目录挂载了 `/dev/sda1`。

3、直接在命令行下使用挂载命令（就像上一步一样）会有一个问题，那就是挂载不会在设备重启后存在。为使永久性地挂载文件系统，编辑 `/etc/fstab` 文件去包含你的挂载信息：

```
UUID=ac96b366-0cdd-4e4c-9493-bb93531be644 /mnt/mount_point_for_dev_sda1/ ext4 defaults 0 0
```

4、编辑完 `/etc/fstab` 文件后，你可以 `umount /mnt/mount_point_for_fev_sda1` 并且运行 `mount -a` 命令去挂载被列在 `/etc/fstab` 文件中的所有设备文件。如果一切顺利的话，你可以使用 `df -h` 列出并且查看你挂载的文件系统：

```
root@localhost ~]# umount /mnt/mount_point_for_dev_sda1/
[root@localhost ~]# mount -a
[root@localhost ~]# df -h
Filesystem Size Used Avail Use% Mounted on
/dev/vda1 7.9G 920M 7.0G 12% /
devtmpfs 443M 0 443M 0% /dev
tmpfs 463M 0 463M 0% /dev/shm
tmpfs 463M 30M 434M 7% /run
tmpfs 463M 0 463M 0% /sys/fs/cgroup
tmpfs 93M 0 93M 0% /run/user/0
/dev/sda1 2.9G 9.0M 2.7G 1% /mnt/mount_point_for_dev_sda1
```

5、你也可以检测文件系统是否被挂载：

```
[root@localhost ~]# mount | grep ^/dev/sd
/dev/sda1 on /mnt/mount_point_for_dev_sda1 type ext4 (rw,relatime,seclabel,stripe=8191,data=ordered)
```

现在你已经知道如何去创建文件系统并且长期或者非长期的挂载在你的系统中。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/create-filesystem-linux-partition

作者：[Kedar Vijay Kulkarni][a]
选题：[lujun9972][b]
译者：[liujing97](https://github.com/liujing97)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/kkulkarn
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/documents_papers_file_storage_work.png?itok=YlXpAqAJ (Filing papers and documents)
