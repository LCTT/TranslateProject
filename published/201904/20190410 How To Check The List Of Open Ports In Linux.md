[#]: collector: (lujun9972)
[#]: translator: (heguangzhi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10736-1.html)
[#]: subject: (How To Check The List Of Open Ports In Linux?)
[#]: via: (https://www.2daygeek.com/linux-scan-check-open-ports-using-netstat-ss-nmap/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

如何检查 Linux 中的开放端口列表？
======

最近，我们就同一主题写了两篇文章。这些文章内容帮助你如何检查远程服务器中给定的端口是否打开。

如果你想 [检查远程 Linux 系统上的端口是否打开][1] 请点击链接浏览。如果你想 [检查多个远程 Linux 系统上的端口是否打开][2] 请点击链接浏览。如果你想 [检查多个远程 Linux 系统上的多个端口状态][2] 请点击链接浏览。

但是本文帮助你检查本地系统上的开放端口列表。

在 Linux 中很少有用于此目的的实用程序。然而，我提供了四个最重要的 Linux 命令来检查这一点。

你可以使用以下四个命令来完成这个工作。这些命令是非常出名的并被 Linux 管理员广泛使用。

  * `netstat`：netstat (“network statistics”) 是一个显示网络连接（进和出）相关信息命令行工具，例如：路由表, 伪装连接,多点传送成员和网络端口。
  * `nmap`：Nmap (“Network Mapper”) 是一个网络探索与安全审计的开源工具。它旨在快速扫描大型网络。
  * `ss`： ss 被用于转储套接字统计信息。它也可以类似 netstat 使用。相比其他工具它可以展示更多的TCP状态信息。
  * `lsof`： lsof 是 List Open File 的缩写. 它用于输出被某个进程打开的所有文件。

### 如何使用 Linux 命令 netstat 检查系统中的开放端口列表

`netstat` 是 Network Statistics 的缩写，是一个显示网络连接（进和出）相关信息命令行工具，例如：路由表、伪装连接、多播成员和网络端口。

它可以列出所有的 tcp、udp 连接和所有的 unix 套接字连接。

它用于发现发现网络问题，确定网络连接数量。

```
# netstat -tplugn

Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 0.0.0.0:25              0.0.0.0:*               LISTEN      2038/master
tcp        0      0 127.0.0.1:199           0.0.0.0:*               LISTEN      1396/snmpd
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      1398/httpd
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      1388/sshd
tcp6       0      0 :::25                   :::*                    LISTEN      2038/master
tcp6       0      0 :::22                   :::*                    LISTEN      1388/sshd
udp        0      0 0.0.0.0:39136           0.0.0.0:*                           1396/snmpd
udp        0      0 0.0.0.0:56130           0.0.0.0:*                           1396/snmpd
udp        0      0 0.0.0.0:40105           0.0.0.0:*                           1396/snmpd
udp        0      0 0.0.0.0:11584           0.0.0.0:*                           1396/snmpd
udp        0      0 0.0.0.0:30105           0.0.0.0:*                           1396/snmpd
udp        0      0 0.0.0.0:50656           0.0.0.0:*                           1396/snmpd
udp        0      0 0.0.0.0:1632            0.0.0.0:*                           1396/snmpd
udp        0      0 0.0.0.0:28265           0.0.0.0:*                           1396/snmpd
udp        0      0 0.0.0.0:40764           0.0.0.0:*                           1396/snmpd
udp        0      0 10.90.56.21:123         0.0.0.0:*                           895/ntpd
udp        0      0 127.0.0.1:123           0.0.0.0:*                           895/ntpd
udp        0      0 0.0.0.0:123             0.0.0.0:*                           895/ntpd
udp        0      0 0.0.0.0:53390           0.0.0.0:*                           1396/snmpd
udp        0      0 0.0.0.0:161             0.0.0.0:*                           1396/snmpd
udp6       0      0 :::123                  :::*                                895/ntpd

IPv6/IPv4 Group Memberships
Interface       RefCnt Group
--------------- ------ ---------------------
lo              1      224.0.0.1
eth0            1      224.0.0.1
lo              1      ff02::1
lo              1      ff01::1
eth0            1      ff02::1
eth0            1      ff01::1
```

你也可以使用下面的命令检查特定的端口。

```
# # netstat -tplugn | grep :22

tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      1388/sshd
tcp6       0      0 :::22                   :::*                    LISTEN      1388/sshd
```

### 如何使用 Linux 命令 ss 检查系统中的开放端口列表？

`ss` 被用于转储套接字统计信息。它也可以显示类似 `netstat` 的信息。相比其他工具它可以展示更多的 TCP 状态信息。

```
# ss -lntu

Netid  State      Recv-Q Send-Q                     Local Address:Port                                    Peer Address:Port
udp    UNCONN     0      0                                      *:39136                                              *:*
udp    UNCONN     0      0                                      *:56130                                              *:*
udp    UNCONN     0      0                                      *:40105                                              *:*
udp    UNCONN     0      0                                      *:11584                                              *:*
udp    UNCONN     0      0                                      *:30105                                              *:*
udp    UNCONN     0      0                                      *:50656                                              *:*
udp    UNCONN     0      0                                      *:1632                                               *:*
udp    UNCONN     0      0                                      *:28265                                              *:*
udp    UNCONN     0      0                                      *:40764                                              *:*
udp    UNCONN     0      0                            10.90.56.21:123                                                *:*
udp    UNCONN     0      0                              127.0.0.1:123                                                *:*
udp    UNCONN     0      0                                      *:123                                                *:*
udp    UNCONN     0      0                                      *:53390                                              *:*
udp    UNCONN     0      0                                      *:161                                                *:*
udp    UNCONN     0      0                                     :::123                                               :::*
tcp    LISTEN     0      100                                    *:25                                                 *:*
tcp    LISTEN     0      128                            127.0.0.1:199                                                *:*
tcp    LISTEN     0      128                                    *:80                                                 *:*
tcp    LISTEN     0      128                                    *:22                                                 *:*
tcp    LISTEN     0      100                                   :::25                                                :::*
tcp    LISTEN     0      128                                   :::22                                                :::*
```

你也可以使用下面的命令检查特定的端口。

```
# # ss -lntu | grep ':25'

tcp    LISTEN     0      100       *:25                    *:*
tcp    LISTEN     0      100      :::25                   :::*
```

### 如何使用 Linux 命令 nmap 检查系统中的开放端口列表？

Nmap (“Network Mapper”) 是一个网络探索与安全审计的开源工具。它旨在快速扫描大型网络，当然它也可以工作在独立主机上。

Nmap 使用裸 IP 数据包以一种新颖的方式来确定网络上有哪些主机可用，这些主机提供什么服务（应用程序名称和版本），它们运行什么操作系统（版本），使用什么类型的数据包过滤器/防火墙，以及许多其他特征。

虽然 Nmap 通常用于安全审计，但许多系统和网络管理员发现它对于日常工作也非常有用，例如网络资产清点、管理服务升级计划以及监控主机或服务正常运行时间。

```
# nmap -sTU -O localhost

Starting Nmap 6.40 ( http://nmap.org ) at 2019-03-20 09:57 CDT
Nmap scan report for localhost (127.0.0.1)
Host is up (0.00028s latency).
Other addresses for localhost (not scanned): 127.0.0.1
Not shown: 1994 closed ports

PORT    STATE SERVICE
22/tcp  open  ssh
25/tcp  open  smtp
80/tcp  open  http
199/tcp open  smux
123/udp open  ntp
161/udp open  snmp

Device type: general purpose
Running: Linux 3.X
OS CPE: cpe:/o:linux:linux_kernel:3
OS details: Linux 3.7 - 3.9
Network Distance: 0 hops

OS detection performed. Please report any incorrect results at http://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 1.93 seconds
```

你也可以使用下面的命令检查特定的端口。

```
# nmap -sTU -O localhost | grep 123

123/udp open  ntp
```

### 如何使用 Linux 命令 lsof 检查系统中的开放端口列表？

它向你显示系统上打开的文件列表以及打开它们的进程。还会向你显示与文件相关的其他信息。

```
# lsof -i

COMMAND   PID   USER   FD   TYPE  DEVICE SIZE/OFF NODE NAME
ntpd      895    ntp   16u  IPv4   18481      0t0  UDP *:ntp
ntpd      895    ntp   17u  IPv6   18482      0t0  UDP *:ntp
ntpd      895    ntp   18u  IPv4   18487      0t0  UDP localhost:ntp
ntpd      895    ntp   20u  IPv4   23020      0t0  UDP CentOS7.2daygeek.com:ntp
sshd     1388   root    3u  IPv4   20065      0t0  TCP *:ssh (LISTEN)
sshd     1388   root    4u  IPv6   20067      0t0  TCP *:ssh (LISTEN)
snmpd    1396   root    6u  IPv4   22739      0t0  UDP *:snmp
snmpd    1396   root    7u  IPv4   22729      0t0  UDP *:40105
snmpd    1396   root    8u  IPv4   22730      0t0  UDP *:50656
snmpd    1396   root    9u  IPv4   22731      0t0  UDP *:pammratc
snmpd    1396   root   10u  IPv4   22732      0t0  UDP *:30105
snmpd    1396   root   11u  IPv4   22733      0t0  UDP *:40764
snmpd    1396   root   12u  IPv4   22734      0t0  UDP *:53390
snmpd    1396   root   13u  IPv4   22735      0t0  UDP *:28265
snmpd    1396   root   14u  IPv4   22736      0t0  UDP *:11584
snmpd    1396   root   15u  IPv4   22737      0t0  UDP *:39136
snmpd    1396   root   16u  IPv4   22738      0t0  UDP *:56130
snmpd    1396   root   17u  IPv4   22740      0t0  TCP localhost:smux (LISTEN)
httpd    1398   root    3u  IPv4   20337      0t0  TCP *:http (LISTEN)
master   2038   root   13u  IPv4   21638      0t0  TCP *:smtp (LISTEN)
master   2038   root   14u  IPv6   21639      0t0  TCP *:smtp (LISTEN)
sshd     9052   root    3u  IPv4 1419955      0t0  TCP CentOS7.2daygeek.com:ssh->Ubuntu18-04.2daygeek.com:11408 (ESTABLISHED)
httpd   13371 apache    3u  IPv4   20337      0t0  TCP *:http (LISTEN)
httpd   13372 apache    3u  IPv4   20337      0t0  TCP *:http (LISTEN)
httpd   13373 apache    3u  IPv4   20337      0t0  TCP *:http (LISTEN)
httpd   13374 apache    3u  IPv4   20337      0t0  TCP *:http (LISTEN)
httpd   13375 apache    3u  IPv4   20337      0t0  TCP *:http (LISTEN)
```

你也可以使用下面的命令检查特定的端口。

```
# lsof -i:80

COMMAND   PID   USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
httpd    1398   root    3u  IPv4  20337      0t0  TCP *:http (LISTEN)
httpd   13371 apache    3u  IPv4  20337      0t0  TCP *:http (LISTEN)
httpd   13372 apache    3u  IPv4  20337      0t0  TCP *:http (LISTEN)
httpd   13373 apache    3u  IPv4  20337      0t0  TCP *:http (LISTEN)
httpd   13374 apache    3u  IPv4  20337      0t0  TCP *:http (LISTEN)
httpd   13375 apache    3u  IPv4  20337      0t0  TCP *:http (LISTEN)
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-scan-check-open-ports-using-netstat-ss-nmap/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[heguangzhi](https://github.com/heguangzhi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-10675-1.html
[2]: https://www.2daygeek.com/check-a-open-port-on-multiple-remote-linux-server-using-nc-command/
