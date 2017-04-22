Cpustat - 在 Linux 下通过运行程序监控 CPU 使用率
============================================================

Cpustat 是 Linux 下一个强大的系统性能测量程序，它用 [Go 编程语言][3] 编写。它尝试使用 [The Utilization Saturation and Errors（USE）Method](http://www.brendangregg.com/usemethod.html "The Utilization Saturation and Errors（USE）Method")（一个用于分析任意系统性能的方法），以有效的方式显示 CPU 利用率和饱和度。

它高频率提取系统中运行的每个进程的样本，然后用较低频率汇总这些样本。例如，它能够每 200ms 测量一次每个进程，然后每 5 秒汇总这些样本，包括某些度量的最小/平均/最大值（min/avg/max）。

**推荐阅读：** [监控 Linux 性能的 20 个命令行工具][4]

Cpustat 能用两种方式输出数据：汇总间隔的纯文本列表和每个样本的有色滚动面板。

### 如何在 Linux 中安装 Cpustat

为了使用 cpustat，你的 Linux 系统中必须安装有 Go（GoLang），如果你还没有安装它，点击下面的链接逐步安装 GoLang：

1.	[在 Linux 下安装 GoLang（Go 编程语言）][1]

安装完 Go 以后，输入下面的 `go get` 命令安装 Cpustat，这个命令会将 cpustat 二进制文件安装到你的 `GOBIN` 变量（该变量所指的路径）：


	# go get github.com/uber-common/cpustat


### 如何在 Linux 中使用 Cpustat

安装过程完成后，如果你不是以 root 用户控制系统，像下面这样使用 sudo 命令获取 root 权限运行 cpustat，否则会出现下面显示的错误信息：


	$ $GOBIN/cpustat
	This program uses the netlink taskstats interface, so it must be run as root.


注意：想要像你系统中已经安装的其它 Go 程序那样运行 cpustat，你需要把 `GOBIN` 变量添加到 `PATH` 环境变量。打开下面的链接学习如何在 Linux 中设置 `PATH` 变量。

1.	[学习如何在 Linux 中永久设置你的 $PATH 变量][2]

cpustat 是这样工作的：每个间隔会查询 `/proc` 目录获取当前[进程 ID 列表][5]，然后：

*	对于每个 PID，读取 /proc/pid/stat，然后计算和前一个样本的差别。
*	如果是一个新的 PID，读取 /proc/pid/cmdline。
*	对于每个 PID，发送 netlink 消息获取 taskstat，计算和前一个样本的差别。
*	读取 /proc/stat 获取总的系统统计信息。

根据获取所有这些统计信息所花费的时间，会调整每个睡眠间隔。另外，通过样本之间实际经过的时间，每个样本也会记录它用于测量的时间。这可用于计算 cpustat 自身的延迟。

当不带任何参数运行时，cpustat 默认会显示以下信息：样本间隔：200ms，汇总间隔：2s（10 个样本），[显示前 10 个进程][6]，用户过滤器：all，pid 过滤器：all，正如下面截图所示：


	$ sudo $GOBIN/cpustat 

[
 ![Cpustat - 监控 Linux CPU 使用](http://www.tecmint.com/wp-content/uploads/2017/03/Cpustat-Monitor-Linux-CPU-Usage.png) 
][7]

Cpustat – 监控 Linux CPU 使用

在上面的输出中，之前显示的系统范围的度量字段意义如下：

*	usr - 用户模式运行时间占 CPU 百分比的 min/avg/max 值。
*	sys - 系统模式运行时间占 CPU 百分比 的min/avg/max 值。
*	nice - 用户模式低优先级运行时间占 CPU 百分比的 min/avg/max 值。
*	idle - 用户模式空闲时间占 CPU 百分比的 min/avg/max 值。
*	iowait - 等待磁盘 IO 的 min/avg/max 延迟时间。
*	prun - 可运行状态的 min/avg/max 进程数量（load average 也是如此）。
*	pblock - 被磁盘 IO 阻塞的 min/avg/max 进程数量。
*	pstat - 这次汇总间隔启动的进程/线程数目。

同样还是上面的输出，对于一个进程，不同列的意思分别是：

*	name - 从 /proc/pid/stat 或 /proc/pid/cmdline 获取的进程名称。
*	pid - 进程 ID，也称为 “tgid”。
*	min - 该 pid user+system 时间的最小样本，从 /proc/pid/stat 计算。比率是 CPU 的百分比。
*	max - 该 pid user+system 时间的最大样本，从 /proc/pid/stat 计算。
*	usr - 该汇总期间该 pid 的平均 user 时间，从 /proc/pid/stat 计算。
*	sys - 该汇总期间该 pid 的平均 system 时间，从 /proc/pid/stat 计算。
*	nice - 表示该进程的当前 “nice” 值，从 /proc/pid/stat 计算。值越高表示越好（nicer）。
*	runq - 进程和它所有线程可运行但等待运行的时间，通过 netlink 从 taskstats 计算。比率是 CPU 的百分比。
*	iow - 进程和它所有线程被磁盘 IO 阻塞的时间，通过 netlink 从 taskstats 计算。比率是 CPU 的百分比，对整个汇总间隔平均。
*	swap - 进程和它所有线程等待被换入（swap in）的时间，过 netlink 从 taskstats 计算。Scale 是 CPU 的百分比，对整个汇总间隔平均。
*	vcx 和 icx - 在汇总间隔期间进程和它的所有线程自动上下文切换总的次数，过 netlink 从 taskstats 计算。
*	rss - 从 /proc/pid/stat 获取的当前 RSS 值。它是指该进程正在使用的内存数量。
*	ctime - 在汇总间隔期间等待子进程退出的 user+sys CPU 时间总和，从 /proc/pid/stat 计算。

注意长时间运行的子进程可能导致混淆这个值，因为只有在子进程退出后才会报告时间。但是，这对于计算高频 cron 任务以及 CPU 时间经常被多个子进程使用的健康检查非常有帮助。

*	thrd - 汇总间隔最后线程的数目，从 /proc/pid/stat 计算。
*	sam - 在这个汇总间隔期间该进程的样本数目。最近启动会退出的进程可能比汇总间隔的样本数目少。


下面的命令显示了系统中运行的前 10 个 root 用户进程：


	$ sudo $GOBIN/cpustat -u root

[
 ![查找 root 用户正在运行的进程](http://www.tecmint.com/wp-content/uploads/2017/03/show-root-user-processes.png) 
][8]

查找 root 用户正在运行的进程

要想用更好看的终端模式显示输出，像下面这样用 `-t` 选项：


	$ sudo $GOBIN/cpustat -u roo -t

[
 ![root 用户正在运行的进程](http://www.tecmint.com/wp-content/uploads/2017/03/Root-User-Runnng-Processes.png) 
][9]

root 用户正在运行的进程

要查看前 [x 个进程][10]（默认是 10），你可以使用 `-n` 选项，下面的命令显示了系统中 [正在运行的前 20 个进程][11]：


	$ sudo $GOBIN/cpustat -n 20 


你也可以像下面这样使用 `-cpuprofile` 选项将 CPU 信息写到文件，然后用 [cat 命令][12]查看文件：


	$ sudo $GOBIN/cpustat -cpuprofile cpuprof.txt
	$ cat cpuprof.txt


要显示帮助信息，像下面这样使用 `-h` 选项：


	$ sudo $GOBIN/cpustat -h


从 cpustat Github 参仓库：[https://github.com/uber-common/cpustat][13] 查阅其它资料。

就是这些！在这篇文章中，我们向你展示了如何安装和使用 cpustat，Linux 下一个有用的系统性能测量工具。通过下面的评论框和我们分享你的想法吧。

--------------------------------------------------------------------------------

作者简介：

Aaron Kili 是一个 Linux 和 F.O.S.S（Free and Open-Source Software） 爱好者，一个 Linux 系统管理员、web 开发员，现在也是 TecMint 的内容创建者，他喜欢和电脑一起工作，他相信知识共享。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/cpustat-monitors-cpu-utilization-by-processes-in-linux/

作者：[Aaron Kili][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/install-go-in-linux/
[2]:http://www.tecmint.com/set-path-variable-linux-permanently/
[3]:http://www.tecmint.com/install-go-in-linux/
[4]:http://www.tecmint.com/command-line-tools-to-monitor-linux-performance/
[5]:http://www.tecmint.com/find-process-name-pid-number-linux/
[6]:http://www.tecmint.com/find-linux-processes-memory-ram-cpu-usage/
[7]:http://www.tecmint.com/wp-content/uploads/2017/03/Cpustat-Monitor-Linux-CPU-Usage.png
[8]:http://www.tecmint.com/wp-content/uploads/2017/03/show-root-user-processes.png
[9]:http://www.tecmint.com/wp-content/uploads/2017/03/Root-User-Runnng-Processes.png
[10]:http://www.tecmint.com/find-processes-by-memory-usage-top-batch-mode/
[11]:http://www.tecmint.com/install-htop-linux-process-monitoring-for-rhel-centos-fedora/
[12]:http://www.tecmint.com/13-basic-cat-command-examples-in-linux/
[13]:https://github.com/uber-common/cpustat
[14]:http://www.tecmint.com/author/aaronkili/
[15]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[16]:http://www.tecmint.com/free-linux-shell-scripting-books/
