如何在 Ubuntu 上使用 Glances 监控系统
================================================================================

![](https://www.maketecheasier.com/assets/uploads/2015/12/glances_featured.jpg)

Glances 是一个用于监控系统的跨平台、基于文本模式的命令行工具。它是用 Python 编写的，使用 `psutil` 库从系统获取信息。你可以用它来监控 CPU、平均负载、内存、网络接口、磁盘 I/O，文件系统空间利用率、挂载的设备、所有活动进程以及消耗资源最多的进程。Glances 有很多有趣的选项。它的主要特性之一是可以在配置文件中设置阀值（careful[小心]、warning[警告]、critical[致命]），然后它会用不同颜色显示信息以表明系统的瓶颈。

### Glances 的功能

- CPU 平均负载
- 不同状态（如活动、休眠）进程的数量
- 所有内存信息，如物理内存、交换空间、空闲内存
- CPU 信息
- 网络连接的上行/下行速度
- 磁盘 I/O 读/写速度详细信息
- 当前挂载设备的磁盘使用情况
- 消耗资源最多的进程和他们的 CPU/内存使用情况

### 安装 Glances

Glances 在 Ubuntu 的软件仓库中，所以安装很简单。执行下面的命令安装 Glances：

    sudo apt-get install glances

（LCTT 译注：若安装后无法正常使用，可考虑使用 pip 安装/升级 glances：`sudo pip install --upgrade glances`）

### Glances 使用方法

安装完成后，可以执行下面的命令启动 Glances：

    glances

你将看到类似下图的输出：

![glances monitor system output](https://www.maketecheasier.com/assets/uploads/2015/12/glances_output1.png)

要退出 Glances 终端，按 ESC 键或 `Ctrl + C`。

默认情况下，时间间隔（LCTT 译注：显示数据刷新的时间间隔）是 1s，不过你可以在从终端启动 Glances 时自定义时间间隔。

要把时间间隔设为 5s，执行下面的命令：

    glances -t 5

### Glances 中不同颜色含义

Glances 中不同颜色的含义：

- `绿色`：正常（OK）
- `蓝色`：小心（careful）
- `紫色`：警告（warning）
- `红色`：致命（critical）

默认设置下，Glances 的阀值设置是：careful=50，warning=70，critical=90。你可以通过 “/etc/glances/” 目录下的默认配置文件 glances.conf 来自定义这些阀值。

### Glances 的选项

Glances 提供了很多快捷键，可以在它运行时用来查找输出信息。

下面是一些常用的热键列表：

- `m` : 按内存占用排序进程
- `p` : 按进程名称排序进程
- `c` : 按 CPU 占用率排序进程
- `i` : 按 I/O 频率排序进程
- `a` : 自动排序进程
- `d` : 显示/隐藏磁盘 I/O 统计信息
- `f` : 显示/隐藏文件系统统计信息
- `s` : 显示/隐藏传感器统计信息
- `y` : 显示/隐藏硬盘温度统计信息
- `l` : 显示/隐藏日志
- `n` : 显示/隐藏网络统计信息
- `x` : 删除警告和严重日志
- `h` : 显示/隐藏帮助界面
- `q` : 退出
- `w` : 删除警告记录

### 使用 Glances 监控远程系统

你也可以使用 Glances 监控远程系统。要在远程系统上使用它，使用下面的命令：

    glances -s

你会看到类似下面的输出：

![glances monitor remote system server](https://www.maketecheasier.com/assets/uploads/2015/12/glances_server.png)

如你所见，Glances 运行在 61209 端口。

现在，到远程机器上执行下面的命令以连接到指定 IP 地址的 Glances 服务器上。假设 192.168.1.10 是你的 Glances 服务器 IP 地址。

    glances -c -P 192.168.1.10

### 结论

对于每个 Linux 系统管理员来说，Glances 都是一个非常有用的工具。使用它，你可以轻松、高效地监控 Linux 系统。如果你有什么问题，自由地评论吧。

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/glances-monitor-system-ubuntu/

作者：[Hitesh Jethva][a]
译者：[bianjp](https://github.com/bianjp)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/hiteshjethva/

