[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco offers cloud-based security for SD-WAN resources)
[#]: via: (https://www.networkworld.com/article/3402079/cisco-offers-cloud-based-security-for-sd-wan-resources.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco offers cloud-based security for SD-WAN resources
======
Cisco adds support for its cloud-based security gateway Umbrella to SD-WAN software
![Thinkstock][1]

SAN DIEGO— As many companies look to [SD-WAN][2] technology to reduce costs, improve connectivity and streamline branch office access, one of the key requirements will be solid security technologies to protect corporate resources.

At its Cisco Live customer event here this week, the company took aim at that need by telling customers it added support for the its cloud-based security gateway – known as Umbrella – to its SD-WAN software offerings.

**More about SD-WAN**

  * [How to buy SD-WAN technology: Key questions to consider when selecting a supplier][3]
  * [How to pick an off-site data-backup method][4]
  * [SD-Branch: What it is and why you’ll need it][5]
  * [What are the options for security SD-WAN?][6]



At its most basic, SD-WAN lets companies aggregate a variety of network connections – including MPLS, 4G LTE and DSL – into a branch or network-edge location and provides a management software that can turn up new sites, prioritize traffic and set security policies. SD-WAN's driving principle is to simplify the way big companies turn up new links to branch offices, better manage the way those links are utilized – for data, voice or video – and potentially save money in the process.

According to Cisco, Umbrella can provide the first line of defense against threats on the internet. By analyzing and learning from internet activity patterns, Umbrella automatically uncovers attacker infrastructure and proactively blocks requests to malicious destinations before a connection is even established — without adding latency for users. With Umbrella, customers can stop phishing and malware infections earlier, identify already infected devices faster and prevent data exfiltration, Cisco says.

Branch offices and roaming users are more vulnerable to attacks, and attackers are looking to exploit them, said Gee Rittenhouse, senior vice president and general manager of Cisco's Security Business Group. He pointed to Enterprise Strategy Group research that says 68 percent of branch offices and roaming users were the source of compromise in recent attacks. And as organizations move to more direct internet access, this becomes an even greater risk, Rittenhouse said.

“Scaling security at every location often means more appliances to ship and manage, more policies to separately maintain, which translates into more money and resources needed – but Umbrella offers an alternative to all that," he said. "Umbrella provides simple deployment and management, and in a single cloud platform, it unifies multiple layers of security, ncluding DNS, secure web gateway, firewall and cloud-access security,” Rittenhouse said.

“It also acts as your secure onramp to the internet by offering secure internet access and controlled SaaS usage across all locations and roaming users.”

Basically users can set up Umbrella support via the SD-WAN dashboard vManage, and the system automatically creates a secure tunnel to the cloud.** ** Once the SD-WAN traffic is pointed at the cloud, firewall and other security policies can be set. Customers can then see traffic and collect information about patterns or set policies and respond to anomalies, Rittenhouse said.

Analysts said the Umbrella offering is another important security option offered by Cisco for SD-WAN customers.

“Since it is cloud-based, using Umbrella is a great option for customers with lots of branch or SD-WAN locations who don’t want or need to have a security gateway on premises,” said Rohit Mehra, vice president of Network Infrastructure at IDC. “One of the largest requirements for large customers going forward will be the need for all manner of security technologies for the SD-WAN environment, and Cisco has a big menu of offerings that can address those requirements.”

IDC says the SD-WAN infrastructure market will hit $4.5 billion by 2022, growing at a more than 40 percent yearly clip between now and then.

The Umbrella announcement is on top of other recent SD-WAN security enhancements the company has made. In May [Cisco added support for Advanced Malware Protection (AMP) to its million-plus ISR/ASR edge routers][7] in an effort to reinforce branch- and core-network malware protection across the SD-WAN.

“Together with Cisco Talos [Cisco’s security-intelligence arm], AMP imbues your SD-WAN branch, core and campuses locations with threat intelligence from millions of worldwide users, honeypots, sandboxes and extensive industry partnerships,” Cisco said.

In total, AMP identifies more than 1.1 million unique malware samples a day and when AMP in Cisco SD-WAN platform spots malicious behavior it automatically blocks it, Cisco said.

Last year Cisco added its [Viptela SD-WAN technology to the IOS XE][8] version 16.9.1 software that runs its core ISR/ASR routers such as the ISR models 1000, 4000 and ASR 1000, in use by organizations worldwide. Cisco bought Viptela in 2017.

The release of Cisco IOS XE offered an instant upgrade path for creating cloud-controlled SD-WAN fabrics to connect distributed offices, people, devices and applications operating on the installed base, Cisco said. At the time Cisco said that Cisco SD-WAN on edge routers builds a secure virtual IP fabric by combining routing, segmentation, security, policy and orchestration.

With the recent release of IOS-XE SD-WAN 16.11, Cisco has brought AMP and other enhancements to its SD-WAN.

AMP support is added to a menu of security features already included in Cisco's SD-WAN software including support for URL filtering, Snort Intrusion Prevention, the ability to segment users across the WAN and embedded platform security, including the Cisco Trust Anchor module.

The software also supports SD-WAN Cloud onRamp for CoLocation, which lets customers tie distributed multicloud applications back to a local branch office or local private data center. That way a cloud-to-branch link would be shorter, faster and possibly more secure that tying cloud-based applications directly to the data center.

Also in May [Cisco and Teridion][9] said they would team to deliver faster enterprise software-defined WAN services. The integration links Cisco Meraki MX Security/SD-WAN appliances and its Auto VPN technology which lets users quickly bring up and configure secure sessions between branches and data centers with Teridion’s cloud-based WAN service. Teridion’s service promises customers better performance and control over traffic running from remote offices over the public internet to the data center.

Teridion said the Meraki integration creates an IPSec connection from the Cisco Meraki MX to the Teridion edge. Customers create locations in the Teridion portal and apply the preconfigured Meraki template to them, or just upload a csv file if they have a lot of locations. Then, from each Meraki MX, they can create a third-party IPSec tunnel to the Teridion edge IP addresses that are generated as part of the Teridion configuration, the company stated.

The combined Cisco Meraki and Teridion offering brings SD-WAN and security capabilities at the WAN edge that are tightly integrated with a WAN service delivered over cost-effective broadband or dedicated Internet access. Meraki’s MX family supports everything from SD-WAN and [Wi-Fi][10] features to next-generation [firewall][11] and intrusion prevention in a single package.

Join the Network World communities on [Facebook][12] and [LinkedIn][13] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3402079/cisco-offers-cloud-based-security-for-sd-wan-resources.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://images.techhive.com/images/article/2015/10/cloud-security-ts-100622309-large.jpg
[2]: https://www.networkworld.com/article/3209131/what-sdn-is-and-where-its-going.html
[3]: https://www.networkworld.com/article/3323407/sd-wan/how-to-buy-sd-wan-technology-key-questions-to-consider-when-selecting-a-supplier.html
[4]: https://www.networkworld.com/article/3328488/backup-systems-and-services/how-to-pick-an-off-site-data-backup-method.html
[5]: https://www.networkworld.com/article/3250664/lan-wan/sd-branch-what-it-is-and-why-youll-need-it.html
[6]: https://www.networkworld.com/article/3285728/sd-wan/what-are-the-options-for-securing-sd-wan.html?nsdr=true
[7]: https://www.networkworld.com/article/3394597/cisco-adds-amp-to-sd-wan-for-israsr-routers.html
[8]: https://www.networkworld.com/article/3296007/cisco-upgrade-enables-sd-wan-in-1m-israsr-routers.html
[9]: https://www.networkworld.com/article/3396628/cisco-ties-its-securitysd-wan-gear-with-teridions-cloud-wan-service.html
[10]: https://www.networkworld.com/article/3318119/what-to-expect-from-wi-fi-6-in-2019.html
[11]: https://www.networkworld.com/article/3230457/what-is-a-firewall-perimeter-stateful-inspection-next-generation.html
[12]: https://www.facebook.com/NetworkWorld/
[13]: https://www.linkedin.com/company/network-world
