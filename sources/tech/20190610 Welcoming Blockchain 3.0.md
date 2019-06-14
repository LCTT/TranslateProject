[#]: collector: (lujun9972)
[#]: translator: (murphyzhao)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Welcoming Blockchain 3.0)
[#]: via: (https://www.ostechnix.com/welcoming-blockchain-3-0/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

Welcoming Blockchain 3.0
======

![Welcoming blockchain 3.0][1]

Image credit : <https://pixabay.com/illustrations/blockchain-network-business-3448502/>

The series of posts [**“Blockchain 2.0”**][2] discussed about the evolution of blockchain technology since the advent of cryptocurrencies since the Bitcoin in 2008. This post will seek to explore the future of blockchains. Lovably called **blockchain 3.0** , this new wave of DLT evolution will answer the issues faced with blockchains currently (each of which will be summarized here). The next version of the tech standard will also bring new applications and use cases. At the end of the post we will also look at a few examples of these principles currently applied.

Few of the shortcomings of blockchain platforms in existence are listed below with some proposed solutions to those answered afterward.

### Problem 1: Scalability[1]

This is seen as the first major hurdle to mainstream adoption. As previously discussed, a lot of limiting factors contribute to the blockchain’s in-capacity to process a lot of transactions at the same time. Existing networks such as [**Ethereum**][3] are capable of measly 10-15 transactions per second (TPS) whereas mainstream networks such as those employed by Visa for instance are capable of more than 2000 TPS. **Scalability** is an issue that plagues all modern database systems. Improved consensus algorithms and better blockchain architecture designs are improving it though as we see here.

**Solving scalability**

Implementing leaner and more efficient consensus algorithms have been proposed for solving issues of scalability without disturbing the primary structure of the blockchain. While most cryptocurrencies and blockchain platforms use resource intensive PoW algorithms (For instance, Bitcoin & Ethereum) to generate blocks, newer DPoS and PoET algorithms exist to solve this issue. DPoS and PoET algorithms (there are some more in development) require less resources to maintain the blockchain and have shown to have throughputs ranging up to 1000s of TPS rivalling that of popular non-blockchain systems.

The second solution to scalability is altering the blockchain structure[1] and functionality altogether. We won’t get into finer details of this, but alternative architectures such as **Directed Acyclic Graph** ( **DAG** ) have been proposed to handle this issue. Essentially, the assumption for this to work is that not all network nodes need to have a copy of the entire blockchain for the blockchain to work or the participants to reap the benefits of a DLT system. The system does not require transactions to be validated by the entirety of the participants and simply requires the transactions to happen in a common frame of reference and be linked to each other.

The DAG[2] approach is implemented in the Bitcoin system using an implementation called the **Lightning network** and Ethereum implements the same using their **Sharding** [3] protocol. At its heart a DAG implementation is not technically a blockchain. It’s more like a tangled maze, but still retains the peer to peer and distributed database properties of the blockchain. We will explore DAG and Tangle networks in a separate post later.

### Problem 2: Interoperability[4][5]

**Interoperability** is called cross-chain interaction is basically different blockchains being able to talk to each other to exchange metrics and information. With so many platforms that is hard to keep a count on at the moment and different companies coming up with proprietary systems for all the myriad of applications, interoperability between platforms is key. For instance, at the moment, someone who owns digital identities on one platform will not be able to exploit features presented by other platforms because the individual blockchains do not understand or know each other. Problems pertaining to lack of credible verifications, token exchange etc. still persist. A global roll out of [**smart contracts**][4] is also not viable without platforms being able to communicate with each other.

**Solving Interoperability**

There are protocols and platforms designed just for enabling interoperability at the moment. Such platforms implement atomic swaps protocols and provide open stages for different blockchain systems to communicate and exchange information between them. An example would be **“0x (ZRX)”** which is described later on.

### Problem 3: Governance[6]

Not a limitation in its own, **governance** in a public blockchain needs to act as a community moral compass where everyone’s opinion is taken into account on the operation of the blockchain. Combined and seen with scale this presents a problem where in either the protocols change far too frequently or the protocols are changed at the whims of a “central” authority who holds the most tokens. This is not an issue that most public blockchains are working to avoid right now since the scale at their operating in and the nature of their operations don’t require stricter supervision.

**Solving Governance issues**

The Tangled framework or the DAG mentioned above would almost eliminate the need and use for global (platform wide) governance laws. Instead a program can automatically oversee the transaction and user type and decide on the laws that need to be implemented.

### Problem 4: Sustainability

**Sustainability** builds on the scalability issue again. Current blockchains and cryptocurrencies are notorious for being not sustainable in the long run owing to the significant oversight that is still required and the amount of resources required to keep the systems running. If you’ve read reports of how “mining cryptocurrencies” have not been so profitable lately, this is what it was. The amount of resources required to keep up existing platforms running is simply not practical at a global scale with mainstream use.

**Solving non-sustainability**

From a resources or economic point of view the answer to sustainability would be similar to the one for scalability. However, for the system to be implemented on a global scale, laws and regulations need to endorse it. This however depends on the governments of the world. Favourable moves from the American and European governments have however renewed hopes in this aspect.

### Problem 5: User adoption[7]

Currently a hindrance to widespread consumer adoption of blockchain based applications is consumer unfamiliarity with the platform and the tech underneath it. The fact that most applications require some sort of a tech and computing background to figure out how they work does not help in this aspect either. The third wave of blockchain developments seek to lessen the gap between consumer knowledge and platform usability.

**Solving the user adoption issue**

The internet took a lot of time to be the way it is now. A lot of work has been done on developing a standardized internet technology stack over the years that has allowed the web to function the way it is now. Developers are working on user facing front end distributed applications that should act as a layer on top of existing web 3.0 technology while being supported by blockchains and open protocols underneath. Such [**distributed applications**][5] will make the underlying technology more familiar to users, hence increasing mainstream adoption.

We’ve discussed about the solutions to the above issues theoretically, and now we proceed to show these being applied in the present scenario.

**[0x][6]** – is a decentralized token exchange where users from different platforms can exchange tokens without the need of a central authority to vet the same. Their breakthrough comes in how they’ve designed the system to record and vet the blocks only after transactions are settled and not in between (to verify context, blocks preceding the transaction order is also verified normally) as is normally done. This allows for a more liquid faster exchange of digitized assets online.

**[Cardano][7]** – founded by one of the co-founders of Ethereum, Cardano boasts of being a truly “scientific” platform with multiple reviews and strict protocols for the developed code and algorithms. Everything out of Cardano is assumed to be mathematically as optimized as possible. Their consensus algorithm called **Ouroboros** , is a modified Proof of Stake algorithm. Cardano is developed in [**Haskell**][8] and the smart contract engine uses a derivative of Haskell called **Plutus** for operating. Both are functional programming languages which guarantee secure transactions without compromising efficiency.

**EOS** – We’ve already described EOS here in [**this post**][9].

**[COTI][10]** – a rather obscure architecture, COTI entails no mining, and next to zero power consumption in operating. It also stores assets in offline wallets localized on user’s devices rather than a pure peer to peer network. They also follow a DAG based architecture and claim of processing throughputs of up to 10000 TPS. Their platform allows enterprises to build their own cryptocurrency and digitized currency wallets without exploiting a blockchain.

**References:**

  * [1] **A. P. Paper, K. Croman, C. Decker, I. Eyal, A. E. Gencer, and A. Juels, “On Scaling Decentralized Blockchains | SpringerLink,” 2018.**
  * [2] [**Going Beyond Blockchain with Directed Acyclic Graphs (DAG)**][11]
  * [3] [**Ethreum/wiki – On sharding blockchains**][12]
  * [4] [**Why is blockchain interoperability important**][13]
  * [5] [**The Importance of Blockchain Interoperability**][14]
  * [6] **R. Beck, C. Müller-Bloch, and J. L. King, “Governance in the Blockchain Economy: A Framework and Research Agenda,” J. Assoc. Inf. Syst., pp. 1020–1034, 2018.**
  * [7] **J. M. Woodside, F. K. A. Jr, W. Giberson, F. K. J. Augustine, and W. Giberson, “Blockchain Technology Adoption Status and Strategies,” J. Int. Technol. Inf. Manag., vol. 26, no. 2, pp. 65–93, 2017.**



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/welcoming-blockchain-3-0/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/06/blockchain-720x340.jpg
[2]: https://www.ostechnix.com/blockchain-2-0-an-introduction/
[3]: https://www.ostechnix.com/blockchain-2-0-what-is-ethereum/
[4]: https://www.ostechnix.com/blockchain-2-0-explaining-smart-contracts-and-its-types/
[5]: https://www.ostechnix.com/blockchain-2-0-explaining-distributed-computing-and-distributed-applications/
[6]: https://0x.org/
[7]: https://www.cardano.org/en/home/
[8]: https://www.ostechnix.com/getting-started-haskell-programming-language/
[9]: https://www.ostechnix.com/blockchain-2-0-eos-io-is-building-infrastructure-for-developing-dapps/
[10]: https://coti.io/
[11]: https://cryptoslate.com/beyond-blockchain-directed-acylic-graphs-dag/
[12]: https://github.com/ethereum/wiki/wiki/Sharding-FAQ#introduction
[13]: https://www.capgemini.com/2019/02/can-the-interoperability-of-blockchains-change-the-world/
[14]: https://medium.com/wanchain-foundation/the-importance-of-blockchain-interoperability-b6a0bbd06d11
