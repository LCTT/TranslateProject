树莓派自建 NAS 云盘之——树莓派搭建网络存储盘
======
> 跟随这些逐步指导构建你自己的基于树莓派的 NAS 系统。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus-storage.png?itok=95-zvHYl)

我将在接下来的这三篇文章中讲述如何搭建一个简便、实用的 NAS 云盘系统。我在这个中心化的存储系统中存储数据，并且让它每晚都会自动的备份增量数据。本系列文章将利用 NFS 文件系统将磁盘挂载到同一网络下的不同设备上，使用 [Nextcloud][1] 来离线访问数据、分享数据。

本文主要讲述将数据盘挂载到远程设备上的软硬件步骤。本系列第二篇文章将讨论数据备份策略、如何添加定时备份数据任务。最后一篇文章中我们将会安装 Nextcloud 软件，用户通过 Nextcloud 提供的 web 界面可以方便的离线或在线访问数据。本系列教程最终搭建的 NAS 云盘支持多用户操作、文件共享等功能，所以你可以通过它方便的分享数据，比如说你可以发送一个加密链接，跟朋友分享你的照片等等。

最终的系统架构如下图所示：


![](https://opensource.com/sites/default/files/uploads/nas_part1.png)

### 硬件

首先需要准备硬件。本文所列方案只是其中一种示例，你也可以按不同的硬件方案进行采购。

最主要的就是[树莓派 3][2]，它带有四核 CPU、1G RAM，以及（比较）快速的网络接口。数据将存储在两个 USB 磁盘驱动器上（这里使用 1TB 磁盘）；其中一个磁盘用于每天数据存储，另一个用于数据备份。请务必使用有源 USB 磁盘驱动器或者带附加电源的 USB 集线器，因为树莓派无法为两个 USB 磁盘驱动器供电。

### 软件

在该社区中最活跃的操作系统当属 [Raspbian][3]，便于定制个性化项目。已经有很多 [操作指南][4] 讲述如何在树莓派中安装 Raspbian 系统，所以这里不再赘述。在撰写本文时，最新的官方支持版本是 [Raspbian Stretch][5]，它对我来说很好使用。

到此，我将假设你已经配置好了基本的 Raspbian 系统并且可以通过 `ssh` 访问到你的树莓派。

### 准备 USB 磁盘驱动器

为了更好地读写数据，我建议使用 ext4 文件系统去格式化磁盘。首先，你必须先找到连接到树莓派的磁盘。你可以在 `/dev/sd/<x>` 中找到磁盘设备。使用命令 `fdisk -l`，你可以找到刚刚连接的两块 USB 磁盘驱动器。请注意，操作下面的步骤将会清除 USB 磁盘驱动器上的所有数据，请做好备份。

```
pi@raspberrypi:~ $ sudo fdisk -l

<...>

Disk /dev/sda: 931.5 GiB, 1000204886016 bytes, 1953525168 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0xe8900690

Device     Boot Start        End    Sectors   Size Id Type
/dev/sda1        2048 1953525167 1953523120 931.5G 83 Linux


Disk /dev/sdb: 931.5 GiB, 1000204886016 bytes, 1953525168 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x6aa4f598

Device     Boot Start        End    Sectors   Size Id Type
/dev/sdb1  *     2048 1953521663 1953519616 931.5G  83 Linux

```

由于这些设备是连接到树莓派的唯一的 1TB 的磁盘，所以我们可以很容易的辨别出 `/dev/sda` 和 `/dev/sdb` 就是那两个 USB 磁盘驱动器。每个磁盘末尾的分区表提示了在执行以下的步骤后如何查看，这些步骤将会格式化磁盘并创建分区表。为每个 USB 磁盘驱动器按以下步骤进行操作（假设你的磁盘也是 `/dev/sda` 和 `/dev/sdb`，第二次操作你只要替换命令中的 `sda` 为 `sdb` 即可）。

首先，删除磁盘分区表，创建一个新的并且只包含一个分区的新分区表。在 `fdisk` 中，你可以使用交互单字母命令来告诉程序你想要执行的操作。只需要在提示符 `Command(m for help):` 后输入相应的字母即可（可以使用 `m` 命令获得更多详细信息）：

```
pi@raspberrypi:~ $ sudo fdisk /dev/sda

Welcome to fdisk (util-linux 2.29.2).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.


Command (m for help): o
Created a new DOS disklabel with disk identifier 0x9c310964.

Command (m for help): n
Partition type
   p   primary (0 primary, 0 extended, 4 free)
   e   extended (container for logical partitions)
Select (default p): p
Partition number (1-4, default 1):
First sector (2048-1953525167, default 2048):
Last sector, +sectors or +size{K,M,G,T,P} (2048-1953525167, default 1953525167):

Created a new partition 1 of type 'Linux' and of size 931.5 GiB.

Command (m for help): p

Disk /dev/sda: 931.5 GiB, 1000204886016 bytes, 1953525168 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x9c310964

Device     Boot Start        End    Sectors   Size Id Type
/dev/sda1        2048 1953525167 1953523120 931.5G 83 Linux

Command (m for help): w
The partition table has been altered.
Syncing disks.
```

现在，我们将用 ext4 文件系统格式化新创建的分区 `/dev/sda1`：

```
pi@raspberrypi:~ $ sudo mkfs.ext4 /dev/sda1
mke2fs 1.43.4 (31-Jan-2017)
Discarding device blocks: done

<...>

Allocating group tables: done
Writing inode tables: done
Creating journal (1024 blocks): done
Writing superblocks and filesystem accounting information: done
```

重复以上步骤后，让我们根据用途来对它们建立标签：

```
pi@raspberrypi:~ $ sudo e2label /dev/sda1 data
pi@raspberrypi:~ $ sudo e2label /dev/sdb1 backup
```

现在，让我们安装这些磁盘并存储一些数据。以我运营该系统超过一年的经验来看，当树莓派启动时（例如在断电后），USB 磁盘驱动器并不是总被挂载，因此我建议使用 autofs 在需要的时候进行挂载。

首先，安装 autofs 并创建挂载点：

```
pi@raspberrypi:~ $ sudo apt install autofs
pi@raspberrypi:~ $ sudo mkdir /nas
```

然后添加下面这行来挂载设备 `/etc/auto.master`：

```
/nas    /etc/auto.usb
```

如果不存在以下内容，则创建 `/etc/auto.usb`，然后重新启动 autofs 服务：

```
data -fstype=ext4,rw :/dev/disk/by-label/data
backup -fstype=ext4,rw :/dev/disk/by-label/backup
pi@raspberrypi3:~ $ sudo service autofs restart
```

现在你应该可以分别访问 `/nas/data` 以及 `/nas/backup` 磁盘了。显然，到此还不会令人太兴奋，因为你只是擦除了磁盘中的数据。不过，你可以执行以下命令来确认设备是否已经挂载成功：

```
pi@raspberrypi3:~ $ cd /nas/data
pi@raspberrypi3:/nas/data $ cd /nas/backup
pi@raspberrypi3:/nas/backup $ mount
<...>
/etc/auto.usb on /nas type autofs (rw,relatime,fd=6,pgrp=463,timeout=300,minproto=5,maxproto=5,indirect)
<...>
/dev/sda1 on /nas/data type ext4 (rw,relatime,data=ordered)
/dev/sdb1 on /nas/backup type ext4 (rw,relatime,data=ordered)
```

首先进入对应目录以确保 autofs 能够挂载设备。autofs 会跟踪文件系统的访问记录，并随时挂载所需要的设备。然后 `mount` 命令会显示这两个 USB 磁盘驱动器已经挂载到我们想要的位置了。

设置 autofs 的过程容易出错，如果第一次尝试失败，请不要沮丧。你可以上网搜索有关教程。

### 挂载网络存储

现在你已经设置了基本的网络存储，我们希望将它安装到远程 Linux 机器上。这里使用 NFS 文件系统，首先在树莓派上安装 NFS 服务器：

```
pi@raspberrypi:~ $ sudo apt install nfs-kernel-server
```

然后，需要告诉 NFS 服务器公开 `/nas/data` 目录，这是从树莓派外部可以访问的唯一设备（另一个用于备份）。编辑 `/etc/exports` 添加如下内容以允许所有可以访问 NAS 云盘的设备挂载存储：

```
/nas/data *(rw,sync,no_subtree_check)
```

更多有关限制挂载到单个设备的详细信息，请参阅 `man exports`。经过上面的配置，任何人都可以访问数据，只要他们可以访问 NFS 所需的端口：`111` 和 `2049`。我通过上面的配置，只允许通过路由器防火墙访问到我的家庭网络的 22 和 443 端口。这样，只有在家庭网络中的设备才能访问 NFS 服务器。

如果要在 Linux 计算机挂载存储，运行以下命令：

```
you@desktop:~ $ sudo mkdir /nas/data
you@desktop:~ $ sudo mount -t nfs <raspberry-pi-hostname-or-ip>:/nas/data /nas/data
```

同样，我建议使用 autofs 来挂载该网络设备。如果需要其他帮助，请参看 [如何使用 Autofs 来挂载 NFS 共享][6]。

现在你可以在远程设备上通过 NFS 系统访问位于你树莓派 NAS 云盘上的数据了。在后面一篇文章中，我将介绍如何使用 `rsync` 自动将数据备份到第二个 USB 磁盘驱动器。你将会学到如何使用 `rsync` 创建增量备份，在进行日常备份的同时还能节省设备空间。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/network-attached-storage-Raspberry-Pi

作者：[Manuel Dewald][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[jrg](https://github.com/jrglinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ntlx
[1]: https://nextcloud.com/
[2]: https://www.raspberrypi.org/products/raspberry-pi-3-model-b/
[3]: https://www.raspbian.org/
[4]: https://www.raspberrypi.org/documentation/installation/installing-images/
[5]: https://www.raspberrypi.org/blog/raspbian-stretch/
[6]: https://opensource.com/article/18/6/using-autofs-mount-nfs-shares

 
