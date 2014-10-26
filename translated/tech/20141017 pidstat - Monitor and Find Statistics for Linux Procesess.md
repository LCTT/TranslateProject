pidstat - 监控并统计Linux进程的数据
================================================================================
**pidstat**命令用来监控被Linux内核管理的独立任务(进程)。它输出每个受内核管理的任务的相关信息。pidstat命令也可以用来监控特定进程的子进程。区间参数具体说明各个报告间的时间间隔。它的值为0(或者没有参数)说明进程的统计数据的时间是从系统启动开始计算的。

### 如何安装pidstat ###

pidstat 是sysstat软件套件的一部分，sysstat包含很多监控linux系统行为的工具，它能够从大多数linux发行版的软件源中获得。

在Debian/Ubuntu系统中可以使用下面的命令来安装

    # apt-get install sysstat

CentOS/Fedora/RHEL版本的linux中则使用下面的命令：

    # yum install sysstat

### 使用pidstat ###

使用pidstat不加任何参数等价于加上-p但是只有正在活动的任务会被显示出来。

    # pidstat

![pidstat](http://blog.linoxide.com/wp-content/uploads/2014/09/pidstat.jpg)

在结果中你能看到如下内容：

- **PID** - 被监控的进程的进程号
- **%usr** - 当在用户层执行(应用程序)时这个进程的cpu使用率。注意这个字段计算的cpu时间不包括在虚拟处理器中使用花去的时间。
- **%system** - 这个进程在系统级别使用时的cpu使用率。
- **%guest** - 在虚拟机中的cpu使用率
- **%CPU** - 进程总的cpu使用率。在SMP环境(多处理器)中，cpu使用率会根据cpu的数量进行划分当你在命令行中输入-I参数。
- **CPU** - 这个进程能够使用的处理器数目
- **Command** - 这个进程的命令名称。

### I/O 统计数据 ###

通过使用-d参数来得到I/O的统计数据。比如：

    # pidstat -d -p 8472

![pidstat io](http://blog.linoxide.com/wp-content/uploads/2014/09/pidstat-io.jpg)

IO 输出会显示一些内的条目：

- **kB_rd/s** - 进程从硬盘上的读取速度
- **kB_wr/s** - 进程向硬盘中的写入速度
- **kB_ccwr/s** - 进程写入磁盘被取消的速率

### Page faults and memory usage ###
### Page faults和内存使用 ###

使用-r标记你能够得到内存使用情况的数据。

![pidstat pf mem](http://blog.linoxide.com/wp-content/uploads/2014/09/pidstat-pfmem.jpg)

重要的条目：

- **minflt/s** - 从内存中加载数据时每秒钟出现的小的错误的数目
- **majflt/s** - 从内存中加载数据时每秒出现的较大错误的数目
- **VSZ** - 虚拟容量：整个进程的虚拟内存使用
- **RSS** - 长期的内存使用：进程非交换物理内存的使用

### 举例 ###

**1.** 你可以通过使用下面的命令来监测内存使用

    # pidstat -r 2 5

这会给你5份关于page faults的统计数据结果，间隔2s。这将会更容易的定位出现问题的进程。

**2.** 显示所有mysql server的子进程

    # pidstat -T CHILD -C mysql

**3.** To combine all statistics in a single report you can use:
**3.** 将所有的统计数据结合到一个简单的结果记录中：

    # pidstat -urd -h

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-pidstat-monitor-statistics-procesess/

作者：[Adrian Dinu][a]
译者：[John](https://github.com/johnhoow)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/adriand/
