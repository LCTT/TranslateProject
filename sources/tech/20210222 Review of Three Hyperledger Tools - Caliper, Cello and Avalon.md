[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Review of Three Hyperledger Tools – Caliper, Cello and Avalon)
[#]: via: (https://www.linux.com/news/review-of-three-hyperledger-tools-caliper-cello-and-avalon/)
[#]: author: (Dan Brown https://training.linuxfoundation.org/announcements/review-of-three-hyperledger-tools-caliper-cello-and-avalon/)

Review of Three Hyperledger Tools – Caliper, Cello and Avalon
======

_By Matt Zand_

#### **Recap**

In our previous article ([Review of Five popular Hyperledger DLTs- Fabric, Besu, Sawtooth, Iroha and Indy][1]), we discussed the following Hyperledger Distributed Ledger Technologies (DLTs).

  1. Hyperledger Indy
  2. Hyperledger Fabric
  3. Hyperledger Iroha
  4. Hyperledger Sawtooth
  5. Hyperledger Besu



To continue our journey, in this article we discuss three Hyperledger tools (Hyperledger Caliper, Cello and Avalon) that act as great accessories for any of Hyperledger DLTs. It is worth mentioning that, as of this writing, all of three tools discussed in this article are at the incubation stage.

#### **Hyperledger Caliper**

Caliper is a benchmarking tool for measuring blockchain performance and is written in [JavaScript][2]. It utilizes the following four performance indicators: success rate, Transactions Per Second (or transaction throughput), transaction latency, and resource utilization. Specifically, it is designed to perform benchmarks on a deployed smart contract, enabling the analysis of said four indicators on a blockchain network while smart contract is being used.

Caliper is a unique general tool and has become a useful reference for enterprises to measure the performance of their distributed ledgers. The Caliper project will be one of the most important tools to use along with other Hyperledger projects (even in [Quorum][3] or [Ethereum][4] projects since it also supports those types of blockchains). It offers different connectors to various blockchains, which gives it greater power and usability. Likewise, based on its documentation, Caliper is ideal for:

  * Application developers interested in running performance tests for their smart contracts
  * System architects interested in investigating resource constraints during test loads



To better understand how Caliper works, one should start with its architecture. Specifically, to use it, a user should start with defining the following configuration files:

  * A **benchmark** file defining the arguments of a benchmark workload
  * A **blockchain** file specifying the necessary information, which helps to interact with the system being tested
  * **Smart contracts** defining what contracts are going to be deployed



The above configuration files act as inputs for the Caliper CLI, which creates an admin client (acts as a superuser) and factory (being responsible for running test loads). Based on a chosen benchmark file, a client could be transacting with the system by adding or querying assets.

While testing is in progress, all transactions are saved. The statistics of these transactions are logged and stored. Further, a resource monitor logs the consumption of resources. All of this data is eventually aggregated into a single report. For more detailed discussion on its implementation, visit the link provided in the References section.

**Hyperledger Cello**

As blockchain applications eventually deployed at the enterprise level, developers had to do a lot of manual work when deploying/managing a blockchain. This job does not get any easier if multiple tenants need to access separate chains simultaneously. For instance, interacting with Hyperledger Fabric requires manual installation of each peer node on different servers, as well as setting up scripts (e.g., Docker-Composer) to start a Fabric network. Thus, to address said challenges while automating the process for developers, Hyperledger Cello got incubated. Cello brings the on-demand deployment model to blockchains and is written in the [Go language][5]. Cello is an automated application for deploying and managing blockchains in the form of plug-and-play, particularly for enterprises looking to integrate distributed ledger technologies.

Cello also provides a real-time dashboard for blockchain statuses, system utilization, chain code performance, and the configuration of blockchains. It currently supports Hyperledger Fabric. According to its documentation, Cello allows for:

  * Provisioning customized blockchains instantly
  * Maintaining a pool of running blockchains healthy without any need for manual operation
  * Checking the system’s status, scaling the chain numbers, changing resources, etc. through a dashboard



Likewise, according to its documentation, the major Cello’s features are:

  * Management of multiple blockchains (e.g., create, delete, and maintain health automatically)
  * Almost instant response, even with hundreds of chains or nodes
  * Support for customized blockchains request (e.g., size, consensus) — currently, there is support for Hyperledger Fabric
  * Support for a native Docker host or a Swarm host as the compute nodes
  * Support for heterogeneous architecture (e.g., z Systems, Power Systems, and x86) from bare-metal servers to virtual machines
  * Extensible with monitoring, logging, and health features through employing additional components



According to its developers, Cello’s architecture follows the principles of the [microservices][6], fault resilience, and scalability. In particular, Cello has three functional layers:

  * **The access layer**, which also includes web UI dashboards operated by users
  * **The orchestration layer**, which on receiving the request from the access layer, makes a call to the agents to operate the blockchain resources
  * **The agent layer**, which embodies real workers that interact with underlying infrastructures like Docker, [Swarm][7], or Kubernetes



According to its documentation, each layer should maintain stable APIs for upper layers to achieve pluggability without changing the upper-layer code. For more detailed discussion on its implementation, visit the link provided in the References section.

**Hyperledger Avalon**

To boost the performance of blockchain networks, developers decided to store non-essential data into off-the-chain databases. While this approach improved blockchain scalability, it led to some confidentiality issues. So, the community was in search of an approach that can achieve scalability and confidentiality goals at once; thus, it led to the incubation of Avalon. Hyperledger Avalon (formerly Trusted Compute Framework) enables privacy in blockchain transactions, shifting heavy processing from a main blockchain to trusted off-chain computational resources in order to improve scalability and latency, and to support attested Oracles.

The Trusted Compute Specification was designed to assist developers gain the benefits of computational trust and to overcome its drawbacks. In the case of the Avalon, a blockchain is used to enforce execution policies and ensure transaction auditability, while associated off-chain trusted computational resources execute transactions. By utilizing trusted off-chain computational resources, a developer can accelerate throughput and improve data privacy. By using Hyperledger Avalon in a distributed ledger, we can:

  * Maintain a registry of the trusted workers (including their attestation info)
  * Provide a mechanism for submitting work orders from a client(s) to a worker
  * Preserve a log of work order receipts and acknowledgments



To put it simply, the off-chain parts related to the main-network are  executing the transactions with the help of trusted compute resources. What guarantees the enforcement of confidentiality along with the integrity of execution is the Trusted Compute option with the following features:

  * Trusted Execution Environment (TEE)
  * MultiParty Commute (MPC)
  * Zero-Knowledge Proofs (ZKP)



By means of Trusted Execution Environments, a developer can enhance the integrity of the link in the off-chain and on-chain execution. Intel’s SGX play is a known example of TEEs, which have capabilities such as code verification, attestation verification, and execution isolation which allows the creation of a trustworthy link between main-chain and off-chain compute resources. For more detailed discussion on its implementation, visit the link provided in the References section.

**Note- Hyperledger Explorer Tool (deprecated)**

Hyperledger Explorer, in a nutshell, provides a dashboard for peering into block details which are primarily written in JavaScript. Hyperledger Explorer is known to all developers and system admins that have done work in Hyperledger in past few years. In spite of its great features and popularity, Hyperledger announced last year that they no longer maintain it. So this tool is deprecated.

**Next Article**

In our upcoming article, we move on covering the below four Hyperledger libraries:

  1. Hyperledger Aries
  2. Hyperledger Quilt
  3. Hyperledger Ursa
  4. Hyperledger Transact



**Summary**

To recap, we covered three Hyperledger tools (Caliper, Cello and Avalon) in this article. We started off by explaining that Hyperledger Caliper is designed to perform benchmarks on a deployed smart contract, enabling the analysis of four indicators (like success rate or transaction throughout) on a blockchain network while smart contract is being used. Next, we learned that Hyperledger Cello is an automated application for deploying and managing blockchains in the form of plug-and-play, particularly for enterprises looking to integrate distributed ledger technologies. At last, Hyperledger Avalon enables privacy in blockchain transactions, shifting heavy processing from a main blockchain to trusted off-chain computational resources in order to improve scalability and latency, and to support attested Oracles.

** References**

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

**Matt Zand** is a serial entrepreneur and the founder of 3 tech startups: [DC Web Makers][53], [Coding Bootcamps][54] and [High School Technology Services][55]. He is a leading author of [Hands-on Smart Contract Development with Hyperledger Fabric][33] book by O’Reilly Media. He has written more than 100 technical articles and tutorials on blockchain development for Hyperledger, Ethereum and Corda R3 platforms at sites such as IBM, SAP, Alibaba Cloud, Hyperledger, The Linux Foundation, and more. As a public speaker, he has presented webinars at many Hyperledger communities across USA and Europe.. At DC Web Makers, he leads a team of blockchain experts for consulting and deploying enterprise decentralized applications. As chief architect, he has designed and developed blockchain courses and training programs for Coding Bootcamps. He has a master’s degree in business management from the University of Maryland. Prior to blockchain development and consulting, he worked as senior web and mobile App developer and consultant, angel investor, business advisor for a few startup companies. You can connect with him on LI: <https://www.linkedin.com/in/matt-zand-64047871>

The post [Review of Three Hyperledger Tools – Caliper, Cello and Avalon][56] appeared first on [Linux Foundation – Training][57].

--------------------------------------------------------------------------------

via: https://www.linux.com/news/review-of-three-hyperledger-tools-caliper-cello-and-avalon/

作者：[Dan Brown][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://training.linuxfoundation.org/announcements/review-of-three-hyperledger-tools-caliper-cello-and-avalon/
[b]: https://github.com/lujun9972
[1]: https://training.linuxfoundation.org/announcements/review-of-five-popular-hyperledger-dlts-fabric-besu-sawtooth-iroha-and-indy/
[2]: https://learn.coding-bootcamps.com/p/learn-javascript-web-development-by-examples
[3]: https://coding-bootcamps.com/blog/introduction-to-quorum-blockchain-development.html
[4]: https://myhsts.org/blog/ethereum-dapp-with-evm-remix-golang-truffle-and-solidity-part1.html
[5]: https://learn.coding-bootcamps.com/p/learn-go-programming-language-by-examples
[6]: https://blockchain.dcwebmakers.com/blog/comprehensive-guide-for-migration-from-monolithic-to-microservices-architecture.html
[7]: https://coding-bootcamps.com/blog/how-to-work-with-ethereum-swarm-storage.html
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
[56]: https://training.linuxfoundation.org/announcements/review-of-three-hyperledger-tools-caliper-cello-and-avalon/
[57]: https://training.linuxfoundation.org/
