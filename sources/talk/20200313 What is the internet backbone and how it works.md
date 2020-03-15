[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What is the internet backbone and how it works)
[#]: via: (https://www.networkworld.com/article/3532318/what-is-the-internet-backbone-and-how-it-works.html)
[#]: author: (Tim Greene https://www.networkworld.com/author/Tim-Greene/)

What is the internet backbone and how it works
======
Tier 1 internet service providers (ISP) mesh their high-speed fiber-optic networks together to create the internet backbone, which moves traffic efficiently among geographic regions.
[Gerd Altmann][1] [(CC0)][2]

The internet generates massive amounts of computer-to-computer traffic, and insuring all that traffic can be delivered anywhere in the world requires the aggregation of a vast array of high-speed networks collectively known as the internet backbone, but how does that work?

### What is the internet backbone?

Like any other network, the internet consists of access links that move traffic to high-bandwidth routers that move traffic from its source over the best available path toward its destination. This core is made up of individual high-speed fiber-optic networks that peer with each other to create the internet backbone.

The individual core networks are privately owned by Tier 1 internet service providers (ISP), giant carriers whose networks are tied together. These providers include AT&amp;T, CenturyLink, Cogent Communications, Deutsche Telekom, Global Telecom and Technology (GTT), NTT Communications, Sprint, Tata Communications, Telecom Italia Sparkle, Telia Carrier, and Verizon.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][3]

By joining these long-haul networks together, Tier 1 ISPs create a single worldwide network that gives all of them access to the entire internet routing table so they can efficiently deliver traffic to its destination through a hierarchy of progressively more local ISPs.

In addition to being physically connected, these backbone providers are held together by a shared network protocol, TCP/IP. They are actually two protocols, transport control protocol and internet protocol that set up connections between computers, insuring that the connections are reliable and formating messages into packets.

### Internet exchange points (IXP) tie the backbone together

Backbone ISPs connect their networks at peering points, neutrally owned locations with high-speed switches and routers that move traffic among the peers. These are often owned by third parties, sometimes non-profits, that facilitate unifying the backbone.

Participating Tier 1 ISPs help fund the IXPs, but don’t charge each other for transporting traffic from the other Tier 1 ISPs in a relationship known as settlement-free peering. Such agreements eliminate potential financial disputes that might have the result of slowing down internet performance.

[][4]

### How fast is the backbone?

The internet backbone is made up of the fastest routers, which can deliver 100Gbps trunk speeds. These routers are made by vendors including Cisco, Extreme, Huawei, Juniper, and Nokia, and use the border gateway protocol (BGP) to route traffic among themselves.

### How traffic gets on the backbone

Below the Tier 1 ISPs are smaller Tier 2 and Tier 3 ISPs.

Tier 3 providers provide businesses and consumers with access to the internet. These providers have no access of their own to the internet backbone, so on their own would not be able to connect their customers to all of the billions of internet-attached computers.

Buying access to Tier 1 providers is expensive. So often Tier 3 ISPs contract with Tier 2 (regional) ISPs that have their own networks that can deliver traffic to a limited geographic area but not to all internet-attached devices.

In order to do that, Tier 2 ISPs contract with Tier 1 ISPs for access to the global backbone, and in that way make the entire internet accesssible to their customers.

This arrangment makes it possible for traffic from a computer on one side of the world to connect to one on the other side. That traffic goes from a source computer to a Tier 3 ISP that routes it to a Tier 2 ISP that routes it to a Tier 1 backbone provider that routes it to the appropriate Tier 2 ISP that routes it to a Tier 3 access provider that delivers it to the destination computer.

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3532318/what-is-the-internet-backbone-and-how-it-works.html

作者：[Tim Greene][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Tim-Greene/
[b]: https://github.com/lujun9972
[1]: https://pixabay.com/en/social-media-digitization-faces-3271592/
[2]: https://creativecommons.org/publicdomain/zero/1.0/
[3]: https://www.networkworld.com/newsletters/signup.html
[4]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
