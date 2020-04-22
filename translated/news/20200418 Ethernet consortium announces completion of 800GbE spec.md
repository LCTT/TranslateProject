[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Ethernet consortium announces completion of 800GbE spec)
[#]: via: (https://www.networkworld.com/article/3538529/ethernet-consortium-announces-completion-of-800gbe-spec.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

以太网联盟宣布完成 800Gb 以太网规范
======
800Gb 以太网规范使当前以太网标准的最高速度提高了一倍，但同时也对包括延迟在内的其他方面进行了调整。
Martyn Williams/IDGNS

由业界支持的以太网技术联盟已宣布完成 800Gb 以太网技术规范。

它基于当前高端 400Gb 以太网协议中使用的许多技术，新规范正式称为 800GBASE-R。设计它的联盟（当时称为 25Gb 以太网联盟）在开发 25、50 和 100Gb 以太网协议方面也发挥了重要作用，其成员包括 Broadcom、Cisco、Google 和 Microsoft。

800Gb 以太网规范增加了新的媒体访问控制（MAC）和物理编码子层（PCS）方法，新规范对这些功能进行了调整，来使用 8 条 106.25Gbps 的物理通道分发数据。（通道可以是铜双绞线，也可以是光缆，一束光纤或光波。）800GBASE-R 规范建立在两个 400 GbE 2xClause PCS 之上，以创建一个以 800Gbps 的总速率运行的单个 MAC。

尽管主要是使用八条 106.25Gb 通道，但这并不是固定的。它可以以一半的速度 （53.125Gbps） 使用 16 条通道。

新标准提供了 400G 以太网规范的一半延迟，但是新规范也将运行在 50 Gbps、100 Gbps 和 200 Gbps 的网络上的前向纠错（FEC）开销减少了一半，从而减少了网卡上的数据包处理负担。

通过降低延迟，这将满足对延迟敏感的应用（例如[高性能计算][2]和人工智能）中对速度的需求，在这些应用中，需要尽可能快地移动大量数据。

[][3]

从 400G 增加到 800G 并不是技术上大的飞跃。这意味着要以相同的传输速率添加更多通道，并进行一些调整。但是，要想突破 Tb，Cisco 和其他网络公司已经讨论了十年了，这将需要对技术进行重大修改，而且并非易事。

新技术可能也不便宜。800G 可与现有硬件一起使用，而 400Gb 以太网交换机价格不菲，高达六位数。对技术进行重大修改，越过 Tb 障碍，可能会变得更加昂贵。但是对于大客户和高性能计算客户而言，这是预料之中的。

ETC 并未透露何时会支持 800G 的新硬件，但鉴于其对现有规格的适度更改，它可能会在今年出现，前提是疫情引起的停滞不会影响它。

加入 [Facebook][4] 和 [LinkedIn][5] 上的 Network World 社区，评论热门主题。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3538529/ethernet-consortium-announces-completion-of-800gbe-spec.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[2]: https://www.networkworld.com/article/3444399/high-performance-computing-do-you-need-it.html
[3]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE22140&utm_content=sidebar (ITAAS and Corporate Storage Strategy)
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world