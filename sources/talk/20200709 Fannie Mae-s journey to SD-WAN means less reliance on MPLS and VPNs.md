[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Fannie Mae’s journey to SD-WAN means less reliance on MPLS and VPNs)
[#]: via: (https://www.networkworld.com/article/3564382/fannie-maes-journey-to-sd-wan-means-less-reliance-on-mpls-and-vpns.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Fannie Mae’s journey to SD-WAN means less reliance on MPLS and VPNs
======
As mortgage lender Fannie Mae adopts SD-WAN, it’s realizing dramatic improvements in latency and network performance.
sd-wan

About a year and a half ago, some Texas employees of the Federal National Mortgage Association (Fannie Mae) were leaving work early to work at home over the enterprise VNP because it gave them better application performance and less congestion than the office network.

That’s also when the agency started moving toward a cloud-first environment and away from its legacy hub-and-spoke WAN.

**More about SD-WAN**: [How to buy SD-WAN technology: Key questions to consider when selecting a supplier][1] • [How to pick an off-site data-backup method][2] •  [SD-Branch: What it is and why you’ll need it][3] • [What are the options for security SD-WAN?][4]

“When we started this project the data center was still the center of the universe, where all traffic would be sent back through the data center, which was really inefficient,” said Ken Reddick, Director of Network Engineering at Fannie Mae. “What we are moving to is a cloud-edge environment where user traffic is now sent directly where it needs to go without hitting the data center, and what that has brought us is a four-fold increase in network performance and cut latency by 50%.”

The cloud-edge project is about 70% complete and involves replacing [Cisco ISR/ASR][5]-based hardware with Cisco’s SD-WAN powered by Viptela appliances and software to create an intelligent SD-WAN environment.  That system will ultimately tie together some 15,000 employees and partners in about 18 offices with Fannie Mae’s ever-growing AWS and Azure cloud resources. Key network hubs include two Equinix regional co-location facilities and Fannie Mae’s Washington, D.C., headquarters

Fannie Mae’s primary application is known as desktop underwriting, an automated approval system that calculates loan requirements. Together with its partners Fannie Mae’s mission is to provide homeowners, homebuyers and renters across the country with access to affordable financing opportunities.

### MPLS still plays a role

The SD-WAN project supports a hybrid mesh of MPLS and direct internet access (DIA) across the country, Reddick said.  “We decided to keep the MPLS plumbing we had but add a DIA option, and the software can decide which route to take based on policies and traffic patterns.”

The company’s traffic patterns shifted dramatically earlier this year with the work-from-home requirements forced on Fannie Mae by the COVID-19 outbreak.  But the SD-WAN and cloud environment was up to the task, Reddick said.  A week before the Reddick’s team  of about 40 IT workers got the call that everybody would be working from home, it had been conducting work-from-home tests on the network with about half the company, and it was going well, Reddick said. “Then we got the call that this was no longer a test but a reality.”

“Everyone being forced to work from home accelerated our cloud/edge strategy, but we were already prepared for a change in traffic patterns and capacity so it was pretty straight-forward as the traffic to the cloud shifted from being in the offices to coming from home,” Reddick said.

Now one of the biggest challenges is managing latency to provide sufficient QoS for voice and video, Reddick said. “MPLS has a lot of features to manage for that, but adding the DIA, which doesn’t have the intelligence of MPLS, is a challenge.”

“What we want to do is build on that SD-WAN intelligence so we don’t have to constantly touch and tune it. Ultimately the SD-WAN platform will learn based on end user traffic patterns and behavior and the response it’s getting from applications,” Reddick said. “Building toward an intelligent edge is where we are going.”

### Zero-trust security

Another challenge is security, mostly brought on by the increased use of DIA, Reddick said. The legacy hub-and-spoke environment provided centralized controls, but with the SD-WAN, “you need security products and technology that brings all of that to the edge without breaking the bank.”

That has led the company to embark on a zero-trust path that involves the vManage platform and services such as Zscaler’s cloud-security platform that provide secure connections between users and cloud-based applications. Zero trust is an approach to securing authentication and access while offering segmentation and policy-setting capabilities across an organization's networks and applications.

“We are pretty early on in the zero-trust work but you can see even the most mundane things – such as how do you handle print services that many users need and are on the trusted side of the environment, but users of print services can be on the untrusted side.  Lots of things like that need to be set up properly to secure them,” Reddick said.

The company still predominantly depends on VPN technology for security now, but the mix is changing, he said. “We feel that as we move forward in our cloud journey that our reliance on VPNs will diminish and we’ll move toward technologies such as [zero trust] connection brokers and private access,” Reddick said. 

While the SD-WAN portion of Fannie Mae is undergoing a major change, its data center is also morphing toward the cloud. 

The company is moving toward [Cisco’s Application Centric Infrastructure][6] (ACI) technology on its core Nexus switches.  ACI is Cisco’s flagship software that promises to help customers grow and control hybrid, multi-cloud and SD-WAN environments.  It also delivers the company’s Intent-Based Networking technology, which brings customers the ability to automatically implement network and policy changes on the fly and ensure data delivery. 

“We expect eventually to transform our data-center fabric and mange everything from a central overlay that helps us implement automation, provisioning and segmentation. The idea is to be agile to meet demand no matter what the vector is,” Reddick said.

Join the Network World communities on [Facebook][7] and [LinkedIn][8] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3564382/fannie-maes-journey-to-sd-wan-means-less-reliance-on-mpls-and-vpns.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3323407/sd-wan/how-to-buy-sd-wan-technology-key-questions-to-consider-when-selecting-a-supplier.html
[2]: https://www.networkworld.com/article/3328488/backup-systems-and-services/how-to-pick-an-off-site-data-backup-method.html
[3]: https://www.networkworld.com/article/3250664/lan-wan/sd-branch-what-it-is-and-why-youll-need-it.html
[4]: https://www.networkworld.com/article/3285728/sd-wan/what-are-the-options-for-securing-sd-wan.html
[5]: https://www.networkworld.com/article/3564719/cisco-bumps-up-israsr-router-performance-and-capacity.html
[6]: https://www.networkworld.com/article/3487831/what-s-hot-for-cisco-in-2020.html
[7]: https://www.facebook.com/NetworkWorld/
[8]: https://www.linkedin.com/company/network-world
