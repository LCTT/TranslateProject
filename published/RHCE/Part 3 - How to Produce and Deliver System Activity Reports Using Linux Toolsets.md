RHCE 系列（三）：如何使用 Linux 工具集生成和发送系统活动报告
================================================================================
作为一个系统工程师，你经常需要生成一些显示系统资源利用率的报告，以便确保：1）正在合理利用系统，2）防止出现瓶颈，3）确保可扩展性，以及其它原因。

![监视 Linux 性能活动报告](http://www.tecmint.com/wp-content/uploads/2015/08/Monitor-Linux-Performance-Activity-Reports.jpg)

*RHCE 第三部分：监视 Linux 性能活动报告*

除了著名的用于检测磁盘、内存和 CPU 使用率的原生 Linux 工具 - 可以给出很多例子，红帽企业版 Linux 7 还提供了另外两个可以为你的报告更多数据的工具套装：sysstat 和 dstat。

在这篇文章中，我们会介绍两者，但首先让我们来回顾一下传统工具的使用。

### 原生 Linux 工具 ###

使用 df，你可以报告磁盘空间以及文件系统的 inode 使用情况。你需要监视这两者，因为缺少磁盘空间会阻止你保存更多文件（甚至会导致系统崩溃），就像耗尽 inode 意味着你不能将文件链接到对应的数据结构，从而导致同样的结果：你不能将那些文件保存到磁盘中。

    # df -h 		[以人类可读形式显示输出]
    # df -h --total         [生成总计]

![检查 Linux 总的磁盘使用](http://www.tecmint.com/wp-content/uploads/2015/08/Check-Linux-Total-Disk-Usage.png)

*检查 Linux 总的磁盘使用*

    # df -i 		[显示文件系统的 inode 数目]
    # df -i --total 	[生成总计]

![检查 Linux 总的 inode 数目](http://www.tecmint.com/wp-content/uploads/2015/08/Check-Linux-Total-inode-Numbers.png)

*检查 Linux 总的 inode 数目*

用 du，你可以估计文件、目录或文件系统的文件空间使用。

举个例子，让我们来看看 /home 目录使用了多少空间，它包括了所有用户的个人文件。第一条命令会返回整个 /home 目录当前使用的所有空间，第二条命令会显示子目录的分类列表：

    # du -sch /home
    # du -sch /home/*

![检查 Linux 目录磁盘大小](http://www.tecmint.com/wp-content/uploads/2015/08/Check-Linux-Directory-Disk-Size.png)

*检查 Linux 目录磁盘大小*

别错过了：

- [检查 Linux 磁盘空间使用的 12 个 ‘df’ 命令例子][1]
- [查看文件/目录磁盘使用的 10 个 ‘du’ 命令例子][2]

另一个你工具集中不容忽视的工具就是 vmstat。它允许你查看进程、CPU 和 内存使用、磁盘活动以及其它的大概信息。

如果不带参数运行，vmstat 会返回自从上一次启动后的平均信息。尽管你可能以这种方式使用该命令有一段时间了，再看一些系统使用率的例子会有更多帮助，例如在例子中定义了时间间隔。

例如

    # vmstat 5 10

会每个 5 秒返回 10 个事例：

![检查 Linux 系统性能](http://www.tecmint.com/wp-content/uploads/2015/08/Check-Linux-Systerm-Performance.png)

*检查 Linux 系统性能*

正如你从上面图片看到的，vmstat 的输出分为很多列：proc(process)、memory、swap、io、system、和 CPU。每个字段的意义可以在 vmstat man 手册的 FIELD DESCRIPTION 部分找到。

在哪里 vmstat 可以派上用场呢？让我们在 yum 升级之前和升级时检查系统行为：

    # vmstat -a 1 5

![Vmstat Linux 性能监视](http://www.tecmint.com/wp-content/uploads/2015/08/Vmstat-Linux-Peformance-Monitoring.png)

*Vmstat Linux 性能监视*

请注意当磁盘上的文件被更改时，活跃内存的数量增加，写到磁盘的块数目（bo）和属于用户进程的 CPU 时间（us）也是这样。

或者直接保存一个大文件到磁盘时（由 dsync 标志引发）：

    # vmstat -a 1 5
    # dd if=/dev/zero of=dummy.out bs=1M count=1000 oflag=dsync

![Vmstat Linux 磁盘性能监视](http://www.tecmint.com/wp-content/uploads/2015/08/VmStat-Linux-Disk-Performance-Monitoring.png)

*Vmstat Linux 磁盘性能监视*

在这个例子中，我们可以看到大量的块被写入到磁盘（bo），这正如预期的那样，同时 CPU 处理任务之前等待 IO 操作完成的时间（wa）也增加了。

**别错过**: [Vmstat – Linux 性能监视][3]

### 其它 Linux 工具 ###

正如本文介绍部分提到的，这里有其它的工具你可以用来检测系统状态和利用率（不仅红帽，其它主流发行版的官方支持库中也提供了这些工具）。

sysstat 软件包包含以下工具：

- sar （收集、报告、或者保存系统活动信息）。
- sadf （以多种方式显示 sar 收集的数据）。
- mpstat （报告处理器相关的统计信息）。
- iostat （报告 CPU 统计信息和设备以及分区的 IO统计信息）。
- pidstat （报告 Linux 任务统计信息）。
- nfsiostat （报告 NFS 的输出/输出统计信息）。
- cifsiostat （报告 CIFS 统计信息）
- sa1 （收集并保存二进制数据到系统活动每日数据文件中）。
- sa2 （在 /var/log/sa 目录写入每日报告）。

dstat 比这些工具所提供的功能更多一些，并且提供了更多的计数器和更大的灵活性。你可以通过运行 yum info sysstat 或者 yum info dstat 找到每个工具完整的介绍，或者安装完成后分别查看每个工具的 man 手册。

安装两个软件包：

    # yum update && yum install sysstat dstat

sysstat 主要的配置文件是 `/etc/sysconfig/sysstat`。你可以在该文件中找到下面的参数：

    # How long to keep log files (in days).
    # If value is greater than 28, then log files are kept in
    # multiple directories, one for each month.
    HISTORY=28
    # Compress (using gzip or bzip2) sa and sar files older than (in days):
    COMPRESSAFTER=31
    # Parameters for the system activity data collector (see sadc manual page)
    # which are used for the generation of log files.
    SADC_OPTIONS="-S DISK"
    # Compression program to use.
    ZIP="bzip2"

sysstat 安装完成后，`/etc/cron.d/sysstat` 中会添加和启用两个 cron 任务。第一个任务每 10 分钟运行系统活动计数工具，并在 `/var/log/sa/saXX` 中保存报告，其中 XX 是该月的一天。

因此，`/var/log/sa/sa05` 会包括该月份第 5 天所有的系统活动报告。这里假设我们在上面的配置文件中对 HISTORY 变量使用默认的值： 

    */10 * * * * root /usr/lib64/sa/sa1 1 1

第二个任务在每天夜间 11：53 生成每日进程计数总结并把它保存到 `/var/log/sa/sarXX` 文件，其中 XX 和之前例子中的含义相同：

    53 23 * * * root /usr/lib64/sa/sa2 -A

例如，你可能想要输出该月份第 6 天从上午 9:30 到晚上 5：30 的系统统计信息到一个 LibreOffice Calc 或 Microsoft Excel 可以查看的 .csv 文件（这样就可以让你创建表格和图片了）：

    # sadf -s 09:30:00 -e 17:30:00 -dh /var/log/sa/sa06 -- | sed 's/;/,/g' > system_stats20150806.csv

你可以在上面的 sadf 命令中用 -j 标记代替 -d 以 JSON 格式输出系统统计信息，这当你在 web 应用中使用这些数据的时候非常有用。

![Linux 系统统计信息](http://www.tecmint.com/wp-content/uploads/2015/08/Linux-System-Statistics.png)

*Linux 系统统计信息*

最后，让我们看看 dstat 提供什么功能。请注意如果不带参数运行，dstat 默认使用 -cdngy（表示 CPU、磁盘、网络、内存页、和系统统计信息），并每秒添加一行（可以在任何时候用 Ctrl + C 中断执行）：

    # dstat

![Linux 磁盘统计检测](http://www.tecmint.com/wp-content/uploads/2015/08/dstat-command.png)

*Linux 磁盘统计检测*

要输出统计信息到 .csv 文件，可以用 -output 标记后面跟一个文件名称。让我们来看看在 LibreOffice Calc 中该文件看起来是怎样的：

![检测 Linux 统计信息输出](http://www.tecmint.com/wp-content/uploads/2015/08/Monitor-Linux-Statistics-Output.png)

*检测 Linux 统计信息输出*

为了更多的阅读体验，我强烈建议你查看 [dstat][5] 和 [sysstat][6] 的 pdf 格式 man 手册。你会找到其它能帮助你创建自定义的详细系统活动报告的选项。 

**别错过**: [Sysstat – Linux 的使用活动检测工具][4]

### 总结 ###

在该指南中我们解释了如何使用 Linux 原生工具以及 RHEL 7 提供的特定工具来生成系统使用报告。在某种情况下，你可能像依赖最好的朋友那样依赖这些报告。

你很可能使用过这篇指南中我们没有介绍到的其它工具。如果真是这样的话，用下面的表单和社区中的其他成员一起分享吧，也可以是任何其它的建议/疑问/或者评论。

我们期待你的回复。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-performance-monitoring-and-file-system-statistics-reports/

作者：[Gabriel Cánepa][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:https://linux.cn/article-6466-1.html
[2]:http://www.tecmint.com/check-linux-disk-usage-of-files-and-directories/
[3]:https://linux.cn/article-4024-1.html
[4]:https://linux.cn/article-4028-1.html
[5]:http://www.tecmint.com/wp-content/pdf/dstat.pdf
[6]:http://www.tecmint.com/wp-content/pdf/sysstat.pdf