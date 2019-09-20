[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco spreads ACI to Microsoft Azure, multicloud and SD-WAN environments)
[#]: via: (https://www.networkworld.com/article/3439448/cisco-spreads-aci-to-microsoft-azure-multicloud-and-sd-wan-environments.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco spreads ACI to Microsoft Azure, multicloud and SD-WAN environments
======
Cisco’s ACI Anywhere gives customers the flexibility to run and control applications anywhere they want across private or public clouds
Metamorworks / Getty Images

Cisco is significantly spreading its Application Centric Infrastructure (ACI) technology to help customers grow and control [hybrid][1], multicloud and SD-WAN environments.

ACI is Cisco’s flagship [software-defined networking][2] (SDN) data-center package, but it also delivers the company’s Intent-Based Networking technology, which brings customers the ability to automatically implement network and policy changes on the fly and ensure data delivery. 

**More about SD-WAN**

  * [How to buy SD-WAN technology: Key questions to consider when selecting a supplier][3]
  * [How to pick an off-site data-backup method][4]
  * [SD-Branch: What it is and why you’ll need it][5]
  * [What are the options for security SD-WAN?][6]



Cisco has extended ACI through a program and technology known as ACI Anywhere that gives customers the flexibility to run and control applications anywhere they want across private or public clouds or at the edge while maintaining consistent network and security  policies across their entire domain. ACI Anywhere implementations today include Cisco’s Application Policy Infrastructure Controller, ACI Multi-Site Orchestrator and Cloud Services Router (CSR) 1000V.

ACI Anywhere would, for example, let policies configured through Cisco’s SDN  Application Policy Infrastructure Controller (APIC) use native APIs offered by a public-cloud provider to orchestrate changes within both the private and public cloud environments, Cisco said. The Orchestrator helps provision and manage the implementation across multiple sites and services.

“This approach offers consistent policy and automation using an established ACI interface without compromising performance or access to a rich array of cloud-native public-cloud services. In addition, on-premises Cisco ACI orchestrates a consistent hybrid cloud experience that balances flexibility and control, while delivering hardware driven performance,” the company said.

Key new pieces of ACI Anywhere include the ability to integrate Microsoft Azure clouds and a cloud-only implementation of ACI. Cisco has been working closely with Microsoft, and while previewing the Azure cloud support earlier this year it has also added Azure Kubernetes Service (AKS) to managed services that natively integrate with the [Cisco Container Platform][7].

With the Azure cloud extension the service uses the Cisco Cloud Cloud APIC, which runs natively in Azure public cloud to provide automated connectivity, policy translation and enhanced visibility of workloads in the public cloud, Cisco said.

With new Azure extensions, customers can tap into cloud workloads through ACI integrations with Azure technologies like Azure Monitor, Azure Resource Health and Azure Resource Manager to fine-tune their network operations for speed, flexibility and cost, Cisco stated.

As part of the Azure package, the Cisco Cloud Services Router (CSR) 1000V brings connectivity between on-premises and Azure cloud environments. The service supports consistent network segmentation, access control and isolation across hybrid deployments., said [Srini Kotamraju][8], senior director, product management, for Cisco’s data-center networking group. 

“Extending ACI control to the leading cloud environments – adding Azure – is critical for organizations to migrate to and operate in a multi-cloud world,” said Lee Doyle, principal analyst with Doyle Research.

Another new extension is support for ACI Anywhere in the cloud. ACI Multicloud basically implements the ACI Anywhere components in a public cloud. It is targeted at customers who want to start in the cloud first and who may not have implemented ACI on premises but want to implement secure connectivity and segment workloads across public clouds, Kotamraju said. 

ACI Multicloud works with Azure and Amazon AWS cloud services for now, and others will be added in the future, Kotamraju said.

The final new piece of ACI is the addition of SD-WAN support to the system. ACI-to-SD-WAN Integration lets customers automate WAN path selection between the branch office and the on-premises data center based on application policy, Kotamraju said.  The package further integrates the SD-WAN technology Cisco garnered by [buying Viptela two years ago][9].

The main idea is to get the most robust connectivity possible for remote branch-office customers, Kotamraju said

“Integration between ACI and Viptela SD-WAN  improves Cisco customers' abilities to deliver quality of experience to remote branch offices,” said Doyle.

The ACI Anywhere upgrades – which are all available now – are just part of a number of hybrid-cloud agreements Cisco has announced this year. For example in June, [Cisco and IBM][10] said the companies would meld their [data-center][11] and cloud technologies to help customers more easily and securely build and support on-premises and [hybrid-cloud][12] applications.

Cisco, IBM Cloud and IBM Global Technology Services (the professional services business of IBM) said they will work to develop a hybrid-cloud architecture that integrates Cisco’s data-center, networking and analytics platforms with IBM’s cloud offerings. IBM's contribution includes a heavy emphasis on Kubernetes-based offerings such as Cloud Foundry and Cloud Private as well as a catalog of [IBM enterprise software][13] such as Websphere and open-source software such as Open Whisk, KNative, Istio and Prometheus.

Cisco said customers deploying its Virtual ACI technologies can now extend that network fabric from on-premises to the IBM Cloud. 

[IBM said Cisco ACI Virtual Pod][14] (vPOD) software can now run on IBM Cloud bare-metal servers. “vPOD consists of virtual spines and leafs and supports up to eight instances of ACI Virtual Edge. These elements are often deployed on VMware services on the IBM Cloud to support hybrid deployments from on-premises environments to the IBM Cloud," the company stated.

In [April Cisco released Cloud ACI for AWS][15] lets users configure inter-site connectivity, define policies and monitor the health of network infrastructure across hybrid environments, Cisco said.  Like the Azure extensions, the AWS service utilizes the Cisco Cloud APIC to provide connectivity, policy translation and enhanced visibility of workloads in the public cloud, Cisco said.

“This solution brings a suite of capabilities to extend your on-premises data center into true multi-cloud architectures, helping to drive policy and operational consistency, independent of where your applications or data reside. [It] uses the native AWS constructs for policy translation and gives end-to-end visibility into the customer's multi-cloud workloads and connectivity,” Cisco said.

Also in April Cisco and Google expanded their joint cloud-development activities to help customers more easily build secure multicloud and hybrid applications everywhere from on-premises data centers to public clouds.

That expansion involves Google’s new open-source hybrid cloud package called Anthos which is based on and supplants the company's existing Google Cloud Service beta. Anthos will let customers run unmodified applications on existing on-premises hardware or in the public cloud. It will be available on [Google Cloud Platform][16] (GCP) with [Google Kubernetes Engine][17] (GKE), and in data centers with [GKE On-Prem][18], the company says. Anthos will also let customers for the first time manage workloads running on third-party clouds such as AWS and Azure from the Google platform without requiring administrators and developers to learn different environments and APIs, Google said. 

For its part, Cisco announced support of Anthos and promised to tightly integrate it with Cisco data-center technologies such as its HyperFlex hyperconverged package, ACI, SD-WAN and Stealthwatch Cloud. The integrations will enable a consistent, cloud-like experience whether on-prem or in the cloud with automatic upgrades to the latest versions and security patches, Cisco stated.

Join the Network World communities on [Facebook][19] and [LinkedIn][20] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3439448/cisco-spreads-aci-to-microsoft-azure-multicloud-and-sd-wan-environments.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3233132/cloud-computing/what-is-hybrid-cloud-computing.html
[2]: https://www.networkworld.com/article/3209131/what-sdn-is-and-where-its-going.html
[3]: https://www.networkworld.com/article/3323407/sd-wan/how-to-buy-sd-wan-technology-key-questions-to-consider-when-selecting-a-supplier.html
[4]: https://www.networkworld.com/article/3328488/backup-systems-and-services/how-to-pick-an-off-site-data-backup-method.html
[5]: https://www.networkworld.com/article/3250664/lan-wan/sd-branch-what-it-is-and-why-youll-need-it.html
[6]: https://www.networkworld.com/article/3285728/sd-wan/what-are-the-options-for-securing-sd-wan.html?nsdr=true
[7]: https://www.networkworld.com/article/3252810/cisco-unveils-container-management-on-hyperflex.html
[8]: https://blogs.cisco.com/author/srinivaskotamraju
[9]: https://www.networkworld.com/article/3429186/cisco-assesses-the-top-enterprise-sd-wan-technology-drivers.html
[10]: https://www.networkworld.com/article/3403363/cisco-connects-with-ibm-to-simplify-hybrid-cloud-deployment.html
[11]: https://www.networkworld.com/article/3223692/what-is-a-data-centerhow-its-changed-and-what-you-need-to-know.html
[12]: https://www.networkworld.com/article/3233132/what-is-hybrid-cloud-computing.html
[13]: https://www.networkworld.com/article/3340043/ibm-marries-on-premises-private-and-public-cloud-data.html
[14]: https://www.ibm.com/blogs/cloud-computing/2019/06/18/ibm-cisco-collaborating-hybrid-cloud-modern-enterprise/
[15]: https://www.networkworld.com/article/3388679/cisco-taps-into-aws-for-data-center-cloud-applications.html
[16]: https://cloud.google.com/
[17]: https://cloud.google.com/kubernetes-engine/
[18]: https://cloud.google.com/gke-on-prem/
[19]: https://www.facebook.com/NetworkWorld/
[20]: https://www.linkedin.com/company/network-world
