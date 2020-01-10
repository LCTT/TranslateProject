[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Aruba reinforces SD-Branch with security, management upgrades)
[#]: via: (https://www.networkworld.com/article/3513357/aruba-reinforces-sd-branch-with-security-management-upgrades.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Aruba reinforces SD-Branch with security, management upgrades
======
Aruba adds IDS/IPS, LTE to its branch-office networking gear
[geralt][1] [(CC0)][2]

Aruba has taken steps to bolster the security and manageability of its branch-office networking package for customers with lots of branch sites.

The HPE company enhanced its [SD-Branch][3] software with identity-based attack detection and intrusion prevention, and improvements to its SD-WAN Orchestrator to make it easier to deploy security features on a large scale.

[See predictions about what's big in IT tech for the coming year.][4]

Aruba’s SD-Branch software runs on its branch gateways and includes a variety of integrated features like a firewall that support LAN, WAN, Wi-Fi networks, and segmentation as well integration with the company’s ClearPass policy-management software and its cloud-based package Aruba Central. The package can integrate its data with partner security platforms such as Check Point, Palo Alto Networks, and Z-Scaler.

[][5]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][5]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

Aruba has added role-based intrusion detection/intrusion prevention (IDS/IPS) features that let customers watch over and set security policies on individual or role-based access to branch endpoints, according to [Kishore Seshadri][6], Aruba’s vice-president and general manager of [SD-WAN][7] Solutions.

Controlling the access each user has to resources is a component of [zero-trust security][8], which is the direction Aruba has been heading, Seshadri said.  

A recent _[Network World][8]_ article defined the idea of zero-trust networks as simply: “trust no one. Verify everyone. Enforce strict access-control and identity-management policies that restrict employee access to the resources they need to do their job and nothing more.” According to a recent 451 Group survey, only around 13% of enterprises have started down the zero-trust path.

The new support lets customers monitor individual endpoints and block traffic when necessary, all based on policies set locally in ClearPass, Seshadri said. 

The new package also supports threat visibility and trend analysis as well as the ability to correlate security events with sites, clients, applications and network infrastructure to help customers support larger branch implementations, the company said.

These capabilities allow enterprises to quickly detect and prevent unwanted traffic from entering or exiting their networks, said Brandon Butler, a senior research analyst with IDC. “The IDS and IPS systems allow users to set levels such as lenient, moderate, strict for traffic controls, and there are available integrations with messaging systems for alerting," Butler said. "These features are atop what Aruba already has for security, including dynamic segmentation of traffic based on users, devices and apps, [firewall][9] capabilities and integration with cloud-based security solutions such as Zscaler.”

For its cloud-based network management, Aruba Central, the company bolstered the Orchestrator feature with the ability to deploy secure overlay topologies in a large-scale [edge-computing][10] infrastructure. The idea is to securely connect thousands of remote locations to applications in [data centers][11] and the cloud, Aruba said.

“We continue to see customers move away from traditional on-premises data centers and move more toward the cloud, and the Orchestrator can now help customers secure those environments,” Seshadri said.

Being able to extend security coverage will be important for Aruba and other networking companies as they [link to cloud resources][12]. For example, Aruba announced support for Amazon Web Services [AWS Transit Gateway][13], which lets customers connect their Amazon Virtual Private Clouds (VPCs) and their on-premises networks to a single gateway. The idea is to simplify and enhance the performance of SD-WAN integration with AWS cloud resources.

Cisco, Versa and others have also announced support for the Transit Gateway. Aruba has an SD-WAN tie-in to Microsoft Azure and Google as well.

The final component of Aruba’s branch-connectivity upgrade was adding support for cellular backup, particularly LTE, to its branch-office gateways. 

Built-in cellular access in Aruba 9004 Series Gateways gives customers the option to use the connection as a primary, secondary uplink or backup in a load-shared active-active mode with other broadband links, Seshadri said.

“IT staff are able tune and optimize connectivity by defining SLA policies across a combination of [MPLS][14], internet and cellular links enforced with dynamic path steering in real-time with the ability to select the preferred cellular link,” Aruba stated. “The cellular link can also be used for remote locations or to accelerate the deployment of a new store until the dedicated MPLS or internet links are installed.”

This overall announcement is evidence of a broader shift in the market, said IDC’s Butler.  “As deployments of SD-WAN scale up, enterprises are thinking more holistically about what network and security functions are needed at the edge of their networks, and enhanced security functionality is a key," he said. "When enterprises deploy multiple network and security functions at the edge of their networks (such as SD-WAN with firewall, IPS/IDS, network analytics or WAN Op) we call this SD-Branch. We expect most SD-WAN vendors will increase their security and network-function capabilities that are packaged with SD-WAN, creating a new SD-Branch market.”

SD-WAN continues to be one of the fastest-growing segments of the network infrastructure market, Butler added.  In the first half of 2019, the market doubled in size compared to the year earlier: $1.1B for SD-WAN infrastructure (hardware + software, but not services) revenues in the first half of 2019, versus $1.4B for the full year 2018, he said.

Join the Network World communities on [Facebook][15] and [LinkedIn][16] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3513357/aruba-reinforces-sd-branch-with-security-management-upgrades.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://pixabay.com/en/play-stone-network-networked-1237457/
[2]: https://creativecommons.org/publicdomain/zero/1.0/
[3]: https://www.networkworld.com/article/3282526/network-professionals-should-think-sd-branch-not-just-sd-wan.html
[4]: https://www.networkworld.com/article/3488562/whats-big-in-it-tech-for-the-coming-year.html
[5]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[6]: https://blogs.arubanetworks.com/spectrum/how-good-is-the-network-experience-in-your-branch-offices
[7]: https://www.networkworld.com/article/3031279/sd-wan-what-it-is-and-why-you-ll-use-it-one-day.html
[8]: https://www.networkworld.com/article/3487720/the-vpn-is-dying-long-live-zero-trust.html
[9]: https://www.networkworld.com/article/3230457/what-is-a-firewall-perimeter-stateful-inspection-next-generation.html
[10]: https://www.networkworld.com/article/3224893/what-is-edge-computing-and-how-it-s-changing-the-network.html
[11]: https://www.networkworld.com/article/3223692/what-is-a-data-centerhow-its-changed-and-what-you-need-to-know.html
[12]: https://www.networkworld.com/article/3489938/what-s-hot-at-the-edge-for-2020-everything.html
[13]: https://aws.amazon.com/transit-gateway/
[14]: https://www.networkworld.com/article/2297171/network-security-mpls-explained.html
[15]: https://www.facebook.com/NetworkWorld/
[16]: https://www.linkedin.com/company/network-world
