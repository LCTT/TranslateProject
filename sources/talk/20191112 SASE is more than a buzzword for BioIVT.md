[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (SASE is more than a buzzword for BioIVT)
[#]: via: (https://www.networkworld.com/article/3453030/sase-is-more-than-a-buzzword-for-bioivt.html)
[#]: author: (Linda Musthaler https://www.networkworld.com/author/Linda-Musthaler/)

SASE is more than a buzzword for BioIVT
======
Secure access service edge might be the newest Gartner buzzword, but BioIVT implemented its SASE platform more than 18 months ago and is already reaping the benefits of business acceleration based on technology simplification.
Thinkstock

It seems the latest buzzword coming from those analysts at Gartner is SASE (pronounced “sassy”), which stands for “Secure Access Service Edge.” Network World has published several articles recently to explain what SASE is (and perhaps isn’t). See Matt Conran’s [The evolution to Secure Access Service Edge (SASE) is being driven by necessity][1] as well as Zeus Kerravala’s article [How SD-WAN is evolving into Secure Access Service Edge][2].

Given all the attention SASE is now getting, you’d think it’s some new approach to networking, but it really isn’t new; the architecture has been around for a few years now. Only the nickname SASE is new.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][3]

The notion of SASE is that networking and security are converged into one service that is delivered from the cloud. Using [SD-WAN][4], a company connects into this service at its edge and has access to an optimized WAN and a full security stack. It’s an ideal model for companies that don’t want to manage their own infrastructure.

[][5]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][5]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

That was a leading driver for Andrew Thomson and the rest of the infrastructure team at BioIVT when they undertook the effort to rearchitect their network about two years ago. Now the Director of IT at BioIVT, Thomson says the company’s previous network was inhibiting the business strategy, so something had to change.

Headquartered in Westbury, N.Y., with locations in the U.S. and Europe, BioIVT is a provider of biological materials and scientific services to research and development organizations. The original [WAN][6] was comprised of a full mesh configuration of point-to-point [VPN][7] tunnels among ten locations. On every one of the sites, the company had to build nine tunnels. As the company began to grow through acquisition – now up to 16 locations – the number of tunnels increased dramatically for each new location.

“We were using Cisco equipment for the network, and it was all being managed by a vendor,” says Thomson. “We didn’t have anyone in-house with the network engineering expertise or the Cisco IOS knowledge to setup and manage everything. We had to rely on a third-party for that.”

**In need of a different network approach**

As the company strategy turned to growth through acquisition, the network infrastructure team wasn’t able to connect new sites as quickly as business demanded. “We’ve been in a growth mode as an organization for the last two years, adding new sites frequently,” says Thomson. “Our onboarding time was significant to work them into our network architecture, to get them up and running with connections to our existing [WAN][6] infrastructure. Also, we wanted to make a move toward more cloud-based services. We wanted to switch from on prem PBX systems to VoIP and we knew we needed a better way to manage our network connections and provide those types of services as well. That was really why we started shopping around for a different network model.”

Security was the other side of the coin for BioIVT. “We were really relying on just the independent security configurations of those Cisco routers to protect all of our networks,” says Thomson “Again, we didn't have anybody in-house with that kind of experience. We weren't monitoring things as much as we knew we needed to be doing. We knew we had to do something about security as we rearchitected the network.”

Thomson’s team knew they wanted to go with an SD-WAN provider, and they evaluated four vendors. “We did our due diligence on all those vendors and looked at what they all provided. We chose Cato Networks because it was the only one that would allow us to rely on a single edge device at each of our locations to provide the security as well as the network routing and the interconnectivity between our sites,” Thomson explains.

Looking rather prescient two years ago, Thomson chose a SASE solution before SASE was cool. “The fact that we were able to find a vendor who could provide the connectivity, the management, the quality of service as well as the security monitoring and the perimeter defense that we have with Cato is really why we ended up selecting them.”

The BioIVT network now has a Cato Edge SD-WAN device at each site to handle the connections to the local Internet service providers. The company has dual connections at each site for redundancy. “With our prior network, redundancy meant that we had multiple routers, one for each connection and we had to split traffic that way,” says Thomson. “With the Cato device, because it has the two WAN ports, we're able to just plug our local Internet provider connection in. We don't have to worry about static IP addresses, we don't have to worry about any of that type of routing. Cato is handling all that for us at the front, and then because that Internet traffic is coming into the Cato device and being routed to the Cato network, it's providing that perimeter security for us.”

Thomson says that any traffic that comes in or is going out through those ports is being routed through the Cato system where they are applying the firewall rules that BioIVT set up in Cato, as well as quality of service and network routing, and NAT translation—all that gets applied by the Cato system through their management interface.

**Business acceleration is a benefit**

The new network has been a real boon for BioIVT. “This network has significantly reduced complexity for us. More important than that, though, is that it allows us to stand up new sites very quickly,” says Thomson. “We're at a point now where if we know we're acquiring an organization, within a few days we can have a Cato device shipped directly to them that's pre-configured for our account and we can have them plug their existing Internet connection into that Cato device and their internal switch into the LAN port and they're basically connected into our network without us having to do any reconfiguration. So, it becomes a much simpler process for us. They immediately get to start taking advantage of firewall services that they didn't have before.”

Thomson credits the Cato Networks backbone for increasing network performance. “As soon as our outbound Internet traffic hits the Cato network, we’re on their private backbone. What used to be, maybe, 20 hops from our location in Florida to our location in New York  now might be just half that because the Florida location hits their local Internet provider and it goes to Cato’s nearest point of presence and then it might route directly to Virginia and then directly to New York and directly into our New York office. So, we've reduced the number of hops between sites. We take advantage of the Cato backbone for things like that.”

BioIVT has noticed a big improvement in speed and reliability of network communications. Thomson doubts they would have been able to implement their global VoIP solution without something like Cato providing that type of quality backbone to the network as well as traffic prioritization.  Also, the company’s mobile workforce is enabled with Cato’s VPN tool that easily and securely brings mobile users onto the Cato backbone. “We saw a huge improvement in people’s accessibility to our internal systems with this VPN over the previous VPN that we were using,” claims Thomson.

**Making the justification**

Making the leap to this SASE platform was quite a change for BioIVT. How did Thomson justify the transition to his executives? “We positioned it as a platform for everything that we wanted to be able to do over the next three years with the business,” he says. “The big goal, the business strategy, is growth and acquisition. We presented this as a platform, as a base service that we just had to have in place in order to leverage things like voice over IP, Office 365, Azure, cloud-based computing services, hosting servers in the cloud. Without a common core solid foundation, we wouldn't have been able to do any of those things reliably without adding staff to do monitoring or maintenance or administrative overhead.”

Further, Thomson says he positioned the Cato solution as almost a black box tool for networking where they would know what services they were getting. “We could manage it through a web interface, didn't have to worry about specific technical skillsets that we would need to bring in. Just going with Cato's SD-WAN, we dealt with all of those networking things as well as security, which just continues to become more and more important and wasn't something that we could afford to treat as just a single vendor outsource that's half paying attention to what was going on.”

**The future of SASE**

[Zeus Kerravala wrote][2] that a SASE implementation requires a comprehensive technology portfolio that only a few vendors can currently deliver – [Cato Networks][8], [Juniper Networks][9], [Fortinet][10] and [Versa][11] – but that other SD-WAN vendors and startups will be flocking to this marketspace soon. As organizations increasingly look for simplicity, scalability, flexibility, low latency and pervasive security in their network, SASE solutions will only grow in popularity.

Join the Network World communities on [Facebook][12] and [LinkedIn][13] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3453030/sase-is-more-than-a-buzzword-for-bioivt.html

作者：[Linda Musthaler][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Linda-Musthaler/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3448276/the-evolution-to-secure-access-service-edge-sase-is-being-driven-by-necessity.html
[2]: https://www.networkworld.com/article/3449136/how-sd-wan-is-evolving-into-secure-access-service-edge.html
[3]: https://www.networkworld.com/newsletters/signup.html
[4]: https://www.networkworld.com/article/3031279/sd-wan-what-it-is-and-why-you-ll-use-it-one-day.html
[5]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[6]: https://www.networkworld.com/article/3248989/what-is-a-wan-wide-area-network-definition-and-examples.html
[7]: https://www.networkworld.com/article/3268744/understanding-virtual-private-networks-and-why-vpns-are-important-to-sd-wan.html
[8]: https://www.catonetworks/sase
[9]: https://www.juniper.net/us/en/dm/enterprise-sd-wan/
[10]: https://www.fortinet.com/products/sd-wan.html
[11]: https://www.versa-networks.com/enterprise/sd-wan/
[12]: https://www.facebook.com/NetworkWorld/
[13]: https://www.linkedin.com/company/network-world
