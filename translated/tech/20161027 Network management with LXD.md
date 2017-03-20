

# 网络管理（2.3+）

 ![LXD logo](https://linuxcontainers.org/static/img/containers.png) 

### 介绍

当Ubuntu 16.04上发布LXD2.0的时候，LXD网络部分非常简单。你可以使用 “lxdbr0”桥接和“lxd init”在你的物理接口上为你的容器配置一个网络。

虽然这有效，但有点混乱，因为大多数桥配置发生在LXD之外的Ubuntu包装。 这些脚本只能支持单个网桥，并且这些都没有暴露API，使远程配置有点痛苦。

直到LXD 2.3，LXD终于开发了自己的网络管理API和命令行工具来匹配。 这篇文章是对这些新功能的概述。

### 基本网络

开箱即用，LXD 2.3没有配置任何网络。“lxd init” 将在默认情况下为您提供一个并附加到你的新容器。我们可以着手看看这是如何发生的。

随机创建一个IPV4、IPV6子网或者NAT网络并启用，命令如下：

```
stgraber@castiana:~$ lxc network create testbr0
Network testbr0 created
```

你可以查看配置：

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

如果您不想其自动配置子网，你可以执行如下命令：

```
stgraber@castiana:~$ lxc network create testbr0 ipv6.address=none ipv4.address=10.0.3.1/24 ipv4.nat=true
Network testbr0 created
```

结果是：

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

如果一个网络被创建并且运行了，但却没有任何容器使用它。这对你来说没有任何的好处。

将你创建的网络连接到所以的容器，您可以执行如下命令：

```
stgraber@castiana:~$ lxc network attach-profile testbr0 default eth0
```

附加一个网络到一个单独的容器，命令如下：

```
stgraber@castiana:~$ lxc network attach my-container default eth0
```

现在，让我们说说你的机器上安装了openvswitch 并且想将桥接转换成OVS桥接，这仅需要修改驱动属性：

```
stgraber@castiana:~$ lxc network set testbr0 bridge.driver openvswitch
```

如果您想一次做一堆的更改，“lxc network edit”将允许您在文本编辑器中以交互方式编辑网络配置。

### 静态租约和端口安全

使用LXD管理DHCP服务器的DCHP租约非常的简单。你只需要一个容器中特定的网卡和正确的设定权限。

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

对于IPv6也是如此，但是使用“ipv6.address”属性代替。

类似地，如果要防止容器更改其MAC地址或转发任何其他MAC地址的流量（例如嵌套），您可以通过以下方式启用端口安全性：

```
root@yak:~# lxc config device set c1 eth0 security.mac_filtering true
```

### DNS

LXD在桥接环境下运行DNS服务器。在允许您设置网桥的DNS域（“dns.domain”网络属性）之外，它还支持3种不同的操作模式（“dns.mode”）：

*   “managed”将对每个容器有一个DNS记录，匹配其名称和已知的IP地址。 容器无法通过DHCP更改此记录。
*   “dynamic”这个选项让容器可以通过DHCP向DNS进行自注册。因而，在协商阶段，无论容器的主机名是什么，都会在DNS中进行注册。
*   “none”用于简单递归DNS服务器，没有任何类型的本地DNS记录的。

默认模式是“managed”，这也是最安全和最方便的。因为它为容器提供DNS记录，但不允许他们通过在DHCP上发送假主机名来欺骗对方的记录。

### Using tunnels使用隧道

除此之外，LXD还支持使用GRE或VXLAN隧道连接到其他主机。

LXD网络可以连接任意数量的隧道，从而可以轻松创建跨多个主机的网络。 这对开发，测试和演示使用很有用，生产环境通常更喜欢这种分段的VLAN。

所以说，你想要一个基本的“testbr0”网络运行IPv4和IPv6在主机“edfu”上，并希望主机“djanet”生成的容器也使用它。 最简单的方法是使用组播VXLAN隧道。 此类型的隧道仅支持在两个主机位于同一物理段上。

```
root@edfu:~# lxc network create testbr0 tunnel.lan.protocol=vxlan
Network testbr0 created
root@edfu:~# lxc network attach-profile testbr0 default eth0
```

这在主机“edfu”上定义了一个“testbr0”网桥，并在其上设置了一个组播VXLAN隧道，供其他主机加入。 在此设置中，“edfu”将作为该网络的路由器，提供DHCP，DNS，...其他主机将只是通过隧道转发流量。

```
root@djanet:~# lxc network create testbr0 ipv4.address=none ipv6.address=none tunnel.lan.protocol=vxlan
Network testbr0 created
root@djanet:~# lxc network attach-profile testbr0 default eth0
```

现在，您可以在任一主机上启动容器，并查看它们从同一地址池获取IP，并通过隧道直接相互通信。

如前所述，这使用多播，当通过路由器时，这通常不会很好。 对于这些情况，您可以使用单播模式下的VXLAN或一个良好的旧GRE隧道。

要使用GRE加入另一台主机，请首先使用以下命令配置主机：

```
root@edfu:~# lxc network set testbr0 tunnel.nuturo.protocol gre
root@edfu:~# lxc network set testbr0 tunnel.nuturo.local 172.17.16.2
root@edfu:~# lxc network set testbr0 tunnel.nuturo.remote 172.17.16.9
```

客户端主机：

```
root@nuturo:~# lxc network create testbr0 ipv4.address=none ipv6.address=none tunnel.edfu.protocol=gre tunnel.edfu.local=172.17.16.9 tunnel.edfu.remote=172.17.16.2
Network testbr0 created
root@nuturo:~# lxc network attach-profile testbr0 default eth0
```

如果您想使用vxlan：

```
root@edfu:~# lxc network set testbr0 tunnel.edfu.id 10
root@edfu:~# lxc network set testbr0 tunnel.edfu.protocol vxlan
```

和：

```
root@nuturo:~# lxc network set testbr0 tunnel.edfu.id 10
root@nuturo:~# lxc network set testbr0 tunnel.edfu.protocol vxlan
```

此处使用隧道ID，以避免与已配置的多播vxlan隧道冲突。

这就是你如何使用最新版本的LXD轻松实现跨主机网络！

### 结论

LXD现在可以非常容易地定义任何东西，从简单的单主机网络到成千上万个容器的非常复杂的跨主机网络。 它也使得定义一个新的网络只是为一些容器或添加第二个设备到一个容器，连接到一个单独的专用网络变得非常简单。

虽然这篇文章体积了大多数LXD支持的不同功能,但是任然有相当多的设置可以用来微调LXD网络体验。

完整的功能列表请参见： [https://github.com/lxc/lxd/blob/master/doc/configuration.md][2]

# 额外信息

LXD主页：[https://linuxcontainers.org/lxd]

[3]开发者: [https://github.com/lxc/lxd][4]

邮件支持列表: [https://lists.linuxcontainers.org][5]

IRC支持: #lxcontainers on irc.freenode.net

Try LXD 在线: [https://linuxcontainers.org/lxd/try-it][6]

--------------------------------------------------------------------------------

via: https://www.stgraber.org/2016/10/27/network-management-with-lxd-2-3/

作者：[Stéphane Graber][a]
译者：[flankershen](https://github.com/flankershen)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.stgraber.org/author/stgraber/
[1]:https://www.stgraber.org/author/stgraber/
[2]:https://github.com/lxc/lxd/blob/master/doc/configuration.md#network-configuration
[3]:https://linuxcontainers.org/lxd
[4]:https://github.com/lxc/lxd
[5]:https://lists.linuxcontainers.org/
[6]:https://linuxcontainers.org/lxd/try-it
[7]:https://www.stgraber.org/2016/10/27/network-management-with-lxd-2-3/
