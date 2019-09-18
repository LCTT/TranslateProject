[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A Virtual WAN: Moving closer to the enterprise)
[#]: via: (https://www.networkworld.com/article/3438357/a-virtual-wan-moving-closer-to-the-enterprise.html)
[#]: author: (Matt Conran https://www.networkworld.com/author/Matt-Conran/)

A Virtual WAN: Moving closer to the enterprise
======
Virtual WAN will radically change the telecom environment, including how circuits are procured and who procures them.
BlueBay2014 / Getty Images

Microsoft has introduced a new virtual WAN as a competitive differentiator and is getting enough tracking that AWS and Google may follow. At present, Microsoft is the only company to offer a virtual WAN of this kind. This made me curious to discover the highs and lows of this technology. So I sat down with [Sorell Slaymaker][1], Principal Consulting Analyst at TechVision Research to discuss. The following is a summary of our discussion.

But before we proceed, let’s gain some understanding of the cloud connectivity.

Cloud connectivity has evolved over time. When the cloud was introduced about a decade ago, let’s say, if you were an enterprise, you would connect to what's known as a cloud service provider (CSP). However, over the last 10 years, many providers like Equinix have started to offer carrier-neutral collocations. Now, there is the opportunity to meet a variety of cloud companies in a carrier-neutral colocation. On the other hand, there are certain limitations as well as cloud connectivity.

[NEWSLETTERS: Get the latest tech news sent directly to your in-box][2]

Undoubtedly, carrier-neutral colocation has fetched many advantages. However, even with this enhanced and flexible connectivity model, the pain-point for the majority of cloud companies is still the network connectivity. The network presents a number of challenges. Firstly, it will slow you down and secondly, from a security perspective, it makes you susceptible to vulnerabilities.

### The connectivity transition

We are now entering into a new phase, taking the cloud connectivity to the next level. Primarily, the cloud is moving closer to the enterprise, as opposed to the enterprise moving closer to the cloud. So, where will this approach lead us to?

Eventually, we will see the removal of the CSP, where the connectivity is serviced directly into the enterprise. We have already witnessed this transition with AWS. AWS now allows the companies to run AWS infrastructure in their own private data centers. This, ultimately, enables the organization to connect the various VPCs together.

With this paradigm, the cloud meets the customer in the enterprise as opposed to the enterprise coming to the cloud, or to a carrier-neutral colocation. This will radically change the telecom environment; especially how circuits are procured and who procures them.

### Cloud connectivity

First, let’s recap some basics. The connectivity to any cloud can be done via the internet or a private direct connection. The internet is untrusted and public, where an IPsec tunnel is created. It may be cheap and quick to provision logical tunnels, but this comes with certain drawbacks, such as security, uptime, latency, packet loss and jitter.

All such hindrances can degrade the application’s performance severely. This can be critical to support the sensitive and hybrid applications requiring real-time backend on-premise communications. For direct connectivity, most cloud providers have a more stable solution rather than relying solely on the Internet.

For example, AWS has a product called AWS Direct Connect, whereas Microsoft has a product known as Azure ExpressRoute. Both products have the same end goal: cloud and on-premise endpoint connectivity that is not over the Internet.

With Microsoft's Azure ExpressRoute, you get a private connection with guaranteed service level agreement (SLA). It's like a natural extension to the on-premise data center that offers lower latency, higher throughput and better reliability than the Internet has to offer. However, there are some drawbacks to this mechanism.

Even though ExpressRoute provides a private connection, enforcing end-to-end QoS is quite challenging. How Microsoft would label the packet will be different from how the service providers label based on their standard MPLS links. The other challenge is the lack of efficient load balancing due to separate BGP domains. Since ExpressRoute is not delivered end-to-end, so you are basically doing a cross-connect or meeting the service provider at a point where there is already another BGP domain available.

As a result, if you want to do equal-cost multipath (ECMP), complex failover and dynamic routing around congestion and configurations can get complex. This surfaces the demand for a change. Since Microsoft is aware of this need, therefore, they are evolving this ExpressRoute into what they are calling as the “Azure Virtual WAN.” A virtual WAN, as you might expect, provides a massive scale during the software-defined connectivity.

### What the virtual WAN offers?

The Azure Virtual WAN brings together many Azure cloud connectivity services, such as site-to-site VPN and ExpressRoute into a single operational interface. Now connectivity can leverage the Azure backbone to connect the branches and enjoy the branch-to-VNet connectivity. We will learn more about the new connectivity options later. The virtual WAN is purposely designed to provide large-scale site-to-site connectivity. It is built to offer throughput, scalability and ease of use.

Microsoft has virtual WAN locations that connect to the Microsoft virtual network. This network consists of 130 connections in 50 countries. This pushes the cloud connectivity model closer to the edge. Therefore, if you are using Azure or Office 365, connectivity is closer, as compared to doing a global backhaul. Microsoft's primary objective is to be within 30 ms of the consumer.

Microsoft also gives the option to do hop-on and hop-off, so that you can use the Microsoft global backbone as your WAN. In the case of remote offices in different locations, you only need to provide local circuits to the Microsoft edge point in that country. This eliminates the need for purchasing large WAN circuits.

This significantly allows you to have a global WAN where you don't have to pay for the expensive WAN circuits between or within counties.

Virtual WAN offers the following advantages:

  * **Integrated connectivity solutions in the hub-and-spoke:** You can automate the site-to-site configuration and connectivity between the on-premises sites and an Azure hub.
  * **Automated spoke setup and configuration:** You can connect your virtual networks and workloads to the Azure hub seamlessly.
  * **Intuitive troubleshooting:** You can see the end-to-end flow within Azure, and then use this information to take action when required



### The partners and virtual Hub

Typically, virtual WAN lets you connect and configure the branch devices to communicate with Azure. This can be done in two ways, either manually, or by using the provider devices offered through a virtual WAN partner.

The partner devices allow ease of use, simplification of connectivity and configuration management. The connectivity from the on-premise device is established in an automated way to the virtual hub. Fundamentally, a virtual hub is a Microsoft-managed virtual network.

### The global transit network

The virtual WAN helps in laying the foundation of a global transit network architecture by enabling ubiquitous, any-to-any connectivity between distributed VNets, sites, applications and users.

In the WAN architecture, Azure regions serve as hubs, from which you can choose to connect your branches. Once the branches are connected, you can leverage the Azure backbone to establish, for example, branch-to-VNet and branch-to-branch connectivity.

The virtual WAN supports the following; global transit connectivity paths, branch to VNets, branch to branch, the remote user to VNet, the remote user to branch, VNet to VNet by using VNet peering and ExpressRoute global reach.

### The WAN architecture

The architecture is based on a hub-and-spoke model where the Microsoft cloud-hosted network acts as the hub. This enables transitive connectivity between endpoints that may be distributed across different types of spokes.

A spoke can be a VNets, physical branch site, remote user and internet. Global transit network architecture enables any-to-any connectivity via a central network hub. Largely, this architecture eliminates or reduces the need for full-mesh or partial mesh connectivity models that are complex to build and maintain.

Routing control in mesh networks is easier to configure and maintain through the hub-and-spoke model. The Microsoft any-to-any connectivity enables an enterprise with globally distributed users, branches, data centers, VNets and applications to connect to each other through the Microsoft transit hub. In essence, it is this transit hub that acts as the global system.

Mainly, you can establish a virtual WAN by creating a single Virtual WAN hub in the region that has the largest number of spokes that can take the form of branches, VNets and users. Then you can connect the spokes that are in other regions of the hub. An alternative design would occur if the spokes are geographically distributed, you can also instantiate regional hubs and interconnect the hubs. The hubs are all part of the same virtual WAN, but the best part is that they can be associated with different regional policies.

### Virtual WAN SD-WAN capabilities

Currently, SD-WAN is not fully integrated. Microsoft offers SD-WAN services from a couple of SD-WAN vendors including Citrix, GloudGenix and 128 technologies as part of the overall virtual WAN offering.

Under this model, you could, for example, have a 1G connection to Azure and you can run the SD-WAN vendor software within the location. You can use that software to route to other Azure locations. Now since you are using the SD-WAN, you get all the SD-WAN services on top of the Microsoft virtual WAN i.e. route around congestion and another brownout. This is contrary to the typical protocol that routes only around blackouts.

Citrix WAN optimization features allow you to tune and configure the WAN to have more control as opposed to relying on the underlying network. Although, Citrix is very strong with WAN optimization, but it is IPsec based. Therefore, its overall scaling is eventually limited to the limitations of scaling IPsec. On the other hand, an SD-WAN offering from 128 technologies is not IPsec tunnel-based and doesn't have the overhead. Thence, it can more intelligently route traffic in a one-to-many vs tunnels that are point-to-point.

Regarding in-built security on the WAN backbone, Microsoft provides the connectivity to integrate the security solution according to your choice. If you want security to be over and above, you can service-chain a firewall vendor or leverage security in place of an SD-WAN service. The majority of SD-WAN players have layer 1 to layer 4 built into them. They don't have the proxies or the Layer 5 or higher than the security solutions that you get from security companies, such as Pao Alto but you always have the option to service-chain.

**This article is published as part of the IDG Contributor Network. [Want to Join?][3]**

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3438357/a-virtual-wan-moving-closer-to-the-enterprise.html

作者：[Matt Conran][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Matt-Conran/
[b]: https://github.com/lujun9972
[1]: https://techvisionresearch.com/sorell-slaymaker/
[2]: https://www.networkworld.com/newsletters/signup.html
[3]: https://www.networkworld.com/contributor-network/signup.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
