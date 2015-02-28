真的超赞！用systemd命令来管理linux系统！
================================================================================

Systemd是一种新的linux系统服务管理器。

它替换了init系统，能够管理系统的启动过程和一些系统服务，一旦启动起来，就将监管整个系统。在本文中，我们用的是[安装有 systemd 216 版本的centos 7.0][1]，其最新版本[可以从 freedesktop.org 下载得到][2]。

因为linux操作系统里出现的这一个新人，PID 1被“systemd”占据了，这能通过**pstree**命令看到。

    [root@linoxide ~]# pstree

![](http://linoxide.com/wp-content/uploads/2014/08/01.systemd_pstree.png)

那么现在让我们来探索systemd擅长什么，它又有多大的可能性成为sysVinit的新的替代品。

### 1. 更快启动 ###

sysvinit一次一个串行地启动进程。

而Systemd则并行地启动系统服务进程，并且最初仅启动确实被依赖的那些服务，极大地减少了系统引导的时间。

你可以用下面的命令看到系统引导用时：

    [root@linoxide ~]# systemd-analyze

![](http://linoxide.com/wp-content/uploads/2014/08/02.systemd_analyze.png)

使用 **time** 参数也能够显示同样的内容。

    [root@linoxide ~]# systemd-analyze time

![](http://linoxide.com/wp-content/uploads/2014/08/03.systemd_analyze2.png)

如果你想以进程初始化所占用时间排序打印出所有正在运行的单元列表，那么**systemd-analyze**命令可以帮助你完成这个任务。

    [root@linoxide ~]# systemd-analyze blame

![](http://linoxide.com/wp-content/uploads/2014/08/04.systemd_blame.png)

上面的截屏只显示了小部分进程，你可以就像less分页器那样用箭头滚动列表。

### 2.  systemctl 命令 ###

systemctl命令是自systemd出现以来被广泛讨论的命令。你可以通过这个命令管理你的整个系统，让我们通过探究这个命令来更进一步。

#### 2.1 列出单元 ####

**systemctl**命令可以带上list-units，也可以什么选项都不带来列出所有正在运行的单元。

    [root@linoxide ~]# systemctl

或

    [root@linoxide ~]# systemctl list-units

![](http://linoxide.com/wp-content/uploads/2014/08/05.systemd_list_units.png)

#### 2.2 列出失败的单元 ####

运行失败的单元可以用带--failed选项的命令显示出来。

    [root@linoxide ~]# systemctl --failed

![](http://linoxide.com/wp-content/uploads/2014/08/06.systemd_failed.png)

你可以在这篇文章很多地方看到systemctl的用法。

### 3. 管理服务 ###

让我们来看看systemd是怎么管理系统服务的。

#### 3.1 激活的服务 ####

所有被激活的服务可以同下面这条命令来查看。

    [root@linoxide ~]# systemctl list-units -t service

![](http://linoxide.com/wp-content/uploads/2014/08/07.systemd_active_services.png)

#### 3.2 服务状态 ####

在sysvinit中，我们可以用“**service**”命令来管理服务，但在systemd中，我们用systemctl这个命令。
我们可以用下面这个命令来查看服务是否在运行。

    [root@linoxide ~]# systemctl status dnsmasq

![](http://linoxide.com/wp-content/uploads/2014/08/08.systemd_status.png)

#### 3.3 启动一个服务 ####

用下面这条命令来启动服务。

    [root@linoxide ~]# systemctl start dnsmasq

对应于**service**命令，这个命令不进行输出。但是毋庸置疑，我们可以通过再次查看这个刚刚被启动的服务的status（状态）来确认他是否被成功地启动了。

![](http://linoxide.com/wp-content/uploads/2014/08/09.systemd_start.png)

#### 3.4 停止一个服务 ####

现在聪明的你一定知道怎么在systemd下用命令来关闭服务了吧。

    [root@linoxide ~]# systemctl stop dnsmasq

![](http://linoxide.com/wp-content/uploads/2014/08/10.systemd_stop.png)

#### 3.5 重启一个服务 ####

类似的，重启系统服务是用‘**systemctl restart**’来管理的。

    [root@linoxide ~]# systemctl restart dnsmasq

![](http://linoxide.com/wp-content/uploads/2014/08/11.systemd_restart.png)

#### 3.6 重新加载一个服务 ####

在我们需要重新加载服务的配置文件又不想重启这个服务（例如ssh）时，我们可以用这个命令。

    [root@linoxide ~]# systemctl reload sshd

![](http://linoxide.com/wp-content/uploads/2014/08/12.systemd_reload.png)

虽然上述几个命令的语法是可以工作的，但是官方文档建议我们用下面这种语法形式来运行命令（LCTT 译注，即使用在服务名后面跟上“.service”的完整名称）：

    [root@linoxide ~]# systemctl status dnsmasq.service

![](http://linoxide.com/wp-content/uploads/2014/08/13.systemd_alternate_syntax.png)

### 4. 管理引导时的服务 ###

**chkconfig**命令被用来管理系统引导时的服务。同样用systemd也可以管理引导时的系统服务。

#### 4.1 检查服务引导时是否运行 ####

这条命令用来确定服务是否是引导时启动的。

    [root@linoxide ~]# systemctl is-enabled dnsmasq.service

![](http://linoxide.com/wp-content/uploads/2014/08/14.systemd_is_enabled.png)

#### 4.2 让服务在引导时运行 ####

**systemctl**命令是这样来enable（使之在引导时启动）一个服务的。（这相当于sysvinit中的‘**chkconfig on**’）

    [root@linoxide ~]# systemctl enable dnsmasq.service

![](http://linoxide.com/wp-content/uploads/2014/08/15.systemd_enable.png)

#### 4.3 取消服务在引导时运行 ####

类似的，使服务不在引导时启动用这个命令。

    [root@linoxide ~]# systemctl disable dnsmasq.service

![](http://linoxide.com/wp-content/uploads/2014/08/16.systemd_disable.png)

### 5. 管理远程系统 ###

所有刚才提到的systemctl命令通常都能被用来管理远程主机，完成这个任务将用到**ssh**来进行通讯。你只需要像这样将远程主机和用户名添加到systemctl命令后。

    [root@linoxide ~]# systemctl status sshd -H root@1.2.3.4

![](http://linoxide.com/wp-content/uploads/2014/08/17.systemd_remote.png)

### 6. 管理目标 ###

Systemd有一个完成与sysVinit的runlevels相似任务的构想。

sysVinit的runlevels大多是以数字分级的。这里是runlevers在systemd中的对应元素。

> 0 runlevel0.target, poweroff.target
> 
> 1, s, single runlevel1.target, rescue.target
> 
> 2, 4 runlevel2.target, runlevel4.target, multi-user.target
> 
> 3 runlevel3.target, multi-user.target
> 
> 5 runlevel5.target, graphical.target
> 
> 6 runlevel6.target, reboot.target
> 
> emergency emergency.target

#### 6.1 改变当前目标 ####

当前target可以用这个命令切换。

    [root@linoxide ~]# systemctl isolate graphical.target

![](http://linoxide.com/wp-content/uploads/2014/08/18.systemd_isolate.png)

#### 6.2 列出当前目标 ####

如果你想查看你正处于哪个target中，你需要列出相应的单元。虽然这样操作可能让你不太爽，但是这就是systemd工作的方式。

    [root@linoxide ~]# systemctl list-units --type=target

![](http://linoxide.com/wp-content/uploads/2014/08/19.systemd_targets.png)

你可以看到“graphical.target”列在此处，这就是我们刚才切换到的目标。现在，让我们切换runlevel到multi-user.target，然后分析下列命令的输出。

    [root@linoxide ~]# systemctl isolate multi-user.target
    [root@linoxide ~]# systemctl list-units --type=target

![](http://linoxide.com/wp-content/uploads/2014/08/20.systemd_multi-user.png)

#### 6.3 列出默认目标 ####

用这个systemctl命令来查看默认目标。

    [root@linoxide ~]# systemctl get-default

![](http://linoxide.com/wp-content/uploads/2014/08/21.systemd_get_default.png)

#### 6.4 改变默认目标 ####

通过systemctl的set-default命令可以将某个目标设置成默认目标。

    [root@linoxide ~]# systemctl set-default graphical.target

![](http://linoxide.com/wp-content/uploads/2014/08/22.systemd_set_default.png)

### 7. 记录 systemd 的日志 ###

journald是systemd独有的日志系统，替换了sysVinit中的syslog守护进程。命令**journalctl**用来读取日志。

    [root@linoxide ~]# journalctl

![](http://linoxide.com/wp-content/uploads/2014/08/23.systemd_logs.png)

#### 7.1 查看引导信息 ####

运行**journalctl -b**命令来查看所有引导日志。

    [root@linoxide ~]# journalctl -b

![](http://linoxide.com/wp-content/uploads/2014/08/24.systemd_boot.png)

#### 7.2 即时显示引导日志 ####

下面这个命令可以实时显示系统日志（类似**tail -f**）。

    [root@linoxide ~]# journalctl -f

![](http://linoxide.com/wp-content/uploads/2014/08/25.systemd_follow_logs.png)

#### 7.3 查看特定服务的日志 ####

你可以像这样运用**journalctl**来查看你只想看到的服务或可执行程序的日志。

    [root@linoxide ~]# journalctl /usr/sbin/dnsmasq

![](http://linoxide.com/wp-content/uploads/2014/08/26.systemd_specific.png)

### 8. 电源管理 ###

systemctl命令也可以用来关机，重启或者休眠。

要关机、重启、挂起和休眠，分别使用如下命令：

    [root@linoxide ~]# systemctl poweroff

    [root@linoxide ~]# systemctl reboot

    [root@linoxide ~]# systemctl suspend

    [root@linoxide ~]# systemctl hibernate

### 9. 又及 ###

**systemd**带来了一整套与操作系统交互的新途径，并且极具特色。举个栗子，你可以用hostnamectl命令来获得你的linux机器的hostname和其它有用的独特信息。

    [root@linoxide ~]# hostnamectl

![](http://linoxide.com/wp-content/uploads/2014/08/27.systemd_hostnamectl.png)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-systemd-commands/

作者：[Raghu][a]
译者：[szrlee](https://github.com/szrlee)
校对：[ wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/raghu/
[1]:http://linoxide.com/linux-how-to/install-systemd-centos-redhat/
[2]:http://www.freedesktop.org/software/systemd/
