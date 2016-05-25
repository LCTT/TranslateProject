使用 Nmon 监控 Linux 的系统性能
================================================================================
Nmon（得名于 Nigel 的监控器）是IBM的员工 Nigel Griffiths 为 AIX 和 Linux 系统开发的一款计算机性能系统监控工具。Nmon 可以把操作系统的统计数据展示在屏幕上或者存储到一份数据文件里，来帮助了解计算机资源的使用情况、调整方向和系统瓶颈。这个系统基准测试工具只需要使用一条命令就能得到大量重要的性能数据。使用 Nmon 可以很轻松的监控系统的 CPU、内存、网络、硬盘、文件系统、NFS、高耗进程、资源和 IBM Power 系统的微分区的信息。

### Nmon 安装 ###

Nmon 默认是存在于 Ubuntu 的仓库中的。你可以通过下面的命令安装 Nmon：

    sudo apt-get install nmon

### 怎么使用Nmon来监控Linux的性能 ###

安装完成后，通过在终端输入`nmon` 命令来启动 Nmon

    nmon

你会看到下面的输出：

![nmon-output](https://www.maketecheasier.com/assets/uploads/2015/12/nmon-output.png)

从上面的截图可以看到 nmon 命令行工具完全是交互式运行的，你可以使用快捷键来轻松查看对应的统计数据。你可以使用下面的 nmon 快捷键来显示不同的系统统计数据：

- `q` : 停止并退出 Nmon
- `h` : 查看帮助
- `c` : 查看 CPU 统计数据
- `m` : 查看内存统计数据
- `d` : 查看硬盘统计数据
- `k` : 查看内核统计数据
- `n` : 查看网络统计数据
- `N` : 查看 NFS 统计数据
- `j` : 查看文件系统统计数据
- `t` : 查看高耗进程
- `V` : 查看虚拟内存统计数据
- `v` : 详细模式

### 核查 CPU 处理器 ###

如果你想收集关于 CPU 性能相关的统计数据，你应该按下键盘上的`c`键，之后你将会看到下面的输出：

![nmon_cpu_output](https://www.maketecheasier.com/assets/uploads/2015/12/nmon_cpu_output.png)

### 核查高耗进程统计数据 ###

如果想收集系统正在运行的高耗进程的统计数据，按键盘上的`t`键，之后你将会看到下面的输出：

![nmon_process_output](https://www.maketecheasier.com/assets/uploads/2015/12/nmon_process_output.jpg)

### 核查网络统计数据 ###

如果想收集 Linux 系统的网络统计数据，按下`n`键，你将会看到下面输出：

![n_network_output](https://www.maketecheasier.com/assets/uploads/2015/12/nmon_network_output.png)

### 硬盘 I/O 图表 ###

使用`d` 键获取硬盘相关的信息，你会看到下面输出：

![nmon_disk_output](https://www.maketecheasier.com/assets/uploads/2015/12/nmon_disk_output.png)

### 核查内核信息 ###

Nmon 一个非常重要的快捷键是`k`键，用来显示系统内核相关的概要信息。按下`k`键之后，会看到下面输出：

![nmon_kernel_output](https://www.maketecheasier.com/assets/uploads/2015/12/nmon_kernel_output.png)

### 获取系统信息 ###

对每个系统管理员来说一个非常有用的快捷键是`r`键，可以用来显示计算机的系统结构、操作系统版本号和 CPU 等不同资源的信息。按下`r`键之后会看到下面输出：

![nmon_system_output](https://www.maketecheasier.com/assets/uploads/2015/12/nmon_system_output.png)

### 总结 ###

还有许多其他的工具做的和 Nmon 同样的工作，不过 Nmon 对一个 Linux 新手来说还是很友好的。如果你有什么问题，尽管评论。

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/monitor-linux-system-performance/

作者：[Hitesh Jethva][a]
译者：[sonofelice](https://github.com/sonofelice)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/hiteshjethva/

