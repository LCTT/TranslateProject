pidstat - 监控并统计Linux进程的数据
================================================================================
**pidstat**命令用来监控被Linux内核管理的独立任务(进程)。它输出每个受内核管理的任务的相关信息。pidstat命令也可以用来监控特定进程的子进程。间隔参数用于指定每次报告间的时间间隔。它的值为0(或者没有参数)说明进程的统计数据的时间是从系统启动开始计算的。

### 如何安装pidstat ###

pidstat 是sysstat软件套件的一部分，sysstat包含很多监控linux系统状态的工具，它能够从大多数linux发行版的软件源中获得。

在Debian/Ubuntu系统中可以使用下面的命令来安装

    # apt-get install sysstat

CentOS/Fedora/RHEL版本的linux中则使用下面的命令：

    # yum install sysstat

### 使用pidstat ###

使用pidstat不加任何参数等价于加上-p参数，但是只有正在活动的任务会被显示出来。

    # pidstat

![pidstat](http://blog.linoxide.com/wp-content/uploads/2014/09/pidstat.jpg)

在结果中你能看到如下内容：

- **PID** - 被监控的任务的进程号
- **%usr** - 当在用户层执行(应用程序)时这个任务的cpu使用率，和 nice 优先级无关。注意这个字段计算的cpu时间不包括在虚拟处理器中花去的时间。
- **%system** - 这个任务在系统层使用时的cpu使用率。
- **%guest** - 任务花费在虚拟机上的cpu使用率（运行在虚拟处理器）。
- **%CPU** - 任务总的cpu使用率。在SMP环境(多处理器)中，如果在命令行中输入-I参数的话，cpu使用率会除以你的cpu数量。
- **CPU** - 正在运行这个任务的处理器编号。
- **Command** - 这个任务的命令名称。

### I/O 统计数据 ###

通过使用-d参数来得到I/O的统计数据。比如：

    # pidstat -d -p 8472

![pidstat io](http://blog.linoxide.com/wp-content/uploads/2014/09/pidstat-io.jpg)

IO 输出会显示一些内的条目：

- **kB_rd/s** - 任务从硬盘上的读取速度（kb）
- **kB_wr/s** - 任务向硬盘中的写入速度（kb）
- **kB_ccwr/s** - 任务写入磁盘被取消的速率（kb）

### 页面失败和内存使用 ###

使用-r标记你能够得到内存使用情况的数据。

![pidstat pf mem](http://blog.linoxide.com/wp-content/uploads/2014/09/pidstat-pfmem.jpg)

重要的条目：

- **minflt/s** - 从内存中加载数据时每秒出现的小的错误的数目，这些不要求从磁盘载入内存页面。
- **majflt/s** - 从内存中加载数据时每秒出现的较大错误的数目，这些要求从磁盘载入内存页面。
- **VSZ** - 虚拟容量：整个进程的虚拟内存使用（kb）
- **RSS** - 长期内存使用：任务的不可交换物理内存的使用量（kb）

### 举例 ###

**1.** 你可以通过使用下面的命令来监测内存使用

    # pidstat -r 2 5

这会给你5份关于page faults的统计数据结果，间隔2秒。这将会更容易的定位出现问题的进程。

**2.** 显示所有mysql服务器的子进程

    # pidstat -T CHILD -C mysql

**3.** 将所有的统计数据结合到一个便于阅读的单一报告中：

    # pidstat -urd -h

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-pidstat-monitor-statistics-procesess/

作者：[Adrian Dinu][a]
译者：[John](https://github.com/johnhoow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/adriand/
