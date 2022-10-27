[#]: subject: "A beginner's guide to network management"
[#]: via: "https://opensource.com/article/21/4/network-management"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "ddl-hust"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13374-1.html"

网络管理初学者指南
======

> 了解网络是如何工作的，以及使用开源工具进行网络性能调优的一些窍门。

![](https://img.linux.net.cn/data/attachment/album/202105/09/164127umsevtfspssppmsp.jpg)

大多数人每一天至少会接触到两种类型的网络。当你打开计算机或者移动设备，设备连接到本地 WiFi，本地 WiFi 然后连接到所谓“互联网”的互联网络。

但是网络实际上是如何工作的？你的设备如何能够找到互联网、共享打印机或文件共享？这些东西如何知道响应你的设备？系统管理员用什么措施来优化网络的性能？

开源思想在网络技术领域根深蒂固，因此任何想更多了解网络的人，可以免费获得网络相关的资源。本文介绍了使用开源技术的网络管理相关的基础知识。

### 网络是什么？

计算机网络是由两台或者多台计算机组成的、互相通信的集合。为了使得网络能够工作，网络上一台计算机必须能够找到其他计算机，且通信必须能够从一台计算机到达另外一台。为了解决这一需求，开发和定义了两种不同的通信协议：TCP 和 IP。

#### 用于传输的 TCP 协议

为了使得计算机之间能够通信，它们之间必须有一种传输信息的手段。人说话产生的声音是通过声波来传递的，计算机是通过以太网电缆、无线电波或微波传输的数字信号进行通信的。这方面的规范被正式定义为 [TCP 协议][2]。

#### 用于寻址的 IP 协议

计算机必须有一些识别手段才能相互寻址。当人类相互称呼时，我们使用名字和代名词。当计算机相互寻址时，它们使用 IP 地址，如 `192.168.0.1`，IP 地址可以被映射到名称上，如“Laptop”、“Desktop”、“Tux” 或 “Penguin”。这方面的规范被定义为 [IP 协议][3]。

### 最小配置设置

最简单的网络是一个两台计算机的网络，使用称为“交叉电缆”的特殊布线方式的以太网电缆。交叉电缆将来自一台计算机的信号连接并传输到另一台计算机上的适当受体。还有一些交叉适配器可以将标准的以太网转换为交叉电缆。

![Crossover cable][4]

由于在这两台计算机之间没有路由器，所有的网络管理都必须在每台机器上手动完成，因此这是一个很好的网络基础知识的入门练习。

用一根交叉电缆，你可以把两台计算机连接在一起。因为这两台计算机是直接连接的，没有网络控制器提供指导，所以这两台计算机都不用做什么创建网络或加入网络的事情。通常情况下，这项任务会由交换机和 DHCP 服务器或路由器来提示，但在这个简单的网络设置中，这一切都由你负责。

要创建一个网络，你必须先为每台计算机分配一个 IP 地址，为自行分配而保留的地址从 169.254 开始，这是一个约定俗成的方式，提醒你本 IP 段是一个闭环系统。

#### 找寻网络接口

首先，你必须知道你正在使用什么网络接口。以太网端口通常用 “eth” 加上一个从 0 开始的数字来指定，但有些设备用不同的术语来表示接口。你可以用 `ip` 命令来查询计算机上的接口：

```
$ ip address show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 ...
    link/loopback 00:00:00:00:00:00 brd ...
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> ...
    link/ether dc:a6:32:be:a3:e1 brd ...
3: wlan0: <BROADCAST,MULTICAST> ...
    link/ether dc:a6:32:be:a3:e2 brd ...
```

在这个例子中，`eth0` 是正确的接口名称。然而，在某些情况下，你会看到 `en0` 或 `enp0s1` 或类似的东西，所以在使用设备名称之前，一定要先检查它。

#### 分配 IP 地址

通常情况下，IP 地址是从路由器获得的，路由器在网络上广播提供地址。当一台计算机连接到一个网络时，它请求一个地址。路由器通过介质访问控制（MAC）地址识别设备（注意这个 MAC 与苹果 Mac 电脑无关），并被分配 IP 地址。这就是计算机在网络上找到彼此的方式。

在本文的简单网络中，没有路由器来分配 IP 地址及注册设备，因此我们需要手动分配 IP 地址，使用 `ip` 命令来给计算机分配 IP 地址：

```
$ sudo ip address add 169.254.0.1 dev eth0
```

给另外一台计算机分配 IP 地址，将 IP 地址增 1：

```
$ sudo ip address add 169.254.0.2 dev eth0
```

现在计算机有了交叉电缆作为通信介质，有了独一无二的 IP 地址用来识别身份。但是这个网络还缺少一个重要成分：计算机不知道自己是网络的一部分。

#### 设置路由

路由器另外的一个功能是设置从一个地方到另一个地方的网络路径，称作路由表，路由表可以简单的看作网络的城市地图。

虽然现在我们还没有设置路由表，但是我们可以通过 `route` 命令来查看路由表：

```
$ route
Kernel IP routing table
Destination | Gateway | Genmask | Flags|Metric|Ref | Use | Iface
$
```

同样，你可以通过 `ip` 命令来查看路由表：

```
$ ip route
$
```

通过 `ip` 命令添加一条路由信息：

```
$ sudo ip route \
  add 169.254.0.0/24 \
  dev eth0 \
  proto static
```

这条命令为 `eth0` 接口添加一个地址范围（从 `169.254.0.0` 开始到 `169.254.0.255` 结束）的路由。它将路由协议设置为“静态”，表示作为管理员的你创建了这个路由，作为对该范围内的任何动态路由进行覆盖。

通过 `route` 命令来查询路由表：

```
$ route
Kernel IP routing table
Destination | Gateway | Genmask       | ... | Iface
link-local  | 0.0.0.0 | 255.255.255.0 | ... | eth0
```

或者使用`ip`命令从不同角度来查询路由表：

```
$ ip route
169.254.0.0/24 dev eth0 proto static scope link
```

#### 探测相邻网络

现在，你的网络有了传输方式、寻址方法以及网络路由。你可以联系到你的计算机以外的主机。向另一台计算机发送的最简单的信息是一个 “呯”，这也是产生该信息的命令的名称（`ping`）。

```
$ ping -c1 169.254.0.2
64 bytes from 169.254.0.2: icmp_seq=1 ttl=64 time=0.233 ms

--- 169.254.0.2 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.244/0.244/0.244/0.000 ms
```

你可以通过下面的命令看到与你交互的邻居：

```
$ ip neighbour
169.254.0.2 dev eth0 lladdr e8:6a:64:ac:ef:7c STALE
```

### 通过交换机扩展你的网络

只需要双节点的网络并不多。为了解决这个问题，人们开发了特殊的硬件，称为网络“交换机”。网络交换机允许你将几条以太网电缆连接到它上面，它将消息不加区分地从发送消息的计算机分发到交换机上所有监听的计算机。除了拥有与预期接收者相匹配的 IP 地址的计算机外，其他所有计算机都会忽略该信息。这使得网络变得相对嘈杂，但这是物理上，将一组计算机连接在一起的简单方法。

在大多数现代家庭网络中，用于物理电缆的物理交换机并不实用。所以 WiFi 接入点代替了物理交换机。WiFi 接入点的功能与交换机相同：它允许许多计算机连接到它并在它们之间传递信息。

接入互联网不仅仅是一种期望，它通常是家庭网络存在的原因。没有接入互联网的交换机或 WiFi 接入点不是很有用，但要将你的网络连接到另一个网络，你需要一个路由器。

#### 添加路由器

实际上，本地网络连接了许多设备，并且越来越多的设备具备联网能力，使得网络的规模呈数量级级别增长。

手动配置网络是不切实际的，因此这些任务分配给网络中特定的节点来处理，网络中每台计算机运行一个后台守护进程，以填充从网络上的权威服务器收到的网络设置。家庭网络中，这些工作通常被整合到一个小型嵌入式设备中，通常由你的互联网服务提供商（ISP）提供，称为**路由器**（人们有时错误地将其称为调制解调器）。在一个大型网络中，每项工作通常被分配到一个单独的专用服务器上，以确保专用服务器能够专注于自己的工作以及保证工作弹性。这些任务包括：

- DHCP 服务器，为加入网络的设备分配和跟踪 IP 地址
- DNS 服务器将诸如域名 [redhat.com][7] 转换成 IP 地址 `209.132.183.105`
- [防火墙][8] 保护你的网络免受不需要的传入流量或被禁止的传出流量
- 路由器有效传输网络流量，作为其他网络（如互联网）的网关，并进行网络地址转换（NAT）

你现在的网络上可能有一个路由器，它可能管理着所有这些任务，甚至可能更多。感谢像 VyOS 这样的项目，现在你可以运行 [自己的开源路由器][9]。对于这样一个项目，你应该使用一台专门的计算机，至少有两个网络接口控制器（NIC）：一个连接到你的 ISP，另一个连接到交换机，或者更有可能是一个 WiFi 接入点。

### 扩大你的知识规模

无论你的网络上有多少设备，或你的网络连接到多少其他网络，其原则仍然与你的双节点网络相同。你需要一种传输方式，一种寻址方案，以及如何路由到网络的知识。

### 网络知识速查表

了解网络是如何运作的，对管理网络至关重要。除非你了解你的测试结果，否则你无法排除问题，除非你知道哪些命令能够与你的网络设备交互，否则你无法运行测试。对于重要的网络命令的基本用法以及你可以用它们提取什么样的信息，[请下载我们最新的网络速查表][10]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/network-management

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[ddl-hust](https://github.com/ddl-hust)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/gears_devops_learn_troubleshooting_lightbulb_tips_520.png?itok=HcN38NOk "Tips and gears turning"
[2]: https://tools.ietf.org/html/rfc793
[3]: https://tools.ietf.org/html/rfc791
[4]: https://opensource.com/sites/default/files/uploads/crossover.jpg "Crossover cable"
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/article/17/4/build-your-own-name-server
[7]: http://redhat.com
[8]: https://www.redhat.com/sysadmin/secure-linux-network-firewall-cmd
[9]: https://opensource.com/article/20/1/open-source-networking
[10]: https://opensource.com/downloads/cheat-sheet-networking