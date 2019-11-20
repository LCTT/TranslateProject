[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (IBM aims at hybrid cloud, enterprise security)
[#]: via: (https://www.networkworld.com/article/3454503/ibm-aims-at-hybrid-cloud-enterprise-security.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

IBM aims at hybrid cloud, enterprise security
======
IBM Cloud Pak for Security features open-source Red Hat technology for hunting threats and automation to speed response to cyberattacks
D3Damon / Getty Images

IBM is taking aim at the challenging concept of securely locking-down company applications and data spread across multiple private and public clouds and on-premises locations.

IBM is addressing this challenge with its Cloud Pak for Security, which features open-source technology for hunting threats, automation capabilities to speed response to cyberattacks, and the ability integrate customers’ existing point-product security-system information for better operational safekeeping – all under one roof.

**[ Learn [how server disaggregation can boost data center efficiency][1] and [how Windows Server 2019 embraces hyperconverged data centers][2] . | Get regularly scheduled insights by [signing up for Network World newsletters][3]. ]**

IBM Cloud Paks are bundles of Red Hat’s Kubernetes-based OpenShift Container Platform along with Red Hat Linux and a variety of connecting technologies to let enterprise customers deploy and manage containers on their choice of infrastructure, be it private or public clouds, including AWS, Microsoft Azure, Google Cloud Platform, Alibaba and IBM Cloud.

**[ [Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][4] ]**

Cloud Pak for Security is the latest of six that are available today, the others being Data, Application, Integration, Automation and Multicloud Management, and they also incorporate containerized IBM middleware designed to let customers quickly spin-up enterprise-ready containers, the company said.

The Cloud Paks are part of a massive Big Blue effort to develop an advanced cloud ecosystem with the technology it acquired with its [$43 billion buy of Red Hat][5] in July. The Paks will ultimately include IBM’s DB2, WebSphere, [API Connect][6], Watson Studio, [Cognos Analytics][7] and more.

“The infrastructure is evolving in such a way that the traditional perimeter is going away and in the security domain, customers have a plethora of point-vendor solutions and now cloud-vendor security offerings to help manage this disparate environment,” said Chris Meenan, Director, Offering Management and Strategy, IBM Security.

Protecting this fragmented IT environment requires security teams to undertake complex integrations and continuously switch between different screens and point products. More than half of security teams say they struggle to integrate data with disparate security and analytic tools and combine that data across their on-premises and cloud environments to spot advanced threats, Meenan said.

One of the foundational components of Cloud Pak for Security is that it can, from a single containerized dashboard, connect, gather and see information from existing third-party tools and data sources, including multiple security-information and event-management software platforms, endpoint detection systems, threat-intelligence services, identity and cloud repositories, IBM said. Cloud Pak Connectors have been included for integration with security tools from vendors including IBM, Carbon Black (now part of VMware), Tenable, Elastic, BigFix, and Splunk, as well as public-cloud setups from IBM, AWS, and Microsoft Azure. 

The big deal here is that the tool  lets security teams connect all data sources to uncover hidden threats and make better risk-based decisions, while leaving the data where it resides, without needing to move that data into the platform for analysis, Meenan said.

“There’s a ton of security data out there, and the last thing we wanted to do was force customers to build another data lake of information, “ Meenan said. “Cloud Pak lets customer access data at rest on a variety of security systems, search and query those systems all via a common open-source federated framework.”

For example, the system supports Structured Threat Information Expression (STIX), an open-source language used to exchange cyber-threat intelligence. The platform also includes other open-source technology IBM co-developed through the [OASIS Open Cybersecurity Alliance][8].

The open source technology and the ability to easily gather and exchange data from multiple sources should be a very attractive feature for customers analysts said.

“The main takeaway is their ability to federate security-related data from a broad variety of sources, and provide flexible/open access to that," said Martin Kuppinger, founder and principal analyst at [KuppingerCole][9]. "They federate, not replicate, the data, avoiding having yet another data lake. And the data can be consumed in a flexible manner by apps you build on IBM Security Cloud Pak but also by external services. With security data commonly being spread across many systems, this simplifies building integrated security solutions and better tackling the challenges in managing complex attacks. IBM successfully managed to launch this offering with a very broad and comprehensive partner ecosystem – it is not just a promise, but they deliver.”

Once the data is gathered and analyzed the platform lets security teams orchestrate and automate their response to hundreds of common security scenarios, IBM said.  Via the Cloud Pak’s support for [Red Hat Ansible][10] automation technology customers can define actions such as segmenting a [multicloud][11] domain or locking down a server quickly. Meenan said.

The platform helps customers formalize security processes, orchestrate actions and automate responses across the enterprise, letting companies react faster and more efficiently while arming themselves with information needed for increasing regulatory scrutiny, IBM said.

The Security Cloud Pak is a platform on which Big Blue will develop future applications, Meenan said, "to address new challenges and risks such as insider security threats, all designed in realistic ways for customer to deploy without having to rip and replace anything."

Kuppinger said the security Pak will have immediate value for larger businesses running their own security operations/cyber-defense centers.

“The biggest challenge for IBM might be education – it is a new approach. However, the offering distinguishes clearly from other approaches, providing obvious benefits and adding value to existing infrastructures, not replacing these. Thus, it is clearly more than yet another product, but something really innovative that adds value.”

Join the Network World communities on [Facebook][12] and [LinkedIn][13] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3454503/ibm-aims-at-hybrid-cloud-enterprise-security.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3266624/how-server-disaggregation-could-make-cloud-datacenters-more-efficient.html
[2]: https://www.networkworld.com/article/3263718/software/windows-server-2019-embraces-hybrid-cloud-hyperconverged-data-centers-linux.html
[3]: https://www.networkworld.com/newsletters/signup.html
[4]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[5]: https://www.networkworld.com/article/3429596/ibm-fuses-its-software-with-red-hats-to-launch-hybrid-cloud-juggernaut.html
[6]: https://www.ibm.com/cloud/api-connect
[7]: https://www.ibm.com/products/cognos-analytics
[8]: https://www.oasis-open.org/org
[9]: https://www.kuppingercole.com/
[10]: https://www.networkworld.com/article/3194006/can-ansible-be-the-automation-platform-for-the-enterprise-red-hat-thinks-so.html
[11]: https://www.networkworld.com/article/3429258/real-world-tools-for-multi-cloud-management.html
[12]: https://www.facebook.com/NetworkWorld/
[13]: https://www.linkedin.com/company/network-world
