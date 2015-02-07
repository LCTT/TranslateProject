使用 Quagga 将你的 CentOS 系统变成一个 BGP 路由器
================================================================================

在[之前的教程中][1]，我对如何简单地使用Quagga把CentOS系统变成一个不折不扣地OSPF路由器做了一些介绍。Quagga是一个开源路由软件套件。在这个教程中，我将会重点讲讲**如何把一个Linux系统变成一个BGP路由器，还是使用Quagga**，演示如何建立BGP与其它BGP路由器对等。

在我们进入细节之前，一些BGP的背景知识还是必要的。边界网关协议（即BGP）是互联网的域间路由协议的实际标准。在BGP术语中，全球互联网是由成千上万相关联的自治系统(AS)组成，其中每一个AS代表每一个特定运营商提供的一个网络管理域（[据说][2]，美国前总统乔治.布什都有自己的 AS 编号）。

为了使其网络在全球范围内路由可达，每一个AS需要知道如何在英特网中到达其它的AS。这时候就需要BGP出来扮演这个角色了。BGP是一个AS去与相邻的AS交换路由信息的语言。这些路由信息通常被称为BGP线路或者BGP前缀。包括AS号(ASN；全球唯一号码)以及相关的IP地址块。一旦所有的BGP线路被当地的BGP路由表学习和记录，每一个AS将会知道如何到达互联网的任何公网IP。

在不同域(AS)之间路由的能力是BGP被称为外部网关协议(EGP)或者域间协议的主要原因。就如一些路由协议，例如OSPF、IS-IS、RIP和EIGRP都是内部网关协议(IGPs)或者域内路由协议，用于处理一个域内的路由.

### 测试方案 ###

在这个教程中，让我们来使用以下拓扑。

![](https://farm6.staticflickr.com/5598/15603223841_4c76343313_z.jpg)

我们假设运营商A想要建立一个BGP来与运营商B对等交换路由。它们的AS号和IP地址空间的细节如下所示：

- **运营商 A**: ASN (100)， IP地址空间 (100.100.0.0/22)， 分配给BGP路由器eth1网卡的IP地址(100.100.1.1)

- **运营商 B**: ASN (200)， IP地址空间 (200.200.0.0/22)， 分配给BGP路由器eth1网卡的IP地址(200.200.1.1)

路由器A和路由器B使用100.100.0.0/30子网来连接到对方。从理论上来说，任何子网从运营商那里都是可达的、可互连的。在真实场景中，建议使用掩码为30位的公网IP地址空间来实现运营商A和运营商B之间的连通。

### 在 CentOS中安装Quagga ###

如果Quagga还没安装好，我们可以使用yum来安装Quagga。

    # yum install quagga 

如果你正在使用的是CentOS7系统，你需要应用一下策略来设置SELinux。否则，SElinux将会阻止Zebra守护进程写入它的配置目录。如果你正在使用的是CentOS6，你可以跳过这一步。

    # setsebool -P zebra_write_config 1 

Quagga软件套件包含几个守护进程，这些进程可以协同工作。关于BGP路由，我们将把重点放在建立以下2个守护进程。

- **Zebra**:一个核心守护进程用于内核接口和静态路由.
- **BGPd**:一个BGP守护进程.

### 配置日志记录 ###

在Quagga被安装后，下一步就是配置Zebra来管理BGP路由器的网络接口。我们通过创建一个Zebra配置文件和启用日志记录来开始第一步。

    # cp /usr/share/doc/quagga-XXXXX/zebra.conf.sample /etc/quagga/zebra.conf 

在CentOS6系统中：

    # service zebra start
    # chkconfig zebra on

在CentOS7系统中:

    # systemctl start zebra
    # systemctl enable zebra 

Quagga提供了一个叫做vtysh特有的命令行工具，你可以输入与路由器厂商(例如Cisco和Juniper)兼容和支持的命令。我们将使用vtysh shell来配置BGP路由在教程的其余部分。

启动vtysh shell 命令，输入：

    # vtysh

提示将被改成该主机名，这表明你是在vtysh shell中。

    Router-A#

现在我们将使用以下命令来为Zebra配置日志文件：

    Router-A# configure terminal
    Router-A(config)# log file /var/log/quagga/quagga.log
    Router-A(config)# exit

永久保存Zebra配置：

    Router-A# write

在路由器B操作同样的步骤。

### 配置对等的IP地址 ###

下一步，我们将在可用的接口上配置对等的IP地址。

    Router-A# show interface   #显示接口信息

----------

    Interface eth0 is up, line protocol detection is disabled
    . . . . .
    Interface eth1 is up, line protocol detection is disabled
    . . . . .

配置eth0接口的参数：

    site-A-RTR# configure terminal
    site-A-RTR(config)# interface eth0
    site-A-RTR(config-if)# ip address 100.100.0.1/30
    site-A-RTR(config-if)# description "to Router-B"
    site-A-RTR(config-if)# no shutdown
    site-A-RTR(config-if)# exit


继续配置eth1接口的参数：

    site-A-RTR(config)# interface eth1
    site-A-RTR(config-if)# ip address 100.100.1.1/24
    site-A-RTR(config-if)# description "test ip from provider A network"
    site-A-RTR(config-if)# no shutdown
    site-A-RTR(config-if)# exit

现在确认配置：

    Router-A# show interface 

----------

    Interface eth0 is up, line protocol detection is disabled
      Description: "to Router-B"
      inet 100.100.0.1/30 broadcast 100.100.0.3
    Interface eth1 is up, line protocol detection is disabled
      Description: "test ip from provider A network"
      inet 100.100.1.1/24 broadcast 100.100.1.255

----------

    Router-A# show interface description   #显示接口描述

----------

    Interface       Status  Protocol  Description
    eth0            up      unknown   "to Router-B"
    eth1            up      unknown   "test ip from provider A network"


如果一切看起来正常，别忘记保存配置。

    Router-A# write

同样地，在路由器B重复一次配置。

在我们继续下一步之前，确认下彼此的IP是可以ping通的。

    Router-A# ping 100.100.0.2 

----------

    PING 100.100.0.2 (100.100.0.2) 56(84) bytes of data.
    64 bytes from 100.100.0.2: icmp_seq=1 ttl=64 time=0.616 ms

下一步，我们将继续配置BGP对等和前缀设置。

### 配置BGP对等 ###

Quagga守护进程负责BGP的服务叫bgpd。首先我们来准备它的配置文件。

    # cp /usr/share/doc/quagga-XXXXXXX/bgpd.conf.sample /etc/quagga/bgpd.conf 

在CentOS6系统中：

    # service bgpd start
    # chkconfig bgpd on

在CentOS7中：

    # systemctl start bgpd
    # systemctl enable bgpd

现在，让我们来进入Quagga 的shell。

    # vtysh

第一步，我们要确认当前没有已经配置的BGP会话。在一些版本，我们可能会发现一个AS号为7675的BGP会话。由于我们不需要这个会话，所以把它移除。

    Router-A# show running-config 

----------

    ... ... ...
    router bgp 7675
     bgp router-id 200.200.1.1
    ... ... ... 

我们将移除一些预先配置好的BGP会话，并建立我们所需的会话取而代之。

    Router-A# configure terminal
    Router-A(config)# no router bgp 7675
    Router-A(config)# router bgp 100
    Router-A(config)# no auto-summary
    Router-A(config)# no synchronizaiton
    Router-A(config-router)# neighbor 100.100.0.2 remote-as 200
    Router-A(config-router)# neighbor 100.100.0.2 description "provider B"
    Router-A(config-router)# exit
    Router-A(config)# exit
    Router-A# write 

路由器B将用同样的方式来进行配置，以下配置提供作为参考。

    Router-B# configure terminal
    Router-B(config)# no router bgp 7675
    Router-B(config)# router bgp 200
    Router-B(config)# no auto-summary
    Router-B(config)# no synchronizaiton
    Router-B(config-router)# neighbor 100.100.0.1 remote-as 100
    Router-B(config-router)# neighbor 100.100.0.1 description "provider A"
    Router-B(config-router)# exit
    Router-B(config)# exit
    Router-B# write 


当相关的路由器都被配置好，两台路由器之间的对等将被建立。现在让我们通过运行下面的命令来确认：

    Router-A# show ip bgp summary 

![](https://farm6.staticflickr.com/5614/15420135700_e3568d2e5f_z.jpg)


从输出中，我们可以看到"State/PfxRcd"部分。如果对等关闭，输出将会显示"Idle"或者"Active'。请记住，单词'Active'这个词在路由器中总是不好的意思。它意味着路由器正在积极地寻找邻居、前缀或者路由。当对等是up状态，"State/PfxRcd"下的输出状态将会从特殊邻居接收到前缀号。

在这个例子的输出中，BGP对等只是在AS100和AS200之间呈up状态。因此没有前缀被更改，所以最右边列的数值是0。

### 配置前缀通告 ###

正如一开始提到，AS 100将以100.100.0.0/22作为通告，在我们的例子中AS 200将同样以200.200.0.0/22作为通告。这些前缀需要被添加到BGP配置如下。

在路由器-A中：

    Router-A# configure terminal
    Router-A(config)# router bgp 100
    Router-A(config)# network 100.100.0.0/22
    Router-A(config)# exit
    Router-A# write

在路由器-B中：

    Router-B# configure terminal
    Router-B(config)# router bgp 200
    Router-B(config)# network 200.200.0.0/22
    Router-B(config)# exit
    Router-B# write 

在这一点上，两个路由器会根据需要开始通告前缀。

### 测试前缀通告 ###

首先，让我们来确认前缀的数量是否被改变了。

    Router-A# show ip bgp summary 

![](https://farm6.staticflickr.com/5608/15419095659_0ebb384eee_z.jpg)

为了查看所接收的更多前缀细节，我们可以使用以下命令，这个命令用于显示邻居100.100.0.2所接收到的前缀总数。

     Router-A# show ip bgp neighbors 100.100.0.2 advertised-routes 

![](https://farm6.staticflickr.com/5597/15419618208_4604e5639a_z.jpg)

查看哪一个前缀是我们从邻居接收到的：

    Router-A# show ip bgp neighbors 100.100.0.2 routes 

![](https://farm4.staticflickr.com/3935/15606556462_e17eae7f49_z.jpg)

我们也可以查看所有的BGP路由器：

    Router-A# show ip bgp 

![](https://farm6.staticflickr.com/5609/15419618228_5c776423a5_z.jpg)


以上的命令都可以被用于检查哪个路由器通过BGP在路由器表中被学习到。

    Router-A# show ip route 

----------
  
    代码: K - 内核路由, C - 已链接 , S - 静态 , R - 路由信息协议 , O - 开放式最短路径优先协议,
        
           I - 中间系统到中间系统的路由选择协议, B - 边界网关协议, > - 选择路由, * - FIB 路由
       
    C>* 100.100.0.0/30 is directly connected, eth0
    C>* 100.100.1.0/24 is directly connected, eth1
    B>* 200.200.0.0/22 [20/0] via 100.100.0.2, eth0, 00:06:45

----------

    Router-A# show ip route bgp 

----------

    B>* 200.200.0.0/22 [20/0] via 100.100.0.2, eth0, 00:08:13


BGP学习到的路由也将会在Linux路由表中出现。

    [root@Router-A~]# ip route 

----------

    100.100.0.0/30 dev eth0  proto kernel  scope link  src 100.100.0.1
    100.100.1.0/24 dev eth1  proto kernel  scope link  src 100.100.1.1
    200.200.0.0/22 via 100.100.0.2 dev eth0  proto zebra


最后，我们将使用ping命令来测试连通。结果将成功ping通。

    [root@Router-A~]# ping 200.200.1.1 -c 2


总而言之，本教程将重点放在如何在CentOS系统中运行一个基本的BGP路由器。这个教程让你开始学习BGP的配置，一些更高级的设置例如设置过滤器、BGP属性调整、本地优先级和预先路径准备等，我将会在后续的教程中覆盖这些主题。

希望这篇教程能给大家一些帮助。

--------------------------------------------------------------------------------

via: http://xmodulo.com/centos-bgp-router-quagga.html

作者：[Sarmed Rahman][a]
译者：[disylee](https://github.com/disylee)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/sarmed
[1]:http://linux.cn/article-4232-1.html
[2]:http://weibo.com/3181671860/BngyXxEUF
