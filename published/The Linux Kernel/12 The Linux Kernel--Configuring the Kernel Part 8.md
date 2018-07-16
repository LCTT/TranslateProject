戴文的Linux内核专题：12 配置内核(8)
================================================================================
![](http://www.linux.org/attachments/slide-jpg.484/)

在本篇中，我们将继续配置网络特性。记住，网络是计算机最重要的特性，这篇文章和这之后的网络相关文章都要重点了解。

在我们开启这系列之前，我先要澄清一些事情。配置进程不会编辑你当前系统的内核。这个进程配置的是你编译(或者交叉编译)新内核前的源代码。一旦我完成了配置过程，那么我会讨论读者建议的话题。同样，作为提醒，每个段落中在引号或者括号中的第一句或者第二句(很少)的文本是配置工具中设置的名字。

首先，我们可以启用两个不同的稀疏型独立协议组播路由协议("IP: PIM-SM version 1 support" 和 "IP: PIM-SM version 2 support")，组播有点像广播，但是广播会给所有计算机发送信号而组播只会给选定的组或者计算机发送信号。所有PIM协议都是工作在IP的组播路由协议。

注意：当计算机与另外一台计算机或者服务器通信时，这叫做单播 - 只是以防你们想知道。

下一个要配置的网络特性是"ARP daemon support"。这让内核有一张IP地址表以及它们相应的在内部缓存中的硬件地址。ARP代表的是地址解析协议(Address-Resolution-Protocol)。

为了额外的安全，"TCP syncookie support"应该要启用。这保护计算机免于受到SYN洪水攻击。黑客或者恶意软件可能会发送SYN信息给一台服务器来消耗它的资源，以便让真实的访客无法使用服务器提供的服务。SYN消息会打开一个计算机和服务器之间的连接。Syncookie会阻断不正当的SYN消息。那么，真实的用户可以仍旧访问访问网站，而黑客则没办法浪费你的带宽。服务器应该启用这个特性。

下面的特性是用于 "Virtual (secure) IP: tunneling"。隧道是一个网络协议到另外一个网络协议的封装。当在使用虚拟私人网络(VPN)时需要使用安全隧道。

接下来，启用"AH transformation"增加对IPSec验证头的支持。这是一种管理数据验证的安全措施。

在这之后，启用"ESP transformation"增加对IPSec封装安全协议的支持。这是加密与可选择的数据验证的安全措施。

如果启用了这个特性(IP: IPComp transformation)，Linux内核会支持IP负载压缩协议。这是一种无损压缩系统。无损指的是数据仍会保持完整，在解压缩后，数据在压缩前后没有变化。压缩在加密前先执行。由于更少的数据传输，所以这个压缩协议可以加速网络。

下面三个设置用于处理不同的IPsec特性("IP: IPsec transport mode"、"IP: IPsec tunnel mode"和"IP: IPsec BEET mode")。IPSec代表的是因特网安全协议(Internet Protocol SECurity).两台计算机之间并且/或者服务器间的传输模式是默认的IPSec模式。传输模式使用AH或者ESP头并且只加密IP头。在隧道模式下，IP头和负载会被加密。隧道模式通常用于连接网关到服务器/服务器或者服务器到服务器。BEET模式(Bound End-to-End Tunnel)不会在IP地址改变时重连。BEET模式下的连接会仍然存在。BEET模式比其他几种模式使用更少的字节。

下面，内核可以支持收到大量IPv4/TCP包时减轻栈负担(Large Receive Offload (ipv4/tcp))。网卡(NIC)处理TCP/IP栈。这个特性在内核中增加了处理大型栈的代码。

INET套接字可以启用(INET: socket monitoring interface)。INET套接字用于因特网。这个特性(当启用时)会监视来自或者发往因特网的连接与流量。

这里有另外一个套接字监视接口(UDP: socket monitoring interface)。这个用于用户数据报协议(User Datagram Protocol (UDP))。再说一下，这个特性监视UDP的套接字。

以下的设定会启用不同的TCP拥塞控制(TCP: advanced congestion control)。如果网络变得太忙或者带宽已满，那么许多计算机必须等待一些带宽或者它们的数据流会变慢。如果流量被合理管理，这回有助于网络性能提升。

TCP连接可以被MD5保护(TCP: MD5 Signature Option support)。这用于保护核心路由器之间的边界网关协议(Border Gateway Protocol (BGP))连接。核心路由器是网络中主要的路由器；这些路由器有时指的是因特网/网络的骨干。BGP是一种路由决策协议。

下一个设定允许你启用/禁用"The IPv6 protocol"。当你启用它，IPv4仍旧可以很好地工作。

下面的特性是一个特殊的隐私特性(IPv6: Privacy Extensions (RFC 3041) support)。这使得系统在网络接口中生成并使用不同的随即地址。

注意：计算机中没有数据是真正随机的。计算机中随机数和随机字串通常称为伪随机。

在多路由的网络中，这个特性允许系统能够更有效地计算出该使用哪一个(IPv6: Router Preference (RFC 4191))。

在这之后，一个用于处理路由信息的实验性特性可以启用/禁用(IPv6: Route Information (RFC 4191))。记住，在编译一个稳定内核时，除非你确实需要这个问题中特性，才去安装实验性的功能。

有时，当系统自动配置它的IPv6地址时，它可能会得到一个网络中已被使用的IPv6地址。这是一个允许重复地址检测(Duplicate Address Detection (DAD)的实验性特性(IPv6: Enable RFC 4429 Optimistic DAD)。

IPv6可以有不同的IPsecc特性支持("IPv6: AH transformation" 和 "IPv6: ESP transformation")。

IPv6同样可以使用先前讨论过的IP负载压缩协议(IP Payload Compression Protocol)(IPv6: IPComp transformation)。

这里甚至有IPv6移动支持(IPv6: Mobility)。这允许使用IPv6的移动设备在保留同样地址的情况下使用其他的网络。

再说一次，这里同样有一些针对IPv6的IPsec特性("IPv6: IPsec transport mode"、"IPv6: IPsec tunnel mode"、"IPv6: IPsec BEET mode")。

当启用此项后，IPv6可以支持MIPv6路由优化(IPv6: MIPv6 route optimization mode)。这样就可以确保最短和最佳网络路径了。如果消息在更少的路由和网络设备间发送，那么下载和上传速度就可以更快。

如果一个管理员需要连接到两个IPv6网络，但是只能通过IPv4来连接，这时内核使这个变得可能(IPv6: IPv6-in-IPv4 tunnel (SIT driver)。这通过隧道使IPv6报文穿越IPv4网络。

这个隧道特性是用于IPv6-in-IPv6 和 IPv4 tunneled in IPv6 (IPv6: IP-in-IPv6 tunnel (RFC2473))

另外一个隧道特性是(IPv6: GRE tunnel)。他只允许GRE隧道。(GRE：通用路由封装(Generic Routing Encapsulation))

允许支持多重路由表(IPv6: Multiple Routing Tables)。路由表是一张网络位置列表和数据要去目的地的路径。

允许根据源地址或前缀进行路由如果启用了(IPv6: source address based routing)。

"IPv6 Multicast routing"(IPv6组播路由)仍然是实验性质。IPv4和IPv6处理组播的方式不同。

典型的组播路由根据目标地址和源地址来处理组播包(IPv6: multicast policy routing)。启用这个选项会将接口和包的标记(mark)包含到决策中。

下面可以启用IPv6的PIM-SMv2 组播路由协议(IPv6: PIM-SM version 2 support)。这与先前提到的IPv4 PIM相同。因为IPv4和IPv6不同，所以PIM可以被v4/v6同时/分别激活

网络包标签协议(Network packet labeling protocols)(就像CIPSO和RIPSO)可以启用(NetLabel subsystem support)。这些标签包含了安全信息和权限。

网络包可以通过启用安全标记(Security Marking)变得更安全。

这个网络特性增加了一些开销(Time-stamping in PHY devices)。物理层(PHY)设备可以给网络包打上时间戳。PHY代表的是"PHYsical layer"。这些设备管理收到和发送的消息。

可以启用netfilter(Network packet filtering framework)。Netfilters过滤并修改过往的网络包。包过滤器是一种防火墙。如果包满足了一定的条件，包不会被允许通过。

数据报拥塞控制协议(Datagram Congestion Control Protocol)可以启用(The DCCP Protocol)。DCCP允许双向单播连接。DCCP有助于流媒体、网络电话和在线游戏。

下一步，流控制传输协议(Stream Control Transmission Protocol)可以启用(The SCTP Protocol)。SCTP工作在IP顶层并且是一个稳定可靠的协议。

下面的协议是可靠数据报套接字(Reliable Datagram Sockets)协议(The RDS Protocol)。

RDS可以使用Infiniband和iWARP作为一种支持RDMA的传输方式(RDS over Infiniband and iWARP)，Infiniband和iWARP都是协议。RDMA代表的是远程直接内存访问(remote direct memory access)。RDMA用于一台远程计算机访问另一台计算机的内存而无需本机计算机操作系统的辅助。这就像直接内存访问(DMA),但是这里远程代替了本地计算机。

RDS同样可以使用TCP传输(RDS over TCP)

接下来，"RDS debugging messages"应该禁用。

下面的网络协议用于集群(The TIPC Protocol)。集群就是一组计算机作为一台计算机。它们需要有一个方式去通信，所以他们使用透明内部进程间通信协议(Transparent Inter Process Communication (TIPC))。

这个高速协议使用固定大小的数据包(Asynchronous Transfer Mode (ATM))。

使用ATM的IP可以与连接到一个ATM网络的IP的系统通信(Classical IP over ATM)。

下一个特性禁用"ICMP host unreachable"(ICMP主机不可达)错误信息(Do NOT send ICMP if no neighbor)。这防止了由于重新校验而移除ATMARP表被移除的问题。ATMARP表管理地址解析。ICMP代表的是因特网控制消息协议(Internet Control Message Protocol)并被常用于通过网络发送错误消息。

LAN仿真(LANE)仿真了ATM网络上的LAN服务(LAN Emulation (LANE) support)。一台LANE计算机可以作为桥接Ethernet和ELAN的代理。

"Multi-Protocol Over ATM (MPOA) support"允许ATM设备通过子网边界发送连接。

在这个特性下，至少在kernel看来ATM PVCs的行为就像Ethernet(RFC1483/2684 Bridged protocols）。PVC代表的是永久虚电路(permanent virtual circuit)。虚拟连接是一种基于包的连接，它伴随着主/原始协议使用其他更高层的协议。

"Layer Two Tunneling Protocol (L2TP)"(二层隧道协议)是隧道对应用透明。虚拟私有网络(Virtual Private Networks (VPNs))使用L2TP

要想使用基于Linux的以太网桥，启用这个桥特性(802.1d Ethernet Bridging)。在网络中，一个桥同时连接两个或者更多的连接。以太网桥是使用以太网端口的硬件桥。

"IGMP/MLD snooping"(IGMP/MLD 探听)是一种以太网桥能够基于IGMP/MLD负载选择性地转发组播信号的能力。禁用这个特性能够明显减少内核的大小。IGMP代表的是因特网组管理协议(Internet Group Management Protocol),这是一种被用于设置组播组的协议。MLD代表多播监听发现(Multicast Listener Discovery)。

下一个过滤特性允许以太网桥选择性地管理在每个数据包中的基于VLAN的信息的流量。禁用这个特性可以减小内核的大小。

通过启用这个特性(802.1Q VLAN Support)，VLAN接口可以在以太网上创建。下面"GVRP (GARP VLAN Registration Protocol)"支持GVPR协议被用于在网络设备上注册某些vlan。

在这之后，"MVRP (Multiple VLAN Registration Protocol) support"(多重VLAN注册协议)可以启用。MVRP是GVRP更新的替代品。

"DECnet Support"是一种Digital公司发明的网络协议。这是一中既安全又稳定的协议。

"DECnet router support"允许用户制作基于Linux的支持DRCnet的路由。

注意：Linux可以用于服务器、工作站、路由器、集群、防火墙并支持其他许多用途。

下面的特性用于支持逻辑链路层2(Logical Link Layer type 2)(ANSI/IEEE 802.2 LLC type 2 Support)。这层允许在同一个网络设备上使用多个协议。强烈建议在网络很重要的环境中启用这个特性。最好所有内核都支持这个特性。

在下一篇文章中，我们将讨论更多的关于可以配置的网络设定。

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-8.4525/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出