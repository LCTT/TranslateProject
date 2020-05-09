[#]: collector: (lujun9972)
[#]: translator: (messon007)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12199-1.html)
[#]: subject: (Create a SDN on Linux with open source)
[#]: via: (https://opensource.com/article/20/4/quagga-linux)
[#]: author: (M Umer https://opensource.com/users/noisybotnet)

在 Linux 上使用开源软件创建 SDN
======

> 使用开源路由协议栈 Quagga，使你的 Linux 系统成为一台路由器。

![](https://img.linux.net.cn/data/attachment/album/202005/09/093541rqx3zr5dxn3yvnq6.jpg)

网络路由协议分为两大类：内部网关协议和外部网关协议。路由器使用内部网关协议在单个自治系统内共享信息。如果你用的是 Linux，则可以通过开源（GPLv2）路由协议栈 [Quagga][2] 使其表现得像一台路由器。

### Quagga 是什么？

Quagga 是一个[路由软件包][3]，并且是 [GNU Zebra][4] 的一个分支。它为类 Unix 平台提供了所有主流路由协议的实现，例如开放最短路径优先（OSPF），路由信息协议（RIP），边界网关协议（BGP）和中间系统到中间系统协议（IS-IS）。

尽管 Quagga 实现了 IPv4 和 IPv6 的路由协议，但它并不是一个完整的路由器。一个真正的路由器不仅实现了所有路由协议，而且还有转发网络流量的能力。 Quagga 仅仅实现了路由协议栈，而转发网络流量的工作由 Linux 内核处理。

### 架构

Quagga 通过特定协议的守护程序实现不同的路由协议。守护程序名称与路由协议相同，加了字母“d”作为后缀。Zebra 是核心，也是与协议无关的守护进程，它为内核提供了一个[抽象层][5]，并通过 TCP 套接字向 Quagga 客户端提供 Zserv API。每个特定协议的守护程序负责运行相关的协议，并基于交换的信息来建立路由表。

![Quagga architecture][6]

### 环境

本教程通过 Quagga 实现的 OSPF 协议来配置动态路由。该环境包括两个名为 Alpha 和 Beta 的 CentOS  7.7 主机。两台主机共享访问 **192.168.122.0/24** 网络。

**主机 Alpha：**

IP：192.168.122.100/24
网关：192.168.122.1

**主机 Beta：**

IP：192.168.122.50/24
网关：192.168.122.1

### 安装软件包

首先，在两台主机上安装 Quagga 软件包。它存在于 CentOS 基础仓库中：

```
yum install quagga -y
```

### 启用 IP 转发

接下来，在两台主机上启用 IP 转发，因为它将由 Linux 内核来执行：

```
sysctl -w net.ipv4.ip_forward = 1
sysctl -p
```

### 配置

现在，进入 `/etc/quagga` 目录并为你的设置创建配置文件。你需要三个文件：

* `zebra.conf`：Quagga 守护程序的配置文件，你可以在其中定义接口及其 IP 地址和 IP 转发
* `ospfd.conf`：协议配置文件，你可以在其中定义将通过 OSPF 协议提供的网络
* `daemons`：你将在其中指定需要运行的相关的协议守护程序

在主机 Alpha 上，

```
 [root@alpha]# cat /etc/quagga/zebra.conf
interface eth0
 ip address 192.168.122.100/24
 ipv6 nd suppress-ra
interface eth1
 ip address 10.12.13.1/24
 ipv6 nd suppress-ra
interface lo
ip forwarding
line vty

[root@alpha]# cat /etc/quagga/ospfd.conf
interface eth0
interface eth1
interface lo
router ospf
 network 192.168.122.0/24 area 0.0.0.0
 network 10.12.13.0/24 area 0.0.0.0
line vty

[root@alphaa ~]# cat /etc/quagga/daemons
zebra=yes
ospfd=yes
```

在主机 Beta 上，

```
[root@beta quagga]# cat zebra.conf
interface eth0
 ip address 192.168.122.50/24
 ipv6 nd suppress-ra
interface eth1
 ip address 10.10.10.1/24
 ipv6 nd suppress-ra
interface lo
ip forwarding
line vty

[root@beta quagga]# cat ospfd.conf
interface eth0
interface eth1
interface lo
router ospf
 network 192.168.122.0/24 area 0.0.0.0
 network 10.10.10.0/24 area 0.0.0.0
line vty

[root@beta ~]# cat /etc/quagga/daemons
zebra=yes
ospfd=yes
```

### 配置防火墙

要使用 OSPF 协议，必须允许它通过防火墙：

```
firewall-cmd --add-protocol=ospf –permanent

firewall-cmd –reload
```

现在，启动 `zebra` 和 `ospfd` 守护程序。

```
# systemctl start zebra
# systemctl start ospfd
```

用下面命令在两个主机上查看路由表:

```
[root@alpha ~]# ip route show  
default via 192.168.122.1 dev eth0 proto static metric 100
10.10.10.0/24 via 192.168.122.50 dev eth0 proto zebra metric 20
10.12.13.0/24 dev eth1 proto kernel scope link src 10.12.13.1
192.168.122.0/24 dev eth0 proto kernel scope link src 192.168.122.100 metric 100
```

你可以看到 Alpha 上的路由表包含通过 **192.168.122.50** 到达 **10.10.10.0/24** 的路由项，它是通过协议 zebra 获取的。同样，在主机 Beta 上，该表包含通过 **192.168.122.100** 到达网络 **10.12.13.0/24** 的路由项。

```
[root@beta ~]# ip route show
default via 192.168.122.1 dev eth0 proto static metric 100
10.10.10.0/24 dev eth1 proto kernel scope link src 10.10.10.1
10.12.13.0/24 via 192.168.122.100 dev eth0 proto zebra metric 20
192.168.122.0/24 dev eth0 proto kernel scope link src 192.168.122.50 metric 100
```

### 结论

如你所见，环境和配置相对简单。要增加复杂性，你可以向路由器添加更多网络接口，以为更多网络提供路由。你也可以使用相同的方法来实现 BGP 和 RIP 协议。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/quagga-linux

作者：[M Umer][a]
选题：[lujun9972][b]
译者：[messon007](https://github.com/messon007)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/noisybotnet
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: https://www.quagga.net/
[3]: https://en.wikipedia.org/wiki/Quagga_(software)
[4]: https://www.gnu.org/software/zebra/
[5]: https://en.wikipedia.org/wiki/Abstraction_layer
[6]: https://opensource.com/sites/default/files/uploads/quagga_arch.png (Quagga architecture)
