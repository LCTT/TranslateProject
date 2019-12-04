[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (AWS rolls out Outposts for on-premises hybrid cloud)
[#]: via: (https://www.networkworld.com/article/3487800/aws-rolls-out-outposts-for-on-premises-hybrid-cloud.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

AWS rolls out Outposts for on-premises hybrid cloud
======
Cisco, Aruba, Juniper are among others that support Amazon's Outposts hybrid-cloud service supported by hardware in customers' private data centers.
Thinkstock

Looking to further nudge the data-center crowd into the cloud world, Amazon Web Services announced the availability of its [long-awaited][1] Outposts hybrid-cloud service this week.

Outposts delivers on-premises hardware and services that enables AWS cloud services inside enterprise data centers. That on-premises market is huge according to Amazon Web Services CEO Andy Jassy who told the AWS re:Invent 2019 conference audience 97% of the $3.7T IT market is still on-prem and that the industry is still at the very early stages of a shift from on [premises to the cloud][2].

**[ Also see [How to plan a software-defined data-center network][3] and [Efficient container use requires data-center software networking][4].]**

“Some customers have certain workloads that will likely need to remain on-premises for several years, such as applications that are latency-sensitive and need to be in close proximity to on-premises assets,” Amazon stated. Use cases include support for manufacturing process-control systems, robotics applications in close proximity to the equipment, and developing high-frequency stock-trading platforms.

[][5]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][5]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

That capability has not been possible until now because solutions have lacked the same APIs, the same tools, the same hardware, and the same features across on-premises and the cloud to deliver a consistent hybrid experience, Amazon stated.

That notion isn’t lost on AWS’ competitors either as Microsoft Azure Arc and Google Athos have on-premises cloud-service support. IBM/Red Hat has targeted the same environment as well.

Outposts, which was announced a year ago, offers AWS-designed hardware that lets customers run compute and storage on-premises, while connecting to AWS’s cloud services. Customers can run a variety of AWS services on Outposts including Amazon EC2, Amazon EBS, Amazon Elastic Container Service (ECS), Amazon Elastic [Kubernetes][6] Service (EKS) and Amazon Relational Database Service (RDS).

AWS Outposts is an extension of a customers' Amazon Virtual Private Cloud (VPC) in the closest AWS region to each customer. Customers can connect from their AWS Outposts to the rest of their applications or to any other AWS service in a public AWS region, the company said.

The idea with Outposts is that customers can use the same same APIs, same console and command line interface they use on the AWS cloud for on-premises applications, according to AWS.

[AWS Outposts][7] comes in two variants—AWS native, which is available now, and a VMware Cloud on AWS Outposts version targeted for a 2020 release.  

The VMware version lets customers  run VMware Cloud on AWS locally and to use the same VMware control plane and APIs customers use to run their on-premises infrastructure. This variant delivers the entire VMware Software-Defined Datacenter (SDDC) — compute, storage, and networking infrastructure — to run on-premises using AWS Outposts and lets users to take advantage of the ease of management and integration with AWS services, according to VMware.

“Many AWS services will not run locally on the Outpost, but, instead, will be accessed remotely over the network from the Outpost,AWS is not trying to replicate the public cloud on-premises," [Gartner wrote][8] about the two service variants. "Rather, it is trying to help customers address use cases that are not good candidates for the public cloud, while offering the standard AWS tools and management APIs as an integrated control plane across both environments.”

“In contrast, VMware Cloud on AWS Outposts will be managed remotely through the VMware Cloud on AWS and will integrate with VMware private-cloud infrastructure through vCenter’s Hybrid Linked Mode. This will make Outposts applicable to a wide range of private cloud use case,” Gartner stated.  

Some other details about Outposts:

  * [Outpost racks][9] are 80″ tall, 24″ wide, 48″ deep, and can weigh up to 2,000 lbs. They arrive fully assembled, and roll in on casters, ready for connection to power and networking which includes a pair of networking devices, each with 400 Gbps of connectivity and support for 1 GigE, 10 GigE, 40 GigE, and 100 Gigabit fiber connections, Amazon said.
  * Outposts AWS includes Virtual Private Cloud (VPC) [Ingress Routing][10] which AWS says will let customers direct traffic to a specific Amazon Elastic Compute Cloud (EC2) instance prior to the traffic reaching business applications. From there, “the instance typically runs network security tools to inspect or to block suspicious network traffic (such as IDS/IPS or firewall) or to perform any other network traffic inspection before relaying the traffic to other [EC2][11] instances,” Amazon says. [Cisco announced it will support AWS VPC Ingress Routing][12] in a variety of ways to include features such as firewall policy enforcement, malware detection, URL filtering and DNS security, the company said. Others such as Palo Alto Networks, Fortinet and Aviatrix will use the feature to integrate with AWS.
  * Outposts a [Transit Gateway][13] which it says is a service that lets customers to connect their Amazon Virtual Private Clouds (VPCs) and their on-premises networks to a single gateway. Transit Gateway acts as a hub that controls how traffic is routed among all the connected networks, Amazon stated. HPE/Aruba announced the integration of its SD-WAN software with the AWS Transit Gateway Network Manager. Aruba said the integration will simplify the deployment and management of networks connecting remote branch locations to Amazon VPCs and that customers deploying the Aruba SD-WAN package alongside AWS will have the ability to monitor and manage connectivity between AWS resources and their on-premises locations using either Aruba Central or AWS Transit Gateway Network Manager.
  * [Juniper announced that AWS Outposts][14] can now be deployed in an on-premises data center with [Juniper QFX Switching][15] devices to interoperate with an AWS Outposts Rack.



[[Get regularly scheduled insights by signing up for Network World newsletters.]][16]

Join the Network World communities on [Facebook][17] and [LinkedIn][18] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3487800/aws-rolls-out-outposts-for-on-premises-hybrid-cloud.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3324043/aws-does-hybrid-cloud-with-on-prem-hardware-vmware-help.html
[2]: https://d1.awsstatic.com/re19/IDC-Whitepaper-outposts-new.pdf
[3]: https://www.networkworld.com/article/3284352/data-center/how-to-plan-a-software-defined-data-center-network.html
[4]: https://www.networkworld.com/article/3297379/data-center/efficient-container-use-requires-data-center-software-networking.html
[5]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[6]: https://www.sdxcentral.com/containers/kubernetes/
[7]: https://aws.amazon.com/outposts/pricing/
[8]: https://pages.awscloud.com/Pdf-Gartner-Prepare-for-AWS-Outposts-to-Disrupt-Your-Hybrid-Cloud-Strategy.html
[9]: https://aws.amazon.com/blogs/aws/aws-outposts-now-available-order-your-racks-today/
[10]: https://aws.amazon.com/blogs/aws/new-vpc-ingress-routing-simplifying-integration-of-third-party-appliances/
[11]: https://aws.amazon.com/ec2/
[12]: https://www.networkworld.com/article/3487563/cisco-goes-deep-into-aws-hybrid-cloud-with-sd-wan-security-outposts-data-center-support.html
[13]: https://aws.amazon.com/transit-gateway/
[14]: https://forums.juniper.net/t5/Enterprise-Cloud-and/AWS-Outposts-in-a-Juniper-QFX-Based-Datacenter/ba-p/470768
[15]: https://www.juniper.net/us/en/products-services/switching/qfx-series/
[16]: https://www.networkworld.com/newsletters/signup.html
[17]: https://www.facebook.com/NetworkWorld/
[18]: https://www.linkedin.com/company/network-world
