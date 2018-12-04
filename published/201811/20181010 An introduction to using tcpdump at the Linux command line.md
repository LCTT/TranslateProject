在 Linux 命令行中使用 tcpdump 抓包
======

> `tcpdump` 是一款灵活、功能强大的抓包工具，能有效地帮助排查网络故障问题。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/terminal_command_linux_desktop_code.jpg?itok=p5sQ6ODE)

以我作为管理员的经验，在网络连接中经常遇到十分难以排查的故障问题。对于这类情况，`tcpdump` 便能派上用场。

`tcpdump` 是一个命令行实用工具，允许你抓取和分析经过系统的流量数据包。它通常被用作于网络故障分析工具以及安全工具。

`tcpdump` 是一款强大的工具，支持多种选项和过滤规则，适用场景十分广泛。由于它是命令行工具，因此适用于在远程服务器或者没有图形界面的设备中收集数据包以便于事后分析。它可以在后台启动，也可以用 cron 等定时工具创建定时任务启用它。

本文中，我们将讨论 `tcpdump` 最常用的一些功能。

### 1、在 Linux 中安装 tcpdump

`tcpdump` 支持多种 Linux 发行版，所以你的系统中很有可能已经安装了它。用下面的命令检查一下是否已经安装了 `tcpdump`：

```
$ which tcpdump
/usr/sbin/tcpdump
```

如果还没有安装 `tcpdump`，你可以用软件包管理器安装它。
例如，在 CentOS 或者 Red Hat Enterprise 系统中，用如下命令安装 `tcpdump`：

```
$ sudo yum install -y tcpdump
```

`tcpdump` 依赖于 `libpcap`，该库文件用于捕获网络数据包。如果该库文件也没有安装，系统会根据依赖关系自动安装它。

现在你可以开始抓包了。

### 2、用 tcpdump 抓包

使用 `tcpdump` 抓包，需要管理员权限，因此下面的示例中绝大多数命令都是以 `sudo` 开头。

首先，先用 `tcpdump -D` 命令列出可以抓包的网络接口：

```
$ sudo tcpdump -D
1.eth0
2.virbr0
3.eth1
4.any (Pseudo-device that captures on all interfaces)
5.lo [Loopback]
```

如上所示，可以看到我的机器中所有可以抓包的网络接口。其中特殊接口 `any` 可用于抓取所有活动的网络接口的数据包。

我们就用如下命令先对 `any` 接口进行抓包：

```
$ sudo tcpdump -i any
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on any, link-type LINUX_SLL (Linux cooked), capture size 262144 bytes
09:56:18.293641 IP rhel75.localdomain.ssh > 192.168.64.1.56322: Flags [P.], seq 3770820720:3770820916, ack 3503648727, win 309, options [nop,nop,TS val 76577898 ecr 510770929], length 196
09:56:18.293794 IP 192.168.64.1.56322 > rhel75.localdomain.ssh: Flags [.], ack 196, win 391, options [nop,nop,TS val 510771017 ecr 76577898], length 0
09:56:18.295058 IP rhel75.59883 > gateway.domain: 2486+ PTR? 1.64.168.192.in-addr.arpa. (43)
09:56:18.310225 IP gateway.domain > rhel75.59883: 2486 NXDomain* 0/1/0 (102)
09:56:18.312482 IP rhel75.49685 > gateway.domain: 34242+ PTR? 28.64.168.192.in-addr.arpa. (44)
09:56:18.322425 IP gateway.domain > rhel75.49685: 34242 NXDomain* 0/1/0 (103)
09:56:18.323164 IP rhel75.56631 > gateway.domain: 29904+ PTR? 1.122.168.192.in-addr.arpa. (44)
09:56:18.323342 IP rhel75.localdomain.ssh > 192.168.64.1.56322: Flags [P.], seq 196:584, ack 1, win 309, options [nop,nop,TS val 76577928 ecr 510771017], length 388
09:56:18.323563 IP 192.168.64.1.56322 > rhel75.localdomain.ssh: Flags [.], ack 584, win 411, options [nop,nop,TS val 510771047 ecr 76577928], length 0
09:56:18.335569 IP gateway.domain > rhel75.56631: 29904 NXDomain* 0/1/0 (103)
09:56:18.336429 IP rhel75.44007 > gateway.domain: 61677+ PTR? 98.122.168.192.in-addr.arpa. (45)
09:56:18.336655 IP gateway.domain > rhel75.44007: 61677* 1/0/0 PTR rhel75. (65)
09:56:18.337177 IP rhel75.localdomain.ssh > 192.168.64.1.56322: Flags [P.], seq 584:1644, ack 1, win 309, options [nop,nop,TS val 76577942 ecr 510771047], length 1060

---- SKIPPING LONG OUTPUT -----

09:56:19.342939 IP 192.168.64.1.56322 > rhel75.localdomain.ssh: Flags [.], ack 1752016, win 1444, options [nop,nop,TS val 510772067 ecr 76578948], length 0
^C
9003 packets captured
9010 packets received by filter
7 packets dropped by kernel
$
```

`tcpdump` 会持续抓包直到收到中断信号。你可以按 `Ctrl+C` 来停止抓包。正如上面示例所示，`tcpdump` 抓取了超过 9000 个数据包。在这个示例中，由于我是通过 `ssh` 连接到服务器，所以 `tcpdump` 也捕获了所有这类数据包。`-c` 选项可以用于限制 `tcpdump` 抓包的数量：

```
$ sudo tcpdump -i any -c 5
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on any, link-type LINUX_SLL (Linux cooked), capture size 262144 bytes
11:21:30.242740 IP rhel75.localdomain.ssh > 192.168.64.1.56322: Flags [P.], seq 3772575680:3772575876, ack 3503651743, win 309, options [nop,nop,TS val 81689848 ecr 515883153], length 196
11:21:30.242906 IP 192.168.64.1.56322 > rhel75.localdomain.ssh: Flags [.], ack 196, win 1443, options [nop,nop,TS val 515883235 ecr 81689848], length 0
11:21:30.244442 IP rhel75.43634 > gateway.domain: 57680+ PTR? 1.64.168.192.in-addr.arpa. (43)
11:21:30.244829 IP gateway.domain > rhel75.43634: 57680 NXDomain 0/0/0 (43)
11:21:30.247048 IP rhel75.33696 > gateway.domain: 37429+ PTR? 28.64.168.192.in-addr.arpa. (44)
5 packets captured
12 packets received by filter
0 packets dropped by kernel
$
```

如上所示，`tcpdump` 在抓取 5 个数据包后自动停止了抓包。这在有些场景中十分有用 —— 比如你只需要抓取少量的数据包用于分析。当我们需要使用过滤规则抓取特定的数据包（如下所示）时，`-c` 的作用就十分突出了。

在上面示例中，`tcpdump` 默认是将 IP 地址和端口号解析为对应的接口名以及服务协议名称。而通常在网络故障排查中，使用 IP 地址和端口号更便于分析问题；用 `-n` 选项显示 IP 地址，`-nn` 选项显示端口号：

```
$ sudo tcpdump -i any -c5 -nn
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on any, link-type LINUX_SLL (Linux cooked), capture size 262144 bytes
23:56:24.292206 IP 192.168.64.28.22 > 192.168.64.1.35110: Flags [P.], seq 166198580:166198776, ack 2414541257, win 309, options [nop,nop,TS val 615664 ecr 540031155], length 196
23:56:24.292357 IP 192.168.64.1.35110 > 192.168.64.28.22: Flags [.], ack 196, win 1377, options [nop,nop,TS val 540031229 ecr 615664], length 0
23:56:24.292570 IP 192.168.64.28.22 > 192.168.64.1.35110: Flags [P.], seq 196:568, ack 1, win 309, options [nop,nop,TS val 615664 ecr 540031229], length 372
23:56:24.292655 IP 192.168.64.1.35110 > 192.168.64.28.22: Flags [.], ack 568, win 1400, options [nop,nop,TS val 540031229 ecr 615664], length 0
23:56:24.292752 IP 192.168.64.28.22 > 192.168.64.1.35110: Flags [P.], seq 568:908, ack 1, win 309, options [nop,nop,TS val 615664 ecr 540031229], length 340
5 packets captured
6 packets received by filter
0 packets dropped by kernel
```

如上所示，抓取的数据包中显示 IP 地址和端口号。这样还可以阻止 `tcpdump` 发出 DNS 查找，有助于在网络故障排查中减少数据流量。

现在你已经会抓包了，让我们来分析一下这些抓包输出的含义吧。

### 3、理解抓取的报文

`tcpdump` 能够抓取并解码多种协议类型的数据报文，如 TCP、UDP、ICMP 等等。虽然这里我们不可能介绍所有的数据报文类型，但可以分析下 TCP 类型的数据报文，来帮助你入门。更多有关 `tcpdump` 的详细介绍可以参考其 [帮助手册][1]。`tcpdump` 抓取的 TCP 报文看起来如下：

```
08:41:13.729687 IP 192.168.64.28.22 > 192.168.64.1.41916: Flags [P.], seq 196:568, ack 1, win 309, options [nop,nop,TS val 117964079 ecr 816509256], length 372
```

具体的字段根据不同的报文类型会有不同，但上面这个例子是一般的格式形式。

第一个字段 `08:41:13.729687` 是该数据报文被抓取的系统本地时间戳。

然后，`IP` 是网络层协议类型，这里是 `IPv4`，如果是 `IPv6` 协议，该字段值是 `IP6`。

`192.168.64.28.22` 是源 ip 地址和端口号，紧跟其后的是目的 ip 地址和其端口号，这里是 `192.168.64.1.41916`。

在源 IP 和目的 IP 之后，可以看到是 TCP 报文标记段 `Flags [P.]`。该字段通常取值如下：

| 值 | 标志类型 | 描述       |
| ----- | --------- | ----------------- |
| S     | SYN       | Connection Start  |
| F     | FIN       | Connection Finish |
| P     | PUSH      | Data push         |
| R     | RST       | Connection reset  |
| .     | ACK       | Acknowledgment    |

该字段也可以是这些值的组合，例如 `[S.]` 代表 `SYN-ACK` 数据包。

接下来是该数据包中数据的序列号。对于抓取的第一个数据包，该字段值是一个绝对数字，后续包使用相对数值，以便更容易查询跟踪。例如此处 `seq 196:568` 代表该数据包包含该数据流的第 196 到 568 字节。

接下来是 ack 值：`ack 1`。该数据包是数据发送方，ack 值为 1。在数据接收方，该字段代表数据流上的下一个预期字节数据，例如，该数据流中下一个数据包的 ack 值应该是 568。

接下来字段是接收窗口大小 `win 309`，它表示接收缓冲区中可用的字节数，后跟 TCP 选项如 MSS（最大段大小）或者窗口比例值。更详尽的 TCP 协议内容请参考 [Transmission Control Protocol(TCP) Parameters][2]。

最后，`length 372` 代表数据包有效载荷字节长度。这个长度和 seq 序列号中字节数值长度是不一样的。

现在让我们学习如何过滤数据报文以便更容易的分析定位问题。

### 4、过滤数据包

正如上面所提，`tcpdump` 可以抓取很多种类型的数据报文，其中很多可能和我们需要查找的问题并没有关系。举个例子，假设你正在定位一个与 web 服务器连接的网络问题，就不必关系 SSH 数据报文，因此在抓包结果中过滤掉 SSH 报文可能更便于你分析问题。

`tcpdump` 有很多参数选项可以设置数据包过滤规则，例如根据源 IP 以及目的 IP 地址，端口号，协议等等规则来过滤数据包。下面就介绍一些最常用的过滤方法。

#### 协议

在命令中指定协议便可以按照协议类型来筛选数据包。比方说用如下命令只要抓取 ICMP 报文：

```
$ sudo tcpdump -i any -c5 icmp
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on any, link-type LINUX_SLL (Linux cooked), capture size 262144 bytes
```

然后再打开一个终端，去 ping 另一台机器：

```
$ ping opensource.com
PING opensource.com (54.204.39.132) 56(84) bytes of data.
64 bytes from ec2-54-204-39-132.compute-1.amazonaws.com (54.204.39.132): icmp_seq=1 ttl=47 time=39.6 ms
```

回到运行 `tcpdump` 命令的终端中，可以看到它筛选出了 ICMP 报文。这里 `tcpdump` 并没有显示有关 `opensource.com` 的域名解析数据包：

```
09:34:20.136766 IP rhel75 > ec2-54-204-39-132.compute-1.amazonaws.com: ICMP echo request, id 20361, seq 1, length 64
09:34:20.176402 IP ec2-54-204-39-132.compute-1.amazonaws.com > rhel75: ICMP echo reply, id 20361, seq 1, length 64
09:34:21.140230 IP rhel75 > ec2-54-204-39-132.compute-1.amazonaws.com: ICMP echo request, id 20361, seq 2, length 64
09:34:21.180020 IP ec2-54-204-39-132.compute-1.amazonaws.com > rhel75: ICMP echo reply, id 20361, seq 2, length 64
09:34:22.141777 IP rhel75 > ec2-54-204-39-132.compute-1.amazonaws.com: ICMP echo request, id 20361, seq 3, length 64
5 packets captured
5 packets received by filter
0 packets dropped by kernel
```

#### 主机

用 `host` 参数只抓取和特定主机相关的数据包：

```
$ sudo tcpdump -i any -c5 -nn host 54.204.39.132
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on any, link-type LINUX_SLL (Linux cooked), capture size 262144 bytes
09:54:20.042023 IP 192.168.122.98.39326 > 54.204.39.132.80: Flags [S], seq 1375157070, win 29200, options [mss 1460,sackOK,TS val 122350391 ecr 0,nop,wscale 7], length 0
09:54:20.088127 IP 54.204.39.132.80 > 192.168.122.98.39326: Flags [S.], seq 1935542841, ack 1375157071, win 28960, options [mss 1460,sackOK,TS val 522713542 ecr 122350391,nop,wscale 9], length 0
09:54:20.088204 IP 192.168.122.98.39326 > 54.204.39.132.80: Flags [.], ack 1, win 229, options [nop,nop,TS val 122350437 ecr 522713542], length 0
09:54:20.088734 IP 192.168.122.98.39326 > 54.204.39.132.80: Flags [P.], seq 1:113, ack 1, win 229, options [nop,nop,TS val 122350438 ecr 522713542], length 112: HTTP: GET / HTTP/1.1
09:54:20.129733 IP 54.204.39.132.80 > 192.168.122.98.39326: Flags [.], ack 113, win 57, options [nop,nop,TS val 522713552 ecr 122350438], length 0
5 packets captured
5 packets received by filter
0 packets dropped by kernel
```
如上所示，只抓取和显示与 `54.204.39.132` 有关的数据包。

#### 端口号

`tcpdump` 可以根据服务类型或者端口号来筛选数据包。例如，抓取和 HTTP 服务相关的数据包：

```
$ sudo tcpdump -i any -c5 -nn port 80
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on any, link-type LINUX_SLL (Linux cooked), capture size 262144 bytes
09:58:28.790548 IP 192.168.122.98.39330 > 54.204.39.132.80: Flags [S], seq 1745665159, win 29200, options [mss 1460,sackOK,TS val 122599140 ecr 0,nop,wscale 7], length 0
09:58:28.834026 IP 54.204.39.132.80 > 192.168.122.98.39330: Flags [S.], seq 4063583040, ack 1745665160, win 28960, options [mss 1460,sackOK,TS val 522775728 ecr 122599140,nop,wscale 9], length 0
09:58:28.834093 IP 192.168.122.98.39330 > 54.204.39.132.80: Flags [.], ack 1, win 229, options [nop,nop,TS val 122599183 ecr 522775728], length 0
09:58:28.834588 IP 192.168.122.98.39330 > 54.204.39.132.80: Flags [P.], seq 1:113, ack 1, win 229, options [nop,nop,TS val 122599184 ecr 522775728], length 112: HTTP: GET / HTTP/1.1
09:58:28.878445 IP 54.204.39.132.80 > 192.168.122.98.39330: Flags [.], ack 113, win 57, options [nop,nop,TS val 522775739 ecr 122599184], length 0
5 packets captured
5 packets received by filter
0 packets dropped by kernel
```

####  IP 地址/主机名

同样，你也可以根据源 IP 地址或者目的 IP 地址或者主机名来筛选数据包。例如抓取源 IP 地址为 `192.168.122.98` 的数据包：

```
$ sudo tcpdump -i any -c5 -nn src 192.168.122.98
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on any, link-type LINUX_SLL (Linux cooked), capture size 262144 bytes
10:02:15.220824 IP 192.168.122.98.39436 > 192.168.122.1.53: 59332+ A? opensource.com. (32)
10:02:15.220862 IP 192.168.122.98.39436 > 192.168.122.1.53: 20749+ AAAA? opensource.com. (32)
10:02:15.364062 IP 192.168.122.98.39334 > 54.204.39.132.80: Flags [S], seq 1108640533, win 29200, options [mss 1460,sackOK,TS val 122825713 ecr 0,nop,wscale 7], length 0
10:02:15.409229 IP 192.168.122.98.39334 > 54.204.39.132.80: Flags [.], ack 669337581, win 229, options [nop,nop,TS val 122825758 ecr 522832372], length 0
10:02:15.409667 IP 192.168.122.98.39334 > 54.204.39.132.80: Flags [P.], seq 0:112, ack 1, win 229, options [nop,nop,TS val 122825759 ecr 522832372], length 112: HTTP: GET / HTTP/1.1
5 packets captured
5 packets received by filter
0 packets dropped by kernel
```

注意此处示例中抓取了来自源 IP 地址 `192.168.122.98` 的 53 端口以及 80 端口的数据包，它们的应答包没有显示出来因为那些包的源 IP 地址已经变了。

相对的，使用 `dst` 就是按目的 IP/主机名来筛选数据包。

```
$ sudo tcpdump -i any -c5 -nn dst 192.168.122.98
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on any, link-type LINUX_SLL (Linux cooked), capture size 262144 bytes
10:05:03.572931 IP 192.168.122.1.53 > 192.168.122.98.47049: 2248 1/0/0 A 54.204.39.132 (48)
10:05:03.572944 IP 192.168.122.1.53 > 192.168.122.98.47049: 33770 0/0/0 (32)
10:05:03.621833 IP 54.204.39.132.80 > 192.168.122.98.39338: Flags [S.], seq 3474204576, ack 3256851264, win 28960, options [mss 1460,sackOK,TS val 522874425 ecr 122993922,nop,wscale 9], length 0
10:05:03.667767 IP 54.204.39.132.80 > 192.168.122.98.39338: Flags [.], ack 113, win 57, options [nop,nop,TS val 522874436 ecr 122993972], length 0
10:05:03.672221 IP 54.204.39.132.80 > 192.168.122.98.39338: Flags [P.], seq 1:643, ack 113, win 57, options [nop,nop,TS val 522874437 ecr 122993972], length 642: HTTP: HTTP/1.1 302 Found
5 packets captured
5 packets received by filter
0 packets dropped by kernel
```

#### 多条件筛选

当然，可以使用多条件组合来筛选数据包，使用 `and` 以及 `or` 逻辑操作符来创建过滤规则。例如，筛选来自源 IP 地址 `192.168.122.98` 的 HTTP 数据包：

```
$ sudo tcpdump -i any -c5 -nn src 192.168.122.98 and port 80
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on any, link-type LINUX_SLL (Linux cooked), capture size 262144 bytes
10:08:00.472696 IP 192.168.122.98.39342 > 54.204.39.132.80: Flags [S], seq 2712685325, win 29200, options [mss 1460,sackOK,TS val 123170822 ecr 0,nop,wscale 7], length 0
10:08:00.516118 IP 192.168.122.98.39342 > 54.204.39.132.80: Flags [.], ack 268723504, win 229, options [nop,nop,TS val 123170865 ecr 522918648], length 0
10:08:00.516583 IP 192.168.122.98.39342 > 54.204.39.132.80: Flags [P.], seq 0:112, ack 1, win 229, options [nop,nop,TS val 123170866 ecr 522918648], length 112: HTTP: GET / HTTP/1.1
10:08:00.567044 IP 192.168.122.98.39342 > 54.204.39.132.80: Flags [.], ack 643, win 239, options [nop,nop,TS val 123170916 ecr 522918661], length 0
10:08:00.788153 IP 192.168.122.98.39342 > 54.204.39.132.80: Flags [F.], seq 112, ack 643, win 239, options [nop,nop,TS val 123171137 ecr 522918661], length 0
5 packets captured
5 packets received by filter
0 packets dropped by kernel
```

你也可以使用括号来创建更为复杂的过滤规则，但在 shell 中请用引号包含你的过滤规则以防止被识别为 shell 表达式：

```
$ sudo tcpdump -i any -c5 -nn "port 80 and (src 192.168.122.98 or src 54.204.39.132)"
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on any, link-type LINUX_SLL (Linux cooked), capture size 262144 bytes
10:10:37.602214 IP 192.168.122.98.39346 > 54.204.39.132.80: Flags [S], seq 871108679, win 29200, options [mss 1460,sackOK,TS val 123327951 ecr 0,nop,wscale 7], length 0
10:10:37.650651 IP 54.204.39.132.80 > 192.168.122.98.39346: Flags [S.], seq 854753193, ack 871108680, win 28960, options [mss 1460,sackOK,TS val 522957932 ecr 123327951,nop,wscale 9], length 0
10:10:37.650708 IP 192.168.122.98.39346 > 54.204.39.132.80: Flags [.], ack 1, win 229, options [nop,nop,TS val 123328000 ecr 522957932], length 0
10:10:37.651097 IP 192.168.122.98.39346 > 54.204.39.132.80: Flags [P.], seq 1:113, ack 1, win 229, options [nop,nop,TS val 123328000 ecr 522957932], length 112: HTTP: GET / HTTP/1.1
10:10:37.692900 IP 54.204.39.132.80 > 192.168.122.98.39346: Flags [.], ack 113, win 57, options [nop,nop,TS val 522957942 ecr 123328000], length 0
5 packets captured
5 packets received by filter
0 packets dropped by kernel
```

该例子中我们只抓取了来自源 IP 为 `192.168.122.98` 或者 `54.204.39.132` 的 HTTP （端口号80）的数据包。使用该方法就很容易抓取到数据流中交互双方的数据包了。

### 5、检查数据包内容

在以上的示例中，我们只按数据包头部的信息来建立规则筛选数据包，例如源地址、目的地址、端口号等等。有时我们需要分析网络连接问题，可能需要分析数据包中的内容来判断什么内容需要被发送、什么内容需要被接收等。`tcpdump` 提供了两个选项可以查看数据包内容，`-X` 以十六进制打印出数据报文内容，`-A` 打印数据报文的 ASCII 值。

例如，HTTP 请求报文内容如下：

```
$ sudo tcpdump -i any -c10 -nn -A port 80
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on any, link-type LINUX_SLL (Linux cooked), capture size 262144 bytes
13:02:14.871803 IP 192.168.122.98.39366 > 54.204.39.132.80: Flags [S], seq 2546602048, win 29200, options [mss 1460,sackOK,TS val 133625221 ecr 0,nop,wscale 7], length 0
E..<..@.@.....zb6.'....P...@......r............
............................
13:02:14.910734 IP 54.204.39.132.80 > 192.168.122.98.39366: Flags [S.], seq 1877348646, ack 2546602049, win 28960, options [mss 1460,sackOK,TS val 525532247 ecr 133625221,nop,wscale 9], length 0
E..<..@./..a6.'...zb.P..o..&...A..q a..........
.R.W.......     ................
13:02:14.910832 IP 192.168.122.98.39366 > 54.204.39.132.80: Flags [.], ack 1, win 229, options [nop,nop,TS val 133625260 ecr 525532247], length 0
E..4..@.@.....zb6.'....P...Ao..'...........
.....R.W................
13:02:14.911808 IP 192.168.122.98.39366 > 54.204.39.132.80: Flags [P.], seq 1:113, ack 1, win 229, options [nop,nop,TS val 133625261 ecr 525532247], length 112: HTTP: GET / HTTP/1.1
E.....@.@..1..zb6.'....P...Ao..'...........
.....R.WGET / HTTP/1.1
User-Agent: Wget/1.14 (linux-gnu)
Accept: */*
Host: opensource.com
Connection: Keep-Alive

................
13:02:14.951199 IP 54.204.39.132.80 > 192.168.122.98.39366: Flags [.], ack 113, win 57, options [nop,nop,TS val 525532257 ecr 133625261], length 0
E..4.F@./.."6.'...zb.P..o..'.......9.2.....
.R.a....................
13:02:14.955030 IP 54.204.39.132.80 > 192.168.122.98.39366: Flags [P.], seq 1:643, ack 113, win 57, options [nop,nop,TS val 525532258 ecr 133625261], length 642: HTTP: HTTP/1.1 302 Found
E....G@./...6.'...zb.P..o..'.......9.......
.R.b....HTTP/1.1 302 Found
Server: nginx
Date: Sun, 23 Sep 2018 17:02:14 GMT
Content-Type: text/html; charset=iso-8859-1
Content-Length: 207
X-Content-Type-Options: nosniff
Location: https://opensource.com/
Cache-Control: max-age=1209600
Expires: Sun, 07 Oct 2018 17:02:14 GMT
X-Request-ID: v-6baa3acc-bf52-11e8-9195-22000ab8cf2d
X-Varnish: 632951979
Age: 0
Via: 1.1 varnish (Varnish/5.2)
X-Cache: MISS
Connection: keep-alive

<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>302 Found</title>
</head><body>
<h1>Found</h1>
<p>The document has moved <a href="https://opensource.com/">here</a>.</p>
</body></html>
................
13:02:14.955083 IP 192.168.122.98.39366 > 54.204.39.132.80: Flags [.], ack 643, win 239, options [nop,nop,TS val 133625304 ecr 525532258], length 0
E..4..@.@.....zb6.'....P....o..............
.....R.b................
13:02:15.195524 IP 192.168.122.98.39366 > 54.204.39.132.80: Flags [F.], seq 113, ack 643, win 239, options [nop,nop,TS val 133625545 ecr 525532258], length 0
E..4..@.@.....zb6.'....P....o..............
.....R.b................
13:02:15.236592 IP 54.204.39.132.80 > 192.168.122.98.39366: Flags [F.], seq 643, ack 114, win 57, options [nop,nop,TS val 525532329 ecr 133625545], length 0
E..4.H@./.. 6.'...zb.P..o..........9.I.....
.R......................
13:02:15.236656 IP 192.168.122.98.39366 > 54.204.39.132.80: Flags [.], ack 644, win 239, options [nop,nop,TS val 133625586 ecr 525532329], length 0
E..4..@.@.....zb6.'....P....o..............
.....R..................
10 packets captured
10 packets received by filter
0 packets dropped by kernel
```

这对定位一些普通 HTTP 调用 API 接口的问题很有用。当然如果是加密报文，这个输出也就没多大用了。

### 6、保存抓包数据

`tcpdump` 提供了保存抓包数据的功能以便后续分析数据包。例如，你可以夜里让它在那里抓包，然后早上起来再去分析它。同样当有很多数据包时，显示过快也不利于分析，将数据包保存下来，更有利于分析问题。

使用 `-w` 选项来保存数据包而不是在屏幕上显示出抓取的数据包：

```
$ sudo tcpdump -i any -c10 -nn -w webserver.pcap port 80
[sudo] password for ricardo:
tcpdump: listening on any, link-type LINUX_SLL (Linux cooked), capture size 262144 bytes
10 packets captured
10 packets received by filter
0 packets dropped by kernel
```

该命令将抓取的数据包保存到文件 `webserver.pcap`。后缀名 `pcap` 表示文件是抓取的数据包格式。

正如示例中所示，保存数据包到文件中时屏幕上就没有任何有关数据报文的输出，其中 `-c10` 表示抓取到 10 个数据包后就停止抓包。如果想有一些反馈来提示确实抓取到了数据包，可以使用 `-v` 选项。

`tcpdump` 将数据包保存在二进制文件中，所以不能简单的用文本编辑器去打开它。使用 `-r` 选项参数来阅读该文件中的报文内容：

```
$ tcpdump -nn -r webserver.pcap
reading from file webserver.pcap, link-type LINUX_SLL (Linux cooked)
13:36:57.679494 IP 192.168.122.98.39378 > 54.204.39.132.80: Flags [S], seq 3709732619, win 29200, options [mss 1460,sackOK,TS val 135708029 ecr 0,nop,wscale 7], length 0
13:36:57.718932 IP 54.204.39.132.80 > 192.168.122.98.39378: Flags [S.], seq 1999298316, ack 3709732620, win 28960, options [mss 1460,sackOK,TS val 526052949 ecr 135708029,nop,wscale 9], length 0
13:36:57.719005 IP 192.168.122.98.39378 > 54.204.39.132.80: Flags [.], ack 1, win 229, options [nop,nop,TS val 135708068 ecr 526052949], length 0
13:36:57.719186 IP 192.168.122.98.39378 > 54.204.39.132.80: Flags [P.], seq 1:113, ack 1, win 229, options [nop,nop,TS val 135708068 ecr 526052949], length 112: HTTP: GET / HTTP/1.1
13:36:57.756979 IP 54.204.39.132.80 > 192.168.122.98.39378: Flags [.], ack 113, win 57, options [nop,nop,TS val 526052959 ecr 135708068], length 0
13:36:57.760122 IP 54.204.39.132.80 > 192.168.122.98.39378: Flags [P.], seq 1:643, ack 113, win 57, options [nop,nop,TS val 526052959 ecr 135708068], length 642: HTTP: HTTP/1.1 302 Found
13:36:57.760182 IP 192.168.122.98.39378 > 54.204.39.132.80: Flags [.], ack 643, win 239, options [nop,nop,TS val 135708109 ecr 526052959], length 0
13:36:57.977602 IP 192.168.122.98.39378 > 54.204.39.132.80: Flags [F.], seq 113, ack 643, win 239, options [nop,nop,TS val 135708327 ecr 526052959], length 0
13:36:58.022089 IP 54.204.39.132.80 > 192.168.122.98.39378: Flags [F.], seq 643, ack 114, win 57, options [nop,nop,TS val 526053025 ecr 135708327], length 0
13:36:58.022132 IP 192.168.122.98.39378 > 54.204.39.132.80: Flags [.], ack 644, win 239, options [nop,nop,TS val 135708371 ecr 526053025], length 0
$
```

这里不需要管理员权限 `sudo` 了，因为此刻并不是在网络接口处抓包。

你还可以使用我们讨论过的任何过滤规则来过滤文件中的内容，就像使用实时数据一样。 例如，通过执行以下命令从源 IP 地址 `54.204.39.132` 检查文件中的数据包：

```
$ tcpdump -nn -r webserver.pcap src 54.204.39.132
reading from file webserver.pcap, link-type LINUX_SLL (Linux cooked)
13:36:57.718932 IP 54.204.39.132.80 > 192.168.122.98.39378: Flags [S.], seq 1999298316, ack 3709732620, win 28960, options [mss 1460,sackOK,TS val 526052949 ecr 135708029,nop,wscale 9], length 0
13:36:57.756979 IP 54.204.39.132.80 > 192.168.122.98.39378: Flags [.], ack 113, win 57, options [nop,nop,TS val 526052959 ecr 135708068], length 0
13:36:57.760122 IP 54.204.39.132.80 > 192.168.122.98.39378: Flags [P.], seq 1:643, ack 113, win 57, options [nop,nop,TS val 526052959 ecr 135708068], length 642: HTTP: HTTP/1.1 302 Found
13:36:58.022089 IP 54.204.39.132.80 > 192.168.122.98.39378: Flags [F.], seq 643, ack 114, win 57, options [nop,nop,TS val 526053025 ecr 135708327], length 0
```

### 下一步做什么？

以上的基本功能已经可以帮助你使用强大的 `tcpdump` 抓包工具了。更多的内容请参考 [tcpdump 网站][3] 以及它的 [帮助文件][4]。

`tcpdump` 命令行工具为分析网络流量数据包提供了强大的灵活性。如果需要使用图形工具来抓包请参考 [Wireshark][5]。

Wireshark 还可以用来读取 `tcpdump` 保存的 pcap 文件。你可以使用 `tcpdump` 命令行在没有 GUI 界面的远程机器上抓包然后在 Wireshark 中分析数据包。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/introduction-tcpdump

作者：[Ricardo Gerardi][a]
选题：[lujun9972][b]
译者：[jrg](https://github.com/jrglinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rgerardi
[b]: https://github.com/lujun9972
[1]: http://www.tcpdump.org/manpages/tcpdump.1.html#lbAG
[2]: https://www.iana.org/assignments/tcp-parameters/tcp-parameters.xhtml
[3]: http://www.tcpdump.org/#
[4]: http://www.tcpdump.org/manpages/tcpdump.1.html
[5]: https://www.wireshark.org/

