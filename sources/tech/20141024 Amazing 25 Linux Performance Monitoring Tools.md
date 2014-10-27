andyxue translating
Amazing ! 25 Linux Performance Monitoring Tools
================================================================================
Over the time our website has shown you how to configure various performance tools for Linux and Unix-like operating systems. In this article we have made a list of the most used and most useful tools to monitor the performance for your box. We provided a link for each of them and split them into 2 categories: command lines one and the ones that offer a graphical interface.

### Command line performance monitoring tools ###

#### 1. dstat - Versatile resource statistics tool ####

A versatile combination of **vmstat**, **iostat** and **ifstat**. It adds new features and functionality allowing you to view all the different resources instantly, allowing you to compare and combine the different resource usage. It uses colors and blocks to help you see the information clearly and easily. It also allows you to export the data in **CVS** format to review it in a spreadsheet application or import in a **database**. You can use this application to [monitor cpu, memory, eth0 activity related to time][1].

![](http://blog.linoxide.com/wp-content/uploads/2014/10/dstat.png)

#### 2. atop - Improved top with ASCII ####

A command line tool using **ASCII** to display a **performance monitor** that is capable of reporting the activity of all processes. It shows daily logging of system and process activity for long-term analysis and it highlights overloaded system resources by using colors. It includes metrics related to **CPU**, **memory**, **swap**, **disks** and **network layers**. All the functions of atop can be accessed by simply running:

    # atop

And you will be able to [use the interactive interface to display][2] and order data.

![](http://blog.linoxide.com/wp-content/uploads/2014/10/atop1.jpg)

#### 3. Nmon - performance monitor for Unix-like systems ####

Nmon stands for **Nigel's Monitor** and it's a system monitor tool originally developed for **AIX**. If features an **Online Mode** that uses curses for efficient screen handling, which updates the terminal frequently for real-time monitoring and a **Capture Mode** where the data is saved in a file in **CSV** format for later processing and graphing.

![](http://blog.linoxide.com/wp-content/uploads/2014/10/nmon_interface.png)

**More info** in our [nmon performance track article][3].

#### 4. slabtop - information on kernel slab cache ####

This application will show you how the **caching memory allocator** manages in the Linux kernel caches various type of objects. The command is a top like command but is focused on showing real-time kernel slab cache information. It displays a listing of the top caches sorted by one of the listed sort criteria. It also displays a statistics header filled with slab layer information. Here are a few examples:

    # slabtop --sort=a
    # slabtop -s b
    # slabtop -s c
    # slabtop -s l
    # slabtop -s v
    # slabtop -s n
    # slabtop -s o

**More info** is available [kernel slab cache article][4]

#### 5. sar - performance monitoring and bottlenecks check ####

The **sar** command writes to standard output the contents of selected cumulative activity counters in the operating system. The **accounting system**, based on the values in the count and interval parameters, writes information the specified number of times spaced at the specified intervals in seconds. If the interval parameter is set to zero, [the sar command displays the average statistics][5] for the time since the system was started. Useful commands:

    # sar -u 2 3
    # sar –u –f /var/log/sa/sa05
    # sar -P ALL 1 1
    # sar -r 1 3
    # sar -W 1 3

#### 6. Saidar - simple stats monitor ####

Saidar is a **simple** and **lightweight** tool for system information. It doesn't have major performance reports but it does show the most useful system metrics in a short and nice way. You can easily see the [**up-time, average load, CPU, memory, processes, disk and network interfaces**][6] stats.

    Usage: saidar [-d delay] [-c] [-v] [-h]

    -d Sets the update time in seconds
    -c Enables coloured output
    -v Prints version number
    -h Displays this help information.

![](http://blog.linoxide.com/wp-content/uploads/2014/10/saidar-e1413370985588.png)

#### 7. top - The classical Linux task manager ####

top is one of the best known **Linux** utilities, it's a **task manager** found on most **Unix-like** operating systems. It shows the current list of running processes that the user can order using different criteria. It mainly shows how much **CPU** and **memory** is used by the **system processes**. top is a quick place to go a check what process or **processes** hangs your system. You can also find here a [list of examples of top usage][7] . You can access it by running the top command and entering the interactive mode:

    Quick cheat sheet for interactive mode:

        GLOBAL_Commands: <Ret/Sp> ?, =, A, B, d, G, h, I, k, q, r, s, W, Z
        SUMMARY_Area_Commands: l, m, t, 1
        TASK_Area_Commands Appearance: b, x, y, z Content: c, f, H, o, S, u Size: #, i, n Sorting: <, >, F, O, R
        COLOR_Mapping: <Ret>, a, B, b, H, M, q, S, T, w, z, 0 - 7
        COMMANDS_for_Windows:  -, _, =, +, A, a, G, g, w

![](http://blog.linoxide.com/wp-content/uploads/2014/10/top.png)

#### 8. Sysdig - Advanced view of system processes ####

**Sysdig** is a tool that gives admins and developers unprecedented visibility into the behavior of their systems. The team that develops it wants to improve the way system-level **monitoring** and **troubleshooting** is done by offering a unified, coherent, and granular visibility into the **storage**, **processing**, **network**, and **memory** subsystems making it possible to create trace files for system activity so you can easily analyze it at any time.

Quick examples:

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

**More info** is available in our article on [how to use sysdig for improved system-level monitoring and troubleshooting][8]

#### 9. netstat - Shows open ports and connections ####

Is the tool **Linux administrators** use to show various **network** information, like what ports are open and what network connections are established and what process runs that connection. It also shows various information about the **Unix sockets** that are open between various programs. It is part of most Linux distributions A lot of the commands are explained in the [article on netstat and its various outputs][9]. Most used commands are:

    $ netstat | head -20
    $ netstat -r
    $ netstat -rC
    $ netstat -i
    $ netstat -ie
    $ netstat -s
    $ netstat -g
    $ netstat -tapn

### 10. tcpdump - insight on network packets ###

**tcpdump** can be used to see the content of the **packets** on a **network connection**. It shows various information about the packet content that pass. To make the output useful, it allows you to use various filters to only get the information you wish. A few examples on how you can use it:

    # tcpdump -i eth0 not port 22
    # tcpdump -c 10 -i eth0
    # tcpdump -ni eth0 -c 10 not port 22
    # tcpdump -w aloft.cap -s 0
    # tcpdump -r aloft.cap
    # tcpdump -i eth0 dst port 80

**You can find them described in** [detail in our article on tcpdump and capturing packets][10]

#### 11. vmstat - virtual memory statistics ####

**vmstat** stands for **virtual memory** statistics and it's a **memory monitoring** tool that collects and displays summary information about **memory**, **processes**, **interrupts**, **paging** and **block I/O**. It is an open source program available on most Linux distributions, Solaris and FreeBSD. It is used to diagnose most memory performance problems and much more.

![](http://blog.linoxide.com/wp-content/uploads/2014/10/vmstat_delay_5.png)

**More info** in [our article on vmstat commands][11].

#### 12. free - memory statistics ####

Another **command line** tool that will show to standard output a few stats about **memory** usage and swap usage. Because it's a simple tool it can be used to either find **quick information** about memory usage or it can be used in different scripts and applications. You can see that [this small application has a lot of uses][12] and almost all system admin use this tool daily :-)

![](http://blog.linoxide.com/wp-content/uploads/2014/10/free_hs3.png)

#### 13. Htop - friendlier top ####

**Htop** is basically an improved version of top showing more stats and in a more colorful way allowing you to sort them in different ways as you can see in our article. It provides a more a more **user-friendly** interface.

![](http://blog.linoxide.com/wp-content/uploads/2014/10/htop.png)

You can find **more info** in [our comparison of htop and top][13]

#### 14. ss - the modern net-tools replacement ####

**ss** is part of the **iproute2** package. iproute2 is intended to replace an entire suite of standard **Unix networking tools** that were previously used for the tasks of [configuring network interfaces, routing tables, and managing the ARP table][14]. The ss utility is used to dump socket statistics, it allows showing information similar to **netstat** and its able display more TCP and state information. A few examples:

    # ss -tnap
    # ss -tnap6
    # ss -tnap
    # ss -s
    # ss -tn -o state established -p

#### 15. lsof - list open files ####

**lsof** is a command meaning "**list open files**", which is used in many Unix-like systems to report a list of all open files and the processes that opened them. It is used by most Linux distributions and other Unix-like operating systems by **system administrators** to check what files are open by various processes.

    # lsof +p process_id
    # lsof | less
    # lsof –u username
    # lsof /etc/passwd
    # lsof –i TCP:ftp
    # lsof –i TCP:80

You can find **more examples** in the [lsof article][15]

#### 16. iftop - top for your network connections ####

**iftop** is yet another top like application that will is based on networking information. It shows various current **network connection** sorted by **bandwidth usage** or the amount of data uploaded or downloaded. It also provides various estimations of the time it will take to download them.

![](http://blog.linoxide.com/wp-content/uploads/2014/10/iftop.png)

For **more info** see [article on network traffic with iftop][16]

#### 17. iperf - network performance tool ####

**iperf** is a **network testing** tool that can create **TCP** and **UDP** data connections and measure the **performance** of a network that is carrying them. It supports tuning of various parameters related to timing, protocols, and buffers. For each test it reports the bandwidth, loss, and other parameters.

![](http://blog.linoxide.com/wp-content/uploads/2014/10/iperf-e1413378331696.png)

If you wish to use the tool check out our article on [how to install and use iperf][17]

#### 18. Smem - advanced memory reporting ####

**Smem** is one of the most advanced tools for **Linux** command line, it offers information about the actual **memory** that is used and shared in the system, attempting to provide a more realistic image of the actual **memory** being used.

    $ smem -m
    $ smem -m -p | grep firefox
    $ smem -u -p
    $ smem -w -p

Check out our [article on Smem for more examples][18]

### GUI or Web based performance tools ###

#### 19. Icinga - community fork of Nagios ####

**Icinga** is **free** and **open source** system and network monitoring application. It’s a fork of Nagios retaining most of the existing features of its predecessor and building on them to add many long awaited patches and features requested by the user community.

![](http://blog.linoxide.com/wp-content/uploads/2014/10/Icinga-e1413377995731.png)

**More info** about installing and configuring [can be found in our Icinga article][19].

#### 20. Nagios - the most popular monitoring tool. ####

The most used and popular **monitoring solution** found on Linux. It has a daemon that collects information about various process and has the ability to collect information from remote hosts. All the information is then provided via a nice and powerful **web interface**.

![](http://blog.linoxide.com/wp-content/uploads/2014/10/nagios-e1413305858732.png)

You can find **information** on [how to install Nagios in our article][20]

#### 21. Linux process explorer - procexp for Linux ####

**Linux process explorer** is a graphical process explorer for **Linux**. It shows various **process information** like the process tree, TCP/IP connections and performance figures for each process. It's a replica of procexp found in Windows and developed by **Sysinternals** and aims to be more user friendly then top and ps.

Check our [linux process explorer article][21] for more info.

#### 22. Collectl - performance monitoring tool ####

This is a **performance monitoring** tool that you can use either in an **interactive mode** or you can have it **write reports** to disk and access them with a web server. It reports statistics on **CPU**, **disk**, **memory**, **network**, **nfs**, **process**, **slabs** and more in easy to read and manage format.

![](http://blog.linoxide.com/wp-content/uploads/2014/10/collectl.png)

**More info** in our [Collectl article][22]

#### 23. MRTG - the classic graph tool ####

This is a **network traffic** monitor that will provide you **graphs** using the **rrdtool**. It is one of the oldest tools that provides graphics and is one of the most used on Unix-like operating systems. Check our article on [how to use MRTG][23] for information on the installation and configuration process

![](http://blog.linoxide.com/wp-content/uploads/2014/10/mrtg.png)

#### 24. Monit - simple and easy to use monitor tool ####

**Monit** is an **open source** small **Linux** utility designed to monitor **processes**, **system load**, **filesystems**, **directories** and **files**. You can have it run automatic maintenance and repair and can execute actions in error situations or send email reports to alert the system administrator. If you wish to use this tool you can check out our [how to use Monit article][24].

![](http://blog.linoxide.com/wp-content/uploads/2014/10/monit.png)

#### 25. Munin - monitoring and alerting services for servers ####

**Munin** is a **networked resource monitoring** tool that can help analyze **resource trends** and see what is the weak point and what caused **performance issues**. The team that develops it wishes it for it to be very easy to use and user-friendly. The application is written in Perl and uses the rrdtool to generate graphs, which are with the web interface. The developers advertise the application "plug and play" capabilities with about 500 monitoring plugins currently available.

**More info** can be found in our [article on Munin][25]

--------------------------------------------------------------------------------

via: http://linoxide.com/monitoring-2/linux-performance-monitoring-tools/

作者：[Adrian Dinu][a]
译者：[译者ID](https://github.com/译者ID)
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
