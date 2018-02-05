在 LXD 2.3 及以上版本中管理网络
===========

![LXD logo](https://linuxcontainers.org/static/img/containers.png) 

### 介绍


当 LXD 2.0 随着 Ubuntu 16.04 一起发布时，LXD 联网就简单了。要么你可以使用 `lxd init` 来配置，为你的容器自己提供一个  “lxdbr0” 网桥，要么使用一个已存在的物理接口。

虽然这确实有效，但是有点混乱，因为大部分的桥接配置发生在 Ubuntu 打包的 LXD 之外。那些脚本只能支持一个桥接，并且没有通过 API 暴露，这使得远程配置有点痛苦。

直到 LXD 2.3，LXD 终于发展了自己的网络管理 API ，并有相应的命令行工具。这篇文章试图来简述这些新的功能。

### 基础联网

在初始情况下，LXD 2.3 没有定义任何网络。`lxd init` 会为你设置一个，并且默认情况下将所有新的容器连接到它，但是让我们亲手尝试看下究竟发生了些什么。

要创建一个新的带有随机 IPv4 和 IP6 子网，并启用 NAT 的网络，只需要运行：

```
stgraber@castiana:~$ lxc network create testbr0
Network testbr0 created
```

你可以如下查看它的配置：

```
stgraber@castiana:~$ lxc network show testbr0
name: testbr0
config:
 ipv4.address: 10.150.19.1/24
 ipv4.nat: "true"
 ipv6.address: fd42:474b:622d:259d::1/64
 ipv6.nat: "true"
managed: true
type: bridge
usedby: []
```

如果你不想要那些自动配置的子网，你可以这么做：

```
stgraber@castiana:~$ lxc network create testbr0 ipv6.address=none ipv4.address=10.0.3.1/24 ipv4.nat=true
Network testbr0 created
```

那就会这样：

```
stgraber@castiana:~$ lxc network show testbr0
name: testbr0
config:
 ipv4.address: 10.0.3.1/24
 ipv4.nat: "true"
 ipv6.address: none
managed: true
type: bridge
usedby: []
```

如果你的容器没有使用它，那么创建的网络对你也没什么用。要将你新创建的网络连接到所有容器，你可以这么做：


```
stgraber@castiana:~$ lxc network attach-profile testbr0 default eth0
```

要将一个网络连接到一个已存在的容器中，你可以这么做：

```
stgraber@castiana:~$ lxc network attach my-container default eth0
```

现在，假设你已经在机器中安装了 openvswitch，并且要将这个网桥转换成 OVS 网桥，只需更改为正确的驱动：

```
stgraber@castiana:~$ lxc network set testbr0 bridge.driver openvswitch
```

如果你想要一次性做一系列修改。`lxc network edit` 可以让你在编辑器中交互编辑网络配置。

### 静态租约及端口安全

使用 LXD 管理 DHCP 服务器的一个好处是可以使得管理 DHCP 租约很简单。你所需要的是一个容器特定的网卡设备以及正确的属性设置。

```
root@yak:~# lxc init ubuntu:16.04 c1
Creating c1
root@yak:~# lxc network attach testbr0 c1 eth0
root@yak:~# lxc config device set c1 eth0 ipv4.address 10.0.3.123
root@yak:~# lxc start c1
root@yak:~# lxc list c1
+------+---------+-------------------+------+------------+-----------+
| NAME |  STATE  |        IPV4       | IPV6 |    TYPE    | SNAPSHOTS |
+------+---------+-------------------+------+------------+-----------+
|  c1  | RUNNING | 10.0.3.123 (eth0) |      | PERSISTENT | 0         |
+------+---------+-------------------+------+------------+-----------+
```

IPv6 也是相同的方法，但是换成 `ipv6.address` 属性。

相似地，如果你想要阻止你的容器更改它的 MAC 地址或者为其他 MAC 地址转发流量（比如嵌套），你可以用下面的命令启用端口安全：

```
root@yak:~# lxc config device set c1 eth0 security.mac_filtering true
```

### DNS

LXD 在网桥上运行 DNS 服务器。除了设置网桥的 DNS 域（ `dns.domain` 网络属性）之外，还支持 3 种不同的操作模式（`dns.mode`）：

* `managed` ：每个容器都会有一条 DNS 记录，匹配它的名字以及已知的 IP 地址。容器无法通过 DHCP 改变这条记录。
* `dynamic` ：允许容器通过 DHCP 在 DNS 中自行注册。因此，在 DHCP 协商期间容器发送的任何主机名最终都出现在 DNS 中。
* `none` ： 针对那些没有任何本地 DNS 记录的递归 DNS 服务器。

默认的模式是 `managed`，并且典型的是最安全以及最方便的，因为它为容器提供了 DNS 记录，但是不允许它们通过 DHCP 发送虚假主机名嗅探其他的记录。

### 使用隧道

除了这些，LXD 还支持使用 GRE 或者 VXLAN 隧道连接到其他主机。

LXD 网络可以连接任何数量的隧道，从而轻松地创建跨多个主机的网络。这对于开发、测试和演示非常有用，生产环境通常更喜欢使用 VLAN 进行分割。

所以说，你想在主机 “edfu” 上有一个运行 IPv4 和 IPv6 的基础 “testbr0” 网络，并希望在主机 “djanet” 上使用它来生成容器。最简单的方法是使用组播 VXLAN 隧道。这种类型的隧道仅在两个主机位于同一物理段上时才起作用。


```
root@edfu:~# lxc network create testbr0 tunnel.lan.protocol=vxlan
Network testbr0 created
root@edfu:~# lxc network attach-profile testbr0 default eth0
```

它在主机 “edfu” 上定义了一个 “testbr0” 桥接，并为其他主机能加入它设置了一个组播 VXLAN。在这个设置中，“edfu” 为这个网络扮演了一个路由器角色，提供 DHCP、DNS 等等，其他主机只是通过隧道转发流量。

```
root@djanet:~# lxc network create testbr0 ipv4.address=none ipv6.address=none tunnel.lan.protocol=vxlan
Network testbr0 created
root@djanet:~# lxc network attach-profile testbr0 default eth0
```

现在你可以在任何一台主机上启动容器，并看到它们从同一个地址池中获取 IP，通过隧道直接互相通讯。

如先前所述，这个使用了组播，它通常在跨越路由器时无法很好工作。在这些情况下，你可以用单播模式使用 VXLAN 或者 GRE 隧道。

要使用 GRE 加入另一台主机，首先配置服务主机：

```
root@edfu:~# lxc network set testbr0 tunnel.nuturo.protocol gre
root@edfu:~# lxc network set testbr0 tunnel.nuturo.local 172.17.16.2
root@edfu:~# lxc network set testbr0 tunnel.nuturo.remote 172.17.16.9
```

接着是“客户端”主机：

```
root@nuturo:~# lxc network create testbr0 ipv4.address=none ipv6.address=none tunnel.edfu.protocol=gre tunnel.edfu.local=172.17.16.9 tunnel.edfu.remote=172.17.16.2
Network testbr0 created
root@nuturo:~# lxc network attach-profile testbr0 default eth0
```

如果你像使用 VXLAN，只要这么做：

```
root@edfu:~# lxc network set testbr0 tunnel.edfu.id 10
root@edfu:~# lxc network set testbr0 tunnel.edfu.protocol vxlan
```

还有：

```
root@nuturo:~# lxc network set testbr0 tunnel.edfu.id 10
root@nuturo:~# lxc network set testbr0 tunnel.edfu.protocol vxlan
```

这里需要隧道 id 以防与已经配置的多播 VXLAN 隧道冲突。

这就是如何使用最近的 LXD 简化跨主机联网了！

### 总结

LXD 使得从简单的单主机网络到数千个容器的非常复杂的跨主机网络的定义变得更加容易。它也使为一些容器定义一个新网络或者给容器添加第二个设备，并连接到隔离的私有网络变得很简单。

虽然这篇文章介绍了支持的大部分功能，但仍有一些可以微调 LXD 网络体验的窍门。可以在这里找到完整的列表：[https://github.com/lxc/lxd/blob/master/doc/configuration.md][2] 。

### 额外信息

- LXD 主站：[https://linuxcontainers.org/lxd][3]
- Github 地址： [https://github.com/lxc/lxd][4]
- 邮件列表支持：[https://lists.linuxcontainers.org][5]
- IRC 频道：#lxcontainers on irc.freenode.net
- 在线尝试 LXD：[https://linuxcontainers.org/lxd/try-it][6]

--------------------------------------------------------------------------------

via: https://www.stgraber.org/2016/10/27/network-management-with-lxd-2-3/

作者：[Stéphane Graber][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.stgraber.org/author/stgraber/
[1]:https://www.stgraber.org/author/stgraber/
[2]:https://github.com/lxc/lxd/blob/master/doc/configuration.md#network-configuration
[3]:https://linuxcontainers.org/lxd
[4]:https://github.com/lxc/lxd
[5]:https://lists.linuxcontainers.org/
[6]:https://linuxcontainers.org/lxd/try-it
[7]:https://www.stgraber.org/2016/10/27/network-management-with-lxd-2-3/
