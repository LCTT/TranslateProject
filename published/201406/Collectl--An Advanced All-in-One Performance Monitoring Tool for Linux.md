Collectl: Linux 性能监控的全能冠军
================================================================================

对于一个 Linux 系统管理员来说确保自己管理的系统处于一个良好的状态是其首要责任。Linux 系统管理员可以找到有很多工具来帮助自己监控和显示系统中的进程，例如 top 和 htop ,但是这些工具都不能与 **collectl** 相媲美。 

![Collectl: Linux Performance Monitoring](http://www.tecmint.com/wp-content/uploads/2014/04/Collectl-Linux-Monitoring.jpg)


**collectl**是一款非常优秀并且有着丰富的命令行功能的实用程序，你可以用它来采集描述当前系统状态的性能数据。不同于大多数其它的系统监控工具，collectl 并非仅局限于有限的系统度量，相反，它可以收集许多不同类型系统资源的相关信息，如 cpu 、disk、memory 、network 、sockets 、 tcp 、inodes 、infiniband 、 lustre 、memory、nfs、processes、quadrics、slabs和buddyinfo等。

使用 **collectl** 的另一个好处就是它可以替代那些特定用途的工具如： top、ps、iotop 等等其它工具。那么 **collectl** 有什么特性而使其成为一个有用的工具呢？

经过许多研究后，我总结了 collectl 的命令行功能的一些非常重要的特性。

### Collectl 特性 ###

- 可以交互式地运行或作为一个守护进程，或同时二者兼备地运行。

- 可以以多种格式显示输出。

- 可以监控几乎所有的子系统。

- 可以替代许多工具如 ps、top、iotop、vmstat。

- 可以记录并回放捕获的数据。

- 可以将数据导出成多种数据格式。（这在你想用外部工具分析数据时非常有用） 

- 可以作为一个服务来监控远程机或者整个服务器集群。

- 可以在终端显示数据，写入数据到文件或者一个套接字。

### 如何在Linux上安装collectl###

**collectl**可以在所有的 Linux 发行版上运行，唯一需要的就是 perl 语言，所以在安装 **collectl** 之前，一定要确保你的电脑上已经安装了**Perl**。

#### 对于Debian/Ubuntu/Linux Mint ####

下面的命令可以用来在以 Debian 为基础的设备如 Ubuntu 上安装 collectl。

    $ sudo apt-get install collectl
 
#### 对于RHEL/CentOS/Fedora ####

如果你正在使用基于红帽的发行版，你可以用 yum 命令轻松获取它。

    # yum install collectl

### 一些关于collectl的实例 ###

collectl 工具安装完成之后，你可以轻松地在终端运行它，你甚至不需要指定任何选项。下面的命令将会以简短易读的格式显示cpu、硬盘和网络信息。

    # collectl

    waiting for 1 second sample...
    #
    #cpu sys inter  ctxsw KBRead  Reads KBWrit Writes   KBIn  PktIn  KBOut  PktOut 
      13   5   790   1322      0      0     92      7      4     13      0       5 
      10   2   719   1186      0      0      0      0      3      9      0       4 
      12   0   753   1188      0      0     52      3      2      5      0       6 
      13   2   733   1063      0      0      0      0      1      1      0       1 
      25   2   834   1375      0      0      0      0      1      1      0       1 
      28   2   870   1424      0      0     36      7      1      1      0       1 
      19   3   949   2271      0      0     44      3      1      1      0       1 
      17   2   809   1384      0      0      0      0      1      6      0       6 
      16   2   732   1348      0      0      0      0      1      1      0       1 
      22   4   993   1615      0      0     56      3      1      2      0       3


正如上面终端上所显示的，我们很容易观察该命令输出的系统度量值，因为它每次以一行显示。

不加任何参数执行 collectl 会显示下面子系统的信息

- cpu
- 磁盘
- 网络

**提示**：在这里，一个子系统就是每一种可以测量的系统资源。

你也可以显示除slabs以外各个子系统的统计数据，这要结合下面的 **-all** 选项来实现。


    # collectl --all

    waiting for 1 second sample...
    #
    #cpu sys inter  ctxsw Cpu0 Cpu1 Free Buff Cach Inac Slab  Map   Fragments KBRead  Reads KBWrit Writes   KBIn  PktIn  KBOut  PktOut   IP  Tcp  Udp Icmp  Tcp  Udp  Raw Frag Handle Inodes  Reads Writes Meta Comm 
      16   3   817   1542  430  390   1G 175M   1G 683M 193M   1G nsslkjjebbk      0      0     24      3      1      1      0       1    0    0    0    0  623    0    0    0   8160 240829      0      0    0    0 
      11   1   745   1324  316  426   1G 175M   1G 683M 193M   1G nsslkjjebbk      0      0      0      0      0      3      0       2    0    0    0    0  622    0    0    0   8160 240828      0      0    0    0 
      15   2   793   1683  371  424   1G 175M   1G 683M 193M   1G ssslkjjebbk      0      0      0      0      1      1      0       1    0    0    0    0  622    0    0    0   8160 240829      0      0    0    0 
      16   2   872   1875  427  446   1G 175M   1G 683M 193M   1G ssslkjjebbk      0      0     24      3      1      1      0       1    0    0    0    0  622    0    0    0   8160 240828      0      0    0    0 
      24   2   842   1383  473  368   1G 175M   1G 683M 193M   1G ssslkjjebbk      0      0    168      6      1      1      0       1    0    0    0    0  622    0    0    0   8160 240828      0      0    0    0 
      27   3   844   1099  478  365   1G 175M   1G 683M 193M   1G nsslkjjebbk      0      0      0      0      1      6      1       9    0    0    0    0  622    0    0    0   8160 240828      0      0    0    0 
      26   5   823   1238  396  428   1G 175M   1G 683M 193M   1G ssslkjjebbk      0      0      0      0      2     11      3       9    0    0    0    0  622    0    0    0   8160 240828      0      0    0    0 
      15   1   753   1276  361  391   1G 175M   1G 683M 193M   1G ssslkjjebbk      0      0     40      3      1      2      0       3    0    0    0    0  623    0    0    0   8160 240829      0      0    0    0


但是，你如何用它来监控 cpu 的使用情况呢？ ‘-s’ 选项可以用来控制哪个子系统的数据需要收集和回放。

例如下面的命令可以用来对cpu使用情况进行一个总结。

    # collectl -sc

    waiting for 1 second sample...
    #
    #cpu sys inter  ctxsw 
      15   2   749   1155 
      16   3   772   1445 
      14   2   793   1247 
      27   4   887   1292 
      24   1   796   1258 
      16   1   743   1113 
      15   1   743   1179 
      14   1   706   1078 
      15   1   764   1268

当你将这个命令与“**scdn**”结合时会发生什么呢？学习命令行工具最好的方式就是多加练习，所以在终端运行下面的命令看看会发生什么吧。

    # collectl -scdn

    waiting for 1 second sample...
    #
    #cpu sys inter  ctxsw KBRead  Reads KBWrit Writes   KBIn  PktIn  KBOut  PktOut 
      25   4   943   3333      0      0      0      0      1      1      0       2 
      27   3   825   2910      0      0      0      0      1      1      0       1 
      27   5   886   2531      0      0      0      0      0      0      0       1 
      20   4   872   2406      0      0      0      0      1      1      0       1 
      26   1   854   2091      0      0     20      2      1      1      0       1 
      39   4  1004   3398      0      0      0      0      2      8      3       6 
      41   6   955   2464      0      0     40      3      1      2      0       3 
      25   7   890   1609      0      0      0      0      1      1      0       1 
      16   2   814   1165      0      0    796     43      2      2      0       2 
      14   1   779   1383      0      0     48      6      1      1      0       1 
      11   2   795   1285      0      0      0      0      2     14      1      14


你可以很容易就明白默认选项是“**cdn**”，它代表cpu、硬盘和网络数据。运行带这个选项的 collectl 命令的输出和“**collectl －scn**”的输出一样。

如果你想采集内存的数据，用下面的命令。

    # collectl -sm

    waiting for 1 second sample...
    #
    #Free Buff Cach Inac Slab  Map 
       1G 177M   1G 684M 193M   1G 
       1G 177M   1G 684M 193M   1G 
       1G 177M   1G 684M 193M   1G 
       1G 177M   1G 684M 193M   1G 
       1G 177M   1G 684M 193M   1G 
       1G 177M   1G 684M 193M   1G 
       1G 177M   1G 684M 193M   1G 
       1G 177M   1G 684M 193M   1G

当你想要进一步了解内存使用信息、空闲的内存或者与你系统性能有关的重要资料时，上面的输出将是非常有用的。

如果想搜集一点儿 tcp 的数据呢？使用下面的命令来实现吧。

    # collectl -st

    waiting for 1 second sample...
    #
    #  IP  Tcp  Udp Icmp 
        0    0    0    0 
        0    0    0    0 
        0    0    0    0 
        0    0    0    0 
        0    0    0    0 
        0    0    0    0 
        0    0    0    0 
        0    0    0    0 
        0    0    0    0 
        0    0    0    0 
        0    0    0    0


当你熟练到一定程度时，你就可以很轻松地得到你想要的结果了。例如你可以将关于 tcp 的“**t**”选项和关于 cpu 的“**c**”选项组合到一起。下面的命令就是如此。

    # collectl -stc

    waiting for 1 second sample...
    #
    #cpu sys inter  ctxsw   IP  Tcp  Udp Icmp 
      23   8   961   3136    0    0    0    0 
      24   5   916   3662    0    0    0    0 
      21   8   848   2408    0    0    0    0 
      30  10   916   2674    0    0    0    0 
      38   3   826   1752    0    0    0    0 
      31   3   820   1408    0    0    0    0 
      15   5   781   1335    0    0    0    0 
      17   3   802   1314    0    0    0    0 
      17   3   755   1218    0    0    0    0 
      14   2   788   1321    0    0    0    0


对于我们普通大众来说记住这些选项很困难，所以在这里，我整理出了一个列表来总结这个工具支持的选项。

- **b** – buddy info (内存碎片)
- **c** – CPU
- **d** – Disk
- **f** – NFS V3 Data
- **i** – Inode and File System
- **j** – Interrupts
- **l** – Lustre
- **m** – Memory
- **n** – Networks
- **s** – Sockets
- **t** – TCP
- **x** – Interconnect
- **y** – Slabs (系统对象缓存)

对于一个系统管理员或者一个 Linux 用户来说很重要的一种数据就是硬盘的使用情况。下面的命令可以帮你监控硬盘使用情况。

    # collectl -sd

    waiting for 1 second sample...
    #
    #KBRead  Reads KBWrit Writes 
          0      0      0      0 
          0      0      0      0 
          0      0     92      7 
          0      0      0      0 
          0      0     36      3 
          0      0      0      0 
          0      0      0      0 
          0      0    100      7 
          0      0      0      0


你也可以使用“**-sD**”选项来采集单个硬盘的数据，不过你必须知道这就不会显示全部硬盘的信息。

    # collectl -sD

    waiting for 1 second sample...

    # DISK STATISTICS (/sec)
    #           Pct
    #Name       KBytes Merged  IOs Size  KBytes Merged  IOs Size  RWSize  QLen  Wait SvcTim Util
    sda              0      0    0    0      52     11    2   26      26     1     8      8    1
    sda              0      0    0    0       0      0    0    0       0     0     0      0    0
    sda              0      0    0    0      24      0    2   12      12     0     0      0    0
    sda              0      0    0    0     152      0    4   38      38     0     0      0    0
    sda              0      0    0    0     192     45    3   64      64     1    20     20    5
    sda              0      0    0    0     204      0    2  102     102     0     0      0    0
    sda              0      0    0    0       0      0    0    0       0     0     0      0    0
    sda              0      0    0    0     116     26    3   39      38     1    16     16    4
    sda              0      0    0    0       0      0    0    0       0     0     0      0    0
    sda              0      0    0    0       0      0    0    0       0     0     0      0    0
    sda              0      0    0    0      32      5    3   11      10     1    16     16    4
    sda              0      0    0    0       0      0    0    0       0     0     0      0    0


你也可以使用其它详细的子系统来采集详细的数据。下面是详细子系统的一个列表。

- **C** – CPU
- **D** – Disk
- **E** – Environmental data (fan, power, temp), via ipmitool
- **F** – NFS Data
- **J** – Interrupts
- **L** – Lustre OST detail OR client Filesystem detail
- **N** – Networks
- **T** – 65 TCP counters only available in plot format
- **X** – Interconnect
- **Y** – Slabs (system object caches)
- **Z** – Processes

collectl 工具中有许多选项，但是仅用一篇文章来介绍肯定是介绍不过来的。然而如果将它当作 **top** 和 **ps** 工具来使用还是值得一提的。

很容易将 collectl 当作 top 来使用，只要在 Linux 系统的终端运行下面的命令你就会看到和 **top** 工具类似的输出。

    # collectl --top

    # TOP PROCESSES sorted by time (counters are /sec) 13:11:02
    # PID  User     PR  PPID THRD S   VSZ   RSS CP  SysT  UsrT Pct  AccuTime  RKB  WKB MajF MinF Command
    ^COuch!tecmint  20     1   40 R    1G  626M  0  0.01  0.14  15  28:48.24    0    0    0  109 /usr/lib/firefox/firefox 
     3403  tecmint  20     1   40 R    1G  626M  1  0.00  0.20  20  28:48.44    0    0    0  600 /usr/lib/firefox/firefox 
     5851  tecmint  20  4666    0 R   17M   13M  0  0.02  0.06   8  00:01.28    0    0    0    0 /usr/bin/perl 
     1682  root     20  1666    2 R  211M   55M  1  0.02  0.01   3  03:10.24    0    0    0   95 /usr/bin/X 
     3454  tecmint  20  3403    8 S  216M   45M  1  0.01  0.02   3  01:23.32    0    0    0    0 /usr/lib/firefox/plugin-container 
     4658  tecmint  20  4657    3 S  207M   17M  1  0.00  0.02   2  00:08.23    0    0    0  142 gnome-terminal 
     2890  tecmint  20  2571    3 S  340M   68M  0  0.00  0.01   1  01:19.95    0    0    0    0 compiz 
     3521  tecmint  20     1   24 S  710M  148M  1  0.01  0.00   1  01:47.84    0    0    0    0 skype 
        1  root     20     0    0 S    3M    2M  0  0.00  0.00   0  00:02.57    0    0    0    0 /sbin/init 
        2  root     20     0    0 S     0     0  1  0.00  0.00   0  00:00.00    0    0    0    0 kthreadd 
        3  root     20     2    0 S     0     0  0  0.00  0.00   0  00:00.60    0    0    0    0 ksoftirqd/0 
        5  root      0     2    0 S     0     0  0  0.00  0.00   0  00:00.00    0    0    0    0 kworker/0:0H 
        7  root      0     2    0 S     0     0  0  0.00  0.00   0  00:00.00    0    0    0    0 kworker/u:0H 
        8  root     RT     2    0 S     0     0  0  0.00  0.00   0  00:04.42    0    0    0    0 migration/0 
        9  root     20     2    0 S     0     0  0  0.00  0.00   0  00:00.00    0    0    0    0 rcu_bh 
       10  root     20     2    0 R     0     0  0  0.00  0.00   0  00:02.22    0    0    0    0 rcu_sched 
       11  root     RT     2    0 S     0     0  0  0.00  0.00   0  00:00.05    0    0    0    0 watchdog/0 
       12  root     RT     2    0 S     0     0  1  0.00  0.00   0  00:00.07    0    0    0    0 watchdog/1 
       13  root     20     2    0 S     0     0  1  0.00  0.00   0  00:00.73    0    0    0    0 ksoftirqd/1 
       14  root     RT     2    0 S     0     0  1  0.00  0.00   0  00:01.96    0    0    0    0 migration/1 
       16  root      0     2    0 S     0     0  1  0.00  0.00   0  00:00.00    0    0    0    0 kworker/1:0H 
       17  root      0     2    0 S     0     0  1  0.00  0.00   0  00:00.00    0    0    0    0 cpuset

最后，当然不是说这不重要，我们在终端运行下面的命令就可以将 collectl 用作 ps 工具了。
你可以得到关于你系统进程的信息，这和在终端运行“**ps**”命令是一样的。

    # collectl -c1 -sZ -i:1

    waiting for 1 second sample...

    ### RECORD    1 >>> tecmint-vgn-z13gn <<< (1397979716.001) (Sun Apr 20 13:11:56 2014) ###

    # PROCESS SUMMARY (counters are /sec)
    # PID  User     PR  PPID THRD S   VSZ   RSS CP  SysT  UsrT Pct  AccuTime  RKB  WKB MajF MinF Command
        1  root     20     0    0 S    3M    2M  0  0.00  0.00   0  00:02.57    0    0    0    0 /sbin/init 
        2  root     20     0    0 S     0     0  1  0.00  0.00   0  00:00.00    0    0    0    0 kthreadd 
        3  root     20     2    0 S     0     0  0  0.00  0.00   0  00:00.60    0    0    0    0 ksoftirqd/0 
        5  root      0     2    0 S     0     0  0  0.00  0.00   0  00:00.00    0    0    0    0 kworker/0:0H 
        7  root      0     2    0 S     0     0  0  0.00  0.00   0  00:00.00    0    0    0    0 kworker/u:0H 
        8  root     RT     2    0 S     0     0  0  0.00  0.00   0  00:04.42    0    0    0    0 migration/0 
        9  root     20     2    0 S     0     0  0  0.00  0.00   0  00:00.00    0    0    0    0 rcu_bh 
       10  root     20     2    0 S     0     0  0  0.00  0.00   0  00:02.24    0    0    0    0 rcu_sched 
       11  root     RT     2    0 S     0     0  0  0.00  0.00   0  00:00.05    0    0    0    0 watchdog/0 
       12  root     RT     2    0 S     0     0  1  0.00  0.00   0  00:00.07    0    0    0    0 watchdog/1 
       13  root     20     2    0 S     0     0  1  0.00  0.00   0  00:00.73    0    0    0    0 ksoftirqd/1 
       14  root     RT     2    0 S     0     0  1  0.00  0.00   0  00:01.96    0    0    0    0 migration/1 
       16  root      0     2    0 S     0     0  1  0.00  0.00   0  00:00.00    0    0    0    0 kworker/1:0H 
       17  root      0     2    0 S     0     0  1  0.00  0.00   0  00:00.00    0    0    0    0 cpuset 
       18  root      0     2    0 S     0     0  1  0.00  0.00   0  00:00.00    0    0    0    0 khelper 
       19  root     20     2    0 S     0     0  0  0.00  0.00   0  00:00.00    0    0    0    0 kdevtmpfs 
       20  root      0     2    0 S     0     0  0  0.00  0.00   0  00:00.00    0    0    0    0 netns 
       21  root     20     2    0 S     0     0  0  0.00  0.00   0  00:00.00    0    0    0    0 bdi-default 
       22  root      0     2    0 S     0     0  0  0.00  0.00   0  00:00.00    0    0    0    0 kintegrityd


我确信许多系统管理员将会喜欢这个工具并且在充分使用它后会感受到它的强大。如果你想增进你对 collectl 的了解，从而达到新的层面，你可以去参阅 collectl 的 man 手册并勤加练习。

在你的终端键入下面的命令开始阅读吧。

    # man collectl

### 参考链接 ###

- [collectl Homepage][1]

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-performance-monitoring-with-collectl-tool/

译者：[Linchenguang](https://github.com/Linchenguang) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://collectl.sourceforge.net/index.html
