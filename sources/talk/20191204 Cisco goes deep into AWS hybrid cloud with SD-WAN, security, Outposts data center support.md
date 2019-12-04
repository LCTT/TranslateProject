[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco goes deep into AWS hybrid cloud with SD-WAN, security, Outposts data center support)
[#]: via: (https://www.networkworld.com/article/3487563/cisco-goes-deep-into-aws-hybrid-cloud-with-sd-wan-security-outposts-data-center-support.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco goes deep into AWS hybrid cloud with SD-WAN, security, Outposts data center support
======
Cisco aims to make it easier to provide consistent network and security polices for multicloud workloads.
Getty Images / motionxcom

Cisco is taking its integration with Amazon Web Services to a new level, announcing plans to integrate its [SD-WAN][1], network services and security wares with the cloud giant's hybrid-cloud environment, including its new Outposts devices. 

Outposts offers AWS-designed hardware that lets customers run compute and storage on premises, while connecting to AWS’s cloud services. Each Outpost has a pair of networking devices, each with 400 Gbps of connectivity and support for 1 GigE, 10 GigE, 40 GigE, and 100 Gigabit fiber connections. AWS announced the general availability of Outposts at its annual [AWS re:Invent][2] symposium, held this week in Las Vegas. 

**More about edge networking:**

  * [How edge networking and IoT will reshape data centers][3]
  * [Edge computing best practices][4]
  * [How edge computing can help secure the IoT][5]



With Outposts customers can use the same programming interface, same APIs, same console and command line interface they use on the AWS cloud for on-premises applications, according to AWS. The company first announced [Outposts][6] at last year’s re:Invent event.

[][7]

BrandPost Sponsored by HPE

[Achieve Compliant, Cost-effective Hybrid Cloud Operations][7]

An expert guide for fine-tuning oversight and operations of hybrid cloud investments.

For Cisco, Outposts is one of the key cloud technologies it has targeted with a variety of new networking and security integration features.

For starters, Cisco is extending its Application Centric Infrastructure (ACI) Anywhere to AWS Outposts. ACI Anywhere lets customers run and control applications anywhere they want across private or public clouds or at the edge while maintaining consistent network and security policies across their entire domain.

ACI Anywhere allows policies configured through Cisco’s SDN Application Policy Infrastructure Controller (APIC) to use native APIs offered by a public-cloud provider to orchestrate changes within both the private and public cloud environments, according to Cisco.

With ACI Anywhere, customers can translate their business intent and policy models into consistent on-premise and cloud-native constructs that are deployed across AWS applications, according to Gupta. Using a common policy model reduces cost and complexity while offering a single management console to configure, monitor, and operate multiple environments spread across data centers and AWS, he said.

"Cisco wants to ensure that it is reducing the complexity of providing consistent network and security polices for multicloud workloads, regardless of whether they reside on-premises or in public clouds such as Amazon," said Brad Casemore, IDC research vice president, Datacenter Networks. "With regard to the public cloud dimension of this challenge, performance is optimized and complexity reduced if Cisco can ensure integration with native Amazon (and other public cloud) APIs." 

### A key move for SD-WAN

Beyond the new ACI Anywhere support, Cisco has extended its SD-WAN technology to manage and automate connectivity between branch offices and the AWS Cloud via the [AWS Transit Gateway][8], which lets customers connect their Amazon Virtual Private Clouds (VPCs) and their on-premises networks to a single gateway.

Customers will be able to apply network segmentation and security policies to cloud traffic flows, and the package will also enable policy exchange between Cisco SD-WAN Controller and AWS Transit Gateway, which will let IT teams implement consistent network and data security rules, said Sachin Gupta, senior vice president, product management, with Cisco Enterprise Networking. And with this integration, IT teams will be able to make changes to connectivity settings in minutes, Gupta said.

Analysts say the SD-WAN integration with services such as AWS is a key move for both companies.

"Think of SD-WAN as addressing the 'last mile' of optimized connectivity requirements for the branch in the cloud era. The last mile is obviously important, but there’s a growing recognition that the 'middle mile' is also important to the successful delivery of cloud applications and workloads," IDC's Casemore said. "This why you’re seeing the likes of AWS and Microsoft Azure partnering and integrating with SD-WAN infrastructure vendors such as Cisco. With these integrations, cloud-destined traffic gets into the cloud network – AWS in this case – faster, improving performance and reducing the latency that can affect cloud workloads."

The third part of the Cisco-AWS integration announcement is related to security.

With Outposts, AWS introduced what it calls Virtual Private Cloud (VPC) [Ingress Routing][9], which is designed to let customers direct traffic to a specific Amazon Elastic Compute Cloud (EC2) instance prior to the traffic reaching business applications. From there, "the instance typically runs network security tools to inspect or to block suspicious network traffic (such as IDS/IPS or firewall) or to perform any other network traffic inspection before relaying the traffic to other [EC2][10] instances," Amazon says.

[Cisco will support AWS VPC Ingress Routing][11] in a variety of ways to include features such as firewall policy enforcement, malware detection, URL filtering and DNS security, the company said.

### Cisco cloud integrations add up

These cloud networking integrations follow other Cisco-AWS tie-ins announced over the past year or so. In April [Cisco released a cloud-service program][12] on its flagship software-defined networking (SDN) software that will let customers manage and secure applications running in the data center or in Amazon Web Services cloud environments. The service, Cisco Cloud ACI for AWS, lets users configure inter-site connectivity, define policies and monitor the health of network infrastructure across hybrid environments, Cisco said.

Cisco Cloud ACI for AWS brings a suite of capabilities to extend customer on-premises data center into true multi-cloud architectures, helping to drive policy and operational consistency, independent of where applications or data reside, Cisco said. The service uses the native AWS constructs for policy translation and gives end-to-end visibility into the customer's multi-cloud workloads and connectivity, Cisco said.

Cisco is also working closely with other cloud giants. [Most recently][13] it extended its relationship with Microsoft Azure to make it easier and more efficient for [SD-WAN customers][1] to set up and run direct Internet access to enterprise applications such as Office 365 and other Azure Cloud services.

Specifically, Cisco said it would integrate its [SD-WAN][1] package with Microsoft’s Azure Virtual WAN and Office365. This amalgamation will let customers extend their [WAN][14] to Microsoft Azure Cloud and, in parallel, deliver optimized, secure Office 365 communications, according to Cisco's Gupta.   

Cisco also has [extended its ACI technology and its ACI Anywhere technology to Azure][15] to help customers grow and control hybrid, multicloud and SD-WAN environments. 

Join the Network World communities on [Facebook][16] and [LinkedIn][17] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3487563/cisco-goes-deep-into-aws-hybrid-cloud-with-sd-wan-security-outposts-data-center-support.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3031279/sd-wan-what-it-is-and-why-you-ll-use-it-one-day.html
[2]: https://aws.amazon.com/outposts/?sc_icampaign=launch-aws-outposts_reinvent19&sc_ichannel=ha&sc_icontent=awssm-3266&sc_iplace=hero&trk=ha_awssm-3266
[3]: https://www.networkworld.com/article/3291790/data-center/how-edge-networking-and-iot-will-reshape-data-centers.html
[4]: https://www.networkworld.com/article/3331978/lan-wan/edge-computing-best-practices.html
[5]: https://www.networkworld.com/article/3331905/internet-of-things/how-edge-computing-can-help-secure-the-iot.html
[6]: https://www.networkworld.com/article/3324043/aws-does-hybrid-cloud-with-on-prem-hardware-vmware-help.html
[7]: https://www.networkworld.com/article/3400740/achieve-compliant-cost-effective-hybrid-cloud-operations.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE19718&utm_content=sidebar (Achieve Compliant, Cost-effective Hybrid Cloud Operations)
[8]: https://aws.amazon.com/transit-gateway/
[9]: https://aws.amazon.com/blogs/aws/new-vpc-ingress-routing-simplifying-integration-of-third-party-appliances/
[10]: https://aws.amazon.com/ec2/
[11]: https://feedly.com/i/entry/qQEZ7AvNCW5MO++95eG+wPiOBUdDkSnCTJkRZA9Z4ro=_16ecd56b470:2c79ff2:49b12733
[12]: https://www.networkworld.com/article/3388679/cisco-taps-into-aws-for-data-center-cloud-applications.html
[13]: https://www.networkworld.com/article/3451818/cisco-forges-tighter-sd-wan-links-to-microsoft-azure-cloud-office-365.html
[14]: https://www.networkworld.com/article/3248989/what-is-a-wan-wide-area-network-definition-and-examples.html
[15]: https://www.networkworld.com/article/3439448/cisco-spreads-aci-to-microsoft-azure-multicloud-and-sd-wan-environments.html
[16]: https://www.facebook.com/NetworkWorld/
[17]: https://www.linkedin.com/company/network-world
