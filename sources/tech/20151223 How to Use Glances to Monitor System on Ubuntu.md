如何在 Ubuntu 上使用 Glances 监控系统
================================================================================

![](https://www.maketecheasier.com/assets/uploads/2015/12/glances_featured.jpg)

Glances is a cross-platform command-line text-based tool to monitor your system. It is written in Python language and uses the `psutil` library to get information from the system. Using it you can monitor CPU, Load Average, Memory, Network Interfaces, Disk I/O, File System spaces utilization, mounted devices, total number of active processes and top processes. There are many interesting options available in Glances. One of the main features is that you can set thresholds (careful, warning and critical) in a configuration file, and information will be shown in colors which indicates the bottleneck in the system.

Glances 是一个跨平台、基于命令行、文本模式的系统监控工具。它是用 Python 编写的，使用 `psutil` 库从系统获取信息。你可以用它来监控 CPU、平均负载（Load Average）、内存、网络接口、磁盘 I/O，文件系统空间利用率、挂载的设备、所有活动进程以及 top processes（不确定什么意思）。Glances 有很多有趣的选项。主要特性之一是可以在配置文件中设置阀值（小心、警告、致命），然后信息会用不同颜色显示以展示系统的瓶颈。

### Glances Features ###
### Glances 特性

- CPU 平均负载
- 不同状态（如活动、休眠）进程的数量
- 所有内存信息，如 总内存、交换空间、可用内存，等
- CPU 信息
- 网络连接的上行/下行速率
- 磁盘 I/O 读/写速度详细信息
- 当前挂载设备的磁盘使用情况
- 高占用率进程和他们的 CPU/内存使用情况

- the average CPU load
- total number of processes like active, sleeping processes, etc.
- total memory information like RAM, swap, free memory, etc.
- CPU information
- Network download and upload speed of connections
- Disk I/O read/write speed details
- Currently mounted devices’ disk usages
- Top processes with their CPU/memory usages

### Installing Glances ###
### 安装 Glances

Glances 在 Ubuntu 的软件源中，所以安装很简单。执行下面的命令安装 Glances：

    sudo apt-get install glances

### Glances 使用方法

安装完成后，可以执行下面的命令启动 Glances：

    glances

你将看到类似下图的输出：

![glances monitor system output](https://www.maketecheasier.com/assets/uploads/2015/12/glances_output1.png)


要退出 Glances 终端，按 ESC 键或 “Ctrl + C”。

默认情况下，时间间隔是 1s，不过你可以在从终端启动 Glances 时自定义时间间隔。

要把时间间隔设为 5s，执行下面的命令：

    glances -t 5

### Glances Color Codes ###
### Glances 颜色代码

Glances 下不同颜色的含义：

- `GREEN`：正常
- `BLUE`：要小心
- `VIOLET`：警告
- `RED`：致命

默认设置下，Glances 的阀值是：小心=50，警告=70，致命=90。你可以通过 “/etc/glances/” 目录下的默认配置文件 glances.conf 来自定义这些阀值。

### Glances Options ###
### Glances 参数

Glances 提供了很多热键，可以它运行时用来查找输出信息。

下面是一些常用的热键列表：

- `m` : 按内存占用排序进程
- `p` : 按名称占用排序进程
- `c` : 按 CPU 占用率排序进程
- `d` : 显示/隐藏磁盘 I/O 统计信息
- `a` : 自动排序进程
- `f` : 显示/隐藏文件系统温度信息（statshddtemp不确定意思）
- `i` : sort processes by I/O rate
- `s` : show/hide sensors’ stats
- `y` : show/hide hddtemp stats
- `l` : show/hide logs
- `n` : show/hide network stats
- `x` : delete warning and critical logs
- `h` : show/hide help screen
- `q` : quit
- `w` : delete warning logs

### Use Glances to Monitor Remote Systems ###

You can also monitor remote systems using Glances. To use it on a remote system, use the following command:

    glances -s

You will see an output like the following:

![glances monitor remote system server](https://www.maketecheasier.com/assets/uploads/2015/12/glances_server.png)

You will see Glances running on port 61209.

Now, go to the remote machine and execute the following command to connect to a Glances server by specifying the IP address as shown below. For example, 192.168.1.10 is your Glances server IP address.

    glances -c -P 192.168.1.10

### Conclusion ###

Glances is a very useful tool for every Linux system administrator. Using it, you can easily monitor your Linux system in less time. Feel free to comment if you have any questions.

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/glances-monitor-system-ubuntu/

作者：[Hitesh Jethva][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/hiteshjethva/

