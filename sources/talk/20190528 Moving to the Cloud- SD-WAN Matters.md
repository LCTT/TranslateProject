[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Moving to the Cloud? SD-WAN Matters!)
[#]: via: (https://www.networkworld.com/article/3397921/moving-to-the-cloud-sd-wan-matters.html)
[#]: author: (Rami Rammaha https://www.networkworld.com/author/Rami-Rammaha/)

Moving to the Cloud? SD-WAN Matters!
======

![istock][1]

This is the first in a two-part blog series that will explore how enterprises can realize the full transformation promise of the cloud by shifting to a business first networking model powered by a business-driven [SD-WAN][2]. The focus for this installment will be on automating secure IPsec connectivity and intelligently steering traffic to cloud providers.

Over the past several years we’ve seen a major shift in data center strategies where enterprise IT organizations are shifting applications and workloads to cloud, whether private or public. More and more, enterprises are leveraging software as-a-service (SaaS) applications and infrastructure as-a-service (IaaS) cloud services from leading providers like [Amazon AWS][3], [Google Cloud][4], [Microsoft Azure][5] and [Oracle Cloud Infrastructure][6]. This represents a dramatic shift in enterprise data traffic patterns as fewer and fewer applications are hosted within the walls of the traditional corporate data center.

There are several drivers for the shift to IaaS cloud services and SaaS apps, but business agility tops the list for most enterprises. The traditional IT model for provisioning and deprovisioning applications is rigid and inflexible and is no longer able to keep pace with changing business needs.

According to [LogicMonitor’s Cloud Vision 2020][7] study, more than 80 percent of enterprise workloads will run in the cloud by 2020 with more than 40 percent running on public cloud platforms. This major shift in the application consumption model is having a huge [impact on organizations and infrastructure][8]. A recent article entitled “[How Amazon Web Services is luring banks to the cloud][9],” published by CNBC, reported that some companies already have completely migrated all of their applications and IT workloads to public cloud infrastructures. An interesting fact is that while many enterprises must comply with stringent regulatory compliance mandates such as PCI-DSS or HIPAA, they still have made the move to the cloud. This tells us two things – the maturity of using public cloud services and the trust these organizations have in using them is at an all-time high. Again, it is all about speed and agility – without compromising performance, security and reliability.

### **Is there a direct correlation between moving to the cloud and adopting SD-WAN?**

As the cloud enables businesses to move faster, an SD-WAN architecture where top-down business intent is the driver is critical to ensuring success, especially when branch offices are geographically distributed across the globe. Traditional router-centric WAN architectures were never designed to support today’s cloud consumption model for applications in the most efficient way. With a conventional router-centric WAN approach, access to applications residing in the cloud means traversing unnecessary hops, resulting in wasted bandwidth, additional cost, added latency and potentially higher packet loss. In addition, under the existing, traditional WAN model where management tends to be rigid, complex network changes can be lengthy, whether setting up new branches or troubleshooting performance issues. This leads to inefficiencies and a costly operational model. Therefore, enterprises greatly benefit from taking a business-first WAN approach toward achieving greater agility in addition to realizing substantial CAPEX and OPEX savings.

A business-driven SD-WAN platform is purpose-built to tackle the challenges inherent to the traditional router-centric model and more aptly support today’s cloud consumption model. This means application policies are defined based on business intent, connecting users securely and directly to applications where ever they reside without unnecessary extra hops or security compromises. For example, if the application is hosted in the cloud and is trusted, a business-driven SD-WAN can automatically connect users to it without backhauling traffic to a POP or HQ data center. Now, in general this traffic is usually going across an internet link which, on its own, may not be secure. However, the right SD-WAN platform will have a unified stateful firewall built-in for local internet breakout allowing only branch-initiated sessions to enter the branch and providing the ability to service chain traffic to a cloud-based security service if necessary, before forwarding it to its final destination. If the application is moved and becomes hosted by another provider or perhaps back to a company’s own data center, traffic must be intelligently redirected, wherever the application is being hosted. Without automation and embedded machine learning, dynamic and intelligent traffic steering is impossible.

### **A closer look at how the Silver Peak EdgeConnect™ SD-WAN edge platform addresses these challenges: **

**Automate traffic steering and connectivity to cloud providers**

An [EdgeConnect][10] virtual instance is easily spun up in any of the [leading cloud providers][11] through their respective marketplaces. For an SD-WAN to intelligently steer traffic to its destination, it requires insights into both HTTP and HTTPS traffic; it must be able to identify apps on the first packet received in order to steer traffic to the right destination in accordance with business intent. This is critical capability because once a TCP connection is NAT’d with a public IP address, it cannot be switched thus it can’t be re-routed once a connection is established. So, the ability of EdgeConnect to identify, classify and automatically steer traffic based on the first packet – and not the second or tenth packet – to the correct destination will assure application SLAs, minimize wasting expensive bandwidth and deliver the highest quality of experience.

Another critical capability is automatic performance optimization. Irrespective of which link the traffic ends up traversing based on business intent and the unique requirements of the application, EdgeConnect automatically optimizes application performance without human intervention by correcting for out of order packets using Packet Order Correction (POC) or even under high latency conditions that can be related to distance or other issues. This is done using adaptive Forward Error Correction (FEC) and tunnel bonding where a virtual tunnel is created, resulting in a single logical overlay that traffic can be dynamically moved between the different paths as conditions change with each underlay WAN service. In this [lightboard video][12], Dinesh Fernando, a technical marketing engineer at Silver Peak, explains how EdgeConnect automates tunnel creation between sites and cloud providers, how it simplifies data transfers between multi-clouds, and how it improves application performance.

If your business is global and increasingly dependent on the cloud, the business-driven EdgeConnect SD-WAN edge platform enables seamless multi-cloud connectivity, turning the network into a business accelerant. EdgeConnect delivers:

  1. A consistent deployment from the branch to the cloud, extending the reach of the SD-WAN into virtual private cloud environments
  2. Multi-cloud flexibility, making it easier to initiate and distribute resources across multiple cloud providers
  3. Investment protection by confidently migrating on premise IT resources to any combination of the leading public cloud platforms, knowing their cloud-hosted instances will be fully supported by EdgeConnect



--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3397921/moving-to-the-cloud-sd-wan-matters.html

作者：[Rami Rammaha][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Rami-Rammaha/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/05/istock-899678028-100797709-large.jpg
[2]: https://www.silver-peak.com/sd-wan/sd-wan-explained
[3]: https://www.silver-peak.com/company/tech-partners/cloud/aws
[4]: https://www.silver-peak.com/company/tech-partners/cloud/google-cloud
[5]: https://www.silver-peak.com/company/tech-partners/cloud/microsoft-azure
[6]: https://www.silver-peak.com/company/tech-partners/cloud/oracle-cloud
[7]: https://www.logicmonitor.com/resource/the-future-of-the-cloud-a-cloud-influencers-survey/?utm_medium=pr&utm_source=businesswire&utm_campaign=cloudsurvey
[8]: http://www.networkworld.com/article/3152024/lan-wan/in-the-age-of-digital-transformation-why-sd-wan-plays-a-key-role-in-the-transition.html
[9]: http://www.cnbc.com/2016/11/30/how-amazon-web-services-is-luring-banks-to-the-cloud.html?__source=yahoo%257cfinance%257cheadline%257cheadline%257cstory&par=yahoo&doc=104135637
[10]: https://www.silver-peak.com/products/unity-edge-connect
[11]: https://www.silver-peak.com/company/tech-partners?strategic_partner_type=69
[12]: https://www.silver-peak.com/resource-center/automate-connectivity-to-cloud-networking-with-sd-wan
