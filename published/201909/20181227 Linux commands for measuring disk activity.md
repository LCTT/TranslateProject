[#]: collector: (lujun9972)
[#]: translator: (laingke)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11387-1.html)
[#]: subject: (Linux commands for measuring disk activity)
[#]: via: (https://www.networkworld.com/article/3330497/linux/linux-commands-for-measuring-disk-activity.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

用于测量磁盘活动的 Linux 命令
======
> Linux 发行版提供了几个度量磁盘活动的有用命令。让我们了解一下其中的几个。

![](https://images.idgesg.net/images/article/2018/12/tape-measure-100782593-large.jpg)

Linux 系统提供了一套方便的命令，帮助你查看磁盘有多忙，而不仅仅是磁盘有多满。在本文中，我们将研究五个非常有用的命令，用于查看磁盘活动。其中两个命令（`iostat` 和 `ioping`）可能必须添加到你的系统中，这两个命令一样要求你使用 sudo 特权，所有这五个命令都提供了查看磁盘活动的有用方法。

这些命令中最简单、最直观的一个可能是 `dstat` 了。

### dtstat

尽管 `dstat` 命令以字母 “d” 开头，但它提供的统计信息远远不止磁盘活动。如果你只想查看磁盘活动，可以使用 `-d` 选项。如下所示，你将得到一个磁盘读/写测量值的连续列表，直到使用 `CTRL-c` 停止显示为止。注意，在第一个报告信息之后，显示中的每个后续行将在接下来的时间间隔内报告磁盘活动，缺省值仅为一秒。

```
$ dstat -d
-dsk/total-
 read  writ
 949B   73k
  65k     0    <== first second
   0    24k    <== second second
   0    16k
   0	0 ^C
```

在 `-d` 选项后面包含一个数字将把间隔设置为该秒数。

```
$ dstat -d 10
-dsk/total-
 read  writ
 949B   73k
  65k   81M    <== first five seconds
   0    21k    <== second five second
   0  9011B ^C
```

请注意，报告的数据可能以许多不同的单位显示——例如，M（Mb）、K（Kb）和 B（字节）。

如果没有选项，`dstat` 命令还将显示许多其他信息——指示 CPU 如何使用时间、显示网络和分页活动、报告中断和上下文切换。

```
$ dstat
You did not select any stats, using -cdngy by default.
--total-cpu-usage-- -dsk/total- -net/total- ---paging-- ---system--
usr sys idl wai stl| read  writ| recv  send|  in   out | int   csw
  0   0 100   0   0| 949B   73k|   0     0 |   0     3B|  38    65
  0   0 100   0   0|   0     0 | 218B  932B|   0     0 |  53    68
  0   1  99   0   0|   0    16k|  64B  468B|   0     0 |  64    81 ^C
```

`dstat` 命令提供了关于整个 Linux 系统性能的有价值的见解，几乎可以用它灵活而功能强大的命令来代替 `vmstat`、`netstat`、`iostat` 和 `ifstat` 等较旧的工具集合，该命令结合了这些旧工具的功能。要深入了解 `dstat` 命令可以提供的其它信息，请参阅这篇关于 [dstat][1] 命令的文章。

### iostat

`iostat` 命令通过观察设备活动的时间与其平均传输速率之间的关系，帮助监视系统输入/输出设备的加载情况。它有时用于评估磁盘之间的活动平衡。

```
$ iostat
Linux 4.18.0-041800-generic (butterfly)         12/26/2018      _x86_64_       (2 CPU)

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.07    0.01    0.03    0.05    0.00   99.85

Device             tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
loop0             0.00         0.00         0.00       1048          0
loop1             0.00         0.00         0.00        365          0
loop2             0.00         0.00         0.00       1056          0
loop3             0.00         0.01         0.00      16169          0
loop4             0.00         0.00         0.00        413          0
loop5             0.00         0.00         0.00       1184          0
loop6             0.00         0.00         0.00       1062          0
loop7             0.00         0.00         0.00       5261          0
sda               1.06         0.89        72.66    2837453  232735080
sdb               0.00         0.02         0.00      48669         40
loop8             0.00         0.00         0.00       1053          0
loop9             0.01         0.01         0.00      18949          0
loop10            0.00         0.00         0.00         56          0
loop11            0.00         0.00         0.00       7090          0
loop12            0.00         0.00         0.00       1160          0
loop13            0.00         0.00         0.00        108          0
loop14            0.00         0.00         0.00       3572          0
loop15            0.01         0.01         0.00      20026          0
loop16            0.00         0.00         0.00         24          0
```

当然，当你只想关注磁盘时，Linux 回环设备上提供的所有统计信息都会使结果显得杂乱无章。不过，该命令也确实提供了 `-p` 选项，该选项使你可以仅查看磁盘——如以下命令所示。

```
$ iostat -p sda
Linux 4.18.0-041800-generic (butterfly)         12/26/2018      _x86_64_        (2 CPU)

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.07    0.01    0.03    0.05    0.00   99.85

Device             tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sda               1.06         0.89        72.54    2843737  232815784
sda1              1.04         0.88        72.54    2821733  232815784
```

请注意 `tps` 是指每秒的传输量。

你还可以让 `iostat` 提供重复的报告。在下面的示例中，我们使用 `-d` 选项每五秒钟进行一次测量。

```
$ iostat -p sda -d 5
Linux 4.18.0-041800-generic (butterfly)         12/26/2018      _x86_64_        (2 CPU)

Device             tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sda               1.06         0.89        72.51    2843749  232834048
sda1              1.04         0.88        72.51    2821745  232834048

Device             tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sda               0.80         0.00        11.20          0         56
sda1              0.80         0.00        11.20          0         56
```

如果你希望省略第一个（自启动以来的统计信息）报告，请在命令中添加 `-y`。

```
$ iostat -p sda -d 5 -y
Linux 4.18.0-041800-generic (butterfly)         12/26/2018      _x86_64_        (2 CPU)

Device             tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sda               0.80         0.00        11.20          0         56
sda1              0.80         0.00        11.20          0         56
```

接下来，我们看第二个磁盘驱动器。

```
$ iostat -p sdb
Linux 4.18.0-041800-generic (butterfly)         12/26/2018      _x86_64_        (2 CPU)

avg-cpu:  %user   %nice %system %iowait  %steal   %idle
           0.07    0.01    0.03    0.05    0.00   99.85

Device             tps    kB_read/s    kB_wrtn/s    kB_read    kB_wrtn
sdb               0.00         0.02         0.00      48669         40
sdb2              0.00         0.00         0.00       4861         40
sdb1              0.00         0.01         0.00      35344          0
```

### iotop

`iotop` 命令是类似 `top` 的实用程序，用于查看磁盘 I/O。它收集 Linux 内核提供的 I/O 使用信息，以便你了解哪些进程在磁盘 I/O 方面的要求最高。在下面的示例中，循环时间被设置为 5 秒。显示将自动更新，覆盖前面的输出。

```
$ sudo iotop -d 5
Total DISK READ:         0.00 B/s | Total DISK WRITE:      1585.31 B/s
Current DISK READ:       0.00 B/s | Current DISK WRITE:      12.39 K/s
  TID  PRIO  USER     DISK READ  DISK WRITE  SWAPIN     IO>    COMMAND
32492 be/4 root        0.00 B/s    0.00 B/s  0.00 %  0.12 % [kworker/u8:1-ev~_power_efficient]
  208 be/3 root        0.00 B/s 1585.31 B/s  0.00 %  0.11 % [jbd2/sda1-8]
    1 be/4 root        0.00 B/s    0.00 B/s  0.00 %  0.00 % init splash
    2 be/4 root        0.00 B/s    0.00 B/s  0.00 %  0.00 % [kthreadd]
    3 be/0 root        0.00 B/s    0.00 B/s  0.00 %  0.00 % [rcu_gp]
    4 be/0 root        0.00 B/s    0.00 B/s  0.00 %  0.00 % [rcu_par_gp]
    8 be/0 root        0.00 B/s    0.00 B/s  0.00 %  0.00 % [mm_percpu_wq]
```

### ioping

`ioping` 命令是一种完全不同的工具，但是它可以报告磁盘延迟——也就是磁盘响应请求需要多长时间，而这有助于诊断磁盘问题。

```
$ sudo ioping /dev/sda1
4 KiB <<< /dev/sda1 (block device 111.8 GiB): request=1 time=960.2 us (warmup)
4 KiB <<< /dev/sda1 (block device 111.8 GiB): request=2 time=841.5 us
4 KiB <<< /dev/sda1 (block device 111.8 GiB): request=3 time=831.0 us
4 KiB <<< /dev/sda1 (block device 111.8 GiB): request=4 time=1.17 ms
^C
--- /dev/sda1 (block device 111.8 GiB) ioping statistics ---
3 requests completed in 2.84 ms, 12 KiB read, 1.05 k iops, 4.12 MiB/s
generated 4 requests in 3.37 s, 16 KiB, 1 iops, 4.75 KiB/s
min/avg/max/mdev = 831.0 us / 947.9 us / 1.17 ms / 158.0 us
```

### atop

`atop` 命令，像 `top` 一样提供了大量有关系统性能的信息，包括有关磁盘活动的一些统计信息。

```
ATOP - butterfly      2018/12/26  17:24:19      37d3h13m------ 10ed
PRC | sys    0.03s | user   0.01s | #proc    179 | #zombie    0 | #exit      6 |
CPU | sys       1% | user      0% | irq       0% | idle    199% | wait      0% |
cpu | sys       1% | user      0% | irq       0% | idle     99% | cpu000 w  0% |
CPL | avg1    0.00 | avg5    0.00 | avg15   0.00 | csw      677 | intr     470 |
MEM | tot     5.8G | free  223.4M | cache   4.6G | buff  253.2M | slab  394.4M |
SWP | tot     2.0G | free    2.0G |              | vmcom   1.9G | vmlim   4.9G |
DSK |          sda | busy      0% | read       0 | write      7 | avio 1.14 ms |
NET | transport    | tcpi 4 | tcpo  stall      8 | udpi 1 | udpo 0swout   2255 |
NET | network      | ipi       10 | ipo 7 | ipfrw      0 | deliv      60.67 ms |
NET | enp0s25   0% | pcki      10 | pcko 8 | si    1 Kbps | so    3 Kbp0.73 ms |

  PID SYSCPU  USRCPU  VGROW   RGROW  ST EXC   THR  S CPUNR   CPU  CMD 1/1673e4 |
 3357  0.01s   0.00s   672K    824K  --   -     1  R     0    0%  atop
 3359  0.01s   0.00s     0K      0K  NE   0     0  E     -    0%  <ps>
 3361  0.00s   0.01s     0K      0K  NE   0     0  E     -    0%  <ps>
 3363  0.01s   0.00s     0K      0K  NE   0     0  E     -    0%  <ps>
31357  0.00s   0.00s     0K      0K  --   -     1  S     1    0%  bash
 3364  0.00s   0.00s  8032K    756K  N-   -     1  S     1    0%  sleep
 2931  0.00s   0.00s     0K      0K  --   -     1  I     1    0%  kworker/u8:2-e
 3356  0.00s   0.00s     0K      0K  -E   0     0  E     -    0%  <sleep>
 3360  0.00s   0.00s     0K      0K  NE   0     0  E     -    0%  <sleep>
 3362  0.00s   0.00s     0K      0K  NE   0     0  E     -    0%  <sleep>
```

如果你*只*想查看磁盘统计信息，则可以使用以下命令轻松进行管理：

```
$ atop | grep DSK
DSK |          sda | busy      0% | read  122901 | write 3318e3 | avio 0.67 ms |
DSK |          sdb | busy      0% | read    1168 | write    103 | avio 0.73 ms |
DSK |          sda | busy      2% | read       0 | write     92 | avio 2.39 ms |
DSK |          sda | busy      2% | read       0 | write     94 | avio 2.47 ms |
DSK |          sda | busy      2% | read       0 | write     99 | avio 2.26 ms |
DSK |          sda | busy      2% | read       0 | write     94 | avio 2.43 ms |
DSK |          sda | busy      2% | read       0 | write     94 | avio 2.43 ms |
DSK |          sda | busy      2% | read       0 | write     92 | avio 2.43 ms |
^C
```

### 了解磁盘 I/O

Linux 提供了足够的命令，可以让你很好地了解磁盘的工作强度，并帮助你关注潜在的问题或减缓。希望这些命令中的一个可以告诉你何时需要质疑磁盘性能。偶尔使用这些命令将有助于确保当你需要检查磁盘，特别是忙碌或缓慢的磁盘时可以显而易见地发现它们。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3330497/linux/linux-commands-for-measuring-disk-activity.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[laingke](https://github.com/laingke)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3291616/linux/examining-linux-system-performance-with-dstat.html
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world
