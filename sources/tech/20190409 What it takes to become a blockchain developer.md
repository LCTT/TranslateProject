[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What it takes to become a blockchain developer)
[#]: via: (https://opensource.com/article/19/4/blockchain-career-developer)
[#]: author: (Joseph Mugo https://opensource.com/users/mugo)

What it takes to become a blockchain developer
======
If you’ve been considering a career in blockchain development, the time
to get your foot in the door is now. Here's how to get started.
![][1]

The past decade has been an interesting time for the development of decentralized technologies. Before 2009, the progress was slow and without any clear direction until Satoshi Nakamoto created and deployed Bitcoin. That brought blockchain, the record-keeping technology behind Bitcoin, into the limelight.

Since then, we've seen blockchain revolutionize various concepts that we used to take for granted, such as monitoring supply chains, [creating digital identities,][2] [tracking jewelry][3], and [managing shipping systems.][4] Companies such as IBM and Samsung are at the forefront of blockchain as the underlying infrastructure for the next wave of tech innovation. There is no doubt that blockchain's role will grow in the years to come.

Thus, it's no surprise that there's a high demand for blockchain developers. LinkedIn put "blockchain developers" at the top of its 2018 [emerging jobs report][5] with an expected 33-fold growth. The freelancing site Upwork also released a report showing that blockchain was one of the [fastest growing skills][6] out of more than 5,000 in its index.

Describing the internet in 2003, [Jeff Bezos said][7], "we are at the 1908 Hurley washing machine stage." The same can be said about blockchain today. The industry is busy building its foundation. If you've been considering a career as a blockchain developer, the time to get your foot in the door is now.

However, you may not know where to start. It can be frustrating to go through countless blog posts and white papers or messy Slack channels when trying to find your footing. This article is a report on what I learned when contemplating whether I should become a blockchain developer. I'll approach it from the basics, with resources for each topic you need to master to be industry-ready.

### Technical fundamentals

Although you're won't be expected to build a blockchain from scratch, you need to be skilled enough to handle the duties of blockchain development. A bachelor's degree in computer science or information security is required. You also need to have some fundamentals in data structures, cryptography, and networking and distributed systems.

#### Data structures

The complexity of blockchain requires a solid understanding of data structures. At the core, a distributed ledger is like a network of replicated databases, only it stores information in blocks rather than tables. The blocks are also cryptographically secured to ensure their integrity every time a block is added.

For this reason, you have to know how common data structures, such as binary search trees, hash maps, graphs, and linked lists, work. It's even better if you can build them from scratch.

This [GitHub repository][8] contains all information newbies need to learn data structures and algorithms. Common languages such as Python, Java, Scala, C, C-Sharp, and C++ are featured.

#### Cryptography

Cryptography is the foundation of blockchain; it is what makes cryptocurrencies work. The Bitcoin blockchain employs public-key cryptography to create digital signatures and hash functions. You might be discouraged if you don't have a strong math background, but Stanford offers [a free course][9] that's perfect for newbies. You'll learn about authenticated encryption, message integrity, and block ciphers.

You should also study [RSA][10], which doesn't require a strong background in mathematics, and look at [ECDSA][11] (elliptic curve cryptography).

And don't forget [cryptographic hash functions][12]. They are the equations that enable most forms of encryptions on the internet. They keep payments secure on e-commerce sites and are the core mechanism behind the HTTPS protocol. There's extensive use of cryptographic hash functions in blockchain.

#### Networking and distributed systems

Build a good foundation in understanding how distributed ledgers work. Also understand how peer-to-peer networks work, which translates to a good foundation in computer networks, from networking topologies to routing.

In blockchain, the processing power is harnessed from connected computers. For seamless recording and interchange of information between these devices, you need to understand about [Byzantine fault-tolerant consensus][13], which is a key security feature in blockchain. You don't need to know everything; an understanding of how distributed systems work is good enough.

Stanford has a free, self-paced [course on computer networking][14] if you need to start from scratch. You can also consult this list of [awesome material on distributed systems][15].

### Cryptonomics

We've covered some of the most important technical bits. It's time to talk about the economics of this industry. Although cryptocurrencies don't have central banks to monitor the money supply or keep crypto companies in check, it's essential to understand the economic structures woven around them.

You'll need to understand game theory, the ideal mathematical framework for modeling scenarios in which conflicts of interest exist among involved parties. Take a look at Michael Karnjanaprakorn's [Beginner's Guide to Game Theory][16]. It's lucid and well explained.

You also need to understand what affects currency valuation and the various monetary policies that affect cryptocurrencies. Here are some books you can refer to:

  * _[The Business Blockchain: Promise, Practice, and Application of the Next Internet Technology][17]_ by William Mougayar
  * _[Blockchain: Blueprint for the New Economy][18]_ by Melanie Swan
  * _[Blockchain: The Blockchain For Beginners Guide to Blockchain Technology and Leveraging Blockchain Programming][19]_ by Josh Thompsons



Depending on how skilled you are, you won't need to go through all those materials. But once you're done, you'll understand the fundamentals of blockchain. Then you can dive into the good stuff.

### Smart contracts

A [smart contract][20] is a program that runs on the blockchain once a transaction is complete to enhance blockchain's capabilities.

Unlike traditional judicial systems, smart contracts are enforced automatically and impartially. There are also no middlemen, so you don't need a lawyer to oversee a transaction.

As smart contracts get more complex, they become harder to secure. You need to be aware of every possible way a smart contract can be executed and ensure that it does what is expected. At the moment, not many developers can properly optimize and audit smart contracts.

### Decentralized applications

Decentralized applications (DApps) are software built on blockchains. As a blockchain developer, there are several platforms where you can build a DApp. Here are some of them:

#### Ethereum

Ethereum is Vitalik Buterin's brainchild. It went live in 2015 and is one of the most popular development platforms. Ether is the cryptocurrency that fuels the Ethereum.

It has its own language called Solidity, which is similar to C++ and JavaScript. If you've got any experience with either, you'll pick it up easily.

One thing that makes Solidity unique is that it is smart-contract oriented.

#### NEO

Originally known as Antshares, NEO was founded by Erik Zhang and Da Hongfei in 2014. It became NEO in 2017. Unlike Ethereum, it's not limited to one language. You can use different programming languages to build your DApps on NEO, including C# and Java. Experienced users can easily start building DApps on NEO. It's focused on providing platforms for future digital businesses.

Consider NEO if you have applications that will need to process lots of transactions per second. However, it works closely with the Chinese government and follows Chinese business regulations.

#### EOS

EOS blockchain aims to be a decentralized operating system that can support industrial-scale applications. It's basically like Ethereum, but with faster transaction speeds and more scalable.

#### Hyperledger

Hyperledger is an open source collaborative platform that was created to develop cross-industry blockchain technologies. The Linux Foundation hosts Hyperledger as a hub for open industrial blockchain development.

### Learning resources

Here are some courses and other resources that'll help make you an industry-ready blockchain developer.

  * The University of Buffalo and The State University of New York have a [blockchain specialization course][21] that also teaches smart contracts. You can complete it in two months if you put in 10 hours per week. You'll learn about designing and implementing smart contracts and various methods for developing decentralized applications on blockchain.
  * [DApps for Beginners][22] offers tutorials and other information to get you started on creating decentralized apps on the Ethereum blockchain. You'll need to know JavaScript, and knowledge of C++ is an added advantage.
  * IBM also offers [Blockchain for Developers][23], where you'll work with IBM's private blockchain and build smart contracts using the [Hyperledger Fabric][24].
  * For $3,500 you can enroll in MIT's online [Blockchain Technologies: Business Innovation and Application][25] program, which examines blockchain from an economic perspective. You need deep pockets for this one; it's meant for executives who want to know how blockchain can be used in their organizations.
  * If you're willing to commit 10 hours per week, Udacity's [Blockchain Developer Nanodegree][26] can prepare you to become an industry-ready blockchain developer in six months. Before enrolling, you should have some experience in object-oriented programming. You should also have developed the frontend and backend of a web application with JavaScript. And you're required to have used a remote API to create and consume data. You'll work with Bitcoin and Ethereum protocols to build projects for real-world applications.
  * If you need to shore up your foundations, you may be interested in the Open Source Society University's wildly popular and [free computer science curriculum][27].
  * You can read a variety of articles about [blockchain in open source][28] on [Opensource.com][29].



### Types of blockchain development

What does a blockchain developer really do? It doesn't involve building a blockchain from scratch. Depending on the organization you work for, here are some of the categories that blockchain developers fall under.

#### Backend developers

In this case, the developer is responsible for:

  * Designing and developing APIs for blockchain integration
  * Doing performance testing and deployment
  * Gathering requirements and working side-by-side with other developers and designers to design software
  * Providing technical support



#### Blockchain-specific

Blockchain developers and project managers fall under this category. Their main roles include:

  * Developing and maintaining decentralized applications
  * Supervising and planning blockchain projects
  * Advising companies on how to structure initial coin offerings (ICOs)
  * Understanding what a company needs and creating apps that address those needs
  * For project managers, organizing training for employees



#### Smart-contract engineers

This type of developer is required to know a smart-contract language like Solidity, Python, or Go. Their main roles include:

  * Auditing and developing smart contracts
  * Meeting with users and buyers
  * Understanding business flow and security to ensure there are no loopholes in smart contracts
  * Doing end-to-end business process testing



### The state of the industry

There's a wide base of knowledge to help you become a blockchain developer. If you're interested in joining the field, it's an opportunity for you to make a difference by pioneering the next wave of tech innovations. It pays very well and is in high demand. There's also a wide community you can join to help you gain entry as an actual developer, including [Ethereum Stack Exchange][30] and meetup events around the world.

The banking sector, the insurance industry, governments, and retail industries are some of the sectors where blockchain developers can work. If you're willing to work for it, being a blockchain developer is an excellent career choice. Currently, the need outpaces available talent by far.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/blockchain-career-developer

作者：[Joseph Mugo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mugo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/EDU_UnspokenBlockers_1110_A.png?itok=x8A9mqVA
[2]: https://www.fool.com/investing/2018/02/16/this-is-really-happening-microsoft-is-developing-b.aspx
[3]: https://www.engadget.com/2018/04/26/ibm-blockchain-jewelry-provenance/
[4]: https://www.engadget.com/2018/04/16/samsung-blockchain-based-global-shipping-system/
[5]: https://economicgraph.linkedin.com/research/linkedin-2018-emerging-jobs-report
[6]: https://www.upwork.com/blog/2018/05/fastest-growing-skills-upwork-q1-2018/
[7]: https://www.wsj.com/articles/SB104690855395981400
[8]: https://github.com/TheAlgorithms
[9]: https://www.coursera.org/learn/crypto
[10]: https://en.wikipedia.org/wiki/RSA_(cryptosystem)
[11]: https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm
[12]: https://komodoplatform.com/cryptographic-hash-function/
[13]: https://en.wikipedia.org/wiki/Byzantine_fault
[14]: https://lagunita.stanford.edu/courses/Engineering/Networking-SP/SelfPaced/about
[15]: https://github.com/theanalyst/awesome-distributed-systems
[16]: https://hackernoon.com/beginners-guide-to-game-theory-31e3e6adcec9
[17]: https://www.amazon.com/dp/B01EIGP8HG/
[18]: https://www.amazon.com/Blockchain-Blueprint-Economy-Melanie-Swan/dp/1491920491
[19]: https://www.amazon.com/Blockchain-Beginners-Technology-Leveraging-Programming-ebook/dp/B0711RN8KJ
[20]: https://lifeinpaces.com/2019/03/04/ethereum-smart-contracts-how-do-they-work/
[21]: https://www.coursera.org/specializations/blockchain?aid=true
[22]: https://dappsforbeginners.wordpress.com/
[23]: https://developer.ibm.com/tutorials/cl-ibm-blockchain-101-quick-start-guide-for-developers-bluemix-trs/#start
[24]: https://www.hyperledger.org/projects/fabric
[25]: https://executive.mit.edu/openenrollment/program/blockchain-technologies-business-innovation-and-application-self-paced-online/#.XJSk-CgzbRY
[26]: https://www.udacity.com/course/blockchain-developer-nanodegree--nd1309
[27]: https://github.com/ossu/computer-science
[28]: https://opensource.com/tags/blockchain
[29]: http://Opensource.com
[30]: https://ethereum.stackexchange.com/
