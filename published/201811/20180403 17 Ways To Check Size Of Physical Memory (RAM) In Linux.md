17 种查看 Linux 物理内存的方法
=======

大多数系统管理员在遇到性能问题时会检查 CPU 和内存利用率。Linux 中有许多实用程序可以用于检查物理内存。这些命令有助于我们检查系统中存在的物理内存，还允许用户检查各种方面的内存利用率。

我们大多数人只知道很少的命令，在本文中我们试图包含所有可能的命令。

你可能会想，为什么我想知道所有这些命令，而不是知道一些特定的和例行的命令呢。

不要觉得没用或对此有负面的看法，因为每个人都有不同的需求和看法，所以，对于那些在寻找其它目的的人，这对于他们非常有帮助。

### 什么是 RAM

计算机内存是能够临时或永久存储信息的物理设备。RAM 代表随机存取存储器，它是一种易失性存储器，用于存储操作系统，软件和硬件使用的信息。

有两种类型的内存可供选择：

 * 主存
 * 辅助内存

主存是计算机的主存储器。CPU 可以直接读取或写入此内存。它固定在电脑的主板上。

 * **RAM**：随机存取存储器是临时存储。关闭计算机后，此信息将消失。
 * **ROM**： 只读存储器是永久存储，即使系统关闭也能保存数据。

### 方法-1：使用 free 命令

`free` 显示系统中空闲和已用的物理内存和交换内存的总量，以及内核使用的缓冲区和缓存。它通过解析 `/proc/meminfo` 来收集信息。

**建议阅读：** [free – 在 Linux 系统中检查内存使用情况统计（空闲和已用）的标准命令][1]

```
$ free -m
              total        used        free      shared  buff/cache   available
Mem:           1993        1681          82          81         228         153
Swap:         12689        1213       11475

$ free -g
              total        used        free      shared  buff/cache   available
Mem:              1           1           0           0           0           0
Swap:            12           1          11
```

### 方法-2：使用 /proc/meminfo 文件

`/proc/meminfo` 是一个虚拟文本文件，它包含有关系统 RAM 使用情况的大量有价值的信息。

它报告系统上的空闲和已用内存（物理和交换）的数量。

```
$ grep MemTotal /proc/meminfo
MemTotal:        2041396 kB

$ grep MemTotal /proc/meminfo | awk '{print $2 / 1024}'
1993.55

$ grep MemTotal /proc/meminfo | awk '{print $2 / 1024 / 1024}'
1.94683
```

### 方法-3：使用 top 命令

`top` 命令是 Linux 中监视实时系统进程的基本命令之一。它显示系统信息和运行的进程信息，如正常运行时间、平均负载、正在运行的任务、登录的用户数、CPU 数量和 CPU 利用率，以及内存和交换信息。运行 `top` 命令，然后按下 `E` 来使内存利用率以 MB 为单位显示。

**建议阅读：** [TOP 命令示例监视服务器性能][2]

```
$ top

top - 14:38:36 up  1:59,  1 user,  load average: 1.83, 1.60, 1.52
Tasks: 223 total,   2 running, 221 sleeping,   0 stopped,   0 zombie
%Cpu(s): 48.6 us, 11.2 sy,  0.0 ni, 39.3 id,  0.3 wa,  0.0 hi,  0.5 si,  0.0 st
MiB Mem : 1993.551 total,   94.184 free, 1647.367 used,  252.000 buff/cache
MiB Swap: 12689.58+total, 11196.83+free, 1492.750 used.  306.465 avail Mem 

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND                                                                                                                                        
 9908 daygeek   20   0 2971440 649324  39700 S  55.8 31.8  11:45.74 Web Content                                                                                                                                    
21942 daygeek   20   0 2013760 308700  69272 S  35.0 15.1   4:13.75 Web Content                                                                                                                                    
 4782 daygeek   20   0 3687116 227336  39156 R  14.5 11.1  16:47.45 gnome-shell
```

### 方法-4：使用 vmstat 命令

`vmstat` 是一个漂亮的标准工具，它报告 Linux 系统的虚拟内存统计信息。`vmstat` 报告有关进程、内存、分页、块 IO、陷阱和 CPU 活动的信息。它有助于 Linux 管理员在故障检修时识别系统瓶颈。

**建议阅读：** [vmstat – 一个报告虚拟内存统计信息的标准且漂亮的工具][3]

```
$ vmstat -s | grep "total memory"
      2041396 K total memory
	  
$ vmstat -s -S M | egrep -ie 'total memory'
         1993 M total memory

$ vmstat -s | awk '{print $1 / 1024 / 1024}' | head -1
1.94683

```

### 方法-5：使用 nmon 命令

`nmon` 是另一个很棒的工具，用于在 Linux 终端上监视各种系统资源，如 CPU、内存、网络、磁盘、文件系统、NFS、top 进程、Power 的微分区和资源（Linux 版本和处理器）。

只需按下 `m` 键，即可查看内存利用率统计数据（缓存、活动、非活动、缓冲、空闲，以 MB 和百分比为单位）。

**建议阅读：** [nmon – Linux 中一个监视系统资源的漂亮的工具][4]

```
┌nmon─14g──────[H for help]───Hostname=2daygeek──Refresh= 2secs ───07:24.44─────────────────┐
│ Memory Stats ─────────────────────────────────────────────────────────────────────────────│
│                RAM     High      Low     Swap    Page Size=4 KB                           │
│ Total MB     32079.5     -0.0     -0.0  20479.0                                           │
│ Free  MB     11205.0     -0.0     -0.0  20479.0                                           │
│ Free Percent    34.9%   100.0%   100.0%   100.0%                                          │
│             MB                  MB                  MB                                    │
│                      Cached= 19763.4     Active=  9617.7                                  │
│ Buffers=   172.5 Swapcached=     0.0  Inactive = 10339.6                                  │
│ Dirty  =     0.0 Writeback =     0.0  Mapped   =    11.0                                  │
│ Slab   =   636.6 Commit_AS =   118.2 PageTables=     3.5                                  │
│───────────────────────────────────────────────────────────────────────────────────────────│
│                                                                                           │
│                                                                                           │
│                                                                                           │
│                                                                                           │
│                                                                                           │
│                                                                                           │
└───────────────────────────────────────────────────────────────────────────────────────────┘
```

### 方法-6：使用 dmidecode 命令

`dmidecode` 是一个读取计算机 DMI 表内容的工具，它以人类可读的格式显示系统硬件信息。（DMI 意即桌面管理接口，也有人说是读取的是 SMBIOS —— 系统管理 BIOS）

此表包含系统硬件组件的描述，以及其它有用信息，如序列号、制造商信息、发布日期和 BIOS 修改等。

**建议阅读：** [Dmidecode – 获取 Linux 系统硬件信息的简便方法][5]

```
# dmidecode -t memory | grep  Size:
        Size: 8192 MB
        Size: No Module Installed
        Size: No Module Installed
        Size: 8192 MB
        Size: No Module Installed
        Size: No Module Installed
        Size: No Module Installed
        Size: No Module Installed
        Size: No Module Installed
        Size: No Module Installed
        Size: No Module Installed
        Size: No Module Installed
        Size: 8192 MB
        Size: No Module Installed
        Size: No Module Installed
        Size: 8192 MB
        Size: No Module Installed
        Size: No Module Installed
        Size: No Module Installed
        Size: No Module Installed
        Size: No Module Installed
        Size: No Module Installed
        Size: No Module Installed
        Size: No Module Installed
```

只打印已安装的 RAM 模块。

```                           
# dmidecode -t memory | grep  Size: | grep -v "No Module Installed"
        Size: 8192 MB
        Size: 8192 MB
        Size: 8192 MB
        Size: 8192 MB     
```

汇总所有已安装的 RAM 模块。

```
# dmidecode -t memory | grep  Size: | grep -v "No Module Installed" | awk '{sum+=$2}END{print sum}'
32768
```

### 方法-7：使用 hwinfo 命令

`hwinfo` 意即硬件信息，它是另一个很棒的实用工具，用于探测系统中存在的硬件，并以人类可读的格式显示有关各种硬件组件的详细信息。

它报告有关 CPU、RAM、键盘、鼠标、图形卡、声音、存储、网络接口、磁盘、分区、BIOS 和网桥等的信息。

**建议阅读：** [hwinfo（硬件信息）– 一个在 Linux 系统上检测系统硬件信息的好工具][6]

```
$ hwinfo --memory
01: None 00.0: 10102 Main Memory
  [Created at memory.74]
  Unique ID: rdCR.CxwsZFjVASF
  Hardware Class: memory
  Model: "Main Memory"
  Memory Range: 0x00000000-0x7a4abfff (rw)
  Memory Size: 1 GB + 896 MB
  Config Status: cfg=new, avail=yes, need=no, active=unknown
```

### 方法-8：使用 lshw 命令

`lshw`（代表 Hardware Lister）是一个小巧的工具，可以生成机器上各种硬件组件的详细报告，如内存配置、固件版本、主板配置、CPU 版本和速度、缓存配置、USB、网卡、显卡、多媒体、打印机、总线速度等。

它通过读取 `/proc` 目录和 DMI 表中的各种文件来生成硬件信息。

**建议阅读：** [LSHW (Hardware Lister) – 一个在 Linux 上获取硬件信息的好工具][7]

```
$ sudo lshw -short -class memory
[sudo] password for daygeek: 
H/W path      Device       Class       Description
==================================================
/0/0                       memory      128KiB BIOS
/0/1                       memory      1993MiB System memory
```

### 方法-9：使用 inxi 命令

`inxi` 是一个很棒的工具，它可以检查 Linux 上的硬件信息，并提供了大量的选项来获取 Linux 系统上的所有硬件信息，这些特性是我在 Linux 上的其它工具中从未发现的。它是从 locsmif 编写的古老的但至今看来都异常灵活的 infobash 演化而来的。

`inxi` 是一个脚本，它可以快速显示系统硬件、CPU、驱动程序、Xorg、桌面、内核、GCC 版本、进程、RAM 使用情况以及各种其它有用的信息，还可以用于论坛技术支持和调试工具。

**建议阅读：** [inxi – 一个检查 Linux 上硬件信息的好工具][8]

```
$ inxi -F | grep "Memory"
Info:      Processes: 234 Uptime: 3:10 Memory: 1497.3/1993.6MB Client: Shell (bash) inxi: 2.3.37 
```

### 方法-10：使用 screenfetch 命令

`screenfetch` 是一个 bash 脚本。它将自动检测你的发行版，并在右侧显示该发行版标识的 ASCII 艺术版本和一些有价值的信息。

**建议阅读：** [ScreenFetch – 以 ASCII 艺术标志在终端显示 Linux 系统信息][9]

```
$ screenfetch
                          ./+o+-       daygeek@ubuntu
                  yyyyy- -yyyyyy+      OS: Ubuntu 17.10 artful
               ://+//////-yyyyyyo      Kernel: x86_64 Linux 4.13.0-37-generic
           .++ .:/++++++/-.+sss/`      Uptime: 44m
         .:++o:  /++++++++/:--:/-      Packages: 1831
        o:+o+:++.`..`` `.-/oo+++++/     Shell: bash 4.4.12
       .:+o:+o/.          `+sssoo+/    Resolution: 1920x955
  .++/+:+oo+o:`             /sssooo.   DE: GNOME 
 /+++//+:`oo+o               /::--:.   WM: GNOME Shell
 \+/+o+++`o++o               ++////.   WM Theme: Adwaita
  .++.o+++oo+:`             /dddhhh.   GTK Theme: Azure [GTK2/3]
       .+.o+oo:.          `oddhhhh+    Icon Theme: Papirus-Dark
        \+.++o+o``-````.:ohdhhhhh+     Font: Ubuntu 11
         `:o+++ `ohhhhhhhhyo++os:      CPU: Intel Core i7-6700HQ @ 2x 2.592GHz
           .o:`.syhhhhhhh/.oo++o`      GPU: llvmpipe (LLVM 5.0, 256 bits)
               /osyyyyyyo++ooo+++/     RAM: 1521MiB / 1993MiB
                   ````` +oo+++o\:    
                          `oo++.      
```

### 方法-11：使用 neofetch 命令

`neofetch` 是一个跨平台且易于使用的命令行（CLI）脚本，它收集你的 Linux 系统信息，并将其作为一张图片显示在终端上，也可以是你的发行版徽标，或者是你选择的任何 ascii 艺术。

**建议阅读：** [Neofetch – 以 ASCII 分发标志来显示 Linux 系统信息][10]

```
$ neofetch
            .-/+oossssoo+/-.               daygeek@ubuntu
        `:+ssssssssssssssssss+:`           --------------
      -+ssssssssssssssssssyyssss+-         OS: Ubuntu 17.10 x86_64
    .ossssssssssssssssssdMMMNysssso.       Host: VirtualBox 1.2
   /ssssssssssshdmmNNmmyNMMMMhssssss/      Kernel: 4.13.0-37-generic
  +ssssssssshmydMMMMMMMNddddyssssssss+     Uptime: 47 mins
 /sssssssshNMMMyhhyyyyhmNMMMNhssssssss/    Packages: 1832
.ssssssssdMMMNhsssssssssshNMMMdssssssss.   Shell: bash 4.4.12
+sssshhhyNMMNyssssssssssssyNMMMysssssss+   Resolution: 1920x955
ossyNMMMNyMMhsssssssssssssshmmmhssssssso   DE: ubuntu:GNOME
ossyNMMMNyMMhsssssssssssssshmmmhssssssso   WM: GNOME Shell
+sssshhhyNMMNyssssssssssssyNMMMysssssss+   WM Theme: Adwaita
.ssssssssdMMMNhsssssssssshNMMMdssssssss.   Theme: Azure [GTK3]
 /sssssssshNMMMyhhyyyyhdNMMMNhssssssss/    Icons: Papirus-Dark [GTK3]
  +sssssssssdmydMMMMMMMMddddyssssssss+     Terminal: gnome-terminal
   /ssssssssssshdmNNNNmyNMMMMhssssss/      CPU: Intel i7-6700HQ (2) @ 2.591GHz
    .ossssssssssssssssssdMMMNysssso.       GPU: VirtualBox Graphics Adapter
      -+sssssssssssssssssyyyssss+-         Memory: 1620MiB / 1993MiB
        `:+ssssssssssssssssss+:` 
            .-/+oossssoo+/-.                                       
```

### 方法-12：使用 dmesg 命令

`dmesg`（代表显示消息或驱动消息）是大多数类 Unix 操作系统上的命令，用于打印内核的消息缓冲区。

```
$ dmesg | grep "Memory"
[    0.000000] Memory: 1985916K/2096696K available (12300K kernel code, 2482K rwdata, 4000K rodata, 2372K init, 2368K bss, 110780K reserved, 0K cma-reserved)
[    0.012044] x86/mm: Memory block size: 128MB
```

### 方法-13：使用 atop 命令

`atop` 是一个用于 Linux 的 ASCII 全屏系统性能监视工具，它能报告所有服务器进程的活动（即使进程在间隔期间已经完成）。

它记录系统和进程活动以进行长期分析（默认情况下，日志文件保存 28 天），通过使用颜色等来突出显示过载的系统资源。它结合可选的内核模块 netatop 显示每个进程或线程的网络活动。

**建议阅读：** [Atop – 实时监控系统性能，资源，进程和检查资源利用历史][11]

```
$ atop -m

ATOP - ubuntu                                                   2018/03/31  19:34:08                                                   -------------                                                    10s elapsed
PRC | sys    0.47s  | user   2.75s  |               |              |  #proc    219 |  #trun      1 | #tslpi   802  | #tslpu     0  | #zombie    0  | clones     7 |               |               |  #exit      4 |
CPU | sys       7%  | user     22%  | irq       0%  |              |               |  idle    170% | wait      0%  |               | steal     0%  | guest     0% |               |  curf 2.59GHz |  curscal   ?% |
cpu | sys       3%  | user     11%  | irq       0%  |              |               |  idle     85% | cpu001 w  0%  |               | steal     0%  | guest     0% |               |  curf 2.59GHz |  curscal   ?% |
cpu | sys       4%  | user     11%  | irq       0%  |              |               |  idle     85% | cpu000 w  0%  |               | steal     0%  | guest     0% |               |  curf 2.59GHz |  curscal   ?% |
CPL | avg1    1.98  |               | avg5    3.56  | avg15   3.20 |               |               | csw    14894  |               | intr    6610  |              |               |  numcpu     2 |               |
MEM | tot     1.9G  | free  101.7M  | cache 244.2M  | dirty   0.2M |  buff    6.9M |  slab   92.9M | slrec  35.6M  | shmem  97.8M  | shrss  21.0M  | shswp   3.2M |  vmbal   0.0M |  hptot   0.0M |  hpuse   0.0M |
SWP | tot    12.4G  | free   11.6G  |               |              |               |               |               |               |               |              |  vmcom   7.9G |               |  vmlim  13.4G |
PAG | scan       0  | steal      0  |               | stall      0 |               |               |               |               |               |              |  swin       3 |               |  swout      0 |
DSK |          sda  | busy      0%  |               | read     114 |  write     37 |  KiB/r     21 | KiB/w      6  |               | MBr/s    0.2  | MBw/s    0.0 |  avq     6.50 |               |  avio 0.26 ms |
NET | transport     | tcpi      11  | tcpo      17  | udpi       4 |  udpo       8 |  tcpao      3 | tcppo      0  |               | tcprs      3  | tcpie      0 |  tcpor      0 |  udpnp      0 |  udpie      0 |
NET | network       | ipi       20  |               | ipo       33 |  ipfrw      0 |  deliv     20 |               |               |               |              |  icmpi      5 |               |  icmpo      0 |
NET | enp0s3    0%  | pcki      11  | pcko      28  | sp 1000 Mbps |  si    1 Kbps |  so    1 Kbps |               | coll       0  | mlti       0  | erri       0 |  erro       0 |  drpi       0 |  drpo       0 |
NET | lo      ----  | pcki       9  | pcko       9  | sp    0 Mbps |  si    0 Kbps |  so    0 Kbps |               | coll       0  | mlti       0  | erri       0 |  erro       0 |  drpi       0 |  drpo       0 |

   PID        TID     MINFLT      MAJFLT     VSTEXT      VSLIBS      VDATA      VSTACK      VSIZE       RSIZE      PSIZE       VGROW      RGROW      SWAPSZ     RUID          EUID          MEM      CMD        1/1
  2536          -        941           0       188K      127.3M     551.2M        144K       2.3G      281.2M         0K          0K       344K       6556K     daygeek       daygeek       14%      Web Content
  2464          -         75           0       188K      187.7M     680.6M        132K       2.3G      226.6M         0K          0K       212K      42088K     daygeek       daygeek       11%      firefox
  2039          -       4199           6        16K      163.6M     423.0M        132K       3.5G      220.2M         0K          0K      2936K      109.6M     daygeek       daygeek       11%      gnome-shell
 10822          -          1           0         4K      16680K     377.0M        132K       3.4G      193.4M         0K          0K         0K          0K     root          root          10%      java
```

### 方法-14：使用 htop 命令

`htop` 是由 Hisham 用 ncurses 库开发的用于 Linux 的交互式进程查看器。与 `top` 命令相比，`htop` 有许多特性和选项。

**建议阅读：** [使用 Htop 命令监视系统资源][12]

```
$ htop

  1  [|||||||||||||                                                                             13.0%]   Tasks: 152, 587 thr; 1 running
  2  [|||||||||||||||||||||||||                                                                 25.0%]   Load average: 0.91 2.03 2.66 
  Mem[||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||1.66G/1.95G]   Uptime: 01:14:53
  Swp[||||||                                                                               782M/12.4G]

  PID USER      PRI  NI  VIRT   RES   SHR S CPU% MEM%   TIME+  Command
 2039 daygeek    20   0 3541M  214M 46728 S 36.6 10.8 22:36.77 /usr/bin/gnome-shell
 2045 daygeek    20   0 3541M  214M 46728 S 10.3 10.8  3:02.92 /usr/bin/gnome-shell
 2046 daygeek    20   0 3541M  214M 46728 S  8.3 10.8  3:04.96 /usr/bin/gnome-shell
 6080 daygeek    20   0  807M 37228 24352 S  2.1  1.8  0:11.99 /usr/lib/gnome-terminal/gnome-terminal-server
 2880 daygeek    20   0 2205M  164M 17048 S  2.1  8.3  7:16.50 /usr/lib/firefox/firefox -contentproc -childID 6 -isForBrowser -intPrefs 6:50|7:-1|19:0|34:1000|42:20|43:5|44:10|51:0|57:128|58:10000|63:0|65:400|66
 6125 daygeek    20   0 1916M  159M 92352 S  2.1  8.0  2:09.14 /usr/lib/firefox/firefox -contentproc -childID 7 -isForBrowser -intPrefs 6:50|7:-1|19:0|34:1000|42:20|43:5|44:10|51:0|57:128|58:10000|63:0|65:400|66
 2536 daygeek    20   0 2335M  243M 26792 S  2.1 12.2  6:25.77 /usr/lib/firefox/firefox -contentproc -childID 1 -isForBrowser -intPrefs 6:50|7:-1|19:0|34:1000|42:20|43:5|44:10|51:0|57:128|58:10000|63:0|65:400|66
 2653 daygeek    20   0 2237M  185M 20788 S  1.4  9.3  3:01.76 /usr/lib/firefox/firefox -contentproc -childID 4 -isForBrowser -intPrefs 6:50|7:-1|19:0|34:1000|42:20|43:5|44:10|51:0|57:128|58:10000|63:0|65:400|66
```

### 方法-15：使用 corefreq 实用程序

CoreFreq 是为 Intel 64 位处理器设计的 CPU 监控软件，支持的架构有 Atom、Core2、Nehalem、SandyBridge 和 superior，AMD 家族 0F。

CoreFreq 提供了一个框架来以高精确度检索 CPU 数据。

**建议阅读：** [CoreFreq – 一个用于 Linux 系统的强大的 CPU 监控工具][13]

```
$ ./corefreq-cli -k
Linux:                                                                          
|- Release                                                   [4.13.0-37-generic]
|- Version                          [#42-Ubuntu SMP Wed Mar 7 14:13:23 UTC 2018]
|- Machine                                                              [x86_64]
Memory:                                                                         
|- Total RAM                                                          2041396 KB
|- Shared RAM                                                           99620 KB
|- Free RAM                                                            108428 KB
|- Buffer RAM                                                            8108 KB
|- Total High                                                               0 KB
|- Free High                                                                0 KB
```

### 方法-16：使用 glances 命令

Glances 是用 Python 编写的跨平台基于 curses（LCTT 译注：curses 是一个 Linux/Unix 下的图形函数库）的系统监控工具。我们可以说它一应俱全，就像在最小的空间含有最大的信息。它使用 psutil 库从系统中获取信息。

Glances 可以监视 CPU、内存、负载、进程列表、网络接口、磁盘 I/O、Raid、传感器、文件系统（和文件夹）、Docker、监视器、警报、系统信息、正常运行时间、快速预览（CPU、内存、负载）等。

**建议阅读：** [Glances (一应俱全)– 一个 Linux 的高级的实时系
统性能监控工具][14]

```
$ glances

ubuntu (Ubuntu 17.10 64bit / Linux 4.13.0-37-generic) - IP 192.168.1.6/24                                                                                                                           Uptime: 1:08:40

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

### 方法-17 : 使用 Gnome 系统监视器

Gnome 系统监视器是一个管理正在运行的进程和监视系统资源的工具。它向你显示正在运行的程序以及耗费的处理器时间，内存和磁盘空间。

![][16]


--------------------------------------------------------------------------------

via: https://www.2daygeek.com/easy-ways-to-check-size-of-physical-memory-ram-in-linux/

作者：[Ramya Nuvvula][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/ramya/
[1]:https://www.2daygeek.com/free-command-to-check-memory-usage-statistics-in-linux/
[2]:https://www.2daygeek.com/top-command-examples-to-monitor-server-performance/
[3]:https://www.2daygeek.com/linux-vmstat-command-examples-tool-report-virtual-memory-statistics/
[4]:https://www.2daygeek.com/nmon-system-performance-monitor-system-resources-on-linux/
[5]:https://www.2daygeek.com/dmidecode-get-print-display-check-linux-system-hardware-information/
[6]:https://www.2daygeek.com/hwinfo-check-display-detect-system-hardware-information-linux/
[7]:https://www.2daygeek.com/lshw-find-check-system-hardware-information-details-linux/
[8]:https://www.2daygeek.com/inxi-system-hardware-information-on-linux/
[9]:https://www.2daygeek.com/screenfetch-display-linux-systems-information-ascii-distribution-logo-terminal/
[10]:https://www.2daygeek.com/neofetch-display-linux-systems-information-ascii-distribution-logo-terminal/
[11]:https://www.2daygeek.com/atop-system-process-performance-monitoring-tool/
[12]:https://www.2daygeek.com/htop-command-examples-to-monitor-system-resources/
[13]:https://www.2daygeek.com/corefreq-linux-cpu-monitoring-tool/
[14]:https://www.2daygeek.com/install-glances-advanced-real-time-linux-system-performance-monitoring-tool-on-centos-fedora-ubuntu-debian-opensuse-arch-linux/
[15]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[16]:https://www.2daygeek.com/wp-content/uploads/2018/03/check-memory-information-using-gnome-system-monitor.png
