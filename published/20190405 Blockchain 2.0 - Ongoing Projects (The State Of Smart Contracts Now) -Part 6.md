[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11013-1.html)
[#]: subject: (Blockchain 2.0 – Ongoing Projects (The State Of Smart Contracts Now) [Part 6])
[#]: via: (https://www.ostechnix.com/blockchain-2-0-ongoing-projects-the-state-of-smart-contracts-now/)
[#]: author: (editor https://www.ostechnix.com/author/editor/)

区块链 2.0：智能合约如今的发展（六）
======

![The State Of Smart Contracts Now][1]

继续我们的[前面的关于智能合约的文章][2]，这篇文章旨在讨论智能合约的发展形势，重点介绍目前正在该领域进行开发的一些项目和公司。如本系列前一篇文章中讨论的，智能合约是在区块链网络上存在并执行的程序。我们探讨了智能合约的工作原理以及它们优于传统数字平台的原因。这里描述的公司分布于各种各样的行业中，但是大多涉及到身份管理系统、金融服务、众筹系统等，因为这些是被认为最适合切换到基于区块链的数据库系统的领域。

### 开放平台

诸如 [Counterparty][8] 和 Solidity（以太坊）等平台是完全公用的构建模块，开发者可以以之创建自己的智能合约。大量的开发人员参与此类项目使这些项目成为开发智能合约、设计自己的加密货币令牌系统，以及创建区块链运行协议的事实标准。许多值得称赞的项目都来源于它们。摩根大通派生自以太坊的 [Quorum][9]，就是一个例子。而瑞波是另一个例子。

### 管理金融交易

通过互联网转账加密货币被吹捧为在未来几年会成为常态。与此相关的不足之处是：

* 身份和钱包地址是匿名的。如果接收方不履行交易，则付款人没有任何第一追索权。
* 错误交易（如果无法追踪任何交易）。
* 密码生成的哈希密钥很难用于人类，人为错误是主要关注点。

在这种情况下，可以让其他人暂时接受该交易并在接受尽职调查后与接收方结算。

[EscrowMyEther][10] 和 [PAYFAIR][11] 是两个这样的托管平台。基本上，托管公司采用商定的金额并向接收方发送令牌。一旦接收方通过相同的托管平台提供付款人想要的内容，两者都会确认并最终付款。 这些得到了自由职业者和业余爱好者收藏家广泛在线使用。

### 金融服务

小额融资和小额保险项目的发展将改善世界上大多数贫穷或没有银行账户的人的银行金融服务。据估计，社会中较贫穷的“无银行账户”人群可以为银行和机构的增加 3800 亿美元收入 [^5]。这一金额要远远超过银行切换到区块链分布式账本技术（DLT）预期可以节省的运营费用。

位于美国中西部的 BankQu Inc. 的口号是“通过身份而尊严”。他们的平台允许个人建立他们自己的数字身份记录，其中所有交易将在区块链上实时审查和处理。在底层代码上记录并为其用户构建唯一的在线标识，从而实现超快速的交易和结算。BankQu 案例研究探讨了他们如何以这种方式帮助个人和公司，可以在[这里][3]看到。

[Stratumn][12] 正在帮助保险公司通过自动化早期由人类微观管理的任务来提供更好的保险服务。通过自动化、端到端可追溯性和高效的数据隐私方法，他们彻底改变了保险索赔的结算方式。改善客户体验以及显著降低成本为客户和相关的公司带来双赢局面。

法国保险公司 [AXA][14] 目前正在试行类似的努力。其产品 [fizzy][13] 允许用户以少量费用订阅其服务并输入他们的航班详细信息。如果航班延误或遇到其他问题，该程序会自动搜索在线数据库，检查保险条款并将保险金额记入用户的帐户。这样就用户或客户无需在手动检查条款后提出索赔，并且就长期而言，一旦这样的系统成为主流，就增加了航空公司的责任心。

### 跟踪所有权

理论上可以利用 DLT 中的带时间戳的数据块来跟踪媒体的创建到最终用户消费。Peertracks 公司和 Mycelia 公司目前正在帮助音乐家发布内容，而不必担心其内容被盗或被滥用。他们帮助艺术家直接向粉丝和客户销售，同时获得工作报酬，而无需通过权利和唱片公司 [^9]。

### 身份管理平台

基于区块链的身份管理平台可以将你的身份存储在分布式分类帐本中。设置帐户后，会对其进行安全加密，然后将其发送给所有参与节点。但是，作为数据块的所有者，只有该用户才能访问该数据。一旦你在网络上建立身份并开始交易，网络中的自动程序将验证与你的帐户关联的先前所有的交易，在检查要求后将其发送给监管备案，并在程序认为交易合法时自动执行结算。这里的好处是，由于区块链上的数据是防篡改的，而智能合约以零偏差（或主观性）检查输入，如前所述，交易不需要任何人的监督或批准，并且需要小心是即刻生效的。

像 [ShoCard][15] 、[Credits][16] 和 [OneName][17] 这样的初创公司目前正在推出类似的服务，目前正在与政府和社会机构进行谈判，以便将它们整合到主流用途中。

开发商的其他独立项目如 Chris Ellis 和 David Duccini 分别开发或提出了替代的身份管理系统，分别是 “[世界公民][4]”和 [IDCoin][5]。Ellis 先生甚至通过在区块链网络上创建护照来证明他的工作能力。

### 资源共享

[Share & Charge][18] ([Slock.It][19]) 是一家欧洲的区块链初创公司。他们的移动应用程序允许房主和其他个人投入资金建立充电站与其他正在寻找快速充电的人分享他们的资源。这不仅使业主能够收回他们的一些投资，而且还允许 EV 司机在其近地域获得更多的充电点，从而允许供应商以方便的方式满足需求。一旦“客户”完成对其车辆的充电，相关的硬件就会创建一个由数据组成的安全时间戳块，并且在该平台上工作的智能合约会自动将相应的金额记入所有者账户。记录所有此类交易的跟踪并保持适当的安全验证。有兴趣的读者可以看一下[这里][6]，了解他们产品背后的技术角度。该公司的平台将逐步使用户能够与有需要的个人分享其他产品和服务，并从中获得被动收入。

我们在这里看到的公司，以及一个很短的正在进行中的项目的清单，这些项目利用智能合约和区块链数据库系统。诸如此类的平台有助于构建一个安全的“盒子”，其中包含仅由用户自己、其上的代码或智能合约访问的信息。基于触发器对信息进行实时审查、检查，并且算法由系统执行。这样的平台人为监督最小化，这是在安全数字自动化方面朝着正确方向迈出的急需的一步，这在以前从未被考虑过如此规模。

下一篇文章将阐述不同类型的区块链。单击以下链接以了解有关此主题的更多信息。

* [区块链 2.0：公有链与私有链的比较][7]


[^5]: B. Pani, “Blockchain Powered Financial Inclusion,” 2016.
[^9]: M. Gates, “Blockchain. Ultimate guide to understanding blockchain bitcoin cryptocurrencies smart-contracts and the future of money.pdf.” 2017.

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/blockchain-2-0-ongoing-projects-the-state-of-smart-contracts-now/

作者：[ostechnix][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/editor/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/04/State-Of-Smart-Contracts-720x340.png
[2]: https://linux.cn/article-10956-1.html
[3]: https://banqu.co/case-study/
[4]: https://github.com/MrChrisJ/World-Citizenship
[5]: https://github.com/IDCoin/IDCoin
[6]: https://blog.slock.it/share-charge-smart-contracts-the-technical-angle-58b93ce80f15
[7]: https://www.ostechnix.com/blockchain-2-0-public-vs-private-blockchain-comparison/
[8]: https://counterparty.io/platform/
[9]: https://www.jpmorgan.com/global/Quorum
[10]: http://escrowmyether.com/
[11]: https://payfair.io/
[12]: https://stratumn.com/business-case/insurance-claim-automation-across-europe/
[13]: https://fizzy.axa/en-gb/
[14]: https://group.axa.com/en/newsroom/news/axa-goes-blockchain-with-fizzy
[15]: https://techcrunch.com/2015/05/05/shocard-is-a-digital-identity-card-on-the-blockchain/
[16]: https://techcrunch.com/2014/10/31/your-next-passport-could-be-on-the-blockchain/
[17]: https://wiki.namecoin.org/index.php?title=OneName
[18]: https://blog.slock.it/share-charge-launches-its-app-on-boards-over-1-000-charging-stations-on-the-blockchain-ba8275390309
[19]: https://slock.it/
