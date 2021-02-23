[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (SASE might be better than VPNs for quickly ramping up remote access)
[#]: via: (https://www.networkworld.com/article/3534501/sase-might-be-better-than-vpns-for-quickly-ramping-up-remote-access.html)
[#]: author: (Linda Musthaler https://www.networkworld.com/author/Linda-Musthaler/)

SASE might be better than VPNs for quickly ramping up remote access
======
A secure access service edge model can quickly grow remote-worker capacity without requiring enterprises to deploy their own new VPN gear.
Getty Images

The global pandemic now hitting almost every corner of the world is forcing countless millions of people to work from home. In one sense, we’re fortunate to now have the technology that allows us to do that. Between broadband Internet access in the home, corporate VPNs, team workspaces and videoconferencing services, many people can continue to do their jobs as effectively as if they were in their regular office environment.

That doesn’t mean it’s all smooth sailing for the IT departments that have to enable and support those critical work-from-home services. Depending on the type of network architecture a company has, it can be relatively easy or significantly challenging to support tens of thousands of employees now suddenly working from home.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][1]

I recently talked with Mark Casey, CEO of the network infrastructure services provider [Apcela][2], who conveyed the challenges that many large enterprises have. It’s these companies that typically still have a traditional hub-and-spoke kind of WAN anchored in a physical data center. Corporate traffic is backhauled from branch and remote locations (like workers’ homes) to a centralized [data center][3] to pass through a security stack before it is sent to the internet or to cloud services. Unfortunately, this legacy network architecture doesn’t adapt well to the dramatically different traffic patterns resulting from a massive surge in telework.

When you look at the [VPN][4] architecture in this environment, it’s largely dominated by Cisco with its AnyConnect solution that pairs with the vendor’s ASA [firewall][5] products. Countless large enterprises have these hardware appliances in their on-premises data centers. Whether it’s Cisco equipment or some other vendor’s, the VPN/firewall combination is a real workhorse under normal conditions, but the vast increase in remote workers is causing a strain.

**VPN capacity is strained**

A home-based worker brings up a VPN connection that creates a secure tunnel to take him straight into the data center. This might be fine when the company expects 10% to 20% of its employees to work remotely at any given time, but now the numbers might approach 50% or 70%. This creates contention for resources and a poor VPN experience for all. What’s more, workers are routing a bunch of internet traffic to the data center along with traffic destined for on-premise applications like [Microsoft Office 365][6]. This is the landscape that Casey sees every day as he engages with large enterprise organizations.

“We’ve talked to a number of companies recently that say they need to expand their VPN capacity but the legacy network architecture is holding them back. [Cisco][7], Palo Alto and others are offering free VPN client licenses but the enterprises still need to expand the VPN terminating appliances. It’s hard to quickly scale capacity in this environment,” says Casey. “Whether it’s coronavirus or some other catalyst that puts stress on the legacy network environment, we advocate that enterprises should diversify and shift portions of their network architecture to the cloud. This will give them much more flexibility to provide security and remote access services to their workforce in the long run.”

[][8]

**SASE for flexibility and capacity on demand**

Casey points to the [Secure Access Service Edge][9] (SASE, pronounced “sassy”) framework as a model for re-architecting the enterprise network. SASE is Gartner’s name for a combination of [SD-WAN][10] capabilities with a number of security services that are primarily delivered through a cloud-based delivery model.

Gartner defines the service edge as an offering that supports the access needs of digital enterprises by combining SD-WAN functions with network security services such as secure web gateway (SWG), cloud access security broker (CASB), and cloud-based firewall. In short, a SASE offering helps simplify network management by offering highly customizable policy-based control that can be tailored by user identity, session context, and application needs for performance and security – and it’s delivered from the cloud. 

Casey explains the concept of a service edge with a geographical example. “Suppose an employee is VPNing into his corporate network from his New York area home, and the data center happens to be in Chicago. Ordinarily the traffic would all be directed to Chicago, but if he’s accessing internet content, it would be optimal to egress that traffic via secure web gateway much more locally to where the user is. It’s better to go to a site in New York where the VPN terminates on a local firewall, and there’s a secure web gateway there so the Internet traffic can be offloaded there instead of backhauling it to Chicago. This site in New York is called the service edge.”

Casey continues his explanation: “A virtualized version of a company’s firewall sits in the hub. The VPN terminates on the VPN concentrator in the local hub and then the traffic is routed appropriately. That traffic going to the internet goes out through secure web gateway and that traffic that's destined for an application in the data center goes over a private network inside the security parameters. This is essentially another tunnel back to the data center. And that's a great use case for this whole concept of SASE, which is to lift some of your core security components and move them out to the cloud.”

With the word cloud, people tend to think of AWS or Azure or Google Cloud Platform, but Casey gives cloud a broader definition. “Cloud is Software as a Service, like Salesforce and ServiceNow,” says Casey. “If you’re an enterprise, cloud is an Equinix data center. Cloud is anything that’s not you, and it’s delivered as a service.”

**The service edge is a powerful hub**

In Apcela’s parlance, a service edge is called an application hub, or AppHub. Other companies call them communication hubs, cloud hubs, or simply Points of Presence (PoPs). Regardless of the name, the concept is the same.

These hubs consist of racks of switching and routing equipment that are typically deployed in carrier-neutral co-location centers. Then these data centers are interconnected with high-capacity, low-latency circuits that create a high-performance core network. SD-WAN, VPN and security stacks are typically deployed in the hubs. At the edge of this network, an enterprise can directly connect its own data centers, branch offices, remote and mobile users, and even third-party partners. The leading SASE providers have built hubs, or PoPs, around the world so that organizations and their workers can connect to the closest hub to obtain the communication and security services they need. Each enterprise chooses what services it wants to utilize.

When considering how to deploy security as a virtual service, Casey says, “You don't necessarily want to put all the security in AWS because then it will work great with AWS, but it won't work for GCP or Azure, and it certainly won't help you for your SaaS applications. So having this hub environment that sits between the application clouds – Salesforce, Office 365, Workday, etc. – and the users and enterprise locations is the perfect location to put these security services. And because the hubs are essentially an Infrastructure as a Service, you're not stuck with having to move to some proprietary cloud-based platform.”

SASE infrastructure is essentially on demand, so it’s fairly easy for new customers to adopt it. “It’s not complicated,” says Casey. “We have to find a place, somewhere in the world, and cross connect back into an enterprise’s infrastructure to deliver private connectivity. But it's all very cloud-like. It takes the agility of cloud and the speed of cloud and enables you to act quickly.”

**SASE has VPN capacity pre-built**

The SASE model allows companies to expand their VPN platforms easily because the capability is all pre-built. Once the service is turned on, the company is well positioned to support thousands of new home-based workers.

I asked Casey about a realistic timeframe for companies that are new to the SASE approach before they can expect to be up and running with expanded VPN capacity. “I can only speak to the solution Apcela offers, of course, but I’d say it’s a matter of days to weeks, but certainly not months,” he says. “In our case, it depends on their security platform because we leverage virtualized network functions on the security side, so the whole concept of procuring and shipping equipment goes away.” Other vendors might do the deployment in different ways.

Contrast this approach to the legacy model of installing new hardware in a data center to provide more capacity. By the time the company orders the hardware, gets it shipped to the data center, and then installed and configured, two or three months might pass.

Another benefit of the SASE framework is that traffic travels over a private core network rather than the public Internet. “The Internet shouldn’t become your new [WAN][11] – certainly not for business and mission-critical platforms. You need a specialized sort of [MPLS][12]-like network for your cloud apps, which is what a SASE platform does,” says Casey. “Traffic is taken off the Internet at the secure edge, put onto a private secure network and routed directly to the appropriate SaaS or IaaS platform data center.”

Having a private core network is especially important at this time because the public Internet is under great strain due to the traffic and content pattern shifts now that so many people are staying home or working from home. The [strain is so bad][13] that companies like Facebook and Netflix have been asked by the European Commissioner for internal market and services to throttle their services to consume less bandwidth. As Casey says, “You don’t want your corporate traffic to compete for bandwidth against Netflix and all these different videoconferencing services.”

If your organization is struggling with ramping up work-from-home capacity in a hurry, consider how a SASE service might help you.

Join the Network World communities on [Facebook][14] and [LinkedIn][15] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3534501/sase-might-be-better-than-vpns-for-quickly-ramping-up-remote-access.html

作者：[Linda Musthaler][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Linda-Musthaler/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://www.apcela.com/
[3]: https://www.networkworld.com/article/3223692/what-is-a-data-centerhow-its-changed-and-what-you-need-to-know.html
[4]: https://www.networkworld.com/article/3268744/understanding-virtual-private-networks-and-why-vpns-are-important-to-sd-wan.html
[5]: https://www.networkworld.com/article/3230457/what-is-a-firewall-perimeter-stateful-inspection-next-generation.html
[6]: https://techcommunity.microsoft.com/t5/office-365-blog/how-to-quickly-optimize-office-365-traffic-for-remote-staff-amp/ba-p/1214571;
[7]: https://blogs.cisco.com/security/cisco-expands-free-security-offerings-to-help-with-rise-in-remote-workers
[8]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE22140&utm_content=sidebar (ITAAS and Corporate Storage Strategy)
[9]: https://www.networkworld.com/article/3516503/it-pros-need-to-weigh-in-on-that-sassy-security-model.html
[10]: https://www.networkworld.com/article/3031279/sd-wan-what-it-is-and-why-you-ll-use-it-one-day.html
[11]: https://www.networkworld.com/article/3248989/what-is-a-wan-wide-area-network-definition-and-examples.html
[12]: https://www.networkworld.com/article/2297171/network-security-mpls-explained.html
[13]: https://mashable.com/article/eu-netflix-standard-definition-coronavirus/
[14]: https://www.facebook.com/NetworkWorld/
[15]: https://www.linkedin.com/company/network-world
