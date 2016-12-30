如何在 \*nix 系统中验证端口是否被占用
==========

[![](https://s0.cyberciti.org/images/category/old/linux-logo.png)][1]

在 Linux 或者类 Unix 中，我该如何检查某个端口是否被占用？我又该如何验证 Linux 服务器中有哪些端口处于监听状态？

验证哪些端口在服务器的网络接口上处于监听状态是非常重要的。你需要注意那些用于监听指令的开放端口。暂且不说那些用于排除故障的指令，确认服务器上的某个端口是否被其他应用程序占用也是必要的。比方说，你可能会在同一个系统中安装了 Apache 和 Nginx 服务，所以了解是 Apache 还是 Nginx 占用 # 80/443 TCP端口真的很重要。本文会提及使用 netstat、nmap 和 lsof 命令来检查端口是否被占用以及查看程序使用了那些端口。

### 如何检查 Linux 中的监听端口和程序

1. 打开一个终端，如 shell 命令窗口。
2. 运行一下任意一行命令：

  ```
  sudo lsof -i -P -n | grep LISTEN
  sudo netstat -tulpn | grep LISTEN
  sudo nmap -sTU -O IP-address-Here
  ```

下面我们看看这些命令输出的详细内容：

### 选择 #1：lsof 命令

语法如下：

```
$ sudo lsof -i -P -n
$ sudo lsof -i -P -n | grep LISTEN
$ doas lsof -i -P -n | grep LISTEN
```

### [OpenBSD] ###

输出如下：

[![Fig.01: Check the listening ports and applications with lsof command](https://s0.cyberciti.org/uploads/faq/2016/11/lsof-outputs.png)][2]

图 1：使用 lsof 命令检查监听端口和程序

如上图输出的最后一行：

```
sshd    85379     root    3u  IPv4 0xffff80000039e000      0t0  TCP 10.86.128.138:22 (LISTEN)
```

- sshd 是程序的名称
- 10.86.128.138 是 sshd 程序绑定监听 (LISTEN) 的 IP 地址
- 22 是被占用 (LISTEN) 的 TCP 端口
- 85379 是 sshd 进程的进程 ID (PID)

### 选择 #2：netstat 命令

netstat 命令检查监听端口和程序的用法如下：

### Linux 中 netstat 语法如下：

```
$ netstat -tulpn | grep LISTEN
```

### FreeBSD/MacOS X 中 netstat 语法如下：

```
$ netstat -anp tcp | grep LISTEN
$ netstat -anp udp | grep LISTEN
```

### OpenBSD 中 netstat 语法如下：

```
$ netstat -na -f inet | grep LISTEN
$ netstat -nat | grep LISTEN
```

### 选择 #3：nmap 命令

语法如下：

```
$ sudo nmap -sT -O localhost
$ sudo nmap -sU -O 192.168.2.13 ##[ list open UDP ports ]##
$ sudo nmap -sT -O 192.168.2.13 ##[ list open TCP ports ]##
```

输出如下：

[![Fig.02: Determines which ports are listening for TCP connections using nmap](https://s0.cyberciti.org/uploads/faq/2016/11/nmap-outputs.png)][3]

图 2：使用 nmap 探测那些端口用于监听 TCP 连接

你可以在单个命令中同时探测 TCP/UDP 连接：

`$ sudo nmap -sTU -O 192.168.2.13`

### 关于 Windows 用户

你可以使用以下 Windows  自带的命令来检查端口的使用情况：

```
netstat -bano | more
netstat -bano | grep LISTENING
netstat -bano | findstr /R /C:"[LISTING]"
```

----------------------------------------------------

via: https://www.cyberciti.biz/faq/unix-linux-check-if-port-is-in-use-command/

作者：[ VIVEK GITE][a]
译者：[GHLandy](https://github.com/GHLandy)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz/faq/unix-linux-check-if-port-is-in-use-command/
[1]:https://www.cyberciti.biz/faq/category/linux/
[2]:http://www.cyberciti.biz/faq/unix-linux-check-if-port-is-in-use-command/lsof-outputs/
[3]:http://www.cyberciti.biz/faq/unix-linux-check-if-port-is-in-use-command/nmap-outputs/
