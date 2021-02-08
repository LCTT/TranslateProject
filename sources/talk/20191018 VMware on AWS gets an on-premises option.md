[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (VMware on AWS gets an on-premises option)
[#]: via: (https://www.networkworld.com/article/3446796/vmware-on-aws-gets-an-on-premises-option.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

VMware on AWS gets an on-premises option
======
Amazon Relational Database Service on VMware automates database provisioning for customers running VMware vSphere 6.5 or later, and it supports Microsoft SQL Server, PostgreSQL, and MySQL.
Getty Images

VMware has taken another step to integrate its virtual kingdom with Amazon Web Services' world with an [on-premise service][1] that will let customers automate database provisioning and management. 

The package, [Amazon Relational Database Service][2] (RDS) on VMware is available now for customers running VMware vSphere 6.5 or later and supports Microsoft SQL Server, PostgreSQL, and MySQL. Other DBs will be supported in the future, the companies said.

****[**** Read also: [How to plan a software-defined data-center network][3] ****|**** [Get regularly scheduled insights by signing up for Network World newsletters.][4]**]**

The RDS lets customers run native RDS Database instances on a vSphere platform and manage those instances from the AWS Management Console in the cloud. It automates database provisioning, operating-system and database patching, backups, point-in-time restore and compute scaling, as well as database-instance health management, VMware said.

[][5]

BrandPost Sponsored by HPE

[HPE Synergy For Dummies][5]

Here’s how IT can provide an anytime, anywhere, any workload infrastructure.

With the service customers such as software developers and database administrators get native access to the Amazon Relational Database Service using their familiar AWS Management Console, CLI, and RDS APIs,  Chris Wolf, vice president and CTO, global field and industry at VMware wrote in a [blog][6] about the service. “Operations teams can quickly stand up an RDS instance anywhere they run vSphere, and manage it using all of their existing tools and processes.”

Wolf said the service should greatly simplify managing databases linked to its flagship vSphere system. 

Advertisement

Managing databases on vSphere or natively has always been a tedious exercise that steals the focus of highly skilled database administrators, Wolf stated. “VMware customers will now be able to expand the benefits of automation and standardization of their database workloads inside of vSphere and focus more of their time and energy on improving their applications for their customers.”

The RDS is just the part of the enterprise data center/cloud integration work VMware and AWS have been up to in the past year.

In August [VMware said it added VMware HCX][7] capabilities to enable push-button migration and interconnectivity between VMware Cloud on AWS Software-Defined Data Centers running in different AWS Regions. It has also added new Elastic vSAN support to bolster storage scaling.

Once applications are migrated to the cloud, customers can extend their capabilities  through the integration of native AWS services. In the future, through technology such as Bitfusion and partnerships with other vendors such as NVIDIA, customers will be able to enrich existing applications and power new enterprise applications.

VMware and NVIDIA also announced their intent to deliver accelerated GPU services for VMware Cloud on AWS.  These services will let customers migrate VMware vSphere-based applications and containers to the cloud, unchanged, where they can be modernized to take advantage of high-performance computing, machine learning, data analytics and video-processing applications, VMware said.

And last November [AWS tied in VMware][8] to its on-premises Outposts development, which comes in two versions. The first, VMware Cloud on AWS Outposts, lets customers  use the same VMware control plane and APIs they currently deploy. The other is an AWS-native variant that lets customers use the same APIs and control plane they use to run in the AWS cloud, but on premises, according to AWS.

Outposts can be upgraded with the latest hardware and next-generation instances to run all native AWS and VMware applications, [AWS stated][9]. A second version, VMware Cloud on AWS Outposts, lets customers use a VMware control plane and APIs to run the hybrid environment.

The idea with Outposts is that customers can use the same programming interface, same APIs, same console and CLI they use on the AWS cloud for on-premises applications, develop and maintain a single code base, and use the same deployment tools in the AWS cloud and on premises, AWS wrote.

VMware isn’t the only vendor cozying up to AWS. Cisco has done a variety of integration work with the cloud service provider as well.  In [April Cisco released Cloud ACI for AWS][10] to let users configure inter-site connectivity, define policies and monitor the health of network infrastructure across hybrid environments, Cisco said. The AWS service utilizes the Cisco Cloud APIC [Application Policy Infrastructure Controller] to provide connectivity, policy translation and enhanced visibility of workloads in the public cloud, Cisco said.

“This solution brings a suite of capabilities to extend your on-premises data center into true multi-cloud architectures, helping to drive policy and operational consistency, independent of where your applications or data reside. [It] uses the native AWS constructs for policy translation and gives end-to-end visibility into the customer's multi-cloud workloads and connectivity,” Cisco said.

Join the Network World communities on [Facebook][11] and [LinkedIn][12] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3446796/vmware-on-aws-gets-an-on-premises-option.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://aws.amazon.com/blogs/aws/now-available-amazon-relational-database-service-rds-on-vmware/
[2]: https://blogs.vmware.com/vsphere/2019/10/how-amazon-rds-on-vmware-works.html
[3]: https://www.networkworld.com/article/3284352/data-center/how-to-plan-a-software-defined-data-center-network.html
[4]: https://www.networkworld.com/newsletters/signup.html
[5]: https://www.networkworld.com/article/3399618/hpe-synergy-for-dummies.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE19718&utm_content=sidebar (HPE Synergy For Dummies)
[6]: https://cloud.vmware.com/community/2019/10/16/announcing-general-availability-amazon-rds-vmware/
[7]: https://www.networkworld.com/article/3434397/vmware-fortifies-its-hybrid-cloud-portfolio-with-management-automation-aws-and-dell-offerings.html
[8]: https://www.networkworld.com/article/3324043/aws-does-hybrid-cloud-with-on-prem-hardware-vmware-help.html
[9]: https://aws.amazon.com/outposts/
[10]: https://www.networkworld.com/article/3388679/cisco-taps-into-aws-for-data-center-cloud-applications.html
[11]: https://www.facebook.com/NetworkWorld/
[12]: https://www.linkedin.com/company/network-world
