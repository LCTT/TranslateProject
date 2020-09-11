[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A Network for All Edges: Why SD-WAN, SDP, and the Application Edge Must Converge in the Cloud)
[#]: via: (https://www.networkworld.com/article/3440101/a-network-for-all-edges-why-sd-wan-sdp-and-the-application-edge-must-converge-in-the-cloud.html)
[#]: author: (Cato Networks https://www.networkworld.com/author/Matt-Conran/)

A Network for All Edges: Why SD-WAN, SDP, and the Application Edge Must Converge in the Cloud
======
Globalization, mobilization, the cloud, and now edge computing are complicating enterprise networking. Here’s why and how you can best prepare yourself.
NicoElNino

The software-defined movement keeps marching on. [Software-defined WAN (SD-WAN)][1] is redefining the branch edge by displacing legacy technologies like MPLS, WAN optimizers, and routers. [Software-defined Perimeter (SDP)][2] is displacing whole network access via mobile VPN with secure and optimized access from any device to specific applications in physical and cloud datacenters. These seem like unrelated developments, despite the “software-defined” buzz, because enterprise IT thinks about physical locations, mobile users, and applications separately. Each enterprise edge, location, person, or application is usually served by different technologies and often by different teams.

### Emerging Business Needs and Point Solutions, like SD-WAN and SDP, Make the Network Unmanageable

In recent years, though, managing networking and security got even more complicated due to the accelerating trends of globalization, mobilization, and cloudification.

Take global locations: Connecting and securing them create a unique set of challenges. Network latency is introduced by distance, requiring predictable long-haul network connectivity. There is often less support from local IT, so the technology footprint at the location must be minimized. Yet security can’t be compromised, so remote locations must still be protected as well as any other location.

Next, mobile users introduce their own set of challenges. Optimizing and securing application access for mobile users require the extension of the network and security fabric to every user globally. Mobile VPNs are a very bad solution. Since the network is tied to key corporate locations, getting mobile traffic to a firewall at headquarters or to a VPN concentrator over the unpredictable public internet is a pain for road warriors and field workers. And doing so just so the traffic can be inspected on its way to the cloud creates the so-called “[Trombone Effect][3]” and makes performance even worse. 

Finally, the move to cloud applications and cloud datacenters further increases complexity. Instead of optimizing the network for a single destination (the physical datacenter), we now need to optimize it for at least two (physical and cloud datacenters), and sometimes more if we include regional datacenter instances.  As the application “edge” got fragmented, a new set of technologies was introduced. These include cloud access security brokers (CASB) and cloud optimization solutions like AWS DirectConnect and Microsoft Azure ExpressRoute. Recently, edge computing is becoming a new megatrend – placing the application itself near the user, introducing new technologies into the mix such as AWS Outpost and Azure Stack.

### Making the Network Manageable Again with a Converged Cloud-Native Architecture

What is the remedy for this explosion in requirements and complexity? It seems enterprises are hard at work patching their networks with myriad point solutions to accommodate that shift in business requirements. There is an opportunity for forward-looking enterprises to transform their networks by holistically addressing **all** enterprise edges and distributing networking and security capabilities globally with a cloud-native network architecture.

Here [are several key attributes of the cloud-native network][4].

**The Cloud is the Network**

A cloud-native architecture is essential to serving all types of edges. Traditional appliance-centric designs are optimized for physical edges, not mobile or cloud ones. These legacy designs lock the networking and security capabilities into the physical location, making it difficult to serve other types of edges. This imbalance made sense where networks were mostly used to connect physical locations. We now need an [**edge-neutral** design that can serve any edge: location, user, or application.][5]

What is this edge neutrality? It means that we place as many networking and security capabilities as possible away from the edge itself – in the cloud. These include global route optimization, WAN and cloud acceleration, and network security capabilities such [as NGFW, IPS, IDS, anti-malware, and cloud security][6]. With a cloud-native architecture, we can distribute these capabilities globally across multiple points of presence to create a dynamic fabric that is within a short distance from any edge. This architecture delivers enterprise-grade optimization and security down to a location, application, user, or device. 

**Built from Scratch as a Multitenant Cloud Service**

Cloud-native networks are built for the cloud from the ground up. In contrast, managed services that rely on hosted physical and virtual appliances can’t benefit from a cloud platform. Simply put, appliances don’t have any of the key attributes of cloud services. They are single-tenant entities unlike cloud services, which are multi-tenant. They aren't elastic or scalable, so dynamic workloads are difficult to accommodate. And they need to be managed individually, one instance at a time.  You can't build a cloud-native network by using appliance-based software. 

**End-to-End Control**

The cloud-native network has edge-to-edge visibility and control. Traditionally, IT decoupled network services (the transports) from the network functions (routing, optimization, and security). In other cases, the full range of services and functions was bundled by a service provider. By running traffic between all edges and to the Internet through the cloud network, it is possible to dynamically adjust routing based on global network behavior. This is markedly different from trying to use edge solutions that at best have limited visibility to last-mile ISPs or rely on dated protocols like BGP, which are not aware of actual network conditions.

**Self-Healing by Design**

Cloud-native networks are [resilient by design][7]. We are all familiar with the resiliency of cloud services like Amazon Web Services, Facebook, and Google. We don’t worry about infrastructure resiliency as we expect that the service will be up and running, masking the state of underlying components. Compare this with typical HA configurations of appliances within and across locations, and what it takes to plan, configure, test, and run these environments.

### The Cloud-Native Network Is the Network for All Edges and All Functions

To summarize, the cloud-native network represents a transformation of the legacy IT architecture. Instead of silos, point solutions for emerging requirements like SD-WAN and SDP, and a growing complexity, we must consider a network architecture that will serve the business into the future. By democratizing the network for all edges and delivering network and security functions through a cloud-first/thin-edge design, cloud-native networks are designed to rapidly evolve with the business even as new requirements—and new edges—emerge.

Cato Networks built the world’s first cloud-native network using the global reach, self-service, and scalability of the cloud. To learn more about Cato Networks and the Cato Cloud, visit [here][8].

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3440101/a-network-for-all-edges-why-sd-wan-sdp-and-the-application-edge-must-converge-in-the-cloud.html

作者：[Cato Networks][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Matt-Conran/
[b]: https://github.com/lujun9972
[1]: https://www.catonetworks.com/sd-wan?utm_source=idg
[2]: https://www.catonetworks.com/glossary-use-cases/software-defined-perimeter-sdp/
[3]: https://www.catonetworks.com/news/is-your-network-suffering-from-the-trombone-effect/
[4]: https://www.catonetworks.com/cato-cloud/global-private-backbone-3/#Cloud-native_Software_for_Faster_Innovation_and_Lower_Costs
[5]: https://www.catonetworks.com/cato-cloud
[6]: https://www.catonetworks.com/cato-cloud/enterprise-grade-security-as-a-service-built-directly-into-the-network/
[7]: https://www.catonetworks.com/cato-cloud/global-private-backbone-3/#Self-healing_By_Design_for_24x7_Operation
[8]: http://www.networkworld.com/cms/article/catonetowrks.com/cato-cloud
