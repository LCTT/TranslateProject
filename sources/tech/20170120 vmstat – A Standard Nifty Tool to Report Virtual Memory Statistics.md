vmstat – A Standard Nifty Tool to Report Virtual Memory Statistics
============================================================

#### What’s RAM ?

As we already know about RAM because we all are in smartphone world. So, i don’t want to go in depth, even though i will tell you in single line. RAM stands for `Random Access Memory` is a computer data storage, which stores frequently used program to increase the system performance.

#### What’s Virtual Memory ?

virtual memory is a memory management method that allows a computer to balance/manage the shortages of physical memory by temporarily transferring recently unused applications data from RAM to hard disk. [Read More][4]

#### What’s vmstat ?

vmstat is a standard nifty tool that report virtual memory statistics of Linux system. vmstat reports information about processes, memory, paging, block IO, traps, and cpu activity. It helps Linux administrator to identify system bottlenecks while troubleshooting the issues.

#### Install Sysstat in Linux

There is no separate package for `vmstat` on Linux. It’s bundled with `sysstat` package and available in most of the distribution default repository. If it’s not installed, just fire the following command based on your distribution.

[SAR Command Usage][5]

```
[Install vmstat on CentOS/RHEL]
$ sudo yum install sysstat

[Install vmstat on Fedora]
$ sudo dnf install sysstat

[Install vmstat on Debian/Ubuntu]
$ sudo apt-get install sysstat

[Install vmstat on Arch Linux]
$ sudo pacman -S sysstat

[Install vmstat on Mageia]
$ sudo urpmi sysstat

[Install vmstat on openSUSE]
$ sudo zypper install sysstat
```

#### Rum vmstat without parameter

Let’s assume, you have successfully installed vmstat then run the `vmstat` command on terminal without any parameter which will show you a default result of vmstat.

```
# vmstat
procs -----------memory---------- ---swap-- -----io---- -system-- ----cpu----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa
 2  0  79496 1614120 139240 787928   0    0    23    10    0    0 11  1 88  0
```

When you saw the above output, you might know few things what it is and the purpose. Don’t worry we will explain each and every parameter deeply, so that you can understand the vmstat usage & purpose.

procs : procs own `r & b` column which reports about process statistics. In the above output there are two processes in the run queue waiting for CPU & zero sleep process. Usually, it should not exceed number of processors (or cores), if you found abnormal on this better to use [top command][1] for further troubleshooting.

*   r : The number of processes waiting for run time.
*   b : The number of processes in sleeping stat.

memory : memory own `swpd`, `free`, `buff` & `cache` column which reports about memory statistics. The same information you can see with help of free -m command. In the above output memory statistics shows in kilobytes which is bit difficult to understand, better to add `M` parameter to get the statistics with megabytes.

*   swpd : The amount of virtual memory used.
*   free : The amount of idle memory.
*   buff : The amount of memory used as buffers.
*   cache : The amount of memory used as cache.
*   inact : The amount of inactive memory.
*   active : The amount of active memory.

swap : swap own `si` & `so` column which reports about swap memory statistics. The same information you can see with help of free -m command.

*   si : Amount of memory swapped from disk (memory moved from swap to real memory).
*   so : Amount of memory swapped to disk (memory moved from real memory to swap).

I/O : I/O own `bi` & `bo` column which reports about disk read & write statistics per second in terms of blocks read and blocks written. If you found huge I/O read & write better to navigate [iotop][2] & [iostat][3] command.

*   bi : Number of Blocks received from a block device.
*   bo : Number of Blocks sent to a block device.

system : system own `in` & `cs` column which reports about system operations per second. If you found huge I/O read & write better to navigate iotop & iostat command.

*   in : The number of system interrupts per second, including the clock.
*   cs : Number of Blocks sent to a block device.

CPU : CPU own `cs`, `us`, `sy`, `id` & `wa` column which reports about CPUs resources percentages of total CPU time. If you found abnormal better to navigate top & free command.

*   cs : The number of system interrupts per second, including the clock.
*   us : Number of Blocks sent to a block device.
*   sy : The amount of memory used as cache.
*   id : The amount of inactive memory.
*   wa : The amount of active memory.

#### Display output in Megabytes

By default vmstat shows memory statistics output in kilobytes which is very difficult to understand, better to add `-S & m` parameters to get the statistics with megabytes.

```
# vmstat -S m
procs -----------memory---------- ---swap-- -----io---- -system-- ----cpu----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa
 1  0    103    371    406   2116    0    0    40    15    0    0 11  1 87  0
```

#### Run vmstat with delay for better statistics

By default vmstat shows single statistics output which is not enough to troubleshoot further so, add delay (delay is the delay between updates in seconds) which capture the activity periodically. If you want to run vmstat with 2 second delay, just use the below command (If you want more delay you can change as per your wish).

The following command will run every 2 seconds until you exit.

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

#### Run vmstat with delay & counts

Alternatively you can run vmstat with delay and specific counts, once it reach the given counts then exit automatically.

The following command will run every 2 seconds with 10 counts then exit automatically.

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

#### To show active & inactive memory

By default vmstat shows memory statistics except active & inactive memory. If you want to see active & inactive memory statistics, add `-a` parameters followed by vmstat command.

```
# vmstat -a
procs -----------memory---------- ---swap-- -----io---- -system-- ----cpu----
 r  b   swpd   free  inact active   si   so    bi    bo   in   cs us sy id wa
 1  0 105500 2387592 415148 584112   0    0    40    15    0    1 11  1 87  0
```

#### To print disk statistics

Add `-d` parameter with vmstat which will shows each disk statistics in separate line (included read, write & IO).

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

#### To summarize disk statistics

Add `-D` parameter with vmstat which will shows overall disk statistics (included total disks, partitions, total reads, merged reads, read sectors, writes, merged writes, written sectors & IO).

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

#### To print specific partition statistics

Add `-p` parameter followed by device name with vmstat which will shows specific partition statistics (included reads, read sectors, writes & requested writes).

```
# vmstat -p /dev/sdb1
sdb1          reads   read sectors  writes    requested writes
                3115      27890     839453  206728016
```

#### To print vmstat statistics with timestamp

When you want to find the memory spikes on particular duration, add `-t` parameter followed by delay & counts with wmstat command.

Note : This combination will not work with Debian based systems.

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

#### To print more statistics

Add `-s` parameter with vmstat which will shows summarize of various statistics.

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

#### To print slabinfo

Add `-m` parameter with vmstat which will shows slabinfo.

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

#### Read more about vmstat

If you want to know more option which is available for vmstat, simply navigate to man page.

```
# vmstat --help
or
# man vmstat
```

--------------------------------------------------------------------------------

作者简介：

![](http://1.gravatar.com/avatar/d487bef1de15143a7b80a40396e96118?s=256&d=mm&r=g)

Love to play with all Linux distribution

--------------------------------------------------------------------------------

via: http://www.2daygeek.com/linux-vmstat-command-examples-tool-report-virtual-memory-statistics/

作者：[Magesh Maruthamuthu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/author/magesh/
[1]:http://www.2daygeek.com/top-command-examples-to-monitor-server-
[2]:http://www.2daygeek.com/monitor-disk-io-activity-using-iotop-
[3]:http://www.2daygeek.com/monitor-disk-io-activity-using-iotop-
[4]:https://en.wikipedia.org/wiki/Virtual_memory
[5]:http://www.2daygeek.com/sar-command-examples-system-performance-monitoring-linux/
