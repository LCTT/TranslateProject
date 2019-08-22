[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Big Switch targets shadow IT, hybrid cloud growth with fortified software family)
[#]: via: (https://www.networkworld.com/article/3433179/big-switch-targets-shadow-it-hybrid-cloud-growth-with-fortified-software-family.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Big Switch targets shadow IT, hybrid cloud growth with fortified software family
======
Big Switch joins Cisco, VMware, Juniper and others in simplifying data center, hybrid-cloud integration
![artisteer / Getty Images][1]

Big Switch has rolled a variety of new software packages aimed at simplifying customer networks and helping them manage on-premises and hybrid-cloud [data-center][2] growth.

The products include a version of its Big Cloud Fabric (BCF) for Amazon Web Services virtual private cloud  (VPC) management, adding support for Global VPCs (G-VPCs), and a cloud-based version of its Multi-Cloud Director (MCD).  VPCs provide the on-demand access to a pool of shared cloud-computing resources.

**[ Also see [How to plan a software-defined data-center network][3] and [Efficient container use requires data-center software networking][4].]**

Big Switch’s flagship BCF software lets customers manage physical switches as a single fabric that includes security, automation, orchestration and analytics. BCF can run on a variety of certified switches from Dell EMC, HPE and others. In addition, BCF Controller natively supports integration with various Cloud Management Platforms such as VMware (vSphere, NSX Manager, vSAN) and OpenStack. BCF also supports container orchestrators such as Kubernetes, all via a single interface. 

“We believe that traditional networking is complicated but that networking in the cloud is easier using technology such as VPCs, and what we are doing is bringing cloud-networking principles to on-prem and the data center,” said Prashant Gandhi, chief product officer for Big Switch.

With BCF for AWS customers can  discover, determine configurations and troubleshoot all VPCs and workloads configured in AWS, Gandhi said.   

“One of the benefits to BCF for AWS is that many customers deploying workloads in clouds don’t know everything that’s being run or shared in the cloud – we can discover those [shadow IT][5] networks and help IT get a handle on them,” Gandhi said. “We are not looking to be combative nor eliminate shadow IT systems. Rather we are looking to help customers flag them and ensure governance and policies are being properly deployed.”

In addition, Gandhi said Big Switch expects to support AWS extensions such as its [Outposts service][6] announced last November. AWS Outposts ties together AWS and VMware technology to help customers build and support [hybrid clouds][7].

The service lets users choose between on-premises servers and storage, which they can order in quarter, half and full rack units. Outposts can be upgraded with the latest hardware and next-generation instances to run all native AWS and VMware applications, [AWS stated][8].

A second version, VMware Cloud on AWS Outposts, lets customers use the VMware control plane and APIs to run the hybrid environment.

With BCF for AWS, IT would be able to manage Outposts’ VPCs and extend IT governance. BCF for AWS is available on the [AWS Marketplace][9]. A free version with basic support is available along with a more advanced paid edition.

Taking the idea behind VPCs further, added support for what it calls a Global VPCs (G-VPCs). “Inspired by Google Cloud’s globally-relevant VPC, BCF extends the G-VPC across data centers, edge clouds and multiple public clouds,” Big Switch stated.   

G-VPCs fully abstract the underlying infrastructure and provide a single API interface to globally deploy and manage hybrid-cloud services. Enterprises benefit greatly from G-VPCs because they can instantiate tenants across hybrid cloud, regardless of underlying network variations, Gandhi stated.

G-VPC is an expansion of Big Switch’s Enterprise VPC (E-VPC) which provides connectivity in on-prem or data-center cloud services but not across hybrid-cloud environments.

Big Switch also said it was integrating the open source [Terraform ][10]cloud-automation tool to increase the deployment of VPCs and G-VPCs across customer hybrid clouds.

Gandhi said the extension will help customers manage hybrid-cloud environments by allowing them to be connected globally. “Google Cloud has  VPC implemented globally – public clouds usually have different regions and VPCs are local – but G-VPC will let our customers have a logical connection across public and on-prem workloads letting them have a single dashboard controlling security and troubleshooting.”

The company also announced a cloud-based service version of its Multi-Cloud Director-Cloud Service (MCD-CS). MCD is already available for on-prem. The cloud version of the system lets customers manage all BCF implementations from one place. For example, customers can now handle capacity planning, generate automatic security alerts and schedule upgrades all from a single location, the company stated. 

With these announcements Big Switch is trying to speak to the customer problem of addressing data-center networking in a world increasingly defined by multicloud, said Brad Casemore, IDC research vice president, Data Center Networks.

“As cloud becomes not only a destination for workloads but also an operating model, and as enterprises embrace multicloud, the data center is no longer an on-premises entity. Instead, it’s increasingly distributed, not only on-premises, but also at [colocation facilities][11] and multiple public clouds," he said. "In redrawing the boundaries of the datacenter, cloud has also redefined the data center network. And network operators need to get their arms around it.”

This is why [Cisco][12], [VMware][13], [Juniper][14], Big Switch and others are extending their [data-center SDN platforms][15] to provide consistent network and security policies across distributed multicloud environments, Casemore said. 

“It’s also why you’re seeing these vendors put so much emphasis on the mitigation of complexity,” Casemore said.  “Multicloud, and networking for multicloud, is inherently complex, and enterprises need to find solutions that simplify the challenge. After all, complexity is the enemy of agility.”

Join the Network World communities on [Facebook][16] and [LinkedIn][17] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3433179/big-switch-targets-shadow-it-hybrid-cloud-growth-with-fortified-software-family.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/05/cso_data_center_server_racks_connections_by_artisteer_gettyimages-1024648160_3x2_2400x1600-100796532-large.jpg
[2]: https://www.networkworld.com/article/3223692/what-is-a-data-centerhow-its-changed-and-what-you-need-to-know.html
[3]: https://www.networkworld.com/article/3284352/data-center/how-to-plan-a-software-defined-data-center-network.html
[4]: https://www.networkworld.com/article/3297379/data-center/efficient-container-use-requires-data-center-software-networking.html
[5]: https://www.networkworld.com/article/3185284/the-real-reason-shadow-it-is-so-widespread.html
[6]: https://www.networkworld.com/article/3324043/aws-does-hybrid-cloud-with-on-prem-hardware-vmware-help.html
[7]: https://www.networkworld.com/article/3268448/cloud-computing/what-is-hybrid-cloud-really-and-whats-the-best-strategy.html
[8]: https://aws.amazon.com/outposts/
[9]: https://aws.amazon.com/marketplace/pp/B07TK21Z79?qid=1562209048875&sr=0-2&ref_=srh_res_product_title
[10]: https://www.networkworld.com/article/3290427/6-sneaky-ways-cloud-infrastructure-providers-lock-you-in.html
[11]: https://www.networkworld.com/article/3407756/colocation-facilities-buck-the-cloud-data-center-trend.html
[12]: https://www.networkworld.com/article/3336075/cisco-serves-up-flexible-data-center-options.html
[13]: https://www.networkworld.com/article/3431142/vmware-opens-reinforces-hybrid-cloud-migration-software.html
[14]: https://www.networkworld.com/article/3183584/juniper-extends-data-center-interconnect-options.html
[15]: https://www.networkworld.com/article/3209131/what-sdn-is-and-where-its-going.html
[16]: https://www.facebook.com/NetworkWorld/
[17]: https://www.linkedin.com/company/network-world
