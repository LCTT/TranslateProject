systemd 与 sysVinit 彩版对照表
================================================================================

**systemd** 是一种新型init系统「译者注：每个操作系统都有一个启动程序，而Linux init是Linux系统操作中不可缺少的程序之一。所谓的init进程，它是一个由内核启动的用户级进程。内核自行启动（已经被载入内存，开始运行，并已初始化所有的设备驱动程序和数据结构等）之后，就通过启动一个用户级程序init的方式，完成引导进程。所以init始终是第一个进程（其进程编号始终为1）」，最早在Fedora中使用「译者注：真的吗？不是Arch？」，经过调整适应了其它许多发行版，例如RedHat、Suse和CentOS。

历史上，我们大部分人用过传统的SysV init 初始化脚本，它通常情况下在/etc/rc.d/init.d/文件夹下。这些脚本调用守护进程二进制代码，在后台fork一个进程。

尽管shell脚本非常的灵活，但是很难实现像superviseing（监管）进程和并行执行命令这样的任务。

通过对systemd的新式守护进程的介绍，我们发现systemd可以在runtime（运行时）更加简单的监管和控制守护进程，并且简化了监控的实现方式（implementation）。

**systemctl**命令是systemd团队一个非常好的首创。

这个命令能够显示更多的详细错误信息和包括启动错误在内的服务运行时错误。systemd引入了一个新术语：**cgroups**（控制组），它基本上是可被分层次安排的进程任务组。「译者注：这里简单介绍一下cgroup（control group）称为Containers，Containers着眼于资源的分配，利用configfs作配置。它有两个重要概念：第一是subsystem，内核可以给进程提供的服务/资源；第二是container，一个进程组，成员共享同样的一个或多个子系统分配限制。Containers是分层次的，一个container可以hold多个container。它的可取之处是创建了一个资源分配的框架，其它开发者可以利用这个框架去开发自己的资源分配patch，比如磁盘设备。」

如果仅仅通过原来的初始化系统，决定哪个进程是做什么的、属于哪个用户的变得越来越困难。

但是通过systemd，当一个进程派生其它进程时，这些子进程会被自动变成父进程控制组的成员，这样一来就可以避免继承的混乱。


![](http://images.linoxide.com/systemd-vs-sysVinit-cheatsheet.jpg)

有许多新的运行[在 rhel / centos 7.0 上的 systemd 命令][1]可以替代 sysvinit 的对应命令。你也可以下载 [本文的 PDF 版本][2]。


--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/systemd-vs-sysvinit-cheatsheet/

作者：[Bobbin Zachariah][a]
译者：[szrlee](https://github.com/szrlee)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/bobbin/
[1]:http://linoxide.com/linux-command/linux-systemd-commands/
[2]:http://images.linoxide.com/systemd-vs-sysVinit-cheatsheet.pdf
