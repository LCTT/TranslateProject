[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Blockchain 2.0 – Introduction To Hyperledger Sawtooth [Part 12])
[#]: via: (https://www.ostechnix.com/blockchain-2-0-introduction-to-hyperledger-sawtooth/)
[#]: author: (editor https://www.ostechnix.com/author/editor/)

Blockchain 2.0 – Introduction To Hyperledger Sawtooth [Part 12]
======

![Introduction To Hyperledger Sawtooth][1]

After having discussed the [**Hyperledger Fabric**][2] project in detail on this blog, its time we moved on to the next project of interest at the Hyperledger camp. **Hyperledger Sawtooth** is Intel’s contribution to the [**Blockchain**][3] consortium mission to develop enterprise ready modular distributed ledgers and applications. Sawtooth is another attempt at creating an easy to roll out blockchain ledger for businesses keeping their resource constraints and security requirements in mind. While platforms such as [**Ethereum**][4] will in theory offer similar functionality when placed in capable hands, Sawtooth readily provides a lot of customizability and is built from the ground up for specific enterprise level use cases.

The Hyperledger project page has an introductory video detailing the Sawtooth architecture and platform. We’re attaching it here for readers to get a quick round-up about the product.

Moving to the intricacies of the Sawtooth project, there are **five primary and significant differences** between Sawtooth and its alternatives. The post from now and on will explore these differences and at the end will mention an example real world use case for Hyperledger Sawtooth in managing supply chains.

### Distinction 1: The consensus algorithm – PoET

This is perhaps amongst the most notable and significant changes that Sawtooth brings to the fore. While exploring all the different consensus algorithms that exist for blockchain platforms these days is out of the scope of this post, what is to be noted is that Sawtooth uses a **Proof Of Elapsed Time** (POET) based consensus algorithm. Such a system for validating transactions and blocks on the blockchain is considered to be resources efficient unlike other computation heavy systems which use the likes of **Proof of work** or **Proof of stake** algorithms.

POET is designed to utilize the security and tamper proof features of modern processors with reference implementations utilizing **Intel’s trusted execution environment** (TEE) architecture on its modern CPUs. The fact that the execution of the validating program takes use of a TEE along with a **“lottery”** system that is implemented to choose the **validator** or **node** to fulfill the request makes the process of creating blocks on the Sawtooth architecture secure and resource efficient at the same time.

The POET algorithm basically elects a validator randomly based on a stochastic process. The probability of a particular node being selected depends on a host of pointers one of which depends on the amount of computing resources the said node has contributed to the ledger so far. The chosen validator then proceeds to timestamp the said block of data and shares it with the permissioned nodes in the network so that there remains a reliable record of the blockchains immutability. This method of electing the “validator” node was developed by **Intel** and so far, has been shown to exhibit zero bias and or error in executing its function.

### Distinction 2: A fully separated level of abstraction between the application level and core system

As mentioned, the Sawtooth platform takes modularity to the next level. Here in the reference implementation that is shared by the [**Hyperledger project**][5] foundation, the core system that enables users to create a distributed ledger, and, the application run-time environment (the virtual environment where applications developed to run on the blockchain otherwise known as [**smart contracts**][6] or **chaincode** ) are separated by a full level of abstraction. This essentially means that developers can separately code applications in any programming language of their choice instead of having to conform to and follow platform specific languages. The Sawtooth platform provides support for the following contract languages out of the box: **Java** , **Python** , **C++** , **Go** , **JavaScript** and **Rust**. This distinction between the core system and application levels are obtained by defining a custom transaction family for each application that is developed on the platform.

A transaction family contains the following:

  * **A transaction processor** : basically, your applications logic or business logic.
  * **Data model** : a system that defines and handles data storage and processing at the system level.
  * **Client-side handler** to handle the end user side of your application.



Multiple low-level transaction families such as this may be defined in a permissioned blockchain and used in a modular fashion throughout the network. For instance, if a consortium of banks chose to implement it, they could come together and define common functionalities or rules for their applications and then plug and play the transaction families they need in their respective systems without having to develop everything on their own.

### Distinction 3: SETH

It is without doubt that a blockchain future would for sure have Ethereum as one of the key players. People at the Hyperledger foundation know this well. The **Hyperledger Burrow project** is in fact meant to address the existence of entities working on multiple platforms by providing a way for developers to use Ethereum blockchain specifications to build custom distributed applications using the **EVM** (Ethereum virtual machine).

Basically speaking, Burrow lets you customize and deploy Ethereum based [**DApps**][7] (written in **solidity** ) in non-public blockchains (the kind developed for use at the Hyperledger foundation). The Burrow and Sawtooth projects teamed up and created **SETH**. **Sawtooth-Ethereum Integration project** (SETH) is meant to add Ethereum (solidity) smart contract functionality and compatibility to Sawtooth based distributed ledger networks. A much-less known agenda to SETH is the fact that applications (DApps) and smart contracts written for EVM can now be easily ported to Sawtooth.

### Distinction 4: ACID principle and ability to batch process

A rather path breaking feature of Sawtooth is its ability to batch transactions together and then package them into a block. The blocks and transactions will still be subject to the **ACID** principle ( **A** tomicity, **C** onsistency, **I** solation and **D** urability). The implication of these two facts are highlighted using an example as follows.

Let’s say you have **6 transactions** to be packaged into **two blocks (4+2)**. Block A has 4 transactions which individually needs to succeed in order for the next block of 2 transactions to be timestamped and validated. Assuming they succeed, the next block of 2 transactions is processed and assuming even they are successful the entire package of 6 transactions are deemed successful and the overall business logic is deemed successful. For instance, assume you’re selling a car. Different transactions at the ends of the buyer (block A) and the seller (block B) will need be completed in order for the trade to be deemed valid. Ownership is transferred only if both the sides are successful in carrying out their individual transactions.

Such a feature will improve accountability on individual ends by separating responsibilities and improve the recognizability of faults and errors by the same principle. The ACID principle is implemented by coding for a custom transaction processor and defining a transaction family that will store data in the said block structure.

### Distinction 5: Parallel transaction execution

Blockchain platforms usually follow a serial **first come first serve route** to executing transactions and follow a queueing system for the same. Sawtooth provides support for both **serial** and **parallel execution** of transactions. Parallel transaction processing offers significant performance gains for even faster transactions by reducing overall transaction latencies. More faster transactions will be processed along with slower and bigger transactions at the same time on the platform instead of transactions of all types to be kept waiting.

The methodology followed to implement the parallel transaction paradigm efficiently takes care of the double spending problems and errors due to multiple changes being made to the same state by defining a custom scheduler for the network which can identity processes and their predecessors.

Real world use case: Supply Chain Management using Sawtooth applied with IoT

The Sawtooth **official website** lists seafood traceability as an example use case for the Sawtooth platform. The basic template is applicable for almost all supply chain related use cases.

![][8]

Figure 1 From the Hyperledger Sawtooth Official Website

Traditional supply chain management solutions in this space work majorly through manual record keeping which leaves room for massive frauds, errors, and significant quality control issues. IoT has been cited as a solution to overcome such issues with supply chains in day to day use. Inexpensive GPS enabled RFID-tags can be attached to fresh catch or produce as the case may be and can be scanned for updating at the individual processing centres automatically. Buyers or middle men can verify and or track the information easily using a client on their mobile device to know the route their dinner has taken before arriving on their plates.

While tracking seafood seems to be a first world problem in countries like India, the change an IoT enabled system can bring to public delivery systems in developing countries can be a welcome change. The application is available for demo at this **[link][9]** and users are encouraged to fiddle with it and adopt it to suit their needs.

**Reference:**

  * [**The Official Hyperledger Sawtooth Docs**][10]



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/blockchain-2-0-introduction-to-hyperledger-sawtooth/

作者：[editor][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/editor/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/05/Hyperledger-Sawtooth-720x340.png
[2]: https://www.ostechnix.com/blockchain-2-0-introduction-to-hyperledger-fabric/
[3]: https://www.ostechnix.com/blockchain-2-0-an-introduction/
[4]: https://www.ostechnix.com/blockchain-2-0-what-is-ethereum/
[5]: https://www.ostechnix.com/blockchain-2-0-an-introduction-to-hyperledger-project-hlp/
[6]: https://www.ostechnix.com/blockchain-2-0-explaining-smart-contracts-and-its-types/
[7]: https://www.ostechnix.com/blockchain-2-0-explaining-distributed-computing-and-distributed-applications/
[8]: http://www.ostechnix.com/wp-content/uploads/2019/05/Sawtooth.png
[9]: https://sawtooth.hyperledger.org/examples/seafood.html
[10]: https://sawtooth.hyperledger.org/docs/core/releases/1.0/contents.html
