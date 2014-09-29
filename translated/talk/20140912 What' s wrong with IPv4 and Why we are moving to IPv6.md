IPv6：IPv4犯的罪，为什么要我来弥补
================================================================================
（LCTT：标题党了一把，哈哈哈好过瘾，求不拍砖）
在过去的十年间，IPv6 本来应该得到很大的发展，但事实上这种好事并没有降临。由此导致了一个结果，那就是大部分人都不了解 IPv6 的一些知识：它是什么，怎么使用，以及，为什么它会存在？（LCTT：这是要回答蒙田的“我是谁”哲学思考题吗？）

![IPv4 and IPv6 Comparison](http://www.tecmint.com/wp-content/uploads/2014/09/ipv4-ipv6.gif)

IPv4 and IPv6 Comparison

### IPv4 做错了什么？ ###

自从1981年发布了 RFC 791 标准以来我们就一直在使用 **IPv4**。在那个时候，电脑又大又贵还不多见，而 IPv4 号称能提供**40亿条 IP 地址**，在当时看来，这个数字好大好大。不幸的是，这么多的 IP 地址并没有被充分利用起来，地址与地址之间存在间隙。举个例子，一家公司可能有**254(2^8-2)**条地址，但只使用其中的25条，剩下的229条被空占着，以备将来之需。于是这些空闲着的地址不能服务于真正需要它们的用户，原因就是网络路由规则的限制。最终的结果是在1981年看起来那个好大好大的数字，在2014年看起来变得好小好小。

互联网工程任务组（**IETF**）在90年代指出了这个问题，并提供了两套解决方案：无类型域间选路（**CIDR**）以及私有地址。在 CIDR 出现之前，你只能选择三种网络地址长度：**24 位** (共可用16,777,214个地址), **20位** (共可用1,048,574个地址)以及**16位** (共可用65,534个地址)。CIDR 出现之后，你可以将一个网络再划分成多个子网。

举个例子，如果你需要**5个 IP 地址**，你的 ISP 会为你提供一个子网，里面的主机地址长度为3位，也就是说你最多能得到**6个地址**（LCTT：抛开子网的网络号，3位主机地址长度可以表示0～7共8个地址，但第0个和第7个有特殊用途，不能被用户使用，所以你最多能得到6个地址）。这种方法让 ISP 能尽最大效率分配 IP 地址。“私有地址”这套解决方案的效果是，你可以自己创建一个网络，里面的主机可以访问外网的主机，但外网的主机很难访问到你创建的那个网络上的主机，因为你的网络是私有的、别人不可见的。你可以创建一个非常大的网络，因为你可以使用16,777,214个主机地址，并且你可以将这个网络分割成更小的子网，方便自己管理。

也许你现在正在使用私有地址。看看你自己的 IP 地址，如果这个地址在这些范围内：**10.0.0.0 – 10.255.255.255**、**172.16.0.0 – 172.31.255.255**或**192.168.0.0 – 192.168.255.255**，就说明你在使用私有地址。这两套方案有效地将“IP 地址用尽”这个灾难延迟了好长时间，但这毕竟只是权宜之计，现在我们正面临最终的审判。

**IPv4** 还有另外一个问题，那就是这个协议的消息头长度可变。如果数据通过软件来路由，这个问题还好说。但现在路由器功能都是由硬件提供的，处理变长消息头对硬件来说是一件困难的事情。一个大的路由器需要处理来自世界各地的大量数据包，这个时候路由器的负载是非常大的。所以很明显，我们需要固定消息头的长度。

还有一个问题，在分配 IP 地址的时候，美国人发了因特网（LCTT：这个万恶的资本主义国家占用了大量 IP 地址）。其他国家只得到了 IP 地址的碎片。我们需要重新定制一个架构，让连续的 IP 地址能在地理位置上集中分布，这样一来路由表可以做的更小（LCTT：想想吧，网速肯定更快）。

还有一个问题，这个问题你听起来可能还不大相信，就是 IPv4 配置起来比较困难，而且还不好改变。你可能不会碰到这个问题，因为你的路由器为你做了这些事情，不用你去操心。但是你的 ISP 对此一直是很头疼的。

下一代因特网需要考虑上述的所有问题。

### IPv6 和它的优点 ###

**IETF** 在1995年12月公布了下一代 IP 地址标准，名字叫 IPv6，为什么不是 IPv5？因为某个错误原因，“版本5”这个编号被其他项目用去了。IPv6 的优点如下：

- 128位地址长度（共有3.402823669×10³⁸个地址）
- 这个架构下的地址在逻辑上聚合
- 消息头长度固定
- 支持自动配置和修改你的网络。

我们一项一项地分析这些特点：

#### 地址 ####

人们谈到 **IPv6** 时，第一件注意到的事情就是它的地址好多好多。为什么要这么多？因为设计者考虑到地址不能被充分利用起来，我们必须提供足够多的地址，让用户去挥霍，从而达到一些特殊目的。所以如果你想架设自己的 IPv6 网络，你的 ISP 可以给你分配拥有**64位**主机地址长度的网络（可以分配1.844674407×10¹⁹台主机），你想怎么玩就怎么玩。

#### 聚合 ####

有这么多的地址，这个地址可以被稀稀拉拉地分配给主机，从而更高效地路由数据包。算一笔帐啊，你的 ISP 拿到一个**80位**地址长度的网络空间，其中16位是 ISP 的子网地址，剩下64位分给你作为主机地址。这样一来，你的 ISP 可以分配65,534个子网。

然而，这些地址分配不是一成不变地，如果 ISP 想拥有更多的小子网，完全可以做到（当然，土豪 ISP 可能会要求再来一个80位网络空间）。最高的48位地址是相互独立地，也就是说 ISP 与 ISP 之间虽然可能分到相同地80位网络空间，但是这两个空间是相互隔离的，好处就是一个网络空间里面的地址会聚合在一起。

#### 固定的消息头长度 ####

**IPv4** 消息头长度可变，但 **IPv6** 消息头长度被固定为40字节。IPv4 会由于额外的参数导致消息头变长，IPv6 中，如果有额外参数，这些信息会被放到一个紧挨着消息头的地方，不会被路由器处理，当消息到达目的地时，这些额外参数会被软件提取出来。

IPv6 消息头有一个部分叫“flow”，是一个20位伪随机数，用于简化路由器对数据包地路由过程。如果一个数据包存在“flow”，路由器就可以根据这个值作为索引查找路由表，不必慢吞吞地遍历整张路由表来查询路由路径。这个优点使 **IPv6** 更容易被路由。

#### 自动配置 ####

**IPv6** 中，当主机开机时，会检查本地网络，看看有没有其他主机使用了自己的 IP 地址。如果地址没有被使用，就接着查询本地的 IPv6 路由器，找到后就向它请求一个 IPv6 地址。然后这台主机就可以连上互联网了 —— 它有自己的 IP 地址，和自己的默认路由器。

如果这台默认路由器当机，主机就会接着找其他路由器，作为备用路由器。这个功能在 IPv4 协议里实现起来非常困难。同样地，假如路由器想改变自己的地址，自己改掉就好了。主机会自动搜索路由器，并自动更新路由器地址。路由器会同时保存新老地址，直到所有主机都把自己地路由器地址更新成新地址。

IPv6 自动配置还不是一个完整地解决方案。想要有效地使用互联网，一台主机还需要另外的东西：域名服务器、时间同步服务器、或者还需要一台文件服务器。于是 **dhcp6** 出现了，提供与 dhcp 一样的服务，唯一的区别是 dhcp6 的机器可以在可路由的状态下启动，一个 dhcp 进程可以为大量网络提供服务。

#### 它有一个大坑 ####

So if IPv6 is so much better than IPv4, why hasn’t adoption been more widespread (as of **May 2014**, Google estimates that its IPv6 traffic is about **4%** of its total traffic)? The basic problem is which comes first, the **chicken or the egg**? Somebody running a server wants the server to be as widely available as possible, which means it must have an **IPv4** address.

It could also have an IPv6 address, but few people would use it and you do have to change your software a little to accommodate IPv6. Furthermore, a lot of home networking routers do not support IPv6. A lot of ISPs do not support IPv6. I asked my ISP about it, and I was told that they will provide it when customers ask for it. So I asked how many customers had asked for it. One, including me.

By way of contrast, all of the major operating systems, Windows, OS X, and Linux support IPv6 “**out of the box**” and have for years. The operating systems even have software that will allow IPv6 packets to “**tunnel**” within IPv4 to a point where the IPv6 packets can be removed from the surrounding IPv4 packet and sent on their way.

#### Conclusion ####

IPv4 has served us well for a long time. IPv4 has some limitations which are going to present insurmountable problems in the near future. IPv6 will solve those problems by changing the strategy for allocating addresses, making improvements to ease the routing of packets, and making it easier to configure a machine when it first joins the network.

However, acceptance and usage of IPv6 has been slow, because change is hard and expensive. The good news is that all operating systems support IPv6, so when you are ready to make the change, your computer will need little effort to convert to the new scheme.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/ipv4-and-ipv6-comparison/

作者：[Jeff Silverman][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/jeffsilverm/
