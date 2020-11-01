[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12688-1.html)
[#]: subject: (What is IPv6, and why aren’t we there yet?)
[#]: via: (https://www.networkworld.com/article/3254575/what-is-ipv6-and-why-aren-t-we-there-yet.html)
[#]: author: (Keith Shaw, Josh Fruhlinger )

什么是 IPv6，为什么我们还未普及？
======

> 自 1998 年以来，IPv6 一直在努力解决 IPv4 可用 IP 地址的不足的问题，然而尽管 IPv6 在效率和安全方面具有优势，但其采用速度仍然缓慢。

![](https://images.idgesg.net/images/article/2017/11/ipv6newip-100740801-large.jpg)

在大多数情况下，已经没有人一再对互联网地址耗尽的可怕境况发出警告，因为，从互联网协议版本 4（IPv4）的世界到 IPv6 的迁移，虽然缓慢，但已经坚定地开始了，并且相关软件已经到位，以防止许多人预测的地址耗竭。

但在我们看到 IPv6 的现状和发展方向之前，让我们先回到互联网寻址的早期。

### 什么是 IPv6，为什么它很重要？

IPv6 是最新版本的<ruby>互联网协议<rt>Internet Protocol</rt></ruby>（IP），它可以跨互联网识别设备，从而确定它们的位置。每一个使用互联网的设备都要通过自己的 IP 地址来识别，以便可以通过互联网通信。在这方面，它就像你需要知道街道地址和邮政编码一样，以便邮寄信件。

之前的版本 IPv4 采用 32 位寻址方案，可以支持 43 亿台设备，本以为已经足够。然而，互联网、个人电脑、智能手机以及现在物联网设备的发展证明，这个世界需要更多的地址。

幸运的是，<ruby>互联网工程任务组<rt>Internet Engineering Task Force</rt></ruby>（IETF）在 20 年前就认识到了这一点。1998 年，它创建了 IPv6，使用 128 位寻址方式来支持大约 340 <ruby>亿亿亿<rt>trillion trillion</rt></ruby>（或者 2 的 128 次幂，如果你喜欢用这种表示方式的话）。IPv4 的地址可表示为四组一至三位十进制数，IPv6 则使用八组四位十六进制数字，用冒号隔开。

### IPv6 的好处是什么？

IETF 在其工作中为 IPv6 加入了对 IPv4 增强的功能。IPv6 协议可以更有效地处理数据包，提高性能和增加安全性。它使互联网服务提供商（ISP）能够通过使他们的路由表更有层次性来减少其大小。

### 网络地址转换（NAT）和 IPv6

IPv6 的采用被推迟，部分原因是<ruby>网络地址转换<rt>network address translation</rt></ruby>（NAT）导致的，NAT 可以将私有 IP 地址转化为公共 IP 地址。这样一来，拥有私有 IP 地址的企业的机器就可以向位于私有网络之外拥有公共 IP 地址的机器发送和接收数据包。

如果没有 NAT，拥有数千台或数万台计算机的大公司如果要与外界通信，就会吞噬大量的公有 IPv4 地址。但是这些 IPv4 地址是有限的，而且接近枯竭，以至于不得不限制分配。

NAT 有助于缓解这个问题。有了 NAT，成千上万的私有地址计算机可以通过防火墙或路由器等 NAT 设备呈现在公共互联网上。

NAT 的工作方式是，当一台拥有私有 IP 地址的企业计算机向企业网络外的公共 IP 地址发送数据包时，首先会进入 NAT 设备。NAT 在翻译表中记下数据包的源地址和目的地址。NAT 将数据包的源地址改为 NAT 设备面向公众的地址，并将数据包一起发送到外部目的地。当数据包回复时，NAT 将目的地址翻译成发起通信的计算机的私有 IP 地址。这样一来，一个公网 IP 地址可以代表多台私有地址的计算机。

### 谁在部署 IPv6？

运营商网络和互联网服务供应商是最早开始在其网络上部署 IPv6 的群体，其中移动网络处于领先地位。例如，T-Mobile USA 有超过 90% 的流量通过 IPv6，Verizon Wireless 紧随其后，占 82.25%。根据行业组织 [World Ipv6 Launch][3] 的数据，Comcast 和 AT&T 的网络分别为 63% 和 65%。

主要网站则排在其后 —— World IPv6 Launch 称，目前 Alexa 前 1000 的网站中只有不到 30% 可以通过 IPv6 到达。

企业在部署方面比较落后，根据<ruby>互联网协会<rt>Internet Society</rt></ruby>的[《2017年 IPv6 部署状况》报告][4]，只有不到四分之一的企业宣传其 IPv6 前缀。复杂性、成本和完成迁移所需时间都是他们给出的理由。此外，一些项目由于软件兼容性的问题而被推迟。例如，一份 [2017 年 1 月的报告][5]称，Windows 10 中的一个 bug “破坏了微软在其西雅图总部推出纯 IPv6 网络的努力”。

### 何时会有更多部署？

互联网协会表示，IPv4 地址的价格将在 2018 年达到顶峰，然后在 IPv6 部署通过 50% 大关后，价格会下降。目前，[根据 Google][6]，全球的 IPv6 采用率为 20% 到 22%，但在美国约为 32%。

随着 IPv4 地址的价格开始下降，互联网协会建议企业出售现有的 IPv4 地址，以帮助资助其 IPv6 的部署。根据[一个发布在 GitHub 上的说明][7]，麻省理工学院已经这样做了。这所大学得出的结论是，其有 800 万个 IPv4 地址是“过剩”的，可以在不影响当前或未来需求的情况下出售，因为它还持有 20 个<ruby>非亿级<rt>nonillion</rt></ruby> IPv6 地址。（非亿级地址是指数字 1 后面跟着 30 个零）。

此外，随着部署的增多，更多的公司将开始对 IPv4 地址的使用收费，而免费提供 IPv6 服务。[英国的 ISP Mythic Beasts][8] 表示，“IPv6 连接是标配”，而 “IPv4 连接是可选的额外服务”。

### IPv4 何时会被“关闭”？

在 2011 年至 2018 年期间，世界上大部分地区[“用完”了新的 IPv4 地址][9] —— 但我们不会完全没有 IPv4 地址，因为 IPv4 地址会被出售和重新使用（如前所述），而剩余的地址将用于 IPv6 过渡。

目前还没有正式的 IPv4 关闭日期，所以人们不用担心有一天他们的互联网接入会突然消失。随着越来越多的网络过渡，越来越多的内容网站支持 IPv6，以及越来越多的终端用户为 IPv6 功能升级设备，世界将慢慢远离 IPv4。

### 为什么没有 IPv5？

曾经有一个 IPv5，也被称为<ruby>互联网流协议<rt>Internet Stream Protocol</rt></ruby>，简称 ST。它被设计用于跨 IP 网络的面向连接的通信，目的是支持语音和视频。

它在这个任务上是成功的，并被实验性地使用。它的一个缺点是它的 32 位地址方案 —— 与 IPv4 使用的方案相同，从而影响了它的普及。因此，它存在着与 IPv4 相同的问题 —— 可用的 IP 地址数量有限。这导致了发展出了 IPv6 并和最终得到采用。尽管 IPv5 从未被公开采用，但它已经用掉了 IPv5 这个名字。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3254575/what-is-ipv6-and-why-aren-t-we-there-yet.html

作者：[Keith Shaw][a],[Josh Fruhlinger][c]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Keith-Shaw/
[c]: https://www.networkworld.com/author/Josh-Fruhlinger/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3235805/lan-wan/ipv6-deployment-guide.html#tk.nww-fsb
[2]: https://www.networkworld.com/article/3214388/lan-wan/how-to-plan-your-migration-to-ipv6.html#tk.nww-fsb
[3]: http://www.worldipv6launch.org/measurements/
[4]: https://www.internetsociety.org/resources/doc/2017/state-of-ipv6-deployment-2017/
[5]: https://www.theregister.co.uk/2017/01/19/windows_10_bug_undercuts_ipv6_rollout/https://www.theregister.co.uk/2017/01/19/windows_10_bug_undercuts_ipv6_rollout/
[6]: https://www.google.com/intl/en/ipv6/statistics.html
[7]: https://gist.github.com/simonster/e22e50cd52b7dffcf5a4db2b8ea4cce0
[8]: https://www.mythic-beasts.com/sales/ipv6
[9]: https://ipv4.potaroo.net/
[10]: https://www.facebook.com/NetworkWorld/
[11]: https://www.linkedin.com/company/network-world
