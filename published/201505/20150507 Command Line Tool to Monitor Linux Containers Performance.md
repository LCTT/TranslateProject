监控 Linux 容器性能的命令行神器
================================================================================
ctop是一个新的基于命令行的工具，它可用于在容器层级监控进程。容器通过利用控制器组（cgroup）的资源管理功能，提供了操作系统层级的虚拟化环境。该工具从cgroup收集与内存、CPU、块输入输出的相关数据，以及拥有者、开机时间等元数据，并以人性化的格式呈现给用户，这样就可以快速对系统健康状况进行评估。基于所获得的数据，它可以尝试推测下层的容器技术。ctop也有助于在低内存环境中检测出谁在消耗大量的内存。

### 功能 ###

ctop的一些功能如下：

- 收集CPU、内存和块输入输出的度量值
- 收集与拥有者、容器技术和任务统计相关的信息
- 通过任意栏对信息排序
- 以树状视图显示信息
- 折叠/展开cgroup树
- 选择并跟踪cgroup/容器
- 选择显示数据刷新的时间窗口
- 暂停刷新数据
- 检测基于systemd、Docker和LXC的容器
- 基于Docker和LXC的容器的高级特性
    - 打开/连接shell以进行深度诊断
    - 停止/杀死容器类型

### 安装 ###

**ctop**是由Python写成的，因此，除了需要Python 2.6或其更高版本外（带有内建的光标支持），别无其它外部依赖。推荐使用Python的pip进行安装，如果还没有安装pip，请先安装，然后使用pip安装ctop。

*注意：本文样例来自Ubuntu（14.10）系统*

    $ sudo apt-get install python-pip

使用pip安装ctop：

    poornima@poornima-Lenovo:~$ sudo pip install ctop

    [sudo] password for poornima:

    Downloading/unpacking ctop

    Downloading ctop-0.4.0.tar.gz

    Running setup.py (path:/tmp/pip_build_root/ctop/setup.py) egg_info for package ctop

    Installing collected packages: ctop

    Running setup.py install for ctop

    changing mode of build/scripts-2.7/ctop from 644 to 755

    changing mode of /usr/local/bin/ctop to 755

    Successfully installed ctop

    Cleaning up...

如果不选择使用pip安装，你也可以使用wget直接从github安装：

    poornima@poornima-Lenovo:~$ wget https://raw.githubusercontent.com/yadutaf/ctop/master/cgroup_top.py -O ctop

    --2015-04-29 19:32:53-- https://raw.githubusercontent.com/yadutaf/ctop/master/cgroup_top.py

    Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 199.27.78.133

    Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|199.27.78.133|:443... connected.

    HTTP request sent, awaiting response... 200 OK Length: 27314 (27K) [text/plain]

    Saving to: ctop

    100%[======================================>] 27,314 --.-K/s in 0s

    2015-04-29 19:32:59 (61.0 MB/s) - ctop saved [27314/27314]

----------

    poornima@poornima-Lenovo:~$ chmod +x ctop

如果cgroup-bin包没有安装，你可能会碰到一个错误消息，你可以通过安装需要的包来解决。

    poornima@poornima-Lenovo:~$ ./ctop

    [ERROR] Failed to locate cgroup mountpoints.

    poornima@poornima-Lenovo:~$ sudo apt-get install cgroup-bin

下面是ctop的输出样例：

![ctop screen](http://blog.linoxide.com/wp-content/uploads/2015/05/ctop.png)

*ctop屏幕*

### 用法选项 ###

    ctop [--tree] [--refresh=] [--columns=] [--sort-col=] [--follow=] [--fold=, ...] ctop (-h | --help)

当你进入ctop屏幕，可使用上（↑）和下（↓）箭头键在容器间导航。点击某个容器就选定了该容器，按q或Ctrl+C退出该容器。

现在，让我们来看看上面列出的那一堆选项究竟是怎么用的吧。

**-h / --help  - 显示帮助信息**

    poornima@poornima-Lenovo:~$ ctop -h
    Usage: ctop [options]

    Options:
    -h, --help show this help message and exit
    --tree show tree view by default
    --refresh=REFRESH Refresh display every <seconds>
    --follow=FOLLOW Follow cgroup path
    --columns=COLUMNS List of optional columns to display. Always includes
    'name'
    --sort-col=SORT_COL Select column to sort by initially. Can be changed
    dynamically.


**--tree - 显示容器的树形视图**

默认情况下，会显示列表视图

当你进入ctop窗口，你可以使用F5按钮在树状/列表视图间切换。

**--fold=<name> - 在树形视图中折叠名为 \<name> 的 cgroup 路径**

该选项需要与 --tree 选项组合使用。

例子:   ctop --tree --fold=/user.slice

![Output of 'ctop --fold'](http://blog.linoxide.com/wp-content/uploads/2015/05/ctop-fold.png)

*'ctop --fold'的输出*

在ctop窗口中，使用+/-键来展开或折叠子cgroup。

注意：在写本文时，pip仓库中还没有最新版的ctop，还不支持命令行的‘--fold’选项

**--follow= - 跟踪/高亮 cgroup 路径**

例子: ctop --follow=/user.slice/user-1000.slice

正如你在下面屏幕中所见到的那样，带有“/user.slice/user-1000.slice”路径的cgroup被高亮显示，这让用户易于跟踪，就算显示位置变了也一样。

![Output of 'ctop --follow'](http://blog.linoxide.com/wp-content/uploads/2015/05/ctop-follow.png)

*'ctop --follow'的输出*

你也可以使用‘f’按钮来让高亮的行跟踪选定的容器。默认情况下，跟踪是关闭的。

**--refresh= - 按指定频率刷新显示，默认1秒**

这对于按每用户需求来显示改变刷新率时很有用。使用‘p’按钮可以暂停刷新并选择文本。

**--columns=<columns> - 限定只显示选定的列。'name' 需要是第一个字段，其后跟着其它字段。默认情况下，字段包括：owner, processes,memory, cpu-sys, cpu-user, blkio, cpu-time**

例子: ctop --columns=name,owner,type,memory

![Output of 'ctop --column'](http://blog.linoxide.com/wp-content/uploads/2015/05/ctop-column.png)

*'ctop --column'的输出*

**-sort-col=<sort-col> - 按指定的列排序。默认使用 cpu-user 排序**

例子: ctop --sort-col=blkio

如果有Docker和LXC支持的额外容器，跟踪选项也是可用的：

    press 'a' - 接驳到终端输出

    press 'e' - 打开容器中的一个 shell

    press 's' - 停止容器 (SIGTERM)

    press 'k' - 杀死容器 (SIGKILL)

目前 Jean-Tiare Le Bigot 还在积极开发 [ctop][1] 中，希望我们能在该工具中见到像本地 top 命令一样的特性 :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/how-tos/monitor-linux-containers-performance/

作者：[B N Poornima][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/bnpoornima/
[1]:https://github.com/yadutaf/ctop
