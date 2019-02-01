Linux 上查看系统/服务器运行时间的 11 种方法
======

你是否想知道自己的 Linux 系统正常运行了多长时间而没有宕机？系统是什么时候启动的？

Linux 上有多个查看服务器/系统运行时间的命令，大多数用户喜欢使用标准并且很有名的 `uptime` 命令获取这些具体的信息。

服务器的运行时间对一些用户来说不那么重要，但是当服务器运行诸如在线商城<ruby>门户<rt>portal</rt></ruby>、网上银行门户等<ruby>关键任务应用<rt>mission-critical applications</rt></ruby>时，它对于<ruby>服务器管理员<rt>server adminstrators</rt></ruby>来说就至关重要。

它必须做到零宕机，因为一旦停机就会影响到数百万用户。

正如我所说，许多命令都可以让用户看到 Linux 服务器的运行时间。在这篇教程里我会教你如何使用下面 11 种方式来查看。

<ruby>正常运行时间<rt>uptime</rt></ruby>指的是服务器自从上次关闭或重启以来经过的时间。

`uptime` 命令获取 `/proc` 文件中的详细信息并输出正常运行时间，而 `/proc` 文件并不适合人直接看。

以下这些命令会输出系统运行和启动的时间。也会显示一些额外的信息。

### 方法 1：使用 uptime 命令

`uptime` 命令会告诉你系统运行了多长时间。它会用一行显示以下信息。

当前时间、系统运行时间、当前登录用户的数量、过去 1 分钟/5 分钟/15 分钟系统负载的均值。

```
# uptime

 08:34:29 up 21 days,  5:46,  1 user,  load average: 0.06, 0.04, 0.00
```

### 方法 2：使用 w 命令

`w` 命令为每个登录进系统的用户，每个用户当前所做的事情，所有活动的负载对计算机的影响提供了一个快速的概要。这个单一命令结合了多个 Unix 程序：`who`、`uptime`，和 `ps -a` 的结果。

```
# w

 08:35:14 up 21 days,  5:47,  1 user,  load average: 0.26, 0.09, 0.02
USER     TTY      FROM              LOGIN@   IDLE   JCPU   PCPU WHAT
root     pts/1    103.5.134.167    08:34    0.00s  0.01s  0.00s w
```

### 方法 3：使用 top 命令

`top` 命令是 Linux 上监视实时系统进程的基础命令之一。它显示系统信息和运行进程的信息，例如正常运行时间、平均负载、运行的任务、登录用户数量、CPU 数量 & CPU 利用率、内存 & 交换空间信息。

**推荐阅读：**[TOP 命令监视服务器性能的例子][1]

```
# top -c

top - 08:36:01 up 21 days,  5:48,  1 user,  load average: 0.12, 0.08, 0.02
Tasks:  98 total,   1 running,  97 sleeping,   0 stopped,   0 zombie
Cpu(s):  0.0%us,  0.3%sy,  0.0%ni, 99.7%id,  0.0%wa,  0.0%hi,  0.0%si,  0.0%st
Mem:   1872888k total,  1454644k used,   418244k free,   175804k buffers
Swap:  2097148k total,        0k used,  2097148k free,  1098140k cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
    1 root      20   0 19340 1492 1172 S  0.0  0.1   0:01.04 /sbin/init
    2 root      20   0     0    0    0 S  0.0  0.0   0:00.00 [kthreadd]
    3 root      RT   0     0    0    0 S  0.0  0.0   0:00.00 [migration/0]
    4 root      20   0     0    0    0 S  0.0  0.0   0:34.32 [ksoftirqd/0]
    5 root      RT   0     0    0    0 S  0.0  0.0   0:00.00 [stopper/0]
```

### 方法 4：使用 who 命令

`who` 命令列出当前登录进计算机的用户。`who` 命令与 `w` 命令类似，但后者还包含额外的数据和统计信息。

```
# who -b
system boot 2018-04-12 02:48
```

### 方法 5：使用 last 命令

`last` 命令列出最近登录过的用户。`last` 回溯 `/var/log/wtmp` 文件并显示自从文件创建后登录进（出）的用户。

```
# last reboot -F | head -1 | awk '{print $5,$6,$7,$8,$9}'
Thu Apr 12 02:48:04 2018
```

### 方法 6：使用 /proc/uptime 文件

这个文件中包含系统上次启动后运行时间的详细信息。`/proc/uptime` 的输出相当精简。

第一个数字是系统自从启动的总秒数。第二个数字是总时间中系统空闲所花费的时间，以秒为单位。

```
# cat /proc/uptime
1835457.68 1809207.16
```

### 方法 7：使用 tuptime 命令

`tuptime` 是一个汇报系统运行时间的工具，输出历史信息并作以统计，保留重启之间的数据。和 `uptime` 命令很像，但输出更有意思一些。

```
$ tuptime
```

### 方法 8：使用 htop 命令

`htop` 是运行在 Linux 上的一个交互式进程查看器，是 Hisham 使用 ncurses 库开发的。`htop` 比起 `top` 有很多的特性和选项。

**推荐阅读：** [使用 Htop 命令监控系统资源][2]

```
# htop

  CPU[|                                                                               0.5%]     Tasks: 48, 5 thr; 1 running
  Mem[|||||||||||||||||||||||||||||||||||||||||||||||||||                       165/1828MB]     Load average: 0.10 0.05 0.01
  Swp[                                                                            0/2047MB]     Uptime: 21 days, 05:52:35

  PID USER      PRI  NI  VIRT   RES   SHR S CPU% MEM%   TIME+  Command
29166 root       20   0  110M  2484  1240 R  0.0  0.1  0:00.03 htop
29580 root       20   0 11464  3500  1032 S  0.0  0.2 55:15.97 /bin/sh ./OSWatcher.sh 10 1
    1 root       20   0 19340  1492  1172 S  0.0  0.1  0:01.04 /sbin/init
  486 root       16  -4 10780   900   348 S  0.0  0.0  0:00.07 /sbin/udevd -d
  748 root       18  -2 10780   932   360 S  0.0  0.0  0:00.00 /sbin/udevd -d
```

### 方法 9：使用 glances 命令

`glances` 是一个跨平台的基于 curses 库的监控工具，它是使用 python 编写的。可以说它非常强大，仅用一点空间就能获得很多信息。它使用 psutil 库从系统中获取信息。

`glances` 可以监控 CPU、内存、负载、进程、网络接口、磁盘 I/O、<ruby>磁盘阵列<rt>RAID</rt></ruby>、传感器、文件系统（与文件夹）、容器、监视器、Alert 日志、系统信息、运行时间、<ruby>快速查看<rt>Quicklook</rt></ruby>（CPU，内存、负载）等。

**推荐阅读：** [Glances （集大成）– Linux 上高级的实时系统运行监控工具][3]

```
glances

ubuntu (Ubuntu 17.10 64bit / Linux 4.13.0-37-generic) - IP 192.168.1.6/24                                                                                                                           Uptime: 21 days, 05:55:15

CPU  [||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||        90.6%]   CPU -    90.6%  nice:     0.0%  ctx_sw:    4K      MEM \   78.4%  active:     942M      SWAP -    5.9%      LOAD    2-core
MEM  [|||||||||||||||||||||||||||||||||||||||||||||||||||||||||                 78.0%]   user:    55.1%  irq:      0.0%  inter:   1797      total:  1.95G  inactive:   562M      total:   12.4G      1 min:    4.35
SWAP [||||                                                                       5.9%]   system:  32.4%  iowait:   1.8%  sw_int:   897      used:   1.53G  buffers:   14.8M      used:     749M      5 min:    4.38
                                                                                         idle:     7.6%  steal:    0.0%                     free:    431M  cached:     273M      free:    11.7G      15 min:   3.38

NETWORK     Rx/s   Tx/s   TASKS 211 (735 thr), 4 run, 207 slp, 0 oth sorted automatically by memory_percent, flat view
docker0       0b   232b
enp0s3      12Kb    4Kb   Systemd          7    Services loaded: 197 active: 196 failed: 1 
lo          616b   616b
_h478e48e     0b   232b     CPU%  MEM%  VIRT   RES   PID USER        NI S     TIME+   R/s   W/s Command 
                            63.8  18.9 2.33G  377M  2536 daygeek      0 R   5:57.78     0     0 /usr/lib/firefox/firefox -contentproc -childID 1 -isForBrowser -intPrefs 6:50|7:-1|19:0|34:1000|42:20|43:5|44:10|51
DefaultGateway     83ms     78.5  10.9 3.46G  217M  2039 daygeek      0 S  21:07.46     0     0 /usr/bin/gnome-shell
                             8.5  10.1 2.32G  201M  2464 daygeek      0 S   8:45.69     0     0 /usr/lib/firefox/firefox -new-window
DISK I/O     R/s    W/s      1.1   8.5 2.19G  170M  2653 daygeek      0 S   2:56.29     0     0 /usr/lib/firefox/firefox -contentproc -childID 4 -isForBrowser -intPrefs 6:50|7:-1|19:0|34:1000|42:20|43:5|44:10|51
dm-0           0      0      1.7   7.2 2.15G  143M  2880 daygeek      0 S   7:10.46     0     0 /usr/lib/firefox/firefox -contentproc -childID 6 -isForBrowser -intPrefs 6:50|7:-1|19:0|34:1000|42:20|43:5|44:10|51
sda1       9.46M    12K      0.0   4.9 1.78G 97.2M  6125 daygeek      0 S   1:36.57     0     0 /usr/lib/firefox/firefox -contentproc -childID 7 -isForBrowser -intPrefs 6:50|7:-1|19:0|34:1000|42:20|43:5|44:10|51
```

### 方法 10：使用 stat 命令

`stat` 命令显示指定文件或文件系统的详细状态。

```
# stat /var/log/dmesg | grep Modify
Modify: 2018-04-12 02:48:04.027999943 -0400
```

### 方法 11：使用 procinfo 命令

`procinfo` 从 `/proc` 文件夹下收集一些系统数据并将其很好的格式化输出在标准输出设备上。

```
# procinfo | grep Bootup
Bootup: Fri Apr 20 19:40:14 2018 Load average: 0.16 0.05 0.06 1/138 16615
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/11-methods-to-find-check-system-server-uptime-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[LuuMing](https://github.com/LuuMing)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/magesh/
[1]:https://www.2daygeek.com/top-command-examples-to-monitor-server-performance/
[2]:https://www.2daygeek.com/htop-command-examples-to-monitor-system-resources/
[3]:https://www.2daygeek.com/install-glances-advanced-real-time-linux-system-performance-monitoring-tool-on-centos-fedora-ubuntu-debian-opensuse-arch-linux/
