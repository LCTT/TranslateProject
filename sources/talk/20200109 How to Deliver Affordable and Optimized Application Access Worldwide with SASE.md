[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Deliver Affordable and Optimized Application Access Worldwide with SASE)
[#]: via: (https://www.networkworld.com/article/3512640/how-to-deliver-affordable-and-optimized-application-access-worldwide-with-sase.html)
[#]: author: (Cato Networks https://www.networkworld.com/author/Matt-Conran/)

How to Deliver Affordable and Optimized Application Access Worldwide with SASE
======
Gartner tells you to use your MPLS renewal budget to transition into SASE, but not every SASE can replace MPLS. Here's what to look for.
Vit_Mar

Global expansion is a common goal for many enterprises. In some verticals, like manufacturing, running production lines globally is an established practice. However, deploying international sales, service, and engineering teams is becoming the norm for many other sectors including high tech, finance, retail, and more.

A global enterprise footprint creates a unique set of challenges that do not occur in regional businesses. Users in a remote office will need to securely access data-center applications, cloud applications, or both. Depending on the distance between the remote location and the application—and the sensitivity of the application to high latency, packet loss, and jitter—an expensive set of technologies and capabilities will be needed to optimize the user experience.

[SD-WAN][1] focuses on affordable, high-performance site connectivity. Alone it cannot solve the broader networking and security challenges faced by global enterprises, which is why Gartner and other analysts are already recognizing the need to look beyond SD-WAN for a new class of enterprise solutions. Gartner has coined the term [secure access service edge (SASE, pronounced “sassy”)][2] for solutions that converge SD-WAN capabilities with enterprise security into a global, cloud-native platform. Let’s take a deeper look.

#### **The Application Access Optimization Challenge**

Across the enterprise, IT finds itself facing various challenges delivering network access to users and data everywhere. While those challenges will vary, their impact point remains the same—the user experience and IT budget.

For data-center access, organizations traditionally relied on global MPLS providers. The predictability of MPLS ensured consistent latency and low packet loss and jitter needed to support critical applications like voice and ERP. The challenge with global MPLS was the cost per megabit that required organizations to spend heavily on limited bandwidth, creating a capacity constraint. The introduction of SD-WAN appliances and Internet-based connectivity does little to address the global connectivity challenge because SD-WAN appliances can't control the packet routing once the packet is placed on the Internet-leg of the SD-WAN.

Another option to address global connectivity challenges was to shorten the distance between users and applications. Enterprises built regional data centers or hubs to get applications closer to end users. This is a very costly and complex endeavor that is most suitable for very large organizations with distributed IT staff who can optimize application performance and availability.

#### **Global Cloud Access**

The migration to cloud applications and cloud data centers created a new challenge for remote users. While MPLS was optimized for the organization’s on-premises data-center access, cloud data centers often reside in different geographic locations. Special connectivity solutions, such as [AWS DirectConnect and Azure ExpressRoute][3], are used to optimally connect physical enterprise locations to the cloud data centers. And while SD-WAN appliances claim cloud optimization, they require deploying a second appliance into the cloud — no easy task.

Regardless of application location, none of the network solutions discussed are extensible to home offices and mobile users, where deploying edge appliances for SD-WAN or WAN optimization is not possible. This creates an application access challenge because the users must use the public internet to access the edge of the data center hosting their application. This access is subject to the unpredictable quality of the network from the user’s location to the destination.

#### **SASE Delivers Optimized and Secured Application Access Anywhere**

Global expansion, the migration from on-premises to cloud data centers, and the emergence of the mobile and telecommuting workforce are straining legacy network architectures. The network “patches” created to address this challenge, such as edge-SD-WAN, hybrid MPLS, Internet transports, and premium cloud connectivity, are costly and incomplete.

To address this architectural challenge, a new architecture that connects and optimizes all edges—physical, virtual, cloud, mobile—anywhere in the world, must be created. That’s the story of [SASE][2]. SASE services converge networking and security into an identity-aware, cloud-native software stack. It’s the convergence that is key. Without the necessary network optimizations and capabilities, the SASE platform will not be able to meet performance expectations everywhere.

#### **Cloud-Native: Built for and Delivered from the Cloud**

A core characteristic of SASE is a cloud-native, as-a-service model. A cloud-native architecture leverages key cloud capabilities, including elasticity, adaptability, self-healing, and self-maintenance.

SASE calls for the creation of a network of cloud points of presence (PoPs), which comprise the SASE Cloud. The PoPs run the provider software that delivers a wide range of networking and network security capabilities as a service. The PoPs should seamlessly scale to adapt to changes in traffic load via the addition of compute nodes. The PoPs software can be upgraded to deliver new features or bug fixes seamlessly and without IT involvement. The cloud architecture must include self-healing capabilities to automatically move processing away from failing compute nodes and PoPs and into healthy ones.

These capabilities can't be achieved by spinning up virtual appliances in the cloud. Appliances are designed to serve a single customer (single tenant) and lack the overall cloud orchestration layer to ensure elasticity and self-healing.

**Globally Distributed: Available Near All Edges**

SASE Cloud is implemented as a globally distributed cloud platform. The SASE Cloud design guarantees that wherever your edges are, the full range of networking and security capabilities will be available to support them. SASE providers will have to strategically deploy PoPs to support business locations, cloud applications, and mobile users. As Gartner notes, SASE PoPs must extend beyond public cloud providers’ footprints (like AWS and Azure) to deliver a low-latency service to enterprise edges.

Building a global cloud platform requires providers to hone their ability to rapidly deploy PoPs into cloud and physical data centers, ensure high capacity and redundant connectivity to support both WAN and cloud access, and apply security and optimization end-to-end across all edges.

#### **Thin Edge: DC, Branch, Cloud, User**

By placing processing and business logic in the cloud, SASE has minimal requirements for connecting various edges. This is a key challenge for SD-WAN edges especially in the context of NFV and uCPE. Running SD-WAN and network security side by side on the same appliance increases the likelihood of an overload, forcing the need to over-spec the underlying appliance.  This isn't a theoretical issue: An increase in branch throughput or rise in encrypted traffic volume can force an out-of-budget expansion. A Thin Edge approach has the following benefits:** **

  * **Low cost:** By minimizing edge processing, low-cost appliances can achieve high throughput as most resource-intensive processing, such as deep packet inspection, is done using cloud resources that can scale better.
  * **Low maintenance:** By keeping the over-functionality limited, it is possible to run a slower upgrade cycle to the edges, which has a higher potential for disruption vs. introducing new capabilities in the cloud.
  * **Low impact:** Cloud integration is achieved with no edge appliances at all (agentless), while security and global network optimization remains intact. Mobile devices and new kinds of IoT devices no longer need significant processing resources to participate in the corporate network. They can automatically connect to the nearest SASE PoP with minimal battery impact.



#### **End-to-End Optimization**

Combining intelligent routing at the WAN edge with a software-defined global private backbone enables end-to-end traffic optimization. Last-mile optimizations focus on addressing last-mile issues, such as packet loss, by dynamically routing traffic over multiple ISPs. Middle-mile optimizations focus on optimizing routing globally and over multiple carriers comprising a diverse underlay. The middle-mile optimization extends to all edges—physical, virtual, and mobile—which is a unique benefit to a cloud-based, rather than an edge appliance-based, architecture.

In short, SASE implements a new architecture that is built to support the modern global enterprise and address the various resources, requirements, and use cases in a holistic platform. Yes, SASE provides a fresh way to secure the network, but SASE also needs the “networking capabilities” of the network if companies are to deliver users everywhere an optimum user experience.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3512640/how-to-deliver-affordable-and-optimized-application-access-worldwide-with-sase.html

作者：[Cato Networks][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Matt-Conran/
[b]: https://github.com/lujun9972
[1]: https://www.catonetworks.com/sd-wan?utm_source=idg
[2]: https://www.catonetworks.com/sase?utm_source=idg
[3]: https://www.catonetworks.com/cato-cloud#cloud-datacenter
