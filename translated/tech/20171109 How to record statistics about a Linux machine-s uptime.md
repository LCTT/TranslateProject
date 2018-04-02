如何记录有关 Linux 机器正常运行时间的统计信息
=====

Linux/Unix 系统管理员对服务器正常运行时间有一种奇怪的痴迷。这有一个关于这个主题的 xkcd 漫画，一个好的系统管理员是一股不可阻挡的力量，它站在黑暗势力和你的猫博客服务器之间。（这句话实在理解不了。）

[![Fig.01: Devotion to Duty https://xkcd.com/705/][1]][1]

我们可以使用 uptime 命令或 [w 命令][2] 或 top 命令来判断 Linux 系统运行了多久。我可以[获得系统的历史和统计运行时间的报告][3]，使用 tuptime 工具将其保持在重新启动之间。

就像 uptime 命令一样，但输出结果更令人印象深刻。最近我发现了另一种称为 uptimed 的工具，用于记录关于机器正常运行时间和统计信息。让我们看看如何使用 Linux 操作系统上的 uptimed 和 uprecords 来获得正常运行时间的记录统计信息。

查找正常运行时间非常简单，只需在基于 Linux 的系统上键入以下命令即可：
```
$ **uptime -p**
up 2 weeks, 4 days, 7 hours, 28 minutes
```

要保留有关 uptime 的历史统计信息，请使用 [tuptime][3] 或 uptime 工具。

## 安装 uptimed

安装 uptimed 的最简单的方式是通过你的软件包管理器，比如 apt/apt-get/yum，这些你的 Linux 发行版的朋友。

### 在 Debian/Ubuntu Linux 上安装 uptimed

键入以下 [apt 命令][4]/[apt-get 命令][5]:
`$ sudo apt-get install uptimed`
示例输出：
```
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libuptimed0
The following NEW packages will be installed:
  libuptimed0 uptimed
0 upgraded, 2 newly installed, 0 to remove and 3 not upgraded.
Need to get 40.7 kB of archives.
After this operation, 228 kB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://mirrors.linode.com/ubuntu xenial/universe amd64 libuptimed0 amd64 1:0.3.17-4 [9,050 B]
Get:2 http://mirrors.linode.com/ubuntu xenial/universe amd64 uptimed amd64 1:0.3.17-4 [31.6 kB]
Fetched 40.7 kB in 0s (2,738 kB/s)  
Preconfiguring packages ...
Selecting previously unselected package libuptimed0.
(Reading database ... 39163 files and directories currently installed.)
Preparing to unpack .../libuptimed0_1%3a0.3.17-4_amd64.deb ...
Unpacking libuptimed0 (1:0.3.17-4) ...
Selecting previously unselected package uptimed.
Preparing to unpack .../uptimed_1%3a0.3.17-4_amd64.deb ...
Unpacking uptimed (1:0.3.17-4) ...
Processing triggers for systemd (229-4ubuntu21) ...
Processing triggers for ureadahead (0.100.0-19) ...
Processing triggers for man-db (2.7.5-1) ...
Setting up libuptimed0 (1:0.3.17-4) ...
Setting up uptimed (1:0.3.17-4) ...
Processing triggers for libc-bin (2.23-0ubuntu9) ...
Processing triggers for systemd (229-4ubuntu21) ...
Processing triggers for ureadahead (0.100.0-19) ...
```

### 在 CentOS/RHEL/Fedora/Oracle/Scientific Linux 上安装 uptimed

首先 [在 CentOS/RHEL 使用 EPEL repo][6]:
`$ sudo yum -y install epel-release`
然后，键入以下 [yum 命令][7]:
`$ sudo yum install uptimed`
示例输出：
```
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: centos.excellmedia.net
 * epel: ftp.cuhk.edu.hk
 * extras: centos.excellmedia.net
 * updates: centos.excellmedia.net
Resolving Dependencies
--> Running transaction check
---> Package uptimed.x86_64 0:0.4.0-6.el7 will be installed
--> Finished Dependency Resolution
 
Dependencies Resolved
 
===============================================================================
 Package           Arch             Version               Repository      Size
===============================================================================
Installing:
 uptimed           x86_64           0.4.0-6.el7           epel            47 k
 
Transaction Summary
===============================================================================
Install  1 Package
 
Total download size: 47 k
Installed size: 98 k
Is this ok [y/d/N]: y
Downloading packages:
uptimed-0.4.0-6.el7.x86_64.rpm                            |  47 kB   00:01     
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : uptimed-0.4.0-6.el7.x86_64                                  1/1 
  Verifying  : uptimed-0.4.0-6.el7.x86_64                                  1/1 
 
Installed:
  uptimed.x86_64 0:0.4.0-6.el7                                                 
 
Complete!
```

如果你正在使用 **Fedora Linux**，运行以下 dnf 命令：
`$ sudo dnf install uptimed`

### 在 Arch Linux 上安装 uptimed

键入以下 pacman 命令：
`$ sudo pacman -S uptimed`

### 在 Gentoo Linux 上安装 uptimed

键入以下 emerge 命令：
`$ sudo emerge --ask uptimed`

## 如何配置 uptimed

使用文本编辑器编辑 /etc/uptimed.conf 文件，例如 vim 命令：
`$ sudo vim /etc/uptimed.conf`
最少设置一个 email 地址来发送记录。假定发送邮件兼容 MTA。
```
EMAIL=vivek@server1.cyberciti.biz
```
保存并关闭文件。

### 如何在系统启动时启动 uptimed 服务？

使用 systemctl 命令启动 uptimed 服务：
`$ sudo systemctl enable uptimed`

### 我该如何 启动/停止/重启 或者查看 uptimed 服务的状态？

```
$ sudo systemctl start uptimed ## start it ##
$ sudo systemctl stop uptimed ## stop it ##
$ sudo systemctl restart uptimed ## restart it ##
$ sudo systemctl status uptimed ## view status ##
```
示例输出：
```
● uptimed.service - uptime record daemon
   Loaded: loaded (/lib/systemd/system/uptimed.service; enabled; vendor preset: enabled)
   Active: active (running) since Thu 2017-11-09 17:49:14 UTC; 18min ago
 Main PID: 11137 (uptimed)
   CGroup: /system.slice/uptimed.service
           └─11137 /usr/sbin/uptimed -f
 
Nov 09 17:49:14 gfs04 systemd[1]: Started uptime record daemon.
```

## 如何查看 uptime 记录

只需键入以下命令即可查看 uptimed(8) 程序的统计信息：
```
$ uprecords
```

示例输出：
[![Fig.02: uprecords in action][9]][9]

uprecords 有一些选项：
```
$ uprecords -?
```
示例输出：
```
usage: uprecords [OPTION]...
 
  -?             this help
  -a             do not print ansi codes
  -b             sort by boottime
  -B             reverse sort by boottime
  -k             sort by sysinfo
  -K             reverse sort by sysinfo
  -d             print downtime seen before every uptimes instead of system
  -c             do not show current entry if not in top entries
  -f             run continously in a loop
  -s             do not print extra statistics
  -w             wide output (more than 80 cols per line)
  -i INTERVAL    use INTERVAL seconds for loop instead of 5, implies -f
  -m COUNT       show a maximum of top COUNT entries instead of 10
  -M             show next milestone
  -v             version information
```

## 结论

这是一个极好的小工具，可以显示服务器正常运行时间的记录，以证明机器正常运行时间和你的业务连续性。在相关说明中，你将获得官方的 [XKCD 系统管理员 T恤][10] 因为漫画被制作成衬衫，其中包括背面的新插图。

[![Fig.03: Sysadmin XKCD shirt features the original comic on the front and a new illustration on the back.][11]][11]

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/hardware/see-records-statistics-about-a-linux-servers-uptime/

作者：[][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/media/new/cms/2017/11/devotion_to_duty.png
[2]:https://www.cyberciti.biz//www.cyberciti.biz/faq/unix-linux-w-command-examples-syntax-usage-2/ (See Linux/Unix w command examples for more info)
[3]:https://www.cyberciti.biz/hardware/howto-see-historical-statistical-uptime-on-linux-server/
[4]:https://www.cyberciti.biz//www.cyberciti.biz/faq/ubuntu-lts-debian-linux-apt-command-examples/ (See Linux/Unix apt command examples for more info)
[5]:https://www.cyberciti.biz//www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html (See Linux/Unix apt-get command examples for more info)
[6]:https://www.cyberciti.biz/faq/installing-rhel-epel-repo-on-centos-redhat-7-x/
[7]:https://www.cyberciti.biz//www.cyberciti.biz/faq/rhel-centos-fedora-linux-yum-command-howto/ (See Linux/Unix yum command examples for more info)
[8]:https://www.cyberciti.biz/cdn-cgi/l/email-protection
[9]:https://www.cyberciti.biz/media/new/cms/2017/11/uprecord-screenshot.jpg
[10]:https://store.xkcd.com/collections/apparel/products/sysadmin
[11]:https://www.cyberciti.biz/media/new/cms/2017/11/sysadmin_shirt_5_1024x1024.jpg
