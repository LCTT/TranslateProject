[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (An introduction to Hyperledger Fabric)
[#]: via: (https://opensource.com/article/19/9/introduction-hyperledger-fabric)
[#]: author: (Matt Zand https://opensource.com/users/mattzandhttps://opensource.com/users/ron-mcfarlandhttps://opensource.com/users/wonderchook)

An introduction to Hyperledger Fabric
======
Hyperledger is a set of open source tools aiming to build a robust,
business-driven blockchain framework.
![Chain image][1]

One of the biggest projects in the blockchain industry, [Hyperledger][2], is comprised of a set of open source tools and subprojects. It's a global collaboration hosted by The Linux Foundation and includes leaders in different sectors who are aiming to build a robust, business-driven blockchain framework.

There are three main types of blockchain networks: public blockchains, consortiums or federated blockchains, and private blockchains. Hyperledger is a blockchain framework that aims to help companies build private or consortium permissioned blockchain networks where multiple organizations can share the control and permission to operate a node within the network.

Since a blockchain is a transparent, immutable, and secure decentralized system, it is considered a game-changing solution for traditional supply chain industries. It can support an effective supply chain system by:

  * Tracking the products in the entire chain
  * Verifying and authenticating the products in the chain
  * Sharing the entire chain's information between supply chain actors
  * Providing auditability



This article uses the example of a food supply chain to explain how a Hyperledger blockchain can transform a traditional supply chain.

### Food industry supply chains

The main reason for classic supply chain inefficiency is lack of transparency, leading to unreliable reporting and competitive disadvantage.

In traditional supply chain models, information about an entity is not fully transparent to others in the chain, which leads to inaccurate reports and a lack of interoperability. Emails and printed documents provide some information, but they can't contain fully detailed visibility data because the products are hard to trace across the entire supply chain. This also makes it nearly impossible for a consumer to know the true value and origin of a product.

The food industry's supply chain is a difficult landscape, where multiple actors need to coordinate to deliver goods to their final destination, the customers. The following diagram shows the key actors in a food supply chain (multi-echelon) network.

![Typical food supply chain][3]

Every stage of the chain introduces potential security vulnerabilities, integration problems, and other inefficiency issues. The main growing threat in current food supply chains remains counterfeit food and food fraud.

A food-tracking system based on the Hyperledger blockchain enables full visibility, tracking, and traceability. More importantly, it ensures the authenticity of food by recording a product's details in an immutable and viable way. By sharing a product's details over an immutable framework, the end user can self-verify a product's authenticity.

### Hyperledger Fabric

Hyperledger Fabric is the cornerstone of the Hyperledger project. It is a permission-based blockchain, or more accurately a distributed ledger technology (DLT), which was originally created by IBM and Digital Asset. It is designed as a modular framework with different components (outlined below). It is also a flexible solution offering a pluggable consensus model, although it currently only provides permissioned, voting-based consensus (with the assumption that today's Hyperledger networks operate in a partially trustworthy environment).

Given this, there is no need for anonymous miners to validate transactions nor for an associated currency to act as an incentive. All participants must be authenticated to participate and transact on the blockchain. Like with Ethereum, Hyperledger Fabric supports smart contracts, called Chaincodes in Hyperledger, and these contracts describe and execute the system's application logic.

Unlike Ethereum, however, Hyperledger Fabric doesn't require expensive mining computations to commit transactions, so it can help build blockchains that can scale up with less latency.

Hyperledger Fabric is different from blockchains such as Ethereum or Bitcoin, not only in its type or because it is currency-agnostic, but also in terms of its internal machinery. Following are the key elements of a typical Hyperledger network:

  * **Ledgers** store a chain of blocks that keep all immutable historical records of all state transitions.
  * **Nodes** are the logical entities of the blockchain. There are three types:
– **Clients** are applications that act on behalf of a user to submit transactions to the network.
– **Peers** are entities that commit transactions and maintain the ledger state.
– **Orderers** create a shared communication channel between clients and peers; they also package blockchain transactions into blocks and send them to committing peers



Along with these elements, Hyperledger Fabric is based on the following key design features:

  * **Chaincode** is similar to a smart contract in other networks, such as Ethereum. It is a program written in a higher-level language that executes against the ledger's current-state database.
  * **Channels** are private communication subnets for sharing confidential information between multiple network members. Each transaction is executed on a channel that is visible only to the authenticated and authorized parties.
  * **Endorsers** validate transactions, invoke Chaincode, and send the endorsed transaction results back to the calling applications.
  * **Membership Services Providers** (MSPs) provide identity validation and authentication processes by issuing and validating certificates. An MSP identifies which certification authorities (CAs) are trusted to define the members of a trust domain and determines the specific roles an actor might play (member, admin, and so on).



### How transactions are validated

Exploring how a transaction gets validated is a good way to understand how Hyperledger Fabric works under the hood. This diagram shows the end-to-end system flow for processing a transaction in a typical Hyperledger network:

![Hyperledger transaction validation flow][4]

First, the client initiates a transaction by sending a request to a Hyperledger Fabric-based application client, which submits the transaction proposal to endorsing peers. These peers simulate the transaction by executing the Chaincode (using a local copy of the state) specified by the transaction and sending the results back to the application. At this point, the application combines the transaction with the endorsements and broadcasts it to the Ordering Service. The Ordering Service checks the endorsements and creates a block of transactions for each channel before broadcasting them to all peers in the channel. Peers then verify the transactions and commit them.

The Hyperledger Fabric blockchain can connect food supply chain participants through a transparent, permanent, and shared record of food-origin data, processing data, shipping details, and more. The Chaincode is invoked by authorized participants in the food supply chain. All executed transaction records are permanently saved in the ledger, and all entities can look up this information.

### Hyperledger Composer

Alongside blockchain frameworks such as Fabric or Iroha, the Hyperledger project provides tools such as Composer, Hyperledger Explorer, and Cello. Hyperledger Composer provides a toolset to help build blockchain applications more easily. It consists of:

  * CTO, a modeling language
  * Playground, a browser-based development tool for rapid testing and deployment
  * A command-line interface (CLI) tool



Composer supports the Hyperledger Fabric runtime and infrastructure, and internally the composer's API utilizes the underlying Fabric API. Composer runs on Fabric, meaning the business networks generated by Composer can be deployed to Hyperledger Fabric for execution.

To learn more about Hyperledger, visit the [project's website][2], where you can view the members, access training and tutorials, or find out how you can contribute.

* * *

_This article is adapted from [Coding Bootcamp's article Building A Blockchain Supply Chain Using Hyperledger Fabric and Composer][5] and is used with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/introduction-hyperledger-fabric

作者：[Matt Zand][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mattzandhttps://opensource.com/users/ron-mcfarlandhttps://opensource.com/users/wonderchook
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/chain.png?itok=sgAjswFf (Chain image)
[2]: https://www.hyperledger.org/
[3]: https://opensource.com/sites/default/files/uploads/foodindustrysupplychain.png (Typical food supply chain)
[4]: https://opensource.com/sites/default/files/uploads/hyperledger-fabric-transaction-flow.png (Hyperledger transaction validation flow)
[5]: https://coding-bootcamps.com/ultimate-guide-for-building-a-blockchain-supply-chain-using-hyperledger-fabric-and-composer.html
