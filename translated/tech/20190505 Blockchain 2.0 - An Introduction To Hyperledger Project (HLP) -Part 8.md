[#]: collector: (lujun9972)
[#]: translator: (zionfuo)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Blockchain 2.0 – An Introduction To Hyperledger Project (HLP) [Part 8])
[#]: via: (https://www.ostechnix.com/blockchain-2-0-an-introduction-to-hyperledger-project-hlp/)
[#]: author: (editor https://www.ostechnix.com/author/editor/)

区块链2.0：Hyperledger项目简介（八）
======

![Introduction To Hyperledger Project][1]

一旦，一个新技术平台在积极发展和商业利益方面达到了普及的门槛，全球的主要公司和小型的初创企业都急于抓住这块蛋糕。在当时**Linux**就是这样的平台。一旦实现了其应用程序的普及，个人、公司和机构就开始对其表现出兴趣，到2000年，**Linux基金会**成立了。

Linux 基金会旨在通过赞助他们的开发团队来制定规范和开发Linux作为平台。Linux基金会是一个由软件和IT巨头（如微软、甲骨文、三星、思科、 IBM 、英特尔等[[1][7]]支持的非营利组织。这不包括为改善平台而提供服务的数百名个人开发者。多年来，Linux基金会已经开展了许多项目。**Hyperledger**项目是迄今为止发展最快的项目。

在将技术推进至可用且有用的方面上，这种联合主导的开发具有很多优势。为大型项目提供开发标准、库和所有后端协议既昂贵又资源密集型，而且不会从中产生丝毫收入。因此, 对于公司来说，通过支持这些组织来汇集他们的资源来开发常见的那些 “烦人” 部分是有很意义的，以及随后完成这些标准部分的工作以简单地即插即用和定制他们的产品。除了模型的经济性之外，这种合作努力还产生了标准，使其容易使用和集成到优秀的产品和服务中。

上述联盟模式，在曾经或当下使WiFi (The Wi-Fi alliance) 、移动电话等标准在制定方面得到了创新。


### Hyperledger (HLP) 项目简介

Hyperledger 项目于 2015年12月由 Linux 基金会启动，目前是其孵化的增长最快的项目之一。它是一个伞式组织（umbrella organization），用于合作开发和推进基于[区块链][2]的分布式账本技术 (DLT) 的工具和标准。支持该项目的主要行业参与者包括**IBM**、**英特尔**和**SAP Ariba**[等][3]。HLP 旨在为个人和公司创建框架，以便根据需要创建共享和封闭的区块链，以满足他们自己的需求。设计原则是开发一个专注于隐私和未来可审计性的全球可部署、可扩展、强大的区块链平台。

### 开发目标和构造: 即插即用

虽然面向企业的平台有以太坊联盟之类的产品，但根据定义，HLP是面向企业的，并得到行业巨头的支持，他们在HLP旗下的许多模块中做出贡献并进一步发展。还孵化开发的周边项目，并这些创意项目推向公众。Hyperledger 项目的成员贡献了他们自己的力量，例如IBM如何为协作开发贡献他们的Fabric平台。该代码库由IBM在其内部研究和开发，并开源出来供所有成员使用。

这些过程使得 HLP 中的模块具有高度灵活的插件框架，这将支持企业设置中的快速开发和推出。此外，默认情况下，其他类似的平台是开放的**无需许可链**（permission-less blockchain）或是**公有链**（public blockchain），HLP模块本身就是支持通过调试可以适应特定的功能。

在这篇关于[公有链和私有链][4]的比较入门文章中，更多地涵盖了公有链和私有链的差异和用例。

根据项目执行董事**Brian Behlendorf**的说法，Hyperledger项目的使命有四个。

分别是：

 1. 创建企业级DLT框架和标准，任何人都可以移植以满足其特定的工业或个人需求。
 2. 创建一个强大的开源社区来帮助生态系统。
 3. 促进所述生态系统的行业成员（如成员公司）的参与。
 4. 为HLP社区提供中立且无偏见的基础设施，以收集和分享相关的更新和发展。

可以在这里访问[原始文档][5]。

### HLP的架构

HLP由12个项目组成，这些项目被归类为独立的模块，每个项目通常都是独立构建和工作的，以开发他们的模块。在孵化之前，首先对它们的能力和生存能力进行研究。组织的任何成员都可以提出增加的建议。在项目孵化后，就会出现积极开发，然后才会推出。这些模块之间的互操作性被赋予了很高的优先级，因此这些组之间的定期通信由社区维护。目前，这些项目中有4个被归类为活动项目。活动标签意味着这些标签已经准备好使用，但还没有准备好发布重大版本。这4个模块可以说是推动区块链革命的最重要或最基本的模块。稍后，我们将详细介绍各个模块及其功能。然而，Hyperledger Fabric平台的简要描述，可以说是其中最受欢迎的。

### Hyperledger Fabric

**Hyperledger Fabric**[2]是一个完全开源的、基于区块链的许可 (非公开) DLT 平台，设计时考虑了企业的使用。该平台提供了适合企业环境的功能和结构。它是高度模块化的，允许开发人员在不同的一致协议、**链码协议**([智能合约][6]) 或身份管理系统等中进行选择。这是一个基于区块链的许可平台，利用身份管理系统，这意味着参与者将知道彼此在企业环境中需要的身份。Fabric允许以各种主流编程语言 (包括Java、Javascript、Go等) 开发智能合约(“链码”，是Hyperledger团队使用的术语)。这使得机构和企业可以利用他们在该领域的现有人才，而无需雇佣或重新培训开发人员来开发他们自己的智能合约。与标准订单验证系统相比，Fabric还使用执行顺序验证系统来处理智能合约，以提供更好的可靠性，这些系统由提供智能合约功能的其他平台使用。与标准订单验证系统相比，Fabric还使用执行顺序验证系统来处理智能合约，以提供更好的可靠性，这些系统由提供智能合约功能的其他平台使用。可插拔性能、身份管理系统、数据库管理系统、共识平台等是Fabric的其他功能，这些功能使它在竞争中保持领先地位。


### 结论

诸如Hyperledger Fabric平台这样的项目能够在主流用例中更快地采用区块链技术。Hyperledger社区结构本身支持开放治理原则，并且由于所有项目都是作为开源平台引导的，因此这提高了团队在履行承诺时表现出来的安全性和责任感。

由于此类项目的主要应用涉及与企业合作及进一步开发平台和标准，因此Hyperledger项目目前在其他类似项目前面处于有利地位。

**参考资料**

  * **[1][Samsung takes a seat with Intel and IBM at the Linux Foundation | TheINQUIRER][7]**
  * **[2] E. Androulaki et al., “Hyperledger Fabric: A Distributed Operating System for Permissioned Blockchains,” 2018.**

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/blockchain-2-0-an-introduction-to-hyperledger-project-hlp/

作者：[editor][a]
选题：[lujun9972][b]
译者：[zionfuo](https://github.com/zionfuo)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/editor/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/04/Introduction-To-Hyperledger-Project-720x340.png
[2]: https://www.ostechnix.com/blockchain-2-0-an-introduction/
[3]: https://www.hyperledger.org/members
[4]: https://www.ostechnix.com/blockchain-2-0-public-vs-private-blockchain-comparison/
[5]: http://www.hitachi.com/rev/archive/2017/r2017_01/expert/index.html
[6]: https://www.ostechnix.com/blockchain-2-0-explaining-smart-contracts-and-its-types/
[7]: https://www.theinquirer.net/inquirer/news/2182438/samsung-takes-seat-intel-ibm-linux-foundation
