[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (WAN Transformation: It’s More Than SD-WAN)
[#]: via: (https://www.networkworld.com/article/3430638/wan-transformation-it-s-more-than-sd-wan.html)
[#]: author: (Cato Networks https://www.networkworld.com/author/Matt-Conran/)

WAN Transformation: It’s More Than SD-WAN
======
Tomorrow’s networking challenges will extend beyond the capabilities of SD-WAN alone. Here’s why and how you can prepare your network.
![metamorworks][1]

As an IT leader, you’re expected to be the technology vanguard of your organization. It is you who must deflate technology hype and devise the technology plan to keep the organization competitive.

Addressing the WAN is, of course, essential to that plan. The high costs and limited agility of legacy MPLS-based networks are well known. What’s less clear is how to transform the enterprise network in a way that will remain agile and efficient for decades to come.

Many mistakenly assume [SD-WAN][2] to be that transformation. After all, SD-WAN brings agility, scalability, and cost efficiencies lacking in telco-managed MPLS services.  But while a critical step, SD-WAN alone is insufficient to address the networking challenges you’re likely to face today — and tomorrow. Here’s why.

### SD-WAN Cannot Fix the Unpredictability of the Global Internet

Enterprise networks are nothing but predictable. Yet to realize their benefits, SD-WANs must rely on the unpredictable public Internet, a crapshoot, meeting enterprise requirements one day, wildly amiss the next. There’s simply no way to anticipate [exceptional Internet events][3]. And with global Internet connections, you don’t even need to wait for unusual. At Cato, we routinely see [how latency across our private backbone can halve the latency of similar Internet routes][4], a fact confirmed by numerous third-party sources.

![][5]

SD-WAN Lacks Security, Yet Security is Required _Everywhere_Is it any wonder [SD-WAN vendors][6] partner with legacy telcos? But telcos too often come with a last-mile agenda, locking you into specific providers. Cost and support models are also designed for the legacy business, not the digital one.

It’s no secret that with Internet access you need the advanced security protection of a next-generation firewall, IPS, and the rest of today’s security stack. It's also no secret SD-WAN lacks advanced security. How, then, will you provide branch locations with [secure Direct Internet Access (DIA)?][7]

Deploying branch security appliances will complicate the network, running counter to your goal of creating a leaner, more agile infrastructure. Appliances, whether physical or virtual ([VNFs in an NFV architecture][8]), must be maintained. New software patches must be tested, staged, and deployed. As traffic loads grow or compute-intensive features are enabled, such as TLS inspection, the security appliance’s compute requirements increase, ultimately forcing unplanned hardware upgrades.  

Cloud security services can avoid those problems. But too often they only inspect Internet traffic, not site-to-site traffic, forcing IT to maintain and coordinate separate security policies, complicating troubleshooting and deployment.

### SD-WAN Does Not Extend Well to the Cloud, Mobile Users, or the Tools of Tomorrow

Then there’s the problem of the new tenants of the enterprise. SD-WAN is an MPLS replacement; it doesn’t extend naturally to the cloud, today’s destination for most enterprise traffic. And mobile users are completely beyond SD-WAN’s scope, requiring separate connectivity and security infrastructure that too often disrupts the mobile experience and fragments visibility, complicating troubleshooting and management.

Just over the horizon are IoT devices, not to mention the developments we can’t even foresee.  In many cases, installing appliances won’t be possible. How will your SD-WAN accommodate these developments without compromising on the operational agility and efficiencies demanded by the digital business?

### It’s Time to Evolve the Network Architecture

Continuing to solve network challenges in parts —MPLS service here, remote access VPN there, and a sprinkling of cloud access solutions, routers, firewalls, WAN optimizers, and sensors — only persists in complicating the enterprise network, ultimately restricting how much cost can be saved or operational efficiency gained. SD-WAN-only solutions are symptomatic of this segmented thinking, solving only a small part of the enterprise’s far bigger networking challenge.

What’s needed isn’t another point appliance or another network. What’s needed is **one network** that connects **and** secures **all** company resources worldwide without compromising on cost or performance. This is an architectural issue, one that can’t be solved by repackaging multiple appliances as a network service. Such approaches lead to inconsistent services, poor manageability, and high latency — a fact that Gartner notes in its recent [Hype Cycle for Enterprise Networking][9]. 

# Picture the Network of the Future

What might this architecture look like? At its basis, think of collapsing MPLS, VPN, and all other networks with **one** global, private, managed backbone available from anywhere to anywhere. Such as network would connect all edges — sites, cloud resources, and mobile devices — with far better performance than the Internet at far lower cost than MPLS services.

Such a vision is possible today, in fact, due to two trends — the massive investment in global IP capacity and advancements in high-performance, commercial off-the-shelf (COTS) hardware. 

#### Connect

The Points of Presence (PoPs) comprising such a backbone would interconnect using SLA-backed IP connections across multiple provider networks. By connecting PoPs across multiple networks, the backbone would offer better performance and resiliency than any one underlying network. It would, in effect, bring the power of SD-WAN to the backbone core.

The cloud-native software would execute all major networking and security functions normally running in edge appliances. WAN optimization, dynamic path selection, policy-based routing, and more would move to the cloud. The PoPs would also monitor the real-time conditions of the underlying networks, routing traffic, including cloud traffic, along the optimum path to the PoP closest to the destination. 

With most processing done by the PoP, connecting any type of “edge” — site, cloud resources, mobile devices, IoT devices, and more — would become simple. All that’s needed is a small client, primarily to establish an encrypted tunnel across an Internet connection to the nearest PoP.  By colocating PoP and cloud IXPs in the same physical data centers, cloud resources would implicitly become part of your new optimized, corporate network. All without deploying additional software or hardware.

#### Secure

To ensure security, all traffic would only reach an “edge” after security inspection that runs as part of the cloud-native software. Security services would include next-generation firewall, secure web gateway, and advanced threat protection. By running in the PoPs, security services benefit from scalability and elasticity of the cloud, which was never available as appliances.

With the provider running the security stack, IT would be freed from its security burden. Security services would always be current without the operational overhead of appliances or investing in specialized security skills. Inspecting all enterprise traffic by one platform means IT needs only one set of security policies to protect all users. Overall, security is made simpler, and mobile users and cloud resources no longer need to remain second-class citizens.

#### Run

Without deploying tons of specialized appliances, the network would be much easier to run and manage. A single pane of glass would give the IT manager end-to-end visibility across networking and security domains without the myriads of sensors, agents, normalization tools, and more needed today for that kind of capability.

### One Architecture Many Benefits

Such an approach addresses the gamut of networking challenges facing today’s enterprises. Connectivity costs would be slashed. Latency would rival those of global MPLS but with far better throughput thanks to built-in network optimization, which would be available inside — and outside — sites. Security would be pervasive, easy to maintain, and effective.

This architecture isn’t just a pipe dream. Hundreds of companies across the globe today realize these benefits every day by relying on such a platform from [Cato Networks][10]. It’s a secure, global, managed SD-WAN service powered by the scalability, self-service, and agility of the cloud.

### The Time is Now

WAN transformation is a rare opportunity for IT leaders to profoundly impact the business’ ability to do business better tomorrow and for decades to come. SD-WAN is a piece of that vision, but only a piece.  Addressing the entire network challenge (not just a part of it) to accommodate the needs you can anticipate — and the ones you can’t -- will go a long way towards measuring the effectiveness of your IT leadership.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3430638/wan-transformation-it-s-more-than-sd-wan.html

作者：[Cato Networks][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Matt-Conran/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/08/istock-1127447341-100807620-large.jpg
[2]: https://www.catonetworks.com/glossary-use-cases/sd-wan?utm_source=IDG&utm_campaign=IDG
[3]: https://arstechnica.com/information-technology/2019/07/facebook-cloudflare-microsoft-and-twitter-suffer-outages/
[4]: https://www.catonetworks.com/blog/the-internet-is-broken-heres-why?utm_source=IDG&utm_campaign=IDG
[5]: https://images.idgesg.net/images/article/2019/08/capture-100807619-large.jpg
[6]: https://www.topsdwanvendors.com?utm_source=IDG&utm_campaign=IDG
[7]: https://www.catonetworks.com/glossary-use-cases/secure-direct-internet-access?utm_source=IDG&utm_campaign=IDG
[8]: https://www.catonetworks.com/blog/the-pains-and-problems-of-nfv?utm_source=IDG&utm_campaign=IDG
[9]: https://www.gartner.com/en/documents/3947237/hype-cycle-for-enterprise-networking-2019
[10]: https://www.catonetworks.com?utm_source=IDG&utm_campaign=IDG
