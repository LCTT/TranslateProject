Linux mpstat 命令- 报告处理器的相关统计信息
================================================================================
现在的计算机一般都使用着多处理器或四核单处理器。在服务器端，更多的处理器或核心意味着更强的能力，但另一方面，应用程序也需要更高的能耗。你还可能遇到过这样的场景：当你的cpu利用率很高时你却感觉自己根本没有运行任何程序。以上种种情况，在Linux系统上，你可以使用 **mpstate** 来监控这样的活动。
![linux mpstat command](http://linoxide.com/wp-content/uploads/2013/12/linux-mpstat-command.jpg)

### 什么是mpstat ###

**mpstat** 用于监控你的系统上cpu的利用率。如果你的系统有多个处理器，它会发挥更大的作用。
第一个处理器会被标记为CPU 0。第二个会被标记为CPU 2，以此类推。在操作手册中，如下描述mpstat：

> mpstat命令把每个可用的处理器的状态写到标准输出，默认第一个处理器为processor 0。所有处理器的全局平均状态也会以报告形式给出。mpstat命令可以用于SMP和UP的机器上，但是在UP机器上，只有全局平均状态会被打印出来。如果没有选择具体行为，默认将报告CPU的利用率

### 如何运行mpstat ###

只需在你的终端输入 **mpstat** 就可以运行mpstat.

    $ mpstat

    Linux 3.2.0-57-generic (USERNB01) 12/12/2013 _x86_64_ (2 CPU)

    03:29:29 PM CPU %usr %nice %sys %iowait %irq %soft %steal %guest %idle
    03:29:29 PM all 6.30 0.06 1.94 3.75 0.00 0.06 0.00 0.00 87.88

如果你发现譬如 **命令找不到**或者类似的错误，说明你可能没有安装mpstat。

如果你使用的是 **CentOS, RedHat or Fedora**，运行下列命令来安装mpstat

    # yum install sysstat

如果你使用的是 **Debian, Ubuntu or 它的衍生版**， 运行下列命令来安装mpstat

    # apt-get install sysstat

下面是如何理解上面显示出来的信息。

- **03:29:29 PM** : 指mpstat运行的时间
- **all** : 指所有CPU
- **%usr** : 显示在用户级别（例如应用程序）执行时CPU利用率的百分比
- **%nice** :显示在拥有nice优先级的用户级别执行时CPU利用率的百分比
- **%sys** : 现实在系统级别（例如内核）执行时CPU利用率的百分比
- **%iowait** : 显示在系统有未完成的磁盘I/O请求期间CPU空闲时间的百分比
- **%irq** : 显示CPU服务硬件中断所花费时间的百分比
- **%soft** : 显示CPU服务软件中断所花费时间的百分比
- **%steal** : 显示虚拟机管理器在服务另一个虚拟处理器时虚拟CPU处在非自愿等待下花费时间的百分比
- **%guest** : 显示运行虚拟处理器时CPU花费时间的百分比
- **%idle** : 显示CPU空闲和系统没有未完成的磁盘I/O请求情况下的时间百分比

### 打印每个处理器的CPU利用率 ###

正如上面的命令结果所示，我们的系统有两个CPU。如果你愿意，你可以使用参数 -P 然后紧跟CPU编号得到指定CPU的利用率。

    $ mpstat -P 0

    Linux 3.2.0-57-generic (USERNB01) 12/12/2013 _x86_64_ (2 CPU)

    03:54:00 PM CPU %usr %nice %sys %iowait %irq %soft %steal %guest %idle
    03:54:00 PM 0 3.82 0.01 1.16 3.88 0.00 0.06 0.00 0.00 91.06

    $ mpstat -P 1
    Linux 3.2.0-57-generic (USERNB01) 12/12/2013 _x86_64_ (2 CPU)

    03:53:58 PM CPU %usr %nice %sys %iowait %irq %soft %steal %guest %idle
    03:53:58 PM 1 16.52 0.20 4.48 0.46 0.00 0.04 0.00 0.00 78.30

### 打印所有CPU的利用率 ###

你也可以在一页里打印每个处理器的CPU利用率，只需使用 **-P ALL** 参数来指定。

    $ mpstat -P ALL

    Linux 3.2.0-57-generic (USERNB01) 12/12/2013 _x86_64_ (2 CPU)

    04:07:36 PM CPU %usr %nice %sys %iowait %irq %soft %steal %guest %idle
    04:07:36 PM all 6.02 0.04 1.72 2.99 0.00 0.05 0.00 0.00 89.17
    04:07:36 PM 0 3.84 0.01 1.15 3.72 0.00 0.06 0.00 0.00 91.21
    04:07:36 PM 1 13.55 0.15 3.66 0.46 0.00 0.03 0.00 0.00 82.15

### 使用时间间隔打印CPU利用率 ###

如果你想观察CPU的利用率变化，你可以使用时间间隔，下面是一个例子。

    $ mpstat 3 4

    Linux 3.2.0-57-generic (USERNB01) 12/12/2013 _x86_64_ (2 CPU)

    04:27:11 PM CPU %usr %nice %sys %iowait %irq %soft %steal %guest %idle
    04:27:14 PM all 0.67 0.00 0.34 0.00 0.00 0.00 0.00 0.00 98.99
    04:27:17 PM all 1.17 0.00 0.33 1.33 0.00 0.00 0.00 0.00 97.17
    04:27:20 PM all 0.84 0.00 0.17 0.00 0.00 0.00 0.00 0.00 98.99
    04:27:23 PM all 1.00 0.00 0.17 1.51 0.00 0.00 0.00 0.00 97.32
    Average: all 0.92 0.00 0.25 0.71 0.00 0.00 0.00 0.00 98.12

上面的命令会**每隔3秒**显示CPU利用的**4个报告**。

### 打印mpstat的版本 ###

最后，为了打印mpstat的版本，使用参数 -V

    $ mpstat -V

    sysstat version 10.0.3
    (C) Sebastien Godard (sysstat orange.

这就是在linux系统上快速使用mpstat的方法。想要了解更多细节，可以输入 **man mpstat**来查看mpstat的手册。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-mpstat-command/

译者：[KayGuoWhu](https://github.com/KayGuoWhu) 校对：[Mr小眼儿](https://github.com/tinyeyeser)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
