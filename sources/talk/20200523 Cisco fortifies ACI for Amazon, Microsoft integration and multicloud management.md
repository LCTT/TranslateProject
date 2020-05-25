[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco fortifies ACI for Amazon, Microsoft integration and multicloud management)
[#]: via: (https://www.networkworld.com/article/3545396/cisco-fortifies-aci-for-amazon-microsoft-integration-and-multicloud-management.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco fortifies ACI for Amazon, Microsoft integration and multicloud management
======
Cisco's Application Centric Infrastructure 5.0 software targets large scale data center cloud networks
Cisco has upgraded its core networking software to include better support for enterprise multicloud integration and management as well as tools to help telcos or hyperscalers tie together large scale data-center networks.

The new features are part of the [5.0 release][1] of Cisco's Application Centric Infrastructure (ACI) software, which runs on the company's core data center Nexus 9000 systems.

**READ MORE:** [Are new Cisco certs too much? Network pros react][2]

ACI is Cisco's flagship [software-defined networking][3] (SDN) data-center package. It also delivers the company's intent-based networking technology, which lets customers automatically implement network and policy changes on the fly and ensure data delivery. 

Over time, Cisco has extended ACI through its ACI Anywhere package – which includes other extensions, such as Cloud ACI – that gives customers the flexibility to run and control applications anywhere they want across data centers, private or public clouds, or at the edge while maintaining consistent network and security policies across their entire domain.

For example, Cisco says ACI Anywhere would let policies configured through Cisco's SDN Application Policy Infrastructure Controller (APIC) use native APIs offered by a public-cloud provider to orchestrate changes within both the private and public cloud environments. Cisco Multisite Orchestrator then helps provision and manage the implementation across multiple sites and services, the vendor stated.

ACI 5.0 continues the ACI Anywhere and Cloud ACI expansion to now include support for Amazon Web Services Transit Gateway (TGW). Cisco promises future support for Microsoft Azure cloud peering. The TGW is a central component of Amazon's Outpost platform, which lets customers connect their Amazon Virtual Private Clouds (VPC) and their on-premises networks to a single gateway.

With ACI 5.0, customers can now automatically set up, provision and manage workloads across VPCs linked with Cisco ACI. 

"It brings automated route-programming on TGW route-tables for all combinations of East-West and North-South traffic patterns," said Srini Kotamraju, senior director of product management in Cisco's data center business group.

ACI 5.0 continues work Cisco has been doing to support the AWS cloud world. For example, in [December Cisco extended its SD-WAN][4] technology to manage and automate connectivity between branch offices and the AWS Cloud via the TGW. With that support, customers will be able to apply network segmentation and security policies to cloud traffic flows, and the package will also enable policy exchange between Cisco's SD-WAN Controller and TGW, which will enable IT teams to implement consistent SD-WAN and data security rules.

Cisco is also working closely with other cloud titans, and ACI 5.0 bolsters support for another frequent partner, Microsoft. In ACI 5.0, customers will be able to set up Azure Virtual Network (vNet) peering that lets customers connect two vNets in the same region through the Azure backbone network. **
**

Peering lets the combined networks appear and be controlled as a single entity within the Azure Virtual Network, while using the Azure backbone for low-latency, high bandwidth interconnects between virtual networks, Kotamraju said.

In other Azure work, Cisco [recently][5] extended its relationship with Microsoft Azure to make it easier and more efficient for [SD-WAN customers][6] to set up and run direct Internet access to enterprise applications such as Office 365 and other Azure Cloud services. This amalgamation will let customers extend their [WAN][7] to Microsoft Azure Cloud and, in parallel, deliver optimized, secure Office 365 communications, according to Cisco.

In addition to extending ACI to cloud resources, ACI 5.0 also extends its reach into telco or hyperscaler environments. For example, service providers can now interconnect their ACI-based telco cloud to a 5G transport backbone network with end-to-end segmentation, Kotamraju said. 

"5G transformations are challenging the telecom providers to develop the data center networks of the future, which should seamlessly scale, automate and integrate their infrastructure from the edge to the central data center and across the transport network," Kotamraju said.

[Ultimately, ACI 5.0 further simplifies][8] the way enterprise customers can implement and consume cloud resources on premise no matter where they are located, Kotamraju said.

Along with the ACI features, Cisco bolstered its Network Insights application to help customers manage multicloud environments.

[Network Insights][9] is software Cisco data-center customers use to monitor and record hardware and software telemetry data over time to identify anomalies in the fabric and help automate troubleshooting, root-cause analysis, capacity planning and remediation, according to Cisco. For example, Network Insights can watch over network component usage patterns and audit logs, events, and faults as well as latency conditions from ACI.

The new release supports improved management of geographically distributed multiple fabrics with a single instance of Network Insights. It also ties into Cisco’s AppDynamics to help customers detect, locate and troubleshoot application connectivity issues faster, by correlating network and application telemetry, Cisco stated. 

"Basically we only supported one fabric in the past, but now Network Insights can manage multiple fabrics from one place. And with the AppDynamics integrations, customers can quickly find out whether or not they have an application problem or a capacity issue," Kotamraju said.

Join the Network World communities on [Facebook][10] and [LinkedIn][11] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3545396/cisco-fortifies-aci-for-amazon-microsoft-integration-and-multicloud-management.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://blogs.cisco.com/datacenter/cisco-application-centric-infrastructure-cisco-aci-5-0-for-the-changing-world
[2]: https://www.networkworld.com/article/3446044/network-pros-react-to-new-cisco-certification-curriculum.html
[3]: https://www.networkworld.com/article/3209131/what-sdn-is-and-where-its-going.html
[4]: https://www.networkworld.com/article/3487563/cisco-goes-deep-into-aws-hybrid-cloud-with-sd-wan-security-outposts-data-center-support.html
[5]: https://www.networkworld.com/article/3451818/cisco-forges-tighter-sd-wan-links-to-microsoft-azure-cloud-office-365.html
[6]: https://www.networkworld.com/article/3031279/sd-wan-what-it-is-and-why-you-ll-use-it-one-day.html
[7]: https://www.networkworld.com/article/3248989/what-is-a-wan-wide-area-network-definition-and-examples.html
[8]: https://www.networkworld.com/article/3487831/what-s-hot-for-cisco-in-2020.html
[9]: https://www.cisco.com/c/en/us/products/collateral/data-center-analytics/network-insights-resources/datasheet-c78-742022.html#Productoverview
[10]: https://www.facebook.com/NetworkWorld/
[11]: https://www.linkedin.com/company/network-world
