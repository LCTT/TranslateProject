[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The current state of blockchain and where it's going)
[#]: via: (https://opensource.com/article/19/12/blockchain-evolution)
[#]: author: (axel simon https://opensource.com/users/axel)

The current state of blockchain and where it's going
======
Take a look at the ecosystem and the projects trying to solve some of
the limitations of blockchain technology.
![Arrows moving a process forward][1]

In an earlier post, [_Blockchain evolution: A quick guide and why open source is at the heart of it_][2], I discussed the first generations of blockchains: the public Bitcoin and cryptocurrency blockchains, followed by the Ethereum blockchain capable of executing programs ("smart contracts"), leading to permissioned versions of code-executing blockchains (e.g., Hyperledger Fabric, Quorum).

Let's step back into the blockchain jungle and take a look at the current state of the ecosystem and the projects trying to solve some of the limitations of blockchain technology: speed and throughput, cross-blockchain information and value exchange, governance, and identity and account management.

### Speeding things up

One of the oft-heard gripes about current blockchain technologies is their limited speed, often measured by the number of transactions per second (TPS) that they can manage. This issue strongly limits their use in systems that need to process massive amounts of events. For instance, it has often been said (correctly) that Bitcoin can't handle more than seven transactions per second, and Ethereum can't do much more. Possibly the simplest way of defining the next generation of blockchains is with novel ways to try to solve the scalability problems that current generations of blockchains constantly battle. (Permissionless ones especially. I will return to what separates permissionless and permissioned chains below.)

The most obvious option—and one of the most fiercely debated one in the Bitcoin community—is "simply" to make the blocks of transactions bigger so that they can handle more transactions per block, and thus per second. Opposing interests in Bitcoin have made this solution very hard to implement (a clear problem with the "governance by code" model I mentioned in my previous article, which I will return to in a future article), but it nonetheless remains a relatively straightforward option for blockchain projects in general. Increasing the frequency at which blocks are created is another one.

I also mentioned another way to handle more transactions per second in the first article: changing the constraints of the problem. Going from a permissionless network—one that anyone can join and participate in—to a permissioned one—where joining requires permission—changes the constraints and offers the option of reconsidering the security requirements. When you know everyone in a consortium—and have legal ties to them—you can choose to use consensus mechanisms, which don't assume everything should be verified at all times and thus speed things up. Furthermore, permissioned blockchain frameworks, such as Hyperledger Fabric, will typically offer the option to choose the number of transactions contained in a block and their frequency. Whether it's the number of transactions per block or the number of blocks generated that increases, the end result will be an increase in TPS.

This is how permissioned systems can reach tens of thousands of TPS, numbers far beyond the major permissionless networks. It is also unsurprising, then, that Facebook's recently announced Libra cryptocurrency plans to use a permissioned model (although its "blockchainness" is debated) to handle a high number of transactions, in line with its stated goals.

### Holding out for consensus

However, private, permissioned ledgers will not be suited to all use cases. There need to be improvements in general to permissionless networks' capacity to manage more events at a time. This leads us to where the most ambitious work might be happening: consensus mechanisms.

Getting all participants to come to a consensus on the "truth" of all the transactions (i.e., the changes) that happen on the network and on their order is one of the great difficulties of distributed systems. As a type of distributed system, blockchains inevitably contend with it, too.

Bitcoin's solution is to organize a race every 10 minutes to solve a computational puzzle and let the winner settle what transactions happened in the last time period and in which order, which everyone else can then easily verify and agree on. By virtue of the kind of puzzle used, the winner is essentially random, but the problem with this "Nakamoto-style proof of work" is that the puzzles used in this race also require horrendously high computational resources to solve (by design), and the work of everyone but the winner is thrown away after each round.

While it is secure, proof of work is also energy-consuming and slow.

What we need are better consensus mechanisms that will allow participants of blockchain networks to come to agreement more efficiently, making it possible for the whole system to process more events per second.

Ethereum, notably, is working on numerous innovations to solve these limitations. First of all, it plans to let go of proof of work to move to a proof of stake consensus mechanism, often referred to as the [Casper protocol][3]. It uses economic incentives and disincentives to get the nodes to secure the network and make cheating (very) costly.

Another problem a blockchain that can execute smart contracts must contend with is how the execution of code is guaranteed to be correct and what impact this has on the processing capacity of the overall network. Currently, Ethereum requires each validating node to execute the code to verify that the results offered by other nodes are correct. This poses scalability issues, as the greater the success of the Ethereum "world computer," the more code validators need to check: all the nodes need to agree on the order _and_ the validity of each line of code executed and will inevitably be held back by the slowest node.

One of the options to alleviate this issue is [_sharding_][4], a solution where only part of the network executes the code and returns results the rest of the network can verify.

Pushing this idea further, [ZEXE][5], a project by the team behind Zcash, deals with this situation by making it possible to submit the result of the execution of code along with a cryptographic proof that the result is correct. Other nodes can then take this proof and check it very quickly without redoing the computation. This, combined with bounties for proving results wrong, creates a system where code can be executed by a single node and checked by many, and it makes for a clever way of speeding up the execution of distributed applications (dapps).

Consensus in distributed systems is not exactly a new research field, but as blockchains have become popular, there has been renewed interest in consensus research. I could mention many more (Tendermint, Ouroboros, and Algorand come to mind), but I'll offer one other interesting approach regarding consensus: consensus agility. For instance, Hyperledger Sawtooth can [change consensus][6] on the fly, "putting all blockchain configuration on the chain itself." This makes it possible to start a network using a given consensus mechanism and switch to a different, more adapted one when the network and its users have changed, say going from a small-scale deployment to a large consortium.

This is starting to shed light on an important aspect of the evolution of blockchains: modularity. While the first projects were very tightly integrated, over time, efforts have been made to separate the different layers: networking, consensus, application, and even information storage.

### Layer 2 solutions: Generation 2.5?

Solutions baked directly into the blockchain—such as the ones above—are considered to be layer 1. Solutions built on top of a blockchain are called layer 2 solutions.

These layer 2 solutions, such as the [Lightning Network][7] for Bitcoin or [Raiden][8] for Ethereum, are designed to speed up the overall system by offloading transactions to a secondary network. It's designed to achieve much higher throughput while still connecting to the main blockchain and maintaining its important characteristics: distributed, permissionless, and trust-minimizing. While similar to some degree to sidechains (connecting another system to the main chain, an idea I will return to in the next article), they don't use the idea of a secondary chain. Instead, they build overlay networks that rely on the underlying chain for security and accountability but can exchange information much, much faster and in a peer-to-peer manner.

Layer 2 solutions are essentially built for cryptocurrencies and create payment tunnels anchored to the underlying cryptocurrency's blockchain, where the amounts exchanged between two parties are eventually settled. By taking most transactions off-chain and alleviating how much needs to happen on the main chain and offloading most transactions to the second layer, they help speed up the entire system.

### Conclusion

Speed is the great limiter on the potential of permissionless blockchains. There is a great deal of work going on to explore solutions to this challenge while maintaining the integrity of the chain. Recent research on consensus is leading to new approaches which offer less environmentally unfriendly guarantees on accuracy.

Open source software is constantly evolving, and as an open source ecosystem, blockchains are a prime example of this reality: Many projects are experimenting with various solutions to shared problems, and these solutions are being studied, refined, and improved by the rest of the community.

The next installment of this series will examine how current generations of blockchain technologies are trying not just to make individual blockchains more efficient but also capable of working together.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/blockchain-evolution

作者：[axel simon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/axel
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_twoforward.png?itok=exkV49ts (Arrows moving a process forward)
[2]: https://opensource.com/article/18/6/blockchain-guide-next-generation
[3]: https://github.com/ethereum/eth2.0-specs/tree/dev/specs/core
[4]: https://github.com/ethereum/wiki/wiki/Sharding-FAQ
[5]: https://eprint.iacr.org/2018/962.pdf
[6]: https://www.hyperledger.org/blog/2017/11/22/un-pluggable-consensus-with-hyperledger-sawtooth
[7]: https://lightning.network/
[8]: https://raiden.network/
