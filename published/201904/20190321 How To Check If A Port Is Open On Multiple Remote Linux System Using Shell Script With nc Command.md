[#]: collector: "lujun9972"
[#]: translator: "zero-MK"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-10766-1.html"
[#]: subject: "How To Check If A Port Is Open On Multiple Remote Linux System Using Shell Script With nc Command?"
[#]: via: "https://www.2daygeek.com/check-a-open-port-on-multiple-remote-linux-server-using-nc-command/"
[#]: author: "Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/"


如何检查多个远程 Linux 系统是否打开了指定端口？
======

我们最近写了一篇文章关于如何检查远程 Linux 服务器是否打开指定端口。它能帮助你检查单个服务器。

如果要检查五个服务器有没有问题，可以使用以下任何一个命令，如 `nc`（netcat）、`nmap` 和 `telnet`。但是如果想检查 50 多台服务器，那么你的解决方案是什么？

要检查所有服务器并不容易，如果你一个一个这样做，完全没有必要，因为这样你将会浪费大量的时间。为了解决这种情况，我使用 `nc` 命令编写了一个 shell 小脚本，它将允许我们扫描任意数量服务器给定的端口。

如果你要查找单个服务器扫描，你有多个选择，你只需阅读 [检查远程 Linux 系统上的端口是否打开？][1] 了解更多信息。

本教程中提供了两个脚本，这两个脚本都很有用。这两个脚本都用于不同的目的，你可以通过阅读标题轻松理解其用途。

在你阅读这篇文章之前，我会问你几个问题，如果你不知道答案你可以通过阅读这篇文章来获得答案。

如何检查一个远程 Linux 服务器上指定的端口是否打开？

如何检查多个远程 Linux 服务器上指定的端口是否打开？

如何检查多个远程 Linux 服务器上是否打开了多个指定的端口？

### 什么是 nc（netcat）命令？

`nc` 即 netcat。它是一个简单实用的 Unix 程序，它使用 TCP 或 UDP 协议进行跨网络连接进行数据读取和写入。

它被设计成一个可靠的 “后端” 工具，我们可以直接使用或由其他程序和脚本轻松驱动它。

同时，它也是一个功能丰富的网络调试和探索工具，因为它可以创建你需要的几乎任何类型的连接，并具有几个有趣的内置功能。

netcat 有三个主要的模式。分别是连接模式，监听模式和隧道模式。

`nc`（netcat）的通用语法：

```
$ nc [-options] [HostName or IP] [PortNumber]
```

### 如何检查多个远程 Linux 服务器上的端口是否打开？

如果要检查多个远程 Linux 服务器上给定端口是否打开，请使用以下 shell 脚本。

在我的例子中，我们将检查端口 22 是否在以下远程服务器中打开，确保你已经更新文件中的服务器列表而不是使用我的服务器列表。

你必须确保已经更新服务器列表 ：`server-list.txt` 。每个服务器（IP）应该在单独的行中。

```
# cat server-list.txt
192.168.1.2
192.168.1.3
192.168.1.4
192.168.1.5
192.168.1.6
192.168.1.7
```

使用以下脚本可以达到此目的。

```
# vi port_scan.sh

#!/bin/sh
for server in `more server-list.txt`
do
  #echo $i
  nc -zvw3 $server 22
done
```

设置 `port_scan.sh` 文件的可执行权限。

```
$ chmod +x port_scan.sh
```

最后运行脚本来达到此目的。

```
# sh port_scan.sh

Connection to 192.168.1.2 22 port [tcp/ssh] succeeded!
Connection to 192.168.1.3 22 port [tcp/ssh] succeeded!
Connection to 192.168.1.4 22 port [tcp/ssh] succeeded!
Connection to 192.168.1.5 22 port [tcp/ssh] succeeded!
Connection to 192.168.1.6 22 port [tcp/ssh] succeeded!
Connection to 192.168.1.7 22 port [tcp/ssh] succeeded!
```

### 如何检查多个远程 Linux 服务器上是否打开多个端口？

如果要检查多个服务器中的多个端口，请使用下面的脚本。

在我的例子中，我们将检查给定服务器的 22 和 80 端口是否打开。确保你必须替换所需的端口和服务器名称而不使用是我的。

你必须确保已经将要检查的端口写入 `port-list.txt` 文件中。每个端口应该在一个单独的行中。

```
# cat port-list.txt
22
80
```

你必须确保已经将要检查的服务器（IP 地址）写入 `server-list.txt` 到文件中。每个服务器（IP） 应该在单独的行中。

```
# cat server-list.txt
192.168.1.2
192.168.1.3
192.168.1.4
192.168.1.5
192.168.1.6
192.168.1.7
```

使用以下脚本来达成此目的。

```
# vi multiple_port_scan.sh

#!/bin/sh
for server in `more server-list.txt`
do
  for port in `more port-list.txt`
  do
    #echo $server
    nc -zvw3 $server $port
    echo ""
  done
done
```

设置  `multiple_port_scan.sh` 文件的可执行权限。

```
$ chmod +x multiple_port_scan.sh
```

最后运行脚本来实现这一目的。

```
# sh multiple_port_scan.sh
Connection to 192.168.1.2 22 port [tcp/ssh] succeeded!
Connection to 192.168.1.2 80 port [tcp/http] succeeded!

Connection to 192.168.1.3 22 port [tcp/ssh] succeeded!
Connection to 192.168.1.3 80 port [tcp/http] succeeded!

Connection to 192.168.1.4 22 port [tcp/ssh] succeeded!
Connection to 192.168.1.4 80 port [tcp/http] succeeded!

Connection to 192.168.1.5 22 port [tcp/ssh] succeeded!
Connection to 192.168.1.5 80 port [tcp/http] succeeded!

Connection to 192.168.1.6 22 port [tcp/ssh] succeeded!
Connection to 192.168.1.6 80 port [tcp/http] succeeded!

Connection to 192.168.1.7 22 port [tcp/ssh] succeeded!
Connection to 192.168.1.7 80 port [tcp/http] succeeded!
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/check-a-open-port-on-multiple-remote-linux-server-using-nc-command/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[zero-MK](https://github.com/zero-mk)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-10675-1.html
