[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (MPLS Migration: How a KISS Transformed the WANs of 4 IT Managers)
[#]: via: (https://www.networkworld.com/article/3447383/mpls-migration-how-a-kiss-transformed-the-wans-of-4-it-managers.html)
[#]: author: (Cato Networks https://www.networkworld.com/author/Matt-Conran/)

MPLS Migration: How a KISS Transformed the WANs of 4 IT Managers
======
WAN transformation is challenging; learning from the experiences of others can help. Here are practical insights from four IT managers who migrated to SD-WAN.
flytosky11

Back in 1960, a Lockheed engineer named Kelly Johnson coined the acronym KISS for “keep it simple stupid.” His wise—and simple—advice was that systems tend to work better when they’re simple than when they’re complex. KISS became an essential U.S. Navy design principle and captures the crux of any WAN transformation initiative.

So many of the challenges of today’s WANs stem from the sheer number of components involved. Each location may require one or more routers, firewalls, WAN optimizers, VPN concentrators, and other devices just to connect safely and effectively with other locations or the cloud. The result: multiple points of failure and a potential uptime and troubleshooting nightmare. Simply understanding the state of the WAN can be difficult with information spread across so many devices and components. Managing all the updates required to protect the network from new and evolving threats can be overwhelming.

Simplifying the enterprise backbone addresses those challenges. According to four IT managers, the key is to create a single global enterprise backbone that connects all users–mobile or fixed–and all locations–cloud or physical. The backbone’s software should include a complete security stack and WAN optimization to protect and enhance the performance of all “edges” everywhere. Such an approach avoids the complexity that comes with all the appliances and other solutions forming today enterprise networks.

The four IT managers did not use every aspect of this approach. Some focused on the global performance benefits and cost savings, others on security. But they all gained from the agility and visibility that result. Here are their stories.

**Pharmaceutical Firm Improves China Connectivity, Reduced Costs by Eliminating MPLS**

For [Centrient Pharmaceuticals][1], [SD-WAN][2] looked at first as if it might be just as complex as the company’s tangled Web of global MPLS and Internet VPNs. A global leader in sustainable antibiotics, next-generation statins, and antifungals, Centrient had relied on MPLS to connect its Netherlands data center with nine manufacturing and office locations across China, India, Netherlands, Spain, and Mexico. SAP, VoIP, and other Internet applications had to be backhauled through the data center. Local Internet breakouts secured by firewall hardware provided access to the public Internet, Office 365, and some other SaaS applications. Five smaller global locations had to connect via VPN to India or the Netherlands office.

Over time, MPLS became congested and performance suffered. “It took a long time for users to open documents,” said Mattheiu Cijsouw, Global IT Manager.

Agility suffered as well, as it typically took three to four months to move a location. “One time we needed to move a sales office and the MPLS connection was simply not ready in time,” Cijsouw said.

Cijsouw looked toward SD-WAN to simplify connectivity and cut costs but found that the typical solution of SD-WAN appliances at every location secured by firewalls and Secure Web Gateway (SWGs) was also complex, expensive, and dependent on the fickleness of the Internet middle mile. For him, the simplicity of a global, distributed, SLA-backed network of PoPS interconnected by an enterprise backbone seemed appealing. All it required was a simple, zero-touch appliance at each location to connect to the local PoP.

Cijsouw went with simple. “We migrated in stages, gaining confidence along the way,” he said.

The 6 Mbits/s of MPLS was replaced by 20 Mbits/s per site, burstable to 40 Mbits/s, and 50 Mbits/s burstable to 100 Mbits/s at the data center, all at lower cost than MPLS.  Immediately applications became more responsive, China connectivity worked as well or better than with MPLS, and the cloud-based SD-WAN solution gave Cijsouw better visibility into the network.

**Paysafe Achieves Fast Application Access at Every Location**

Similarly, [Paysafe, a global provider of end-to-end payment solutions][3], had been connecting its 21 globally dispersed locations with a combination of MPLS and local Internet access at six locations and VPNs at the other 15. Depending on where staff members were, Internet connectivity could range from 25 Mbits/s to 500 Mbits/sec.

“We wanted the same access everywhere,” said Stuart Gall, then PaySafe’s Infrastructure Architect in its Network and Systems Groups. “If I’m in Calgary and go to any other office, the access must be the same—no need to RDP into a machine or VPN into the network.”

The lack of a fully meshed network also made Active Directory operation erratic, with users sometimes locked out of some accounts at one location but not another. Rolling out new locations took two to three months.

As with Centrient, a cloud-based SD-WAN solution using global PoPS and an enterprise backbone seemed a much simpler, less expensive, and more secure approach than the typical SD-WAN services offered by competing providers.

Paysafe has connected 11 sites to its enterprise backbone. “We found latency to be 45 percent less than with the public Internet,” said Gall. “New site deployment takes 30 minutes instead of weeks. Full meshing problems are no longer, as all locations instantly mesh once they connect.”

**Sanne Group Cleans Up WAN and Reduces Latency in the Process**

[Sanne Group, a global provider of alternative asset and corporate administrative services][4], had two data centers in Jersey and Guernsey UK connected by two 1Gbits/s fiber links, with seven locations connecting to the data centers via the public Internet. A Malta office connected via an IPsec VPN to Cape Town, which connected to Jersey via MPLS. A business continuity site in HIlgrove and two other UK locations connected to the data centers via dedicated fiber. Access for small office users consisted of a combination of Internet broadband, a small firewall appliance, and Citrix VDI.

Printing PDFs took forever, according to Nathan Trevor, Sanne Group’s IT Director, and the remote desktop architectures suffered from high latency and packet loss. Traffic from the Hong Kong office took 12 to 15 hops to get to the UK.

The company tried MPLS but found it too expensive. Deploying a site took up to 120 days. Trevor started looking at SD-WAN, but it was also complex.

“Even with zero-touch provisioning configuration was complicated,” he said. “IT professionals new to SD-WAN would definitely need handholding.”

The simplicity of the cloud-based global enterprise backbone solution was obvious. “Just looking at an early screen share I could understand how to connect my sites,” said Trevor.

Sanne connected its locations big and small to the enterprise backbone, eliminating the mess of Internet and MPLS connections. Performance improved immediately, with latency down by 20 percent. All users have to do to connect is log into their computers, and the solution has saved Sanne “an absolute fortune,” according to Trevor.

**Humphrey’s Eliminates MPLS and Embraces Freedom Easily**

As for [Humphrey’s and Partners, an architectural services firm][5], eight regional offices connected to its Dallas headquarters via a hybrid WAN and a ninth connected over the Internet. Three offices ran SD-WAN appliances connected to MPLS and the Internet. Another three connected via MPLS only. Two connected with SD-WAN and the Internet, and an office in Vietnam had to rely on file sharing and transfer to move data across the Internet to Dallas.

With MPLS, Humphrey’s needed three months to deploy at a new site. Even simple network changes took 24 hours, frequently requiring off-hours work. “Often the process involved waking me up in the middle of the night,” said IT Director Paul Burns.

Burns had tried deploying SD-WAN appliances in some locations, but “the configuration pages of the SD-WAN appliance were insane,” said Burns, and it was sometimes difficult to get WAN connections working properly. “Sometimes Dallas could connect to two sites, but they couldn’t connect to each other,” he said.

Burns deployed a global enterprise backbone solution at most locations, including Vietnam. Getting sites up and running took minutes or hours. “We dropped shipped devices to New Orleans, and I flew out to install the stuff. Took less than a day and the performance was great,” said Burns. “We set up Uruguay in less than 10 minutes. [The solution] gave us freedom.”

MPLS and VPNs can be very complex, but so can an SD-WAN replacement if it’s not architected carefully. For many organizations, a simpler approach is to connect and secure all users and locations with a global private backbone and software providing WAN optimization and a complete security stack. Such an approach fulfills the goals of KISS: performance, agility, and low cost.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3447383/mpls-migration-how-a-kiss-transformed-the-wans-of-4-it-managers.html

作者：[Cato Networks][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Matt-Conran/
[b]: https://github.com/lujun9972
[1]: https://www.catonetworks.com/customers/pharmaceutical-leader-replaces-mpls-with-cato-cloud-cutting-costs-while-quadrupling-capacity?utm_source=idg
[2]: https://www.catonetworks.com/sd-wan?utm_source=idg
[3]: https://www.catonetworks.com/customers/paysafe-replaces-global-mpls-network-and-internet-vpn-with-cato-cloud?utm_source=idg
[4]: https://www.catonetworks.com/customers/sanne-group-replaces-internet-and-mpls-simplifying-citrix-access-and-improving-performance-with-cato-cloud?utm_source=idg
[5]: https://www.catonetworks.com/customers/humphreys-replaces-mpls-sd-wan-appliances-and-mobile-vpn-with-cato-cloud?utm_source=idg
