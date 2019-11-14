[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11575-1.html)
[#]: subject: (Why blockchain (might be) coming to an IoT implementation near you)
[#]: via: (https://www.networkworld.com/article/3386881/why-blockchain-might-be-coming-to-an-iot-implementation-near-you.html)
[#]: author: (Jon Gold https://www.networkworld.com/author/Jon-Gold/)

为什么区块链（可能会）来到你身边的物联网
======

![MF3D / Getty Images][1]

各个公司发现，物联网与最近其他许多流行的企业级计算技术有着良好的合作关系，以支持加密货币而闻名的创新的分布式信任系统的区块链也不例外。然而，在物联网应用中实施区块链可能具有挑战性，并且需要对技术有深入的了解。

区块链是一个跟踪各种交易的分布式账本。链上的每个“块”都包含要防止篡改的交易记录或其他数据，并通过加密散列链接到前一个，这意味着对块的任何篡改都将使该链接无效。节点（几乎可以是其中装有 CPU 的任何节点）通过分布式的对等网络进行通信，以共享数据并确保链中数据的有效性。

北卡罗来纳大学格林波若分校的管理学教授 Nir Kshetri 表示，区块链系统之所以有效，是因为所有的块都必须就它们所保护的数据的细节达成一致。如果有人尝试更改给定节点上先前的事务，则存储在网络上的其余数据会回推回来。“数据的旧记录仍然存在，” Kshetri 说。

这是一项强大的安全技术 —— 如果没有坏人成功控制给定区块链上的所有（LCTT 译注：应为“大部分”）节点（[著名的“51％ 攻击”][4]），那么该区块链保护的数据就不会被伪造或以其他方式弄乱。因此，对于在物联网世界某些角落的公司来说，使用区块链是一种有吸引力的选择也就不足为奇了。

物联网安全初创企业 NXMLabs 的首席技术官兼联合创始人 Jay Fallah 认为，除了区块链能够在网络上安全地分发可信信息的能力这一事实之外，部分原因还在于区块链在技术堆栈中的地位。

“区块链站在一个非常有趣的交叉点。在过去的 15 年中，在存储、CPU 等方面，计算技术一直在加速发展，但是直到最近，网络技术并没有发生太大变化。”他说，“ 区块链不是网络技术、不是数据技术，而是二者兼具。”

### 区块链和物联网

区块链作为物联网世界的部分意义取决于你在和谁交谈以及他们在出售什么，但是最接近的概括可能来自企业区块链供应商 Filament 的首席执行官 Allison Clift-Jenning。

她说：“在任何地方，人们都想互相信任，并且用的是非常古老的方式，这通常是进入场景的好地方。”

直接从 Filament 自己的客户群中挑选出来的一个例子是二手车销售。Filament 与“一家主要的底特律汽车制造商”合作，创建了一个受信任的车辆历史平台，该平台基于一种设备，该设备可插入二手车的诊断端口，从那里获取信息，并将该数据写入区块链。像这样，二手车的历史记录就是不可变的，包括它的安全气囊是否曾经打开过，是否被水淹过等等。任何不道德的二手车或不诚实的前车主都无法更改数据，甚至拔掉设备也将意味着记录中存在可疑的空白期。

SAP 物联网高级副总裁兼全球负责人 Elvira Wallis 表示，当今大多数区块链物联网方案都与信任和数据验证有关。

她说：“我们遇到的大多数用例都在项目的跟踪和溯源领域，”她举例说明了高端食品的农场到餐桌跟踪系统，该系统使用安装在板条箱和卡车上的区块链节点，这样就可以为物品在运输基础设施中创建无懈可击的记录。（例如，该牛排在这样的温度下冷藏了多长时间，今天运输了多长时间，等等。）

### 将区块链与物联网一起使用是个好主意吗？

不同的供应商针对不同的用例出售不同的基于区块链的产品，这些产品使用不同的区块链技术实现，其中一些与加密货币中所使用的经典的、线性的、挖矿式交易区块链不太一样。

这意味着你目前需要从供应商那里购买特定功能。451 Research 高级分析师 Csilla Zsigri 表示，很少有客户组织拥有可以实施区块链安全系统的内部专家。

她说，区块链技术的任何智能应用的想法都是发挥其优势，为关键信息创建可信赖的平台。

Zsigri 说：“这就是我真正看到增值的地方，只是增加了一层信任和验证。”

专家们一致认为，尽管相当了解基于区块链的物联网应用程序的基本概念，但它并不适用于每个物联网用例。 将区块链应用于非交易系统（尽管有例外，包括 NXM Labs 的用于物联网设备的基于区块链配置的产品）通常不是正确的举动。

如果不需要在两个不同的参与方之间共享数据，而是简单地将数据从传感器移到后端，那么区块链通常就没有意义，因为它实际上并没有为当前大多数物联网实现中的数据分析增加任何关键的增值。

“今天，我们仍处于区块链的早期拨号时代。”Clift-Jennings 说，“它比典型的数据库要慢，它甚至无法读取，也常常没有查询引擎。从本质上讲，你并没有真正获得隐私。”

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3386881/why-blockchain-might-be-coming-to-an-iot-implementation-near-you.html

作者：[Jon Gold][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Jon-Gold/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/02/chains_binary_data_blockchain_security_by_mf3d_gettyimages-941175690_2400x1600-100788434-large.jpg
[2]: https://www.networkworld.com/article/3224893/internet-of-things/what-is-edge-computing-and-how-it-s-changing-the-network.html
[3]: https://www.networkworld.com/article/3291790/data-center/how-edge-networking-and-iot-will-reshape-data-centers.html
[4]: https://bitcoinist.com/51-percent-attack-hackers-steals-18-million-bitcoin-gold-btg-tokens/
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
