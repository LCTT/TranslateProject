[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Blockchain 2.0 – Explaining Smart Contracts And Its Types [Part 5])
[#]: via: (https://www.ostechnix.com/blockchain-2-0-explaining-smart-contracts-and-its-types/)
[#]: author: (editor https://www.ostechnix.com/author/editor/)

区块链 2.0：智能合约及其类型（五）
======

![Explaining Smart Contracts And Its Types][1]

这是 区块链 2.0 系列的第 5 篇文章。本系列的前一篇文章探讨了我们如何[在房地产行业实现区块链][2]。本文简要探讨了区块链及相关技术领域内的<ruby>智能合约<rt>Smart Contract</rt></ruby>主题。智能合约是在区块链上验证和创建新“数据块”的基本协议，它被吹捧为该系统未来发展和应用的焦点。 然而，像所有“万灵药”一样，它不是一切的答案。我们将从基础知识中探索这个概念，以了解“智能合约”是什么以及它们不是什么。

### 不断发展的合同

这个世界建立在合同（合约）之上。没有合约的使用和再利用，地球上任何个人或公司都不能在当前社会中发挥作用。创建、维护和执行合同的任务变得如此复杂，以至于必须以“合同法”的名义建立整个司法和法律系统以支持它。事实上，大多数合同都是由“受信任的”第三方监督，以确保最终的利益相关者按照达成的条件得到妥善处理。有些合同甚至涉及到了第三方受益人。此类合同旨在对不是合同的活跃（或参与）方的第三方产生影响。解决和争论合同义务占据了民事诉讼所涉及的大部分法律纠纷。当然，更好的处理合同的方式来对于个人和企业来说都是天赐之物。更不用说它将以验证和证明的名义拯救政府的巨大[文书工作][7] [^1]。

本系列中的大多数文章都研究了如何利用现有的区块链技术。相比之下，这篇文章将更多地讲述对未来几年的预期。关于“智能合约”的讨论是从前一篇文章中提出的财产讨论自然而然的演变而来的。当前这篇文章旨在概述区块链自动执行“智能”可执行程序的能力。务实地处理这个问题意味着我们首先必须定义和探索这些“智能合约”是什么，以及它们如何适应现有的合同系统。我们将在下一篇题为“区块链 2.0：正在进行的项目”的文章中查看当前正在进行的主要应用程序和项目。

### 定义智能合约

[本系列的第一篇文章][3]从基本的角度把区块链看作由以下数据块组成的“分布式分类账本”：

* 防篡改
* 不可否认（意味着每个数据块都是由某人明确创建的，并且该人不能否认相同的责任）
* 安全，且对传统的网络攻击方法具有抗性
* 几乎是永久性的（当然这取决于区块链协议层）
* 高度冗余，通过存在于多个网络节点或参与者系统上，其中一个节点的故障不会以任何方式影响系统的功能，并且，
* 根据应用可以提供更快的处理速度。

由于每个数据实例都是通过适当的凭证安全存储和访问的，因此区块链网络可以为精确验证事实和信息提供简便的基础，而无需第三方监督。区块链 2.0 开发也允许“分布式应用程序（DApp）”（我们将在即将发布的文章中详细介绍这个术语）。这些分布式应用程序根据要求存在并在网络上运行。当用户需要它们并通过使用已经过审查并存储在区块链中的信息来执行它们时，它们被调用。

上面的最后一段为定义智能合约提供了基础。<ruby>数字商务商会<rt>The Chamber for Digital Commerce</rt></ruby>提供了一个许多专家都同意的智能合约定义。

> “（智能合约是一种）计算机代码，在发生特定条件或条件时，能够根据预先指定的功能自动运行。该代码可以在分布式分类帐上存储和处理，并将任何结果更改写入分布式分类帐” [^2]。

智能合约如上所述是一种简单的计算机程序，就像 “if-then” 或 “if-else if” 语句一样工作。关于其“智能”的方面来自这样一个事实，即该程序的预定义输入来自区块链分类账本，如上所述，它是一个安全可靠的记录信息源。如果需要，程序可以调用外部服务或来源以获取信息从而验证操作条款，并且只有在满足所有预定义条件后才执行。

必须记住，与其名称所暗示的不同，智能合约通常不是自治实体，严格来说也不是合同。1996 年，Nick Szabo 于 很早就提到了智能合约，他将其与接受付款并交付用户选择产品的自动售货机进行了比较。可以在[这里][4]查看全文。此外，人们正在制定允许智能合约进入主流合同使用的法律框架，因此目前该技术的使用仅限于法律监督不那么明确和严格的领域 [^4]。

### 智能合约的主要类型

假设读者对合同和计算机编程有基本的了解，并且基于我们对智能合约的定义，我们可以将智能合约和协议粗略地分类为以下主要类别。

##### 1、智能分类账本合约

这些可能是最明显的类型。大多数（如果不是全部）合同都具有法律效力。在不涉及太多技术细节的情况下，智能的合法合约是涉及严格的法律追索权的合同，以防参与合同的当事人不履行其交易的目的。如前所述，不同国家和地区的现行法律框架缺乏对区块链智能和自动化合约的足够支持，其法律地位也不明确。但是，一旦制定了法律，就可以订立智能合约，以简化目前涉及严格监管的流程，如金融和房地产市场交易、政府补贴、国际贸易等。

##### 2、DAO

<ruby>去中心化的自治组织<rt>Decentralized Autonomous Organization</rt></ruby>，即DAO，可以松散地定义为区块链上存在的社区。社区可以通过一组规则来定义，这些规则通过智能合约来体现并放入代码中。然后，每个参与者的每一个行动都将受到这些规则的约束，其任务是在程序中断的情况下执行并获得追索权。许多智能合约构成了这些规则，它们协同监管和观察参与者。

名为 Genesis DAO 的 DAO 由以太坊参与者于 2016 年 5 月创建。该社区旨在成为众筹和风险投资平台。在极短的时间内，他们设法筹集了惊人的 1.5 亿美元。然而，黑客在系统中发现了漏洞，并设法从众筹投资者手中窃取价值约 5000 万美元的以太币。这次黑客破坏的后果导致以太坊区块链[分裂为两个][8]，以太坊和以太坊经典。 

##### 3、应用程序逻辑合约（ALC）

如果你已经听说过与区块链相关的物联网，那么很可能这个问题谈到了<ruby>应用程序逻辑合约<rt>Application logic contract</rt></ruby>，即 ALC。此类智能合约包含特定于应用程序的代码，这些代码可以与区块链上的其他智能合约和程序一起使用。它们有助于与设备之间的通信并进行通信验证（在物联网领域）。ALC 是每个多功能智能合约的关键部分，并且大多数都是在管理程序下工作。它们在这里引用的大多数例子中找到[应用][9] [^6]。

*由于该领域还在开发中，因此目前所说的任何定义或标准最多只能说是流畅而模糊的。*

### 智能合约是如何工作的？

为简化起见，让我们用个例子来说明。

约翰和彼得是两个争论足球比赛得分的人。他们对比赛结果持有相互矛盾的看法，他们都支持不同的团队（这是背景）。由于他们两个都需要去其他地方并且无法看完比赛，所以约翰认为如果 A 队在比赛中击败 B 队，他就*支付*给彼得 100 美元。彼得*考虑*之后*接受*了该赌注，同时明确表示他们必须接受这些条款。但是，他们都没有兑现该赌注的相互信任，也没有时间和钱来指定任命第三方来监督赌注。

假设约翰和彼得都使用智能合约平台，例如 [Etherparty][5]，它可以在合同谈判时自动结算赌注，他们都会将基于区块链的身份链接到合约，并设置条款，明确表示一旦比赛结束，程序将找出获胜方是谁，并自动将该金额从输家中归入获胜者银行账户。一旦比赛结束并且媒体报道同样的结果，该程序将在互联网上搜索规定的来源，确定哪支球队获胜，将其与合约条款联系起来，在这种情况下，如果 A 队赢了彼得将从约翰获得钱，也就是说将约翰的 100 美元转移到彼得的账户。执行完毕后，除非另有说明，否则智能合约将终止并在所有时间内处于非活动状态。

除了示例的简单性，情况涉及到一个经典合同，参与者选择使用智能合约实现了相同目的。所有的智能合约基本上都遵循类似的原则，程序被编码为在预定义的参数上执行，并且只抛出预期的输出。智能合同咨询的外部来源可能有时被称为 IT 世界中的<ruby>神谕<rt>Oracle</rt></ruby>。神谕是当今全球许多智能合约系统的常见部分。

在这种情况下使用智能合约使参与者可以获得以下好处：

* 它比在一起手动结算更快。
* 从等式中删除了信任问题。
* 消除了受信任的第三方代表有关各方处理和解的需要。
* 执行时无需任何费用。
* 处理参数和敏感数据的方式是安全的。
* 相关数据将永久保留在他们运行的区块链平台中，未来的投注可以通过调用相同的函数并为其添加输入来进行。
* 随着时间的推移，假设约翰和彼得赌博成瘾，该程序将帮助他们开发可靠的统计数据来衡量他们的连胜纪录。
   
现在我们知道**什么是智能合约**和**它们如何工作**，我们还没有解决**为什么我们需要它们**。

### 智能合约的需要

正如之前的例子我们重点提到过的，出于各种原因，我们需要智能合约。


#### 透明度

所涉及的条款和条件对交易对手来说非常清楚。此外，由于程序或智能合约的执行涉及某些明确的输入，因此用户可以非常直接地验证会影响他们和合约受益人的因素。

#### 时间效率高

如上所述，智能合约一旦被控制变量或用户调用触发就立即开始工作。由于数据通过区块链和网络中的其它来源即时提供给系统，因此执行不需要任何时间来验证和处理信息并解决交易。例如，转移土地所有权契约，这是一个涉及手工核实大量文书工作并且需要数周时间的过程，可以在几分钟甚至几秒钟内通过智能合约程序来处理文件和相关各方。

#### 精确

由于平台基本上只是计算机代码和预定义的内容，因此不存在主观错误，所有结果都是精确的，完全没有人为错误。

#### 安全

区块链的一个固有特征是每个数据块都是安全加密的。这意味着为了实现冗余，即使数据存储在网络上的多个节点上，**也只有数据所有者才能访问以查看和使用数据**。类似地，所有过程都将是完全安全和防篡改的，利用区块链在过程中存储重要变量和结果。同样也通过按时间顺序为审计人员提供原始的、未经更改的和不可否认的数据版本，简化了审计和法规事务。

#### 信任

这个文章系列开篇说到区块链为互联网及其上运行的服务增加了急需的信任层。智能合约在任何情况下都不会在执行协议时表现出偏见或主观性，这意味着所涉及的各方对结果完全有约束力，并且可以不附带任何条件地信任该系统。这也意味着此处不需要具有重要价值的传统合同中所需的“可信第三方”。当事人之间的犯规和监督将成为过去的问题。

#### 成本效益

如示例中所强调的，使用智能合约涉及最低成本。企业通常有专门从事使其交易是合法的并遵守法规的行政人员。如果交易涉及多方，则重复工作是不可避免的。智能合约基本上使前者无关紧要，并且消除了重复，因为双方可以同时完成尽职调查。

### Applications of Smart Contracts

Basically, if two or more parties use a common blockchain platform and agree on a set of principles or business logic, they can come together to create a smart contract on the blockchain and it is executed with no human intervention at all. No one can tamper with the conditions set and, any changes, if the original code allows for it, is timestamped and carries the editor’s fingerprint increasing accountability. Imagine a similar situation at a much larger enterprise scale and you understand what smart contracts are capable of and in fact a **Capgemini study** from 2016 found that smart contracts could actually be commercially mainstream **“in the early years of the next decade”** [8]. Commercial applications involve uses in Insurance, Financial Markets, IoT, Loans, Identity Management systems, Escrow Accounts, Employment contracts, and Patent & Royalty contracts among others. Platforms such as Ethereum, a blockchain designed keeping smart contracts in mind, allow for individual private users to utilize smart contracts free of cost as well.

A more comprehensive overview of the applications of smart contracts on current technological problems will be presented in the next article of the series by exploring the companies that deal with it.

### So, what are the drawbacks?

This is not to say that smart contracts come with no concerns regarding their use whatsoever. Such concerns have actually slowed down development in this aspect as well. The tamper-proof nature of everything blockchain essentially makes it next to impossible to modify or add new clauses to existing clauses if the parties involved need to without major overhaul or legal recourse.

Secondly, even though activity on a public blockchain is open for all to see and observe. The personal identities of the parties involved in a transaction are not always known. This anonymity raises question regarding legal impunity in case either party defaults especially since current laws and lawmakers are not exactly accommodative of modern technology.

Thirdly, blockchains and smart contracts are still subject to security flaws in many ways because the technology for all the interest in it is still in a very nascent stage of development. This inexperience with the code and platform is what ultimately led to the DAO incident in 2016.

All of this is keeping aside the significant initial investment that might be needed in case an enterprise or firm needs to adapt a blockchain for its use. The fact that these are initial one-time investments and come with potential savings down the road however is what interests people.

### Conclusion

Current legal frameworks don’t really support a full-on smart contract enabled society and won’t in the near future due to obvious reasons. A solution is to opt for **“hybrid” contracts** that combine traditional legal texts and documents with smart contract code running on blockchains designed for the purpose[4]. However, even hybrid contracts remain largely unexplored as innovative legislature is required to bring them into fruition. The applications briefly mentioned here and many more are explored in detail in the [**next post of the series**][6].

[^1]: S. C. A. Chamber of Digital Commerce, “Smart contracts – Is the law ready,” no. September, 2018.
[^2]: S. C. A. Chamber of Digital Commerce, “Smart contracts – Is the law ready,” no. September, 2018.
[^4]: Cardozo Blockchain Project, “‘Smart Contracts’ & Legal Enforceability,” vol. 2, p. 28, 2018.
[^6]: F. Idelberger, G. Governatori, R. Riveret, and G. Sartor, “Evaluation of Logic-Based Smart Contracts for Blockchain Systems,” 2016, pp. 167–183.
[^8]: B. Cant et al., “Smart Contracts in Financial Services : Getting from Hype to Reality,” Capgemini Consult., pp. 1–24, 2016.



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/blockchain-2-0-explaining-smart-contracts-and-its-types/

作者：[editor][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/editor/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/03/smart-contracts-720x340.png
[2]: https://linux.cn/article-10914-1.html
[3]: https://linux.cn/article-10650-1.html
[4]: http://www.fon.hum.uva.nl/rob/Courses/InformationInSpeech/CDROM/Literature/LOTwinterschool2006/szabo.best.vwh.net/smart_contracts_2.html
[5]: https://etherparty.com/
[6]: https://www.ostechnix.com/blockchain-2-0-ongoing-projects-the-state-of-smart-contracts-now/
[7]: http://www.legal-glossary.org/
[8]: https://futurism.com/the-dao-heist-undone-97-of-eth-holders-vote-for-the-hard-fork/
[9]: https://www.everestgrp.com/2016-10-types-smart-contracts-based-applications-market-insights-36573.html/
