Linux 系统上交换空间的介绍
======

> 学习如何修改你的系统上的交换空间的容量，以及你到底需要多大的交换空间。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fail_progress_cycle_momentum_arrow.png?itok=q-ZFa_Eh)

当今无论什么操作系统<ruby>交换<rt>Swap</rt></ruby>空间是非常常见的。Linux 使用交换空间来增加主机可用的虚拟内存。它可以在常规文件或逻辑卷上使用一个或多个专用交换分区或交换文件。 

典型计算机中有两种基本类型的内存。第一种类型，随机存取存储器 (RAM)，用于存储计算机使用的数据和程序。只有程序和数据存储在 RAM 中，计算机才能使用它们。随机存储器是易失性存储器；也就是说，如果计算机关闭了，存储在 RAM 中的数据就会丢失。

硬盘是用于长期存储数据和程序的磁性介质。该磁介质可以很好的保存数据；即使计算机断电，存储在磁盘上的数据也会保留下来。CPU（中央处理器）不能直接访问硬盘上的程序和数据；它们必须首先复制到 RAM 中，RAM 是 CPU 访问代码指令和操作数据的地方。在引导过程中，计算机将特定的操作系统程序（如内核、init 或 systemd）以及硬盘上的数据复制到 RAM 中，在 RAM 中，计算机的处理器 CPU 可以直接访问这些数据。

### 交换空间

交换空间是现代 Linux 系统中的第二种内存类型。交换空间的主要功能是当全部的 RAM 被占用并且需要更多内存时，用磁盘空间代替 RAM 内存。

例如，假设你有一个 8GB RAM 的计算机。如果你启动的程序没有填满 RAM，一切都好，不需要交换。假设你在处理电子表格，当添加更多的行时，你电子表格会增长，加上所有正在运行的程序，将会占用全部的 RAM 。如果这时没有可用的交换空间，你将不得不停止处理电子表格，直到关闭一些其他程序来释放一些 RAM 。 

内核使用一个内存管理程序来检测最近没有使用的内存块（内存页）。内存管理程序将这些相对不经常使用的内存页交换到硬盘上专门指定用于“分页”或交换的特殊分区。这会释放 RAM，为输入电子表格更多数据腾出了空间。那些换出到硬盘的内存页面被内核的内存管理代码跟踪，如果需要，可以被分页回 RAM。

Linux 计算机中的内存总量是 RAM + 交换分区，交换分区被称为虚拟内存.

### Linux 交换分区类型

Linux 提供了两种类型的交换空间。默认情况下，大多数 Linux 在安装时都会创建一个交换分区，但是也可以使用一个特殊配置的文件作为交换文件。交换分区顾名思义就是一个标准磁盘分区，由 `mkswap` 命令指定交换空间。 

如果没有可用磁盘空间来创建新的交换分区，或者卷组中没有空间为交换空间创建逻辑卷，则可以使用交换文件。这只是一个创建好并预分配指定大小的常规文件。然后运行 `mkswap` 命令将其配置为交换空间。除非绝对必要，否则我不建议使用文件来做交换空间。（LCTT 译注：Ubuntu 近来的版本采用了交换文件而非交换空间，所以我对于这种说法保留看法）

### 频繁交换

当总虚拟内存（RAM 和交换空间）变得快满时，可能会发生频繁交换。系统花了太多时间在交换空间和 RAM 之间做内存块的页面切换，以至于几乎没有时间用于实际工作。这种情况的典型症状是：系统变得缓慢或完全无反应，硬盘指示灯几乎持续亮起。

使用 `free` 的命令来显示 CPU 负载和内存使用情况，你会发现 CPU 负载非常高，可能达到系统中 CPU 内核数量的 30 到 40 倍。另一个情况是 RAM 和交换空间几乎完全被分配了。

事实上，查看 SAR（系统活动报告）数据也可以显示这些内容。在我的每个系统上都安装 SAR ，并将这些用于数据分析。

### 交换空间的正确大小是多少？ 

许多年前，硬盘上分配给交换空间大小是计算机上的 RAM 的两倍（当然，这是大多数计算机的 RAM 以 KB 或 MB 为单位的时候）。因此，如果一台计算机有 64KB 的 RAM，应该分配 128KB 的交换分区。该规则考虑到了这样的事实情况，即 RAM 大小在当时非常小，分配超过 2 倍的 RAM 用于交换空间并不能提高性能。使用超过两倍的 RAM 进行交换，比实际执行有用的工作的时候，大多数系统将花费更多的时间。

RAM 现在已经很便宜了，如今大多数计算机的 RAM 都达到了几十亿字节。我的大多数新电脑至少有 8GB 内存，一台有 32GB 内存，我的主工作站有 64GB 内存。我的旧电脑有 4 到 8GB 的内存。

当操作具有大量 RAM 的计算机时，交换空间的限制性能系数远低于 2 倍。[Fedora 28 在线安装指南][1] 定义了当前关于交换空间分配的方法。下面内容是我提出的建议。

下表根据系统中的 RAM 大小以及是否有足够的内存让系统休眠，提供了交换分区的推荐大小。建议的交换分区大小是在安装过程中自动建立的。但是，为了满足系统休眠，您需要在自定义分区阶段编辑交换空间。

_表 1: Fedora 28 文档中推荐的系统交换空间_

| **系统内存大小**           | **推荐的交换空间**            | **推荐的交换空间大小（支持休眠模式）**     |
|--------------------------|-----------------------------|---------------------------------------|
| 小于 2 GB                 | 2 倍 RAM                     | 3 倍 RAM                              |
| 2 GB - 8 GB              | 等于 RAM 大小                |  2 倍 RAM                             |
| 8 GB - 64 GB             | 0.5 倍 RAM 	                 | 1.5 倍 RAM                            |
| 大于 64 GB                | 工作量相关                   | 不建议休眠模式                          |

在上面列出的每个范围之间的边界(例如，具有 2GB、8GB 或 64GB 的系统 RAM)，请根据所选交换空间和支持休眠功能请谨慎使用。如果你的系统资源允许，增加交换空间可能会带来更好的性能。

当然，大多数 Linux 管理员对多大的交换空间量有自己的想法。下面的表2 包含了基于我在多种环境中的个人经历所做出的建议。这些可能不适合你，但是和表 1 一样，它们可能对你有所帮助。


_表 2: 作者推荐的系统交换空间_

| RAM 大小       | 推荐的交换空间           |
|---------------|------------------------|
| ≤ 2GB         | 2X RAM                 |
| 2GB – 8GB     | = RAM                  |
| >8GB          | 8GB                    |


这两个表中共同点，随着 RAM 数量的增加，超过某一点增加更多交换空间只会导致在交换空间几乎被全部使用之前就发生频繁交换。根据以上建议，则应尽可能添加更多 RAM，而不是增加更多交换空间。如类似影响系统性能的情况一样，请使用最适合你的建议。根据 Linux 环境中的条件进行测试和更改是需要时间和精力的。

###  向非 LVM 磁盘环境添加更多交换空间

面对已安装 Linux 的主机并对交换空间的需求不断变化，有时有必要修改系统定义的交换空间的大小。此过程可用于需要增加交换空间大小的任何情况。它假设有足够的可用磁盘空间。此过程还假设磁盘分区为 “原始的” EXT4 和交换分区，而不是使用逻辑卷管理（LVM）。

基本步骤很简单:

  1. 关闭现有的交换空间。
  2. 创建所需大小的新交换分区。
  3. 重读分区表。
  4. 将分区配置为交换空间。
  5. 添加新分区到 `/etc/fstab`。
  6. 打开交换空间。

应该不需要重新启动机器。

为了安全起见，在关闭交换空间前，至少你应该确保没有应用程序在运行，也没有交换空间在使用。`free` 或 `top` 命令可以告诉你交换空间是否在使用中。为了更安全，您可以恢复到运行级别 1 或单用户模式。

使用关闭所有交换空间的命令关闭交换分区：

```
swapoff -a
```

现在查看硬盘上的现有分区。

```
fdisk -l
```

这将显示每个驱动器上的分区表。按编号标识当前的交换分区。

使用以下命令在交互模式下启动 `fdisk`：

```
fdisk /dev/<device name>
```

例如：

```
fdisk /dev/sda
```

此时，`fdisk`  是交互方式的，只在指定的磁盘驱动器上进行操作。

使用 `fdisk` 的 `p` 子命令验证磁盘上是否有足够的可用空间来创建新的交换分区。硬盘上的空间以 512 字节的块以及起始和结束柱面编号的形式显示，因此您可能需要做一些计算来确定分配分区之间和末尾的可用空间。

使用 `n` 子命令创建新的交换分区。`fdisk` 会问你开始柱面。默认情况下，它选择编号最低的可用柱面。如果你想改变这一点，输入开始柱面的编号。

`fdisk` 命令允许你以多种格式输入分区的大小，包括最后一个柱面号或字节、KB 或 MB 的大小。例如，键入 4000M ，这将在新分区上提供大约 4GB 的空间，然后按回车键。

使用 `p` 子命令来验证分区是否按照指定的方式创建的。请注意，除非使用结束柱面编号，否则分区可能与你指定的不完全相同。`fdisk` 命令只能在整个柱面上增量的分配磁盘空间，因此你的分区可能比你指定的稍小或稍大。如果分区不是您想要的，你可以删除它并重新创建它。

现在指定新分区是交换分区了 。子命令 `t` 允许你指定定分区的类型。所以输入 `t`，指定分区号，当它要求十六进制分区类型时，输入 `82`，这是 Linux 交换分区类型，然后按回车键。

当你对创建的分区感到满意时，使用 `w` 子命令将新的分区表写入磁盘。`fdisk` 程序将退出，并在完成修改后的分区表的编写后返回命令提示符。当 `fdisk` 完成写入新分区表时，会收到以下消息:

```
The partition table has been altered!
Calling ioctl() to re-read partition table.
WARNING: Re-reading the partition table failed with error 16: Device or resource busy.
The kernel still uses the old table.
The new table will be used at the next reboot.
Syncing disks.
```

此时，你使用 `partprobe` 命令强制内核重新读取分区表，这样就不需要执行重新启动机器。

```
partprobe
```

使用命令 `fdisk -l` 列出分区，新交换分区应该在列出的分区中。确保新的分区类型是 “Linux swap”。

修改 `/etc/fstab` 文件以指向新的交换分区。如下所示：

```
LABEL=SWAP-sdaX   swap        swap    defaults        0 0
```

其中 `X` 是分区号。根据新交换分区的位置，添加以下内容：

```
/dev/sdaY         swap        swap    defaults        0 0
```

请确保使用正确的分区号。现在，可以执行创建交换分区的最后一步。使用 `mkswap` 命令将分区定义为交换分区。

```
mkswap /dev/sdaY
```

最后一步是使用以下命令启用交换空间：

```
swapon -a
```

你的新交换分区现在与以前存在的交换分区一起在线。您可以使用 `free` 或`top` 命令来验证这一点。

#### 在 LVM 磁盘环境中添加交换空间

如果你的磁盘使用 LVM ，更改交换空间将相当容易。同样，假设当前交换卷所在的卷组中有可用空间。默认情况下，LVM 环境中的 Fedora Linux 在安装过程将交换分区创建为逻辑卷。您可以非常简单地增加交换卷的大小。

以下是在 LVM 环境中增加交换空间大小的步骤:

  1. 关闭所有交换空间。
  2. 增加指定用于交换空间的逻辑卷的大小。
  3. 为交换空间调整大小的卷配置。
  4. 启用交换空间。 

首先，让我们使用 `lvs`  命令（列出逻辑卷）来验证交换空间是否存在以及交换空间是否是逻辑卷。

```
[root@studentvm1 ~]# lvs
  LV     VG                Attr       LSize  Pool   Origin Data%  Meta%  Move Log Cpy%Sync Convert
  home   fedora_studentvm1 -wi-ao----  2.00g                                                      
  pool00 fedora_studentvm1 twi-aotz--  2.00g               8.17   2.93                            
  root   fedora_studentvm1 Vwi-aotz--  2.00g pool00        8.17                                   
  swap   fedora_studentvm1 -wi-ao----  8.00g                                                      
  tmp    fedora_studentvm1 -wi-ao----  5.00g                                                      
  usr    fedora_studentvm1 -wi-ao---- 15.00g                                                      
  var    fedora_studentvm1 -wi-ao---- 10.00g                                                      
[root@studentvm1 ~]#
```

你可以看到当前的交换空间大小为 8GB。在这种情况下，我们希望将 2GB 添加到此交换卷中。首先，停止现有的交换空间。如果交换空间正在使用，终止正在运行的程序。

```
swapoff -a
```

现在增加逻辑卷的大小。

```
[root@studentvm1 ~]# lvextend -L +2G /dev/mapper/fedora_studentvm1-swap
  Size of logical volume fedora_studentvm1/swap changed from 8.00 GiB (2048 extents) to 10.00 GiB (2560 extents).
  Logical volume fedora_studentvm1/swap successfully resized.
[root@studentvm1 ~]#
```

运行 `mkswap` 命令将整个 10GB 分区变成交换空间。

```
[root@studentvm1 ~]# mkswap /dev/mapper/fedora_studentvm1-swap
mkswap: /dev/mapper/fedora_studentvm1-swap: warning: wiping old swap signature.
Setting up swapspace version 1, size = 10 GiB (10737414144 bytes)
no label, UUID=3cc2bee0-e746-4b66-aa2d-1ea15ef1574a
[root@studentvm1 ~]#
```

重新启用交换空间。

```
[root@studentvm1 ~]# swapon -a
[root@studentvm1 ~]#
```

现在，使用 `lsblk ` 命令验证新交换空间是否存在。同样，不需要重新启动机器。

```
[root@studentvm1 ~]# lsblk
NAME                                 MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                                    8:0    0   60G  0 disk
|-sda1                                 8:1    0    1G  0 part /boot
`-sda2                                 8:2    0   59G  0 part
  |-fedora_studentvm1-pool00_tmeta   253:0    0    4M  0 lvm  
  | `-fedora_studentvm1-pool00-tpool 253:2    0    2G  0 lvm  
  |   |-fedora_studentvm1-root       253:3    0    2G  0 lvm  /
  |   `-fedora_studentvm1-pool00     253:6    0    2G  0 lvm  
  |-fedora_studentvm1-pool00_tdata   253:1    0    2G  0 lvm  
  | `-fedora_studentvm1-pool00-tpool 253:2    0    2G  0 lvm  
  |   |-fedora_studentvm1-root       253:3    0    2G  0 lvm  /
  |   `-fedora_studentvm1-pool00     253:6    0    2G  0 lvm  
  |-fedora_studentvm1-swap           253:4    0   10G  0 lvm  [SWAP]
  |-fedora_studentvm1-usr            253:5    0   15G  0 lvm  /usr
  |-fedora_studentvm1-home           253:7    0    2G  0 lvm  /home
  |-fedora_studentvm1-var            253:8    0   10G  0 lvm  /var
  `-fedora_studentvm1-tmp            253:9    0    5G  0 lvm  /tmp
sr0                                   11:0    1 1024M  0 rom  
[root@studentvm1 ~]#
```

您也可以使用 `swapon -s` 命令或 `top`、`free` 或其他几个命令来验证这一点。

```
[root@studentvm1 ~]# free
              total        used        free      shared  buff/cache   available
Mem:        4038808      382404     2754072        4152      902332     3404184
Swap:      10485756           0    10485756
[root@studentvm1 ~]#
```

请注意，不同的命令以不同的形式显示或要求输入设备文件。在 `/dev` 目录中访问特定设备有多种方式。在我的文章 [在 Linux 中管理设备][2] 中有更多关于 `/dev` 目录及其内容说明。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/swap-space-linux-systems

作者：[David Both][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[heguangzhi](https://github.com/heguangzhi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[1]: https://docs.fedoraproject.org/en-US/fedora/f28/install-guide/
[2]: https://linux.cn/article-8099-1.html
