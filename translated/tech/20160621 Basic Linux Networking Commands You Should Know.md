你必须了解的 Linux 基础网络命令
==================================================

![](https://itsfoss.com/wp-content/uploads/2016/06/Basic-Networking-Commands-Linux.jpg)

摘要：有抱负的 Linux 系统管理员和 Linux 狂热者必须知道的最重要而且基础的 Linux 网络命令合集。

在 It’s FOSS 我们并非每天都谈论 Linux 的“命令行方面”。基本上，我更专注于 Linux 的桌面端。但你们读者中的一些人在内部调查（仅面向 It's FOSS newsletter 订阅者）中指出，你们也想学些命令行技巧。速查表也受大部分读者所喜欢和支持。

为此，我编辑了一个 Linux 中基础网络命令的列表。它并不是一个教你如何使用这些命令的教程，而是一个命令合集和他们的简短解释。所以，如果你已经使用过这些命令，你可以用它来快速记住命令。

你可以把这个网页添加为书签以便快速查阅，或下载这些命令的 PDF 版本以便离线使用。

当我还是通信系统工程专业的学生的时候我就有这个 Linux 网络命令的列表了。它帮助我在计算机网络课程获得了高分。希望它也能以同样的方式帮助你。

> 独家内容：[下载 Linux 网络命令速查表][1] 以便将来查阅。你可以打印或保存它以便离线查看。

### Linux 基础网络命令列表

我在计算机网络课程上使用 FreeBSD，不过这些 UNIX 命令应该也能在 Linux 上同样工作。

#### 连通性

- __ping <host\>__：发送 ICMP echo 消息（一个包）到主机。这可能会不停地发送直到你按下 Control-C。Ping 通意味着一个包从你的机器通过 ICMP 发送出去，并在 IP 层回显。Ping 告诉你另一个主机是否在运行。

- __telnet <host\> [port]__：与主机在指定的端口通信。默认的 telnet 端口是 23。其它一些常用的端口是：
    7 —— echo 端口
    25 —— SMTP，用于发送邮件
    79 —— Finger（译注：[维基百科 - Finger protocal](https://en.wikipedia.org/wiki/Finger_protocol)），提供该网络下其它用户的信息

按 Control-] 以退出 telnet。

#### ARP

ARP 用于将 IP 地址转换为以太网地址。Root 用户可以添加和删除 ARP 记录。当 ARP 记录被污染或者错误时，删除他们会有用。Root 显式添加的 ARP 记录是永久的 —— 代理设置的也是。ARP 表保存在内核中，动态地被操作。ARP 记录会被缓存，通常在 20 分钟后失效并被删除。

- __arp -a__：打印 ARP 表
- __arp -s <ip_address\> <mac_address\> [pub]__：添加一条记录到表中
- __arp -a -d__：删除 ARP 表中的所有记录

#### 路由

- __netstat -r__：打印路由表。路由表保存在内核中，用于 IP 层路由包到非本地网络。
- __route add__：route 命令用于向路由表添加静态（手动输入而非动态）路由路径。所有从该 PC 到那个 IP/子网的流量都会经由指定的网关 IP。它也可以用来设置一个默认路由。例如，在 IP/子网处使用 0.0.0.0，就可以发送所有包到特定的网关。
- __routed__：控制动态路由的 BSD 守护程序。开机时启动。它运行 RIP 路由协议。只有 root 用户可用。没有 root 权限你不能运行它。
- __gated__：gated 是另一个使用 RIP 的路由守护进程。它同时支持 OSPF、EGP 和 RIP 协议。只有 root 用户可用。
- __traceroute__：用于跟踪 IP 包的路由。它每次发送包时都把跳数加 1，从而使得从源地址到目的地之间的所有网关都会返回消息。
- __netstat -rnf inet__：显示 IPv4 的路由表
- __sysctl net.inet.ip.forwarding=1__：启用包转发（把主机变为路由器）
- __route add|delete [-net|-host] <destination\> <gateway\>__：（如 `route add 192.168.20.0/24 192.168.30.4`）添加一条路由
- __route flush__：删除所有路由
- __route add -net 0.0.0.0 192.168.10.2__：添加一条默认路由
- __routed -Pripv2 -Pno_rdisc -d [-s|-q]__：运行 routed 守护进程，使用 RIPv2 协议，不启用 ICMP 自动发现，在前台运行，供给模式或安静模式。
- __route add 224.0.0.0/4 127.0.0.1__：定义 RIPv2 使用的路由（译注：翻译存疑）
- __rtquery -n <host\>__（译注：增加了 host 参数）：查询指定主机上的 RIP 守护进程（手动更新路由表）

#### 其它

- __nslookup__：向 DNS 服务器查询，将 IP 转为名称，或反之。例如，`nslookup facebook.com` 会给出 facebook.com 的 IP。
- __ftp <host\> [port]__（译注：原文中 water 应是笔误）：传输文件到指定主机。通常可以使用 login="anonymous" , p/w="guest" 登录。
- __rlogin -l <host\>__（译注：添加了 host 参数）：使用类似 telnet 的虚拟终端登录到主机

#### 重要文件

- __/etc/hosts__：域名到 IP 地址的映射
- __/etc/networks__：网络名称到 IP 地址的映射
- __/etc/protocols__：协议名称到协议编号的映射
- __/etc/services__：TCP/UDP 服务名称到端口号的映射

#### 工具和网络性能分析

- __ifconfig <interface\> <address\> [up]__：启动接口
- __ifconfig <interface\> [down|delete]__：停止接口
- __ethereal &__：在后台打开 `ethereal` 而非前台
- __tcpdump -i -vvv__：抓取和分析包的工具
- __netstat -w [seconds] -I [interface]__：显示网络设置和统计信息
- __udpmt -p [port] -s [bytes] target_host__：发送 UDP 流量
- __udptarget -p [port]__：接收 UDP 流量
- __tcpmt -p [port] -s [bytes] target_host__：发送 TCP 流量
- __tcptarget -p [port]__：接收 TCP 流量


#### 交换机

- __ifconfig sl0 srcIP dstIP__：配置一个序列接口（在此前先执行 `slattach -l /dev/ttyd0`，此后执行 `sysctl net.inet.ip.forwarding=1`）
- __telnet 192.168.0.254__：从子网中的一台主机访问交换机
- __sh ru__ 或 __show running-configuration__：查看当前配置
- __configure terminal__：进入配置模式
- __exit__：进入低级配置模式（译注：翻译存疑）

#### VLAN

- __vlan n__：创建一个 ID 为 n 的 VLAN
- __no vlan N__：删除 ID 为 n 的 VLAN
- __untagged Y__：添加端口 Y 到 VLAN n
- __ifconfig vlan0 create__：创建 vlan0 接口
- __ifconfig vlan0 vlan ID vlandev em0__：连接 vlan0 接口到 em0 之上（译注：翻译存疑），并设置标记为 ID
- __ifconfig vlan0 [up]__：启用虚拟接口
- __tagged Y__：为当前 VLAN 的端口 Y 添加标记帧支持

#### UDP/TCP

- __socklab udp__：使用 UDP 协议运行 `socklab`
- __sock__：创建一个 UDP 套接字，等效于输入 `sock udp` 和 `bind`
- __sendto <Socket ID\> <hostname\> <port #\>__：发送数据包
- __recvfrom <Socket ID\> <byte #\>__：从套接字接收数据
- __socklab tcp__：使用 TCP 协议运行 `socklab`
- __passive__：创建一个被动模式的套接字，等效于 `socklab`，`sock tcp`，`bind`，`listen`
- __accept__：接受进来的连接（可以在发起进来的连接之前或之后执行）
- __connect <hostname\> <port #\>__：等效于 `socklab`，`sock tcp`，`bind`，`connect`
- __close__：关闭连接
- __read <byte #\>__：从套接字中读取 n 字节
- __write__：（例如，`write ciao`、`write #10`）向套接字写入 "ciao" 或 10 个字节

#### NAT/防火墙

- __rm /etc/resolv.conf__：禁止地址解析，保证你的过滤和防火墙规则正确工作
- __ipnat -f file_name__：将过滤规则写入文件
- __ipnat -l__：显示活动的规则列表
- __ipnat -C -F__：重新初始化规则表
- __map em0 192.168.1.0/24 -> 195.221.227.57/32 em0__：将 IP 地址映射到接口
- __map em0 192.168.1.0/24 -> 195.221.227.57/32 portmap tcp/udp 20000:50000__：带端口号的映射
- __ipf -f file_name__：将过滤规则写入文件
- __ipf -F -a__：重置规则表
- __ipfstat -I__：在过滤的包上允许访问某些信息（译注：翻译存疑），也包括活动的过滤规则

希望这份基础的 Linux 网络命令合集对你有用。问题和建议总是受欢迎的。

--------------------------------------------------------------------------------

via: https://itsfoss.com/basic-linux-networking-commands

作者：[Abhishek Prakash][a]
译者：[bianjp](https://github.com/bianjp)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[1]: https://drive.google.com/open?id=0By49_3Av9sT1cDdaZnh4cHB4aEk
