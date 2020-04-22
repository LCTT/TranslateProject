[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco integrates SD-WAN connectivity with Google Cloud)
[#]: via: (https://www.networkworld.com/article/3539252/cisco-integrates-sd-wan-connectivity-with-google-cloud.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco integrates SD-WAN connectivity with Google Cloud
======
A new, joint Cisco and Google platform integrates Cisco's SD-WAN connectivity with applications on Google Cloud
sd-wan

Cisco and Google deepened their relationship this week by rolling out a turnkey package that lets customers tightly mesh [SD-WAN][1] connectivity with applications running in a private [data center][2], Google Cloud or another cloud or SaaS application.

The jointly developed platform, called Cisco SD-WAN Cloud Hub with Google Cloud, combines Cisco’s SD-WAN policy-, telemetry- and security-setting capabilities with Google's software-defined backbone to ensure that application service-level agreement, security and compliance policies are extended across the network.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][3]

“For customers looking to support multiple clouds while preserving on-prem data centers, this is how they can effectively connect all their sites,” said Sachin Gupta, senior vice president of product management with Cisco’s Intent Based Networking Group. “The integration will extend into hybrid and multi-cloud environments, like Anthos, Google Cloud’s open application platform, supporting the optimization of distributed, multicloud microservice-based applications,” he said.

The Cisco SD-WAN Cloud Hub with Google Cloud enables a number of capabilities. For example, applications typically do not have a way to dynamically signal SLA requests to the underlying network, Gupta wrote in a [blog][4] detailing the integration. “With this new integration*,* applications will be able to dynamically request the required network resources by publishing application data in Google Cloud Service Directory. The network will be able to use this data to provision itself for the appropriate SD-WAN policies.”

A business-critical application that needs low-latency would have that requirement in its Google Cloud Service Directory entry. The appropriate SD-WAN policies would then be applied on the network. Likewise, as Cisco’s SD-WAN controller, vManage, monitors network performance and service health metrics, it could intelligently direct user requests to the most optimal cloud service nodes, Gupta stated.

The platform also has the ability to divert traffic automatically to more highly available or better performing links should latency-sensitive applications require it. With network reachability metrics from Cisco SD-WAN, Google Anthos can make real-time decisions to divert traffic to regions with better network reachability, Gupta stated.

With Cisco SD-WAN Cloud Hub for Google cloud, customers can extend the single point of orchestration and management for their SD-WAN network to include the underlay offered by Google Cloud backbone. Using Cisco Cloud Hub, policies can be extended into the cloud to authorize access to cloud applications based on user identity, Gupta stated.

[][5]

“We think this platform offers a simple and consistent way for IT to handle complex applications running on-premises or in multiple clouds in multiple locations,” said Shailesh Shukla, vice president of products and general manager of networking for Google Cloud. “With the automation, telemetry, integrated security we can offer in one platform, we remove many of the barriers to cloud adoption.”

Shukla wrote in a [blog][6] that in most cases, customer traffic enters Google’s network directly from their last mile provider and stays on Google’s network while it traverses the globe. “Combining Cisco’s advanced SD-WAN capabilities with Google's software-defined backbone, customers get an end-to-end network that not only optimizes connectivity between branches, stores and to the cloud, but also provides telemetry for troubleshooting and diagnostic purposes,” he stated.

Automated application and path-aware routing takes the complexity out of mapping business services to the appropriate network, Shukla stated.  “The Cisco SD-WAN Cloud Hub with Google Cloud solution allows customers to publish all of their services in a single place with the ability to define the intent of how the network should treat those services in an automated fashion, reducing time to onboard new services on to the network,” Shukla stated.   

The Cisco/Google platform is important because [software- and infrastructure-as-a-service (SaaS and IaaS) offerings][7] have been driving SD-WAN implementations in the past year, experts say.

“One of the key drivers of SD-WAN has been the increasing consumption of cloud services in the enterprise, across both IaaS and SaaS applications,”  said Rohit Mehra, vice president, network infrastructure at  IDC. “With some of the largest [public cloud][8] providers playing an increasing role in how these enterprise apps are consumed and delivered, and bringing their vast global networks to bear, they will increasingly have a role to play with how [WANs][9] are architected going forward.”

For enterprises, one of the key takeaways from this announcement is that “SD-WANs will now be able to play a better functional role in the delivery of cloud services such as IaaS and SaaS, and likewise, the large public-cloud purveyors will benefit from providing a stronger value proposition towards [multi-cloud][10] deployments,” Mehra said. "Secondly, enterprises will benefit in terms of extending policy and governance beyond applications to other attributes such as locations/geo and multiple clouds.”

Cisco and Google have been working closely together since October 2017, when the companies said they were working on an open hybrid-cloud platform that bridges on-premises and cloud environments. That package, [Cisco Hybrid Cloud Platform for Google Cloud][11], which has been available since 2018, lets customer develop enterprise-grade capabilities from Google Cloud-managed Kubernetes containers that include Cisco networking and security technology as well as service mesh monitoring from Istio.

Last year Cisco and Google expanded their joint cloud-development activities to help customers more easily build secure multi-cloud and hybrid-cloud applications everywhere from on-premises data centers to public clouds.

That expansion centered around Google’s hybrid-cloud package Anthos.  Anthos will let customers run applications, unmodified, on existing on-premises hardware or in the public cloud and will be available on [Google Cloud Platform][12] (GCP) with [Google Kubernetes Engine][13] (GKE), and in data centers with [GKE On-Prem][14], the company says. Anthos will also let customers for the first time manage workloads running on third-party clouds such as AWS and Azure from the Google platform without requiring administrators and developers to learn different environments and APIs, Google said. 

Cisco announced support of Anthos and promised to integrate it with Cisco data-center technologies, such as its HyperFlex hyperconverged package, Application Centric Infrastructure (Cisco’s flagship SDN offering), SD-WAN and Stealthwatch Cloud. The integrations will enable a consistent, cloud-like experience whether on-prem or in the cloud with automatic upgrades to the latest versions and security patches, Cisco stated.

Cisco and Google Cloud intend to invite select customers to participate in trials of the technology by the end of 2020. General availability is planned for the first half of 2021, Cisco stated.

“This kind of technology integration, such as the one Cisco and Google have announced, ultimately benefits enterprise IT as a whole, and we should expect similar such partnerships across the industry,” Mehra added.

Join the Network World communities on [Facebook][15] and [LinkedIn][16] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3539252/cisco-integrates-sd-wan-connectivity-with-google-cloud.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3031279/sd-wan-what-it-is-and-why-you-ll-use-it-one-day.html
[2]: https://www.networkworld.com/article/3223692/what-is-a-data-centerhow-its-changed-and-what-you-need-to-know.html
[3]: https://www.networkworld.com/newsletters/signup.html
[4]: https://blogs.cisco.com/networking/cisco-and-google-partner-on-cisco-sd-wan-cloud-hub-with-google-cloud
[5]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE22140&utm_content=sidebar (ITAAS and Corporate Storage Strategy)
[6]: https://cloud.google.com/blog/topics/partners/introducing-cisco-sd-wan-cloud-hub-with-google-cloud
[7]: https://www.networkworld.com/article/3527194/multicloud-security-integration-drive-massive-sd-wan-adoption.html
[8]: https://www.networkworld.com/article/3400872/uptick-in-cloud-repatriation-fuels-rise-of-hybrid-cloud.html
[9]: https://www.networkworld.com/article/3248989/what-is-a-wan-wide-area-network-definition-and-examples.html
[10]: https://www.networkworld.com/article/3429258/real-world-tools-for-multi-cloud-management.html
[11]: https://cloud.google.com/cisco/
[12]: https://cloud.google.com/
[13]: https://cloud.google.com/kubernetes-engine/
[14]: https://cloud.google.com/gke-on-prem/
[15]: https://www.facebook.com/NetworkWorld/
[16]: https://www.linkedin.com/company/network-world
