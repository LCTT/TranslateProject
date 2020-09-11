[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Moving to the Cloud? SD-WAN Matters! Part 2)
[#]: via: (https://www.networkworld.com/article/3398488/moving-to-the-cloud-sd-wan-matters-part-2.html)
[#]: author: (Rami Rammaha https://www.networkworld.com/author/Rami-Rammaha/)

Moving to the Cloud? SD-WAN Matters! Part 2
======

![istock][1]

This is the second installment of the blog series exploring how enterprises can realize the full transformation promise of the cloud by shifting to a business first networking model powered by a business-driven [SD-WAN][2]. The first installment explored automating secure IPsec connectivity and intelligently steering traffic to cloud providers. We also framed the direct correlation between moving to the cloud and adopting an SD-WAN. In this blog, we will expand upon several additional challenges that can be addressed with a business-driven SD-WAN when embracing the cloud:

### Simplifying and automating security zone-based segmentation

Securing cloud-first branches requires a robust multi-level approach that addresses following considerations:

  * Restricting outside traffic coming into the branch to sessions exclusively initiated by internal users with a built-in stateful firewall, avoiding appliance sprawl and lowering operational costs; this is referred to as the app whitelist model
  * Encrypting communications between end points within the SD-WAN fabric and between branch locations and public cloud instances
  * Service chaining traffic to a cloud-hosted security service like [Zscaler][3] for Layer 7 inspection and analytics for internet-bound traffic
  * Segmenting traffic spanning the branch, WAN and data center/cloud
  * Centralizing policy orchestration and automation of zone-based firewall, VLAN and WAN overlays



A traditional device-centric WAN approach for security segmentation requires the time-consuming manual configuration of routers and/or firewalls on a device-by-device and site-by-site basis. This is not only complex and cumbersome, but it simply can’t scale to 100s or 1000s of sites. Anusha Vaidyanathan, director of product management at Silver Peak, explains how to automate end-to-end zone-based segmentation, emphasizing the advantages of a business-driven approach in this [lightboard video][4].

### Delivering the Highest Quality of Experience to IT teams

The goal for enterprise IT is enabling business agility and increasing operational efficiency. The traditional router-centric WAN approach doesn’t provide the best quality of experience for IT as management and on-going network operations are manual and time consuming, device-centric, cumbersome, error-prone and inefficient.

A business-driven SD-WAN such as the Silver Peak [Unity EdgeConnect™][5] unified SD-WAN edge platform centralizes the orchestration of business-driven policies. EdgeConnect automation, machine learning and open APIs easily integrate with third-party management tools and real-time visibility tools to deliver the highest quality of experience for IT, enabling them to reclaim nights and weekends. Manav Mishra, vice president of product management at Silver Peak, explains the latest Silver Peak innovations in this [lightboard video][6].

As enterprises become increasingly dependent on the cloud and embrace a multi-cloud strategy, they must address a number of new challenges:

  * A centralized approach to securely embracing the cloud and the internet
  * How to extend the on-premise data center to a public cloud and migrating workloads between private and public cloud, taking application portability into account
  * Deliver consistent high application performance and availability to hosted applications whether they reside in the data center, private or public clouds or are delivered as SaaS services
  * A proactive way to quickly resolve complex issues that span the data center and cloud as well as multiple WAN transport services by harnessing the power of advanced visibility and analytics tools



The business-driven EdgeConnect SD-WAN edge platform enables enterprise IT organizations to easily and consistently embrace the public cloud. Unified security and performance capabilities with automation deliver the highest quality of experience for both users and IT while lowering overall WAN expenditures.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3398488/moving-to-the-cloud-sd-wan-matters-part-2.html

作者：[Rami Rammaha][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Rami-Rammaha/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/05/istock-909772962-100797711-large.jpg
[2]: https://www.silver-peak.com/sd-wan/sd-wan-explained
[3]: https://www.silver-peak.com/company/tech-partners/zscaler
[4]: https://www.silver-peak.com/resource-center/how-to-create-sd-wan-security-zones-in-edgeconnect
[5]: https://www.silver-peak.com/products/unity-edge-connect
[6]: https://www.silver-peak.com/resource-center/how-to-optimize-quality-of-experience-for-it-using-sd-wan
