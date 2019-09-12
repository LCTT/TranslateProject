[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (VMware boosts load balancing, security intelligence, analytics)
[#]: via: (https://www.networkworld.com/article/3434576/vmware-boosts-load-balancing-security-intelligence-analytics.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

VMware boosts load balancing, security intelligence, analytics
======
At VMworld, VMware says its NSX networking software looks to help customers boost performance, management of virtualized cloud resources.
![Thinkstock][1]

SAN FRANCISCO – VMware has added new features to its core networking software that will let customers more securely control cloud application traffic running on virtual machines, containers or bare metal. 

At its VMworld event, the company announced a new version of the company’s NSX networking software with support for the cloud-based advanced load balancer technology it recently acquired from Avi Networks.

**[ Also see [How to plan a software-defined data-center network][2] and [Efficient container use requires data-center software networking][3].]**

The load balancer is included in VMware vRealize Network Insight 5.0 and tied to NSX Intelligence software that lets customers optimize network performance and availability in virtual and physical networks. The load balancer includes a web application firewall and analytics features to help customers securely control and manage traffic. 

[VMware bought Avi in June][4] with the plan to punch up its data-center network-virtualization capabilities by adding Avi’s load balancing, analytics and application-delivery technology to NSX. Avi’s integration with VMware NSX delivers an application-services fabric that synchronizes with the NSX controller to provide automated, elastic load balancing including real-time analytics for applications deployed in a software-defined network environment. The Avi technology also monitors, scales and reconfigures application services in real time in response to changing performance requirements.

“The load balancer uses a modern interface and architecture to deliver and optimize application delivery in a dynamic fashion," said Rohit Mehra, vice president, Network Infrastructure for IDC. "Leveraging inbuilt advanced analytics and monitoring to deliver scale that is much needed for cloud applications and micro-services, the advanced load balancer will essentially be a nice add-on option to VMware’s NSX networking portfolio. While many customers may benefit from its integration into NSX, VMware will likely keep it as an optional add-on, given the vast majority of its networking clients currently use other ADC platforms.”

NSX-T Data Center software is targeted at organizations looking to support multivendor cloud-native applications, [bare-metal][5] workloads, [hypervisor][6] environments and the growing hybrid and multi-cloud worlds. The software offers a range of services layer 2 to Layer 7 for workloads running on all types of infrastructure – virtual machines, containers, physical servers and both private and public clouds. NSX-T is the underpinning technology for VMware’s overarching Virtual Cloud Network portfolio that offers a communications-software layer to connect everything from the data center to cloud and edge.

“NSX now provides a complete set of networking services offered in software. Customers don’t need dedicated hardware systems to do switching, routing or traffic load balancing as NSX treats VM, container and app traffic all the same from the cloud to data center and network edge,” said Tom Gillis, VMware senior vice president and general manager, networking and security business unit. 

Now customers can distribute workloads uniformly across network improving capacity, efficiency and reliability, he said.

Speaking at the event, a VMware customer said VMware NSX-T Data Center is helping the company secure workloads at a granular level with micro-segmentation, and to fundamentally re-think network design. "We are looking to develop apps as quickly as possible and use NSX to do automation and move faster,” said [Andrew Hrycaj][7], principal network engineer at IHS Markit – a business information provider headquartered in London.

NSX also helps IT manage a common security policy across different platforms, from containers, to the public cloud with AWS and Azure, to on-prem, simplifying operations and helping with regulatory compliance, while fostering a pervasive security strategy, Hrycaj said.

At VMworld the company announced version 2.5 of NSX which includes a distributed  \analytics engine called NSX Intelligence that VMware says will help eliminate blind spots to reduce security risk and accelerate security-incident remediation through visualization and deep insight into every flow across the entire data center.

“Traditional approaches involve sending extensive packet data and telemetry to multiple disparate centralized engines for analysis, which increase cost, operational complexity, and limit the depth of analytics,” wrote VMware’s Umesh Mahajan, a senior vice president and general manager networking and security in a [blog about version 2.5][8].

“In contrast, NSX Intelligence, built natively within the NSX platform, distributes the analytics within the hypervisor on each host, sending back relevant metadata… [and providing] detailed application--topology visualization, automated security-policy recommendations, continuous monitoring of every flow, and an audit trail of security policies, all built into the NSX management console.”

IDC’s Mehra said: “The NSX Intelligence functionality is indeed very interesting, in that it delivers on the emerging need for deeper visibility and analytics capabilities in cloud IT environments. This can then be used either for network and app optimization goals, or in many cases, will facilitate NSX security and policy enforcement via micro-segmentation and other tools. This functionality, built into NSX, runs parallel to vRealize Network Insight, so it will be interesting to see how they mirror, or rather, complement each other,” he said.

NSX-T 2.5, also introduces a new deployment and operational approach VMware calls Native Cloud Enforced mode.

“This mode provides a consistent policy model across the hybrid cloud network and reduces overhead by eliminating the need to install NSX tools in workload VMs in the public cloud,” Mahajan wrote. “The NSX security policies are translated into the cloud provider’s native security constructs via APIs, enabling common and centralized policy enforcement across clouds.”

Networking software vendor Apstra got into the NSX act by announcing it had more deeply integrated the Apstra Operating System (AOS) with NSX. 

AOS includes a tighter design and operational interoperability between the underlying physical network and software-defined overlay networks with a solution that liberates customers from being locked into any specific network hardware vendor, said Mansour Karam, CEO and founder of Apstra. 

AOS 3.1 adds automation to provide consistent network and security policy for workloads across the physical and virtual/NSX infrastructure, Apstra said. AOS supports VMware vSphere and allows for automatic remediation of network anomalies. AOS’ intent-based analytics perform regular  network checks to safeguard configurations between the Apstra managed environment and the vSphere servers are in sync.

Like other AOS releases, version 3.1 is hardware agnostic and integrated with other networking vendors including Cisco, Arista, Dell and Juniper as well as other vendors such as Microsoft and Cumulus.

Big Switch also announced that it has extended its Enterprise Virtual Private Cloud (E-VPC) integration to the VMware Cloud Foundation (VCF) and NSX-T.   The company's  Big Cloud Fabric (BCF) underlay now fully integrates with VMware’s software-defined data center (SDDC) portfolio, including NSX-T, vSphere, VxRail and vSAN, providing unmatched automation, visibility and troubleshooting capabilities.

Join the Network World communities on [Facebook][9] and [LinkedIn][10] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3434576/vmware-boosts-load-balancing-security-intelligence-analytics.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2017/09/networking-100735059-large.jpg
[2]: https://www.networkworld.com/article/3284352/data-center/how-to-plan-a-software-defined-data-center-network.html
[3]: https://www.networkworld.com/article/3297379/data-center/efficient-container-use-requires-data-center-software-networking.html
[4]: https://www.networkworld.com/article/3402981/vmware-eyes-avi-networks-for-data-center-software.html
[5]: https://www.networkworld.com/article/3261113/why-a-bare-metal-cloud-provider-might-be-just-what-you-need.html?nsdr=true
[6]: https://www.networkworld.com/article/3243262/what-is-a-hypervisor.html?nsdr=true
[7]: https://www.networkworld.com/article/3223189/how-network-automation-can-speed-deployments-and-improve-security.html
[8]: https://blogs.vmware.com/networkvirtualization/2019/08/nsx-t-2-5.html/
[9]: https://www.facebook.com/NetworkWorld/
[10]: https://www.linkedin.com/company/network-world
