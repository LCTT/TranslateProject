[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why blockchain (might be) coming to an IoT implementation near you)
[#]: via: (https://www.networkworld.com/article/3386881/why-blockchain-might-be-coming-to-an-iot-implementation-near-you.html#tk.rss_all)
[#]: author: (Jon Gold https://www.networkworld.com/author/Jon-Gold/)

Why blockchain (might be) coming to an IoT implementation near you
======

![MF3D / Getty Images][1]

Companies have found that IoT partners well with a host of other popular enterprise computing technologies of late, and blockchain – the innovative system of distributed trust most famous for underpinning cryptocurrencies – is no exception. Yet while the two phenomena can be complementary in certain circumstances, those expecting an explosion of blockchain-enabled IoT technologies probably shouldn’t hold their breath.

Blockchain technology can be counter-intuitive to understand at a basic level, but it’s probably best thought of as a sort of distributed ledger keeping track of various transactions. Every “block” on the chain contains transactional records or other data to be secured against tampering, and is linked to the previous one by a cryptographic hash, which means that any tampering with the block will invalidate that connection. The nodes – which can be largely anything with a CPU in it – communicate via a decentralized, peer-to-peer network to share data and ensure the validity of the data in the chain.

**[ Also see[What is edge computing?][2] and [How edge networking and IoT will reshape data centers][3].]**

The system works because all the blocks have to agree with each other on the specifics of the data that they’re safeguarding, according to Nir Kshetri, a professor of management at the University of North Carolina – Greensboro. If someone attempts to alter a previous transaction on a given node, the rest of the data on the network pushes back. “The old record of the data is still there,” said Kshetri.

That’s a powerful security technique – absent a bad actor successfully controlling all of the nodes on a given blockchain (the [famous “51% attack][4]”), the data protected by that blockchain can’t be falsified or otherwise fiddled with. So it should be no surprise that the use of blockchain is an attractive option to companies in some corners of the IoT world.

Part of the reason for that, over and above the bare fact of blockchain’s ability to securely distribute trusted information across a network, is its place in the technology stack, according to Jay Fallah, CTO and co-founder of NXMLabs, an IoT security startup.

“Blockchain stands at a very interesting intersection. Computing has accelerated in the last 15 years [in terms of] storage, CPU, etc, but networking hasn’t changed that much until recently,” he said. “[Blockchain]’s not a network technology, it’s not a data technology, it’s both.”

### Blockchain and IoT**

**

Where blockchain makes sense as a part of the IoT world depends on who you speak to and what they are selling, but the closest thing to a general summation may have come from Allison Clift-Jenning, CEO of enterprise blockchain vendor Filament.

“Anywhere where you've got people who are kind of wanting to trust each other, and have very archaic ways of doing it, that is usually a good place to start with use cases,” she said.

One example, culled directly from Filament’s own customer base, is used car sales. Filament’s working with “a major Detroit automaker” to create a trusted-vehicle history platform, based on a device that plugs into the diagnostic port of a used car, pulls information from there, and writes that data to a blockchain. Just like that, there’s an immutable record of a used car’s history, including whether its airbags have ever been deployed, whether it’s been flooded, and so on. No unscrupulous used car lot or duplicitous former owner could change the data, and even unplugging the device would mean that there’s a suspicious blank period in the records.

Most of present-day blockchain IoT implementation is about trust and the validation of data, according to Elvira Wallis, senior vice president and global head of IoT at SAP.

“Most of the use cases that we have come across are in the realm of tracking and tracing items,” she said, giving the example of a farm-to-fork tracking system for high-end foodstuffs, using blockchain nodes mounted on crates and trucks, allowing for the creation of an un-fudgeable record of an item’s passage through transport infrastructure. (e.g., how long has this steak been refrigerated at such-and-such a temperature, how far has it traveled today, and so on.)

### **Is using blockchain with IoT a good idea?**

Different vendors sell different blockchain-based products for different use cases, which use different implementations of blockchain technology, some of which don’t bear much resemblance to the classic, linear, mined-transaction blockchain used in cryptocurrency.

That means it’s a capability that you’d buy from a vendor for a specific use case, at this point. Few client organizations have the in-house expertise to implement a blockchain security system, according to 451 Research senior analyst Csilla Zsigri.

The idea with any intelligent application of blockchain technology is to play to its strengths, she said, creating a trusted platform for critical information.

“That’s where I see it really adding value, just in adding a layer of trust and validation,” said Zsigri.

Yet while the basic idea of blockchain-enabled IoT applications is fairly well understood, it’s not applicable to every IoT use case, experts agree. Applying blockchain to non-transactional systems – although there are exceptions, including NXM Labs’ blockchain-based configuration product for IoT devices – isn’t usually the right move.

If there isn’t a need to share data between two different parties – as opposed to simply moving data from sensor to back-end – blockchain doesn’t generally make sense, since it doesn’t really do anything for the key value-add present in most IoT implementations today: data analysis.

“We’re still in kind of the early dial-up era of blockchain today,” said Clift-Jennings. “It’s slower than a typical database, it often isn't even readable, it often doesn't have a query engine tied to it. You don't really get privacy, by nature of it.”

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3386881/why-blockchain-might-be-coming-to-an-iot-implementation-near-you.html#tk.rss_all

作者：[Jon Gold][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Jon-Gold/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/02/chains_binary_data_blockchain_security_by_mf3d_gettyimages-941175690_2400x1600-100788434-large.jpg
[2]: https://www.networkworld.com/article/3224893/internet-of-things/what-is-edge-computing-and-how-it-s-changing-the-network.html
[3]: https://www.networkworld.com/article/3291790/data-center/how-edge-networking-and-iot-will-reshape-data-centers.html
[4]: https://bitcoinist.com/51-percent-attack-hackers-steals-18-million-bitcoin-gold-btg-tokens/
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
