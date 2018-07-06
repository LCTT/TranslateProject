Translating by qhwdw
Blockchain evolution: A quick guide and why open source is at the heart of it
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/block-quilt-chain.png?itok=mECoDbrc)

It isn't uncommon, when working on a new version of an open source project, to suffix it with "-ng", for "next generation." Fortunately, in their rapid evolution blockchains have so far avoided this naming pitfall. But in this evolutionary open source ecosystem, changes have been abundant, and good ideas have been picked up, remixed, and evolved between many different projects in a typical open source fashion.

In this article, I will look at the different generations of blockchains and what ideas have emerged to address the problems the ecosystem has encountered. Of course, any attempt at classifying an ecosystem will have limits—and objectors—but it should provide a rough guide to the jungle of blockchain projects.

### The beginning: Bitcoin

The first generation of blockchains stems from the [Bitcoin][1] blockchain, the ledger underpinning the decentralized, peer-to-peer cryptocurrency that has gone from [Slashdot][2] miscellanea to a mainstream topic.

This blockchain is a distributed ledger that keeps track of all users' transactions to prevent them from double-spending their coins (a task historically entrusted to third parties: banks). To prevent attackers from gaming the system, the ledger is replicated to every computer participating in the Bitcoin network and can be updated by only one computer in the network at a time. To decide which computer earns the right to update the ledger, the system organizes every 10 minutes a race between the computers, which costs them (a lot of) energy to enter. The winner wins the right to commit the last 10 minutes of transactions to the ledger (the "block" in blockchain) and some Bitcoin as a reward for their efforts. This setup is called a _proof of work_ consensus mechanism.

The goal of using a blockchain is to raise the level of trust participants have in the network.

This is where it gets interesting. Bitcoin was released as an [open source project][3] in January 2009. In 2010, realizing that quite a few of these elements can be tweaked, the community that had aggregated around Bitcoin, often on the [bitcointalk forums][4], started experimenting with them.

First, seeing that the Bitcoin blockchain is a form of a distributed database, the [Namecoin][5] project emerged, suggesting to store arbitrary data in its transaction database. If the blockchain can record the transfer of money, it could also record the transfer of other assets, such as domain names. This is exactly Namecoin's main use case, which went live in April 2011, two years after Bitcoin's introduction.

Where Namecoin tweaked the content of the blockchain, [Litecoin][6] tweaked two technical aspects: reducing the time between two blocks from 10 to 2.5 minutes and changing how the race is run (replacing the SHA-256 secure hashing algorithm with [scrypt][7]). This was possible because Bitcoin was released as open source software and Litecoin is essentially identical to Bitcoin in all other places. Litecoin was the first fork to modify the consensus mechanism, paving the way for many more.

Along the way, many more variations of the Bitcoin codebase have appeared. Some started as proposed extensions to Bitcoin, such as the [Zerocash][8] protocol, which aimed to provide transaction anonymity and fungibility but was eventually spun off into its own currency, [Zcash][9].

While Zcash has brought its own innovations, using recent cryptographic advances known as zero-knowledge proofs, it maintains compatibility with the vast majority of the Bitcoin code base, meaning it too can benefit from upstream Bitcoin innovations.

Another project, [CryptoNote][10], didn't use the same code base but sprouted from the same community, building on (and against) Bitcoin and again, on older ideas. Published in December 2012, it led to the creation of several cryptocurrencies, of which [Monero][11] (2014) is the best-known. Monero takes a different approach to Zcash but aims to solve the same issues: privacy and fungibility.

As is often the case in the open source world, there is more than one tool for the job.

### The next generations: "Blockchain-ng"

So far, however, all these variations have only really been about refining cryptocurrencies or extending them to support another type of transaction. This brings us to the second generation of blockchains.

Once the community started modifying what a blockchain could be used for and tweaking technical aspects, it didn't take long for some people to expand and rethink them further. A longtime follower of Bitcoin, [Vitalik Buterin][12] suggested in late 2013 that a blockchain's transactions could represent the change of states of a state machine, conceiving the blockchain as a distributed computer capable of running applications ("smart contracts"). The project, [Ethereum][13], went live in July 2015. It has seen fair success in running distributed apps, and the popularity of some of its better-known distributed apps ([CryptoKitties][14]) have even caused the Ethereum blockchain to slow down.

This demonstrates one of the big limitations of current blockchains: speed and capacity. (Speed is often measured in transactions per second, or TPS.) Several approaches have been suggested to solve this, from sharding to sidechains and so-called "second-layer" solutions. The need for more innovation here is strong.

With the words "smart contract" in the air and a proved—if still slow—technology to run them, another idea came to fruition: permissioned blockchains. So far, all the blockchain networks we've described have had two unsaid characteristics: They are public (anyone can see them function), and they are without permission (anyone can join them). These two aspects are both desirable and necessary to run a distributed, non-third-party-based currency.

As blockchains were being considered more and more separately from cryptocurrencies, it started to make sense to consider them in some private, permissioned settings. A consortium-type group of actors that have business relationships but don't necessarily trust each other fully can benefit from these types of blockchains—for example, actors along a logistics chain, financial or insurance institutions that regularly do bilateral settlements or use a clearinghouse, idem for healthcare institutions.

Once you change the setting from "anyone can join" to "invitation-only," further changes and tweaks to the blockchain building blocks become possible, yielding interesting results for some.

For a start, proof of work, designed to protect the network from malicious and spammy actors, can be replaced by something simpler and less resource-hungry, such as a [Raft][15]-based consensus protocol. A tradeoff appears between a high level of security or faster speed, embodied by the option of simpler consensus algorithms. This is highly desirable to many groups, as they can trade some cryptography-based assurance for assurance based on other means—legal relationships, for instance—and avoid the energy-hungry arms race that proof of work often leads to. This is another area where innovation is ongoing, with [Proof of Stake][16] a notable contender for the public network consensus mechanism of choice. It would likely also find its way to permissioned networks too.

Several projects make it simple to create permissioned blockchains, including [Quorum][17] (a fork of Ethereum) and [Hyperledger][18]'s [Fabric][19] and [Sawtooth][20], two open source projects based on new code.

Permissioned blockchains can avoid certain complexities that public, non-permissioned ones can't, but they still have their own set of issues. Proper management of participants is one: Who can join? How do they identify? How can they be removed from the network? Does one entity on the network manage a central public key infrastructure (PKI)?

The open nature of blockchains is seen as a form of governance.

### Open nature of blockchains

In all of the cases so far, one thing is clear: The goal of using a blockchain is to raise the level of trust participants have in the network and the data it produces—ideally, enough to be able to use it as is, without further work.

Reaching this level of trust is possible only if the software that powers the network is free and open source. Even a correctly distributed proprietary blockchain is essentially a collection of independent agents running the same third party's code. By nature, it's necessary—but not sufficient—for a blockchain's source code to be open source. This has both been a minimum guarantee and the source of further innovation as the ecosystem keeps growing.

Finally, it is worth mentioning that while the open nature of blockchains has been a source of innovation and variation, it has also been seen as a form of governance: governance by code, where users are expected to run whichever specific version of the code contains a function or approach they think the whole network should embrace. In this respect, one can say the open nature of some blockchains has also become a cop-out regarding governance. But this is being addressed.

### Third and fourth generations: governance

Next, I will look at what I am currently considering the third and fourth generations of blockchains: blockchains with built-in governance tools and projects to solve the tricky question of interconnecting the multitude of different blockchain projects to let them exchange information and value with each other.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/blockchain-guide-next-generation

作者：[Axel Simon][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/axel
[1]:https://bitcoin.org
[2]:https://slashdot.org/
[3]:https://github.com/bitcoin/bitcoin
[4]:https://bitcointalk.org/
[5]:https://www.namecoin.org/
[6]:https://litecoin.org/
[7]:https://en.wikipedia.org/wiki/Scrypt
[8]:http://zerocash-project.org/index
[9]:https://z.cash
[10]:https://cryptonote.org/
[11]:https://en.wikipedia.org/wiki/Monero_(cryptocurrency)
[12]:https://en.wikipedia.org/wiki/Vitalik_Buterin
[13]:https://ethereum.org
[14]:http://cryptokitties.co/
[15]:https://en.wikipedia.org/wiki/Raft_(computer_science)
[16]:https://www.investopedia.com/terms/p/proof-stake-pos.asp
[17]:https://www.jpmorgan.com/global/Quorum
[18]:https://hyperledger.org/
[19]:https://www.hyperledger.org/projects/fabric
[20]:https://www.hyperledger.org/projects/sawtooth
