[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What is IPv6, and why aren’t we there yet?)
[#]: via: (https://www.networkworld.com/article/3254575/what-is-ipv6-and-why-aren-t-we-there-yet.html)
[#]: author: (Keith Shaw and Josh Fruhlinger )

What is IPv6, and why aren’t we there yet?
======
IPv6 has been in the works since 1998 to address the shortfall of IP addresses available under Ipv4, yet despite its efficiency and security advantages, adoption is still slow.
Thinkstock

For the most part the dire warnings about running out of internet addresses have ceased because, slowly but surely, migration from the world of Internet Protocol Version 4 (IPv4) to IPv6 has begun, and software is in place to prevent the address apocalypse that many were predicting.

But before we see where are and where we’re going with IPv6, let’s go back to the early days of internet addressing.

**[ Related: [IPv6 deployment guide][1] + [How to plan your migration to IPv6][2] ]**

### What is IPv6 and why is it important?

IPv6 is the latest version of the Internet Protocol, which identifies devices across the internet so they can be located. Every device that uses the internet is identified through its own IP address in order for internet communication to work. In that respect, it’s just like the street addresses and zip codes you need to know in order to mail a letter.

The previous version, IPv4, uses a 32-bit addressing scheme to support 4.3 billion devices, which was thought to be enough. However, the growth of the internet, personal computers, smartphones and now Internet of Things devices proves that the world needed more addresses.

Fortunately, the Internet Engineering Task Force (IETF) recognized this 20 years ago. In 1998 it created IPv6, which instead uses 128-bit addressing to support approximately 340 trillion trillion (or 2 to the 128th power, if you like). Instead of the IPv4 address method of four sets of one- to three-digit numbers, IPv6 uses eight groups of four hexadecimal digits, separated by colons.

### What are the benefits of IPv6?

In its work, the IETF included enhancements to IPv6 compared with IPv4. The IPv6 protocol can handle packets more efficiently, improve performance and increase security. It enables internet service providers to reduce the size of their routing tables by making them more hierarchical.

### Network address translation (NAT) and IPv6

Adoption of IPv6 has been delayed in part due to network address translation (NAT), which takes private IP addresses and turns them into public IP addresses. That way a corporate machine with a private IP address can send to and receive packets from machines located outside the private network that have public IP addresses.

Without NAT, large corporations with thousands or tens of thousands of computers would devour enormous quantities of public IPv4 addresses if they wanted to communicate with the outside world. But those IPv4 addresses are limited and nearing exhaustion to the point of having to be rationed.

NAT helps alleviate the problem. With NAT, thousands of privately addressed computers can be presented to the public internet by a NAT machine such as a firewall or router.

The way NAT works is when a corporate computer with a private IP address sends a packet to a public IP address outside the corporate network, it first goes to the NAT device. The NAT notes the packet’s source and destination addresses in a translation table.

The NAT changes the source address of the packet to the public-facing address of the NAT device and sends it along to the external destination. When a packet replies, the NAT translates the destination address to the private IP address of the computer that initiated the communication. This can be done so that a single public IP address can represent multiple privately addressed computers.

### Who is deploying IPv6?

Carrier networks and ISPs have been the first group to start deploying IPv6 on their networks, with mobile networks leading the charge. For example, T-Mobile USA has more than 90% of its traffic going over IPv6, with Verizon Wireless close behind at 82.25%. Comcast and AT&amp;T have its networks at 63% and 65%, respectively, according to the industry group [World Ipv6 Launch][3].

Major websites are following suit - just under 30% of the Alexa Top 1000 websites are currently reachable over IPv6, World IPv6 Launch says.

Enterprises are trailing in deployment, with slightly under one-fourth of enterprises advertising IPv6 prefixes, according to the Internet Society’s [“State of IPv6 Deployment 2017” report][4]. Complexity, costs and time needed to complete are all reasons given. In addition, some projects have been delayed due to software compatibility. For example, a [January 2017 report][5] said a bug in Windows 10 was “undermining Microsoft’s efforts to roll out an IPv6-only network at its Seattle headquarters.”

### When will more deployments occur?

The Internet Society said the price of IPv4 addresses will peak in 2018, and then prices will drop after IPv6 deployment passes the 50% mark. Currently, [according to Google][6], the world has 20% to 22% IPv6 adoption, but in the U.S. it’s about 32%).

As the price of IPv4 addresses begin to drop, the Internet Society suggests that enterprises sell off their existing IPv4 addresses to help fund IPv6 deployment. The Massachusetts Institute of Technology has done this, according to [a note posted on GitHub][7]. The university concluded that 8 million of its IPv4 addresses were “excess” and could be sold without impacting current or future needs since it also holds 20 nonillion IPv6 addresses. (A nonillion is the numeral one followed by 30 zeroes.)

In addition, as more deployments occur, more companies will start charging for the use of IPv4 addresses, while providing IPv6 services for free. [UK-based ISP Mythic Beasts][8] says “IPv6 connectivity comes as standard,” while “IPv4 connectivity is an optional extra.”

### When will IPv4 be “shut off”?

Most of the world [“ran out” of new IPv4 addresses][9] between 2011 and 2018 – but we won’t completely be out of them as IPv4 addresses get sold and re-used (as mentioned earlier), and any leftover addresses will be used for IPv6 transitions.

There’s no official switch-off date, so people shouldn’t be worried that their internet access will suddenly go away one day. As more networks transition, more content sites support IPv6 and more end users upgrade their equipment for IPv6 capabilities, the world will slowly move away from IPv4.

### Why is there no IPv5?

There was an IPv5 that was also known as Internet Stream Protocol, abbreviated simply as ST. It was designed for connection-oriented communications across IP networks with the intent of supporting voice and video.

It was successful at that task, and was used experimentally. One shortcoming that undermined  its popular use was its 32-bit address scheme – the same scheme used by IPv4. As a result, it had the same problem that IPv4 had – a limited number of possible IP addresses. That led to the development and eventual adoption of IPv6. Even though IPv5 was never adopted publicly, it had used up the name IPv5.

Join the Network World communities on [Facebook][10] and [LinkedIn][11] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3254575/what-is-ipv6-and-why-aren-t-we-there-yet.html

作者：[Keith Shaw and Josh Fruhlinger][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: 
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3235805/lan-wan/ipv6-deployment-guide.html#tk.nww-fsb
[2]: https://www.networkworld.com/article/3214388/lan-wan/how-to-plan-your-migration-to-ipv6.html#tk.nww-fsb
[3]: http://www.worldipv6launch.org/measurements/
[4]: https://www.internetsociety.org/resources/doc/2017/state-of-ipv6-deployment-2017/
[5]: https://www.theregister.co.uk/2017/01/19/windows_10_bug_undercuts_ipv6_rollout/https://www.theregister.co.uk/2017/01/19/windows_10_bug_undercuts_ipv6_rollout/
[6]: https://www.google.com/intl/en/ipv6/statistics.html
[7]: https://gist.github.com/simonster/e22e50cd52b7dffcf5a4db2b8ea4cce0
[8]: https://www.mythic-beasts.com/sales/ipv6
[9]: https://ipv4.potaroo.net/
[10]: https://www.facebook.com/NetworkWorld/
[11]: https://www.linkedin.com/company/network-world
