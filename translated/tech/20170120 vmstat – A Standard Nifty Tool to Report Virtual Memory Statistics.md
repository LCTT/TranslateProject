vmstat：一个标准的报告虚拟内存统计工具
============================================================

### 什么是 RAM？

在智能手机世界，我们每一个人都知道 RAM。因此，我不想深入介绍，这样我就简要概括下。RAM 代表“随机访问内存”（Random Access Memory），是一种计算机数据存储，它会存储经常使用的程序来提升系统性能。

### 什么是虚拟内存？

虚拟内存是一种内存管理方式，计算机通过临时将最近未使用的程序数据从 RAM 转移到硬盘，以平衡或管理内存的短缺。

### 什么是 vmstat？

vmstat 是一个标准的工具，它会报告 Linux 系统的虚拟内存统计。vmstat 会报告有关进程、内存、分页、块 IO、陷阱（中断）和 cpu 活动的信息。它可以帮助 Linux 管理员在解决问题时识别系统瓶颈。

### 在 Linux 中安装 Sysstat

Linux 中没有独立的 `vmstat` 包。它与 `sysstat` 绑定在一起，并在大多数发行版的默认仓库上都有。如果还没有安装，只要基于你的发行版输入下面的命令。

```
[在 CentOS/RHEL 中安装 vmstat]
$ sudo yum install sysstat

[在 Fedora 中安装 vmstat]
$ sudo dnf install sysstat

[在 Debian/Ubuntu 中安装 vmstat]
$ sudo apt-get install sysstat

[在 Arch Linux 中安装 vmstat]
$ sudo pacman -S sysstat

[在 Mageia 中安装 vmstat]
$ sudo urpmi sysstat

[在 openSUSE 中安装 vmstat]
$ sudo zypper install sysstat
```

### 不带参数运行 vmstat

假设你已经成功安装 vmstat，在终端中不带参数运行 `vmstat`，它会向你展示 vmstat 的默认结果。

```
# vmstat
procs -----------memory---------- ---swap-- -----io---- -system-- ----cpu----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa
 2  0  79496 1614120 139240 787928   0    0    23    10    0    0 11  1 88  0
```

当你看到上面的输出，你可能已经大致了解了它是什么以及它的目的。不要担心，我们将深入解释每个参数，以便你可以了解 vmstat 的用途和目的。

`procs`：procs 中有 `r` 和 `b` 列，它报告进程统计信息。在上面的输出中，在运行队列（`r`）中有两个进程在等待 CPU 并有零个休眠进程（`b`）。通常，它不应该超过处理器（或核心）的数量，如果你发现异常，最好使用 [top 命令][1]进一步地排除故障。

* `r`：等待运行的进程数。
* `b`：休眠状态下的进程数。

`memory`： memory 下有报告内存统计的 `swpd`、`free`、`buff` 和 `cache` 列。你可以用 `free -m` 命令看到同样的信息。在上面的内存统计中，统计数据以千字节表示，这有点难以理解，最好添加 `M` 参数来看到以兆字节为单位的统计数据。

* `swpd`：使用的虚拟内存量。
* `free`：空闲内存量。
* `buff`：用作缓冲区的内存量。
* `cache`：用作高速缓存的内存量。
* `inact`：非活动内存的数量。
* `active`：活动内存量。

`swap`：swap 有 `si` 和 `so` 列，用于报告交换内存统计信息。你可以用 `free -m` 命令看到相同的信息。

* `si`：从磁盘交换的内存量（换入，从 swap 移到实际内存的内存）。
* `so`：交换到磁盘的内存量（换出，从实际内存移动到 swap 的内存）。

`I/O`：I/O 有 `bi` 和 `bo` 列，它以“块读取”和“块写入”的单位来报告每秒磁盘读取和写入的块的统计信息。如果你发现有巨大的 I/O 读写，最好使用 [iotop][2] 和 [iostat][3] 命令来查看。

* `bi`：从块设备接收的块数。
* `bo`：发送到块设备的块数。

`system`：system 有 `in` 和 `cs` 列，它报告每秒的系统操作。

* `in`：每秒的系统中断数，包括时钟中断。
* `cs`：发送到块设备的块数。

`CPU`：CPU 有 `cs`、`us`、`sy`、`id` 和 `wa` 列，报告（所用的） CPU 资源占总 CPU 时间的百分比。如果你发现异常，最好使用 `top` 和 `free` 命令。

* `cs`：每秒的系统中断数，包括时钟。
* `us`：发送到块设备的块数。
* `sy`：用作高速缓存的内存量。
* `id`：非活动内存量。
* `wa`：活动内存量。

### 以 MB 方式输出

默认情况下，vmstat 以千字节为单位显示内存统计，这是非常难以理解的，最好添加 `-S m` 参数以获取以兆字节为单位的统计。

```
# vmstat -S m
procs -----------memory---------- ---swap-- -----io---- -system-- ----cpu----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa
 1  0    103    371    406   2116    0    0    40    15    0    0 11  1 87  0
```

### 以延迟方式运行 vmstat 获取更好的统计信息

默认情况下，vmstat 的单次统计信息不足以进一步进行故障排除，因此，添加更新延迟（延迟是更新之间的延迟，以秒为单位）以定期捕获活动。如果你想以 2 秒延迟运行 vmstat ，只需使用下面的命令（如果你想要更长的延迟，你可以根据你的愿望改变）。

以下命令将每 2 秒运行一次，直到退出。

```
# vmstat 2
procs -----------memory---------- ---swap-- -----io---- -system-- ----cpu----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa
 1  0 105500 325776 416016 2166912   0    0    40    15    0    0 11  1 87  0
 0  0 105500 325644 416016 2166920   0    0     0    13 1083 1174 11  1 87  0
 0  0 105500 308648 416024 2166928   0    0     1    16 1559 1453 16  2 82  0
 0  0 105500 285948 416032 2166932   0    0     0    12  934 1003  9  1 90  0
 0  0 105500 326620 416040 2166940   0    0     1    27  922 1068  9  1 90  0
 0  0 105500 366704 416048 2166944   0    0     0    17  835  955  9  1 90  0
 0  0 105500 366456 416056 2166948   0    0     1    22  859  918  9  1 90  0
 0  0 105500 366456 416056 2166948   0    0     0    15 1539 1504 17  2 81  0
 0  0 105500 365224 416060 2166996   0    0     1    19  984 1097 11  1 88  0
```

### 带延迟和计数运行 vmstat

或者，你可以带延迟和特定计数运行 vmstat，一旦达到给定的计数，然后自动退出。

以下命令将每 2 秒运行一次，10 次后自动退出。

```
# vmstat 2 10
procs -----------memory---------- ---swap-- -----io---- -system-- ----cpu----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa
 1  0  79496 1581916 157380 810412   0    0    23    10    0    1 11  1 88  0
 2  0  79496 1559464 157380 810416   0    0     1     1 1821 1749 21  2 77  0
 0  0  79496 1583768 157384 810416   0    0     1    46  681  799  9  1 90  0
 2  0  79496 1556364 157384 810428   0    0     1     1 1392 1545 15  2 83  0
 0  0  79496 1583272 157384 810428   0    0     1     0 1307 1448 14  2 84  0
 2  0  79496 1582032 157384 810428   0    0     1    41  424  605  4  1 96  0
 1  0  79496 1575848 157384 810428   0    0     1     0 1912 2407 26  2 71  0
 0  0  79496 1582884 157384 810436   0    0     1    69  678  825  9  1 90  0
 2  0  79496 1569368 157392 810432   0    0    11    26  920  969  9  1 90  0
 1  0  79496 1583612 157400 810444   0    0     7    39 2001 2530 20  2 77  0
```

### 显示活动和非活动内存

默认情况下，vmstat 会显示除活动和非活动内存之外的内存统计信息。如果要查看活动和非活动内存统计信息，请在 vmstat 后添加 `-a` 参数。

```
# vmstat -a
procs -----------memory---------- ---swap-- -----io---- -system-- ----cpu----
 r  b   swpd   free  inact active   si   so    bi    bo   in   cs us sy id wa
 1  0 105500 2387592 415148 584112   0    0    40    15    0    1 11  1 87  0
```

### 打印磁盘统计

在 vmstat 后面添加 `-d` 参数会以每个磁盘一行的方式显示统计（包含读、写和 IO）。

```
# vmstat -d
disk- ------------reads------------ ------------writes----------- -----IO------
       total merged sectors      ms  total merged sectors      ms    cur    sec
ram0       0      0       0       0      0      0       0       0      0      0
ram1       0      0       0       0      0      0       0       0      0      0
ram2       0      0       0       0      0      0       0       0      0      0
ram3       0      0       0       0      0      0       0       0      0      0
ram4       0      0       0       0      0      0       0       0      0      0
ram5       0      0       0       0      0      0       0       0      0      0
ram6       0      0       0       0      0      0       0       0      0      0
ram7       0      0       0       0      0      0       0       0      0      0
ram8       0      0       0       0      0      0       0       0      0      0
ram9       0      0       0       0      0      0       0       0      0      0
ram10      0      0       0       0      0      0       0       0      0      0
ram11      0      0       0       0      0      0       0       0      0      0
ram12      0      0       0       0      0      0       0       0      0      0
ram13      0      0       0       0      0      0       0       0      0      0
ram14      0      0       0       0      0      0       0       0      0      0
ram15      0      0       0       0      0      0       0       0      0      0
loop0      0      0       0       0      0      0       0       0      0      0
loop1      0      0       0       0      0      0       0       0      0      0
loop2      0      0       0       0      0      0       0       0      0      0
loop3      0      0       0       0      0      0       0       0      0      0
loop4      0      0       0       0      0      0       0       0      0      0
loop5      0      0       0       0      0      0       0       0      0      0
loop6      0      0       0       0      0      0       0       0      0      0
loop7      0      0       0       0      0      0       0       0      0      0
fd0        0      0       0       0      0      0       0       0      0      0
sda   16604050 904497 2594882190 57455732 30037054 28093770 2160032056 118189160      0  40915
sdb   257357577 479985 3124712204 577235320 8502519 1283237 36645890 11250948      0 182336
```

### 总结磁盘统计

在 vmstat 后面添加 `-D` 会显示全局统计（包括全部的磁盘、分区、全部读、合并的读、读取的扇区、写、合并的写、写入的扇区和 IO）。

```
# vmstat -D
           27 disks
            3 partitions
    275754028 total reads
      1388030 merged reads
   5751195976 read sectors
    638710116 milli reading
     38795040 writes
     29520659 merged writes
   2209820333 written sectors
    130210652 milli writing
            0 inprogress IO
       224704 milli spent IO
```

### 打印指定分区统计

vmstat 添加 `-p` 参数后面跟上设备名会显示指定分区统计（包括读、读取的扇区、写以及请求的写）。

```
# vmstat -p /dev/sdb1
sdb1          reads   read sectors  writes    requested writes
                3115      27890     839453  206728016
```

### vmstat 统计信息带上时间戳

当你想在特定时间区间内找到内存尖峰时，用 vmstat 命令添加 `-t` 参数，后跟延迟和计数。

注意：此组合不适用于基于 Debian 的系统。

```
# vmstat -t 1 5
procs -----------memory---------- ---swap-- -----io---- --system-- -----cpu------ ---timestamp---
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
 0  0      0 6981416 181324 24588604    0    0     0     1    0    0  0  0 100  0  0    2017-01-11 15:42:15 MST
 2  0      0 6981276 181324 24588604    0    0     0     0   91   40  0  0 100  0  0    2017-01-11 15:42:16 MST
 0  0      0 6982016 181324 24588604    0    0     0     0   75  116  0  0 100  0  0    2017-01-11 15:42:17 MST
 0  0      0 6982016 181324 24588604    0    0     0     0   43   39  0  0 100  0  0    2017-01-11 15:42:18 MST
 0  0      0 6982280 181324 24588604    0    0     0     0  113  185  0  0 100  0  0    2017-01-11 15:42:19 MST
```

### 打印更多统计

vmstat 后面跟上 `-s` 参数会显示不同统计的总结。

```
# vmstat -s
     32849392  total memory
     25864128  used memory
     16468180  active memory
      8320888  inactive memory
      6985264  free memory
       181324  buffer memory
     24588612  swap cache
     20970492  total swap
            0  used swap
     20970492  free swap
       891075 non-nice user cpu ticks
         6532 nice user cpu ticks
      1507099 system cpu ticks
  18925265601 idle cpu ticks
       113043 IO-wait cpu ticks
          108 IRQ cpu ticks
         4185 softirq cpu ticks
            0 stolen cpu ticks
      4071862 pages paged in
    216759718 pages paged out
            0 pages swapped in
            0 pages swapped out
    369611221 interrupts
    477861261 CPU context switches
   1478258826 boot time
      2196121 forks
```

### 打印 slab 统计

vmstat 后面跟上 `-m` 参数会显示 slab 信息。

```
# vmstat -m
Cache                       Num  Total   Size  Pages
nf_conntrack_expect           0      0    240     16
nf_conntrack_ffffffff81b2a920     18     60    312     12
fib6_nodes                   24     59     64     59
ip6_dst_cache                16     30    384     10
ndisc_cache                   7     30    256     15
ip6_mrt_cache                 0      0    128     30
RAWv6                        35     35   1088      7
UDPLITEv6                     0      0   1024      4
UDPv6                         4     12   1024      4
tw_sock_TCPv6                 0      0    320     12
request_sock_TCPv6            0      0    192     20
TCPv6                         4      6   1920      2
fat_inode_cache               5      6    672      6
fat_cache                     0      0     32    112
ioat2                      4096   4140    128     30
ext4_inode_cache          34322  34364   1000      4
ext4_xattr                    0      0     88     44
.
.
.
```

### 阅读更多关于 vmstat

如果你想了解关于 vmstat 的更多选项，请阅读手册。

```
# vmstat --help
或者
# man vmstat
```

--------------------------------------------------------------------------------

作者简介：

![](http://1.gravatar.com/avatar/d487bef1de15143a7b80a40396e96118?s=256&d=mm&r=g)

热爱玩所有的 Linux 发行版

--------------------------------------------------------------------------------

via: http://www.2daygeek.com/linux-vmstat-command-examples-tool-report-virtual-memory-statistics/

作者：[Magesh Maruthamuthu][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/author/magesh/
[1]:http://www.2daygeek.com/top-command-examples-to-monitor-server-
[2]:http://www.2daygeek.com/monitor-disk-io-activity-using-iotop-
[3]:http://www.2daygeek.com/monitor-disk-io-activity-using-iotop-
[4]:https://en.wikipedia.org/wiki/Virtual_memory
[5]:http://www.2daygeek.com/sar-command-examples-system-performance-monitoring-linux/
