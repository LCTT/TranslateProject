[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Public internet should be all software-defined)
[#]: via: (https://www.networkworld.com/article/3409783/public-internet-should-be-all-software-defined.html)
[#]: author: (Patrick Nelson https://www.networkworld.com/author/Patrick-Nelson/)

Public internet should be all software-defined
======
Having a programmable public internet will correct inefficiencies in the current system, engineers at NOIA say.
![Thinkstock][1]

The public internet should migrate to a programmable backbone-as-a-service architecture, says a team of network engineers behind NOIA, a startup promising to revolutionize global traffic. They say the internet will be more efficient if internet protocols and routing technologies are re-worked and then combined with a traffic-trading blockchain.

It’s “impossible to use internet for modern applications,” the company says on its website. “Almost all global internet companies struggle to ensure uptime and reliable user experience.”

That’s because modern techniques aren’t being introduced fully, NOIA says. The engineers say algorithms should be implemented to route traffic and that segment routing technology should be adopted. Plus, blockchain should be instigated to trade internet transit capacity. A “programmable internet solves the web’s inefficiencies,” a representative from NOIA told me.

**[ Read also: [What is IPv6, and why aren’t we there yet?][2] ]**

### Deprecate the public internet

NOIA has started introducing a caching, distributed content delivery application to improve website loading times, but it wants to ultimately deprecate the existing internet completely.

The company currently has 353 active cache nodes around the world, with a total 27 terabytes of storage for that caching system—NOIA clients contribute spare bandwidth and storage. It’s also testing a network backbone using four providers with European and American locations that it says will be the [development environment for its envisaged software-defined and radical internet replacement][3].

### The problem with today's internet

The “internet is a mesh of tangled up cables,” [NOIA says][4]. “Thousands of physically connected networks” are involved. Any configuration alterations in any of the jumble of networks causes issues with the protocols, it explains. The company is referring to Border Gateway Protocol (BGP), which lets routers discover paths to IP addresses through the disparate network. Because BGP only forwards to a neighboring router, it doesn’t manage the entire route. That introduces “severe variability” or unreliability.

“It is impossible to guarantee service reliability without using overlay networks. Low-latency, performance-critical applications, and games cannot operate on public Internet,” the company says.

### How a software-defined internet works

NOIA's idea is to use [IPv6][5], the latest internet protocol. IPv6 features an expanded packet size and allows custom headers. The company then adds segment routing to create Segment Routing over IPv6 (SRv6). That SRv6 combo adds routing information to each data packet sent—a packet-level programmable network, in other words.

Segment routing, roughly, is an updated internet protocol that lets routers comprehend routing information in packet headers and then perform the routing. Cisco has been using it, too.

NOIA’s network then adds the SRv6 amalgamation to distributed ledger technology (blockchain) in order to let ISPs and data centers buy and sell the routes—buyers can choose their routes in the exchange, too.

In addition to trade, blockchain introduces security. It's worth noting that routings aren’t the only internet technologies that could be disrupted due to blockchain. In April I wrote about [organizations that propose moving data storage transactions over to distributed ledgers][6]. They say that will be more secure than anything seen before. [Ethernet’s lack of inherent security could be corrected by smart contract, trackable verifiable transactions][7], say some. And, of course, supply chain, the automotive vertical, and the selling of sensor data overall may emerge as [use-contenders for secure, blockchain in the internet of things][8].

In NOIA’s case, with SRv6 blended with distributed ledgers, the encrypted ledger holds the IP addresses, but it is architecturally decentralized—no one controls it. That’s one element of added security, along with the aforementioned trading, provided by the ledger.

That trading could handle the question of who’s paying for all this. However, NOIA says current internet hardware will be able to understand the segment routings, so no new equipment investments are needed.

Join the Network World communities on [Facebook][9] and [LinkedIn][10] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3409783/public-internet-should-be-all-software-defined.html

作者：[Patrick Nelson][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Patrick-Nelson/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/05/dns_browser_http_web_internet_thinkstock-100758191-large.jpg
[2]: https://www.networkworld.com/article/3254575/lan-wan/what-is-ipv6-and-why-aren-t-we-there-yet.html
[3]: https://medium.com/noia/development-update-06-20-07-04-2879f9fce3cb
[4]: https://noia.network/
[5]: https://www.networkworld.com/article/3254575/what-is-ipv6-and-why-aren-t-we-there-yet.html
[6]: https://www.networkworld.com/article/3390722/how-data-storage-will-shift-to-blockchain.html
[7]: https://www.networkworld.com/article/3356496/how-blockchain-will-manage-networks.html
[8]: https://www.networkworld.com/article/3330937/how-blockchain-will-transform-the-iot.html
[9]: https://www.facebook.com/NetworkWorld/
[10]: https://www.linkedin.com/company/network-world
