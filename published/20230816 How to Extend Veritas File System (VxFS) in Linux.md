[#]: subject: "How to Extend Veritas File System (VxFS) in Linux"
[#]: via: "https://www.2daygeek.com/extend-increase-vxvm-volume-vxfs-filesystem-linux/"
[#]: author: "Jayabal Thiyagarajan https://www.2daygeek.com/author/jayabal/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16199-1.html"

如何在 Linux 中扩展 Veritas 文件系统（VxFS）
======

![][0]

扩展 VxFX 文件系统是 Linux/Unix 管理员的一项日常任务，可以通过以下文章中描述的几个步骤在线完成此任务：

在此，磁盘组没有足够的可用空间，因此我们将在现有磁盘组（DG）中添加新磁盘，然后调整其大小。

**相关文章：**

  * **[如何在 Linux 中创建 VxVM 卷和文件系统][1]**
  * **[如何在 Linux 上创建共享 VxFS 文件系统][2]**

### 步骤 1：识别文件系统

使用 [df 命令][3] 检查要增加/扩展的文件系统，并记下以下输出中的磁盘组（DG）和卷名称，稍后在运行 `vxdg` 和 `vxresize` 命令时将使用这些名称。

```
# df -hP /data

Filesystem                  Size  Used Avail Use% Mounted on
/dev/vx/dsk/testdg/testvol  9.0G  8.4G 0.6G  95%  /data
```

根据上面的输出，VxFS 文件系统大小为 9.0 GB，我们希望额外扩展 5 GB 并发布此活动，VxFS 大小将为 14 GB。

在本例中，DG 名称为 `testdg`，卷名称为 `testvol`。

### 步骤 2：获取新磁盘/LUN

新磁盘必须由存储团队映射到主机，这可能需要 CR 批准，因此提出 CR 并向相关团队添加必要的任务，并且还包括此活动的回滚计划。

### 步骤 3：扫描磁盘/LUN

存储团队将新 LUN 映射到主机后，获取 LUN id 并将其保存。

使用以下命令扫描 LUN 以在操作系统级别发现它们。

```
for disk_scan in `ls /sys/class/scsi_host`; do 
    echo "Scanning $disk_scan…Completed"
    echo "- - -" > /sys/class/scsi_host/$disk_scan/scan
done
```

```
Scanning host0...Completed
Scanning host1...Completed
.
.
Scanning host[N]...Completed

```

扫描完成后，使用以下命令查看是否在操作系统级别找到给定的 LUN。

```
lsscsi --scsi | grep -i [Last_Five_Digit_of_LUN]
```

### 步骤 4：在 VxVM 中查找磁盘

默认情况下，所有可用磁盘对 Veritas 卷管理器（VxVM）都是可见的，可以使用 `vxdisk` 命令列出这些磁盘，如下所示。

```
# vxdisk -e list

DEVICE       TYPE           DISK        GROUP        STATUS               OS_NATIVE_NAME   ATTR
emc_01       auto:cdsdisk   disk1       testdg       online               sdd              -
emc_02       auto:cdsdisk   disk2       testdg       online               sde              -
emc_03       auto:none      -           -            online invalid       sdf              -
sda          auto:LVM       -           -            LVM                  sda              -
sdb          auto:LVM       -           -            LVM                  sdb              -
```

磁盘 `sdf` 的状态显示为 `Online invalid` 表示该磁盘不受 VxVM 控制。但是，请使用 `smartctl` 命令仔细检查 LUN id，以确保你选择了正确的磁盘。

```
smartctl -a /dev/sd[x]|grep -i unit
```

如果磁盘未填充到 VxVM，请执行以下命令扫描操作系统设备树中的磁盘设备。

```
vxdisk scandisks
```

### 步骤 5：在 VxVM 中初始化磁盘

当磁盘在**步骤 4** 中对 VxVM 可见，那么使用 `vxdisksetup` 命令初始化磁盘，如下所示：

```
vxdisksetup -i sdf
```

上面的命令将磁盘 `sdf` 带到 Veritas 卷管理器（VxVM），并且磁盘状态现在更改为 `online`。

![][4]

### 步骤 6：将磁盘添加到 VxVM 中的磁盘组（DG）

`vxdg` 命令对磁盘组执行各种管理操作。在此示例中，我们将使用它向现有磁盘组（DG）添加新磁盘。

```
vxdg -g [DG_Name] adddisk [Any_Name_to_Disk_as_per_Your_Wish=Device_Name]
```

```
vxdg -g testdg adddisk disk3=emc_03
```

运行上述命令后，磁盘名称为 `disk3` 且磁盘组名称为 `testdg` 已针对 `emc_03` 设备进行更新 如下所示：

```
# vxdisk -e list

DEVICE       TYPE           DISK        GROUP        STATUS               OS_NATIVE_NAME   ATTR
emc_01       auto:cdsdisk   disk1       testdg       online               sdd              -
emc_02       auto:cdsdisk   disk2       testdg       online               sde              -
emc_03       auto:none      disk3       testdg       online               sdf              -
sda          auto:LVM       -           -            LVM                  sda              -
sdb          auto:LVM       -           -            LVM                  sdb              -
```

### 步骤 7：检查磁盘组（DG）中的可用空间

要确定连接卷有多少可用空间，请运行：

```
vxassist -g testdg maxsize
```

### 步骤 8：扩展 VxVM 卷和 VxFS 文件系统

我们为此活动添加了 5GB LUN，因此额外扩展了 VxVM 卷和 VxFS 文件系统 `5GB`，如下所示：

```
vxresize -b -g [DG_Name] [Volume_Name] +[Size_to_be_Increased]
```

```
vxresize -b -g testdg testvol +5g
```

这里：

  * `vxresize`：命令
  * `-b`：在后台执行调整大小操作（可选）。
  * `-g`：将命令的操作限制为给定磁盘组，由磁盘组 ID 或磁盘组名称指定。
  * `testdg`：我们的磁盘组（DG）名称
  * `test`vol`：我们的卷名称
  * `+5g`：此卷将额外增加 5GB。

### 步骤 9：检查扩展 VxFS 文件系统

最后，使用 `df` 命令检查 `/data` 的扩展 VxFS：

```
# df -hP /data

Filesystem                  Size  Used Avail Use% Mounted on
/dev/vx/dsk/testdg/testvol  14G   8.4G 5.6G  68%  /data
```

### 总结

在本教程中，我们向你展示了如何向现有磁盘组（DG）添加新磁盘，以及如何通过几个简单步骤在 Linux 中扩展 VxVM 卷和 VxFS 文件系统。

如果你有任何问题或反馈，请随时在下面发表评论。

*（题图：MJ/3fe4fdb7-99da-4b8f-a818-0ae232e6fbcc）*

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/extend-increase-vxvm-volume-vxfs-filesystem-linux/

作者：[Jayabal Thiyagarajan][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/jayabal/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/create-vxvm-volume-vxfs-filesystem-linux/
[2]: https://www.2daygeek.com/create-veritas-shared-vxfs-file-system-linux/
[3]: https://www.2daygeek.com/linux-check-disk-space-usage-df-command/
[4]: https://www.2daygeek.com/wp-content/uploads/2023/07/extend-increase-vxvm-volume-vxfs-filesystem-linux-1024x201.jpg
[0]: https://img.linux.net.cn/data/attachment/album/202309/17/095154jxqizcscc3xjuzrl.jpg