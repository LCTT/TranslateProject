Linux vmstat 命令 - 报告虚拟内存统计的工具
================================================================================
众所周知，计算机必须有称之为RAM(随机访问内存)的存储器使得计算机工作。RAM指的是插在计算机主板上的物理存储。这里的RAM被用于加载像浏览器、文字处理器这类的程序，实际上，你使用的程序都运行在内存上。

让我们假设你有2GB的内存。当你在运行操作系统时，你的可用内存可能只有1.5GB。接着你使用了大量的程序。当内存使用满之后，你可能再也无法加载更多的程序。浅显地说，计算机可能会说:"抱歉，你不能在运行更多的程序了，如果你还要运行其他的程序请先关闭一些程序。"

为了解决这个问题，包括Linux在内的各种操作系统使用了一个称之为虚拟内存的方法。这个方法会搜索最近不在使用的程序的内存区域，接着将它们拷贝到计算机硬盘上。这会腾出一些剩余内存空间给你有机会运行更多的程序。

为了监视虚拟内存的活动，我们使用**vmstat**工具。

### 什么是 vmstat ###

vmstat是一个提供报告虚拟内存统计的工具。它包括了系统内存、交换和实时处理器利用率。

### 如何运行 vmstat ###

和[mpstat][1]一样，vmstat包含在sysstat包中。如果你还没有，请安装sysstat包。

为了运行vmstat，只需在控制台输入vmstat。不带参数运行vmstat会显示vmstat的默认结果。

![](http://linoxide.com/wp-content/uploads/2013/12/vmstat_default.png)

让我们看下如何了解vmstat提供的信息：

#### Procs ####

procs有 **r**列和**b**列。**r**列代表等待访问CPU进程的数量。而b列意味着睡眠进程的数量。在这些列的下面，是它们的值。从上面的截图中，我门有2个进程正在等待访问CPU，0个睡眠进程。

#### Memory ####

memory有**swpd、 free、 buff** 和 **cache** 这些列。这些信息和命令**free -m**相同。**swpd列**显示了有多少内存已经被交换到了交换文件或者磁盘。**free列**显示了未分配的可用内存。**buff列**显示了使用中的内存。**cache列**显示了有多少内存可以被交换到交换文件或者磁盘上如果一些应用需要他们。

#### Swap ####

swap显示了从交换系统上发送或取回了多少内存。**si**列告诉我们每秒有多少内存被**从swap移到真实内存**中（In）。**so**列告诉我们每秒有多少内存被**从真实内存移到swap**中（Out）。

#### I/O ####

**io**依据块的读写显示了每秒输入输出的活动。**bi**列告诉我们收到的块数量，**bo**列告诉我们发送的块数量。

#### System ####

system显示了每秒的系统操作数量。**in**列显示了系统每秒被中断的数量。**cs**列显示了系统为了处理所以任务而上下文切换的数量。

#### CPU ####

CPU告诉了我们CPU资源的使用情况。**us列**显示了处理器在非内核程序消耗的时间。**sy列**显示了处理器在内核相关任务上消耗的时间。**id列**显示了处理器的空闲时间。**wa列**显示了处理器在等待IO操作完成以继续处理任务上的时间。

### 按间隔时间运行vmstat ###

作为一个统计工具，使用vmstat最好的方法是使用**间隔时间**。你可以间断地捕捉系统状态。让我假设以5秒的间隔运行vmstat。只需要在你的控制台中输入**vmstat 5**就行。

![](http://linoxide.com/wp-content/uploads/2013/12/vmstat_delay_5.png)

命令将会每5秒运行一次，**直到**你按下Ctrl-C来终止它。你也可以使用第二个参数来控制vmstat运行的次数。

![](http://linoxide.com/wp-content/uploads/2013/12/vmstat_count_7.png)

上面的命令会**以5秒的间隔运行7次vmstat**。

### 显示活跃和非活跃内存 ###

要这么做，你可以在vmstat后加入**-a**选项。这是个示例。

![](http://linoxide.com/wp-content/uploads/2013/12/vmstat_a.png)

### 显示磁盘统计数据总结 ###

如果你想，vmstat也可以打印系统磁盘活动统计。使用**-D**选项就行。

![](http://linoxide.com/wp-content/uploads/2013/12/vmstat_disk_sum.png)

### 显示单位 ###

你可以选择你想打印的显示单位字符。在**-S后跟上k (小写，1000)、 K (大写，1024)、 m (小写，1000000)、 M (大写，1048576)** 字节. 如果你不想选择单位，默认使用的是K (1024)。

![](http://linoxide.com/wp-content/uploads/2013/12/vmstat_define_unit.png)

### 显示某个磁盘分区的详细统计数据 ###

要这么做，你可以使用**-p选项跟上设备名**。这里有个例子。

![](http://linoxide.com/wp-content/uploads/2013/12/vmstat_partition.png)

### 文件 ###

vmstat实际上是使用这些文件获取的数据。

    /proc/meminfo
    /proc/stat
    /proc/*/stat 

### 总结 ###

如果你感觉系统运行超出内存了，在你增加物理内存前，这个工具可以帮助你确定问题的根本原因。通常上，你可以在控制台中输入**man vmstat**获取更多的关于vmstat的详细信息，这会为你显示vmstat的手册页。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-vmstat-command-tool-report-virtual-memory-statistics/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linoxide.com/linux-command/linux-mpstat-command/