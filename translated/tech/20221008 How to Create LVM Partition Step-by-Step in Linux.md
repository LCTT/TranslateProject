[#]: subject: "How to Create LVM Partition Step-by-Step in Linux"
[#]: via: "https://www.linuxtechi.com/how-to-create-lvm-partition-in-linux/"
[#]: author: "James Kiarie https://www.linuxtechi.com/author/james/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

# 如何在 Linux 中逐步创建 LVM 分区

在本指南中，我们将逐步介绍如何在 Linux 中创建 lvm 分区。

LVM 代表逻辑卷管理，它是专门为服务器管理 Linux 系统上的磁盘或存储的推荐方式。 LVM 分区的主要优点之一是我们可以实时扩展其大小而无需停机。 LVM 分区也可以减少，但不推荐。

为了演示，我在我的 Ubuntu 22.04 系统上连接了 15GB 磁盘，我们将从命令行在该磁盘上创建 LVM 分区。

##### 先决条件

- 连接到 Linux 系统的原始磁盘
- 具有 Sudo 权限的本地用户
- 预装 lvm2 包

事不宜迟，让我们深入了解这些步骤。

### 步骤 1) 识别新连接的原始磁盘

登录到你的系统，打开终端并运行以下 dmesg 命令：

```
$ sudo dmesg | grep -i sd
```

在输出中，查找大小为 15GB 的新磁盘。

![dmesg-command-new-attached-disk-linux][1]

识别新连接的原始磁盘的另一种方法是通过 fdisk 命令：

```
$ sudo fdisk -l | grep -i /dev/sd
```

输出：

![fdisk-command-output-new-disk][2]

从上面的输出，可以确认新连接的磁盘是 “/dev/sdb”

### 步骤 2）创建 PV（物理卷）

在开始在磁盘 /dev/sdb 上创建 pv 之前，请确保已安装 lvm2 包。如果未安装，请运行以下命令：

```
$ sudo apt install lvm2     // On Ubuntu / Debian
$ sudo dnf install lvm2    // on RHEL / CentOS
```

运行以下 pvcreate 命令在磁盘 /dev/sdb 上创建 pv：

```
$ sudo pvcreate /dev/sdb
  Physical volume "/dev/sdb" successfully created.
$
```

要验证 pv 状态，运行：

```
$ sudo pvs /dev/sdb
或者
$ sudo pvdisplay /dev/sdb
```

![pvdisplay-command-output-linux][3]

### 步骤 3) 创建 VG（卷组）

要创建卷组，我们将使用 vgcreate 命令。创建 VG 意味着将 pv 添加到卷组。

语法：

```
$ sudo vgcreare <vg_name>  <pv>
```

在我们的例子中，命令是：

```
$ sudo vgcreate volgrp01 /dev/sdb
  Volume group "volgrp01" successfully created
$
```

运行以下命令以验证 vg (volgrp01) 的状态：

```
$ sudo vgs volgrp01
或者
$ sudo vgdisplay volgrp01
```

上述命令的输出：

![vgs-command-output-linux][4]

以上输出确认大小为 15 GiB 的卷组 (volgrp01) 已成功创建，一个物理扩展 (PE) 的大小为 4 MB。创建 vg 时可以更改 PE 大小。

### 步骤 4）创建 LV（逻辑卷）

Lvcreate 命令用于从 VG 创建 LV。 lvcreate 命令的语法如下所示：

```
$ sudo lvcreate -L <Size-of-LV> -n <LV-Name>   <VG-Name>
```

在我们的例子中，以下命令将用于创建大小为 14 GB 的 lv：

```
$ sudo lvcreate -L 14G -n lv01 volgrp01
  Logical volume "lv01" created.
$
```

验证 lv 的状态，运行：

```
$ sudo lvs /dev/volgrp01/lv01
或者
$ sudo lvdisplay /dev/volgrp01/lv01
```

输出：

![lvs-command-output-linux][5]

上面的输出显示 LV (lv01) 已成功创建，大小为 14 GiB。

### 步骤 5) 格式化 LVM 分区

使用 mkfs 命令格式化 lvm 分区。在我们的例子中，lvm 分区是 /dev/volgrp01/lv01。

注意：我们可以将分区格式化为 ext4 或 xfs，因此请根据你的设置和要求选择文件系统类型。

运行以下命令将 LVM 分区格式化为 ext4 文件系统。

```
$ sudo mkfs.ext4 /dev/volgrp01/lv01
```

![mkfs-ext4-filesystem-lvm][6]

执行下面的命令，用 xfs 文件系统格式化 lvm 分区：

```
$ sudo mkfs.xfs /dev/volgrp01/lv01
```

要使用上述格式化分区，我们必须将其挂载到某个文件夹中。所以，让我们创建一个文件夹 /mnt/data：

```
$ sudo mkdir /mnt/data
```

现在运行 mount 命令将其挂载到 /mnt/data 文件夹：

```
$ sudo mount /dev/volgrp01/lv01 /mnt/data/
$ df -Th /mnt/data/
Filesystem                Type  Size  Used Avail Use% Mounted on
/dev/mapper/volgrp01-lv01 ext4   14G   24K   13G   1% /mnt/data
$
```

尝试创建一些虚拟文件，运行以下命令：

```
$ cd /mnt/data/
$ echo "testing lvm partition" | sudo tee  dummy.txt
$ cat dummy.txt
testing lvm partition
$
$ sudo rm -f  dummy.txt
```

完美，以上命令输出确认我们可以访问 lvm 分区。

要永久挂载到 lvm 分区之上，请使用以下 echo 命令将其条目添加到 fstab 文件中：

```
$ echo '/dev/volgrp01/lv01  /mnt/data  ext4  defaults 0 0' | sudo  tee -a /etc/fstab
$ sudo mount -a
```

以上就是本指南的全部内容，感谢阅读。请在下面的评论区发表你的问题和反馈。

---

via: https://www.linuxtechi.com/how-to-create-lvm-partition-in-linux/

作者：[James Kiarie][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者 ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux 中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/james/
[b]: https://github.com/lkxed
[1]: https://www.linuxtechi.com/wp-content/uploads/2022/10/dmesg-command-new-attached-disk-linux.png
[2]: https://www.linuxtechi.com/wp-content/uploads/2022/10/fdisk-command-output-new-disk.png
[3]: https://www.linuxtechi.com/wp-content/uploads/2022/10/pvdisplay-command-output-linux.png
[4]: https://www.linuxtechi.com/wp-content/uploads/2022/10/vgs-command-output-linux.png
[5]: https://www.linuxtechi.com/wp-content/uploads/2022/10/lvs-command-output-linux.png
[6]: https://www.linuxtechi.com/wp-content/uploads/2022/10/mkfs-ext4-filesystem-lvm.png
