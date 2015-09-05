如何设置在 Quagga BGP 路由器中设置 IPv6 的 BGP 对等体和过滤
================================================================================

在之前的教程中，我们演示了如何使用Quagga建立一个[完备的BGP路由器][1]和配置[前缀过滤][2]。在本教程中，我们会向你演示如何创建IPv6 BGP对等体并通过BGP通告IPv6前缀。同时我们也将演示如何使用前缀列表和路由映射特性来过滤通告的或者获取到的IPv6前缀。

### 拓扑 ###

教程中，我们主要参考如下拓扑。

![](https://farm9.staticflickr.com/8599/15944659374_1c65852df2_c.jpg)

服务供应商A和B希望在他们之间建立一个IPv6的BGP对等体。他们的IPv6地址和AS信息如下所示。

- 对等体IP块: 2001:DB8:3::/64
- 供应商A: AS 100, 2001:DB8:1::/48
- 供应商B: AS 200, 2001:DB8:2::/48 

### CentOS/RHEL安装Quagga ###

如果Quagga还没有安装，我们可以先使用yum安装。

    # yum install quagga 

在CentOS/RHEL 7，SELinux策略会默认的阻止对于/usr/sbin/zebra配置目录的写操作，这会对我们将要介绍的安装操作有所影响。因此我们需要像下面这样关闭这个策略。如果你使用的是CentOS/RHEL 6可以跳过这一步。

    # setsebool -P zebra_write_config 1 

### 创建配置文件 ###

在安装过后，我们先创建配置文件zebra/bgpd作为配置流程的开始。

    # cp /usr/share/doc/quagga-XXXXX/zebra.conf.sample /etc/quagga/zebra.conf
    # cp /usr/share/doc/quagga-XXXXX/bgpd.conf.sample /etc/quagga/bgpd.conf

然后，允许这些服务开机自启。

**在 CentOS/RHEL 6:**

    # service zebra start; service bgpd start
    # chkconfig zebra on; chkconfig bgpd on 

**在 CentOS/RHEL 7:**

    # systemctl start zebra; systemctl start bgpd
    # systemctl enable zebra; systmectl enable bgpd 

Quagga内部提供一个叫作vtysh的shell，其界面与那些主流路由厂商Cisco或Juniper十分相似。启动vtysh shell命令行：

    # vtysh

提示符将改为：

    router-a#

或

    router-b# 

在教程的其余部分，这个提示可以表明你正身处在哪个路由的vtysh shell中。

### 为Zebra指定日志文件 ###

来为Zebra配置日志文件，这会有助于调试。

首先，进入全局配置模式通过输入：

    router-a# configure terminal 

提示符将变更成：

    router-a(config)#

指定日志文件的位置。然后退出配置模式：

    router-a(config)# log file /var/log/quagga/quagga.log
    router-a(config)# exit 

保存配置通过：

    router-a# write 

### 配置接口IP地址 ###

现在，让我们为Quagga的物理接口配置IP地址。

首先，查看一下vtysh中现有的接口。

    router-a# show interfaces 

----------

    Interface eth0 is up, line protocol detection is disabled
    ## OUTPUT TRUNCATED ###
    Interface eth1 is up, line protocol detection is disabled
    ## OUTPUT TRUNCATED ##

现在我们配置IPv6地址。

    router-a# conf terminal
    router-a(config)# interface eth0
    router-a(config-if)# ipv6 address 2001:db8:3::1/64
    router-a(config-if)# interface eth1
    router-a(config-if)# ipv6 address 2001:db8:1::1/64

在路由B上采用同样的方式分配IPv6地址。我将配置汇总成如下。

    router-b# show running-config 

----------

    interface eth0
    ipv6 address 2001:db8:3::2/64
    
    interface eth1
    ipv6 address 2001:db8:2::1/64

由于两台路由的eth0端口同属一个子网，即2001：DB8：3::/64，你应该可以相互ping通。在保证ping通的情况下，我们开始下面的内容。

    router-a# ping ipv6 2001:db8:3::2 

----------

    PING 2001:db8:3::2(2001:db8:3::2) 56 data bytes
    64 bytes from 2001:db8:3::2: icmp_seq=1 ttl=64 time=3.20 ms
    64 bytes from 2001:db8:3::2: icmp_seq=2 ttl=64 time=1.05 ms

### 步骤 1: IPv6 BGP 对等体 ###

本段，我们将在两个路由之间配置IPv6 BGP。首先，我们在路由A上指定BGP邻居。

    router-a# conf t
    router-a(config)# router bgp 100
    router-a(config-router)# no auto-summary
    router-a(config-router)# no synchronization
    router-a(config-router)# neighbor 2001:DB8:3::2 remote-as 200

然后，我们定义IPv6的地址族。在地址族中，我们需要定义要通告的网段，并激活邻居。

    router-a(config-router)# address-family ipv6
    router-a(config-router-af)# network 2001:DB8:1::/48
    router-a(config-router-af)# neighbor 2001:DB8:3::2 activate

我们在路由B上也实施相同的配置。这里提供我归总后的配置。

    router-b# conf t
    router-b(config)# router bgp 200
    router-b(config-router)# no auto-summary
    router-b(config-router)# no synchronization
    router-b(config-router)# neighbor 2001:DB8:3::1 remote-as 100
    router-b(config-router)# address-family ipv6
    router-b(config-router-af)# network 2001:DB8:2::/48
    router-b(config-router-af)# neighbor 2001:DB8:3::1 activate

如果一切顺利，在路由间将会形成一个IPv6 BGP会话。如果失败了，请确保[在防火墙中开启了][3]必要的端口（TCP 179）。

我们使用以下命令来确认IPv6 BGP会话的信息。

**查看BGP汇总：**

    router-a# show bgp ipv6 unicast summary 

**查看BGP通告的路由：**

    router-a# show bgp ipv6 neighbors <neighbor-IPv6-address> advertised-routes 

**查看BGP获得的路由：**

    router-a# show bgp ipv6 neighbors <neighbor-IPv6-address> routes 

![](https://farm8.staticflickr.com/7317/16379555088_6e29cb6884_b.jpg)

### 步骤 2： 过滤IPv6前缀 ###

正如我们在上面看到的输出信息那样，路由间通告了他们完整的/48 IPv6前缀。出于演示的目的，我们会考虑以下要求。 

- Router-B将通告一个/64前缀，一个/56前缀，和一个完整的/48前缀.
- Router-A将接受任由B提供的何形式的IPv6前缀，其中包含有/56和/64之间的网络掩码长度。

我们将根据需要过滤的前缀，来使用路由器的前缀列表和路由映射。

![](https://farm8.staticflickr.com/7367/16381297417_6549218289_c.jpg)

#### 为路由B修改通告的前缀 ####

目前，路由B只通告一个/48前缀。我们修改路由B的BGP配置使它可以通告额外的/56和/64前缀。

    router-b# conf t
    router-b(config)# router bgp 200
    router-b(config-router)# address-family ipv6
    router-b(config-router-af)# network 2001:DB8:2::/56
    router-b(config-router-af)# network 2001:DB8:2::/64

我们将路由A上验证了所有的前缀都获得到了。

![](https://farm9.staticflickr.com/8598/16379761980_7c083ae977_b.jpg)

太好了！我们在路由A上收到了所有的前缀，那么我们可以更进一步创建前缀列表和路由映射来过滤这些前缀。

#### 创建前缀列表 ####

就像在[上则教程中][4]描述的那样，前缀列表是一种机制用来匹配带有子网长度的IP地址前缀。按照我们指定的需求，我们需要在路由A的前缀列表中创建一则必要的条目。

    router-a# conf t
    router-a(config)# ipv6 prefix-list FILTER-IPV6-PRFX permit 2001:DB8:2::/56 le 64

以上的命令会创建一个名为'FILTER-IPV6-PRFX'的前缀列表，用以匹配任何2001:DB8:2::池内掩码在56和64之间的所有前缀。

#### 创建并应用路由映射 ####

现在已经在前缀列表中创建了条目，我们也应该相应的创建一条使用此条目的路由映射规则了。

    router-a# conf t
    router-a(config)# route-map FILTER-IPV6-RMAP permit 10
    router-a(config-route-map)# match ipv6 address prefix-list FILTER-IPV6-PRFX

以上的命令会创建一条名为'FILTER-IPV6-RMAP'的路由映射规则。这则规则将会允许与之前在前缀列表中创建'FILTER-IPV6-PRFX'所匹配的IPv6

要记住路由映射规则只有在应用在邻居或者端口的指定方向时才有效。我们将把路由映射应用到BGP的邻居配置中。我们将路由映射应用于入方向，作为进入路由端的前缀过滤器。

    router-a# conf t
    router-a(config)# router bgp 100
    router-a(config-router)# address-family ipv6
    router-a(config-router-af)# neighbor 2001:DB8:3::2 route-map FILTER-IPV6-RMAP in

现在我们在路由A上再查看一边获得到的路由，我们应该只能看见两个被允许的前缀了。

![](https://farm8.staticflickr.com/7337/16379762020_ec2dc39b31_c.jpg)

**注意**： 你可能需要重置BGP会话来刷新路由表。

所有IPv6的BGP会话可以使用以下的命令重启：

    router-a# clear bgp ipv6 * 

我汇总了两个路由的配置，并做成了一张清晰的图片以便阅读。

![](https://farm9.staticflickr.com/8672/16567240165_eee4398dc8_c.jpg)

### 总结 ###

总结一下，这篇教程重点在于如何创建BGP对等体和IPv6的过滤。我们演示了如何向邻居BGP路由通告IPv6前缀，和如何过滤通告前缀或获得的通告。需要注意，本教程使用的过程可能会对网络供应商的网络运作有所影响，请谨慎参考。

希望这些对你有用。

--------------------------------------------------------------------------------

via: http://xmodulo.com/ipv6-bgp-peering-filtering-quagga-bgp-router.html

作者：[Sarmed Rahman][a]
译者：[martin2011qi](https://github.com/martin2011qi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/sarmed
[1]:https://linux.cn/article-4232-1.html
[2]:http://xmodulo.com/filter-bgp-routes-quagga-bgp-router.html
[3]:http://ask.xmodulo.com/open-port-firewall-centos-rhel.html
[4]:http://xmodulo.com/filter-bgp-routes-quagga-bgp-router.html
