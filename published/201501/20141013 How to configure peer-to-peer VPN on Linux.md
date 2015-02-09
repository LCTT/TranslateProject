如何在 Linux 上配置点对点 VPN
================================================================================
一个传统的 VPN（如 OpenVPN、PPTP）由一个 VPN 服务器和一个或多个连接到这台服务器的客户端组成。当任意两个 VPN 客户端彼此通信时，VPN 服务器需要中继它们之间的 VPN 数据流量。这样一个中心辐射型的 VPN 拓扑结构存在的问题是，当连接的客户端增多以后，VPN 服务器很容易成为一个性能上的瓶颈。从某种意义上来说，中心化的 VPN 服务器也同样成为一个单点故障的来源，也就是当 VPN 服务器出现故障的时候，整个 VPN 都将无法被任何 VPN 客户端访问。

点对点 VPN（又称 P2P VPN）是另一个 VPN 模型，它能解决传统的基于服务器-客户端模型的 VPN 存在的这些问题。一个 P2P VPN 中不再有一个中心的 VPN 服务器，任何拥有一个公开 IP 地址的节点都能引导其他节点进入 VPN。当连接到一个 VPN 之后，每一个节点都能与 VPN 中的任何其他节点直接通信，而不需要经过一个中间的服务器节点。当然任何节点出现故障时，VPN 中的剩余节点不会受到影响。节点中的延迟、带宽以及 VPN 扩展性在这样的设定中都有自然的提升，当你想要使用 VPN 进行多人游戏或者与许多朋友分享文件时，这都是十分理想的。

开源的 P2P VPN 实现已经有几个了，比如 [Tinc][1]、peerVPN，以及 [n2n][2]。在本教程中，我将会展示**如何在 Linux 上用** n2n **配置点对点 VPN**。

n2n 是一个开源（GPLv3）软件，它允许你在用户间构建一个加密的 2/3 层点对点 VPN。由 n2n 构建的 VPN 是“对 NAT 友好”的，也就是说，不同 NAT 路由器后方的两个用户可以通过 VPN 直接与对方通信。n2n 支持对称的 NAT 类型，这是 NAT 中限制最多的一种。因此，n2n 的 VPN 数据流量是用 UDP 封装的。

一个 n2n VPN 由两类节点组成：边缘（edge）节点和超级（super）节点。一个边缘节点是一台连接到 VPN 的电脑，它可能在一个 NAT 路由器后方。一个超级节点则是拥有一个可以公共访问的 IP 地址的电脑，它将会帮助 NAT 后方的边缘节点进行初始通信。想要在用户中创建一个 P2P VPN 的话，我们需要至少一个超级节点。

![](https://farm3.staticflickr.com/2948/15460916306_fc18fd9d76_o.png)

### 准备工作 ###

在这篇教程中，我将会创建一个拥有 3 个节点的 P2P VPN：一个超级节点和两个边缘节点。唯一的要求是，边缘节点需要能够 ping 通超级节点的 IP 地址，而它们是否在 NAT 路由器之后则没有什么关系。

### 在 Linux 上安装 n2n ###

若想用 n2n 构建一个 P2P VPN，你需要在每个节点上安装 n2n，包括超级节点。

由于它非常精简的依赖需求，在大多数 Linux 平台上 n2n 都能被轻松编译。

在基于 Debian 的系统上安装 n2n：

    $ sudo apt-get install subversion build-essential libssl-dev
    $ svn co https://svn.ntop.org/svn/ntop/trunk/n2n
    $ cd n2n/n2n_v2
    $ make
    $ sudo make install 

在基于 Red Hat 的系统上安装 n2n：

    $ sudo yum install subversion gcc-c++ openssl-devel
    $ svn co https://svn.ntop.org/svn/ntop/trunk/n2n
    $ cd n2n/n2n_v2
    $ make
    $ sudo make install 

### 用 n2n 配置一个 P2P VPN ###

如前文所述，我们需要至少一个超级节点，它将会作为一个初始化引导服务器。我们假设这个超级节点的 IP 地址是 1.1.1.1。

#### 超级节点： ####

在一个作为超级节点的电脑上运行下面的命令。其中“-l <端口>”指定超级节点的监听端口。运行 supernode 并不需要 root 权限。

    $ supernode -l 5000 

#### 边缘节点： ####

在每个边缘节点上，使用下面的命令来连接到一个 P2P VPN。edge 守护程序将会在后台运行。

边缘节点 #1：

     $ sudo edge -d edge0 -a 10.0.0.10 -c mynetwork -u 1000 -g 1000 -k password -l 1.1.1.1:5000 -m ae:e0:4f:e7:47:5b 

边缘节点 #2：

     $ sudo edge -d edge0 -a 10.0.0.11 -c mynetwork -u 1000 -g 1000 -k password -l 1.1.1.1:5000 -m ae:e0:4f:e7:47:5c 

下面是对命令行的一些解释：

- “-d <接口名>”选项指定了由 edge 命令创建的 TAP 接口的名字。
- “-a <IP地址>”选项（静态地）指定了分配给 TAP 接口的 VPN 的 IP 地址。如果你想要使用 DHCP，你需要在其中一台边缘节点上配置一台 DHCP 服务器，然后使用“-a dhcp:0.0.0.0”选项来代替。
- “-c <组名>”选项指定了 VPN 组的名字（最大长度为 16 个字节）。这个选项可以被用来在同样一组节点中创建多个 VPN。
- “-u”和“-g”选项被用来在创建一个 TAP 接口后降权放弃 root 权限。edge 守护进程将会作为指定的用户/组 ID 运行。
- “-k <密钥>”选项指定了一个由 twofish 加密的密钥来使用。如果你想要将密钥从命令行中隐藏，你可以使用 N2N_KEY 环境变量。
- “-l <IP地址:端口>”选项指定了超级节点的监听 IP 地址和端口号。为了冗余，你可以指定最多两个不同的超级节点（比如 -l <超级节点 A> -l <超级节点 B>）。
- “-m <MAC 地址>”给 TAP 接口分配了一个静态的 MAC 地址。不使用这个参数的话，edge 命令将会随机生成一个 MAC 地址。事实上，为一个 VPN 接口强制指定一个静态的 MAC 地址是被强烈推荐的做法。否则，比如当你在一个节点上重启了 edge 守护程序的时候，其它节点的 ARP 缓存将会由于新生成的 MAC 地址而遭到污染，它们将不能向这个节点发送数据，直到被污染的 ARP 记录被消除。

![](https://farm3.staticflickr.com/2946/15460918796_72c7c4e461_b.jpg)

至此，你应该能够从一个边缘节点用 VPN IP 地址 ping 通另一个边缘节点了。

### 故障排除 ###

1. 在调用 edge 守护程序的时候得到了如下错误。

    n2n[4405]: ERROR: ioctl() [Operation not permitted][-1]

注意 edge 守护进程需要超级用户权限来创建一个 TAP 接口。因此需要确定用 root 权限来执行，或者对 edge 命令设置 SUID。之后你总是可以使用“-u”和“-g”选项来降权放弃 root 权限。

### 总结 ###

n2n 可以成为对你来说非常实用的免费 VPN 解决方案。你可以轻松地配置一个超级节点，无论是用你自己家里的网络，还是从[云主机][3]提供商购买一个可以公共访问的 VPS 实例。你不再需要把敏感的凭据和密钥放在第三方 VPN 提供商的手里，使用 n2n，你可以在你的朋友中配置你自己的低延迟、高带宽、可扩展的 P2P VPN。

你对 n2n 有什么想法吗？请在评论中分享你的观点。


--------------------------------------------------------------------------------

via: http://xmodulo.com/configure-peer-to-peer-vpn-linux.html

作者：[Dan Nanni][a]
译者：[felixonmars](https://github.com/felixonmars)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://xmodulo.com/how-to-install-and-configure-tinc-vpn.html
[2]:http://www.ntop.org/products/n2n/
[3]:http://xmodulo.com/go/digitalocean
