[#]: collector: (lujun9972)
[#]: translator: (zionfuo)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11275-1.html)
[#]: subject: (Blockchain 2.0 – An Introduction To Hyperledger Project (HLP) [Part 8])
[#]: via: (https://www.ostechnix.com/blockchain-2-0-an-introduction-to-hyperledger-project-hlp/)
[#]: author: (editor https://www.ostechnix.com/author/editor/)

区块链 2.0：Hyperledger 项目简介（八）
======

![Introduction To Hyperledger Project][1]

一旦一个新技术平台在积极发展和商业利益方面达到了一定程度的受欢迎程度，全球的主要公司和小型的初创企业都急于抓住这块蛋糕。在当时 Linux 就是这样的一个平台。一旦实现了其应用程序的普及，个人、公司和机构就开始对其表现出兴趣，到 2000 年，Linux 基金会就成立了。

Linux 基金会旨在通过赞助他们的开发团队来将 Linux 作为一个平台来标准化和发展。Linux 基金会是一个由软件和 IT 巨头（[如微软、甲骨文、三星、思科、 IBM 、英特尔等][7]）支持的非营利组织。这不包括为改进该平台而提供服务的数百名个人开发者。多年来，Linux 基金会已经在旗下开展了许多项目。**Hyperledger** 项目是迄今为止发展最快的项目。

在将技术推进至可用且有用的方面上，这种联合主导的开发具有很多优势。为大型项目提供开发标准、库和所有后端协议既昂贵又耗费资源，而且不会从中产生丝毫收入。因此，对于公司来说，通过支持这些组织来汇集他们的资源来开发常见的那些 “烦人” 部分是有很意义的，以及随后完成这些标准部分的工作以简单地即插即用和定制他们的产品。除了这种模型的经济性之外，这种合作努力还产生了标准，使其容易使用和集成到优秀的产品和服务中。

上述联盟模式，在曾经或当下的创新包括 WiFi（Wi-Fi 联盟）、移动电话等标准。

### Hyperledger 项目（HLP）简介

Hyperledger 项目（HLP）于 2015 年 12 月由 Linux 基金会启动，目前是其孵化的增长最快的项目之一。它是一个<ruby>伞式组织<rt>umbrella organization</rt></ruby>，用于合作开发和推进基于[区块链][2]的分布式账本技术 (DLT) 的工具和标准。支持该项目的主要行业参与者包括 IBM、英特尔 和 SAP Ariba [等][3]。HLP 旨在为个人和公司创建框架，以便根据需要创建共享和封闭的区块链，以满足他们自己的需求。其设计原则是开发一个专注于隐私和未来可审计性的全球可部署、可扩展、强大的区块链平台。[^2] 同样要注意的是大多数提出的区块链及其框架。

### 开发目标和构造：即插即用

虽然面向企业的平台有以太坊联盟之类的产品，但根据定义，HLP 是面向企业的，并得到行业巨头的支持，他们在 HLP 旗下的许多模块中做出贡献并进一步发展。HLP 还孵化开发的周边项目，并这些创意项目推向公众。HLP 的成员贡献了他们自己的力量，例如 IBM 为如何协作开发贡献了他们的 Fabric 平台。该代码库由 IBM 在其项目组内部研发，并开源出来供所有成员使用。

这些过程使得 HLP 中的模块具有高度灵活的插件框架，这将支持企业环境中的快速开发和部署。此外，默认情况下，其他对比的平台是开放的<ruby>免许可链<rt>permission-less blockchain</rt></ruby>或是<ruby>公有链<rt>public blockchain</rt></ruby>，甚至可以将它们应用到特定应用当中。HLP 模块本身支持该功能。

有关公有链和私有链的差异和用例更多地涵盖在[这篇][4]比较文章当中。

根据该项目执行董事 Brian Behlendorf 的说法，Hyperledger 项目的使命有四个。

分别是：

 1. 创建企业级 DLT 框架和标准，任何人都可以移植以满足其特定的行业或个人需求。
 2. 创建一个强大的开源社区来帮助生态系统发展。
 3. 促进所述的生态系统的行业成员（如成员公司）的参与。
 4. 为 HLP 社区提供中立且无偏见的基础设施，以收集和分享相关的更新和发展。

可以在这里访问[原始文档][5]。

### HLP 的架构

HLP 由 12 个项目组成，这些项目被归类为独立的模块，每个项目通常都是结构化的，可以独立开发其模块的。在孵化之前，首先对它们的能力和活力进行研究。该组织的任何成员都可以提出附加建议。在项目孵化后，就会进行积极开发，然后才会推出。这些模块之间的互操作性具有很高的优先级，因此这些组之间的定期通信由社区维护。目前，这些项目中有 4 个被归类为活跃项目。被标为活跃意味着它们已经准备好使用，但还没有准备好发布主要版本。这 4 个模块可以说是推动区块链革命的最重要或相当基本的模块。稍后，我们将详细介绍各个模块及其功能。然而，Hyperledger Fabric 平台的简要描述，可以说是其中最受欢迎的。

### Hyperledger Fabric

Hyperledger Fabric 是一个完全开源的、基于区块链的许可 (非公开) DLT 平台，设计时考虑了企业的使用。该平台提供了适合企业环境的功能和结构。它是高度模块化的，允许开发人员在不同的共识协议、链上代码协议（[智能合约][6]）或身份管理系统等中进行选择。这是一个基于区块链的许可平台，它利用身份管理系统，这意味着参与者将知道彼此在企业环境中的身份。Fabric 允许以各种主流编程语言 (包括 Java、Javascript、Go 等) 开发智能合约（“<ruby>链码<rt>chaincode</rt></ruby>”，是 Hyperledger 团队使用的术语）。这使得机构和企业可以利用他们在该领域的现有人才，而无需雇佣或重新培训开发人员来开发他们自己的智能合约。与标准订单验证系统相比，Fabric 还使用<ruby>执行顺序验证<rt>execute-order-validate</rt></ruby>系统来处理智能合约，以提供更好的可靠性，这些系统由提供智能合约功能的其他平台使用。与标准订单验证系统相比，Fabric还使用执行顺序验证系统来处理智能合约，以提供更好的可靠性，这些系统由提供智能合约功能的其他平台使用。Fabric 的其他功能还有可插拔性能、身份管理系统、数据库管理系统、共识平台等，这些功能使它在竞争中保持领先地位。

### 结论

诸如 Hyperledger Fabric 平台这样的项目能够在主流用例中更快地采用区块链技术。Hyperledger 社区结构本身支持开放治理原则，并且由于所有项目都是作为开源平台引导的，因此这提高了团队在履行承诺时表现出来的安全性和责任感。

由于此类项目的主要应用涉及与企业合作及进一步开发平台和标准，因此 Hyperledger 项目目前在其他类似项目前面处于有利地位。

[^2]: E. Androulaki et al., “Hyperledger Fabric: A Distributed Operating System for Permissioned Blockchains,” 2018.

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/blockchain-2-0-an-introduction-to-hyperledger-project-hlp/

作者：[ostechnix][a]
选题：[lujun9972][b]
译者：[zionfuo](https://github.com/zionfuo)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/editor/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/04/Introduction-To-Hyperledger-Project-720x340.png
[2]: https://linux.cn/article-10650-1.html
[3]: https://www.hyperledger.org/members
[4]: https://linux.cn/article-11080-1.html
[5]: http://www.hitachi.com/rev/archive/2017/r2017_01/expert/index.html
[6]: https://linux.cn/article-10956-1.html
[7]: https://www.theinquirer.net/inquirer/news/2182438/samsung-takes-seat-intel-ibm-linux-foundation
