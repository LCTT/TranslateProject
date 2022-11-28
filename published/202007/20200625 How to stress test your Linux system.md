[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12389-1.html)
[#]: subject: (How to stress test your Linux system)
[#]: via: (https://www.networkworld.com/article/3563334/how-to-stress-test-your-linux-system.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

如何对你的 Linux 系统进行压力测试
======

> 如果你想了解 Linux 服务器在重压之下的运行情况，那么给 Linux 服务器施加压力是个不错的主意。在这篇文章中，我们将看一些工具，可以帮助你增加服务器压力并衡量结果。

![](https://images.idgesg.net/images/article/2020/06/stress-test2_linux-penguin-stress-ball_hand-squeezing_by-digitalsoul-getty-images_1136841639-100850120-large.jpg)

为什么你会想给你的 Linux 系统施加压力呢？因为有时你可能想知道当一个系统由于大量运行的进程、繁重的网络流量、过多的内存使用等原因而承受很大的压力时，它的表现如何。这种压力测试可以帮助确保系统已经做好了 “上市” 的准备。

如果你需要预测应用程序可能需要多长时间才能做出反应，以及哪些（如果有的话）进程可能会在重负载下失败或运行缓慢，那么在前期进行压力测试是一个非常好的主意。

幸运的是，对于那些需要能够预测 Linux 系统在压力下的反应的人来说，你可以采用一些有用的技术和工具来使这个过程更容易。在这篇文章中，我们将研究其中的一些。

### 自己动手做个循环

第一种技术是在命令行上运行一些循环，观察它们对系统的影响。这种方式可以大大增加 CPU 的负荷。使用 `uptime` 或类似的命令可以很容易地看到结果。

在下面的命令中，我们启动了四个无尽循环。你可以通过添加数字或使用 bash 表达式，如 `{1...6}` 来代替 `1 2 3 4` 以增加循环次数：

```
for i in 1 2 3 4; do while : ; do : ; done & done
```

在命令行上输入后，将在后台启动四个无尽循环：

```
$ for i in 1 2 3 4; do while : ; do : ; done & done
[1] 205012
[2] 205013
[3] 205014
[4] 205015
```

在这种情况下，发起了作业 1-4，作业号和进程号会相应显示出来。

要观察对平均负载的影响，请使用如下所示的命令。在本例中，`uptime` 命令每 30 秒运行一次：

```
$ while true; do uptime; sleep 30; done
```

如果你打算定期运行这样的测试，你可以将循环命令放入脚本 `watch-it` 中。

```
#!/bin/bash

while true
do
  uptime
  sleep 30
done
```

在输出中，你可以看到平均负载是如何增加的，然后在循环结束后又开始下降。

```
 11:25:34 up 5 days, 17:27,  2 users,  load average: 0.15, 0.14, 0.08
 11:26:04 up 5 days, 17:27,  2 users,  load average: 0.09, 0.12, 0.08
 11:26:34 up 5 days, 17:28,  2 users,  load average: 1.42, 0.43, 0.18
 11:27:04 up 5 days, 17:28,  2 users,  load average: 2.50, 0.79, 0.31
 11:27:34 up 5 days, 17:29,  2 users,  load average: 3.09, 1.10, 0.43
 11:28:04 up 5 days, 17:29,  2 users,  load average: 3.45, 1.38, 0.54
 11:28:34 up 5 days, 17:30,  2 users,  load average: 3.67, 1.63, 0.66
 11:29:04 up 5 days, 17:30,  2 users,  load average: 3.80, 1.86, 0.76
 11:29:34 up 5 days, 17:31,  2 users,  load average: 3.88, 2.06, 0.87
 11:30:04 up 5 days, 17:31,  2 users,  load average: 3.93, 2.25, 0.97
 11:30:34 up 5 days, 17:32,  2 users,  load average: 3.64, 2.35, 1.04 <== 循环停止
 11:31:04 up 5 days, 17:32,  2 users,  load average: 2.20, 2.13, 1.01      11:31:34 up 5 days, 17:33,  2 users,  load average: 1.40, 1.94, 0.98
```

因为所显示的负载分别代表了 1、5 和 15 分钟的平均值，所以这些值需要一段时间才能恢复到系统接近正常的状态。

要停止循环，请发出像下面这样的 `kill` 命令 —— 假设作业号是 1-4，就像本篇文章前面显示的那样。如果你不确定，可以使用 `jobs` 命令来确认作业号。

```
$ kill %1 %2 %3 %4
```

### 增加压力的专用工具

另一种方法是使用专门为你制造系统压力的工具。其中一种叫做 `stress`（压力），可以以多种方式对系统进行压力测试。`stress` 工具是一个工作负载生成器，提供 CPU、内存和磁盘 I/O 压力测试。

在使用 `--cpu` 选项时，`stress` 命令使用平方根函数强制 CPU 努力工作。指定的 CPU 数量越多，负载上升的速度就越快。

下面第二个脚本（`watch-it-2`）可以用来衡量对系统内存使用的影响。请注意，它使用 `free` 命令来查看加压的效果。

```
$ cat watch-it-2
#!/bin/bash

while true
do
  free
  sleep 30
done
```

发起任务并观察压力：

```
$ stress --cpu 2

$ ./watch-it
 13:09:14 up 5 days, 19:10,  2 users,  load average: 0.00, 0.00, 0.00
 13:09:44 up 5 days, 19:11,  2 users,  load average: 0.68, 0.16, 0.05
 13:10:14 up 5 days, 19:11,  2 users,  load average: 1.20, 0.34, 0.12
 13:10:44 up 5 days, 19:12,  2 users,  load average: 1.52, 0.50, 0.18
 13:11:14 up 5 days, 19:12,  2 users,  load average: 1.71, 0.64, 0.24
 13:11:44 up 5 days, 19:13,  2 users,  load average: 1.83, 0.77, 0.30
```

在命令行中指定的 CPU 越多，负载就增加的越快。

```
$ stress --cpu 4
$ ./watch-it
 13:47:49 up 5 days, 19:49,  2 users,  load average: 0.00, 0.00, 0.00
 13:48:19 up 5 days, 19:49,  2 users,  load average: 1.58, 0.38, 0.13
 13:48:49 up 5 days, 19:50,  2 users,  load average: 2.61, 0.75, 0.26
 13:49:19 up 5 days, 19:50,  2 users,  load average: 3.16, 1.06, 0.38
 13:49:49 up 5 days, 19:51,  2 users,  load average: 3.49, 1.34, 0.50
 13:50:19 up 5 days, 19:51,  2 users,  load average: 3.69, 1.60, 0.61
```

`stress` 命令也可以通过 `--io`（输入/输出）和 `--vm`（内存）选项增加 I/O 和内存的负载来给系统施加压力。

在接下来的这个例子中，运行这个增加内存压力的命令，然后启动 `watch-it-2` 脚本。

```
$ stress --vm 2

$ watch-it-2
              total        used        free      shared  buff/cache   available
Mem:        6087064      662160     2519164        8868     2905740     5117548
Swap:       2097148           0     2097148
              total        used        free      shared  buff/cache   available
Mem:        6087064      803464     2377832        8864     2905768     4976248
Swap:       2097148           0     2097148
              total        used        free      shared  buff/cache   available
Mem:        6087064      968512     2212772        8864     2905780     4811200
Swap:       2097148           0     2097148
```

`stress` 的另一个选项是使用 `--io` 选项为系统添加输入/输出活动。在这种情况下，你可以使用这样的命令：

```
$ stress --io 4
```

然后你可以使用 `iotop` 观察受压的 I/O。注意，运行 `iotop` 需要 root 权限。

之前：

```
$ sudo iotop -o
Total DISK READ:         0.00 B/s | Total DISK WRITE:        19.36 K/s
Current DISK READ:       0.00 B/s | Current DISK WRITE:      27.10 K/s
    TID  PRIO  USER     DISK READ  DISK WRITE  SWAPIN     IO>    COMMAND
 269308 be/4 root        0.00 B/s    0.00 B/s  0.00 %  1.24 % [kworker~fficient]
    283 be/3 root        0.00 B/s   19.36 K/s  0.00 %  0.26 % [jbd2/sda1-8]
```

之后：

```
Total DISK READ:         0.00 B/s | Total DISK WRITE:         0.00 B/s
Current DISK READ:       0.00 B/s | Current DISK WRITE:       0.00 B/s
    TID  PRIO  USER     DISK READ  DISK WRITE  SWAPIN     IO>    COMMAND
 270983 be/4 shs         0.00 B/s    0.00 B/s  0.00 % 51.45 % stress --io 4
 270984 be/4 shs         0.00 B/s    0.00 B/s  0.00 % 51.36 % stress --io 4
 270985 be/4 shs         0.00 B/s    0.00 B/s  0.00 % 50.95 % stress --io 4
 270982 be/4 shs         0.00 B/s    0.00 B/s  0.00 % 50.80 % stress --io 4
 269308 be/4 root        0.00 B/s    0.00 B/s  0.00 %  0.09 % [kworker~fficient]
```

`stress` 只是给系统增加压力的若干工具之一。另一个较新的工具，`stress-ng`，将在以后的文章中介绍。

### 总结

用于系统压力测试的各种工具可以帮助你预测系统在真实世界的情况下如何响应，在这些情况下，它们受到增加的流量和计算需求。

虽然我们在文章中展示的是创建和测量各种类型的压力的方法，但最终的好处是压力如何帮助确定你的系统或应用程序对它的反应。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3563334/how-to-stress-test-your-linux-system.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world
