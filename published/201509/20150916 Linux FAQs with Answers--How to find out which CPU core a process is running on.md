Linux 有问必答：如何知道进程运行在哪个 CPU 内核上？
================================================================================
>问题：我有个 Linux 进程运行在多核处理器系统上。怎样才能找出哪个 CPU 内核正在运行该进程？

当你在 [多核 NUMA 处理器上][1]运行需要较高性能的 HPC（高性能计算）程序或非常消耗网络资源的程序时，CPU/memory 的亲和力是限度其发挥最大性能的重要因素之一。在同一 NUMA  节点上调度最相关的进程可以减少缓慢的远程内存访问。像英特尔 Sandy Bridge 处理器，该处理器有一个集成的 PCIe 控制器，你可以在同一 NUMA 节点上调度网络 I/O 负载（如网卡）来突破 PCI 到 CPU 亲和力限制。

作为性能优化和故障排除的一部分，你可能想知道特定的进程被调度到哪个 CPU 内核（或 NUMA 节点）上运行。

这里有几种方法可以 **找出哪个 CPU 内核被调度来运行给定的 Linux 进程或线程**。

### 方法一 ###

如果一个进程使用 [taskset][2] 命令明确的被固定（pinned）到 CPU 的特定内核上，你可以使用 taskset 命令找出被固定的 CPU 内核：

    $ taskset -c -p <pid>

例如, 如果你对 PID 5357 这个进程有兴趣:

    $ taskset -c -p 5357

----------

    pid 5357's current affinity list: 5

输出显示这个过程被固定在 CPU 内核 5上。

但是，如果你没有明确固定进程到任何 CPU 内核，你会得到类似下面的亲和力列表。

    pid 5357's current affinity list: 0-11

输出表明该进程可能会被安排在从0到11中的任何一个 CPU 内核。在这种情况下，taskset 不能识别该进程当前被分配给哪个 CPU 内核，你应该使用如下所述的方法。

### 方法二 ###

ps 命令可以告诉你每个进程/线程目前分配到的 （在“PSR”列）CPU ID。

    $ ps -o pid,psr,comm -p <pid>

----------

      PID PSR COMMAND
     5357  10 prog

输出表示进程的 PID 为 5357（名为"prog"）目前在CPU 内核 10 上运行着。如果该过程没有被固定，PSR 列会根据内核可能调度该进程到不同内核而改变显示。

### 方法三 ###

top 命令也可以显示 CPU 被分配给哪个进程。首先，在top 命令中使用“P”选项。然后按“f”键，显示中会出现 "Last used CPU" 列。目前使用的 CPU 内核将出现在 “P”（或“PSR”）列下。

    $ top -p 5357

![](https://farm6.staticflickr.com/5698/21429268426_e7d1d73a04_c.jpg)

相比于 ps 命令，使用 top 命令的好处是，你可以连续监视随着时间的改变， CPU 是如何分配的。

### 方法四 ###

另一种来检查一个进程/线程当前使用的是哪个 CPU 内核的方法是使用 [htop 命令][3]。

从命令行启动 htop。按 <F2> 键，进入"Columns"，在"Available Columns"下会添加 PROCESSOR。

每个进程当前使用的 CPU ID 将出现在“CPU”列中。

![](https://farm6.staticflickr.com/5788/21444522832_a5a206f600_c.jpg)

请注意，所有以前使用的命令 taskset，ps 和 top 分配CPU 内核的 IDs 为 0，1，2，...，N-1。然而，htop 分配 CPU 内核 IDs 从 1开始（直到 N）。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/cpu-core-process-is-running.html

作者：[Dan Nanni][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://xmodulo.com/identify-cpu-processor-architecture-linux.html
[2]:http://xmodulo.com/run-program-process-specific-cpu-cores-linux.html
[3]:https://linux.cn/article-3141-1.html
