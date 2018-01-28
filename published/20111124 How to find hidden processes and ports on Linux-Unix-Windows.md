如何在 Linux/Unix/Windows 中发现隐藏的进程和端口
==============

`unhide` 是一个小巧的网络取证工具，能够发现那些借助 rootkit、LKM 及其它技术隐藏的进程和 TCP/UDP 端口。这个工具在 Linux、UNIX 类、MS-Windows 等操作系统下都可以工作。根据其 man 页面的说明：

> Unhide 通过下述三项技术来发现隐藏的进程。
> 	1. 进程相关的技术，包括将 `/proc` 目录与 [/bin/ps][1] 命令的输出进行比较。
> 	2. 系统相关的技术，包括将 [/bin/ps][1] 命令的输出结果同从系统调用方面得到的信息进行比较。
> 	3. 穷举法相关的技术，包括对所有的进程 ID 进行暴力求解，该技术仅限于在基于 Linux2.6 内核的系统中使用。

绝大多数的 Rootkit 工具或者恶意软件借助内核来实现进程隐藏，这些进程只在内核内部可见。你可以使用 `unhide` 或者诸如 [rkhunter 等工具，扫描 rootkit 程序 、后门程序以及一些可能存在的本地漏洞][2]。

![本文讲解如何在多个操作系统下安装和使用unhide][3]

这篇文章描述了如何安装 unhide 并搜索隐藏的进程和 TCP/UDP 端口。

### 如何安装 unhide

首先建议你在只读介质上运行这个工具。如果使用的是 Ubuntu 或者 Debian 发行版，输入下述的 [apt-get][4]/[apt][5] 命令以安装 Unhide：

```
$ sudo apt-get install unhide
```

一切顺利的话你的命令行会输出以下内容：

```
[sudo] password for vivek: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
Suggested packages:
  rkhunter
The following NEW packages will be installed:
  unhide
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 46.6 kB of archives.
After this operation, 136 kB of additional disk space will be used.
Get:1 http://in.archive.ubuntu.com/ubuntu artful/universe amd64 unhide amd64 20130526-1 [46.6 kB]
Fetched 46.6 kB in 0s (49.0 kB/s)
Selecting previously unselected package unhide.
(Reading database ... 205367 files and directories currently installed.)
Preparing to unpack .../unhide_20130526-1_amd64.deb ...
Unpacking unhide (20130526-1) ...
Setting up unhide (20130526-1) ...
Processing triggers for man-db (2.7.6.1-2) ...
```

### 如何在 RHEL/CentOS/Oracle/Scientific/Fedora 上安装 unhide

输入下列 yum Type the following yum command (first turn on EPLE repo on a CentOS/RHEL version 6.x or version 7.x):

输入以下的 [yum][6] 命令（CentOS/RHEL [6.x][7] 或 [7.x][8] 上首先打开 EPEL 仓库）：

```
$ sudo yum install unhide
``` 

在 Fedora 上则使用以下 dnf 命令：

```
$ sudo dnf install unhide
```

### 如何在 Arch 上安装 unhide

键入以下 pacman 命令安装：

```
$ sudo pacman -S unhide
```

### 如何在 FreeBSD 上安装 unhide

可以通过以下的命令使用 port 来安装 unhide：

```
# cd /usr/ports/security/unhide/
# make install clean
```

或者可以通过二进制文件安装 hide，使用 pkg 命令安装：

```
# pkg install unhide
```

### 如何使用 unhide 工具？

unhide 的语法是：

```
unhide [options] test_list
```

`test_list` 参数可以是以下测试列表中的一个或者多个标准测试：
	

1. brute 
2. proc
3. procall
4. procfs
5. quick
6. reverse
7. sys

或基本测试：

1. checkbrute
2. checkchdir
3. checkgetaffinity
4. checkgetparam
5. checkgetpgid
6. checkgetprio
7. checkRRgetinterval
8. checkgetsched
9. checkgetsid
10. checkkill
11. checknoprocps
12. checkopendir
13. checkproc
14. checkquick
15. checkreaddir
16. checkreverse
17. checksysinfo
18. checksysinfo2
19. checksysinfo3

你可以通过以下示例命令使用 `unhide`：

```
# unhide proc
# unhide sys
# unhide quick
```

示例输出：

```
Unhide 20130526
Copyright © 2013 Yago Jesus & Patrick Gouin
License GPLv3+ : GNU GPL version 3 or later
http://www.unhide-forensics.info
 
NOTE : This version of unhide is for systems using Linux >= 2.6 
 
Used options: 
[*]Searching for Hidden processes through  comparison of results of system calls, proc, dir and ps
```

### 如何使用 unhide-tcp 工具辨明 TCP/UDP 端口的身份

以下是来自 man 页面的介绍：

> `unhide-tcp` 取证工具通过对所有可用的 TCP/IP 端口进行暴力求解的方式，辨别所有正在监听，却没有列入 [/bin/netstat][9] 或者 [/bin/ss][10] 命令输出的 TCP/IP 端口身份。

> 注一：对于 FreeBSD、OpenBSD系统，一般使用 netstat 命令取代在这些操作系统上不存在的 iproute2，此外，sockstat 命令也用于替代 fuser。

> 注二：如果操作系统不支持 iproute2 命令，在使用 `unhide` 时需要在命令上加上 `-n` 或者 `-s` 选项。

```
# unhide-tcp
```

示例输出：

```
Unhide 20100201
http://www.security-projects.com/?Unhide

Starting TCP checking

Starting UDP checking
```

上述操作中，没有发现隐藏的端口。

但在下述示例中，我展示了一些有趣的事。

```
# unhide-tcp
``` 

示例输出：

```
Unhide 20100201
http://www.security-projects.com/?Unhide


Starting TCP checking

Found Hidden port that not appears in netstat: 1048
Found Hidden port that not appears in netstat: 1049
Found Hidden port that not appears in netstat: 1050
Starting UDP checking
```

可以看到 `netstat -tulpn` 和 `ss` 命令确实没有反映出这三个隐藏的端口：

```
# netstat -tulpn | grep 1048
# ss -lp
# ss -l | grep 1048
```

通过下述的 man 命令可以更多地了解 `unhide`：

```
$ man unhide
$ man unhide-tcp
```

### Windows 用户如何安装使用 unhide

你可以通过这个[页面][13]获取 Windows 版本的 unhide。

----

via: https://www.cyberciti.biz/tips/linux-unix-windows-find-hidden-processes-tcp-udp-ports.html

作者：[Vivek Gite][a]
译者：[ljgibbslf](https://github.com/ljgibbslf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/faq/show-all-running-processes-in-linux/ (Linux / Unix ps command)
[2]:https://www.cyberciti.biz/faq/howto-check-linux-rootkist-with-detectors-software/
[3]:https://www.cyberciti.biz/tips/wp-content/uploads/2011/11/Linux-FreeBSD-Unix-Windows-Find-Hidden-Process-Ports.jpg
[4]:https://www.cyberciti.biz/tips/linux-debian-package-management-cheat-sheet.html (See Linux/Unix apt-get command examples for more info)
[5]://www.cyberciti.biz/faq/ubuntu-lts-debian-linux-apt-command-examples/ (See Linux/Unix apt command examples for more info)
[6]:https://www.cyberciti.biz/faq/rhel-centos-fedora-linux-yum-command-howto/ (See Linux/Unix yum command examples for more info)
[7]:https://www.cyberciti.biz/faq/fedora-sl-centos-redhat6-enable-epel-repo/
[8]:https://www.cyberciti.biz/faq/installing-rhel-epel-repo-on-centos-redhat-7-x/
[9]:https://www.cyberciti.biz/tips/linux-display-open-ports-owner.html (Linux netstat command)
[10]:https://www.cyberciti.biz/tips/linux-investigate-sockets-network-connections.html
[11]:https://www.cyberciti.biz/tips/netstat-command-tutorial-examples.html
[12]:https://www.cyberciti.biz/tips/linux-investigate-sockets-network-connections.html
[13]:http://www.unhide-forensics.info/?Windows:Download
