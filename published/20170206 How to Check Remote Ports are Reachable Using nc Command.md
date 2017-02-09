使用 nc 命令检查远程端口是否打开
============================================================

**端口**是与 Linux 操作系统上的应用或进程的通讯端点的逻辑实体。在使用之前，了解目标机器上哪些端口是打开并正在运行服务是非常有用的。

我们可以使用 [netstat][4] 或其他几个 Linux 命令如 [NMAP][5] 在本地机器上轻松地[列出 Linux 中的打开端口][3]。

在本指南中，我们将向你展示如何使用简单的 `netcat`（简称 `nc`）命令来确定远程主机上的端口是否可访问/打开。

`netcat`（或简称 `nc`）是一个功能强大且易于使用的程序，可用于 Linux 中与 TCP、UDP 或 UNIX 域套接字相关的任何事情。

```
# yum install nc                  [在 CentOS/RHEL 中]
# dnf install nc                  [在 Fedora 22+ 中]
$ sudo apt-get install netcat     [在 Debian/Ubuntu 中]
```

我们可以使用它：打开 TCP 连接、侦听任意 TCP 和 UDP 端口、发送 UDP 数据包、在 IPv4 和 IPv6 进行端口扫描。

使用 **netcat**，你可以检查单个或多个或一段打开的端口范围，如下所示。下面的命令将帮助我们查看端口 22 是否在主机 192.168.56.10 上打开：

```
$ nc -zv 192.168.1.15 22
```

上面的命令中，这些标志是：

1.  `-z` – 设置 nc 只是扫描侦听守护进程，实际上不向它们发送任何数据。
2.  `-v` – 启用详细模式

下面的命令会检查远程主机 192.168.5.10 上是否打开了端口 80、22 和 21（我们也可以使用主机名）：

```
nc -zv 192.168.56.10 80 22 21
```

也可以指定端口扫描的范围：

```
$ nc -zv 192.168.56.10 20-80
```

更多关于 netcat 命令的例子和使用，阅读我们下面的文章。

1.  [使用 netcat 命令在 Linux 服务器间传输文件][1]
2.  [Linux 网络配置及排障调试命令][2]

就是这样。在本文中，我们解释了如何使用 netcat 命令检测远程主机端口是否可达/打开。请在评论栏中留下你的想法。

--------------------------------------------------------------------------------

译者简介：

Aaron Kili 是 Linux 和 F.O.S.S 爱好者，将来的 Linux SysAdmin 和 web 开发人员，目前是 TecMint 的内容创建者，他喜欢用电脑工作，并坚信分享知识。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/check-remote-port-in-linux/

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/transfer-files-between-two-linux-machines/
[2]:http://www.tecmint.com/linux-network-configuration-and-troubleshooting-commands/
[3]:http://www.tecmint.com/find-open-ports-in-linux/
[4]:http://www.tecmint.com/20-netstat-commands-for-linux-network-management/
[5]:http://www.tecmint.com/nmap-command-examples/
