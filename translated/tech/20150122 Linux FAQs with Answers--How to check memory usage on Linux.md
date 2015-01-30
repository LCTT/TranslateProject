Linux有问必答：如何检查Linux的内存使用状况
================================================================================

>**问题**：我想要监测Linux系统的内存使用状况。有哪些可用的图形界面或者命令行工具来检查当前内存使用情况？

当涉及到Linux系统性能优化的时候，物理内存是一个最重要的因素。自然的，Linux提供了丰富的选择来监测对于珍贵的内存资源的使用。不同的工具，在监测粒度（例如：全系统范围, 每个进程, 每个用户），接口（例如：图形用户界面, 命令行, ncurses）或者运行模式（交互模式, 批量处理模式）上都不尽相同。

下面是一个可供选择的但并不全面的图形或命令行工具列表，这些工具用来检查并且释放Linux平台中内存。

### 1. /proc/meminfo ###

一种最简单的方法是通过“/proc/meminfo”来检查内存使用状况。这个动态更新的虚拟文件事实上是许多信息资源的集中展示，这些资源来自于诸如free，top和ps这些与内存相关的工具。从可用/闲置物理内存数量到等待被写入缓存的数量或者已写回磁盘的数量，只要是你想要的关于内存使用的信息，“/proc/meminfo”应有尽有。特定进程的内存信息也可以通过“/proc/<pid>/statm”和“/proc/<pid>/status”来获取。

    $ cat /proc/meminfo

![](https://farm8.staticflickr.com/7483/15989497899_bb6afede11_b.jpg)

### 2. atop ###

atop命令是用于终端环境的基于ncurses的交互系统和进程监测工具。它展示了动态更新的系统资源（中央处理器, 内存, 网络, 输入/输出, 内核）摘要，并且用醒目的颜色将高系统负载的警告信息标注出来。它同样提供了类似于top的线程（或用户）资源使用视图，因此系统管理员可以指出哪个进程或者用户对系统负载负责。内存统计报告包括了总计/闲置内存，缓存的/缓冲的内存 和 提交的虚拟内存。

    $ sudo atop

![](https://farm8.staticflickr.com/7552/16149756146_893773b84c_b.jpg)

### 3. free ###

free命令是一个用来获得内存使用概况的快速简单的方法，这些信息从“/proc/meminfo”获取。它提供了一个快照用于展示总计/闲置的物理内存和系统交换区，以及已使用/闲置的内核缓冲区。

    $ free -h

![](https://farm8.staticflickr.com/7531/15988117988_ba8c6b7b63_b.jpg)

### 4. GNOME System Monitor ###

GNOME System Monitor 是一个图形界面应用，它展示了包括中央处理器，内存，交换区和网络在内的系统资源使用率的短暂历史记录。它同时也可以提供一个带有中央处理器和内存使用情况的进程视图。

    $ gnome-system-monitor

![](https://farm8.staticflickr.com/7539/15988118078_279f0da494_c.jpg)

### 5. htop ###

htop命令是一个基于ncurses的交互处理视图，它实时展示了每个进程的内存使用情况。它可以报告所有运行中进程的常驻内存大小（RSS）、内存中程序的总大小、库大小、共享文件大小、和脏页面大小。你可以横向或者纵向滚动进程列表进行查看。

    $ htop

![](https://farm9.staticflickr.com/8236/8599814378_de071de408_c.jpg)

### 6. KDE System Monitor ###

就像GNOME桌面拥有GNOME System Monitor一样，KDE桌面也有它自己的对口应用：KDE System Monitor。这个工具的功能与GNOME版本极其相似，也就是说，它同样展示了一个关于系统资源使用情况，以及带有每个进程的中央处理器/内存消耗情况的实时历史记录。

    $ ksysguard

![](https://farm8.staticflickr.com/7479/15991397329_ec5d786ffd_c.jpg)

### 7. memstat ###

memstat工具对于识别正在消耗虚拟内存的可执行文件、进程和共享库非常有用。给出一个进程识别号，memstat即可识别出与之相关联的可执行文件、数据和共享库究竟使用了多少虚拟内存。

    $ memstat -p <PID>

![](https://farm8.staticflickr.com/7518/16175635905_1880e50055_b.jpg)

### 8. nmon ###

nmon工具是一个基于ncurses系统基准测试工具，它能够以交互方式监测中央处理器、内存、磁盘输入/输出、内核、文件系统以及网络资源。对于内存使用状况而言，它能够展示像总计/闲置内存、交换区、缓冲的/缓存的内存，虚拟内存页面输入输出统计，所有这些都是实时的。

    $ nmon

![](https://farm9.staticflickr.com/8648/15989760117_30f62f4aba_b.jpg)

### 9. ps ###

ps命令能够实时展示每个进程的内存使用状况。内存使用报告里包括了 %MEM (物理内存使用百分比), VSZ (虚拟内存使用总量), and RSS (物理内存使用总量)。你可以使用“--sort”选项来对进程列表排序。例如，按照RSS降序排序：

    $ ps aux --sort -rss

![](https://farm9.staticflickr.com/8602/15989881547_ca40839c19_c.jpg)

### 10. smem ###

[smem][1]命令允许你测定不同进程和用户的物理内存使用状况，这些信息来源于“/proc”目录。它利用比例设置大小（PSS）指标来精确量化Linux进程的有效内存使用情况。内存使用分析能够扩展成为柱状图或者饼图类的图形化图表。

    $ sudo smem --pie name -c "pss"

![](https://farm8.staticflickr.com/7466/15614838428_eed7426cfe_c.jpg)

### 11. top ###

top命令提供了一个运行中进程的实时视图，以及特定进程的各种资源使用统计信息。与内存相关的信息包括 %MEM (内存使用率), VIRT (虚拟内存使用总量), SWAP (交换出的虚拟内存使用量), CODE (分配给代码执行的物理内存数量), DATA (分配给无需执行的数据的物理内存数量), RES (物理内存使用总量; CODE+DATA), and SHR (有可能与其他进程共享的内存数量).你能够基于内存使用情况或者大小对进程列表进行排序。

![](https://farm8.staticflickr.com/7464/15989760047_eb8d51d9f2_c.jpg)

### 12. vmstat ###

vmstat命令行工具显示涵盖了中央处理器、内存、中断和磁盘输入/输出在内的各种系统活动的瞬时和平均统计数据。对于内存信息而言，命令不仅仅展示了物理内存使用情况（例如总计/已使用内存和缓冲的/缓存的内存），还同样展示了虚拟内存统计数据（例如，内存的页输入/输出，交换输入/输出）

    $ vmstat -s

![](https://farm9.staticflickr.com/8582/15988236860_3f142008d2_b.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/check-memory-usage-linux.html

译者：[Ping](https://github.com/mr-ping)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/visualize-memory-usage-linux.html