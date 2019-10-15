[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11461-1.html)
[#]: subject: (Blockchain 2.0 – Introduction To Hyperledger Fabric [Part 10])
[#]: via: (https://www.ostechnix.com/blockchain-2-0-introduction-to-hyperledger-fabric/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

区块链 2.0：Hyperledger Fabric 介绍（十）
======

![Hyperledger Fabric][1]

### Hyperledger Fabric

[Hyperledger 项目][2] 是一个伞形组织，包括许多正在开发的不同模块和系统。在这些子项目中，最受欢迎的是 “Hyperledger Fabric”。这篇博文将探讨一旦区块链系统开始大量使用到主流，将使 Fabric 在不久的将来成为几乎不可或缺的功能。最后，我们还将快速了解开发人员和爱好者们需要了解的有关 Hyperledger Fabric 技术的知识。

### 起源

按照 Hyperledger 项目的常规方式，Fabric 由其核心成员之一 IBM “捐赠”给该组织，而 IBM 以前是该组织的主要开发者。由 IBM 共享的这个技术平台在 Hyperledger 项目中进行了联合开发，来自 100 多个成员公司和机构为之做出了贡献。

目前，Fabric 正处于 LTS 版本的 v1.4，该版本已经发展很长一段时间，并且被视为企业管理业务数据的解决方案。Hyperledger 项目的核心愿景也必然会渗透到 Fabric 中。Hyperledger Fabric 系统继承了所有企业级的可扩展功能，这些功能已深深地刻入到 Hyperledger 组织旗下所有的项目当中。

### Hyperledger Fabric 的亮点

Hyperledger Fabric 提供了多种功能和标准，这些功能和标准围绕着支持快速开发和模块化体系结构的使命而构建。此外，与竞争对手（主要是瑞波和[以太坊][3]）相比，Fabric 明确用于封闭和[许可区块链][4]。它们的核心目标是开发一套工具，这些工具将帮助区块链开发人员创建定制的解决方案，而不是创建独立的生态系统或产品。

Hyperledger Fabric 的一些亮点如下：

#### 许可区块链系统

这是一个 Hyperledger Fabric 与其他平台（如以太坊和瑞波）差异很大的地方。默认情况下，Fabric 是一种旨在实现私有许可的区块链的工具。此类区块链不能被所有人访问，并且其中致力于达成共识或验证交易的节点将由中央机构进行选择。这对于某些应用（例如银行和保险）可能很重要，在这些应用中，交易必须由中央机构而不是参与者来验证。

#### 机密和受控的信息流

Fabric 内置了权限系统，该权限系统将视情况限制特定组或某些个人中的信息流。与公有区块链不同，在公有区块链中，任何运行节点的人都可以对存储在区块链中的数据进行复制和选择性访问，而 Fabric 系统的管理员可以选择谁能访问共享的信息，以及访问的方式。与现有竞争产品相比，它还有以更好的安全性标准对存储的数据进行加密的子系统。

#### 即插即用架构

Hyperledger Fabric 具有即插即用类型的体系结构。可以选择实施系统的各个组件，而开发人员看不到用处的系统组件可能会被废弃。Fabric 采取高度模块化和可定制的方式进行开发，而不是一种与其竞争对手采用的“一种方法适应所有需求”的方式。对于希望快速构建精益系统的公司和公司而言，这尤其有吸引力。这与 Fabric 和其它 Hyperledger 组件的互操作性相结合，意味着开发人员和设计人员现在可以使用各种标准化工具，而不必从其他来源提取代码并随后进行集成。它还提供了一种相当可靠的方式来构建健壮的模块化系统。

#### 智能合约和链码

运行在区块链上的分布式应用程序称为[智能合约][5]。虽然智能合约这个术语或多或少与以太坊平台相关联，但<ruby>链码<rt>chaincode</rt></ruby>是 Hyperledger 阵营中为其赋予的名称。链码应用程序除了拥有 DApp 中有的所有优点之外，使 Hyperledger 与众不同的是，该应用程序的代码可以用多种高级编程语言编写。它本身支持 [Go][6] 和 JavaScript，并且在与适当的编译器模块集成后还支持许多其它编程语言。尽管这一事实在此时可能并不代表什么，但这意味着，如果可以将现有人才用于正在进行的涉及区块链的项目，从长远来看，这有可能为公司节省数十亿美元的人员培训和管理费用。开发人员可以使用自己喜欢的语言进行编码，从而在 Hyperledger Fabric 上开始构建应用程序，而无需学习或培训平台特定的语言和语法。这提供了 Hyperledger Fabric 当前竞争对手无法提供的灵活性。

### 总结

* Hyperledger Fabric 是一个后端驱动程序平台，是一个主要针对需要区块链或其它分布式账本技术的集成项目。因此，除了次要的脚本功能外，它不提供任何面向用户的服务。（认可以为​​它更像是一种脚本语言。）
* Hyperledger Fabric 支持针对特定用例构建侧链。如果开发人员希望将一组用户或参与者隔离到应用程序的特定部分或功能，则可以通过侧链来实现。侧链是衍生自主要父代的区块链，但在其初始块之后形成不同的链。产生新链的块将不受新链进一步变化的影响，即使将新信息添加到原始链中，新链也将保持不变。此功能将有助于扩展正在开发的平台，并引入用户特定的和案例特定的处理功能。
* 前面的功能还意味着并非所有用户都会像通常对公有链所期望的那样拥有区块链中所有数据的“精确”副本。参与节点将具有仅与之相关的数据副本。例如，假设有一个类似于印度的 PayTM 的应用程序，该应用程序具有钱包功能以及电子商务功能。但是，并非所有的钱包用户都使用 PayTM 在线购物。在这种情况下，只有活跃的购物者将在 PayTM 电子商务网站上拥有相应的交易链，而钱包用户将仅拥有存储钱包交易的链的副本。这种灵活的数据存储和检索体系结构在扩展时非常重要，因为大量的单链区块链已经显示出会增加处理交易的前置时间。这样可以保持链的精简和分类。

我们将在以后的文章中详细介绍 Hyperledger Project 下的其他模块。

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/blockchain-2-0-introduction-to-hyperledger-fabric/

作者：[sk][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/05/Hyperledger-Fabric-720x340.png
[2]: https://www.ostechnix.com/blockchain-2-0-an-introduction-to-hyperledger-project-hlp/
[3]: https://www.ostechnix.com/blockchain-2-0-what-is-ethereum/
[4]: https://www.ostechnix.com/blockchain-2-0-public-vs-private-blockchain-comparison/
[5]: https://www.ostechnix.com/blockchain-2-0-explaining-smart-contracts-and-its-types/
[6]: https://www.ostechnix.com/install-go-language-linux/
