[#]: collector: (lujun9972)
[#]: translator: (leommxj)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10571-1.html)
[#]: subject: (How to determine how much memory is installed, used on Linux systems)
[#]: via: (https://www.networkworld.com/article/3336174/linux/how-much-memory-is-installed-and-being-used-on-your-linux-systems.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

如何在 Linux 系统中判断安装、使用了多少内存
======

> 有几个命令可以报告在 Linux 系统上安装和使用了多少内存。根据你使用的命令，你可能会被细节淹没，也可能获得快速简单的答案。

![](https://images.idgesg.net/images/article/2019/02/memory-100787327-large.jpg)

在 Linux 系统中有很多种方法获取有关安装了多少内存的信息及查看多少内存正在被使用。有些命令提供了大量的细节，而其他命令提供了简洁但不一定易于理解的答案。在这篇文章中，我们将介绍一些查看内存及其使用状态的有用的工具。

在我们开始之前，让我们先来回顾一些基础知识。物理内存和虚拟内存并不是一回事。后者包括配置为交换空间的磁盘空间。交换空间可能包括为此目的特意留出来的分区，以及在创建新的交换分区不可行时创建的用来增加可用交换空间的文件。有些 Linux 命令会提供关于两者的信息。

当物理内存占满时，交换空间通过提供可以用来存放内存中非活动页的磁盘空间来扩展内存。

`/proc/kcore` 是在内存管理中起作用的一个文件。这个文件看上去是个普通文件（虽然非常大），但它并不占用任何空间。它就像其他 `/proc` 下的文件一样是个虚拟文件。

```
$ ls -l /proc/kcore
-r--------. 1 root root 140737477881856 Jan 28 12:59 /proc/kcore
```

有趣的是，下面查询的两个系统并没有安装相同大小的内存，但 `/proc/kcore` 的大小却是相同的。第一个系统安装了 4 GB 的内存，而第二个系统安装了 6 GB。

```
system1$ ls -l /proc/kcore
-r--------. 1 root root 140737477881856 Jan 28 12:59 /proc/kcore
system2$ ls -l /proc/kcore
-r--------  1 root root 140737477881856 Feb  5 13:00 /proc/kcore
```

一种不靠谱的解释说这个文件代表可用虚拟内存的大小（没准要加 4 KB），如果这样，这些系统的虚拟内存可就是 128TB 了！这个数字似乎代表了 64 位系统可以寻址多少内存，而不是当前系统有多少可用内存。在命令行中计算 128 TB 和这个文件大小加上 4 KB 很容易。

```
$ expr 1024 \* 1024 \* 1024 \* 1024 \* 128
140737488355328
$ expr 1024 \* 1024 \* 1024 \* 1024 \* 128 + 4096
140737488359424
```

另一个用来检查内存的更人性化的命令是 `free`。它会给出一个易于理解的内存报告。

```
$ free
              total        used        free      shared  buff/cache   available
Mem:        6102476      812244     4090752       13112     1199480     4984140
Swap:       2097148           0     2097148
```

使用 `-g` 选项，`free` 会以 GB 为单位返回结果。

```
$ free -g
              total        used        free      shared  buff/cache   available
Mem:              5           0           3           0           1           4
Swap:             1           0           1
```

使用 `-t` 选项，`free` 会显示与无附加选项时相同的值（不要把 `-t` 选项理解成 TB），并额外在输出的底部添加一行总计数据。

```
$ free -t
              total        used        free      shared  buff/cache   available
Mem:        6102476      812408     4090612       13112     1199456     4983984
Swap:       2097148           0     2097148
Total:      8199624      812408     6187760
```

当然，你也可以选择同时使用两个选项。

```
$ free -tg
              total        used        free      shared  buff/cache   available
Mem:              5           0           3           0           1           4
Swap:             1           0           1
Total:            7           0           5
```

如果你尝试用这个报告来解释“这个系统安装了多少内存？”，你可能会感到失望。上面的报告就是在前文说的装有 6 GB 内存的系统上运行的结果。这并不是说这个结果是错的，这就是系统对其可使用的内存的看法。

`free` 命令也提供了每隔 X 秒刷新显示的选项（下方示例中 X 为 10）。

```
$ free -s 10
              total        used        free      shared  buff/cache   available
Mem:        6102476      812280     4090704       13112     1199492     4984108
Swap:       2097148           0     2097148

              total        used        free      shared  buff/cache   available
Mem:        6102476      812260     4090712       13112     1199504     4984120
Swap:       2097148           0     2097148
```

使用 `-l` 选项，`free` 命令会提供高低内存使用信息。

```
$ free -l
              total        used        free      shared  buff/cache   available
Mem:        6102476      812376     4090588       13112     1199512     4984000
Low:        6102476     2011888     4090588
High:             0           0           0
Swap:       2097148           0     2097148
```

查看内存的另一个选择是 `/proc/meminfo` 文件。像 `/proc/kcore` 一样，这也是一个虚拟文件，它可以提供关于安装或使用了多少内存以及可用内存的报告。显然，空闲内存和可用内存并不是同一回事。`MemFree` 看起来代表未使用的 RAM。`MemAvailable` 则是对于启动新程序时可使用的内存的一个估计。

```
$ head -3 /proc/meminfo
MemTotal: 6102476 kB
MemFree: 4090596 kB
MemAvailable: 4984040 kB
```

如果只想查看内存总计，可以使用下面的命令之一：

```
$ awk '/MemTotal/ {print $2}' /proc/meminfo
6102476
$ grep MemTotal /proc/meminfo
MemTotal: 6102476 kB
```

`DirectMap` 将内存信息分为几类。

```
$ grep DirectMap /proc/meminfo
DirectMap4k: 213568 kB
DirectMap2M: 6076416 kB
```

`DirectMap4k` 代表被映射成标准 4 k 页的内存大小，`DirectMap2M` 则显示了被映射为 2 MB 的页的内存大小。

`getconf` 命令将会提供比我们大多数人想要看到的更多的信息。

```
$ getconf -a | more
LINK_MAX 65000
_POSIX_LINK_MAX 65000
MAX_CANON 255
_POSIX_MAX_CANON 255
MAX_INPUT 255
_POSIX_MAX_INPUT 255
NAME_MAX 255
_POSIX_NAME_MAX 255
PATH_MAX 4096
_POSIX_PATH_MAX 4096
PIPE_BUF 4096
_POSIX_PIPE_BUF 4096
SOCK_MAXBUF
_POSIX_ASYNC_IO
_POSIX_CHOWN_RESTRICTED 1
_POSIX_NO_TRUNC 1
_POSIX_PRIO_IO
_POSIX_SYNC_IO
_POSIX_VDISABLE 0
ARG_MAX 2097152
ATEXIT_MAX 2147483647
CHAR_BIT 8
CHAR_MAX 127
--More--
```

使用类似下面的命令来将其输出精简为指定的内容，你会得到跟前文提到的其他命令相同的结果。

```
$ getconf -a | grep PAGES | awk 'BEGIN {total = 1} {if (NR == 1 || NR == 3) total *=$NF} END {print total / 1024" kB"}'
6102476 kB
```

上面的命令通过将下方输出的第一行和最后一行的值相乘来计算内存。

```
PAGESIZE                           4096    <==
_AVPHYS_PAGES                      1022511
_PHYS_PAGES                        1525619 <==
```

自己动手计算一下，我们就知道这个值是怎么来的了。

```
$ expr 4096 \* 1525619 / 1024
6102476
```

显然值得为以上的指令之一设置个 `alias`。 

另一个具有非常易于理解的输出的命令是 `top` 。在 `top` 输出的前五行，你可以看到一些数字显示多少内存正被使用。 

```
$ top
top - 15:36:38 up 8 days, 2:37, 2 users, load average: 0.00, 0.00, 0.00
Tasks: 266 total, 1 running, 265 sleeping, 0 stopped, 0 zombie
%Cpu(s): 0.2 us, 0.4 sy, 0.0 ni, 99.4 id, 0.0 wa, 0.0 hi, 0.0 si, 0.0 st
MiB Mem : 3244.8 total, 377.9 free, 1826.2 used, 1040.7 buff/cache
MiB Swap: 3536.0 total, 3535.7 free, 0.3 used. 1126.1 avail Mem
```

最后一个命令将会以一个非常简洁的方式回答“系统安装了多少内存？”：

```
$ sudo dmidecode -t 17 | grep "Size.*MB" | awk '{s+=$2} END {print s / 1024 "GB"}'
6GB
```

取决于你想要获取多少细节，Linux 系统提供了许多用来查看系统安装内存以及使用/空闲内存的选择。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3336174/linux/how-much-memory-is-installed-and-being-used-on-your-linux-systems.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[leommxj](https://github.com/leommxj)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.facebook.com/NetworkWorld/
[2]: https://www.linkedin.com/company/network-world
