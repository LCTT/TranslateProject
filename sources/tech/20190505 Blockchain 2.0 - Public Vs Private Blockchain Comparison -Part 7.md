[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Blockchain 2.0 – Public Vs Private Blockchain Comparison [Part 7])
[#]: via: (https://www.ostechnix.com/blockchain-2-0-public-vs-private-blockchain-comparison/)
[#]: author: (editor https://www.ostechnix.com/author/editor/)

Blockchain 2.0 – Public Vs Private Blockchain Comparison [Part 7]
======

![Public vs Private blockchain][1]

The previous part of the [**Blockchain 2.0**][2] series explored the [**the state of Smart contracts**][3] now. This post intends to throw some light on the different types of blockchains that can be created. Each of these are used for vastly different applications and depending on the use cases, the protocol followed by each of these differ. Now let us go ahead and learn about **Public vs Private blockchain comparison** with Open source and proprietary technology.

The fundamental three-layer structure of a blockchain based distributed ledger as we know is as follows:

![][4]

Figure 1 – Fundamental structure of Blockchain-based ledgers

The differences between the types mentioned here is attributable primarily to the protocol that rests on the underlying blockchain. The protocol dictates rules for the participants and the behavior of the blockchain in response to the said participation.

Remember to keep the following things in mind while reading through this article:

  * Platforms such as these are always created to solve a use-case requirement. There is no one direction that the technology should take that is best. Blockchains for instance have tremendous applications and some of these might require dropping features that seem significant in other settings. **Decentralized storage** is a major example in this regard.
  * Blockchains are basically database systems keeping track of information by timestamping and organizing data in the form of blocks. Creators of such blockchains can choose who has the right to make these blocks and perform alterations.
  * Blockchains can be “centralized” as well, and participation in varying extents can be limited to those who this “central authority” deems eligible.



Most blockchains are either **public** or **private**. Broadly speaking, public blockchains can be considered as being the equivalent of open source software and most private blockchains can be seen as proprietary platforms deriving from the public ones. The figure below should make the basic difference obvious to most of you.

![][5]

Figure 2 – Public vs Private blockchain comparison with Open source and Proprietary Technology

This is not to say that all private blockchains are derived from open public ones. The most popular ones however usually are though.

### Public Blockchains

A public blockchain can be considered as a **permission-less platform** or **network**. Anyone with the knowhow and computing resources can participate in it. This will have the following implications:

  * Anyone can join and participate in a public blockchain network. All the “participant” needs is a stable internet connection along with computing resources.
  * Participation will include reading, writing, verifying, and providing consensus during transactions. An example for participating individuals would be **Bitcoin miners**. In exchange for participating in the network the miners are paid back in Bitcoins in this case.
  * The platform is decentralized completely and fully redundant.
  * Because of the decentralized nature, no one entity has complete control over the data recorded in the ledger. To validate a block all (or most) participants need to vet the data.
  * This means that once information is verified and recorded, it cannot be altered easily. Even if it is, its impossible to not leave marks.
  * The identity of participants remains anonymous by design in platforms such as **BITCOIN** and **LITECOIN**. These platforms by design aim for protecting and securing user identities. This is primarily a feature provided by the overlying protocol stack.
  * Examples for public blockchain networks are **BITCOIN** , **LITECOIN** , **ETHEREUM** etc.
  * Extensive decentralizations mean that gaining consensus on transactions might take a while compared to what is typically possible over blockchain ledger networks and throughput can be a challenge for large enterprises aiming for pushing a very high number of transactions every instant.
  * The open participation and often the high number of such participants in open chains such as bitcoin add up to considerable initial investments in computing equipment and energy costs.



### Private Blockchain

In contrast, a private blockchain is a **permissioned blockchain**. Meaning:

  * Permission to participate in the network is restricted and is presided over by the owner or institution overseeing the network. Meaning even though an individual will be able to store data and transact (send and receive payments for example), the validation and storage of these transactions will be done only by select participants.
  * Participation even once permission is given by the central authority will be limited by terms. For instance, in case of a private blockchain network run by a financial institution, not every customer will have access to the entire blockchain ledger, and even among those with the permission, not everyone will be able to access everything. Permissions to access select services will be given by the central figure in this case. This is often referred to as **“channeling”**.
  * Such systems have significantly larger throughput capabilities and also showcase much faster transaction speeds compared to their public counterparts because a block of information only needs to be validated by a select few.
  * Security by design is something the public blockchains are renowned for. They achieve this
by:
    * Anonymizing participants,
    * Distributed & redundant but encrypted storage on multiple nodes,
    * Mass consensus required for creating and altering data.



Private blockchains usually don’t feature any of these in their protocol. This makes the system only as secure as most cloud-based database systems currently in use.

### A note for the wise

An important point to note is this, the fact that they’re named public or private (or open or closed) has nothing to do with the underlying code base. The code or the literal foundations on which the platforms are based on may or may not be publicly available and or developed in either of these cases. **R3** is a **DLT** ( **D** istributed **L** edger **T** echnology) company that leads a public consortium of over 200 multinational institutions. Their aim is to further development of blockchain and related distributed ledger technology in the domain of finance and commerce. **Corda** is the product of this joint effort. R3 defines corda as a blockchain platform that is built specially for businesses. The codebase for the same is open source and developers all over the world are encouraged to contribute to the project. However, given its business facing nature and the needs it is meant to address, corda would be categorized as a permissioned closed blockchain platform. Meaning businesses can choose the participants of the network once it is deployed and choose the kind of information these participants can access through the use of natively available smart contract tools.

While it is a reality that public platforms like Bitcoin and Ethereum are responsible for the widespread awareness and development going on in the space, it can still be argued that private blockchains designed for specific use cases in enterprise or business settings is what will lead monetary investments in the short run. These are the platforms most of us will see implemented the near future in practical ways.

Read the next guide about Hyperledger project in this series.

  * [**Blockchain 2.0 – An Introduction To Hyperledger Project (HLP)**][6]



We are working on many interesting topics on Blockchain technology. Stay tuned!

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/blockchain-2-0-public-vs-private-blockchain-comparison/

作者：[editor][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/editor/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/04/Public-Vs-Private-Blockchain-720x340.png
[2]: https://www.ostechnix.com/blockchain-2-0-an-introduction/
[3]: https://www.ostechnix.com/blockchain-2-0-ongoing-projects-the-state-of-smart-contracts-now/
[4]: http://www.ostechnix.com/wp-content/uploads/2019/04/blockchain-architecture.png
[5]: http://www.ostechnix.com/wp-content/uploads/2019/04/Public-vs-Private-blockchain-comparison.png
[6]: https://www.ostechnix.com/blockchain-2-0-an-introduction-to-hyperledger-project-hlp/
