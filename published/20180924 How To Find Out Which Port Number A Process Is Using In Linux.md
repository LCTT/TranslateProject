如何在 Linux 中查看进程占用的端口号
======

对于 Linux 系统管理员来说，清楚某个服务是否正确地绑定或监听某个端口，是至关重要的。如果你需要处理端口相关的问题，这篇文章可能会对你有用。

端口是 Linux 系统上特定进程之间逻辑连接的标识，包括物理端口和软件端口。由于 Linux 操作系统是一个软件，因此本文只讨论软件端口。软件端口始终与主机的 IP 地址和相关的通信协议相关联，因此端口常用于区分应用程序。大部分涉及到网络的服务都必须打开一个套接字来监听传入的网络请求，而每个服务都使用一个独立的套接字。

**推荐阅读：**

- [在 Linux 上查看进程 ID 的 4 种方法][1]
- [在 Linux 上终止进程的 3 种方法][2]

套接字是和 IP 地址、软件端口和协议结合起来使用的，而端口号对传输控制协议（TCP）和用户数据报协议（UDP）协议都适用，TCP 和 UDP 都可以使用 0 到 65535 之间的端口号进行通信。

以下是端口分配类别：

  * 0 - 1023： 常用端口和系统端口
  * 1024 - 49151： 软件的注册端口
  * 49152 - 65535： 动态端口或私有端口

在 Linux 上的 `/etc/services` 文件可以查看到更多关于保留端口的信息。

```
# less /etc/services
# /etc/services:
# $Id: services,v 1.55 2013/04/14 ovasik Exp $
#
# Network services, Internet style
# IANA services version: last updated 2013-04-10
#
# Note that it is presently the policy of IANA to assign a single well-known
# port number for both TCP and UDP; hence, most entries here have two entries
# even if the protocol doesn't support UDP operations.
# Updated from RFC 1700, ``Assigned Numbers'' (October 1994). Not all ports
# are included, only the more common ones.
#
# The latest IANA port assignments can be gotten from
# http://www.iana.org/assignments/port-numbers
# The Well Known Ports are those from 0 through 1023.
# The Registered Ports are those from 1024 through 49151
# The Dynamic and/or Private Ports are those from 49152 through 65535
#
# Each line describes one service, and is of the form:
#
# service-name port/protocol [aliases ...] [# comment]

tcpmux 1/tcp # TCP port service multiplexer
tcpmux 1/udp # TCP port service multiplexer
rje 5/tcp # Remote Job Entry
rje 5/udp # Remote Job Entry
echo 7/tcp
echo 7/udp
discard 9/tcp sink null
discard 9/udp sink null
systat 11/tcp users
systat 11/udp users
daytime 13/tcp
daytime 13/udp
qotd 17/tcp quote
qotd 17/udp quote
msp 18/tcp # message send protocol (historic)
msp 18/udp # message send protocol (historic)
chargen 19/tcp ttytst source
chargen 19/udp ttytst source
ftp-data 20/tcp
ftp-data 20/udp
# 21 is registered to ftp, but also used by fsp
ftp 21/tcp
ftp 21/udp fsp fspd
ssh 22/tcp # The Secure Shell (SSH) Protocol
ssh 22/udp # The Secure Shell (SSH) Protocol
telnet 23/tcp
telnet 23/udp
# 24 - private mail system
lmtp 24/tcp # LMTP Mail Delivery
lmtp 24/udp # LMTP Mail Delivery
```

可以使用以下六种方法查看端口信息。

  * `ss`：可以用于转储套接字统计信息。
  * `netstat`：可以显示打开的套接字列表。
  * `lsof`：可以列出打开的文件。
  * `fuser`：可以列出那些打开了文件的进程的进程 ID。
  * `nmap`：是网络检测工具和端口扫描程序。
  * `systemctl`：是 systemd 系统的控制管理器和服务管理器。

以下我们将找出 `sshd` 守护进程所使用的端口号。

### 方法 1：使用 ss 命令

`ss` 一般用于转储套接字统计信息。它能够输出类似于 `netstat` 输出的信息，但它可以比其它工具显示更多的 TCP 信息和状态信息。

它还可以显示所有类型的套接字统计信息，包括 PACKET、TCP、UDP、DCCP、RAW、Unix 域等。

```
# ss -tnlp | grep ssh
LISTEN 0 128 *:22 *:* users:(("sshd",pid=997,fd=3))
LISTEN 0 128 :::22 :::* users:(("sshd",pid=997,fd=4))
```

也可以使用端口号来检查。

```
# ss -tnlp | grep ":22"
LISTEN 0 128 *:22 *:* users:(("sshd",pid=997,fd=3))
LISTEN 0 128 :::22 :::* users:(("sshd",pid=997,fd=4))
```

### 方法 2：使用 netstat 命令

`netstat` 能够显示网络连接、路由表、接口统计信息、伪装连接以及多播成员。

默认情况下，`netstat` 会列出打开的套接字。如果不指定任何地址族，则会显示所有已配置地址族的活动套接字。但 `netstat` 已经过时了，一般会使用 `ss` 来替代。

```
# netstat -tnlp | grep ssh
tcp 0 0 0.0.0.0:22 0.0.0.0:* LISTEN 997/sshd
tcp6 0 0 :::22 :::* LISTEN 997/sshd
```

也可以使用端口号来检查。

```
# netstat -tnlp | grep ":22"
tcp 0 0 0.0.0.0:22 0.0.0.0:* LISTEN 1208/sshd
tcp6 0 0 :::22 :::* LISTEN 1208/sshd
```

### 方法 3：使用 lsof 命令

`lsof` 能够列出打开的文件，并列出系统上被进程打开的文件的相关信息。

```
# lsof -i -P | grep ssh
COMMAND PID USER FD TYPE DEVICE SIZE/OFF NODE NAME
sshd 11584 root 3u IPv4 27625 0t0 TCP *:22 (LISTEN)
sshd 11584 root 4u IPv6 27627 0t0 TCP *:22 (LISTEN)
sshd 11592 root 3u IPv4 27744 0t0 TCP vps.2daygeek.com:ssh->103.5.134.167:49902 (ESTABLISHED)
```

也可以使用端口号来检查。

```
# lsof -i tcp:22
COMMAND PID USER FD TYPE DEVICE SIZE/OFF NODE NAME
sshd 1208 root 3u IPv4 20919 0t0 TCP *:ssh (LISTEN)
sshd 1208 root 4u IPv6 20921 0t0 TCP *:ssh (LISTEN)
sshd 11592 root 3u IPv4 27744 0t0 TCP vps.2daygeek.com:ssh->103.5.134.167:49902 (ESTABLISHED)
```

### 方法 4：使用 fuser 命令

`fuser` 工具会将本地系统上打开了文件的进程的进程 ID 显示在标准输出中。

```
# fuser -v 22/tcp
 USER PID ACCESS COMMAND
22/tcp: root 1208 F.... sshd
 root 12388 F.... sshd
 root 49339 F.... sshd
```

### 方法 5：使用 nmap 命令

`nmap`（“Network Mapper”）是一款用于网络检测和安全审计的开源工具。它最初用于对大型网络进行快速扫描，但它对于单个主机的扫描也有很好的表现。

`nmap` 使用原始 IP 数据包来确定网络上可用的主机，这些主机的服务（包括应用程序名称和版本）、主机运行的操作系统（包括操作系统版本等信息）、正在使用的数据包过滤器或防火墙的类型，以及很多其它信息。

```
# nmap -sV -p 22 localhost

Starting Nmap 6.40 ( http://nmap.org ) at 2018-09-23 12:36 IST
Nmap scan report for localhost (127.0.0.1)
Host is up (0.000089s latency).
Other addresses for localhost (not scanned): 127.0.0.1
PORT STATE SERVICE VERSION
22/tcp open ssh OpenSSH 7.4 (protocol 2.0)

Service detection performed. Please report any incorrect results at http://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 0.44 seconds
```

### 方法 6：使用 systemctl 命令

`systemctl` 是 systemd 系统的控制管理器和服务管理器。它取代了旧的 SysV 初始化系统管理，目前大多数现代 Linux 操作系统都采用了 systemd。

**推荐阅读：**

- [chkservice – Linux 终端上的 systemd 单元管理工具][3]
- [如何查看 Linux 系统上正在运行的服务][4]

```
# systemctl status sshd
● sshd.service - OpenSSH server daemon
 Loaded: loaded (/usr/lib/systemd/system/sshd.service; enabled; vendor preset: enabled)
 Active: active (running) since Sun 2018-09-23 02:08:56 EDT; 6h 11min ago
 Docs: man:sshd(8)
 man:sshd_config(5)
 Main PID: 11584 (sshd)
 CGroup: /system.slice/sshd.service
 └─11584 /usr/sbin/sshd -D

Sep 23 02:08:56 vps.2daygeek.com systemd[1]: Starting OpenSSH server daemon...
Sep 23 02:08:56 vps.2daygeek.com sshd[11584]: Server listening on 0.0.0.0 port 22.
Sep 23 02:08:56 vps.2daygeek.com sshd[11584]: Server listening on :: port 22.
Sep 23 02:08:56 vps.2daygeek.com systemd[1]: Started OpenSSH server daemon.
Sep 23 02:09:15 vps.2daygeek.com sshd[11589]: Connection closed by 103.5.134.167 port 49899 [preauth]
Sep 23 02:09:41 vps.2daygeek.com sshd[11592]: Accepted password for root from 103.5.134.167 port 49902 ssh2
```

以上输出的内容显示了最近一次启动 `sshd` 服务时 `ssh` 服务的监听端口。但它不会将最新日志更新到输出中。

```
# systemctl status sshd
● sshd.service - OpenSSH server daemon
 Loaded: loaded (/usr/lib/systemd/system/sshd.service; enabled; vendor preset: enabled)
 Active: active (running) since Thu 2018-09-06 07:40:59 IST; 2 weeks 3 days ago
 Docs: man:sshd(8)
 man:sshd_config(5)
 Main PID: 1208 (sshd)
 CGroup: /system.slice/sshd.service
 ├─ 1208 /usr/sbin/sshd -D
 ├─23951 sshd: [accepted]
 └─23952 sshd: [net]

Sep 23 12:50:36 vps.2daygeek.com sshd[23909]: Invalid user pi from 95.210.113.142 port 51666
Sep 23 12:50:36 vps.2daygeek.com sshd[23909]: input_userauth_request: invalid user pi [preauth]
Sep 23 12:50:37 vps.2daygeek.com sshd[23911]: pam_unix(sshd:auth): check pass; user unknown
Sep 23 12:50:37 vps.2daygeek.com sshd[23911]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=95.210.113.142
Sep 23 12:50:37 vps.2daygeek.com sshd[23909]: pam_unix(sshd:auth): check pass; user unknown
Sep 23 12:50:37 vps.2daygeek.com sshd[23909]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=95.210.113.142
Sep 23 12:50:39 vps.2daygeek.com sshd[23911]: Failed password for invalid user pi from 95.210.113.142 port 51670 ssh2
Sep 23 12:50:39 vps.2daygeek.com sshd[23909]: Failed password for invalid user pi from 95.210.113.142 port 51666 ssh2
Sep 23 12:50:40 vps.2daygeek.com sshd[23911]: Connection closed by 95.210.113.142 port 51670 [preauth]
Sep 23 12:50:40 vps.2daygeek.com sshd[23909]: Connection closed by 95.210.113.142 port 51666 [preauth]
```

大部分情况下，以上的输出不会显示进程的实际端口号。这时更建议使用以下这个 `journalctl` 命令检查日志文件中的详细信息。

```
# journalctl | grep -i "openssh\|sshd"
Sep 23 02:08:56 vps138235.vps.ovh.ca sshd[997]: Received signal 15; terminating.
Sep 23 02:08:56 vps138235.vps.ovh.ca systemd[1]: Stopping OpenSSH server daemon...
Sep 23 02:08:56 vps138235.vps.ovh.ca systemd[1]: Starting OpenSSH server daemon...
Sep 23 02:08:56 vps138235.vps.ovh.ca sshd[11584]: Server listening on 0.0.0.0 port 22.
Sep 23 02:08:56 vps138235.vps.ovh.ca sshd[11584]: Server listening on :: port 22.
Sep 23 02:08:56 vps138235.vps.ovh.ca systemd[1]: Started OpenSSH server daemon.
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-find-out-which-port-number-a-process-is-using-in-linux/

作者：[Prakash Subramanian][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[1]: https://www.2daygeek.com/how-to-check-find-the-process-id-pid-ppid-of-a-running-program-in-linux/
[2]: https://www.2daygeek.com/kill-terminate-a-process-in-linux-using-kill-pkill-killall-command/
[3]: https://www.2daygeek.com/chkservice-a-tool-for-managing-systemd-units-from-linux-terminal/
[4]: https://www.2daygeek.com/how-to-check-all-running-services-in-linux/

