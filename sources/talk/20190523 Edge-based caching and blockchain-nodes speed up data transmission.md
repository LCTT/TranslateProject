[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Edge-based caching and blockchain-nodes speed up data transmission)
[#]: via: (https://www.networkworld.com/article/3397105/edge-based-caching-and-blockchain-nodes-speed-up-data-transmission.html)
[#]: author: (Patrick Nelson https://www.networkworld.com/author/Patrick-Nelson/)

Edge-based caching and blockchain-nodes speed up data transmission
======
Using a combination of edge-based data caches and blockchain-like distributed networks, Bluzelle claims it can significantly speed up the delivery of data across the globe.
![OlgaSalt / /getty][1]

The combination of a blockchain-like distributed network, along with the ability to locate data at the edge will massively speed up future networks, such as those used by the internet of things (IoT), claims Bluzelle in announcing what is says is the first decentralized data delivery network (DDN).

Distributed DDNs will be like content delivery networks (CDNs) that now cache content around the world to speed up the web, but in this case, it will be for data, the Singapore-based company explains. Distributed key-value (blockchain) networks and edge computing built into Bluzelle's system will provide significantly faster delivery than existing caching, the company claims in a press release announcing its product.

“The future of data delivery can only ever be de-centrally distributed,” says Pavel Bains, CEO and co-founder of Bluzelle. It’s because the world requires instant access to data that’s being created at the edge, he argues.

“But delivery is hampered by existing technology,” he says.

**[ Also read:[What is edge computing?][2] and [How edge networking and IoT will reshape data centers][3]. ]**

Bluzelle says decentralized caching is the logical next step to generalized data caching, used for reducing latency. “Decentralized caching expands the theory of caching,” the company writes in a [report][4] (Dropbox pdf) on its [website][5]. It says the cache must be expanded from simply being located at one unique location.

“Using a combination of distributed networks, the edge and the cloud, [it’s] thereby increasing the transactional throughput of data,” the company says.

This kind of thing is particularly important in consumer gaming now, where split-second responses from players around the world make or break a game experience, but it will likely be crucial for the IoT, higher-definition media, artificial intelligence, and virtual reality as they gain more of a role in digitization—including at critical enterprise applications.

“Currently applications are limited to data caching technologies that require complex configuration and management of 10-plus-year-old technology constrained to a few data centers,” Bains says. “These were not designed to handle the ever-increasing volumes of data.”

Bains says one of the key selling points of Bluzelle's network is that developers should be able to implement and run networks without having to also physically expand the networks manually.

“Software developers don’t want to react to where their customers come from. Our architecture is designed to always have the data right where the customer is. This provides a superior consumer experience,” he says.

Data caches are around now, but Bluzelle claims its system, written in C++ and available on Linux and Docker containers, among other platforms, is faster than others. It further says that if its system and a more traditional cache would connect to the same MySQL database in Virginia, say, their users will get the data three to 16 times faster than a traditional “non-edge-caching” network. Write updates to all Bluzelle nodes around the world takes 875 milliseconds (ms), it says.

The company has been concentrating its efforts on gaming, and with a test setup in Virginia, it says it was able to deliver data 33 times faster—at 22ms to Singapore—than a normal, cloud-based data cache. That traditional cache (located near the database) took 727ms in the Bluzelle-published test. In a test to Ireland, it claims 16ms over 223ms using a traditional cache.

An algorithm is partly the reason for the gains, the company explains. It “allows the nodes to make decisions and take actions without the need for masternodes,” the company says. Masternodes are the server-like parts of blockchain systems.

**More about edge networking**

  * [How edge networking and IoT will reshape data centers][3]
  * [Edge computing best practices][6]
  * [How edge computing can help secure the IoT][7]



Join the Network World communities on [Facebook][8] and [LinkedIn][9] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3397105/edge-based-caching-and-blockchain-nodes-speed-up-data-transmission.html

作者：[Patrick Nelson][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Patrick-Nelson/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/02/blockchain_crypotocurrency_bitcoin-by-olgasalt-getty-100787949-large.jpg
[2]: https://www.networkworld.com/article/3224893/internet-of-things/what-is-edge-computing-and-how-it-s-changing-the-network.html
[3]: https://www.networkworld.com/article/3291790/data-center/how-edge-networking-and-iot-will-reshape-data-centers.html
[4]: https://www.dropbox.com/sh/go5bnhdproy1sk5/AAC5MDoafopFS7lXUnmiLAEFa?dl=0&preview=Bluzelle+Report+-+The+Decentralized+Internet+Is+Here.pdf
[5]: https://bluzelle.com/
[6]: https://www.networkworld.com/article/3331978/lan-wan/edge-computing-best-practices.html
[7]: https://www.networkworld.com/article/3331905/internet-of-things/how-edge-computing-can-help-secure-the-iot.html
[8]: https://www.facebook.com/NetworkWorld/
[9]: https://www.linkedin.com/company/network-world
