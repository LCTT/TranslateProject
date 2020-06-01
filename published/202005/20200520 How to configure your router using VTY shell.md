[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12268-1.html)
[#]: subject: (How to configure your router using VTY shell)
[#]: via: (https://opensource.com/article/20/5/vty-shell)
[#]: author: (M Umer https://opensource.com/users/noisybotnet)

如何使用 VTY Shell 配置路由器
======

> FRR（free range routing）给了你实现多种协议的选择。本指南将帮助你入门。

![](https://img.linux.net.cn/data/attachment/album/202005/31/122310xi9aag5iqihqgcxl.jpg)

最近，我写了一篇文章，解释了如何使用 [Quagga][2] 路由套件实现<ruby>开放式最短路径优先<rt>Open Shortest Path First</rt></ruby>（OSPF）。可以使用多个软件套件代替 Quagga 来实现不同的路由协议。其中一种是 FRR（free range routing）。

### FRR

[FRR][3] 是一个路由软件套件，它衍生自 Quagga，并在 GNU GPL2 许可下分发。与 Quagga 一样，它为类 Unix 平台提供了所有主要路由协议的实现，例如 OSPF、<ruby>路由信息协议<rt>Routing Information Protocol</rt></ruby>（RIP）、<ruby>边界网关协议<rt>Border Gateway Protocol</rt></ruby>（BGP） 和<ruby>中间系统到中间系统<rt>Intermediate system-to-intermediate system</rt></ruby> （IS-IS）。

开发了 Quagga 的一些公司，例如 Big Switch Networks、Cumulus、Open Source Routing 和 6wind，创建了 FRR 以在 Quagga 的良好基础上进行改善。

#### 体系结构

FRR 是一组守护进程，它们可以共同构建路由表。每个主协议都在其自己的守护进程中实现，并且这些守护进程与独立于协议的核心守护进程 Zebra 通信，后者提供内核路由表更新、接口查找以及不同路由协议之间路由的重新分配。每个特定协议的守护进程负责运行相关协议并根据交换的信息构建路由表。

![FRR architecture][4]

### VTY shell

[VTYSH][5] 是 FRR 路由引擎的集成 shell。它将每个守护进程中定义的所有 CLI 命令合并，并在单个 shell 中将它们呈现给用户。它提供了类似于 Cisco 的命令行模式，并且许多命令与 Cisco IOS 命令相似。CLI 有不同的模式，某些命令仅在特定模式下可用。

### 设置

在本教程中，我们将使用 FRR 配置动态路由来实现路由信息协议（RIP）。我们可以通过两种方式来做到这一点：在编辑器中编辑协议守护进程配置文件或使用 VTY Shell。在此例中，我们将使用 VTY shell。我们的设置包括两个名为 Alpha 和 Beta 的 CentOS 7.7 主机。这两台主机都有两个网络接口，并共享对 192.168.122.0/24 网络的访问。我们将广播 10.12.11.0/24 和 10.10.10.0/24 网络的路由。

对于主机 Alpha：

* eth0 IP：192.168.122.100/24
* 网关：192.168.122.1
* eth1 IP：10.10.10.12/24

对于主机 Beta：

* eth0 IP：192.168.122.50/24
* 网关：192.168.122.1
* eth1 IP：10.12.11.12/24

#### 安装软件包

首先，我们需要在两台主机上都安装 FRR 软件包。可以按照[官方 FRR 文档][6]中的说明进行操作。

#### 启用 IP 转发

对于路由，我们需要在两台主机上都启用 IP 转发，因为这将由 Linux 内核执行：

```
sysctl -w net.ipv4.conf.all.forwarding = 1
sysctl -w net.ipv6.conf.all.forwarding = 1
sysctl -p
```

#### 启用 RIPD 守护进程

安装后，所有配置文件将保存在 `/etc/frr` 目录中。 必须通过编辑 `/etc/frr/daemons` 文件显式启用守护进程。该文件确定启动 FRR 服务时激活哪些守护进程。要启用特定的守护进程，只需将相应的 `no` 改为 `yes`。之后的服务重启将启动守护进程。

![FRR daemon restart][7]

#### 防火墙配置

由于 RIP 协议使用 UDP 作为传输协议，并被分配了 520 端口，因此我们需要在 `firewalld` 配置中允许该端口。

```
firewall-cmd --add-port=520/udp –permanent
firewalld-cmd -reload
```

现在，我们可以使用以下命令启动 FRR 服务：

```
systemctl start frr
```

#### 使用 VTY 进行配置

现在，我们需要使用 VTY Shell 配置 RIP。

在主机 Alpha 上：

```
[root@alpha ~]# vtysh

Hello, this is FRRouting (version 7.2RPKI).
Copyright 1996-2005 Kunihiro Ishiguro, et al.

alpha# configure terminal
alpha(config)# router rip
alpha(config-router)# network 192.168.122.0/24
alpha(config-router)# network 10.10.10.0/24
alpha(config-router)# route 10.10.10.5/24
alpha(config-router)# do write
Note: this version of vtysh never writes vtysh.conf
Building Configuration...
Configuration saved to /etc/frr/ripd.conf
Configuration saved to /etc/frr/staticd.conf
alpha(config-router)# do write memory
Note: this version of vtysh never writes vtysh.conf
Building Configuration...
Configuration saved to /etc/frr/ripd.conf
Configuration saved to /etc/frr/staticd.conf
alpha(config-router)# exit
```

类似地，在主机 Beta 上：

```
[root@beta ~]# vtysh

Hello, this is FRRouting (version 7.2RPKI).
Copyright 1996-2005 Kunihiro Ishiguro, et al.

beta# configure terminal
beta(config)# router rip
beta(config-router)# network 192.168.122.0/24
beta(config-router)# network 10.12.11.0/24
beta(config-router)# do write
Note: this version of vtysh never writes vtysh.conf
Building Configuration...
Configuration saved to /etc/frr/zebra.conf
Configuration saved to /etc/frr/ripd.conf
Configuration saved to /etc/frr/staticd.conf
beta(config-router)# do write memory
Note: this version of vtysh never writes vtysh.conf
Building Configuration...
Configuration saved to /etc/frr/zebra.conf
Configuration saved to /etc/frr/ripd.conf
Configuration saved to /etc/frr/staticd.conf
beta(config-router)# exit
```

完成后，像下面这样检查两台主机路由：

```
[root@alpha ~]# ip route show
default via 192.168.122.1 dev eth0 proto static metric 100
10.10.10.0/24 dev eth1 proto kernel scope link src 10.10.10.12 metric 101
10.12.11.0/24 via 192.168.122.50 dev eth0 proto 189 metric 20
192.168.122.0/24 dev eth0 proto kernel scope link src 192.168.122.100 metric 100
```

我们可以看到 Alpha 上的路由表通过 `192.168.122.50` 包含了 `10.12.11.0/24` 的条目，它是通过 RIP 提供的。

类似地，在 Beta 上，该表通过 `192.168.122.100` 包含了 `10.10.10.0/24` 的条目。

```
[root@beta ~]# ip route show
default via 192.168.122.1 dev eth0 proto static metric 100
10.10.10.0/24 via 192.168.122.100 dev eth0 proto 189 metric 20
10.12.11.0/24 dev eth1 proto kernel scope link src 10.12.11.12 metric 101
192.168.122.0/24 dev eth0 proto kernel scope link src 192.168.122.50 metric 100
```

### 总结

如你所见，设置和配置相对简单。要增加复杂性，我们可以向路由器添加更多的网络接口，以为更多的网络提供路由。可以在编辑器中编辑配置文件来进行配置，但是使用 VTY Shell 在单个组合会话中为我们提供了所有 FRR 守护进程的前端。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/vty-shell

作者：[M Umer][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/noisybotnet
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/connections_wires_sysadmin_cable.png?itok=d5WqHmnJ (Multi-colored and directional network computer cables)
[2]: https://linux.cn/article-12199-1.html
[3]: https://en.wikipedia.org/wiki/FRRouting
[4]: https://opensource.com/sites/default/files/uploads/frr_architecture.png (FRR architecture)
[5]: http://docs.frrouting.org/projects/dev-guide/en/latest/vtysh.html
[6]: http://docs.frrouting.org/projects/dev-guide/en/latest/building-frr-for-centos7.html
[7]: https://opensource.com/sites/default/files/uploads/frr_daemon_restart.png (FRR daemon restart)
