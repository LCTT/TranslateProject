translating by szrlee
Colourful ! systemd vs sysVinit Linux Cheatsheet
================================================================================
**systemd** is the new init system, starting with Fedora and now adopted in many distributions like RedHat, Suse and Centos.
**systemd** 是一种新型init「译者注：每个操作系统都有一个启动程序，而Linux init是Linux系统操作中不可缺少的程序之一。所谓的init进程，它是一个由内核启动的用户级进程。内核自行启动（已经被载入内存，开始运行，并已初始化所有的设备驱动程序和数据结构等）之后，就通过启动一个用户级程序init的方式，完成引导进程。所以init始终是第一个进程（其进程编号始终为1）」系统，最早在Fedora中使用「译者注：真的吗？不是Arch？」，经过调整适应了其它许多发行版，例如RedHat、Suse和CentOS。
Historically, most of us have been using traditional SysV init scripts normally residing in /etc/rc.d/init.d/.
历史上，我们大部分人用过传统的SysV init 初始化脚本，它通常情况下在/etc/rc.d/init.d/文件夹下。
These scripts invoke a daemon binary which will then fork a background process. 
这些脚本调用守护进程二进制代码，在后台fork一个进程。
Even though shell scripts are very flexible, tasks like supervising processes and parallelized execution ordering are difficult to implement. 
尽管shell脚本非常的灵活，但是很难实现像superviseing（监管）进程和并行执行命令这样的任务。
With the introduction of systemd’s new-style daemons it is easier to supervise and control them at runtime and it simplifies their implementation.
通过对systemd的新式守护进程的介绍，我们发现systemd可以在runtime（运行时）更加简单得监管和控制守护进程，并且简化了监控的实现方式（implementation）。

The **systemctl** command is a very good initiative by the systemd team.
**systemctl**命令是systemd团队一个非常好的首创。
It shows more detailed error messages and also runtime errors of services including start-up errors.
这个命令能够显示更多详细的错误信息和包括启动错误在内的服务运行时错误。
systemd have introduced a new term called **cgroups** (control groups) which is basically groups of process that can be arranged in a hierarchy. 
systemd介绍了它的新术语**cgroups**（控制组），它基本上是可被分层次安排的进程任务组。「译者注：这里简单介绍一下cgroup（control group）称为Containers，Containers着眼于资源的分配，利用configfs作配置。它有两个重要概念：第一是subsystem，内核可以给进程提供的服务/资源；第二是container，一个进程组，成员共享同样的一个或多个子系统分配限制。Containers是分层次的，一个container可以hold多个container。它的可取之处是创建了一个资源分配的框架，其它开发者可以利用这个框架去开发自己的资源分配patch，比如上回提到的磁盘设备。」
With the original init system, determining which process does what and who it belongs to becomes increasingly difficult. 
如果仅仅通过原来的初始化系统，决定哪个进程是做什么的、属于哪个用户的变得越来越困难。
With systemd, when processes spawn other processes these children are automatically made members of the parents cgroup thus avoiding confusions about inheritance.
但是通过systemd，当一个进程派生其它进程是，这些子进程会被自动变成父进程控制组的成员，这样一来就可以避免继承的混乱。

![](http://images.linoxide.com/systemd-vs-sysVinit-cheatsheet.jpg)

There are a lot of new [systemd commands available on rhel / centos 7.0][1]注：此文原文已做，文件名是:20140901 Awesome systemd Commands to Manage Linux System.md，如果翻译发布了，可修改此链接 version that would replace sysvinit commands. You can also download [pdf version of the systemd vs sysvinit cheatsheet][2].

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/systemd-vs-sysvinit-cheatsheet/

作者：[Bobbin Zachariah][a]
译者：[szrlee](https://github.com/szrlee)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/bobbin/
[1]:http://linoxide.com/linux-command/linux-systemd-commands/
[2]:http://images.linoxide.com/systemd-vs-sysVinit-cheatsheet.pdf
