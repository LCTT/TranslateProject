What’s wrong with IPv4 and Why we are moving to IPv6
================================================================================
For the past 10 years or so, this has been the year that IPv6 will become wide spread. It hasn’t happened yet. Consequently, there is little widespread knowledge of what IPv6 is, how to use it, or why it is inevitable.

![IPv4 and IPv6 Comparison](http://www.tecmint.com/wp-content/uploads/2014/09/ipv4-ipv6.gif)

IPv4 and IPv6 Comparison

### What’s wrong with IPv4? ###

We’ve been using **IPv4** ever since RFC 791 was published in 1981. At the time, computers were big, expensive, and rare. IPv4 had provision for **4 billion IP** addresses, which seemed like an enormous number compared to the number of computers. Unfortunately, IP addresses are not use consequently. There are gaps in the addressing. For example, a company might have an address space of **254 (2^8-2)** addresses, and only use 25 of them. The remaining 229 are reserved for future expansion. Those addresses cannot be used by anybody else, because of the way networks route traffic. Consequently, what seemed like a large number in 1981 is actually a small number in 2014.

The Internet Engineering Task Force (**IETF**) recognized this problem in the early 1990s and came up with two solutions: Classless Internet Domain Router (**CIDR**) and private IP addresses. Prior to the invention of CIDR, you could get one of three network sizes: **24 bits** (16,777,214 addresses), **20 bits** (1,048,574 addresses) and **16 bits** (65,534 addresses). Once CIDR was invented, it was possible to split networks into subnetworks.

So, for example, if you needed **5 IP** addresses, your ISP would give you a network with a size of 3 bits which would give you **6 IP** addresses. So that would allow your ISP to use addresses more efficiently. Private IP addresses allow you to create a network where each machine on the network can easily connect to another machine on the internet, but where it is very difficult for a machine on the internet to connect back to your machine. Your network is private, hidden. Your network could be very large, 16,777,214 addresses, and you could subnet your private network into smaller networks, so that you could manage your own addresses easily.

You are probably using a private address right now. Check your own IP address: if it is in the range of **10.0.0.0 – 10.255.255.255** or **172.16.0.0 – 172.31.255.255** or **192.168.0.0 – 192.168.255.255**, then you are using a private IP address. These two solutions helped forestall disaster, but they were stopgap measures and now the time of reckoning is upon us.

Another problem with **IPv4** is that the IPv4 header was variable length. That was acceptable when routing was done by software. But now routers are built with hardware, and processing the variable length headers in hardware is hard. The large routers that allow packets to go all over the world are having problems coping with the load. Clearly, a new scheme was needed with fixed length headers.

Still another problem with **IPv4** is that, when the addresses were allocated, the internet was an American invention. IP addresses for the rest of the world are fragmented. A scheme was needed to allow addresses to be aggregated somewhat by geography so that the routing tables could be made smaller.

Yet another problem with IPv4, and this may sound surprising, is that it is hard to configure, and hard to change. This might not be apparent to you, because your router takes care of all of these details for you. But the problems for your ISP drives them nuts.

All of these problems went into the consideration of the next version of the Internet.

### About IPv6 and its Features ###

The **IETF** unveiled the next generation of IP in December 1995. The new version was called IPv6 because the number 5 had been allocated to something else by mistake. Some of the features of IPv6 included.

- 128 bit addresses (3.402823669×10³⁸ addresses)
- A scheme for logically aggregating addresses
- Fixed length headers
- A protocol for automatically configuring and reconfiguring your network.

Let’s look at these features one by one:

#### Addresses ####

The first thing everybody notices about **IPv6** is that the number of addresses is enormous. Why so many? The answer is that the designers were concerned about the inefficient organization of addresses, so there are so many available addresses that we could allocate inefficiently in order to achieve other goals. So, if you want to build your own IPv6 network, chances are that your ISP will give you a network of **64 bits** (1.844674407×10¹⁹ addresses) and let you subnet that space to your heart’s content.

#### Aggregation ####

With so many addresses to use, the address space can be allocated sparsely in order to route packets efficiently. So, your ISP gets a network space of **80 bits**. Of those 80 bits, 16 of them are for the ISPs subnetworks, and 64 bits are for the customer’s networks. So, the ISP can have 65,534 networks.

However, that address allocation isn’t cast in stone, and if the ISP wants more smaller networks, it can do that (although probably the ISP would probably simply ask for another space of 80 bits). The upper 48 bits is further divided, so that ISPs that are “**close**” to one another have similar network addresses ranges, to allow the networks to be aggregated in the routing tables.

#### Fixed length Headers ####

An **IPv4** header has a variable length. An **IPv6** header always has a fixed length of 40 bytes. In IPv4, extra options caused the header to increase in size. In IPv6, if additional information is needed, that additional information is stored in extension headers, which follow the IPv6 header and are generally not processed by the routers, but rather by the software at the destination.

One of the fields in the IPv6 header is the flow. A flow is a **20 bit** number which is created pseudo-randomly, and it makes it easier for the routers to route packets. If a packet has a flow, then the router can use that flow number as an index into a table, which is fast, rather than a table lookup, which is slow. This feature makes **IPv6** very easy to route.

#### Automatic Configuration ####

In **IPv6**, when a machine first starts up, it checks the local network to see if any other machine is using its address. If the address is unused, then the machine next looks for an IPv6 router on the local network. If it finds the router, then it asks the router for an IPv6 address to use. Now, the machine is set and ready to communicate on the internet – it has an IP address for itself and it has a default router.

If the router should go down, then the machines on the network will detect the problem and repeat the process of looking for an IPv6 router, to find the backup router. That’s actually hard to do in IPv4. Similarly, if the router wants to change the addressing scheme on its network, it can. The machines will query the router from time to time and change their addresses automatically. The router will support both the old and new addresses until all of the machines have switched over to the new configuration.

IPv6 automatic configuration is not a complete solution. There are some other things that a machine needs in order to use the internet effectively: the name servers, a time server, perhaps a file server. So there is **dhcp6** which does the same thing as dhcp, only because the machine boots in a routable state, one dhcp daemon can service a large number of networks.

#### There’s one big problem ####

So if IPv6 is so much better than IPv4, why hasn’t adoption been more widespread (as of **May 2014**, Google estimates that its IPv6 traffic is about **4%** of its total traffic)? The basic problem is which comes first, the **chicken or the egg**? Somebody running a server wants the server to be as widely available as possible, which means it must have an **IPv4** address.

It could also have an IPv6 address, but few people would use it and you do have to change your software a little to accommodate IPv6. Furthermore, a lot of home networking routers do not support IPv6. A lot of ISPs do not support IPv6. I asked my ISP about it, and I was told that they will provide it when customers ask for it. So I asked how many customers had asked for it. One, including me.

By way of contrast, all of the major operating systems, Windows, OS X, and Linux support IPv6 “**out of the box**” and have for years. The operating systems even have software that will allow IPv6 packets to “**tunnel**” within IPv4 to a point where the IPv6 packets can be removed from the surrounding IPv4 packet and sent on their way.

#### Conclusion ####

IPv4 has served us well for a long time. IPv4 has some limitations which are going to present insurmountable problems in the near future. IPv6 will solve those problems by changing the strategy for allocating addresses, making improvements to ease the routing of packets, and making it easier to configure a machine when it first joins the network.

However, acceptance and usage of IPv6 has been slow, because change is hard and expensive. The good news is that all operating systems support IPv6, so when you are ready to make the change, your computer will need little effort to convert to the new scheme.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/ipv4-and-ipv6-comparison/

作者：[Jeff Silverman][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/jeffsilverm/