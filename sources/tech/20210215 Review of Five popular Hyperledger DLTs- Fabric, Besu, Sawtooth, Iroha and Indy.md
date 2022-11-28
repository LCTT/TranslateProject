[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Review of Five popular Hyperledger DLTs- Fabric, Besu, Sawtooth, Iroha and Indy)
[#]: via: (https://www.linux.com/news/review-of-five-popular-hyperledger-dlts-fabric-besu-sawtooth-iroha-and-indy/)
[#]: author: (Dan Brown https://training.linuxfoundation.org/announcements/review-of-five-popular-hyperledger-dlts-fabric-besu-sawtooth-iroha-and-indy/)

Review of Five popular Hyperledger DLTs- Fabric, Besu, Sawtooth, Iroha and Indy
======

_by Matt Zand_

As companies are catching up in adopting blockchain technology, the choice of a private blockchain platform becomes very vital. Hyperledger, whose open source projects support/power more [enterprise blockchain use cases][1] than others, is currently leading the race of private Distributed Ledger Technology (DLT) implementation. Working from the assumption that you know how blockchain works and what is the design philosophy behind [Hyperledger’s ecosystem][2], in this article we will briefly review five active Hyperledger DLTs. In addition to DLTs discussed in this article, Hyperledger ecosystem has more supporting tools and libraries that I will cover in more detail in my future articles.

This article mainly targets those who are relatively new to Hyperledger. This article would be a great resource for those interested in providing blockchain solution architect services and doing blockchain enterprise consulting and development. The materials included in this article will help you understand Hyperledger DLTs as a whole and use its high-level overview as a guideline for making the best of each Hyperledger project.

Since Hyperledger is supported by a robust open source community, new projects are being added to the Hyperledger ecosystem regularly. At the time of this writing, Feb 2021, it consists of six active projects and 10 others which are at the incubation stage. Each project has unique features and advantages.

**1- Hyperledger Fabric**

[Hyperledger Fabric][3] is the most popular Hyperledger framework. Smart contracts (also known as **chaincode**) are written in [Golang][4] or JavaScript, and run in Docker containers. Fabric is known for its extensibility and allows enterprises to build distributed ledger networks on top of an established and successful architecture. A permissioned blockchain, initially contributed by IBM and Digital Asset,  Fabric is designed to be a foundation for developing applications or solutions with a modular architecture. It takes plugin components for providing functionalities such as consensus and membership services. Like Ethereum, Hyperledger Fabric can host and execute smart contracts, which are named chaincode. A Fabric network consists of peer nodes, which execute smart contracts (chaincode), query ledger data, validate transactions, and interact with applications. User-entered transactions are channeled to an ordering service component, which initially serves to be a consensus mechanism for Hyperledger Fabric. Special nodes called Orderer nodes validate the transactions, ensure the consistency of the blockchain, and send the validated transactions to the peers of the network as well as to membership service provider (MSP) services.

Two major highlights of Hyperledger Fabric versus Ethereum are:

  * **Multi-ledger**: Each node on Ethereum has a replica of a single ledger in the network. However, Fabric nodes can carry multiple ledgers on each node, which is a great feature for enterprise applications.
  * **Private Data**: In addition to a private channel feature, unlike with Ethereum, Fabric members within a consortium can exchange private data among themselves without disseminating them through Fabric channel, which is very useful for enterprise applications.



[Here][5] is a good article for reviewing all Hyperledger Fabric components like peer, channel and, chaincode that are essential for building blockchain applications. In short, thorough understanding of all Hyperledger Fabric components is highly recommended for building, deploying and managing enterprise-level Hyperledger Fabric applications.

**2- Hyperledger Besu**

Hyperledger Besu is an open source Ethereum client developed under the Apache 2.0 license and written in Java. It can be run on the Ethereum public network or on private permissioned networks, as well as test networks such as Rinkeby, Ropsten, and Gorli. Hyperledger Besu supports several consensus algorithms including PoW, PoA, and IBFT, and has comprehensive permissioning schemes designed specifically for uses in a consortium environment.

Hyperledger Besu implements the Enterprise Ethereum Alliance (EEA) specification. The EEA specification was established to create common interfaces amongst the various open and closed source projects within Ethereum, to ensure users do not have vendor lock-in, and to create standard interfaces for teams building applications. Besu implements enterprise features in alignment with the EEA client specification.

As a basic Ethereum Client, Besu has the following features:

  * It connects to the blockchain network to synchronize blockchain transaction data or emit events to the network.
  * It processes transactions through smart contracts in an Ethereum Virtual Machine (EVM) environment.
  * It uses a data storage of networks (blocks).
  * It publishes client API interfaces for developers to interact with the blockchain network.



Besu implements [Proof of Work][6] and [Proof of Authority][7] (PoA) consensus mechanisms. Further, Hyperledger Besu implements several PoA protocols, including Clique and IBFT 2.0.

Clique is a proof-of-authority blockchain consensus protocol. The blockchain runs Clique protocol maintaining the list of authorized signers. These approved signers directly mine and seal all blocks without mining. Therefore, the transaction task is computationally light. When creating a block, a miner collects and executes transactions, updates the network state with the calculated hash of the block and signs the block using his private key. By using a defined period of time to create a block, Clique can limit the number of processed transactions.

IBFT 2.0 (Istanbul BFT 2.0) is a PoA **Byzantine-Fault-Tolerant** (**BFT**) blockchain consensus protocol. Transactions and blocks in the network are validated by authorized accounts, known as validators. Validators collect, validate and execute transactions and create the next block. Existing validators can propose and vote to add or remove validators and maintain a dynamic validator set. The consensus can ensure immediate finality. As the name suggests, IBFT 2.0 builds upon the IBFT blockchain consensus protocol with improved safety and liveness. In IBFT 2.0 blockchain, all valid blocks are directly added in the main chain and there are no forks.

**3- Hyperledger Sawtooth**

Sawtooth is the second Hyperledger project to reach 1.0 release maturity. Sawtooth-core is written in Python, while Sawtooth Raft and Sawtooth Sabre are written in Rust. It also has JavaScript and Golang components. Sawtooth supports both permissioned and permissionless deployments. It supports the EVM through a collaboration with the Hyperledger Burrow. By design, Hyperledger Sawtooth is created to address issues of performance. As such, one of its distinct features compared to other Hyperledger DLTs is that each node in Sawtooth can act as an orderer by validating and approving a transaction. Other notable features are:

  * **Parallel Transaction Execution**: While many blockchains use serial transaction execution to ensure consistent ordering at every node on the network, Sawtooth follows an advanced parallel scheduler that classifies transactions into parallel flows that eventually leads to the boost in transaction processing performance.
  * **Separation of Application from Core**: Sawtooth simplifies the development and deployment of an application by separating the application level from the core system level. It offers smart contract abstraction to allow developers to create contract logic in the programming language of their choice.
  * **Custom Transaction Processors**: In Sawtooth, each application can define the custom transaction processors to meet its unique requirements. It provides transaction families to serve as an approach for low-level functions, like storing on-chain permissions, managing chain-wide settings and for particular applications such as saving block information and performance analysis.



**4- Hyperledger Iroha**

Hyperledger Iroha is designed to target the creation and management of complex digital assets and identities. It is written in C++ and is user friendly. Iroha has a powerful role-based model for access control and supports complex analytics. While using Iroha for identity management, querying and performing commands are only limited to the participants who have access to the Iroha network. A robust permissions system ensures that all transactions are secure and controlled. Some of its highlights are:

  * **Ease of use:** You can easily create and manage simple, as well as complex, digital assets (e.g., cryptocurrency or personal medical data).
  * **Built-in Smart Contracts:** You can easily integrate blockchain into a business process using built-in smart-contracts called “commands.” As such, developers need not to write complicated smart-contracts because they are available in the form of commands.
  * **BFT:** Iroha uses BFT consensus algorithm which makes it suitable for businesses that require verifiable data consistency at a low cost.



**5- Hyperledger Indy**

As a self-sovereign identity management platform, Hyperledger Indy is built explicitly for decentralized identity management. The server portion, Indy node, is built in Python, while the Indy SDK is written in Rust. It offers tools and reusable components to manage digital identities on blockchains or other distributed ledgers. Hyperledger Indy architecture is well-suited for every application that requires heavy work on identity management since Indy is easily interpretable across multiple domains, organization silos and applications. As such, identities are securely stored and shared with all parties involved. Some notable highlights of Hyperledger Indy are:

●        Identity Correlation-resistant: According to the Hyperledger Indy documentation, Indy is completely identity correlation-resistant. So, you do not need to worry about connecting or mixing one Id with another. That means, you can not connect two Ids or find two similar Ids in the ledger.

●        Decentralized Identifiers (DIDs): According to the Hyperledger Indy documentation, all the decentralized identifiers are globally resolvable and unique without needing any central party in the mix. That means, every decentralized identity on the Indy platform will have a unique identifier that will solely belong to you. As a result, no one can claim or even use your identity on your behalf. So, it would eliminate the chances of identity theft.

●        Zero-Knowledge Proofs: With help from Zero-Knowledge Proof, you can disclose only the information necessary without anything else. So, when you have to prove your credentials, you can only choose to release the information that you need depending on the party that is requesting it. For instance, you may choose to share your data of birth only with one party whereas to release your driver license and financial docs to another. In short, Indy gives users great flexibility in sharing their private data whenever and wherever needed.

**Summary**

In this article, we briefly reviewed five popular Hyperledger DLTs. We started off by going over Hyperledger Fabric and its main components and some of its highlights compared to public blockchain platforms like Ethereum. Even though Fabric is currently used heavily for supply chain management, if you are doing lots of specific works in supply chain domain, you should explore Hyperledger Grid too. Then, we moved on to learning how to use Hyperledger Besu for building public consortium blockchain applications that support multiple consensus algorithms and how to manage Besu from EVM. Next, we covered some highlights of Hyperledger Sawtooth such as how it is designed for high performance. For instance, we learned how a single node in Sawtooth can act as an orderer by approving and validating transactions in the network. The last two DLTs (Hyperledger Iroha and Indy) are specifically geared toward digital asset management and identity . So if you are working on a project that heavily uses identity management, you should explore and use either Iroha or Indy instead of Fabric.

I have included reference and resource links for those interested in exploring topics discussed in this article in depth.

For more references on all Hyperledger projects, libraries and tools, visit the below documentation links:

  1. [Hyperledger Indy Project][8]
  2. [Hyperledger Fabric Project][9]
  3. [Hyperledger Aries Library][10]
  4. [Hyperledger Iroha Project][11]
  5. [Hyperledger Sawtooth Project][12]
  6. [Hyperledger Besu Project][13]
  7. [Hyperledger Quilt Library][14]
  8. [Hyperledger Ursa Library][15]
  9. [Hyperledger Transact Library][16]
  10. [Hyperledger Cactus Project][17]
  11. [Hyperledger Caliper Tool][18]
  12. [Hyperledger Cello Tool][19]
  13. [Hyperledger Explorer Tool][20]
  14. [Hyperledger Grid (Domain Specific)][21]
  15. [Hyperledger Burrow Project][22]
  16. [Hyperledger Avalon Tool][23]



**Resources**

  * Free Training Courses from The Linux Foundation &amp; Hyperledger
    * [Blockchain: Understanding Its Uses and Implications (LFS170)][24]
    * [Introduction to Hyperledger Blockchain Technologies (LFS171)][25]
    * [Introduction to Hyperledger Sovereign Identity Blockchain Solutions: Indy, Aries &amp; Ursa (LFS172)][26]
    * [Becoming a Hyperledger Aries Developer (LFS173)][27]
    * [Hyperledger Sawtooth for Application Developers (LFS174)][28]
  * eLearning Courses from The Linux Foundation &amp; Hyperledger
    * [Hyperledger Fabric Administration (LFS272)][29]
    * [Hyperledger Fabric for Developers (LFD272)][30]
  * Certification Exams from The Linux Foundation &amp; Hyperledger
    * [Certified Hyperledger Fabric Administrator (CHFA)][31]
    * [Certified Hyperledger Fabric Developer (CHFD)][32]
  * [Hands-On Smart Contract Development with Hyperledger Fabric V2][33] Book by Matt Zand and others.
  * [Essential Hyperledger Sawtooth Features for Enterprise Blockchain Developers][34]
  * [Blockchain Developer Guide- How to Install Hyperledger Fabric on AWS][35]
  * [Blockchain Developer Guide- How to Install and work with Hyperledger Sawtooth][36]
  * [Intro to Blockchain Cybersecurity (Coding Bootcamps)][37]
  * [Intro to Hyperledger Sawtooth for System Admins (Coding Bootcamps)][38]
  * [Blockchain Developer Guide- How to Install Hyperledger Iroha on AWS][39]
  * [Blockchain Developer Guide- How to Install Hyperledger Indy and Indy CLI on AWS][40]
  * [Blockchain Developer Guide- How to Configure Hyperledger Sawtooth Validator and REST API on AWS][41]
  * [Intro blockchain development with Hyperledger Fabric (Coding Bootcamps)][42]
  * [How to build DApps with Hyperledger Fabric][43]
  * [Blockchain Developer Guide- How to Build Transaction Processor as a Service and Python Egg for Hyperledger Sawtooth][44]
  * [Blockchain Developer Guide- How to Create Cryptocurrency Using Hyperledger Iroha CLI][45]
  * [Blockchain Developer Guide- How to Explore Hyperledger Indy Command Line Interface][46]
  * [Blockchain Developer Guide- Comprehensive Blockchain Hyperledger Developer Guide from Beginner to Advance Level][47]
  * [Blockchain Management in Hyperledger for System Admins][48]
  * [Hyperledger Fabric for Developers (Coding Bootcamps)][49]
  * [Free White Papers from Hyperledger][50]
  * [Free Webinars from Hyperledger][51]
  * [Hyperledger Wiki][52]



**About the Author**

**Matt Zand** is a serial entrepreneur and the founder of 3 tech startups: [DC Web Makers][53], [Coding Bootcamps][54] and [High School Technology Services][55]. He is a leading author of [Hands-on Smart Contract Development with Hyperledger Fabric][33] book by O’Reilly Media. He has written more than 100 technical articles and tutorials on blockchain development for Hyperledger, Ethereum and Corda R3 platforms. At DC Web Makers, he leads a team of blockchain experts for consulting and deploying enterprise decentralized applications. As chief architect, he has designed and developed blockchain courses and training programs for Coding Bootcamps. He has a master’s degree in business management from the University of Maryland. Prior to blockchain development and consulting, he worked as senior web and mobile App developer and consultant, angel investor, business advisor for a few startup companies. You can connect with him on LI: <https://www.linkedin.com/in/matt-zand-64047871>

The post [Review of Five popular Hyperledger DLTs- Fabric, Besu, Sawtooth, Iroha and Indy][56] appeared first on [Linux Foundation – Training][57].

--------------------------------------------------------------------------------

via: https://www.linux.com/news/review-of-five-popular-hyperledger-dlts-fabric-besu-sawtooth-iroha-and-indy/

作者：[Dan Brown][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://training.linuxfoundation.org/announcements/review-of-five-popular-hyperledger-dlts-fabric-besu-sawtooth-iroha-and-indy/
[b]: https://github.com/lujun9972
[1]: https://blockchain.dcwebmakers.com/blog/comprehensive-overview-and-analysis-of-blockchain-use-cases-in-many-industries.html
[2]: https://weg2g.com/application/touchstonewords/article-intro-to-hyperledger-family-and-hyperledger-blockchain-ecosystem.php
[3]: https://learn.coding-bootcamps.com/blog/202224/why-build-blockchain-applications-with-hyperledger-fabric
[4]: https://learn.coding-bootcamps.com/p/learn-go-programming-language-by-examples
[5]: https://coding-bootcamps.com/blog/review-of-hyperledger-fabric-architecture-and-components.html
[6]: https://coding-bootcamps.com/blog/how-proof-of-work-consensus-works-in-blockchain.html
[7]: https://coding-bootcamps.com/blog/how-proof-of-stake-consensus-works-in-blockchain.html
[8]: https://www.hyperledger.org/use/hyperledger-indy
[9]: https://www.hyperledger.org/use/fabric
[10]: https://www.hyperledger.org/projects/aries
[11]: https://www.hyperledger.org/projects/iroha
[12]: https://www.hyperledger.org/projects/sawtooth
[13]: https://www.hyperledger.org/projects/besu
[14]: https://www.hyperledger.org/projects/quilt
[15]: https://www.hyperledger.org/projects/ursa
[16]: https://www.hyperledger.org/projects/transact
[17]: https://www.hyperledger.org/projects/cactus
[18]: https://www.hyperledger.org/projects/caliper
[19]: https://www.hyperledger.org/projects/cello
[20]: https://www.hyperledger.org/projects/explorer
[21]: https://www.hyperledger.org/projects/grid
[22]: https://www.hyperledger.org/projects/hyperledger-burrow
[23]: https://www.hyperledger.org/projects/avalon
[24]: https://training.linuxfoundation.org/training/blockchain-understanding-its-uses-and-implications/
[25]: https://training.linuxfoundation.org/training/blockchain-for-business-an-introduction-to-hyperledger-technologies/
[26]: https://training.linuxfoundation.org/training/introduction-to-hyperledger-sovereign-identity-blockchain-solutions-indy-aries-and-ursa/
[27]: https://training.linuxfoundation.org/training/becoming-a-hyperledger-aries-developer-lfs173/
[28]: https://training.linuxfoundation.org/training/hyperledger-sawtooth-application-developers-lfs174/
[29]: https://training.linuxfoundation.org/training/hyperledger-fabric-administration-lfs272/
[30]: https://training.linuxfoundation.org/training/hyperledger-fabric-for-developers-lfd272/
[31]: https://training.linuxfoundation.org/certification/certified-hyperledger-fabric-administrator-chfa/
[32]: https://training.linuxfoundation.org/certification/certified-hyperledger-fabric-developer/
[33]: https://www.oreilly.com/library/view/hands-on-smart-contract/9781492086116/
[34]: https://weg2g.com/application/touchstonewords/article-essential-hyperledger-sawtooth-features-for-enterprise-blockchain-developers.php
[35]: https://myhsts.org/tutorial-learn-how-to-install-blockchain-hyperledger-fabric-on-amazon-web-services.php
[36]: https://myhsts.org/tutorial-learn-how-to-install-and-work-with-blockchain-hyperledger-sawtooth.php
[37]: https://learn.coding-bootcamps.com/p/learn-how-to-secure-blockchain-applications-by-examples
[38]: https://learn.coding-bootcamps.com/p/introduction-to-hyperledger-sawtooth-for-system-admins
[39]: https://myhsts.org/tutorial-learn-how-to-install-blockchain-hyperledger-iroha-on-amazon-web-services.php
[40]: https://myhsts.org/tutorial-learn-how-to-install-blockchain-hyperledger-indy-on-amazon-web-services.php
[41]: https://myhsts.org/tutorial-learn-how-to-configure-hyperledger-sawtooth-validator-and-rest-api-on-aws.php
[42]: https://learn.coding-bootcamps.com/p/live-and-self-paced-blockchain-development-with-hyperledger-fabric
[43]: https://learn.coding-bootcamps.com/p/live-crash-course-for-building-dapps-with-hyperledger-fabric
[44]: https://myhsts.org/tutorial-learn-how-to-build-transaction-processor-as-a-service-and-python-egg-for-hyperledger-sawtooth.php
[45]: https://myhsts.org/tutorial-learn-how-to-work-with-hyperledger-iroha-cli-to-create-cryptocurrency.php
[46]: https://myhsts.org/tutorial-learn-how-to-work-with-hyperledger-indy-command-line-interface.php
[47]: https://myhsts.org/tutorial-comprehensive-blockchain-hyperledger-developer-guide-for-all-professional-programmers.php
[48]: https://learn.coding-bootcamps.com/p/learn-blockchain-development-with-hyperledger-by-examples
[49]: https://learn.coding-bootcamps.com/p/hyperledger-blockchain-development-for-developers
[50]: https://www.hyperledger.org/learn/white-papers
[51]: https://www.hyperledger.org/learn/webinars
[52]: https://wiki.hyperledger.org/
[53]: https://blockchain.dcwebmakers.com/
[54]: http://coding-bootcamps.com/
[55]: https://myhsts.org/
[56]: https://training.linuxfoundation.org/announcements/review-of-five-popular-hyperledger-dlts-fabric-besu-sawtooth-iroha-and-indy/
[57]: https://training.linuxfoundation.org/
