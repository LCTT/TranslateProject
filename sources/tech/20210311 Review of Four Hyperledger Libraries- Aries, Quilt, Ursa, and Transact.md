[#]: subject: (Review of Four Hyperledger Libraries- Aries, Quilt, Ursa, and Transact)
[#]: via: (https://www.linux.com/news/review-of-four-hyperledger-libraries-aries-quilt-ursa-and-transact/)
[#]: author: (Dan Brown https://training.linuxfoundation.org/announcements/review-of-four-hyperledger-libraries-aries-quilt-ursa-and-transact/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Review of Four Hyperledger Libraries- Aries, Quilt, Ursa, and Transact
======

_By Matt Zand_

## **Recap**

In our two previous articles, first we covered “[Review of Five popular Hyperledger DLTs- Fabric, Besu, Sawtooth, Iroha and Indy][1]” where we discussed the following five Hyperledger Distributed Ledger Technologies (DLTs):

  1. Hyperledger Indy
  2. Hyperledger Fabric
  3. Hyperledger Iroha
  4. Hyperledger Sawtooth
  5. Hyperledger Besu



Then, we moved on to our second article ([Review of three Hyperledger Tools- Caliper, Cello and Avalon][2]) where we surveyed the following three Hyperledger t     ools:

  1. Hyperledger Caliper
  2. Hyperledger Cello
  3. Hyperledger Avalon



So in this follow-up article, we review four (as listed below) Hyperledger libraries that work very well with other Hyperledger DLTs.      As of this writing, all of these libraries are at the incubation stage except for Hyperledger Aries,      which has [graduated][3] to      active.

  1. Hyperledger Aries
  2. Hyperledger Quilt
  3. Hyperledger Ursa
  4. Hyperledger Transact



**Hyperledger Aries**

Identity has been adopted by the industry as one of the most promising use cases of DLTs. Solutions and initiatives around creating, storing, and transmitting verifiable digital credentials will result in a reusable, shared, interoperable tool kit. In response to such growing demand, Hyperledger has come up with three       projects (Hyperledger Indy, Hyperledger Iroha and Hyperledger Aries) that are specifically focused on identity management.

Hyperledger Aries is infrastructure for blockchain-rooted, peer-to-peer interactions. It includes a shared cryptographic wallet (the secure storage tech, not a UI) for blockchain clients as well as a communications protocol for allowing off-ledger interactions between those clients.      This project consumes the cryptographic support provided by Hyperledger Ursa      to provide secure secret management and decentralized key management functionality.

According to Hyperledger Aries’ documentation, Aries includes the following features:

  * An encrypted messaging system for off-ledger interactions using multiple transport protocols between clients.
  * A blockchain interface layer that is also called as a resolver. It is used for creating and signing blockchain transactions.
  * A cryptographic wallet to enable secure storage of cryptographic secrets and other information that is used for building blockchain clients.
  * An implementation of ZKP-capable W3C verifiable credentials with the help of the ZKP primitives that are found in Hyperledger Ursa.
  * A mechanism to build API-like use cases and higher-level protocols based on secure messaging functionality.
  * An implementation of the specifications of the Decentralized Key Management System (DKMS) that are being currently incubated in Hyperledger Indy.
  * Initially, the generic interface of Hyperledger Aries will support the Hyperledger Indy resolver. But the interface is flexible in the sense that anyone can build a pluggable method using DID method resolvers such as Ethereum and Hyperledger Fabric, or any other DID method resolver they wish to use. These resolvers would support the resolving of transactions and other data on other ledgers.
  * Hyperledger Aries will additionally provide the functionality and features outside the scope of the Hyperledger Indy ledger to be fully planned and supported. Owing to these capabilities, the community can now build core message families to facilitate interoperable interactions using a wide range of use cases that involve blockchain-based identity.



For more detailed discussion on its implementation, visit the link provided in the References section.

**Hyperledger Quilt**

The widespread adoption of blockchain technology by global businesses      has coincided with the emergence of tons of isolated and disconnected networks or ledgers. While users can easily conduct transactions within their own network or ledger, they experience technical difficultly (and in some cases impracticality) for doing transactions with parties residing      on different networks or ledgers. At best, the process of cross-ledger (or cross-network) transactions is slow, expensive, or manual. However, with the advent and adoption of Interledger Protocol (ILP), money and other forms of value can be routed, packetized, and delivered over ledgers and payment networks.

Hyperledger Quilt is a tool for      interoperability      between ledger systems and is written in Java      by implementing the ILP for atomic swaps. While the Interledger is a protocol for making transactions across ledgers, ILP is a payment protocol designed to transfer value across non-distributed and distributed ledgers. The standards and specifications of Interledger protocol are governed by the open-source community under the World Wide Web Consortium umbrella. Quilt is an enterprise-grade implementation of the ILP, and provides libraries and reference implementations for the core Interledger components used for payment networks. With the launch of Quilt, the JavaScript (Interledger.js) implementation of Interledger was maintained by the JS Foundation.

According to the Quilt documentation, as a result of ILP implementation, Quilt offers the following features:

  * A framework to design higher-level use-case specific protocols.
  * A set of rules to enable interoperability with basic escrow semantics.
  * A standard for data packet format and a ledger-dependent independent address format to enable connectors to route payments.



For more detailed discussion on its implementation, visit the link provided in the References section.

**Hyperledger Ursa**

Hyperledger Ursa is a shared cryptographic library that      enables people (and projects) to avoid duplicating other cryptographic work and hopefully increase security in the process. The library is      an opt-in repository for Hyperledger projects (and, potentially others) to place and use crypto.

Inside Project Ursa, a complete library of modular signatures and symmetric-key primitives      is at the disposal of developers to swap in and out different cryptographic schemes through configuration and without having to modify their code. On top its base library, Ursa      also includes newer cryptography, including pairing-based, threshold, and aggregate signatures. Furthermore, the zero-knowledge primitives including SNARKs are also supported by Ursa.

According to the Ursa’s documentation, Ursa offers the following benefits:

  * Preventing duplication of solving similar security requirements across different blockchain
  * Simplifying the security audits of cryptographic operations since the code is consolidated into a single location. This reduces maintenance efforts of these libraries while improving the security footprint for developers with beginner knowledge of distributed ledger projects.
  * Reviewing all cryptographic codes in a single place will reduce the likelihood of dangerous security bugs.
  * Boosting cross-platform interoperability when multiple platforms, which require cryptographic verification, are using the same security protocols on both platforms.
  * Enhancing the architecture via modularity of common components will pave the way for future modular distributed ledger technology platforms using common components.
  * Accelerating the time to market for new projects as long as an existing security paradigm can be plugged-in without a project needing to build it themselves.



For more detailed discussion on its implementation, visit the link provided in the References section.

**Hyperledger Transact**

Hyperledger Transact, in a nutshell, makes writing distributed ledger software easier by providing a shared software library that handles the execution of smart contracts, including all aspects of scheduling, transaction dispatch, and state management. Utilizing Transact, smart contracts can be executed irrespective of DLTs being used. Specifically, Transact achieves that by offering an extensible approach to implementing new smart contract languages called “smart contract engines.” As such, each smart contract engine implements a virtual machine or interpreter that processes smart contracts.

At its core, Transact is solely a transaction processing system for state transitions. That is, s     tate data is normally stored in a key-value or an SQL database. Considering an initial state and a transaction, Transact executes the transaction to produce a new state. These state transitions are deemed “pure” because only the initial state and the transaction are used as input. (In contrast to     other systems such as Ethereum where state and block information are mixed to produce the new state). Therefore, Transact is agnostic about DLT framework features other than transaction execution and state.

According to Hyperledger Transact’s documentation, Transact comes with the following components:

  * **State**. The Transact state implementation provides get, set, and delete operations against a database. For the Merkle-Radix tree state implementation, the tree structure is implemented on top of LMDB or an in-memory database.
  * **Context manager**. In Transact, state reads and writes are scoped (sandboxed) to a specific “context” that contains a reference to a state ID (such as a Merkle-Radix state root hash) and one or more previous contexts. The context manager implements the context lifecycle and services the calls that read, write, and delete data from state.
  * **Scheduler**. This component controls the order of transactions to be executed. Concrete implementations include a serial scheduler and a parallel scheduler. Parallel transaction execution is an important innovation for increasing network throughput.
  * **Executor**. The Transact executor obtains transactions from the scheduler and executes them against a specific context. Execution is handled by sending the transaction to specific execution adapters (such as ZMQ or a static in-process adapter) which, in turn, send the transaction to a specific smart contract.
  * **Smart Contract Engines**. These components provide the virtual machine implementations and interpreters that run the smart contracts. Examples of engines include WebAssembly, Ethereum Virtual Machine, Sawtooth Transactions Processors, and Fabric Chaincode.



For more detailed discussion on its implementation, visit the link provided in the References section.

** Summary**

In this article, we reviewed four Hyperledger libraries that are great resources for managing Hyperledger DLTs. We started by explaining Hyperledger Aries, which is infrastructure for blockchain-rooted, peer-to-peer interactions and includes a shared cryptographic wallet for blockchain clients as well as a communications protocol for allowing off-ledger interactions between those clients. Then, we learned that Hyperledger Quilt is the interoperability tool between ledger systems and is written in Java by implementing the ILP for atomic swaps. While the Interledger is a protocol for making transactions across ledgers, ILP is a payment protocol designed to transfer value across non-distributed and distributed ledgers. We also discussed that Hyperledger Ursa is a shared cryptographic library that would enable people (and projects) to avoid duplicating other cryptographic work and hopefully increase security in the process. The library would be an opt-in repository for Hyperledger projects (and, potentially others) to place and use crypto. We concluded our article by reviewing Hyperledger Transact by which smart contracts can be executed irrespective of DLTs being used. Specifically, Transact achieves that by offering an extensible approach to implementing new smart contract languages called “smart contract engines.”

**References**

For more references on all Hyperledger projects, libraries and tools, visit the below documentation links:

  1. [Hyperledger Indy Project][4]
  2. [Hyperledger Fabric Project][5]
  3. [Hyperledger Aries Library][6]
  4. [Hyperledger Iroha Project][7]
  5. [Hyperledger Sawtooth Project][8]
  6. [Hyperledger Besu Project][9]
  7. [Hyperledger Quilt Library][10]
  8. [Hyperledger Ursa Library][11]
  9. [Hyperledger Transact Library][12]
  10. [Hyperledger Cactus Project][13]
  11. [Hyperledger Caliper Tool][14]
  12. [Hyperledger Cello Tool][15]
  13. [Hyperledger Explorer Tool][16]
  14. [Hyperledger Grid (Domain Specific)][17]
  15. [Hyperledger Burrow Project][18]
  16. [Hyperledger Avalon Tool][19]



**Resources**

  * Free Training Courses from The Linux Foundation &amp; Hyperledger
    * [Blockchain: Understanding Its Uses and Implications (LFS170)][20]
    * [Introduction to Hyperledger Blockchain Technologies (LFS171)][21]
    * [Introduction to Hyperledger Sovereign Identity Blockchain Solutions: Indy, Aries &amp; Ursa (LFS172)][22]
    * [Becoming a Hyperledger Aries Developer (LFS173)][23]
    * [Hyperledger Sawtooth for Application Developers (LFS174)][24]
  * eLearning Courses from The Linux Foundation &amp; Hyperledger
    * [Hyperledger Fabric Administration (LFS272)][25]
    * [Hyperledger Fabric for Developers (LFD272)][26]
  * Certification Exams from The Linux Foundation &amp; Hyperledger
    * [Certified Hyperledger Fabric Administrator (CHFA)][27]
    * [Certified Hyperledger Fabric Developer (CHFD)][28]
  * [Hands-On Smart Contract Development with Hyperledger Fabric V2][29] Book by Matt Zand and others.
  * [Essential Hyperledger Sawtooth Features for Enterprise Blockchain Developers][30]
  * [Blockchain Developer Guide- How to Install Hyperledger Fabric on AWS][31]
  * [Blockchain Developer Guide- How to Install and work with Hyperledger Sawtooth][32]
  * [Intro to Blockchain Cybersecurity][33]
  * [Intro to Hyperledger Sawtooth for System Admins][34]
  * [Blockchain Developer Guide- How to Install Hyperledger Iroha on AWS][35]
  * [Blockchain Developer Guide- How to Install Hyperledger Indy and Indy CLI on AWS][36]
  * [Blockchain Developer Guide- How to Configure Hyperledger Sawtooth Validator and REST API on AWS][37]
  * [Intro blockchain development with Hyperledger Fabric][38]
  * [How to build DApps with Hyperledger Fabric][39]
  * [Blockchain Developer Guide- How to Build Transaction Processor as a Service and Python Egg for Hyperledger Sawtooth][40]
  * [Blockchain Developer Guide- How to Create Cryptocurrency Using Hyperledger Iroha CLI][41]
  * [Blockchain Developer Guide- How to Explore Hyperledger Indy Command Line Interface][42]
  * [Blockchain Developer Guide- Comprehensive Blockchain Hyperledger Developer Guide from Beginner to Advance Level][43]
  * [Blockchain Management in Hyperledger for System Admins][44]
  * [Hyperledger Fabric for Developers][45]



**About Author**

**Matt Zand** is a serial entrepreneur and the founder of three tech startups: [DC Web Makers][46], [Coding Bootcamps][47] and [High School Technology Services][48]. He is a leading author of [Hands-on Smart Contract Development with Hyperledger Fabric][29] book by O’Reilly Media. He has written more than 100 technical articles and tutorials on blockchain development for Hyperledger, Ethereum and Corda R3 platforms at sites such as IBM, SAP, Alibaba Cloud, Hyperledger, The Linux Foundation, and more. As a public speaker, he has presented webinars at many Hyperledger communities across USA and Europe     . At DC Web Makers, he leads a team of blockchain experts for consulting and deploying enterprise decentralized applications. As chief architect, he has designed and developed blockchain courses and training programs for Coding Bootcamps. He has a master’s degree in business management from the University of Maryland. Prior to blockchain development and consulting, he worked as senior web and mobile App developer and consultant, angel investor, business advisor for a few startup companies. You can connect with him on [LinkedIn][49].

The post [Review of Four Hyperledger Libraries- Aries, Quilt, Ursa, and Transact][50] appeared first on [Linux Foundation – Training][51].

--------------------------------------------------------------------------------

via: https://www.linux.com/news/review-of-four-hyperledger-libraries-aries-quilt-ursa-and-transact/

作者：[Dan Brown][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://training.linuxfoundation.org/announcements/review-of-four-hyperledger-libraries-aries-quilt-ursa-and-transact/
[b]: https://github.com/lujun9972
[1]: https://training.linuxfoundation.org/announcements/review-of-five-popular-hyperledger-dlts-fabric-besu-sawtooth-iroha-and-indy/
[2]: https://training.linuxfoundation.org/announcements/review-of-three-hyperledger-tools-caliper-cello-and-avalon/
[3]: https://www.hyperledger.org/blog/2021/02/26/hyperledger-aries-graduates-to-active-status-joins-indy-as-production-ready-hyperledger-projects-for-decentralized-identity
[4]: https://www.hyperledger.org/use/hyperledger-indy
[5]: https://www.hyperledger.org/use/fabric
[6]: https://www.hyperledger.org/projects/aries
[7]: https://www.hyperledger.org/projects/iroha
[8]: https://www.hyperledger.org/projects/sawtooth
[9]: https://www.hyperledger.org/projects/besu
[10]: https://www.hyperledger.org/projects/quilt
[11]: https://www.hyperledger.org/projects/ursa
[12]: https://www.hyperledger.org/projects/transact
[13]: https://www.hyperledger.org/projects/cactus
[14]: https://www.hyperledger.org/projects/caliper
[15]: https://www.hyperledger.org/projects/cello
[16]: https://www.hyperledger.org/projects/explorer
[17]: https://www.hyperledger.org/projects/grid
[18]: https://www.hyperledger.org/projects/hyperledger-burrow
[19]: https://www.hyperledger.org/projects/avalon
[20]: https://training.linuxfoundation.org/training/blockchain-understanding-its-uses-and-implications/
[21]: https://training.linuxfoundation.org/training/blockchain-for-business-an-introduction-to-hyperledger-technologies/
[22]: https://training.linuxfoundation.org/training/introduction-to-hyperledger-sovereign-identity-blockchain-solutions-indy-aries-and-ursa/
[23]: https://training.linuxfoundation.org/training/becoming-a-hyperledger-aries-developer-lfs173/
[24]: https://training.linuxfoundation.org/training/hyperledger-sawtooth-application-developers-lfs174/
[25]: https://training.linuxfoundation.org/training/hyperledger-fabric-administration-lfs272/
[26]: https://training.linuxfoundation.org/training/hyperledger-fabric-for-developers-lfd272/
[27]: https://training.linuxfoundation.org/certification/certified-hyperledger-fabric-administrator-chfa/
[28]: https://training.linuxfoundation.org/certification/certified-hyperledger-fabric-developer/
[29]: https://www.oreilly.com/library/view/hands-on-smart-contract/9781492086116/
[30]: https://weg2g.com/application/touchstonewords/article-essential-hyperledger-sawtooth-features-for-enterprise-blockchain-developers.php
[31]: https://myhsts.org/tutorial-learn-how-to-install-blockchain-hyperledger-fabric-on-amazon-web-services.php
[32]: https://myhsts.org/tutorial-learn-how-to-install-and-work-with-blockchain-hyperledger-sawtooth.php
[33]: https://learn.coding-bootcamps.com/p/learn-how-to-secure-blockchain-applications-by-examples
[34]: https://learn.coding-bootcamps.com/p/introduction-to-hyperledger-sawtooth-for-system-admins
[35]: https://myhsts.org/tutorial-learn-how-to-install-blockchain-hyperledger-iroha-on-amazon-web-services.php
[36]: https://myhsts.org/tutorial-learn-how-to-install-blockchain-hyperledger-indy-on-amazon-web-services.php
[37]: https://myhsts.org/tutorial-learn-how-to-configure-hyperledger-sawtooth-validator-and-rest-api-on-aws.php
[38]: https://learn.coding-bootcamps.com/p/live-and-self-paced-blockchain-development-with-hyperledger-fabric
[39]: https://learn.coding-bootcamps.com/p/live-crash-course-for-building-dapps-with-hyperledger-fabric
[40]: https://myhsts.org/tutorial-learn-how-to-build-transaction-processor-as-a-service-and-python-egg-for-hyperledger-sawtooth.php
[41]: https://myhsts.org/tutorial-learn-how-to-work-with-hyperledger-iroha-cli-to-create-cryptocurrency.php
[42]: https://myhsts.org/tutorial-learn-how-to-work-with-hyperledger-indy-command-line-interface.php
[43]: https://myhsts.org/tutorial-comprehensive-blockchain-hyperledger-developer-guide-for-all-professional-programmers.php
[44]: https://learn.coding-bootcamps.com/p/learn-blockchain-development-with-hyperledger-by-examples
[45]: https://learn.coding-bootcamps.com/p/hyperledger-blockchain-development-for-developers
[46]: https://blockchain.dcwebmakers.com/
[47]: http://coding-bootcamps.com/
[48]: https://myhsts.org/
[49]: https://www.linkedin.com/in/matt-zand-64047871
[50]: https://training.linuxfoundation.org/announcements/review-of-four-hyperledger-libraries-aries-quilt-ursa-and-transact/
[51]: https://training.linuxfoundation.org/
