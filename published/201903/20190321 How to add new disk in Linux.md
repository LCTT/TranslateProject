[#]: collector: (lujun9972)
[#]: translator: (luckyele)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10658-1.html)
[#]: subject: (How to add new disk in Linux)
[#]: via: (https://kerneltalks.com/hardware-config/how-to-add-new-disk-in-linux/)
[#]: author: (kerneltalks https://kerneltalks.com)

如何在 Linux 中添加新磁盘
======

> 在 Linux 机器中添加磁盘的逐步过程。

![New disk addition in Linux][1]

本文将向你介绍在 Linux 机器中添加新磁盘的步骤。将原始磁盘添加到 Linux 机器可能非常依赖于你所拥有的服务器类型，但是一旦将磁盘提供给机器，将其添加到挂载点的过程几乎相同。 

**目标**：向服务器添加新的 10GB 磁盘，并使用 lvm 和新创建的卷组创建 5GB 装载点。

### 向 Linux 机器添加原始磁盘

如果你使用的是 AWS EC2 Linux 服务器，可以 [按照以下步骤][2] 添加原始磁盘。如果使用的是 VMware Linux VM，那么需要按照不同的步骤来添加磁盘。如果你正在运行物理机架设备/刀片服务器，那么添加磁盘将是一项物理任务。

一旦磁盘物理/虚拟地连接到 Linux 机器上，它将被内核识别，就可以开始了。

### 识别 Linux 最新添加的磁盘

原始磁盘连接后，需要让内核去 [扫描新磁盘][3]。在新版中，它主要是由内核自动完成。

第一件事是在内核中识别新添加的磁盘及其名称。实现这一点的方法有很多，以下作少量列举：

  * 可以在添加/扫描磁盘前后观察 `lsblk` 输出，以获取新的磁盘名。
  * 检查 `/dev` 文件系统中新创建的磁盘文件。匹配文件和磁盘添加时间的时间戳。
  * 观察 `fdisk-l` 添加/扫描磁盘前后的输出，以获取新的磁盘名。

在本示例中，我使用的是 AWS EC2 服务器，向服务器添加了 5GB 磁盘。我的 lsblk 输出如下：

```
[root@kerneltalks ~]# lsblk
NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
xvda    202:0    0  10G  0 disk
├─xvda1 202:1    0   1M  0 part
└─xvda2 202:2    0  10G  0 part /
xvdf    202:80   0  10G  0 disk
```

可以看到 `xvdf` 是新添加的磁盘。完整路径是 `/dev/xvdf`。

### 在 LVM 中添加新磁盘

我们这里使用 LVM，因为它是 Linux 平台上广泛使用的非常灵活的卷管理器。确认 lvm 或 lvm2 软件包[已经安装在系统上][4]。如未安装，请 [安装 lvm/lvm2 程序包][5]。

现在，我们将在逻辑卷管理器中添加这个原始磁盘，并从中创建 10GB 的挂接点。所用到的命令如下：

  * [pvcreate][6]
  * [vgcreate][7]
  * [lvcreate][8]

如果要将磁盘添加到现有挂接点，并使用其空间来[扩展挂接点][9] ，则 `vgcreate` 应替换为 `vgextend`。

会话示例输出如下：

```
[root@kerneltalks ~]# pvcreate /dev/xvdf
  Physical volume "/dev/xvdf" successfully created.
[root@kerneltalks ~]# vgcreate vgdata /dev/xvdf
  Volume group "vgdata" successfully created
[root@kerneltalks ~]# lvcreate -L 5G -n lvdata vgdata
  Logical volume "lvdata" created.
```

现在，已完成逻辑卷创建。你需要使用所选的文件系统格式化它，并将其挂载。在这里选择 ext4 文件系统，并使用 `mkfs.ext4` 进行格式化。

```
[root@kerneltalks ~]# mkfs.ext4 /dev/vgdata/lvdata
mke2fs 1.42.9 (28-Dec-2013)
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
Stride=0 blocks, Stripe width=0 blocks
327680 inodes, 1310720 blocks
65536 blocks (5.00%) reserved for the super user
First data block=0
Maximum filesystem blocks=1342177280
40 block groups
32768 blocks per group, 32768 fragments per group
8192 inodes per group
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912, 819200, 884736
 
Allocating group tables: done
Writing inode tables: done
Creating journal (32768 blocks): done
Writing superblocks and filesystem accounting information: done
```

### 在挂载点上从新磁盘挂载卷

使用 `mount` 命令，在 `/data` 安装点上安装已创建并格式化的 5GB 逻辑卷。

```
[root@kerneltalks ~]# mount /dev/vgdata/lvdata /data
[root@kerneltalks ~]# df -Ph /data
Filesystem                 Size  Used Avail Use% Mounted on
/dev/mapper/vgdata-lvdata  4.8G   20M  4.6G   1% /data
```

使用 `df` 命令验证挂载点。如上所述，你都完成了！你可以在 [/etc/fstab][10] 中添加一个条目，以便在重新启动时保持此装载。

你已将 10GB 磁盘连接到 Linux 计算机，并创建了 5GB 挂载点！

--------------------------------------------------------------------------------

via: https://kerneltalks.com/hardware-config/how-to-add-new-disk-in-linux/

作者：[kerneltalks][a]
选题：[lujun9972][b]
译者：[luckyele](https://github.com/luckyele)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://kerneltalks.com
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/kerneltalks.com/wp-content/uploads/2019/03/How-to-add-new-disk-in-Linux.png?ssl=1
[2]: https://kerneltalks.com/cloud-services/how-to-add-ebs-disk-on-aws-linux-server/
[3]: https://kerneltalks.com/disk-management/howto-scan-new-lun-disk-linux-hpux/
[4]: https://kerneltalks.com/tools/check-package-installed-linux/
[5]: https://kerneltalks.com/tools/package-installation-linux-yum-apt/
[6]: https://kerneltalks.com/disk-management/lvm-command-tutorials-pvcreate-pvdisplay/
[7]: https://kerneltalks.com/disk-management/lvm-commands-tutorial-vgcreate-vgdisplay-vgscan/
[8]: https://kerneltalks.com/disk-management/lvm-commands-tutorial-lvcreate-lvdisplay-lvremove/
[9]: https://kerneltalks.com/disk-management/extend-file-system-online-lvm/
[10]: https://kerneltalks.com/config/understanding-etcfstab-file/
