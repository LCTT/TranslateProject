使用 Quagga 实现 Linux 动态路由
============================================================


![network](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/network_visualization.png?itok=P3Ve7eO1 "network")
学习如何使用 Quagga 套件的路由协议去管理动态路由。[Creative Commons Attribution][1][Wikimedia Commons: Martin Grandjean][2]

迄今为止，本系列文章中，我们已经在 [Linux 局域网路由新手指南：第 1 部分][4] 中学习了复杂的 IPv4 地址，在  [Linux 局域网路由新手指南：第 2 部分][5] 中学习了如何去手工创建静态路由。

今天，我们继续使用 [Quagga][6] 去管理动态路由，这是一个安装完后就不用理它的的软件。Quagga 是一个支持 OSPFv2、OSPFv3、RIP v1 和 v2、RIPng、以及 BGP-4 的路由协议套件，并全部由 zebra 守护程序管理。

OSPF 的意思是最短路径优先。OSPF 是一个内部网关协议（IGP）;它可以用在局域网和跨因特网的局域网互联中。在你的网络中的每个 OSPF 路由器都包含整个网络的拓扑，并计算通过网络的最短路径。OSPF 会通过多播的方式自动对外传播它检测到的网络变化。你可以将你的网络分割为区域，以保持路由表的可管理性；每个区域的路由器只需要知道离开它的区域的下一跳接口地址，而不用记录你的网络的整个路由表。

RIP，路由信息协议，是一个很老的协议，RIP 路由器向网络中周期性多播它的整个路由表，而不是像 OSPF 那样只多播网络的变化。RIP 通过跳数来测量路由，任何超过 15 跳的路由它均视为不可到达。RIP 设置很简单，但是 OSPF 在速度、效率、以及弹性方面更佳。

BGP-4 是边界网关协议版本 4。这是用于因特网流量路由的外部网关协议（EGP）。你不会用到 BGP 协议的，除非你是因特网服务提供商。

### 准备使用 OSPF

在我们的小型 KVM 测试实验室中，用两台虚拟机表示两个不同的网络，然后将另一台虚拟机配置为路由器。创建两个网络：net1 是 192.168.110.0/24 而 net2 是 192.168.120.0/24。启用 DHCP 是明智的，否则你要分别进入这三个虚拟机，去为它们设置静态地址。Host 1 在 net1 中，Host 2 在 net2 中，而路由器同时与这两个网络连接。设置 Host 1 的网关地址为 192.168.110.126，Host 2 的网关地址为 192.168.120.136。

*   Host 1： 192.168.110.125

*   Host 2：192.168.120.135

*   Router：192.168.110.126 和 192.168.120.136

在路由器上安装 Quagga。在大多数 Linux 中它是一个 quagga 包。在 Debian 上还有一个单独的文档包 quagga-doc。取消 `/etc/sysctl.conf` 配置文件中如下这一行的注释去启用包转发功能：

```
net.ipv4.ip_forward=1
```

然后，运行 `sysctl -p` 命令让变化生效。

### 配置 Quagga

查看你的 Quagga 包中的示例配置文件，比如，`/usr/share/doc/quagga/examples/ospfd.conf.sample`。除非你的 Linux 版本按你的喜好做了创新，否则，一般情况下配置文件应该在 `/etc/quagga` 目录中。大多数 Linux 版本在这个目录下有两个文件，`vtysh.conf`  和 `zebra.conf`。它们提供了守护程序运行所需要的最小配置。除非你的发行版做了一些特殊的配置，否则，zebra 总是首先运行，当你启动 ospfd 的时候，它将自动启动。Debian/Ubuntu 是一个特例，稍后我们将会说到它。

每个路由器守护程序将读取它自己的配置文件，因此，我们必须创建 `/etc/quagga/ospfd.conf`，并输入如下内容：

```
!/etc/quagga/ospfd.conf
hostname router1
log file /var/log/quagga/ospfd.log
router ospf
 ospf router-id 192.168.110.15
 network 192.168.110.0/0 area 0.0.0.0
 network 192.168.120.0/0 area 0.0.0.0
access-list localhost permit 127.0.0.1/32
access-list localhost deny any
line vty
  access-class localhost
```

你可以使用感叹号（！）或者井号（#）去注释掉这些行。我们来快速浏览一下这些选项。

*   **hostname** 是你希望的任何内容。这里不是一般意义上的 Linux 主机名，但是，当你使用 `vtysh` 或者 `telnet` 登入时，你将看到它们。

*   **log file** 是你希望用于保存日志的任意文件。

*   **router** 指定路由协议。

*   **ospf router-id** 是任意的 32 位数字。使用路由器的一个 IP 地址就是很好的选择。

*   **network** 定义你的路由器要通告的网络。

*   **access-list** 限制 `vtysh` 登入，它是 Quagga 命令行 shell，它允许本地机器登入，并拒绝任何远程管理。

### Debian/Ubuntu

在你启动守护程序之前，Debian/Ubuntu 相对其它的 Debian 衍生版可能多需要一步到多步。编辑 `/etc/quagga/daemons` ，除了 `zebra`=yes 和 `ospfd=yes` 外，使其它所有的行的值为 `no`。

然后，在 Debian 上运行 `ospfd` 去启动 Quagga：

```
# systemctl start quagga
```

在大多数的其它 Linux 上，包括 Fedora 和 openSUSE，用如下命令启动 `ospfd`：

```
# systemctl start ospfd
```

现在，Host 1 和 Host 2 将可以互相 ping 通对方和路由器。

这里用了许多篇幅去描述非常简单的设置。在现实中，路由器将连接两个交换机，然后为连接到这个交换机上的所有电脑提供一个网关。你也可以在你的路由器上添加更多的网络接口，这样你的路由器就可以为更多的网络提供路由服务，或者也可以直接连接到其它路由器上，或者连接到连接其它路由器的骨干网络上。

你或许不愿意如此麻烦地手工配置网络接口。最简单的方法是使用你的 DHCP 服务器去宣告你的路由器。如果你使用了 Dnsmasq，那么你就有了一个 DHCP 和 DNS 的一体化解决方案。

还有更多的配置选项，比如，加密的密码保护。更多内容请查看 [Quagga 路由套件][7] 的官方文档。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/3/dynamic-linux-routing-quagga

作者：[CARLA SCHRODER ][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/licenses/category/creative-commons-attribution
[2]:https://commons.wikimedia.org/wiki/File:Network_Visualization.png
[3]:https://www.linux.com/files/images/networkvisualizationpng
[4]:https://www.linux.com/learn/intro-to-linux/2018/2/linux-lan-routing-beginners-part-1
[5]:https://www.linux.com/learn/intro-to-linux/2018/3/linux-lan-routing-beginners-part-2
[6]:https://www.quagga.net/
[7]:https://www.quagga.net/
