[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Arista targets cloud networking with CloudEOS software)
[#]: via: (https://www.networkworld.com/article/3452357/arista-targets-cloud-networking-with-cloudeos-software-packages.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Arista targets cloud networking with CloudEOS software
======
Two new Arista software packages address connectivity issues between public and private clouds, create instances of its Cloud EOS in a Kubernetes container.
Stephen Lawson/IDGNS

Arista this week rolled out software it hopes will help customers more easily fuse enterprise-class networking with on-premises and [hybrid-cloud][1] services.

The company rolled out two new packages. One, CloudEOS Multi Cloud, normalizes the network connectivity to and between [private clouds][2] or public clouds. The package sets up a [virtual machine][3] and can redirect traffic across the most effective and efficient networking path using real-time topology, in-band telemetry and other attributes, the company said. It also automatically encrypts all traffic on those paths as well. 

[Network pros react to new Cisco certification curriculum][4]

The second package, CloudEOS Cloud Native, lets customers set up an instance of the network operating system as a Kubernetes container offering a fully supported, enterprise-class networking stack within Cloud Native environments.

[][5]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][5]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

CloudEOS can be set up and managed through Arista’s [CloudVision][6] management software that provides network-wide visibility, orchestration, provisioning and telemetry across the [data center][7] and campus.

CloudVision’s network information can be utilized by other Arista networking partners such as VMware, Microsoft and IBM’s Red Hat.

Advertisement

Both CloudEOS packages are meant to simplify cloud networking and let customers build and deploy applications faster, the company said. 

“With CloudEOS we want to enable the DevOps teams to use the tools they are familiar with, add and scale and adjust their compute and storage and cloud service requirements in a rapid-fire and dynamic environment as fast as possible,” said [Douglas Gourlay][8], vice president and general manager of cloud networking software at Arista.

“We also want the networking team to have the confidence to know that the guardrails are in place – the [CIDR block][9] for the ERP system won’t get accidentally duplicated, that someone can’t connect an external test segment to a production data store in the enterprise, and that critical changes and deployments to production segments may require a code review in the network, too, before they are deployed into production.”

In order to bring the DevOps strategy to CloudEOS, the packages feature a variety of Site Reliability Engineering (SRE) and DevOps provisioning tools such as Hashicorp’s Terraform and other standards-supported software technologies such a as border gateway protocol ([BGP][10]), Ethernet VPN (EVPN) , Virtual Extensible LAN (XLAN), IPSEC, and network management protocols such as [gNMI/gRPC][11].

CloudEOS enables, in about a half-dozen lines of simple code, the provisioning of an entire multi-cloud network, Gourlay said.  The idea is to simplify operations by offering the same tools on physical and virtual networks, so network operations teams can use the same software to manage both, Gourlay said.

CloudEOS supports a [network-segmentation][12] mode that extends the reach of network segmentation from the campus to the data center to the public cloud and each CloudEOS instance – whether deployed in the public cloud to connect virtual private clouds, at the edge of the public cloud to allocate bandwidth across critical links or deployed into a Kubernetes host – enables a consistent network operating model, Arista said.

Arista is the latest networking vendor to extend major support to the cloud.

Most recently, [Cisco and Microsoft extended their relationship][13] to make it easier and more efficient for [SD-WAN][14] customers to set up and run direct Internet access to enterprise applications such as Office 365 and other Azure Cloud services. In September [Cisco extended its Application Centric Infrastructure (ACI) technology and its ACI Anywhere technology to Azure][15] to help customers grow and control hybrid, multicloud and SD-WAN environments. Cisco has done similar work with [Amazon Web Services][16] and others.

VMware also extended its relationship with Microsoft this week with the expansion of the Azure VMware Solutions hybrid-cloud service, with new advanced cloud migration capabilities delivered through VMware Hybrid Cloud Extension (HCX) application-mobility software.

VMware also has a hybrid-cloud partnership with Microsoft’s Azure cloud service.  That package, called Azure VMware Solutions is built on VMware Cloud Foundation, which  is a packaging of the company’s traditional compute virtualization software vSphere with its NSX network virtualization product and its VSAN software-defined storage area network product.

VMware too has a [tight integration with AWS][17] and other cloud players.

Other vendors have joined the fray as well. [Juniper][18] earlier this year took the wraps off a Contrail  cloud-based SD-WAN service it says will ease the management and bolster the security of wired and wireless-connected branch office networks.  And [Extreme Networks][19] recently rolled out its ExtremeCloud IQ cloud-management application that it says uses machine learning and artificial intelligence and can be deployed in public or private clouds and/or on-premises to provide enterprises with network information and automation.

CloudEOS is available on Amazon Web Services and Microsoft Azure immediately and on Google Cloud within the next quarter, Arista said. CloudVision 2019 is available now.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][20]

Join the Network World communities on [Facebook][21] and [LinkedIn][22] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3452357/arista-targets-cloud-networking-with-cloudeos-software-packages.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3268448/what-is-hybrid-cloud-really-and-whats-the-best-strategy.html
[2]: https://www.networkworld.com/article/2159885/cloud-computing-gartner-5-things-a-private-cloud-is-not.html
[3]: https://www.networkworld.com/article/3234795/what-is-virtualization-definition-virtual-machine-hypervisor.html
[4]: https://www.networkworld.com/article/3446044/network-pros-react-to-new-cisco-certification-curriculum.html
[5]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[6]: https://blogs.arista.com/blog/cloudvision-cognitive-management-plane
[7]: https://www.networkworld.com/article/3223692/what-is-a-data-centerhow-its-changed-and-what-you-need-to-know.html
[8]: https://blogs.arista.com/blog/delivering-multi-cloud-and-cloud-native-operator-experience
[9]: https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing
[10]: https://searchnetworking.techtarget.com/definition/BGP-Border-Gateway-Protocol
[11]: https://datatracker.ietf.org/meeting/98/materials/slides-98-rtgwg-gnmi-intro-draft-openconfig-rtgwg-gnmi-spec-00
[12]: https://www.networkworld.com/article/3247672/what-is-microsegmentation-how-getting-granular-improves-network-security.html
[13]: https://www.networkworld.com/article/3451818/cisco-forges-tighter-sd-wan-links-to-microsoft-azure-cloud-office-365.html
[14]: https://www.networkworld.com/article/3031279/sd-wan-what-it-is-and-why-you-ll-use-it-one-day.html
[15]: https://www.networkworld.com/article/3439448/cisco-spreads-aci-to-microsoft-azure-multicloud-and-sd-wan-environments.html
[16]: https://www.networkworld.com/article/3388679/cisco-taps-into-aws-for-data-center-cloud-applications.html
[17]: https://www.networkworld.com/article/3324043/aws-does-hybrid-cloud-with-on-prem-hardware-vmware-help.html
[18]: https://www.networkworld.com/article/3388030/juniper-opens-sd-wan-service-for-the-cloud.html
[19]: https://www.networkworld.com/article/3405440/extreme-targets-cloud-services-sd-wan-wifi-6-with-210m-aerohive-grab.html
[20]: https://www.networkworld.com/newsletters/signup.html
[21]: https://www.facebook.com/NetworkWorld/
[22]: https://www.linkedin.com/company/network-world
