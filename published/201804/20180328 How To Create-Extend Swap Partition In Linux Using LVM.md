如何在 Linux 中使用 LVM 创建和扩展交换分区
======

我们使用 LVM 进行灵活的卷管理，为什么我们不能将 LVM 用于交换分区呢？

这可以让用户在需要时增加交换分区。如果你升级系统中的内存，则需要添加更多交换空间。这有助于你管理运行需要大量内存的应用的系统。

可以通过三种方式创建交换分区

  * 创建一个新的交换分区
  * 创建一个新的交换文件
  * 在现有逻辑卷（LVM）上扩展交换分区

建议创建专用交换分区而不是交换文件。

**建议阅读：**

*  [3 种简单的方法在 Linux 中创建或扩展交换空间][1]
*  [使用 Shell 脚本在 Linux 中自动创建/删除和挂载交换文件][2]

Linux 中推荐的交换大小是多少？

### 什么是交换空间

当物理内存 （RAM） 已满时，将使用 Linux 中的交换空间。当物理内存已满时，内存中的非活动页将移到交换空间。

这有助于系统连续运行应用程序，但它不能当做是更多内存的替代品。

交换空间位于硬盘上，因此它不能像物理内存那样处理请求。

### 如何使用 LVM 创建交换分区

由于我们已经知道如何创建逻辑卷，所以交换分区也是如此。只需按照以下过程。

创建你需要的逻辑卷。在我这里，我要创建 `5GB` 的交换分区。

```
$ sudo lvcreate -L 5G -n LogVol_swap1 vg00
 Logical volume "LogVol_swap1" created.
```

格式化新的交换空间。

```
$ sudo mkswap /dev/vg00/LogVol_swap1
Setting up swapspace version 1, size = 5 GiB (5368705024 bytes)
no label, UUID=d278e9d6-4c37-4cb0-83e5-2745ca708582
```

将以下条目添加到 `/etc/fstab` 中。

```
# vi /etc/fstab
/dev/mapper/vg00-LogVol_swap1 swap swap defaults 0 0
```

启用扩展逻辑卷。

```
$ sudo swapon -va
swapon: /swapfile: already active -- ignored
swapon: /dev/mapper/vg00-LogVol_swap1: found signature [pagesize=4096, signature=swap]
swapon: /dev/mapper/vg00-LogVol_swap1: pagesize=4096, swapsize=5368709120, devsize=5368709120
swapon /dev/mapper/vg00-LogVol_swap1
```

测试交换空间是否已正确添加。

```
$ cat /proc/swaps
Filename                Type        Size    Used    Priority
/swapfile file      1459804 526336  -1
/dev/dm-0 partition 5242876 0   -2

$ free -g
 total used free shared buff/cache available
Mem: 1 1 0 0 0 0
Swap: 6 0 6
```

### 如何使用 LVM 扩展交换分区

只需按照以下过程来扩展 LVM 交换逻辑卷。

禁用相关逻辑卷的交换。

```
$ sudo swapoff -v /dev/vg00/LogVol_swap1
swapoff /dev/vg00/LogVol_swap1
```

调整逻辑卷的大小。我将把交换空间从 `5GB` 增加到 `11GB`。

```
$ sudo lvresize /dev/vg00/LogVol_swap1 -L +6G
 Size of logical volume vg00/LogVol_swap1 changed from 5.00 GiB (1280 extents) to 11.00 GiB (2816 extents).
 Logical volume vg00/LogVol_swap1 successfully resized.
```

格式化新的交换空间。

```
$ sudo mkswap /dev/vg00/LogVol_swap1
mkswap: /dev/vg00/LogVol_swap1: warning: wiping old swap signature.
Setting up swapspace version 1, size = 11 GiB (11811155968 bytes)
no label, UUID=2e3b2ee0-ad0b-402c-bd12-5a9431b73623
```

启用扩展逻辑卷。

```
$ sudo swapon -va
swapon: /swapfile: already active -- ignored
swapon: /dev/mapper/vg00-LogVol_swap1: found signature [pagesize=4096, signature=swap]
swapon: /dev/mapper/vg00-LogVol_swap1: pagesize=4096, swapsize=11811160064, devsize=11811160064
swapon /dev/mapper/vg00-LogVol_swap1
```

测试逻辑卷是否已正确扩展。

```
$ free -g
 total used free shared buff/cache available
Mem: 1 1 0 0 0 0
Swap: 12 0 12

$ cat /proc/swaps
Filename                Type        Size    Used    Priority
/swapfile file      1459804 237024  -1
/dev/dm-0 partition 11534332    0   -2
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-create-extend-swap-partition-in-linux-using-lvm/

作者：[Ramya Nuvvula][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/ramya/
[1]:https://www.2daygeek.com/add-extend-increase-swap-space-memory-file-partition-linux/
[2]:https://www.2daygeek.com/shell-script-create-add-extend-swap-space-linux/
