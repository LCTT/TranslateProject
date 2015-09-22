使用tuptime工具查看Linux服务器系统历史开机时间统计
================================================================================
你们可以使用下面的工具来查看Linux或者类Unix系统运行了多长时间：
- uptime : 告诉你服务器运行了多长的时间。
- lastt : 显示重启和关机时间。
- tuptime : 报告系统的历史运行时间和统计运行时间，这是指重启之间的运行时间。和uptime命令类似，不过输出结果更有意思。

#### 找出系统上次重启时间和日期 ####

你[可以使用下面的命令来获取Linux操作系统的上次重启和关机时间及日期][1]（在OSX/类Unix系统上也可以用）：

    ## Just show  system reboot and shutdown date and time ###
    who -b
    last reboot
    last shutdown
    ## Uptime info ##
    uptime
    cat /proc/uptime
    awk '{ print "up " $1 /60 " minutes"}' /proc/uptime
    w
 
**样例输出：**

![Fig.01: Various Linux commands in action to find out the server uptime](http://s0.cyberciti.org/uploads/cms/2015/09/uptime-w-awk-outputs.jpg)

图像01：用于找出服务器开机时间的多个Linux命令

**跟tuptime问打个招呼吧**

tuptime命令行工具可以报告基于Linux的系统上的下列信息：
1. 系统启动次数统计
2. 注册首次启动时间（也就是安装时间）
1. 正常关机和意外关机统计
1. 平均开机时间和故障停机时间
1. 当前开机时间
1. 首次启动以来的开机和故障停机率
1. 累积系统开机时间、故障停机时间和合计
1. 报告每次启动、开机时间、关机和故障停机时间

#### 安装 ####

输入[下面的命令来克隆git仓库到Linux系统中][2]：

    $ cd /tmp
    $ git clone https://github.com/rfrail3/tuptime.git
    $ ls
    $ cd tuptime
    $ ls

**样例输出：**

![Fig.02: Cloning a git repo](http://s0.cyberciti.org/uploads/cms/2015/09/git-install-tuptime.jpg)

图像02：克隆git仓库

确保你随sys，optparse，os，re，string，sqlite3，datetime，disutils安装了Python v2.7和本地模块。

你可以像下面这样来安装：

    $ sudo tuptime-install.sh

或者，可以手工安装（根据基于systemd或非systemd的Linux的推荐方法）：

$ sudo cp /tmp/tuptime/latest/cron.d/tuptime /etc/cron.d/tuptime

如果系统是systemd的，拷贝服务文件并启用：

    $ sudo cp /tmp/tuptime/latest/systemd/tuptime.service /lib/systemd/system/
    $ sudo systemctl enable tuptime.service

如果系统不是systemd的，拷贝初始化文件：

    $ sudo cp /tmp/tuptime/latest/init.d/tuptime.init.d-debian7 /etc/init.d/tuptime
    $ sudo update-rc.d tuptime defaults

**运行**

只需输入以下命令：

    $ sudo tuptime

**样例输出：**

![Fig.03: tuptime in action](http://s0.cyberciti.org/uploads/cms/2015/09/tuptime-output.jpg)

图像03：tuptime工作中

在更新内核后，我重启了系统，然后再次输入了同样的命令：

    $ sudo tuptime
    System startups:	2   since   03:52:16 PM 08/21/2015
    System shutdowns:	1 ok   -   0 bad
    Average uptime: 	7 days, 16 hours, 48 minutes and 3 seconds
    Average downtime: 	2 hours, 30 minutes and 5 seconds
    Current uptime: 	5 minutes and 28 seconds   since   06:23:06 AM 09/06/2015
    Uptime rate: 		98.66 %
    Downtime rate: 		1.34 %
    System uptime: 		15 days, 9 hours, 36 minutes and 7 seconds
    System downtime: 	5 hours, 0 minutes and 11 seconds
    System life: 		15 days, 14 hours, 36 minutes and 18 seconds

你可以像下面这样修改日期和时间格式：

    $ sudo tuptime -d '%H:%M:%S %m-%d-%Y'

**样例输出：**

    System startups:	1   since   15:52:16 08-21-2015
    System shutdowns:	0 ok   -   0 bad
    Average uptime: 	15 days, 9 hours, 21 minutes and 19 seconds
    Average downtime: 	0 seconds
    Current uptime: 	15 days, 9 hours, 21 minutes and 19 seconds   since   15:52:16 08-21-2015
    Uptime rate: 		100.0 %
    Downtime rate: 		0.0 %
    System uptime: 		15 days, 9 hours, 21 minutes and 19 seconds
    System downtime: 	0 seconds
    System life: 		15 days, 9 hours, 21 minutes and 19 seconds

计算每次启动、开机时间、关机和故障停机时间：

    $ sudo tuptime -e

**样例输出：**

    Startup:  1  at  03:52:16 PM 08/21/2015
    Uptime:   15 days, 9 hours, 22 minutes and 33 seconds
     
    System startups:	1   since   03:52:16 PM 08/21/2015
    System shutdowns:	0 ok   -   0 bad
    Average uptime: 	15 days, 9 hours, 22 minutes and 33 seconds
    Average downtime: 	0 seconds
    Current uptime: 	15 days, 9 hours, 22 minutes and 33 seconds   since   03:52:16 PM 08/21/2015
    Uptime rate: 		100.0 %
    Downtime rate: 		0.0 %
    System uptime: 		15 days, 9 hours, 22 minutes and 33 seconds
    System downtime: 	0 seconds
    System life: 		15 days, 9 hours, 22 minutes and 33 seconds

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/hardware/howto-see-historical-statistical-uptime-on-linux-server/

作者：Vivek Gite
译者：[GOLinux](https://github.com/GOLinux)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:http://www.cyberciti.biz/hardware/howto-see-historical-statistical-uptime-on-linux-server/
[2]:http://www.cyberciti.biz/faq/debian-ubunut-linux-download-a-git-repository/
