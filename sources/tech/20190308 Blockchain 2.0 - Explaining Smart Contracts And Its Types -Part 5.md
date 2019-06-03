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

### How smart contracts work**

To simplify things, let’s proceed by taking an example.

John and Peter are two individuals debating about the scores in a football match. They have conflicting views about the outcome with both of them supporting different teams (context). Since both of them need to go elsewhere and won’t be able to finish the match then, John bets that team A will beat team B in the match and _offers_ Peter $100 in that case. Peter _considers_ and _accepts_ the bet while making it clear that they are _bound_ to the terms. However, neither of them _trusts_ each other to honour the bet and they don’t have the time nor the money to appoint a _third party_ to oversee the same.

Assuming both John and Peter were to use a smart contract platform such as **[Etherparty][5]** , to automatically settle the bet at the time of the contract negotiation, they’ll both link their blockchain based identities to the contract and set the terms, making it clear that as soon as the match is over, the program will find out who the winning side is and automatically credit the amount to the winners bank account from the losers. As soon as the match ends and media outlets report the same, the program will scour the internet for the prescribed sources, identify which team won, relate it to the terms of the contract, in this case since B won Peter gets the money from John and after intimating both the parties transfers $100 from John’s to Peter’s account. After having executed, the smart contract will terminate and be inactive for all the time to come unless otherwise mentioned.

The simplicity of the example aside, the situation involved a classic contract (paying attention to the italicized words) and the participants chose to implement the same using a smart contract. All smart contracts basically work on a similar principle, with the program being coded to execute on predefined parameters and spitting out expected outputs only. The outside sources the smart contract consults for information is may a times referred to as the _Oracle_ in the IT world. Oracles are a common part of many smart contract systems worldwide today.

The use of a smart contract in this situation allowed the participants the following benefits:

  * It was faster than getting together and settling the bet manually.
  * Removed the issue of trust from the equation.
  * Eliminated the need for a trusted third party to handle the settlement on behalf of the parties involved.
  * Costed nothing to execute.
  * Is secure in how it handles parameters and sensitive data.
  * The associated data will remain in the blockchain platform they ran it on permanently and future bets can be placed on by calling the same function and giving it added inputs.
  * Gradually over time, assuming John and Peter develop gambling addictions, the program will help them develop reliable statistics to gauge their winning streaks.



Now that we know **what smart contracts are** and **how they work** , we’re still yet to address **why we need them**.

### The need for smart contracts

As the previous example we visited highlights we need smart contracts for a variety of reasons.

##### **Transparency**

The terms and conditions involved are very clear to the counterparties. Furthermore, since the execution of the program or the smart contract involves certain explicit inputs, users have a very direct way of verifying the factors that would impact them and the contract beneficiaries.

##### Time Efficient

As mentioned, smart contracts go to work immediately once they’re triggered by a control variable or a user call. Since data is made available to the system instantaneously by the blockchain and from other sources in the network, the execution does not take any time at all to verify and process information and settle the transaction. Transferring land title deeds for instance, a process which involved manual verification of tons of paperwork and takes weeks on normal can be processed in a matter of minutes or even seconds with the help of smart contract programs working to vet the documents and the parties involved.

##### Precision

Since the platform is basically just computer code and everything predefined, there can be no subjective errors and all the results will be precise and completely free of human errors.

##### Safety

An inherent feature of the blockchain is that every block of data is cryptographically encrypted. Meaning even though the data is stored on a multitude of nodes on the network for redundancy, **only the owner of the data has access to see and use the data**. Similarly, all process will be completely secure and tamper proof with the execution utilizing the blockchain for storing important variables and outcomes in the process. The same also simplifies auditing and regulatory affairs by providing auditors with a native, un-changed and non-repudiable version of the data chronologically.

##### Trust

The article series started by saying that blockchain adds a much-needed layer of trust to the internet and the services that run on it. The fact that smart contracts will under no circumstances show bias or subjectivity in executing the agreement means that parties involved are fully bound the outcomes and can trust the system with no strings attached. This also means that the **“trusted third-party”** required in conventional contracts of significant value is not required here. Foul play between the parties involved and oversight will be issues of the past.

##### Cost effective

As highlighted in the example, utilizing a smart contract involves minimal costs. Enterprises usually have administrative staff who work exclusively for making that transactions they undertake are legitimate and comply with regulations. If the deal involved multiple parties, duplication of the effort is unavoidable. Smart contracts essentially make the former irrelevant and duplication is eliminated since both the parties can simultaneously have their due diligence done.

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
