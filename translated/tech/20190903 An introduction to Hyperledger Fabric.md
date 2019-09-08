[#]: collector: (lujun9972)
[#]: translator: (Morisun029)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (An introduction to Hyperledger Fabric)
[#]: via: (https://opensource.com/article/19/9/introduction-hyperledger-fabric)
[#]: author: (Matt Zand https://opensource.com/users/mattzandhttps://opensource.com/users/ron-mcfarlandhttps://opensource.com/users/wonderchook)

Hyperledger Fabric 介绍
======
Hyperledger （超级账本）是一组开源工具，旨在构建一个强大的，业务驱动的区块链框架。
![Chain image][1]

[Hyperledger][2] 是区块链行业中最大的项目之一，它由一组开源工具和多个子项目组成。该项目是由 Linux 基金会主办的一个全球协作项目，其中包括一些不同领域的领导者们，这些领导者们的目标是建立一个强大的，业务驱动的区块链框架。

区块链网络主要有三种类型：公共区块链，联盟或联合区块链，以及私有区块链。 Hyperledger 是一个区块链框架，旨在帮助公司建立私人或财团许可的区块链网络，在该网络中，多个组织可以共享控制和操作网络内节点的权限。

因为区块链是一个透明的，基于不可变模式的安全分散系统，所以它被认为是传统供应链行业改变游戏规则的一种解决方案。 它可以通过以下方式支持有效的供应链系统：

  * 跟踪整个区块链中的产品
  * 校验和验证区块链中的产品
  * 在供应链参与者之间共享整个区块链的信息
  * 提供可审核性

本文通过食品供应链的例子来解释 Hyperledger 区块链是如何改变传统供应链系统的。

### 食品行业供应链

传统供应链效率低下的主要原因是由于缺乏透明度而导致报告不可靠和竞争上的劣势。

在传统的供应链模式中，有关实体的信息对该区块链中的其他人来说并不完全透明，这就导致了报道不准确和缺乏互操作性问题。 电子邮件和印刷文档提供了一些信息，但它们不可能包含完整详细的可见性数据，因为很难在整个供应链中去追踪产品。 这也使消费者几乎不可能知道产品的真正价值和来源。

食品行业的供应链环境复杂，多个参与者需要协作将货物运送到最终目的地 - 客户手中。 下图显示了食品供应链（多级）网络中的主要参与者。
![典型的食品供应链][3]

该区块链的每个阶段都会引入潜在的安全问题，整合问题和其他低效问题。 目前食品供应链中的主要威胁仍然是假冒食品和食品欺诈。

基于 Hyperledger 区块链的食品跟踪系统可实现对食品信息全面的可视性和和可追溯性。 更重要的是，它以一种不变但可行的方式来记录产品细节，确保食品信息的真实性。最终用户通过在不可变框架上共享产品的详细信息，可以自我验证产品的真实性。

### Hyperledger Fabric

Hyperledger Fabric 是 Hyperledger 项目的基石。它是基于权限的区块链，或者更准确地说是一种分布式分类帐技术（DLT），该技术最初由 IBM 公司和 Digital Asset 创建。分布式分类帐技术被设计为具有不同组件的模块化框架（概述如下）。 它也是提供可插入的共识模型的一种灵活的解决方案，尽管它目前仅提供基于投票的许可共识（假设今天的 Hyperledger 网络在部分可信赖的环境中运行）。

鉴于此，匿名矿工无需验证交易，相关货币也无需用作激励措施。 所有的参与者必须经过身份验证才能参与到区块链，在区块链中进行交易。 与以太坊一样，Hyperledger Fabric 支持智能合约，在 Hyperledger 中称为 Chaincodes（链码），这些合同描述并执行系统的应用程序逻辑。

然而，与以太坊不同，Hyperledger Fabric 不需要昂贵的挖掘计算来提交交易，因此它有助构建区块链，使其在更短的延迟内向上扩展。

Hyperledger Fabric 不同于以太坊或比特币这样的区块链，不仅在于它们类型不同，或者说是它与货币无关，而且它们在内部机制方面也不同。以下是典型的Hyperledger网络的关键要素：

  * **Ledgers** 存储了一系列块，这些块保留了所有状态交易的所有不可变历史记录。
  * **Nodes** 区块链的逻辑实体。它有三种类型：
– **Clients** 是代表用户向网络提交事务的应用程序。 
– **Peers** 是提交交易并维护分类帐状态的实体。
– **Orderers** 在 Clients 和 peers 之间创建共享通信渠道，还将区块链交易打包成块发送给 peers 节点。

除了这些要素，Hyperledger Fabric 还有一下关键设计功能：

  * **Chaincode** （链码）类似于其他网络中的智能合约，如以太坊。它是用一种更高级的语言编写的程序，在分类帐当前状态的数据库执行完毕后执行。
  * **Channels**（通道）是用于在多个网络成员之间共享机密信息的专用通信子网。每笔交易都在一个只有经过身份验证和授权的各方可见的通道上执行。
  * **Endorsers** （背书人）验证建交易，调用 Chaincode，并将背书交易结果返回给调用应用程序。
  * **Membership Services Providers** (MSPs)（会员服务提供商）通过颁发和验证证书来提供身份验证和身份验证过程。 MSP 确定信任哪些证书颁发机构（CA）去定义信任域的成员，并确定成员可能扮演的特定角色（成员，管理员等）。



### 如何验证交易

探究一笔交易是如何通过验证的是理解 Hyperledger Fabric 如何在底层工作的好方法。此图显示了在典型的 Hyperledger 网络中处理交易的端到端系统流程：
![Hyperledger 交易验证流程][4]

首先，客户端通过向基于 Hyperledger Fabric 的应用程序客户端发送请求来启动交易，该客户端将交易提议提交给 Peers 节点。 这些节点通过执行交易指定的 Chaincode（使用状态的本地副本）并将结果发送回应用程序来模拟交易。 此时，应用程序将交易与背书相结合，并将其广播给 Ordering Service 节点。 Ordering Service 检查背书并为每个通道创建一个交易块，然后将其广播给通道中的其它节点，peers 验证交易并进行提交。

Hyperledger Fabric 区块链可以通过透明的、不变的、共享的食品来源数据记录，数据处理，及运输细节等信息将食品供应链中的参与者们连接起来。 Chaincode 由食品供应链中的授权参与者来调用。 所有执行的交易记录都永久保存在分类帐中，所有参与者都可以查看此信息。

### Hyperledger Composer

除了Fabric或Iroha等区块链框架外，Hyperledger项目还提供了Composer，Hyperledger Explorer和Cello等工具。 Hyperledger Composer提供了一个工具集，可帮助您更轻松地构建区块链应用程序。 它包括：

  * CTO,  一种建模语言
  * Playground, 一种基于浏览器的开发工具，用于快速测试和部署
  * 命令行界面（CLI）工具


Composer 支持 Hyperledger Fabric 的运行时和基础架构，在内部，Composer 的 API 使用底层 Fabric 的 API。 Composer 在 Fabric 上运行，这意味着 Composer 生成的业务网络可以部署到 Hyperledger Fabric 执行。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/introduction-hyperledger-fabric

作者：[Matt Zand][a]
选题：[lujun9972][b]
译者：[Morisun029](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mattzandhttps://opensource.com/users/ron-mcfarlandhttps://opensource.com/users/wonderchook
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/chain.png?itok=sgAjswFf (Chain image)
[2]: https://www.hyperledger.org/
[3]: https://opensource.com/sites/default/files/uploads/foodindustrysupplychain.png (Typical food supply chain)
[4]: https://opensource.com/sites/default/files/uploads/hyperledger-fabric-transaction-flow.png (Hyperledger transaction validation flow)
[5]: https://coding-bootcamps.com/ultimate-guide-for-building-a-blockchain-supply-chain-using-hyperledger-fabric-and-composer.html
