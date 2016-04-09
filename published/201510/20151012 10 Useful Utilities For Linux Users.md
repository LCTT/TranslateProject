 10 个给 Linux 用户的有用工具
================================================================================
![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2014/09/linux-656x445.png)

### 引言 ###

在本教程中，我已经收集了10个给 Linux 用户的有用工具，其中包括各种网络监控，系统审计和一些其它实用的命令，它可以帮助用户提高工作效率。我希望你会喜欢他们。

#### 1. w ####

显示谁登录了系统并执行了哪些程序。

    $w

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_023.png)

不显示头部信息（LCTT译注：原文此处有误）

    $w -h

显示指定用户的信息

    $w <username>

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_024.png)

#### 2. nmon ####

Nmon（nigel’s monitor 的简写）是一个显示系统性能信息的工具。

    $ sudo apt-get install nmon

----------

    $ nmon

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_001.png)

nmon 可以显示与 netwrok，cpu, memory 和磁盘使用情况的信息。

**nmon 显示 cpu 信息 (按 c)**

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_002.png)

**nmon 显示 network 信息 (按 n)**

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_003.png)

**nman 显示 disk 信息 (按 d)**

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_004.png)

#### 3. ncdu ####

是一个支持光标的`du`程序，这个命令是用来分析各种目录占用的磁盘空间。

    $apt-get install ncdu

----------

    $ncdu /

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_006.png)

最终的输出:

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_007.png)

按 n 则通过文件名来排序，按 s 则按文件大小来排序（默认的）。

#### 4. slurm ####

一个基于网络接口的带宽监控命令行程序，它会用字符来显示文本图形。

    $ apt-get install slurm

例如:

    $ slurm -i <interface>

----------

    $ slurm -i eth1

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_0091.png)

**选项**

- 按 **l** 显示 lx/tx 指示灯.
- 按 **c** 切换到经典模式.
- 按 **r** 刷新屏幕.
- 按 **q** 退出.

#### 5.findmnt ####

Findmnt 命令用于查找挂载的文件系统。它用来列出安装设备，当需要时也可以挂载或卸载设备，它是 util-linux 软件包的一部分。

例子:

    $findmnt

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_0101.png)

以列表格式输出。

    $ findmnt -l

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_0111.png)

列出在 fstab 中挂载的文件系统。

    $ findmnt -s

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_0122.png)

按文件类型列出已挂载的文件系统。

    $ findmnt -t ext4

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_0131.png)

#### 6. dstat ####

一种灵活的组合工具，它可用于监控内存，进程，网络和磁盘性能，它可以用来取代 ifstat, iostat, dmstat 等。

    $apt-get install dstat

例如:

查看有关 cpu，硬盘和网络的详细信息。

    $ dstat

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_0141.png)

**-c** cpu

    $ dstat -c

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_0151.png)

**-d** 磁盘

    $ dstat -d

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_0161.png)

显示 cpu、磁盘等的详细信息。

    $ dstat -cdl -D sda1

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_017.png)

#### 7. saidar ####

另一种基于命令行的系统统计数据监控工具，提供了有关磁盘使用，网络，内存，交换分区等信息。

    $ sudo apt-get install saidar

例如:

    $ saidar

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_0181.png)

启用彩色输出

    $ saider -c

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_0191.png)

#### 8. ss ####

ss（socket statistics）是一个很好的替代 netstat 的选择，它从内核空间收集信息，比 netstat 的性能更好。

例如:

列出所有的连接

    $ ss |less

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_0201.png)

列出 tcp 流量

    $ ss -A tcp

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_0211.png)

列出进程名和 pid

    $ ss -ltp

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_0221.png)

#### 9. ccze ####

一个美化日志显示的工具 :).

    $ apt-get install ccze

例如:

    $ tailf /var/log/syslog | ccze

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_0231.png)

列出 ccze 模块:

    $ ccze -l

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_0241.png)

将日志保存为 html 文件。

    tailf /var/log/syslog | ccze -h > /home/tux/Desktop/rajneesh.html

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_025.png)

#### 10. ranwhen.py ####

一种基于 Python 的终端工具，它可以用来以图形方式显示系统活动状态。详细信息以一个丰富多彩的柱状图来展示。

安装 python（LCTT 译注：一般来说，你应该已经有了 python，不需要此步）：

    $ sudo apt-add-repository ppa:fkrull/deadsnakes

更新系统:

    $ sudo apt-get update

下载 python:

    $ sudo apt-get install python3.2

[点此下载 ranwhen.py][1]

    $ unzip ranwhen-master.zip && cd ranwhen-master

运行工具。

    $ python3.2 ranwhen.py

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_026.png)

### 结论 ###

这都是些不常见但重要的 Linux 管理工具。他们可以在日常生活中帮助用户。在我们即将发表的文章中，我们会尽量多带来些管理员/用户工具。

玩得愉快！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/10-useful-utilities-linux-users/

作者：[Rajneesh Upadhyay][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/rajneesh/
[1]:https://github.com/p-e-w/ranwhen/archive/master.zip
