[#]: collector: (lujun9972)
[#]: translator: (murphyzhao)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10987-1.html)
[#]: subject: (Welcoming Blockchain 3.0)
[#]: via: (https://www.ostechnix.com/welcoming-blockchain-3-0/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

迎接区块链 3.0
======

![欢迎区块链 3.0][1]

“[区块链 2.0][2]” 系列文章讨论了自 2008 年比特币等加密货币问世以来区块链技术的发展。本文将探讨区块链的未来发展。**区块链 3.0** 这一新的 DLT（<ruby>分布式分类帐本技术<rt>Distributed Ledger Technology</rt></ruby>）演进浪潮将回答当前区块链所面临的问题（每一个问题都会在这里总结）。下一版本的技术标准也将带来全新的应用和使用案例。在本文的最后，我们也会看一些当前使用这些原则的案例。

以下是现有区块链平台的几个缺点，并针对这些缺点给出了建议的解决方案。

### 问题 1：可扩展性

这个问题 [^1]被视为普遍采用该技术的第一个主要障碍。正如之前所讨论的，很多因素限制了区块链同时处理大量交易的能力。诸如 [以太坊][3] 之类的现有网络每秒能够进行 10-15 次交易（TPS），而像 Visa 所使用的主流网络每秒能够进行超过 2000 次交易。**可扩展性**是困扰所有现代数据库系统的问题。正如我们在这里看到的那样，改进的共识算法和更好的区块链架构设计正在改进它。

#### 解决可扩展性

已经提出了更精简、更有效的一致性算法来解决可扩展性问题，并且不会影响区块链的主要结构。虽然大多数加密货币和区块链平台使用资源密集型的 PoW 算法（例如，比特币和以太坊）来生成区块，但是存在更新的 DPoS 和 PoET 算法来解决这个问题。DPoS 和 PoET 算法（还有一些正在开发中）需要更少的资源来维持区块链，并且已显示具有高达 1000 TPS 的吞吐量，可与流行的非区块链系统相媲美。

可扩展性问题的第二个解决方案是完全改变区块链结构和功能。我们不会详细介绍这一点，但已经提出了诸如<ruby>有向无环图<rt>Directed Acyclic Graph</rt></ruby>（DAG）之类的替代架构来处理这个问题。从本质上讲，这项工作假设并非所有网络节点都需要整个区块链的副本才能使区块链正常工作，或者并非所有的参与者需要从 DLT 系统获得好处。系统不要求所有参与者验证交易，只需要交易发生在共同的参考框架中并相互链接。

在比特币系统中使用<ruby>[闪电网络][11]<rt>Lightning network</rt></ruby>来实现 DAG，而以太坊使用他们的<ruby>[切片][12]<rt>Sharding</rt></ruby> 协议来实现 DAG。本质上，从技术上来看 DAG 实现并不是区块链。它更像是一个错综复杂的迷宫，只是仍然保留了区块链的点对点和分布式数据库属性。稍后我们将在另一篇文章中探讨 DAG 和 Tangle 网络。

### 问题 2：互通性

**互通性**[^4] [^5] 被称为跨链访问，基本上就是指不同区块链之间彼此相互通信以交换指标和信息。由于目前有数不清的众多平台，不同公司为各种应用提供了各种专有系统，平台之间的互操作性就至关重要。例如，目前在一个平台上拥有数字身份的人无法利用其他平台提供的功能，因为各个区块链彼此之间互不了解、不能沟通。这是由于缺乏可靠的验证、令牌交换等有关的问题仍然存在。如果平台之间不能够相互通信，面向全球推出[智能合约][4]也是不可行的。

#### 解决互通性

有一些协议和平台专为实现互操作性而设计。这些平台实现了原子交换协议，并向不同的区块链系统提供开放场景，以便在它们之间进行通信和交换信息。**“0x (ZRX)”** 就是其中的一个例子，稍后将对进行描述。

### 问题 3：治理

公有链中的治理 [^6] 本身不是限制，而是需要像社区道德指南针一样，在区块链的运作中考虑每个人的意见。结合起来并规模性地看，能预见这样一个问题，即要么协议更改太频繁，要么协议被拥有最多令牌的“中央”权威一时冲动下修改。不过这不是大多数公共区块链目前正在努力避免的问题，因为其运营规模和运营性质不需要更严格的监管。

#### 解决治理问题

上面提到的复杂的框架或 DAG 几乎可以消除对全球（平台范围）治理法规的需要和使用。相反，程序可以自动监督事务和用户类型，并决定需要执行的法律。

### 问题 4：可持续性

可持续性再次建立在可扩展性问题的基础上。当前的区块链和加密货币因不可长期持续而倍遭批评，这是由于仍然需要大量的监督，并且需要大量资源保持系统运行。如果你读过最近“挖掘加密货币”已经没有这么大利润的相关报道，你就知道“挖矿”图利就是它的本来面目。保持现有平台运行所需的资源量在全球范围和主流使用方面根本不实用。

#### 解决不可持续性问题

从资源或经济角度来看，可持续性的答案与可扩展性的答案类似。但是，要在全球范围内实施这一制度，法律和法规必须予以认可。然而，这取决于世界各国政府。来自美国和欧洲政府的有利举措重新燃起了对这方面的希望。

### 问题 5：用户采用

目前，阻止消费者广泛采用 [^7] 基于区块链的应用程序的一个障碍是消费者对平台及其底层的技术不熟悉。事实上，大多数应用程序都需要某种技术和计算背景来弄清楚它们是如何工作的，这在这方面也没有帮助。区块链开发的第三次浪潮旨在缩小消费者知识与平台可用性之间的差距。

#### 解决用户采用问题

互联网花了很长的时间才发展成现在的样子。多年来，人们在开发标准化互联网技术栈方面做了大量的工作，使 Web 能够像现在这样运作。开发人员正在开发面向用户的前端分布式应用程序，这些应用程序应作为现有 Web 3.0 技术之上的一层，同时由下面的区块链和开放协议的支持。这样的[分布式应用][5]将使用户更熟悉底层技术，从而增加主流采用。

### 在当前场景中的应用

我们已经从理论上讨论了上述问题的解决方法，现在我们将继续展示这些方法在当前场景中的应用。

- [0x][6] – 是一种去中心化的令牌交换，不同平台的用户可以在不需要中央权威机构审查的情况下交换令牌。他们的突破在于，他们如何设计系统使得仅在交易结算后才记录和审查数据块，而不是通常的在交易之间进行（为了验证上下文，通常也会验证交易之前的数据块）。这使在线数字资产交换更快速。
- [Cardano][7] – 由以太坊的联合创始人之一创建，Cardano 自诩为一个真正“科学”的平台，和采用了严格的协议，对开发的代码和算法进行了多次审查。Cardano 的所有内容都在数学上尽可能的进行了优化。他们的共识算法叫做 **Ouroboros**，是一种改进的<ruby>权益证明<rt>Proof of Stake</rt></ruby>（PoS）算法。Cardano 是用 [**haskell**][8] 开发的，智能合约引擎使用 haskell 的衍生工具 **plutus** 进行操作。这两者都是函数式编程语言，可以保证安全交易而不会影响效率。
- EOS – 我们已经在 [这篇文章][9] 中描述了 EOS。
- [COTI][10] – 一个鲜为人知的架构，COTI 不需要挖矿，而且在运行过程中趋近于零功耗。它还将资产存储在本地用户设备上的离线钱包中，而不是存储在纯粹的对等网络上。它们也遵循基于 DAG 的架构，并声称处理吞吐量高达 10000 TPS。他们的平台允许企业在不利用区块链的情况下建立自己的加密货币和数字化货币钱包。

[^1]: A. P. Paper, K. Croman, C. Decker, I. Eyal, A. E. Gencer, and A. Juels, “On Scaling Decentralized Blockchains | SpringerLink,” 2018.
[^4]: [Why is blockchain interoperability important][13]
[^5]: [The Importance of Blockchain Interoperability][14]
[^6]: R. Beck, C. Müller-Bloch, and J. L. King, “Governance in the Blockchain Economy: A Framework and Research Agenda,” J. Assoc. Inf. Syst., pp. 1020–1034, 2018.
[^7]: J. M. Woodside, F. K. A. Jr, W. Giberson, F. K. J. Augustine, and W. Giberson, “Blockchain Technology Adoption Status and Strategies,” J. Int. Technol. Inf. Manag., vol. 26, no. 2, pp. 65–93, 2017.


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/welcoming-blockchain-3-0/

作者：[sk][a]
选题：[lujun9972][b]
译者：[murphyzhao](https://github.com/murphyzhao)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/06/blockchain-720x340.jpg
[2]: https://linux.cn/article-10650-1.html
[3]: https://www.ostechnix.com/blockchain-2-0-what-is-ethereum/
[4]: https://www.ostechnix.com/blockchain-2-0-explaining-smart-contracts-and-its-types/
[5]: https://www.ostechnix.com/blockchain-2-0-explaining-distributed-computing-and-distributed-applications/
[6]: https://0x.org/
[7]: https://www.cardano.org/en/home/
[8]: https://www.ostechnix.com/getting-started-haskell-programming-language/
[9]: https://www.ostechnix.com/blockchain-2-0-eos-io-is-building-infrastructure-for-developing-dapps/
[10]: https://coti.io/
[11]: https://cryptoslate.com/beyond-blockchain-directed-acylic-graphs-dag/
[12]: https://github.com/ethereum/wiki/wiki/Sharding-FAQ#introduction
[13]: https://www.capgemini.com/2019/02/can-the-interoperability-of-blockchains-change-the-world/
[14]: https://medium.com/wanchain-foundation/the-importance-of-blockchain-interoperability-b6a0bbd06d11
