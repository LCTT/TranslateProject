25个linux性能监控工具
================================================================================
一段时间以来，我们在网上向读者介绍了如何为Linux以及类Linux操作系统配置多种不同的性能监控工具。在这篇文章中我们将罗列一系列使用最频繁的性能监控工具，并对介绍到的每一个工具提供了相应的简介链接，大致将其划分为两类，基于命令行的和提供图形化接口的。

### 基于命令行的性能监控工具 ###

#### 1. dstat - 多类型资源统计工具 ####

该命令整合了**vmstat**，**iostat**和**ifstat**三种命令。同时增加了新的特性和功能允许你能够看到及时的不同的资源使用情况，从而能够使你对比和整合不同的资源使用情况。通过不同颜色和代码块布局的界面帮助你能够更加清晰容易的获取信息。它同时支持将信息数据导出到**cvs**格式文件中，从而用其他应用程序打开，或者导入到数据库中。你可以用该命令来[监控cpu，内存和网络状态随着时间的变化][1]。

![](http://blog.linoxide.com/wp-content/uploads/2014/10/dstat.png)

#### 2. atop - 相比top更好的ASCII码体验 ####

使用**ASCII**码的命令行工具来显示一个性能监控工具能够记录显示所有进程活动。它不但能够展示每日的系统日志，也能够进行长期的进程活动分析，同时也能够高亮过载的系统使用资源。它包含了CPU，内存，交换空间，磁盘和网络层的度量指标。使用所用的功能只需在终端运行**atop**即可。当然你也可以使用[交互接口来显示][2]数据并进行排序。

    # atop


![](http://blog.linoxide.com/wp-content/uploads/2014/10/atop1.jpg)

#### 3. Nmon - 类Unix系统的性能监控 ####

Nmon为**Nigel's Monitor**缩写，它最早开发用来作为**AIX**的系统监控工具。它的特征是**在线模式**，该模式在终端中实时更新监控信息，同时使用光标操作来提高屏幕事件处理效率。使用**捕捉模式**能够将数据保存为**CSV**格式，方便进一步的处理和图形化展示。

![](http://blog.linoxide.com/wp-content/uploads/2014/10/nmon_interface.png)

更多的信息参考我们的[nmon性能监控文章][3]。

#### 4. slabtop - 显示内核slab缓存信息 ####

个应用能够显示**缓存分配器**是如何管理Linux内核缓存不同类型的对象的。这个命令类似于top命令，区别是它重点实时显示内核slab缓存信息。它能够显示按照不同排序条件来显示最靠前的缓存列表。它同时也能够显示一个以slab层信息填充的统计题头。举例如下：

    # slabtop --sort=a
    # slabtop -s b
    # slabtop -s c
    # slabtop -s l
    # slabtop -s v
    # slabtop -s n
    # slabtop -s o

**更多信息参阅**[内核slab缓存文章][4]。

#### 5. sar - 性能监控和瓶颈检查 ####

**sar** 命令是为了标准输出在操作系统上所选的累积活动计数器内容信息。该基于计数值和时间间隔参数的**审计系统**，会按照指定的时间间隔输出指定次数的监控信息。如果时间间隔参数为设置为0，那么[sar命令将会显示系统从开机到当时时刻的平均统计信息][5]。有用的命令如下：

    # sar -u 2 3
    # sar –u –f /var/log/sa/sa05
    # sar -P ALL 1 1
    # sar -r 1 3
    # sar -W 1 3

#### 6. Saidar - 简单的统计监控工具 ####

Saidar是一个**简单**且**轻量**的系统信息监控工具。虽然它无法提供大多性能报表，但是它能够通过一个简短友好的方式显示最有用的系统运行状况数据。你可以很容易地看到[up-time, average load,CPU,内存，进程，磁盘和网络接口][6]统计信息。

    Usage: saidar [-d delay] [-c] [-v] [-h]

    -d Sets the update time in seconds
    -c Enables coloured output
    -v Prints version number
    -h Displays this help information.

![](http://blog.linoxide.com/wp-content/uploads/2014/10/saidar-e1413370985588.png)

#### 7. top - 经典的Linux任务管理工具 ####

作为一个广为认知的**Linux**工具，**top**出现在大多数的类Unix操作系统任务管理中。它可以显示当前正在运行的进程的列表，同时用户可以按照不同的查询条件对该列表进行排序。它主要显示了系统进程对**CPU**和内存的使用状况。top可以快速检查是哪个或哪几个进程挂起了你的系统。你可以在[这里][7]看到top使用的例子。 你可以在终端输入top来运行它并进入到交互模式：

    Quick cheat sheet for interactive mode:

        GLOBAL_Commands: <Ret/Sp> ?, =, A, B, d, G, h, I, k, q, r, s, W, Z
        SUMMARY_Area_Commands: l, m, t, 1
        TASK_Area_Commands Appearance: b, x, y, z Content: c, f, H, o, S, u Size: #, i, n Sorting: <, >, F, O, R
        COLOR_Mapping: <Ret>, a, B, b, H, M, q, S, T, w, z, 0 - 7
        COMMANDS_for_Windows:  -, _, =, +, A, a, G, g, w

![](http://blog.linoxide.com/wp-content/uploads/2014/10/top.png)

#### 8. Sysdig - 系统进程的高级视图 ####

**Sasdig**是一个能够让系统管理员和开发人员前所未有的洞察其系统行为的监控工具。其开发团队出于改善系统层次的监控方式以及通过提供关于**存储，进程，网络和内存**子系统的**统一有序**以及**粒度可见**的方式来进行错误排查，通过创建系统活动记录文件使得你可以在任何时间轻松分析。

简单例子:

    # sysdig proc.name=vim
    # sysdig -p"%proc.name %fd.name" "evt.type=accept and proc.name!=httpd"
    # sysdig evt.type=chdir and user.name=root
    # sysdig -l
    # sysdig -L
    # sysdig -c topprocs_net
    # sysdig -c fdcount_by fd.sport "evt.type=accept"
    # sysdig -p"%proc.name %fd.name" "evt.type=accept and proc.name!=httpd"
    # sysdig -c topprocs_file
    # sysdig -c fdcount_by proc.name "fd.type=file"
    # sysdig -p "%12user.name %6proc.pid %12proc.name %3fd.num %fd.typechar %fd.name" evt.type=open
    # sysdig -c topprocs_cpu
    # sysdig -c topprocs_cpu evt.cpu=0
    # sysdig -p"%evt.arg.path" "evt.type=chdir and user.name=root"
    # sysdig evt.type=open and fd.name contains /etc

![](http://blog.linoxide.com/wp-content/uploads/2014/10/sysdig.jpg)

**更多信息** 可以在 [如何利用sysdig改善系统层次的监控和错误排查][8]

#### 9. netstat - 显示开放的端口和连接 ####

它是**Linux管理员**使用来显示不同网络信息的工具，如查看什么端口开放和什么网络连接已经建立以及何种进程运行在这种连接之上。同时它也显示了**Unix套接**字的信息，这些套接字在不同的程序中为打开状态。作为大多数Linux发行版本的一部分，netstat的许多命令在 [netstat和它的不同输出][9]中有详细的描述。最为常用的如下：

    $ netstat | head -20
    $ netstat -r
    $ netstat -rC
    $ netstat -i
    $ netstat -ie
    $ netstat -s
    $ netstat -g
    $ netstat -tapn

### 10. tcpdump - 洞察网络包 ###

**tcpdump**可以用来查看**网络连接**包的内容。它显示了传输过程中包内容的各种信息。为了使得输出信息更为有用，它允许使用者通过不同的过滤器获取自己想要的信息。可以参照的例子如下：

    # tcpdump -i eth0 not port 22
    # tcpdump -c 10 -i eth0
    # tcpdump -ni eth0 -c 10 not port 22
    # tcpdump -w aloft.cap -s 0
    # tcpdump -r aloft.cap
    # tcpdump -i eth0 dst port 80

你可以找到详细的[描述在topdump和捕捉包][10]文章中。

#### 11. vmstat - 虚拟内存统计信息 ####

**vmstat**是虚拟内存(**virtual memory** statistics)的缩写，作为一个**内存监控**工具，它收集和显示概括关于**内存**，**进程**，**终端**和**分页**和**I/O阻塞**的信息。作为一个开源程序，它可以再大部分Linux发行版本中找到，包括Solaris和FreeBSD。它用来诊断大部分的内存性能问题和其他相关问题

![](http://blog.linoxide.com/wp-content/uploads/2014/10/vmstat_delay_5.png)

**M更多信息** 参考 [vmstat命令文章][11]。

#### 12. free - 内存统计信息 ####

free是另一个能够在终端中标准输出内存和交换空间使用的命令行工具。由于它的简易，它经常用于快速查看内存使用或者是应用于不同的脚本和应用程序中。在这里你可以看到[这个小程序的许多应用][12]。几乎所有的系统管理员日常都会用这个工具。:-)

![](http://blog.linoxide.com/wp-content/uploads/2014/10/free_hs3.png)

#### 13. Htop - 更加友好的top ####

**Htop**基本上是一个top改善版本，它能够显示更多的统计信息和更加多彩的方式，同时允许你采用不同的方式进行排序，它提供了一个**用户友好**的接口。

![](http://blog.linoxide.com/wp-content/uploads/2014/10/htop.png)

你可以找到 **更多的信息** 在 [关于htop和top的比较][13]文章中。

#### 14. ss - 更现代感的网络管理替代工具 ####

**ss**是**iproute2**包的一部分。iproute2趋向于替代一整套标准的**Unix网络**工具组件，它曾经用来完成[网络接口配置，路由表和管理ARP表][14]任务。ss工具用来存储套接字统计信息，也能够类似netstat一样显示信息，同时也能显示更多TCP和状态信息。一些例子如下：

    # ss -tnap
    # ss -tnap6
    # ss -tnap
    # ss -s
    # ss -tn -o state established -p

#### 15. lsof - 列表显示打开的文件 ####

**lsof**命令，意为“**list open files**”, 用于在许多类Unix系统中显示所有打开状态的文件和打开它们的进程。在大部分Linux发行版和其他类Linux操作系统中系统管理员用它来检查不同的进程打开了哪些文件。你可以在这里找到更多的例子。

    # lsof +p process_id
    # lsof | less
    # lsof –u username
    # lsof /etc/passwd
    # lsof –i TCP:ftp
    # lsof –i TCP:80

你可以找到 **更多例子** 在[lsof 文章][15]

#### 16. iftop - 类似top的了网络连接工具 ####

**iftop**是一个基于网络信息的类似top的程序。它能够显示当前时刻按照**带宽使用**量或者上传或者下载量排序的**网络连接**状况。它同事提供了下载文件的预估完成时间。

![](http://blog.linoxide.com/wp-content/uploads/2014/10/iftop.png)

**更多信息**可以参考[网络流量iftop文章][16]

#### 17. iperf - 网络性能工具 ####

**iperf**是一个**网络测试**工具，能够创建**TCP**和**UDP**数据连接和测量该网络能够传输它们的**性能**。它支持调节关于时间，协议和缓冲等不同的参数。对于每一个测试，它会报告带宽，丢包和其他的一些参数。

![](http://blog.linoxide.com/wp-content/uploads/2014/10/iperf-e1413378331696.png)

如果你想用使用这个工具，可以参考这篇文章： [如何安装和使用iperf][17]

#### 18. Smem - 高级内存报表工具 ####

**Smem**是一个比较高级的**Linux**命令行工具，它提供关于系统中已经使用的和共享的实际内存，试图提供一个更为可靠地当前**内存**使用数据。

    $ smem -m
    $ smem -m -p | grep firefox
    $ smem -u -p
    $ smem -w -p

参考我们的文章：[Smem更多的例子][18]

### 图形化或基于Web的性能工具 ###

#### 19. Icinga - Nagios的社区分支版本 ####

**Icinga**是一个**开源免费**的网络监控程序，作为Nagios的分支，它获取了前者现存的大部分功能，同时基于这些功能又增加了社区用户要求已久的功能和补丁。

![](http://blog.linoxide.com/wp-content/uploads/2014/10/Icinga-e1413377995731.png)

**更多信息**参考[安装和配置lcinga文章][19].

#### 20. Nagios - 最为流行的监控工具. ####

作为在Linux上使用最为广泛和流行的**监控方案**，它有一个守护程序用来收集不同进程和远程主机的信息，这些收集到的信息都通过功能强大**的web界面**进行呈现。

![](http://blog.linoxide.com/wp-content/uploads/2014/10/nagios-e1413305858732.png)

你可以在 **找到更多的信息** 在[如何安装nagios][20]

#### 21. Linux process explorer - Linux下的procexp ####

**Linux process explorer**是一个Linux下的图形化进程浏览工具。它能够显示不同的进程信息，如进程数，TCP/IP连接和每一个进程的性能指标。作为**Windows**下**procexp**在Linux的替代品，是由**Sysinternals**开发的，其目标是相比**top**和**ps**用户体验更加的友好。

查看 [linux process explorer 文章][21]获取更多信息。

#### 22. Collectl - 性能监控工具 ####

你可以既可以通过交互的方式使用这个**性能监控**工具，也可以用它产生**报表**，并通过web服务器来访问它在磁盘上的数据。它以一种**易读易管理**的文件格式，记录了**CPU，磁盘，内存，网络，网络文件系统，进程，slabs**等统计信息于。

![](http://blog.linoxide.com/wp-content/uploads/2014/10/collectl.png)

**更多** 关于[Collectl的文章][22]。

#### 23. MRTG - 经典网络流量监控图形工具 ####

这是一个采用**rrdtool**的提供给用户图形化流量监控工具。作为**最早**的提供**图形化界面**的工具，它被广泛应用在类Unix的操作系统中。查看我们关于[如何使用MRTG][23]的文章获取更多关于安装和配置的信息。

![](http://blog.linoxide.com/wp-content/uploads/2014/10/mrtg.png)

#### 24. Monit - 简单易用的监控工具 ####

**Monit**是一个用来**监控进程**，**系统加载**，**文件系统**和**目录文件**等的开源的Linux工具。你能够让它自动化维护和修复，也能够在运行错误的情景下执行动作或者发邮件报告提醒系统管理员。如果你想要用这个工具，你可以查看[如何使用Monit的文章][24]。

![](http://blog.linoxide.com/wp-content/uploads/2014/10/monit.png)

#### 25. Munin - 为服务器提供监控和提醒服务 ####

作为一个网络资源监控工具，*Munin**能够帮助分析**资源趋势**和**查看弱节点**以及导致产生**性能问题**的原因。开发此软件的团队系统它能够易用和用户体验友好。该软件是用Perl开发的同时采用**rrdtool**来绘制图形，使用了**web接口**进行呈现。开发人员推广此应用时声称“**插件化和易用**”，目前已有500多个监控插件可结合使用。

**更多信息**可以在[关于Munin的文章][25]。

--------------------------------------------------------------------------------

via: http://linoxide.com/monitoring-2/linux-performance-monitoring-tools/

作者：[Adrian Dinu][a]
译者：[译者ID](https://github.com/andyxue)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/adriand/
[1]:http://linoxide.com/monitoring-2/dstat-monitor-linux-performance/
[2]:http://linoxide.com/monitoring-2/guide-using-linux-atop/
[3]:http://linoxide.com/monitoring-2/install-nmon-monitor-linux-performance/
[4]:http://linoxide.com/linux-command/kernel-slab-cache-information/
[5]:http://linoxide.com/linux-command/linux-system-performance-monitoring-using-sar-command/
[6]:http://linoxide.com/monitoring-2/monitor-linux-saidar-tool/
[7]:http://linoxide.com/linux-command/linux-top-command-examples-screenshots/
[8]:http://linoxide.com/tools/sysdig-performance-linux-tool/
[9]:http://linoxide.com/linux-command/netstat-commad-with-all-variant-outputs/
[10]:http://linoxide.com/linux-how-to/network-traffic-capture-tcp-dump-command/
[11]:http://linoxide.com/linux-command/linux-vmstat-command-tool-report-virtual-memory-statistics/
[12]:http://linoxide.com/linux-command/linux-free-command/
[13]:http://linoxide.com/linux-command/linux-htop-command/
[14]:http://linoxide.com/linux-command/ss-sockets-network-connection/
[15]:http://linoxide.com/how-tos/lsof-command-list-process-id-information/
[16]:http://linoxide.com/monitoring-2/iftop-network-traffic/
[17]:http://linoxide.com/monitoring-2/install-iperf-test-network-speed-bandwidth/
[18]:http://linoxide.com/tools/memory-usage-reporting-smem/
[19]:http://linoxide.com/monitoring-2/install-configure-icinga-linux/
[20]:http://linoxide.com/how-tos/install-configure-nagios-centos-7/
[21]:http://sourceforge.net/projects/procexp/
[22]:http://linoxide.com/monitoring-2/collectl-tool-install-examples/
[23]:http://linoxide.com/tools/multi-router-traffic-grapher/
[24]:http://linoxide.com/monitoring-2/monit-linux/
[25]:http://linoxide.com/ubuntu-how-to/install-munin/
