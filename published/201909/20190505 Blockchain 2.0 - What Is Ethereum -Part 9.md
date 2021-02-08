[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11404-1.html)
[#]: subject: (Blockchain 2.0 – What Is Ethereum [Part 9])
[#]: via: (https://www.ostechnix.com/blockchain-2-0-what-is-ethereum/)
[#]: author: (editor https://www.ostechnix.com/author/editor/)

区块链 2.0 ：以太坊（九）
======

![Ethereum][1]

在本系列的上一指南中，我们讨论了 [Hyperledger 项目（HLP）][2]，这是一个由 Linux 基金会开发的增长最快的产品。在本指南中，我们将详细讨论什么是“<ruby>以太坊<rt>Ethereum</rt></ruby>”及其功能。许多研究人员认为，互联网的未来将基于<ruby>去中心化计算<rt>decentralized computing</rt></ruby>的原理。实际上，去中心化计算是互联网放在首位的更广泛目标之一。但是，由于可用的计算能力不同，互联网发生了转折。尽管现代服务器功能使得服务器端处理和执行成为可能，但在世界上大部分地区缺乏像样的移动网络使得客户端也是如此。现在，现代智能手机具有 SoC（片上系统），在客户端本身上也能够处理许多此类操作，但是，由于安全地检索和存储数据而受到的限制仍然迫使开发人员需要在服务器端进行计算和数据管理。因此，当前可以观察到数据传输能力方面存在瓶颈。

由于分布式数据存储和程序执行平台的进步，所有这些可能很快就会改变。[区块链][3]允许在分布式用户网络（而不是中央服务器）上进行安全的数据管理和程序执行，这在互联网历史上基本上是第一次。

以太坊就是一个这样的区块链平台，使开发人员可以访问用于在这样的去中心化网络上构建和运行应用程序的框架和工具。尽管它以其加密货币而广为人知，以太坊不只是<ruby>以太币<rt>ether</rt></ruby>（加密货币）。这是一种完整的<ruby>图灵完备<rt>Turing complete</rt></ruby>编程语言，旨在开发和部署 DApp（即<ruby>分布式应用<rt>Distributed APPlication</rt></ruby>） [^1]。我们会在接下来的一篇文章中详细介绍 DApp。

以太坊是开源的，默认情况下是一个公共（非许可）区块链，并具有一个大范围的智能合约平台底层（Solidity）。以太坊提供了一个称为“<ruby>以太坊虚拟机<rt>Ethereum virtual machine</rt></ruby>（EVM）”的虚拟计算环境，以运行应用程序和[智能合约][4] [^2]。以太坊虚拟机运行在世界各地的成千上万个参与节点上，这意味着应用程序数据在保证安全的同时，几乎不可能被篡改或丢失。

### 以太坊的背后：什么使之不同

在 2017 年，为了推广对以太坊区块链的功能的利用，技术和金融领域的 30 多个团队汇聚一堂。因此，“<ruby>以太坊企业联盟<rt>Ethereum Enterprise Alliance</rt></ruby>”（EEA）由众多支持成员组成，包括微软、摩根大通、思科、德勤和埃森哲。摩根大通已经拥有 Quorum，这是一个基于以太坊的去中心化金融服务计算平台，目前已经投入运行；而微软拥有基于以太坊的云服务，通过其 Azure 云业务销售 [^3]。

### 什么是以太币，它和以太坊有什么关系

以太坊的创建者<ruby>维塔利克·布特林<rt>Vitalik Buterin</rt></ruby>深谙去中心化处理平台的真正价值以及为比特币提供动力的底层区块链技术。他提议比特币应该开发以支持运行分布式应用程序（DApp）和程序（现在称为智能合约）的想法，未能获得多数同意。

因此，他在 2013 年发表的白皮书中提出了以太坊的想法。原始白皮书仍然保留，[可供][5]读者阅读。其理念是开发一个基于区块链的平台来运行智能合约和应用程序，这些合约和应用程序设计为在节点和用户设备上运行，而非服务器上运行。

以太坊系统经常被误认为就是加密货币以太币，但是，必须重申，以太坊是一个用于开发和执行应用程序的全栈平台，自成立以来一直如此，而比特币则不是。**以太网目前是按市值计算的第二大加密货币**，在撰写本文时，其平均交易价格为每个以太币 170 美元 [^4]。

### 该平台的功能和技术特性 [^5]

* 正如我们已经提到的，称为以太币的加密货币只是该平台功能之一。该系统的目的不仅仅是处理金融交易。 实际上，以太坊平台和比特币之间的主要区别在于它们的脚本能力。以太坊是以图灵完备的编程语言开发的，这意味着它具有类似于其他主要编程语言的脚本编程和应用程序功能。开发人员需要此功能才能在平台上创建 DApp 和复杂的智能合约，而该功能是比特币缺失的。
* 以太币的“挖矿”过程更加严格和复杂。尽管可以使用专用的 ASIC 来开采比特币，但以太坊使用的基本哈希算法（EThash）降低了 ASIC 在这方面的优势。
* 为激励矿工和节点运营者运行网络而支付的交易费用本身是使用称为 “<ruby>燃料<rt>Gas</rt></ruby>”的计算令牌来计算的。通过要求交易的发起者支付与执行交易所需的计算资源数量成比例的以太币，燃料提高了系统的弹性以及对外部黑客和攻击的抵抗力。这与其他平台（例如比特币）相反，在该平台上，交易费用与交易规模一并衡量。因此，以太坊的平均交易成本从根本上低于比特币。这也意味着在以太坊虚拟机上运行的应用程序需要付费，具体取决于应用程序要解决的计算问题。基本上，执行越复杂，费用就越高。
* 以太坊的出块时间估计约为 10 - 15 秒。出块时间是在区块链网络上打时间戳和创建区块所需的平均时间。与将在比特币网络上进行同样的交易要花费 10 分钟以上的时间相比，很明显，就交易和区块验证而言，以太坊要快得多。
* *有趣的是，对可开采的以太币数量或开采速度没有硬性限制，这导致其系统设计不像比特币那么激进*。

### 总结

尽管与以太坊相比，它远远超过了类似的平台，但在以太坊企业联盟开始推动之前，该平台本身尚缺乏明确的发展道路。虽然以太坊平台确实推动了企业发展，但必须注意，以太坊还可以满足小型开发商和个人的需求。 这样一来，为最终用户和企业开发的平台就为以太坊遗漏了许多特定功能。另外，以太坊基金会提出和开发的区块链模型是一种公共模型，而 Hyperledger 项目等项目提出的模型是私有的和需要许可的。

虽然只有时间才能证明以太坊、Hyperledger 和 R3 Corda 等平台中，哪一个平台会在现实场景中找到最多粉丝，但此类系统确实证明了以区块链为动力的未来主张背后的有效性。

[^1]: [Gabriel Nicholas, “Ethereum Is Coding’s New Wild West | WIRED,” Wired , 2017][6].
[^2]: [What is Ethereum? — Ethereum Homestead 0.1 documentation][7].
[^3]: [Ethereum, a Virtual Currency, Enables Transactions That Rival Bitcoin’s – The New York Times][8].
[^4]: [Cryptocurrency Market Capitalizations | CoinMarketCap][9].
[^5]: [Introduction — Ethereum Homestead 0.1 documentation][10].

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/blockchain-2-0-what-is-ethereum/

作者：[ostechnix][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/editor/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/04/Ethereum-720x340.png
[2]: https://linux.cn/article-11275-1.html
[3]: https://linux.cn/article-10650-1.html
[4]: https://linux.cn/article-10956-1.html
[5]: https://github.com/ethereum/wiki/wiki/White-Paper
[6]: https://www.wired.com/story/ethereum-is-codings-new-wild-west/
[7]: http://www.ethdocs.org/en/latest/introduction/what-is-ethereum.html#ethereum-virtual-machine
[8]: https://www.nytimes.com/2016/03/28/business/dealbook/ethereum-a-virtual-currency-enables-transactions-that-rival-bitcoins.html
[9]: https://coinmarketcap.com/
[10]: http://www.ethdocs.org/en/latest/introduction/index.html
