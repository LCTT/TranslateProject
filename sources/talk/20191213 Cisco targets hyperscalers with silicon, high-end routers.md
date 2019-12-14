[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco targets hyperscalers with silicon, high-end routers)
[#]: via: (https://www.networkworld.com/article/3489937/cisco-targets-hyperscalers-with-silicon-high-end-routers.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco targets hyperscalers with silicon, high-end routers
======
Cisco rolls out its Silicon One plan, 8000 Series carrier-class routers and aims at selling chips to whitebox or hyperscale developers
Thinkstock

Cisco says it wants to change the future of the Internet and has rolled out the new silicon, hardware and software it says [will move toward that goal][1].

The centerpiece of Cisco’s strategy revolves around its custom Silicon One chip technology and new Cisco 8000 Series carrier-class routers built on that silicon, which the company says has been in development for more than five years, at a cost of over $1 billion. The 8000s feature a new operating system – IOS XR7 that runs the boxes and handles security*.*

[Network pros react to new Cisco certification curriculum][2]

The Cisco Silicon One Q100 optical-routing silicon brings up to 10Tbps of network bandwidth in its first iteration – with a future goal of 25Tbps – and support for large non-blocking distributed routers, deep buffering with rich QoS and programmable forwarding. 

[][3]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][3]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

Since it is programmable, Cisco Silicon One Q100 can be customized for any number of applications from a single chipset – eliminating the need to deploy multiple, specific silicon chipsets for standalone processors, line card processors, and fabric elements. This is accomplished with a common and unified P4 programmable-forwarding code and SDK, the company said.

“Moore’s law is stalling," wrote Jonathan  Davidson senior vice president and general manager of  Cisco Service Provider Networking in a [blog][4] about Silicon One. "While the rest of the industry slows down from the physics of traditional approaches, we have unlocked new dimensions of innovation. By rethinking silicon design entirely, we can deliver industry-leading performance today and create a ‘fast lane’ to the future.

“In the past, multiple types of silicon have been used across a network and even within a single device. Feature development was inconsistent. Telemetry varied dramatically. Operators had to spend too much time and effort coordinating and testing parity of new features across the network. Now, a single silicon architecture can serve different market segments, different functions, and various form factors for a unified experience that dramatically reduces costs of operations and time-to-value for new services.”

Another component of Silicon One is that it will be available for [white-box][5] vendors or hyperscalers developing their own networking systems – one of the few times Cisco has been a merchant silicon vendor in its own right. Its chip technology is typically used just in its own equipment.

The move puts it in direct competition with Broadcom, Intel and others that make advanced silicon. It also could impact other competitors such as Juniper and Arista that have product roadmaps toward [400G technology and targeted hyperscale customers][6].

“What Cisco is working on is a model of more affordable or practical IP/optical transport that can be more IP than optics," wrote Tom Nolle in a [blog analyzing][7] the Cisco announcement. "The early target, I think, is the convergence of multiple IP services for business, telephony and video, residential and Internet, all onto a common infrastructure.  The later target is to ensure that infrastructure is mostly routers, mostly Cisco.

"I’m always critical of Cisco’s way of announcing things because I think it’s short on substance and long on razzle-dazzle, but fundamentally, the network needs to be simplified, and Cisco’s approach may not (won’t, in my view) 'revolutionize' the Internet, but it will improve IP-network economics when operators need improvement desperately.”

Also at the Silicon One announcement in San Francisco, Cisco showed off what the potential ecosystems for the technology might look like with AT&amp;T, Century Link, Comcast, Facebook, Microsoft and The Walt Disney Studios all lining up to tout the technology.  Saudi Telecom Company (STC) is already deploying the new technology, and technology trials with Comcast and NTT Communications are ongoing, the company said.

“With regard to our decision to offer this silicon technology as a merchant silicon option just broadens the ecosystem and gives more choice to the folks that consume these types of systems in volume,” said  Michael Beesley, CTO of Service Provider Networking at Cisco. “We are happy to provide out system to whitebox system makers or our new software on top of third-party systems or whit box systems that are built with our silicon or built with someone else’s silicon. We are comfortable embracing all of that.”

As for the hardware, the new [8000 series][8] is made up of five models all targeted at driving down operational costs for service providers and web-scale companies, Cisco said. The equipment is optimized for 400Gbps per port and beyond, starting at 10.8Tbps in a single rack unit. It has been designed to deliver terabit-level throughout “in even the most power- and space-constrained network locations,” the company said. The 8000s feature ultra-low power consumption (11 Watts/Gb), Cisco added.

The 8000 series features support for the Software for Open Networking in the Cloud (SONiC), open-source software Microsoft released in 2016 for operating and managing thousands of network devices, along with the Switch Abstraction Interface (SAI), a standardized programming interface for ASICs.

“Thanks to this abstraction layer, networking vendors can provide a consistent programming interface to their ASICs while developing highly differentiated hardware platforms," wrote Kevin Wollenweber, vice president, product management in Cisco’s Service Provider Network Systems business in a [blog][9]. "In return, hyperscalers can quickly benefit from innovations in silicon, port density, and speed."  Cisco also supports SONiC on Nexus its 9200/9300 platforms, Wollenweber noted.

Optics are at the heart of the Silicon One plan. Cisco has grabbed up a number of companies in the past few years – [Luxtera][10], Lightwire and, one deal that’s still open, Acacia – to help bring about this transformation. Luxtera for example, develops silicon-photonics technology, a way of converting electronic information into photons and carrying it over fiber-optic cables directly into semiconductors, greatly speeding the transfer of data. Currently, other equipment is usually needed to turn light from fiber optic cables into the electronic signals needed to run on computers. Luxtera said it can make a high-volume of chips to do that job, something that’s eluded other companies in the industry for years.   

The pending $3.7 billion deal for [Acacia][11], which Cisco has been a customer of for about five years, will also be key.  The company develops, manufactures and sells high-speed [coherent optical][12] interconnect products designed to transform networks linking data centers, cloud and service providers.

As router and switch port speeds have increased, the cost per bit has steadily decreased thanks to advances in silicon for ASICs. “However, while the cost-per-bit for pluggable optics has also decreased, it has not come down quite as fast as the router/switch port cost,” wrote Bill Gartner is Senior Vice President/GM of Cisco's Optical Systems and Optics Group in a [blog][13] about the announcement. “The result is that as the bit rate increases, pluggable optics represent a larger fraction of the total hardware cost. For example, at 10G, optics represented about 10% of the total hardware cost of a data center network. As we progress to 400G and beyond, that equation flips, and optics will represent more than half of the total hardware cost.”

Functions that were traditionally delivered in separate chassis-based transponder solutions will now be available in a pluggable form factor, Gartner said. “This has potentially significant benefits for network operators in terms of operational simplicity. The key tipping point for this transition is that the pluggable coherent optics impose no density penalty for the router/switches. Over time, with continued improvements in silicon and optics, we have no reason to believe this won’t extend to cover a wider range of applications.”

[[Get regularly scheduled insights by signing up for Network World newsletters.]][14]

Join the Network World communities on [Facebook][15] and [LinkedIn][16] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3489937/cisco-targets-hyperscalers-with-silicon-high-end-routers.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3487831/what-s-hot-for-cisco-in-2020.html
[2]: https://www.networkworld.com/article/3446044/network-pros-react-to-new-cisco-certification-curriculum.html
[3]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[4]: https://blogs.cisco.com/news/future-of-the-internet-its-here?dtid=esotwt000260&CAMPAIGN=Corporate+Communications&Country_Site=GL&POSITION=Social%2BMedia&REFERRING_SITE=Twitter&CREATIVE=Cisco%2B%2BGC+-+Networking%2BGC+-+Bridge+to+Possible
[5]: https://www.networkworld.com/article/3311839/is-there-a-white-box-server-in-your-data-center-s-future.html
[6]: https://www.networkworld.com/article/3316402/arista-joins-juniper-cisco-in-400g-ethernet-race.html
[7]: https://blog.cimicorp.com/?p=3956
[8]: https://www.cisco.com/c/en/us/products/collateral/routers/8000-series-routers/datasheet-c78-742571.html
[9]: https://blogs.cisco.com/author/kevinwollenweber
[10]: https://www.networkworld.com/article/3328785/cisco-bets-660m-on-silicon-photonics-firm-luxtera.html
[11]: https://www.networkworld.com/article/3407706/cisco-goes-deeper-into-photonic-optical-technology-with-2-6b-acacia-buy.html
[12]: https://www.ciena.com/insights/what-is/What-Is-Coherent-Optics.html
[13]: https://blogs.cisco.com/sp/optics-fundamental-to-build-the-internet-for-the-future
[14]: https://www.networkworld.com/newsletters/signup.html
[15]: https://www.facebook.com/NetworkWorld/
[16]: https://www.linkedin.com/company/network-world
