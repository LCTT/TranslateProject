使用 smem 可视化显示Linux内存使用情况
================================================================================
物理内存不足对Linux桌面系统和服务器系统的性能影响都很大。当你的计算机变慢时，要做的第一件事就是释放内存。尤其是在多用户环境以及执行关键任务的服务器环境下，内存消耗会变得更加关键，因为多个用户和应用线程会同时竞争更多的内存空间。

如果要监测系统内各种资源的使用情况（比如说CPU或内存），图形化显示是一种高效的方法，通过图形界面可以快速分析各用户和进程的资源消耗情况。本教程将给大家介绍**在linux下图形化分析内存使用情况**的方法，使用到命令行工具是[smem][1].

### 物理内存使用情况: RSS 、 PSS 和 USS ###

由于Linux使用到了虚拟内存（virtual memory），因此要准确的计算一个进程实际使用的物理内存就不是那么简单。 只知道进程的虚拟内存大小也并没有太大的用处，因为还是无法获取到实际分配的物理内存大小。

- **RSS（Resident set size）**，使用top命令可以查询到，是最常用的内存指标，表示进程占用的物理内存大小。但是，将各进程的RSS值相加，通常会超出整个系统的内存消耗，这是因为RSS中包含了各进程间共享的内存。
- **PSS（Proportional set size）**会更准确一些，它将共享内存的大小进行平均后，再分摊到各进程上去。
- **USS(Unique set size )**是PSS中自己的部分，它只计算了进程独自占用的内存大小，不包含任何共享的部分。

### 安装Smem ###

smem是一个能够生成多种内存耗用报告的命令行工具，它从/proc文件系统中提取各进程的PSS/USS信息，并进行汇总输出。它还内建了图表的生成能力，所以能够方便地分析整个系统的内存使用情况。

#### 在Debian, Ubuntu 或 Linux Mint 上安装smem ####

    $ sudo apt-get install smem 

#### 在Fedora 或 CentOS/RHEL上安装Smem ####

在CentOS/RHEL上，你首先得[启用][2]EPEL仓库。

    $ sudo yum install smem python-matplotlib 

### 使用smem检查内存使用情况 ###

你可以在非特权模式下使用smem，它能够显示当前用户运行的所有进程的内存使用情况，并按照PSS的大小进行排序。

    $ smem 

![](https://farm8.staticflickr.com/7498/15801819892_d017280595_z.jpg)

如有你想得到整个系统中所有用户的内存使用情况，就需要使用root权限来运行smem。

    $ sudo smem 

![](https://farm9.staticflickr.com/8635/15776587626_1de74c4bcd_z.jpg)

也可以按用户维度来输出报告：

    $ sudo smem -u 

![](https://farm9.staticflickr.com/8543/15798375491_510698d98f_z.jpg)

smem提供了以下选项来对输出结果进行筛选，支持按映射方式（mapping）、进程和用户三个维度的筛选：

- -M <正则表达式>
- -P <正则表达式>
- -U <正则表达式> 

想了解smem更多的使用方式，可以查询用户手册（man page）。

### 使用smem图形化显示内存使用情况 ###

图形化的报告使用起来会更加方便快捷。smem支持两种格式的图形显示方式：直方图和饼图。

下面是一些图形化显示的实例。

下面的命令行会基于PSS/RSS值，生成直方图，以用户alice为例。

    $ sudo smem --bar name -c "pss uss" -U alice 

![](https://farm6.staticflickr.com/5616/15614838448_640e850cd8_z.jpg)

这个例子会生成一张饼图，图中显示了系统中各进程的PSS内存使用量：

    $ sudo smem --pie name -c "pss" 

![](https://farm8.staticflickr.com/7466/15614838428_eed7426cfe_z.jpg)

概括来说，smem是一个方便易用的内存分析工具。利用smem的格式化输出，你可以对内存使用报告进行自动化分析，并执行一些自动化的处理措施。如果你还知道其他的一些优秀的内存检测工具，请在留言区告诉我。

--------------------------------------------------------------------------------

via: http://xmodulo.com/visualize-memory-usage-linux.html

作者：[Dan Nanni][a]
译者：[coloka](https://github.com/coloka)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://www.selenic.com/smem/
[2]:http://xmodulo.com/how-to-set-up-epel-repository-on-centos.html