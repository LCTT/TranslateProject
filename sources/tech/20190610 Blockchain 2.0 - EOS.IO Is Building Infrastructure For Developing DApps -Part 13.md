[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Blockchain 2.0 – EOS.IO Is Building Infrastructure For Developing DApps [Part 13])
[#]: via: (https://www.ostechnix.com/blockchain-2-0-eos-io-is-building-infrastructure-for-developing-dapps/)
[#]: author: (editor https://www.ostechnix.com/author/editor/)

Blockchain 2.0 – EOS.IO Is Building Infrastructure For Developing DApps [Part 13]
======

![Building infrastructure for Developing DApps][1]

When a blockchain startup makes over **$4 billion** through an ICO without having a product or service to show for it, that is newsworthy. It becomes clear at this point that people invested these billions on this project because it seemed to promise a lot. This post will seek to demystify this mystical and seemingly powerful platform.

**EOS.IO** is a [**blockchain**][2] platform that aims to develop standardized infrastructure including an application protocol and operating system for developing DApps ([ **distributed applications**][3]). **Block.one** the lead developer and investor in the project envisions **EOS.IO as the world’s’ first distributed operating system** providing a developing environment for decentralized applications. The system is meant to mirror a real computer by simulating hardware such as its CPUs, GPUs, and even RAM, apart from the obvious storage solutions courtesy of the blockchain database system.

### Who is block.one?

Block.one is the company behind EOS.IO. They developed the platform from the ground up based on a white paper published on GitHub. Block.one also spearheaded the yearlong “continuous” ICO that eventually made them a whopping $4 billion. They have one of the best teams of backers and advisors any company in the blockchain space can hope for with partnerships from **Bitmain** , **Louis Bacon** and **Alan Howard** among others. Not to mention **Peter Thiel** being one of the lead investors in the company. The expectations from their purported platform the EOS.IO and their crypto VC fund **EOS.VC** are high indeed.

### What is EOS.IO?

It is difficult to arrive at a short description for EOS.IO. The platform aims to position itself as a world wide computer with virtually simulated resources, hence creating a virtual environment for distributed applications to be built and run. The team behind EOS.IO aims achieve the following by directly quoting [**Ethereum**][4] as competition.

  * Increase transaction throughput to millions per second,

  * Reduce transaction costs to insignificant sums or remove them altogether.




Though EOS.IO is not anywhere near solving any of these problems, the platform has a few capabilities that make it noteworthy as an alternative to Ethereum for DApp enthusiasts and developers.

  1. **Scalability** : EOS.IO uses a different consensus algorithm for handling blocks called **DPoS**. We’ve described it briefly below. The DPoS system basically allows the system to handle far more requests at better speeds than Ethereum is capable of with its **PoW** algorithm. The claim is that because they’ll be able to handle such massive throughputs they’ll be able to afford transactions at insignificant or even zero charges if need be.
  2. **Governance capabilities** : The consensus algorithm allows EOS.IO to dynamically understand malicious user (or node) behaviour to penalize or deactivate the user. The elected delegate feature of the delegated proof of stake system also ensures faster amendments to the rules that govern the network and its users.
  3. **Parallel processing** : Touted to another major feature. This will basically allow programs on the EOS.IO blockchain to utilize multiple computers or processors or even computing resources such as GPUs to parallelly processes large chunks of data and blocks. This is not yet seen in a roll out ready form. (This however is not a unique feature of EOS.IO. [**Hyperledger Sawtooth**][5] and Burrow for instance support the same at the moment).
  4. **Self-sufficiency** : The system has a built-in grievance system along with well defined incentive and penal systems for providing feedback for acceptable and non-acceptable behaviour. This means that the platform has a governance system without actually having a central governing body.



All or at least most of the selling points of the system is based on the consensus algorithm it follows, DPoS. We explore more about the same below.

### What is the delegated Proof of Stake (DPoS) consensus algorithm?

As far as blockchains are concerned consensus algorithms are what gives them the strength and the selling point they need. However, as a general rule of thumb, as the “openness” and immutability of the ledger increases so does the computational power that is required to run it. For instance, if a blockchain intends to be secure against intrusion, be safe and immutable with respect to data, while being accessible to a lot of users, it will use up a lot of computing power in creating and maintaining itself. Think of it as a number lock. A 6-digit pin code is safer than a 3-digit pin code, but the latter will be easier and faster to open, now consider a million of these locks but with limited manpower to open them, and you get the scale at which blockchains operate and how much these consensus algorithms matter.

In fact, this is a major area where competing platforms differ from each other. Hyperledger Sawtooth uses a proof of elapsed time algorithm (PoET), while ethereum uses a slightly modified proof of work (PoW) algorithm. Each of these have their own pros and cons which we will cover in a detailed post later on. However, for now, to be noted is that EOS.IO uses a delegated proof of stake mechanism for attesting and validating blocks under it. This has the following implications for users.

Only one node can actively change the status of data written on the blockchain. In the case of a DPoS based system, this validator node is selected as part of a delegation by all the token holders of the blockchain. Every token holder gets to vote and have a say in who should be a validator. The weight the vote carries is usually proportional to the number of tokens the user carries. This is seen as a democratic way to ensure centralized accountability in terms of running the network. Furthermore, the validator is given additional monetary incentives to keep the network running smoothly and without friction. In case a validator or delegate member who is elected appears to be malicious, the system automatically votes out the said node member.

DPoS system is efficient as it requires fewer computing resources to cast a vote and select a leader to validate. Further, it incentivizes good behaviour and penalizes bad ones leading to self-correction and maintenance of the blockchain. **The average transaction time for PoW vs DPoS is 10 minutes vs 10 seconds**. The downside to this paradigm being centralized operations, weighted voting systems, lack of redundancy, and possible malicious behaviour from the validator.

To understand the difference between PoW and DPoS, imagine this: Let’s say your network has 100 participants out of which 10 are capable of handling validator duties and you need to choose one to do the same. In PoW, you give each of them a tough problem to solve to know who’s the fastest and smartest. You give the validator position to the winner and reward them for the same. In the DPoS system, the rest of the members vote for the person they think should hold the position. This is a simple matter of choosing based on arithmetic performance data based on the past. The node with the most votes win, and if the winner tries to do something fishy, the same electorate votes him out for the next transaction.

### So does Ethereum lose out?

While EOS.IO has miles to go before it even steps into the same ballpark as Ethereum with respect to the market cap and user base, EOS.IO targets specific shortfalls with Ethereum and solves them. We conclude this post by summarising some findings based on a 2017 [**paper**][6] written and published by **Ian Grigg**.

  1. The consensus algorithm used in the Ethereum (proof of work) platform uses far more computing resources and time to process transactions. This is true even for small block sizes. This limits its scaling potential and throughput. A meagre 15 transactions per second globally is no match for the over 2000 that payments network Visa manages. If the platform is to be adopted on a global scale based on a large scale roll out this is not acceptable.

  2. The reliance on proprietary languages, tool kits and protocols (including **Solidity** for instance) limits developer capability. Interoperability between platforms is also severely hurt due to this fact.

  3. This is rather subjective, however, the fact that Ethereum foundation refuses to acknowledge even the need for governance on the platform instead choosing to intervene on an ad-hoc manner when things turn sour on the network is not seen by many industry watchers as a sustainable model to be emulated in the future.




--------------------------------------------------------------------------------

via: https://www.ostechnix.com/blockchain-2-0-eos-io-is-building-infrastructure-for-developing-dapps/

作者：[editor][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/editor/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/05/Developing-DApps-720x340.png
[2]: https://www.ostechnix.com/blockchain-2-0-an-introduction/
[3]: https://www.ostechnix.com/blockchain-2-0-explaining-distributed-computing-and-distributed-applications/
[4]: https://www.ostechnix.com/blockchain-2-0-what-is-ethereum/
[5]: https://www.ostechnix.com/blockchain-2-0-introduction-to-hyperledger-sawtooth/
[6]: http://iang.org/papers/EOS_An_Introduction.pdf
