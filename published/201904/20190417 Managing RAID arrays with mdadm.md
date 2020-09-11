[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10785-1.html)
[#]: subject: (Managing RAID arrays with mdadm)
[#]: via: (https://fedoramagazine.org/managing-raid-arrays-with-mdadm/)
[#]: author: (Gregory Bartholomew https://fedoramagazine.org/author/glb/)

使用 mdadm 管理 RAID 阵列
======

![][1]

mdadm 是<ruby>多磁盘和设备管理<rt>Multiple Disk and Device Administration</rt></ruby> 的缩写。它是一个命令行工具，可用于管理 Linux 上的软件 [RAID][2] 阵列。本文概述了使用它的基础知识。

以下 5 个命令是你使用 mdadm 的基础功能：

1. **创建 RAID 阵列**：`mdadm --create /dev/md/test --homehost=any --metadata=1.0 --level=1 --raid-devices=2 /dev/sda1 /dev/sdb1`
2. **组合（并启动）RAID 阵列**：`mdadm --assemble /dev/md/test /dev/sda1 /dev/sdb1`
3. **停止 RAID 阵列**：`mdadm --stop /dev/md/test`
4. **删除 RAID 阵列**：`mdadm --zero-superblock /dev/sda1 /dev/sdb1`
5. **检查所有已组合的 RAID 阵列的状态**：`cat /proc/mdstat`

### 功能说明

#### mdadm --create

上面的创建命令除了 `-create` 参数自身和设备名之外，还包括了四个参数：

1、`–homehost`：

默认情况下，`mdadm` 将你的计算机名保存为 RAID 阵列的属性。如果你的计算机名与存储的名称不匹配，则阵列将不会自动组合。此功能在共享硬盘的服务器群集中很有用，因为如果多个服务器同时尝试访问同一驱动器，通常会发生文件系统损坏。名称 `any` 是保留字段，并禁用 `-homehost` 限制。

2、 `–metadata`：

`-mdadm` 保留每个 RAID 设备的一小部分空间，以存储有关 RAID 阵列本身的信息。 `-metadata` 参数指定信息的格式和位置。`1.0` 表示使用版本 1 格式，并将元数据存储在设备的末尾。

3、`–level`：

`-level` 参数指定数据应如何在底层设备之间分布。级别 `1` 表示每个设备应包含所有数据的完整副本。此级别也称为[磁盘镜像] [3]。

4、`–raid-devices`：

`-raid-devices` 参数指定将用于创建 RAID 阵列的设备数。

通过将 `-level=1`（镜像）与 `-metadata=1.0` （将元数据存储在设备末尾）结合使用，可以创建一个 RAID1 阵列，如果不通过 mdadm 驱动访问，那么它的底层设备会正常显示。这在灾难恢复的情况下很有用，因为即使新系统不支持 mdadm 阵列，你也可以访问该设备。如果程序需要在 mdadm 可用之前以*只读*访问底层设备时也很有用。例如，计算机中的 [UEFI][4] 固件可能需要在启动 mdadm 之前从 [ESP][5] 读取引导加载程序。

#### mdadm --assemble

如果成员设备丢失或损坏，上面的组合命令将会失败。要强制 RAID 阵列在其中一个成员丢失时进行组合并启动，请使用以下命令：

```
# mdadm --assemble --run /dev/md/test /dev/sda1
```

### 其他重要说明

避免直接写入底层是 RAID1 的设备。这导致设备不同步，并且 mdadm 不会知道它们不同步。如果你访问了在其他地方被修改了设备的某个 RAID1 阵列，则可能导致文件系统损坏。如果你在其他地方修改 RAID1 设备并需要强制阵列重新同步，请从要覆盖的设备中删除 mdadm 元数据，然后将其重新添加到阵列，如下所示：

```
# mdadm --zero-superblock /dev/sdb1
# mdadm --assemble --run /dev/md/test /dev/sda1
# mdadm /dev/md/test --add /dev/sdb1
```

以上用 sda1 的内容完全覆盖 sdb1 的内容。

要指定在计算机启动时自动激活的 RAID 阵列，请创建 `/etc/mdadm.conf` 配置。

有关最新和详细信息，请查看手册页：

```
$ man mdadm
$ man mdadm.conf
```

本系列的下一篇文章将展示如何将现有的单磁盘 Linux 系统变为镜像磁盘安装，这意味着即使其中一个硬盘突然停止工作，系统仍将继续运行！

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/managing-raid-arrays-with-mdadm/

作者：[Gregory Bartholomew][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/glb/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/04/mdadm-816x345.jpg
[2]: https://en.wikipedia.org/wiki/RAID
[3]: https://en.wikipedia.org/wiki/Disk_mirroring
[4]: https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface
[5]: https://en.wikipedia.org/wiki/EFI_system_partition
