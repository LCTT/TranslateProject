[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Blockchain 2.0 – Introduction To Hyperledger Fabric [Part 10])
[#]: via: (https://www.ostechnix.com/blockchain-2-0-introduction-to-hyperledger-fabric/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

Blockchain 2.0 – Introduction To Hyperledger Fabric [Part 10]
======

![Hyperledger Fabric][1]

### Hyperledger Fabric

The [**Hyperledger project**][2] is an umbrella organization of sorts featuring many different modules and systems under development. Among the most popular among these individual sub-projects is the **Hyperledger Fabric**. This post will explore the features that would make the Fabric almost indispensable in the near future once blockchain systems start proliferating into main stream use. Towards the end we will also take a quick look at what developers and enthusiasts need to know regarding the technicalities of the Hyperledger Fabric.

### Inception

In the usual fashion for the Hyperledger project, Fabric was “donated” to the organization by one of its core members, **IBM** , who was previously the principle developer of the same. The technology platform shared by IBM was put to joint development at the Hyperledger project with contributions from over a 100 member companies and institutions.

Currently running on **v1.4** of the LTS version, Fabric has come a long way and is currently seen as the go to enterprise solution for managing business data. The core vision that surrounds the Hyperledger project inevitably permeates into the Fabric as well. The Hyperledger Fabric system carries forward all the enterprise ready and scalable features that are hard coded into all projects under the Hyperledger organization.

### Highlights Of Hyperledger Fabric

Hyperledger Fabric offers a wide variety of features and standards that are built around the mission of supporting fast development and modular architectures. Furthermore, compared to its competitors (primarily **Ripple** and [**Ethereum**][3]), Fabric takes an explicit stance toward closed and [**permissioned blockchains**][4]. Their core objective here is to develop a set of tools which will aid blockchain developers in creating customized solutions and not to create a standalone ecosystem or a product.

Some of the highlights of the Hyperledger Fabric are given below:

  * **Permissioned blockchain systems**



This is a category where other platforms such as Ethereum and Ripple differ quite a lot with Hyperledger Fabric. The Fabric by default is a tool designed to implement a private permissioned blockchain. Such blockchains cannot be accessed by everyone and the nodes working to offer consensus or to verify transactions are chosen by a central authority. This might be important for some applications such as banking and insurance, where transactions have to be verified by the central authority rather than participants.

  * **Confidential and controlled information flow**



The Fabric has built in permission systems that will restrict information flow within a specific group or certain individuals as the case may be. Unlike a public blockchain where anyone and everyone who runs a node will have a copy and selective access to data stored in the blockchain, the admin of the system can choose how to and who to share access to the information. There are also subsystems which will encrypt the stored data at better security standards compared to existing competition.

  * **Plug and play architecture**



Hyperledger Fabric has a plug and play type architecture. Individual components of the system may be chosen to be implemented and components of the system that developers don’t see a use for maybe discarded. The Fabric takes a highly modular and customizable route to development rather than a one size fits all approach taken by its competitors. This is especially attractive for firms and companies looking to build a lean system fast. This combined with the interoperability of the Fabric with other Hyperledger components implies that developers and designers now have access to a diverse set of standardized tools instead of having to pull code from different sources and integrate them afterwards. It also presents a rather fail-safe way to build robust modular systems.

  * **Smart contracts and chaincode**



A distributed application running on a blockchain is called a [**Smart contract**][5]. While the smart contract term is more or less associated with the Ethereum platform, chaincode is the name given to the same in the Hyperledger camp. Apart from possessing all the benefits of **DApps** being present in chaincode applications, what sets Hyperledger apart is the fact that the code for the same may be written in multiple high-level programming language. It supports [**Go**][6] and **JavaScript** out of the box and supports many other after integration with appropriate compiler modules as well. Though this fact might not mean much at this point, the fact remains that if existing talent can be used for ongoing projects involving blockchain that has the potential to save companies billions of dollars in personnel training and management in the long run. Developers can code in languages they’re comfortable in to start building applications on the Hyperledger Fabric and need not learn nor train in platform specific languages and syntax. This presents flexibility which current competitors of the Hyperledger Fabric do not offer.

  * The Hyperledger Fabric is a back-end driver platform and is mainly aimed at integration projects where a blockchain or another distributed ledger technology is required. As such it does not provide any user facing services except for minor scripting capabilities. (Think of it to be more like a scripting language.)
  * Hyperledger Fabric supports building sidechains for specific use-cases. In case, the developer wishes to isolate a set of users or participants to a specific part or functionality of the application, they may do so by implementing side-chains. Side-chains are blockchains that derive from a main parent, but form a different chain after their initial block. This block which gives rise to the new chain will stay immune to further changes in the new chain and the new chain remains immutable even if new information is added to the original chain. This functionality will aid in scaling the platform being developed and usher in user specific and case specific processing capabilities.
  * The previous feature also means that not all users will have an “exact” copy of all the data in the blockchain as is expected usually from public chains. Participating nodes will have a copy of data that is only relevant to them. For instance, consider an application similar to PayTM in India. The app has wallet functionality as well as an e-commerce end. However, not all its wallet users use PayTM to shop online. In this scenario, only active shoppers will have the corresponding chain of transactions on the PayTM e-commerce site, whereas the wallet users will just have a copy of the chain that stores wallet transactions. This flexible architecture for data storage and retrieval is important while scaling, since massive singular blockchains have been shown to increase lead times for processing transactions. The chain can be kept lean and well categorised this way.



We will look at other modules under the Hyperledger Project in detail in upcoming posts.

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/blockchain-2-0-introduction-to-hyperledger-fabric/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: https://www.ostechnix.com/blockchain-2-0-an-introduction-to-hyperledger-project-hlp/
[3]: https://www.ostechnix.com/blockchain-2-0-what-is-ethereum/
[4]: https://www.ostechnix.com/blockchain-2-0-public-vs-private-blockchain-comparison/
[5]: https://www.ostechnix.com/blockchain-2-0-explaining-smart-contracts-and-its-types/
[6]: https://www.ostechnix.com/install-go-language-linux/
