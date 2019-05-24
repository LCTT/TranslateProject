[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Blockchain 2.0 – Explaining Distributed Computing And Distributed Applications [Part 11])
[#]: via: (https://www.ostechnix.com/blockchain-2-0-explaining-distributed-computing-and-distributed-applications/)
[#]: author: (editor https://www.ostechnix.com/author/editor/)

Blockchain 2.0 – Explaining Distributed Computing And Distributed Applications [Part 11]
======

![Explaining Distributed Computing And Distributed Applications][1]

### How DApps serve the purpose of [Blockchain 2.0][2]

**Blockchain 1.0** was about introducing the “blockchain” into the list of modern buzzwords along with the advent of **bitcoin**. Multiple white papers detailing bitcoin’s underlying blockchain network specified the use of the blockchain for other uses as well. Although most of the said uses was around the basic concept of using the blockchain as a **decentralized medium** for storage, a use that stems from this property is utilizing it for carrying out **Distributed computing** on top of this layer.

**DApps** or **Distributed Applications** are computer programs that are stored and run on a distributed storage system such as the [**Ethereum**][3] blockchain for instance. To understand how DApps function and how they’re different from traditional applications on your desktop or phone, we’ll need to delve into what distributed computing is. This post will explore some fundamental concepts of distributed computing and the role of blockchains in executing the said objective. Furthermore, well also look at a few applications or DApps, in blockchain lingo, to get a hang of things.

### What is Distributed Computing?

We’re assuming many readers are familiar with multi-threaded applications and multi-threading in general. Multi-threading is the reason why processor manufacturers are forever hell bent on increasing the core count on their products. Fundamentally speaking, some applications such as video rendering software suites are capable of dividing their work (in this case rendering effects and video styles) into multiple chunks and parallelly get them processed from a supporting computing system. This reduces the lead time on getting the work done and is generally more efficient in terms of time, money and energy usage. Applications such as some games however, cannot make use of this system since processing and responses need to be obtained real time based on user inputs rather than via planned execution. Nonetheless, the fact that more processing power may be exploited from existing hardware using these computing methods remains true and significant.

Even supercomputers are basically a bunch of powerful CPUs all tied up together in a circuit to enable faster processing as mentioned above. The average core count on flagship CPUs from the lead manufacturers AMD and Intel have in fact gone up in the last few years, because increasing core count has recently been the only method to claim better processing and claim upgrades to their product lines. This information notwithstanding, the fact remains that distributed computing and related concepts of parallel computing are the only legitimate ways to improve processing capabilities in the near future. There are minor differences between distributed and parallel computing models as well, however that is beyond the scope off this post.

Another method to get many computers executing programs simultaneously is to connect them through the internet and have a cloud-based program to be implemented in parts by all of the participating systems. This is the basic fundamental behind distributed applications.

For a more detailed account and primer regarding what and how parallel computing works, interested readers may visit [this][4] webpage. For a more detailed study of the topic, for people who have a background in computer science, you may refer to [this][5] website and the accompanying book.

### What are DApps or Distributed Applications

Application that can make use of the capabilities offered by a distributed computing system is called a **distributed application**. The execution and structure of such an application’s back end needs to be carefully designed in order to be compatible with the system.

The blockchain presents an opportunity to store data in a distributed system of participating nodes. Stepping up from this opportunity we can logically build systems and applications running on such a network (think about how you used to download files via the Torrent protocol).

Such decentralized applications present a lot of benefits over conventional applications that typically run from a central server. Some highlights are:

  * DApps run on a network of such participating nodes and any user request is parsed through such network nodes to provide the user with the requested functionality. _**Program is executed on the network instead of a single computer or a server**_.
  * DApps will have codified methods of filtering through requests and executing them so as to always be fair and transparent when users interact with it. To create a new block of data in the chain, the same has to be approved via a **consensus algorithm** by the participating nodes. This fundamental idea of peer to peer approval applies for DApps as well. This essentially means that DApps cannot by extension of this principle provide different outputs to the same query or input. All users will be given the same priority unless it is explicitly mentioned and all users will receive similar results from the DApp as well. This will prove to be important in developing better industry practices for insurance and finance companies for instance. A DApp that specializes in microlending, for instance, cannot differentiate and offer different interest rates for different borrowers other than their credit history. This also means that all users will eventually end up paying for their required operations uniformly depending on the computational complexity of the task they passed on to the application. For instance, combing through 10000 entries of data will cost proportionately more than combing through say 100. The payment or incentivisation system might be different for different applications and blockchain protocols though.
  * Most DApps are by default redundant and fail safe. If you’re using a service which is run on a central server, a failure from the server end will freeze the application. Think of a service such as PayPal for instance. If the PayPal server in your immediate region fails due to some reason and somehow the central server cannot re route your request, your payment will not go through. However, even in case multiple participating nodes in the blockchain dies, you will still find the application live and running provided at least one node is live. This presents a use case for applications which are by definition supposed to be live all the time. Emergency services, insurance, communications etc., are some key areas where investors hope such DApps will bring in much needed reliability.
  * DApps are usually cost-effective owing to them not requiring a central server to be maintained for their functionality. Once they become mainstream, the mean computing cost of running tasks on the same is also supposed to decrease.
  * DApps will as mentioned exist till eternity at least until one participant is live on the chain. This essentially means that DApps cannot be censored or hacked into bowing and shutting down.



The above list of features seems very few, however, combine that with all the other capabilities of the blockchain, the advancement of wireless network access, and, the increasing capabilities of millions of smartphones and here we have in our hands nothing less than a paradigm shift in how the apps that we rely on work.

We will look deeper into how DApps function and how you can make your own DApps on the Ethereum blockchain in a proceeding post. To give you an idea of the DApp environment right now, we present 4 carefully chosen examples that are fairly advanced and popular.

##### 1\. BITCOIN (or any Cryptocurrency)

We’re very sure that readers did not expect BITCOIN to be one among a list of applications in this post. The point we’re trying to make here however, is that any cryptocurrency currently running on a blockchain backbone can be termed as a DApp. Cryptocurrencies are in fact the most popular DApp format out there and a revolutionary one at that too.

##### 2\. [MELON][6]

We’ve talked about how asset management can be an easier task utilizing blockchain and [**smart contracts**][7]. **Melon** is a company that aims to provide its users with usable relevant tools to manage and maximize their returns from the assets they own. They specialize in cryptographic assets as of now with plans to turn to real digitized assets in the future.

##### 3\. [Request][8]

**Request** is primarily a ledger system that handles financial transactions, invoicing, and taxation among other things. Working with other compatible databases and systems it is also capable of verifying payer data and statistics. Large corporations which typically have a significant number of defaulting customers will find it easier to handle their operations with a system such as this.

##### 4\. [CryptoKitties][9]

Known the world over as the video game that broke the Ethereum blockchain, **CryptoKitties** is a video game that runs on the Ethereum blockchain. The video game identifies each user individually by building your own digital profiles and gives you unique **virtual cats** in return. The game went viral and due to the sheer number of users it actually managed to slow down the Ethereum blockchain and its transaction capabilities. Transactions took longer than usual with users having to pay significantly extra money for simple transactions even. Concerns regarding scalability of the Ethereum blockchain have been raised by several stakeholders since then.

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/blockchain-2-0-explaining-distributed-computing-and-distributed-applications/

作者：[editor][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/editor/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/05/Distributed-Computing-720x340.png
[2]: https://www.ostechnix.com/blockchain-2-0-an-introduction/
[3]: https://www.ostechnix.com/blockchain-2-0-what-is-ethereum/
[4]: https://www.techopedia.com/definition/7/distributed-computing-system
[5]: https://www.distributed-systems.net/index.php/books/distributed-systems-3rd-edition-2017/
[6]: https://melonport.com/
[7]: https://www.ostechnix.com/blockchain-2-0-explaining-smart-contracts-and-its-types/
[8]: https://request.network/en/use-cases/
[9]: https://www.cryptokitties.co/
