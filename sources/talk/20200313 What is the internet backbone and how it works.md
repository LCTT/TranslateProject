[#]: collector: (lujun9972)
[#]: translator: (messon007)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What is the internet backbone and how it works)
[#]: via: (https://www.networkworld.com/article/3532318/what-is-the-internet-backbone-and-how-it-works.html)
[#]: author: (Tim Greene https://www.networkworld.com/author/Tim-Greene/)

What is the internet backbone and how it works 互联网的骨干网是什么以及它是怎样工作的
======
Tier 1 internet service providers (ISP) mesh their high-speed fiber-optic networks together to create the internet backbone, which moves traffic efficiently among geographic regions.
[Gerd Altmann][1] [(CC0)][2]
一级互联网服务提供商（ISP）将其高速光纤网络连接在一起，形成互联网的骨干网，实现在地理区域之间高效地传输流量。[Gerd Altmann][1] [(CC0)][2]

The internet generates massive amounts of computer-to-computer traffic, and insuring all that traffic can be delivered anywhere in the world requires the aggregation of a vast array of high-speed networks collectively known as the internet backbone, but how does that work?
互联网会产生大量的计算机到计算机的流量，要确保所有流量都可以在世界上任何地方之间送达，就需要大量汇聚的高速网络，这些网络统称为互联网骨干网，但是它是如何工作的呢？

### What is the internet backbone? 互联网的骨干网是什么?
Like any other network, the internet consists of access links that move traffic to high-bandwidth routers that move traffic from its source over the best available path toward its destination. This core is made up of individual high-speed fiber-optic networks that peer with each other to create the internet backbone.
像任何其他网络一样，Internet由接入链路组成，这些接入链路将流量传输到高带宽路由器，路由器又将流量从源地址通过最佳可用路径传输到目的地址。其核心是由相互连接的各个高速光纤网络而构成的Internet骨干网。

The individual core networks are privately owned by Tier 1 internet service providers (ISP), giant carriers whose networks are tied together. These providers include AT&amp;T, CenturyLink, Cogent Communications, Deutsche Telekom, Global Telecom and Technology (GTT), NTT Communications, Sprint, Tata Communications, Telecom Italia Sparkle, Telia Carrier, and Verizon.
各个独立的核心网络由一级互联网服务提供商（ISP），大型运营商所拥有。他们的网络连接在一起。这些提供商包括AT＆T，CenturyLink，Cogent Communications，德国电信，全球电信和技术（GTT），NTT Communications，Sprint，Tata Communications，意大利Sparkle电信，Telia Carrier和Verizon。

[[Get regularly scheduled insights by signing up for Network World newsletters.]][3]

By joining these long-haul networks together, Tier 1 ISPs create a single worldwide network that gives all of them access to the entire internet routing table so they can efficiently deliver traffic to its destination through a hierarchy of progressively more local ISPs.
通过将这些长途网连接在一起，一级ISP们创建了一个他们可以访问整个路由表的单一的全球性网络，因此他们可以通过逐步层次化地增加本地ISP网络来有效地将流量传输到其目的地。

In addition to being physically connected, these backbone providers are held together by a shared network protocol, TCP/IP. They are actually two protocols, transport control protocol and internet protocol that set up connections between computers, insuring that the connections are reliable and formating messages into packets.
除了物理连接之外，这些骨干提供商还通过一致的网络协议TCP/IP融合在一起。它们实际上是两个协议，传输控制协议和Internet协议，它们在计算机之间建立连接，以确保连接可靠并将消息格式化为数据包。

### Internet exchange points (IXP) tie the backbone together 互联网交接点(IXP)将骨干连接在一起

Backbone ISPs connect their networks at peering points, neutrally owned locations with high-speed switches and routers that move traffic among the peers. These are often owned by third parties, sometimes non-profits, that facilitate unifying the backbone.
骨干ISP在对等点，中立位置通过高速交换机和路由器连接其网络。这些通常由第三方（有时是非营利组织）提供，以促进骨干网的统一。

Participating Tier 1 ISPs help fund the IXPs, but don’t charge each other for transporting traffic from the other Tier 1 ISPs in a relationship known as settlement-free peering. Such agreements eliminate potential financial disputes that might have the result of slowing down internet performance.
有1级ISP的参与有助于为IXP提供资金，但是在称为无结算的对等关系中，彼此之间不收取从其他1级ISP传输流量的费用。此类协议消除了可能导致互联网性能下降的潜在财务纠纷。

[][4]

### How fast is the backbone? 骨干网有多快?
The internet backbone is made up of the fastest routers, which can deliver 100Gbps trunk speeds. These routers are made by vendors including Cisco, Extreme, Huawei, Juniper, and Nokia, and use the border gateway protocol (BGP) to route traffic among themselves.
互联网骨干网由最快的路由器组成，可以提供100Gbps的线路速度。这些路由器由包括Cisco，Extreme，Huawei，Juniper和Nokia在内的供应商制造，使用边界网关协议（BGP）在彼此之间路由流量。

### How traffic gets on the backbone 流量是如何进入骨干网的

Below the Tier 1 ISPs are smaller Tier 2 and Tier 3 ISPs.
1级ISP之下是小的2级和3级ISP。

Tier 3 providers provide businesses and consumers with access to the internet. These providers have no access of their own to the internet backbone, so on their own would not be able to connect their customers to all of the billions of internet-attached computers.
3级(ISP)提供商为企业和消费者提供了Internet接入服务。这些提供商自己没有接入互联网骨干网，因此，他们自己无法将其客户连接到数十亿台互联网上的计算机。

Buying access to Tier 1 providers is expensive. So often Tier 3 ISPs contract with Tier 2 (regional) ISPs that have their own networks that can deliver traffic to a limited geographic area but not to all internet-attached devices.
购买一级(ISP)提供商的接入权非常昂贵。通常3级ISP与具有自己网络的2级（区域）ISP签订合同，利用2级ISP的网络将流量传输到有限的地理区域，但不能传输到所有Internet上的设备。

In order to do that, Tier 2 ISPs contract with Tier 1 ISPs for access to the global backbone, and in that way make the entire internet accesssible to their customers.
为此，2级ISP与1级ISP签约以访问全球骨干网，并以这种方式使客户可以访问整个Internet。

This arrangment makes it possible for traffic from a computer on one side of the world to connect to one on the other side. That traffic goes from a source computer to a Tier 3 ISP that routes it to a Tier 2 ISP that routes it to a Tier 1 backbone provider that routes it to the appropriate Tier 2 ISP that routes it to a Tier 3 access provider that delivers it to the destination computer.
这种方式使得来自世界一侧的计算机的流量能够连接到另一侧的计算机。流量从源计算机流向3级ISP，再路由到2级ISP，再路由到1级骨干网提供商，再路由到正确的2级ISP，最后路由到提供该数据的3级接入提供商连接的目标计算机。

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.
加入[Facebook][5]和[LinkedIn][6]上的Network World社区，就可以评论最前沿的话题。
--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3532318/what-is-the-internet-backbone-and-how-it-works.html

作者：[Tim Greene][a]
选题：[lujun9972][b]
译者：[messon007](https://github.com/messon007)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Tim-Greene/
[b]: https://github.com/lujun9972
[1]: https://pixabay.com/en/social-media-digitization-faces-3271592/
[2]: https://creativecommons.org/publicdomain/zero/1.0/
[3]: https://www.networkworld.com/newsletters/signup.html
[4]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
