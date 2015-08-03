监控 Linux 系统的 7 个命令行工具
================================================================================
**这里有一些基本的命令行工具，让你能更简单地探索和操作Linux。**

![Image courtesy Meltys-stock](http://images.techhive.com/images/article/2015/06/command-line-tools-monitoring-linux-system-1-100591899-orig.png)

### 深入 ###

关于Linux最棒的一件事之一是你能深入操作系统，来探索它是如何工作的，并寻找机会来微调性能或诊断问题。这里有一些基本的命令行工具，让你能更简单地探索和操作Linux。大多数的这些命令是在你的Linux系统中已经内建的，但假如它们没有的话，就用谷歌搜索命令名和你的发行版名吧，你会找到哪些包需要安装（注意，一些命令是和其它命令捆绑起来打成一个包的，你所找的包可能写的是其它的名字）。如果你知道一些你所使用的其它工具，欢迎评论。


### 我们怎么开始 ###

![](http://images.techhive.com/images/article/2015/06/command-line-tools-monitoring-linux-system-2-100591901-orig.png)

须知： 本文中的截图取自一台[Debian Linux 8.1][1] (“Jessie”)，其运行在[OS X 10.10.3][3] (“Yosemite”)操作系统下的[Oracle VirtualBox 4.3.28][2]中的一台虚拟机里。想要建立你的Debian虚拟机，可以看看我的这篇教程——“[如何在 VirtualBox VM 下安装 Debian][4]”。


### Top ###

![](http://images.techhive.com/images/article/2015/06/command-line-tools-monitoring-linux-system-3-100591902-orig.png)

作为Linux系统监控工具中比较易用的一个，**top命令**能带我们一览Linux中的几乎每一处。以下这张图是它的默认界面，但是按“z”键可以切换不同的显示颜色。其它热键和命令则有其它的功能，例如显示概要信息和内存信息（第四行第二个），根据各种不一样的条件排序、终止进程任务等等（你可以在[这里][5]找到完整的列表）。


### htop ###

![](http://images.techhive.com/images/article/2015/06/command-line-tools-monitoring-linux-system-4-100591904-orig.png)

相比top，它的替代品Htop则更为精致。维基百科是这样描述的：“用户经常会部署htop以免Unix top不能提供关于系统进程的足够信息，比如说当你在尝试发现应用程序里的一个小的内存泄露问题，Htop一般也能作为一个系统监听器来使用。相比top，它提供了一个更方便的光标控制界面来向进程发送信号。” (想了解更多细节猛戳[这里][6])


### Vmstat ###

![](http://images.techhive.com/images/article/2015/06/command-line-tools-monitoring-linux-system-5-100591903-orig.png)

Vmstat是一款监控Linux系统性能数据的简易工具，这让它更合适使用在shell脚本中。使出你的正则表达式绝招，用vmstat和cron作业来做一些激动人心的事情吧。“后面的报告给出的是上一次系统重启之后的均值，另外一份报告给出的则是从前一个报告起间隔周期中的信息。其它的进程和内存报告是那个瞬态的情况”(猛戳[这里][7]获取更多信息)。

### ps ###

![](http://images.techhive.com/images/article/2015/06/command-line-tools-monitoring-linux-system-6-100591905-orig.png)

ps命令展现的是正在运行中的进程列表。在这种情况下，我们用“-e”选项来显示每个进程，也就是所有正在运行的进程了（我把列表滚动到了前面，否则列名就看不到了）。这个命令有很多选项允许你去按需格式化输出。只要使用上述一点点的正则表达式技巧，你就能得到一个强大的工具了。猛戳[这里][8]获取更多信息。

### Pstree ###

![](http://images.techhive.com/images/article/2015/06/command-line-tools-monitoring-linux-system-7-100591906-orig.png)

Pstree“以树状图显示正在运行中的进程。这个进程树是以某个 pid 为根节点的，如果pid被省略的话那树是以init为根节点的。如果指定用户名，那所有进程树都会以该用户所属的进程为父进程进行显示。”以树状图来帮你将进程之间的所属关系进行分类，这的确是个很有效的工具(戳[这里][9])。

### pmap ###

![](http://images.techhive.com/images/article/2015/06/command-line-tools-monitoring-linux-system-8-100591907-orig.png)

在调试过程中，理解一个应用程序如何使用内存是至关重要的，而pmap的作用就是当给出一个进程ID时显示出相关信息。上面的截图展示的是使用“-x”选项所产生的部分输出，你也可以用pmap的“-X”选项来获取更多的细节信息，但是前提是你要有个更宽的终端窗口。

### iostat ###

![](http://images.techhive.com/images/article/2015/06/command-line-tools-monitoring-linux-system-9-100591900-orig.png)

Linux系统的一个至关重要的性能指标是处理器和存储的使用率，它也是iostat命令所报告的内容。如同ps命令一样，iostat有很多选项允许你选择你需要的输出格式，除此之外还可以在某一段时间范围内的重复采样几次。详情请戳[这里][10]。

--------------------------------------------------------------------------------

via: http://www.networkworld.com/article/2937219/linux/7-command-line-tools-for-monitoring-your-linux-system.html

作者：[Mark Gibbs][a]
译者：[ZTinoZ](https://github.com/ZTinoZ)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.networkworld.com/author/Mark-Gibbs/
[1]:https://www.debian.org/releases/stable/
[2]:https://www.virtualbox.org/
[3]:http://www.apple.com/osx/
[4]:http://www.networkworld.com/article/2937148/how-to-install-debian-linux-8-1-in-a-virtualbox-vm
[5]:http://linux.die.net/man/1/top
[6]:http://linux.die.net/man/1/htop
[7]:http://linuxcommand.org/man_pages/vmstat8.html
[8]:http://linux.die.net/man/1/ps
[9]:http://linux.die.net/man/1/pstree
[10]:http://linux.die.net/man/1/iostat
