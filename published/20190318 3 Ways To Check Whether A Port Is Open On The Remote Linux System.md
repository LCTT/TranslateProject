[#]: collector: "lujun9972"
[#]: translator: "FSSlc"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-10675-1.html"
[#]: subject: "3 Ways To Check Whether A Port Is Open On The Remote Linux System?"
[#]: via: "https://www.2daygeek.com/how-to-check-whether-a-port-is-open-on-the-remote-linux-system-server/"
[#]: author: "Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/"

查看远程 Linux 系统中某个端口是否开启的 3 种方法
======

这是一个很重要的话题，不仅对 Linux 管理员而言，对于我们大家而言也非常有帮助。我的意思是说对于工作在 IT 基础设施行业的用户来说，了解这个话题也是非常有用的。他们需要在执行下一步操作前，检查 Linux 服务器上某个端口是否开启。

假如这个端口没有被开启，则他们会直接找 Linux 管理员去开启它。如果这个端口已经开启了，则我们需要和应用团队来商量下一步要做的事。

在本篇文章中，我们将向你展示如何检查某个端口是否开启的 3 种方法。

这个目标可以使用下面的 Linux 命令来达成：

  * `nc`：netcat 是一个简单的 Unix 工具，它使用 TCP 或 UDP 协议去读写网络连接间的数据。
  * `nmap`：（“Network Mapper”）是一个用于网络探索和安全审计的开源工具，被设计用来快速地扫描大规模网络。
  * `telnet`：被用来交互地通过 TELNET 协议与另一台主机通信。

### 如何使用 nc（netcat）命令来查看远程 Linux 系统中某个端口是否开启？

`nc` 即 `netcat`。`netcat` 是一个简单的 Unix 工具，它使用 TCP 或 UDP 协议去读写网络连接间的数据。

它被设计成为一个可信赖的后端工具，可被直接使用或者简单地被其他程序或脚本调用。

与此同时，它也是一个富含功能的网络调试和探索工具，因为它可以创建你所需的几乎所有类型的连接，并且还拥有几个内置的有趣功能。

`netcat` 有三类功能模式，它们分别为连接模式、监听模式和隧道模式。

`nc`（`netcat`）命令的一般语法：

```
$ nc [-options] [HostName or IP] [PortNumber]
```

在下面的例子中，我们将检查远程 Linux 系统中的 22 端口是否开启。

假如端口是开启的，你将获得类似下面的输出。

```
# nc -zvw3 192.168.1.8 22
Connection to 192.168.1.8 22 port [tcp/ssh] succeeded!
```

命令详解：

  * `nc`：即执行的命令主体；
  * `z`：零 I/O 模式（被用来扫描）；
  * `v`：显式地输出；
  * `w3`：设置超时时间为 3 秒；
  * `192.168.1.8`：目标系统的 IP 地址；
  * `22`：需要验证的端口。

当检测到端口没有开启，你将获得如下输出：

```
# nc -zvw3 192.168.1.95 22
nc: connect to 192.168.1.95 port 22 (tcp) failed: Connection refused
```

### 如何使用 nmap 命令来查看远程 Linux 系统中某个端口是否开启？

`nmap`（“Network Mapper”）是一个用于网络探索和安全审计的开源工具，被设计用来快速地扫描大规模网络，尽管对于单个主机它也同样能够正常工作。

`nmap` 以一种新颖的方式，使用裸 IP 包来决定网络中的主机是否可达，这些主机正提供什么服务（应用名和版本号），它们运行的操作系统（系统的版本），它们正在使用的是什么包过滤软件或者防火墙，以及其他额外的特性。

尽管 `nmap` 通常被用于安全审计，许多系统和网络管理员发现在一些日常任务（例如罗列网络资产、管理服务升级的计划、监视主机或者服务是否正常运行）中，它也同样十分有用。

`nmap` 的一般语法：

```
$ nmap [-options] [HostName or IP] [-p] [PortNumber]
```

假如端口是开启的，你将获得如下的输出：

```
# nmap 192.168.1.8 -p 22

Starting Nmap 7.70 ( https://nmap.org ) at 2019-03-16 03:37 IST Nmap scan report for 192.168.1.8 Host is up (0.00031s latency).

PORT STATE SERVICE

22/tcp open ssh 

Nmap done: 1 IP address (1 host up) scanned in 13.06 seconds
```

假如端口没有开启，你将得到类似下面的结果：

```
# nmap 192.168.1.8 -p 80
Starting Nmap 7.70 ( https://nmap.org ) at 2019-03-16 04:30 IST
Nmap scan report for 192.168.1.8
Host is up (0.00036s latency).

PORT   STATE  SERVICE
80/tcp closed http

Nmap done: 1 IP address (1 host up) scanned in 13.07 seconds
```

###  如何使用 telnet 命令来查看远程 Linux 系统中某个端口是否开启？

`telnet` 命令被用来交互地通过 TELNET 协议与另一台主机通信。

`telnet` 命令的一般语法：

```
$ telnet [HostName or IP] [PortNumber]
```

假如探测成功，你将看到类似下面的输出：

```
$ telnet 192.168.1.9 22
Trying 192.168.1.9...
Connected to 192.168.1.9.
Escape character is '^]'.
SSH-2.0-OpenSSH_5.3
^]
Connection closed by foreign host.
```

假如探测失败，你将看到类似下面的输出：

```
$ telnet 192.168.1.9 80
Trying 192.168.1.9...
telnet: Unable to connect to remote host: Connection refused
```

当前，我们只找到上面 3 种方法来查看远程 Linux 系统中某个端口是否开启，假如你发现了其他方法可以达到相同的目的，请在下面的评论框中告知我们。

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-check-whether-a-port-is-open-on-the-remote-linux-system-server/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
