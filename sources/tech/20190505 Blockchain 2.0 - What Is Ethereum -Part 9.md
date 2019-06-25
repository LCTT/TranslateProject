[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Blockchain 2.0 – What Is Ethereum [Part 9])
[#]: via: (https://www.ostechnix.com/blockchain-2-0-what-is-ethereum/)
[#]: author: (editor https://www.ostechnix.com/author/editor/)

Blockchain 2.0 – What Is Ethereum [Part 9]
======

![Ethereum][1]

In the previous guide of this series, we discussed about [**Hyperledger Project (HLP)**][2], a fastest growing product developed by **Linux Foundation**. In this guide, we are going to discuss about what is **Ethereum** and its features in detail. Many researchers opine that the future of the internet will be based on principles of decentralized computing. Decentralized computing was in fact among one of the broader objectives of having the internet in the first place. However, the internet took another turn owing to differences in computing capabilities available. While modern server capabilities make the case for server-side processing and execution, lack of decent mobile networks in large parts of the world make the case for the same on the client side. Modern smartphones now have **SoCs** (system on a chip or system on chip) capable of handling many such operations on the client side itself, however, limitations owing to retrieving and storing data securely still pushes developers to have server-side computing and data management. Hence, a bottleneck in regards to data transfer capabilities is currently observed.

All of that might soon change because of advancements in distributed data storage and program execution platforms. [**The blockchain**][3], for the first time in the history of the internet, basically allows for secure data management and program execution on a distributed network of users as opposed to central servers.

**Ethereum** is one such blockchain platform that gives developers access to frameworks and tools used to build and run applications on such a decentralized network. Though more popularly known in general for its cryptocurrency, Ethereum is more than just **ethers** (the cryptocurrency). It’s a full **Turing complete programming language** that is designed to develop and deploy **DApps** or **Distributed APPlications** [1]. We’ll look at DApps in more detail in one of the upcoming posts.

Ethereum is an open-source, supports by default a public (non-permissioned) blockchain, and features an extensive smart contract platform **(Solidity)** underneath. Ethereum provides a virtual computing environment called the **Ethereum virtual machine** to run applications and [**smart contracts**][4] as well[2]. The Ethereum virtual machine runs on thousands of participating nodes all over the world, meaning the application data while being secure, is almost impossible to be tampered with or lost.

### Getting behind Ethereum: What sets it apart

In 2017, a 30 plus group of the who’s who of the tech and financial world got together to leverage the Ethereum blockchain’s capabilities. Thus, the **Ethereum Enterprise Alliance (EEA)** was formed by a long list of supporting members including _Microsoft_ , _JP Morgan_ , _Cisco Systems_ , _Deloitte_ , and _Accenture_. JP Morgan already has **Quorum** , a decentralized computing platform for financial services based on Ethereum currently in operation, while Microsoft has Ethereum based cloud services it markets through its Azure cloud business[3].

### What is ether and how is it related to Ethereum

Ethereum creator **Vitalik Buterin** understood the true value of a decentralized processing platform and the underlying blockchain tech that powered bitcoin. He failed to gain majority agreement for his idea of proposing that Bitcoin should be developed to support running distributed applications (DApps) and programs (now referred to as smart contracts).

Hence in 2013, he proposed the idea of Ethereum in a white paper he published. The original white paper is still maintained and available for readers **[here][5]**. The idea was to develop a blockchain based platform to run smart contracts and applications designed to run on nodes and user devices instead of servers.

The Ethereum system is often mistaken to just mean the cryptocurrency ether, however, it has to be reiterated that Ethereum is a full stack platform for developing applications and executing them as well and has been so since inception whereas bitcoin isn’t. **Ether is currently the second biggest cryptocurrency** by market capitalization and trades at an average of $170 per ether at the time of writing this article[4].

### Features and technicalities of the platform[5]

  * As we’ve already mentioned, the cryptocurrency called ether is simply one of the things the platform features. The purpose of the system is more than taking care of financial transactions. In fact, the key difference between the Ethereum platform and Bitcoin is in their scripting capabilities. Ethereum is developed in a Turing complete programming language which means it has scripting and application capabilities similar to other major programming languages. Developers require this feature to create DApps and complex smart contracts on the platform, a feature that bitcoin misses on.
  * The “mining” process of ether is more stringent and complex. While specialized ASICs may be used to mine bitcoin, the basic hashing algorithm used by Ethereum **(EThash)** reduces the advantage that ASICs have in this regard.
  * The transaction fees itself to be paid as an incentive to miners and node operators for running the network is calculated using a computational token called **Gas**. Gas improves the system’s resilience and resistance to external hacks and attacks by requiring the initiator of the transaction to pay ethers proportionate to the number of computational resources that are required to carry out that transaction. This is in contrast to other platforms such as Bitcoin where the transaction fee is measured in tandem with the transaction size. As such, the average transaction costs in Ethereum is radically less than Bitcoin. This also implies that running applications running on the Ethereum virtual machine will require a fee depending straight up on the computational problems that the application is meant to solve. Basically, the more complex an execution, the more the fee.
  * The block time for Ethereum is estimated to be around _**10-15 seconds**_. The block time is the average time that is required to timestamp and create a block on the blockchain network. Compared to the 10+ minutes the same transaction will take on the bitcoin network, it becomes apparent that _**Ethereum is much faster**_ with respect to transactions and verification of blocks.
  * _It is also interesting to note that there is no hard cap on the amount of ether that can be mined or the rate at which ether can be mined leading to less radical system design than bitcoin._



### Conclusion

While Ethereum is comparable and far outpaces similar platforms, the platform itself lacked a definite path for development until the Ethereum enterprise alliance started pushing it. While the definite push for enterprise developments are made by the Ethereum platform, it has to be noted that Ethereum also caters to small-time developers and individuals as well. As such developing the platform for end users and enterprises leave a lot of specific functionality out of the loop for Ethereum. Also, the blockchain model proposed and developed by the Ethereum foundation is a public model whereas the one proposed by projects such as the Hyperledger project is private and permissioned.

While only time can tell which platform among the ones put forward by Ethereum, Hyperledger, and R3 Corda among others will find the most fans in real-world use cases, such systems do prove the validity behind the claim of a blockchain powered future.

**References:**

  * [1] [**Gabriel Nicholas, “Ethereum Is Coding’s New Wild West | WIRED,” Wired , 2017**][6].
  * [2] [**What is Ethereum? — Ethereum Homestead 0.1 documentation**][7].
  * [3] [**Ethereum, a Virtual Currency, Enables Transactions That Rival Bitcoin’s – The New York Times**][8].
  * [4] [**Cryptocurrency Market Capitalizations | CoinMarketCap**][9].
  * [5] [**Introduction — Ethereum Homestead 0.1 documentation**][10].



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/blockchain-2-0-what-is-ethereum/

作者：[editor][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/editor/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/04/Ethereum-720x340.png
[2]: https://www.ostechnix.com/blockchain-2-0-an-introduction-to-hyperledger-project-hlp/
[3]: https://www.ostechnix.com/blockchain-2-0-an-introduction/
[4]: https://www.ostechnix.com/blockchain-2-0-explaining-smart-contracts-and-its-types/
[5]: https://github.com/ethereum/wiki/wiki/White-Paper
[6]: https://www.wired.com/story/ethereum-is-codings-new-wild-west/
[7]: http://www.ethdocs.org/en/latest/introduction/what-is-ethereum.html#ethereum-virtual-machine
[8]: https://www.nytimes.com/2016/03/28/business/dealbook/ethereum-a-virtual-currency-enables-transactions-that-rival-bitcoins.html
[9]: https://coinmarketcap.com/
[10]: http://www.ethdocs.org/en/latest/introduction/index.html
