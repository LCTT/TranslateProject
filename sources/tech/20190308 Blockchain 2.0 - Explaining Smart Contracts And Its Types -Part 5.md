[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Blockchain 2.0 – Explaining Smart Contracts And Its Types [Part 5])
[#]: via: (https://www.ostechnix.com/blockchain-2-0-explaining-smart-contracts-and-its-types/)
[#]: author: (editor https://www.ostechnix.com/author/editor/)

Blockchain 2.0 – Explaining Smart Contracts And Its Types [Part 5]
======

![Explaining Smart Contracts And Its Types][1]

This is the 5th article in **Blockchain 2.0** series. The previous article of this series explored how can we implement [**Blockchain in real estate**][2]. This post briefly explores the topic of **Smart Contracts** within the domain of Blockchains and related technology. Smart Contracts, which are basic protocols to verify and create new “blocks” of data on the blockchain, are touted to be a focal point for future developments and applications of the system. However, like all “cure-all” medications, it is not the answer to everything. We explore the concept from the basics to understand what “smart contracts” are and what they’re not.

### Evolving Contracts

The world is built on contracts. No individual or firm on earth can function in current society without the use and reuse of contracts. The task of creating, maintaining, and enforcing contracts have become so complicated that entire judicial and legal systems have had to be setup in the name of **“contract law”** to support it. Most of all contracts are in fact overseen by a “trusted” third party to make sure the stakeholders at the ends are taken care of as per the conditions arrived. There are contracts that even talk about a third-party beneficiary. Such contracts are intended to have an effect on a third party who is not an active (or participating) party to the contract. Settling and arguing over contractual obligations takes up the bulk of most legal battles that civil lawsuits are involved in. Surely enough a better way to take care of contracts would be a godsend for individuals and enterprises alike. Not to mention the enormous paperwork it would save the government in the name of verifications and attestations[1][2].

Most posts in this series have looked at how existing blockchain tech is being leveraged today. In contrast, this post will be more about what to expect in the coming years. A natural discussion about “smart contracts” evolve from the property discussions presented in the previous post. The current post aims to provide an overview of the capabilities of blockchain to automate and carry out “smart” executable programs. Dealing with this issue pragmatically means we’ll first have to define and explore what these “smart contracts” are and how they fit into the existing system of contracts. We look at major present-day applications and projects going on in the field in the next post titled, **“Blockchain 2.0: Ongoing Projects”**.

### Defining Smart Contracts

The [**first article of this series**][3] looked at blockchain from a fundamental point of view as a **“distributed ledger”** consisting of blocks of data that were:

  * Tamper-proof
  * Non-repudiable (Meaning every block of data is explicitly created by someone and that someone cannot deny any accountability of the same)
  * Secure and is resilient to traditional methods of cyber attack
  * Almost permanent (of course this depends on the blockchain protocol overlay)
  * Highly redundant, by existing on multiple network nodes or participant systems, the failure of one of these nodes will not affect the capabilities of the system in any way, and,
  * Offers faster processing depending on application.



Because every instance of data is securely stored and accessible by suitable credentials, a blockchain network can provide easy basis for precise verification of facts and information without the need for third party oversight. blockchain 2.0 developments also allow for **“distributed applications”** (a term which we’ll be looking at in detail in coming posts). Such distributed applications exist and run on the network as per requirements. They’re called when a user needs them and executed by making use of information that has already been vetted and stored on the blockchain.

The last paragraph provides a foundation for defining smart contracts. _**The Chamber for Digital Commerce**_ , provides a definition for smart contracts which many experts agree on.

_**“Computer code that, upon the occurrence of a specified condition or conditions, is capable of running automatically according to prespecified functions. The code can be stored and processed on a distributed ledger and would write any resulting change into the distributed ledger”[1].**_

Smart contracts are as mentioned above simple computer programs working like “if-then” or “if-else if” statements. The “smart” aspect about the same comes from the fact that the predefined inputs for the program comes from the blockchain ledger, which as proven above, is a secure and reliable source of recorded information. The program can call upon external services or sources to get information as well, if need be, to verify the terms of operation and will only execute once all the predefined conditions are met.

It has to be kept in mind that unlike what the name implies, smart contracts are not usually autonomous entities nor are they strictly speaking contracts. A very early mention of smart contracts was made by **Nick Szabo** in 1996, where he compared the same with a vending machine accepting payment and delivering the product chosen by the user[3]. The full text can be accessed **[here][4]**. Furthermore, Legal frameworks allowing the entry of smart contracts into mainstream contract use are still being developed and as such the use of the technology currently is limited to areas where legal oversight is less explicit and stringent[4].

### Major types of smart contracts

Assuming the reader has a basic understanding of contracts and computer programming, and building on from our definition of smart contracts, we can roughly classify smart contracts and protocols into the following major categories.

##### 1\. Smart legal contracts

These are presumably the most obvious kind. Most, if not, all contracts are legally enforceable. Without going into much technicalities, a smart legal contact is one that involves strict legal recourses in case parties involved in the same were to not fulfill their end of the bargain. As previously mentioned, the current legal framework in different countries and contexts lack sufficient support for smart and automated contracts on the blockchain and their legal status is unclear. However, once the laws are made, smart contracts can be made to simplify processes which currently involve strict regulatory oversight such as transactions in the financial and real estate market, government subsidies, international trade etc.

##### 2\. DAOs

**Decentralized Autonomous Organizations** , shortly DAO, can be loosely defined as communities that exist on the blockchain. The community may be defined by a set of rules arrived at and put into code via smart contracts. Every action by every participant would then be subject to these sets of rules with the task of enforcing and reaching at recourse in case of a break being left to the program. Multitudes of smart contracts make up these rules and they work in tandem policing and watching over participants.

A DAO called the **Genesis DAO** was created by **Ethereum** participants in may of 2016. The community was meant to be a crowdfunding and venture capital platform. In a surprisingly short period of time they managed to raise an astounding **$150 million**. However, hacker(s) found loopholes in the system and managed to steal about **$50 million** dollars’ worth of Ethers from the crowdfund investors. The hack and its fallout resulted in a fork of the Ethereum blockchain into two, **Ethereum** and **Ethereum Classic** [5].

##### 3\. Application logic contracts (ALCs)

If you’ve heard about the internet of things in conjunction with the blockchain, chances are that the matter talked about **Application logic contacts** , shortly ALC. Such smart contracts contain application specific code that work in conjunction with other smart contracts and programs on the blockchain. They aid in communicating with and validating communication between devices (while in the domain of IoT). ALCs are a pivotal piece of every multi-function smart contract and mostly always work under a managing program. They find applications everywhere in most examples cited here[6][7].

_Since development is ongoing in the area, any definition or standard so to speak of will be fluidic and vague at best currently._

### How smart contracts work**

To simplify things, let’s proceed by taking an example.

John and Peter are two individuals debating about the scores in a football match. They have conflicting views about the outcome with both of them supporting different teams (context). Since both of them need to go elsewhere and won’t be able to finish the match then, John bets that team A will beat team B in the match and _offers_ Peter $100 in that case. Peter _considers_ and _accepts_ the bet while making it clear that they are _bound_ to the terms. However, neither of them _trusts_ each other to honour the bet and they don’t have the time nor the money to appoint a _third party_ to oversee the same.

Assuming both John and Peter were to use a smart contract platform such as **[Etherparty][5]** , to automatically settle the bet at the time of the contract negotiation, they’ll both link their blockchain based identities to the contract and set the terms, making it clear that as soon as the match is over, the program will find out who the winning side is and automatically credit the amount to the winners bank account from the losers. As soon as the match ends and media outlets report the same, the program will scour the internet for the prescribed sources, identify which team won, relate it to the terms of the contract, in this case since B won Peter gets the money from John and after intimating both the parties transfers $100 from John’s to Peter’s account. After having executed, the smart contract will terminate and be inactive for all the time to come unless otherwise mentioned.

The simplicity of the example aside, the situation involved a classic contract (paying attention to the italicized words) and the participants chose to implement the same using a smart contract. All smart contracts basically work on a similar principle, with the program being coded to execute on predefined parameters and spitting out expected outputs only. The outside sources the smart contract consults for information is may a times referred to as the _Oracle_ in the IT world. Oracles are a common part of many smart contract systems worldwide today.

The use of a smart contract in this situation allowed the participants the following benefits:

  * It was faster than getting together and settling the bet manually.
  * Removed the issue of trust from the equation.
  * Eliminated the need for a trusted third party to handle the settlement on behalf of the parties involved.
  * Costed nothing to execute.
  * Is secure in how it handles parameters and sensitive data.
  * The associated data will remain in the blockchain platform they ran it on permanently and future bets can be placed on by calling the same function and giving it added inputs.
  * Gradually over time, assuming John and Peter develop gambling addictions, the program will help them develop reliable statistics to gauge their winning streaks.



Now that we know **what smart contracts are** and **how they work** , we’re still yet to address **why we need them**.

### The need for smart contracts

As the previous example we visited highlights we need smart contracts for a variety of reasons.

##### **Transparency**

The terms and conditions involved are very clear to the counterparties. Furthermore, since the execution of the program or the smart contract involves certain explicit inputs, users have a very direct way of verifying the factors that would impact them and the contract beneficiaries.

##### Time Efficient

As mentioned, smart contracts go to work immediately once they’re triggered by a control variable or a user call. Since data is made available to the system instantaneously by the blockchain and from other sources in the network, the execution does not take any time at all to verify and process information and settle the transaction. Transferring land title deeds for instance, a process which involved manual verification of tons of paperwork and takes weeks on normal can be processed in a matter of minutes or even seconds with the help of smart contract programs working to vet the documents and the parties involved.

##### Precision

Since the platform is basically just computer code and everything predefined, there can be no subjective errors and all the results will be precise and completely free of human errors.

##### Safety

An inherent feature of the blockchain is that every block of data is cryptographically encrypted. Meaning even though the data is stored on a multitude of nodes on the network for redundancy, **only the owner of the data has access to see and use the data**. Similarly, all process will be completely secure and tamper proof with the execution utilizing the blockchain for storing important variables and outcomes in the process. The same also simplifies auditing and regulatory affairs by providing auditors with a native, un-changed and non-repudiable version of the data chronologically.

##### Trust

The article series started by saying that blockchain adds a much-needed layer of trust to the internet and the services that run on it. The fact that smart contracts will under no circumstances show bias or subjectivity in executing the agreement means that parties involved are fully bound the outcomes and can trust the system with no strings attached. This also means that the **“trusted third-party”** required in conventional contracts of significant value is not required here. Foul play between the parties involved and oversight will be issues of the past.

##### Cost effective

As highlighted in the example, utilizing a smart contract involves minimal costs. Enterprises usually have administrative staff who work exclusively for making that transactions they undertake are legitimate and comply with regulations. If the deal involved multiple parties, duplication of the effort is unavoidable. Smart contracts essentially make the former irrelevant and duplication is eliminated since both the parties can simultaneously have their due diligence done.

### Applications of Smart Contracts

Basically, if two or more parties use a common blockchain platform and agree on a set of principles or business logic, they can come together to create a smart contract on the blockchain and it is executed with no human intervention at all. No one can tamper with the conditions set and, any changes, if the original code allows for it, is timestamped and carries the editor’s fingerprint increasing accountability. Imagine a similar situation at a much larger enterprise scale and you understand what smart contracts are capable of and in fact a **Capgemini study** from 2016 found that smart contracts could actually be commercially mainstream **“in the early years of the next decade”** [8]. Commercial applications involve uses in Insurance, Financial Markets, IoT, Loans, Identity Management systems, Escrow Accounts, Employment contracts, and Patent & Royalty contracts among others. Platforms such as Ethereum, a blockchain designed keeping smart contracts in mind, allow for individual private users to utilize smart contracts free of cost as well.

A more comprehensive overview of the applications of smart contracts on current technological problems will be presented in the next article of the series by exploring the companies that deal with it.

### So, what are the drawbacks?

This is not to say that smart contracts come with no concerns regarding their use whatsoever. Such concerns have actually slowed down development in this aspect as well. The tamper-proof nature of everything blockchain essentially makes it next to impossible to modify or add new clauses to existing clauses if the parties involved need to without major overhaul or legal recourse.

Secondly, even though activity on a public blockchain is open for all to see and observe. The personal identities of the parties involved in a transaction are not always known. This anonymity raises question regarding legal impunity in case either party defaults especially since current laws and lawmakers are not exactly accommodative of modern technology.

Thirdly, blockchains and smart contracts are still subject to security flaws in many ways because the technology for all the interest in it is still in a very nascent stage of development. This inexperience with the code and platform is what ultimately led to the DAO incident in 2016.

All of this is keeping aside the significant initial investment that might be needed in case an enterprise or firm needs to adapt a blockchain for its use. The fact that these are initial one-time investments and come with potential savings down the road however is what interests people.

### Conclusion

Current legal frameworks don’t really support a full-on smart contract enabled society and won’t in the near future due to obvious reasons. A solution is to opt for **“hybrid” contracts** that combine traditional legal texts and documents with smart contract code running on blockchains designed for the purpose[4]. However, even hybrid contracts remain largely unexplored as innovative legislature is required to bring them into fruition. The applications briefly mentioned here and many more are explored in detail in the [**next post of the series**][6].

**References:**

  * **[1] S. C. A. Chamber of Digital Commerce, “Smart contracts – Is the law ready,” no. September, 2018.**
  * **[2] [Legal Definition of ius quaesitum tertio][7].
**
  * **[3][N. Szabo, “Nick Szabo — Smart Contracts: Building Blocks for Digital Markets,” 1996.][4]**
  * **[4] Cardozo Blockchain Project, “‘Smart Contracts’ & Legal Enforceability,” vol. 2, p. 28, 2018.**
  * **[5][The DAO Heist Undone: 97% of ETH Holders Vote for the Hard Fork.][8]**
  * **[6] F. Idelberger, G. Governatori, R. Riveret, and G. Sartor, “Evaluation of Logic-Based Smart Contracts for Blockchain Systems,” 2016, pp. 167–183.**
  * **[7][Types of Smart Contracts Based on Applications | Market InsightsTM – Everest Group.][9]**
  * **[8] B. Cant et al., “Smart Contracts in Financial Services : Getting from Hype to Reality,” Capgemini Consult., pp. 1–24, 2016.**



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/blockchain-2-0-explaining-smart-contracts-and-its-types/

作者：[editor][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/editor/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/03/smart-contracts-720x340.png
[2]: https://www.ostechnix.com/blockchain-2-0-blockchain-in-real-estate/
[3]: https://www.ostechnix.com/blockchain-2-0-an-introduction/
[4]: http://www.fon.hum.uva.nl/rob/Courses/InformationInSpeech/CDROM/Literature/LOTwinterschool2006/szabo.best.vwh.net/smart_contracts_2.html
[5]: https://etherparty.com/
[6]: https://www.ostechnix.com/blockchain-2-0-ongoing-projects-the-state-of-smart-contracts-now/
[7]: http://www.legal-glossary.org/
[8]: https://futurism.com/the-dao-heist-undone-97-of-eth-holders-vote-for-the-hard-fork/
[9]: https://www.everestgrp.com/2016-10-types-smart-contracts-based-applications-market-insights-36573.html/
