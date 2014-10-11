在 Debian 上使用 systemd 管理系统
================================================================================
人类已经无法阻止 systemd 占领全世界的 Linux 系统了，唯一阻止它的方法是在你自己的机器上手动卸载它。到目前为止，systemd 已经创建了比任何软件都多的技术问题、感情问题和社会问题。这一点从[“Linux 初始化软件之战”][1]上就能看出，这场争论在 Debian 开发者之间持续了好几个月。当 Debian 技术委员会最终决定将 systemd 放到 Debian 8（代号 Jessie）的发行版里面时，其反对者试图通过多种努力来[取代这项决议][2]，甚至有人扬言要威胁那些支持 systemd 的开发者的生命安全。

这也说明了 systemd 对 Unix 传承下来的系统处理方式有很大的干扰。“一个软件只做一件事情”的哲学思想已经被这个新来者彻底颠覆。除了取代了 sysvinit 成为新的系统初始化工具外，systemd 还是一个系统管理工具。目前为止，由于 systemd-sysv 这个软件包提供的兼容性，那些我们使用惯了的工具还能继续工作。但是当 Debian 将 systemd 升级到214版本后，这种兼容性就不复存在了。升级措施预计会在 Debian 8 "Jessie" 的稳定分支上进行。从此以后用户必须使用新的命令来管理系统、执行任务、变换运行级别、查询系统日志等等。不过这里有一个应对方案，那就是在 .bashrc 文件里面添加一些别名。

现在就让我们来看看 systemd 是怎么改变你管理系统的习惯的。在使用 systemd 之前，你得先把 sysvinit 保存起来，以便在 systemd 出错的时候还能用 sysvinit 启动系统。这种方法**只有在没安装 systemd-sysv 的情况下才能生效**，具体操作方法如下：

    # cp -av /sbin/init /sbin/init.sysvinit 

在紧急情况下，可以把下面的文本：

    init=/sbin/init.sysvinit

添加到内核启动参数项那里。

### systemctl 的基本用法 ###

systemctl 的功能是替代“/etc/init.d/foo start/stop”这类命令，另外，其实它还能做其他的事情，这点你可以参考 man 文档。

一些基本用法：

- systemctl - 列出所有单元（UNIT）以及它们的状态（这里的 UNIT 指的就是系统上的 job 和 service）
- systemctl list-units - 列出所有 UNIT
- systemctl start [NAME...] - 启动一项或多项 UNIT
- systemctl stop [NAME...] - 停止一项或多项 UNIT
- systemctl disable [NAME...] - 将 UNIT 设置为开机不启动
- systemctl list-unit-files - 列出所有已安装的 UNIT，以及它们的状态
- systemctl --failed - 列出开机启动失败的 UNIT
- systemctl --type=mount - 列出某种类型的 UNIT，类型包含：service, mount, device, socket, target
- systemctl enable debug-shell.service - 将一个 shell 脚本设置为开机启动，用于调试

为了更方便处理这些 UNIT，你可以使用 systemd-ui 软件包，你只要输入 systemadm 命令就可以使用这个软件。

你同样可以使用 systemctl 实现转换运行级别、重启系统和关闭系统的功能：

- systemctl isolate graphical.target - 切换到运行级别5，就是有桌面的运行级别
- systemctl isolate multi-user.target - 切换到运行级别3，没有桌面的运行级别
- systemctl reboot - 重启系统
- systemctl poweroff - 关机

所有命令，包括切换到其他运行级别的命令，都可以在普通用户的权限下执行。

### journalctl 的基本用法 ###

systemd 不仅提供了比 sysvinit 更快的启动速度，还让日志系统在更早的时候启动起来，可以记录内核初始化阶段、内存初始化阶段、前期启动步骤以及主要的系统执行过程的日志。所以，**以前那种需要通过对显示屏拍照或者暂停系统来调试程序的日子已经一去不复返啦**。

systemd 的日志文件都被放在 /var/log 目录。如果你想使用它的日志功能，需要执行一些命令，因为 Debian 没有打开日志功能。命令如下：

    # addgroup --system systemd-journal
    # mkdir -p /var/log/journal
    # chown root:systemd-journal /var/log/journal
    # gpasswd -a $user systemd-journal 

通过上面的设置，你就可以以普通用户权限使用 journal 软件查看日志。使用 journalctl 查询日志可以获得一些比 syslog 软件更方便的玩法：

- journalctl --all - 显示系统上所有日志，以及它的用户
- journalctl -f - 监视系统日志的变化（类似 tail -f /var/log/messages 的效果）
- journalctl -b - 显示系统启动以后的日志
- journalctl -k -b -1 - 显示上一次（-b -1）系统启动前产生的内核日志
- journalctl -b -p err - 显示系统启动后产生的“ERROR”日志
- journalctl --since=yesterday - 当系统不会经常重启的时候，这条命令能提供比 -b 更短的日志记录
- journalctl -u cron.service --since='2014-07-06 07:00' --until='2014-07-06 08:23' - 显示 cron 服务在某个时间段内打印出来的日志
- journalctl -p 2 --since=today - 显示优先级别为2以内的日志，包含 emerg、alert、crit三个级别。所有日志级别有： emerg (0), alert (1), crit (2), err (3), warning (4), notice (5), info (6), debug (7)
- journalctl > yourlog.log - 将二进制日志文件复制成文本文件并保存到当前目录

Journal 和 syslog 可以很好的共存。而另一方面，一旦你习惯了操作 journal，你也可以卸载掉所有 syslog 的软件，比如 rsyslog 或 syslog-ng。

如果想要得到更详细的日志信息，你可以在内核启动参数上添加“systemd.log_level=debug”，然后运行下面的命令：

    # journalctl -alb 

你也可以编辑 /etc/systemd/system.conf 文件来修改日志级别。

### 利用 systemd 分析系统启动过程 ###

systemd 可以让你能更有效地分析和优化你的系统启动过程：

- systemd-analyze - 显示本次启动系统过程中用户态和内核态所花的时间
- systemd-analyze blame - 显示每个启动项所花费的时间明细
- systemd-analyze critical-chain - 按时间顺序打印 UNIT 树
- systemd-analyze dot | dot -Tsvg > systemd.svg - 为开机启动过程生成向量图（需要安装 graphviz 软件包）
- systemd-analyze plot > bootplot.svg - 产生开机启动过程的时间图表

![](https://farm6.staticflickr.com/5559/14607588994_38543638b3_z.jpg)

![](https://farm6.staticflickr.com/5565/14423020978_14b21402c8_z.jpg)

systemd 虽然是个年轻的项目，但已有大量文档。首先要介绍给你的是[Lennart Poettering 的 0pointer 系列][3]。这个系列非常详细，非常有技术含量。另外一个是[免费桌面信息文档][4]，它包含了最详细的关于 systemd 的链接：发行版特性文件、bug 跟踪系统和说明文档。你可以使用下面的命令来查询 systemd 都提供了哪些文档：

    # man systemd.index 

不同发行版之间的 systemd 提供的命令基本一样，最大的不同之处就是打包方式。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/07/use-systemd-system-administration-debian.html

译者：[bazz2](https://github.com/bazz2) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://lists.debian.org/debian-devel/2013/10/msg00444.html
[2]:https://lists.debian.org/debian-devel/2014/02/msg00316.html
[3]:http://0pointer.de/blog/projects/systemd.html
[4]:http://www.freedesktop.org/wiki/Software/systemd/
