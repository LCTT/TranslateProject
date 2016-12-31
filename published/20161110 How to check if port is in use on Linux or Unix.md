如何在 Linux/Unix 系统中验证端口是否被占用
==========

[![](https://s0.cyberciti.org/images/category/old/linux-logo.png)][1]

在 Linux 或者类 Unix 中，我该如何检查某个端口是否被占用？我又该如何验证 Linux 服务器中有哪些端口处于监听状态？

验证哪些端口在服务器的网络接口上处于监听状态是非常重要的。你需要注意那些开放端口来检测网络入侵。除了网络入侵，为了排除故障，确认服务器上的某个端口是否被其他应用程序占用也是必要的。比方说，你可能会在同一个系统中安装了 Apache 和 Nginx 服务器，所以了解是 Apache 还是 Nginx 占用了 # 80/443 TCP 端口真的很重要。这篇快速教程会介绍使用 `netstat` 、 `nmap` 和 `lsof` 命令来检查端口使用信息并找出哪些程序正在使用这些端口。

### 如何检查 Linux 中的程序和监听的端口

1、 打开一个终端，如 shell 命令窗口。
2、 运行以下任意一行命令：

```
sudo lsof -i -P -n | grep LISTEN
sudo netstat -tulpn | grep LISTEN
sudo nmap -sTU -O IP地址
```

下面我们看看这些命令和它们的详细输出内容：

### 方式 1：lsof 命令

语法如下：

```
$ sudo lsof -i -P -n
$ sudo lsof -i -P -n | grep LISTEN
$ doas lsof -i -P -n | grep LISTEN  ### OpenBSD
```

输出如下：

[![Fig.01: Check the listening ports and applications with lsof command](https://s0.cyberciti.org/uploads/faq/2016/11/lsof-outputs.png)][2]

*图 1：使用 lsof 命令检查监听端口和程序*

仔细看上面输出的最后一行：

```
sshd    85379     root    3u  IPv4 0xffff80000039e000      0t0  TCP 10.86.128.138:22 (LISTEN)
```

- `sshd` 是程序的名称
- `10.86.128.138` 是 `sshd` 程序绑定 (LISTEN) 的 IP 地址
- `22` 是被使用 (LISTEN) 的 TCP 端口
- `85379` 是 `sshd` 任务的进程 ID (PID)

### 方式 2：netstat 命令

你可以如下面所示使用 `netstat` 来检查监听的端口和程序。

**Linux 中 netstat 语法**

```
$ netstat -tulpn | grep LISTEN
```

**FreeBSD/MacOS X 中 netstat 语法**

```
$ netstat -anp tcp | grep LISTEN
$ netstat -anp udp | grep LISTEN
```

**OpenBSD 中 netstat 语法**

```
$ netstat -na -f inet | grep LISTEN
$ netstat -nat | grep LISTEN
```

### 方式 3：nmap 命令

语法如下：

```
$ sudo nmap -sT -O localhost
$ sudo nmap -sU -O 192.168.2.13 ### 列出打开的 UDP 端口
$ sudo nmap -sT -O 192.168.2.13 ### 列出打开的 TCP 端口
```

示例输出如下：

[![Fig.02: Determines which ports are listening for TCP connections using nmap](https://s0.cyberciti.org/uploads/faq/2016/11/nmap-outputs.png)][3]

*图 2：使用 nmap 探测哪些端口监听 TCP 连接*

你可以用一句命令合并 TCP/UDP 扫描：

```
$ sudo nmap -sTU -O 192.168.2.13
```

### 赠品：对于 Windows 用户

在 windows 系统下可以使用下面的命令检查端口使用情况：

```
netstat -bano | more
netstat -bano | grep LISTENING
netstat -bano | findstr /R /C:"[LISTING]"
```

----------------------------------------------------

via: https://www.cyberciti.biz/faq/unix-linux-check-if-port-is-in-use-command/

作者：[VIVEK GITE][a]
译者：[GHLandy](https://github.com/GHLandy)
校对：[oska874](https://github.com/oska874)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz/faq/unix-linux-check-if-port-is-in-use-command/
[1]:https://www.cyberciti.biz/faq/category/linux/
[2]:http://www.cyberciti.biz/faq/unix-linux-check-if-port-is-in-use-command/lsof-outputs/
[3]:http://www.cyberciti.biz/faq/unix-linux-check-if-port-is-in-use-command/nmap-outputs/
