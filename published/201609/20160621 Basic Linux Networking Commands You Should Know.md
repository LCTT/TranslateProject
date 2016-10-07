你必须了解的基础的 Linux 网络命令
==================================================

![](https://itsfoss.com/wp-content/uploads/2016/06/Basic-Networking-Commands-Linux.jpg)

> 摘要：有抱负的 Linux 系统管理员和 Linux 狂热者必须知道的、最重要的、而且基础的 Linux 网络命令合集。

在 It’s FOSS 我们并非每天都谈论 Linux 的“命令行方面”。基本上，我更专注于 Linux 的桌面端。但你们读者中的一些人在内部调查（仅面向 It's FOSS newsletter 订阅者）中指出，你们也想学些命令行技巧。速查表也受大部分读者所喜欢和支持。

为此，我编辑了一个 Linux 中基础网络命令的列表。它并不是一个教你如何使用这些命令的教程，而是一个命令合集和他们的简短解释。所以，如果你已经使用过这些命令，你可以用它来快速记住命令。

你可以把这个网页添加为书签以便快速查阅，或输出一个 PDF 版本以便离线使用。

当我还是通信系统工程专业的学生的时候我就有这个 Linux 网络命令的列表了。它帮助我在计算机网络课程获得了高分。希望它也能以同样的方式帮助你。

### Linux 基础网络命令列表

我在计算机网络课程上使用 FreeBSD，不过这些 UNIX 命令应该也能在 Linux 上同样工作。

#### 连通性

- `ping <host>`：发送 ICMP echo 消息（一个包）到主机。这可能会不停地发送直到你按下 `Control-C`。Ping 的通意味着一个包从你的机器通过 ICMP 发送出去，并在 IP 层回显。Ping 告诉你另一个主机是否在运行。
- `telnet <host> [port]`：与主机在指定的端口通信。默认的 telnet 端口是 23。按 Control-] 以退出 telnet。其它一些常用的端口是：
    - 7 —— echo 端口
    - 25 —— SMTP，用于发送邮件
    - 79 —— Finger (LCTT 译注：[维基百科 - Finger protocal](https://en.wikipedia.org/wiki/Finger_protocol)，不过举例 Finger 恐怕不合时宜，倒不如试试 80？），提供该网络下其它用户的信息。

#### ARP

ARP 用于将 IP 地址转换为以太网地址。root 用户可以添加和删除 ARP 记录。当 ARP 记录被污染或者错误时，删除它们会有用。root 显式添加的 ARP 记录是永久的 —— 代理设置的也是。ARP 表保存在内核中，动态地被操作。ARP 记录会被缓存，通常在 20 分钟后失效并被删除。

- `arp -a`：打印 ARP 表。
- `arp -s <ip_address> <mac_address> [pub]`：添加一条记录到表中。
- `arp -a -d`：删除 ARP 表中的所有记录。

#### 路由

- `netstat -r`：打印路由表。路由表保存在内核中，用于 IP 层把包路由到非本地网络。
- `route add`：route 命令用于向路由表添加静态（手动指定而非动态）路由路径。所有从该 PC 到那个 IP/子网的流量都会经由指定的网关 IP。它也可以用来设置一个默认路由。例如，在 IP/子网处使用 0.0.0.0，就可以发送所有包到特定的网关。
- `routed`：控制动态路由的 BSD 守护程序。开机时启动。它运行 RIP 路由协议。只有 root 用户可用。没有 root 权限你不能运行它。
- `gated`：gated 是另一个使用 RIP 协议的路由守护进程。它同时支持 OSPF、EGP 和 RIP 协议。只有 root 用户可用。
- `traceroute`：用于跟踪 IP 包的路由。它每次发送包时都把跳数加 1，从而使得从源地址到目的地之间的所有网关都会返回消息。
- `netstat -rnf inet`：显示 IPv4 的路由表。
- `sysctl net.inet.ip.forwarding=1`：启用包转发（把主机变为路由器）。
- `route add|delete [-net|-host] <destination> <gateway>`：（如 `route add 192.168.20.0/24 192.168.30.4`）添加一条路由。
- `route flush`：删除所有路由。
- `route add -net 0.0.0.0 192.168.10.2`：添加一条默认路由。
- `routed -Pripv2 -Pno_rdisc -d [-s|-q]`：运行 routed 守护进程，使用 RIPv2 协议，不启用 ICMP 自动发现，在前台运行，供给模式或安静模式。
- `route add 224.0.0.0/4 127.0.0.1`：为本地地址定义多播路由。（LCTT 译注：原文存疑）
- `rtquery -n <host>`（LCTT 译注：增加了 host 参数）：查询指定主机上的 RIP 守护进程（手动更新路由表）。

#### 其它

- `nslookup`：向 DNS 服务器查询，将 IP 转为名称，或反之。例如，`nslookup facebook.com` 会给出 facebook.com 的 IP。
- `ftp <host> [port]`（LCTT 译注：原文中 water 应是笔误）：传输文件到指定主机。通常可以使用 登录名 "anonymous" , 密码 "guest" 来登录。
- `rlogin -l <host>`（LCTT 译注：添加了 host 参数）：使用类似 telnet 的虚拟终端登录到主机。

#### 重要文件

- `/etc/hosts`：域名到 IP 地址的映射。
- `/etc/networks`：网络名称到 IP 地址的映射。
- `/etc/protocols`：协议名称到协议编号的映射。
- `/etc/services`：TCP/UDP 服务名称到端口号的映射。

#### 工具和网络性能分析

- `ifconfig <interface> <address> [up]`：启动接口。
- `ifconfig <interface> [down|delete]`：停止接口。
- `ethereal &`：在后台打开 `ethereal` 而非前台。
- `tcpdump -i -vvv`：抓取和分析包的工具。
- `netstat -w [seconds] -I [interface]`：显示网络设置和统计信息。
- `udpmt -p [port] -s [bytes] target_host`：发送 UDP 流量。
- `udptarget -p [port]`：接收 UDP 流量。
- `tcpmt -p [port] -s [bytes] target_host`：发送 TCP 流量。
- `tcptarget -p [port]`：接收 TCP 流量。


#### 交换机

- `ifconfig sl0 srcIP dstIP`：配置一个串行接口（在此前先执行 `slattach -l /dev/ttyd0`，此后执行 `sysctl net.inet.ip.forwarding=1`）
- `telnet 192.168.0.254`：从子网中的一台主机访问交换机。
- `sh ru` 或 `show running-configuration`：查看当前配置。
- `configure terminal`：进入配置模式。
- `exit`：退出当前模式。（LCTT 译注：原文存疑）

#### VLAN

- `vlan n`：创建一个 ID 为 n 的 VLAN。
- `no vlan N`：删除 ID 为 n 的 VLAN。
- `untagged Y`：添加端口 Y 到 VLAN n。
- `ifconfig vlan0 create`：创建 vlan0 接口。
- `ifconfig vlan0 vlan_ID vlandev em0`：把 em0 加入到 vlan0 接口（LCTT 译注：原文存疑），并设置标记为 ID。
- `ifconfig vlan0 [up]`：启用虚拟接口。
- `tagged Y`：为当前 VLAN 的端口 Y 添加标记帧支持。

#### UDP/TCP

- `socklab udp`：使用 UDP 协议运行 `socklab`。
- `sock`：创建一个 UDP 套接字，等效于输入 `sock udp` 和 `bind`。
- `sendto <Socket ID> <hostname> <port #>`：发送数据包。
- `recvfrom <Socket ID> <byte #>`：从套接字接收数据。
- `socklab tcp`：使用 TCP 协议运行 `socklab`。
- `passive`：创建一个被动模式的套接字，等效于 `socklab`，`sock tcp`，`bind`，`listen`。
- `accept`：接受进来的连接（可以在发起进来的连接之前或之后执行）。
- `connect <hostname> <port #>`：等效于 `socklab`，`sock tcp`，`bind`，`connect`。
- `close`：关闭连接。
- `read <byte #>`：从套接字中读取 n 字节。
- `write`：（例如，`write ciao`、`write #10`）向套接字写入 "ciao" 或 10 个字节。

#### NAT/防火墙

- `rm /etc/resolv.conf`：禁止地址解析，保证你的过滤和防火墙规则正确工作。
- `ipnat -f file_name`：将过滤规则写入文件。
- `ipnat -l`：显示活动的规则列表。
- `ipnat -C -F`：重新初始化规则表。
- `map em0 192.168.1.0/24 -> 195.221.227.57/32 em0`：将 IP 地址映射到接口。
- `map em0 192.168.1.0/24 -> 195.221.227.57/32 portmap tcp/udp 20000:50000`：带端口号的映射。
- `ipf -f file_name`：将过滤规则写入文件。
- `ipf -F -a`：重置规则表。
- `ipfstat -I`：当与 -s 选项合用时列出活动的状态条目（LCTT 译注：原文存疑）。

希望这份基础的 Linux 网络命令合集对你有用。欢迎各种问题和建议。

--------------------------------------------------------------------------------

via: https://itsfoss.com/basic-linux-networking-commands

作者：[Abhishek Prakash][a]
译者：[bianjp](https://github.com/bianjp)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[1]: https://drive.google.com/open?id=0By49_3Av9sT1cDdaZnh4cHB4aEk
