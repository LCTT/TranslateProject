[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco boosts SD-WAN with multicloud-to-branch access system)
[#]: via: (https://www.networkworld.com/article/3393232/cisco-boosts-sd-wan-with-multicloud-to-branch-access-system.html#tk.rss_all)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco boosts SD-WAN with multicloud-to-branch access system
======
Cisco's SD-WAN Cloud onRamp for CoLocation can tie branch offices to private data centers in regional corporate headquarters via colocation facilities for shorter, faster, possibly more secure connections.
![istock][1]

Cisco is looking to give traditional or legacy wide-area network users another reason to move to the [software-defined WAN world][2].

The company has rolled out an integrated hardware/software package called SD-WAN Cloud onRamp for CoLocation that lets customers tie distributed multicloud applications back to a local branch office or local private data center. The idea is that a cloud-to-branch link would be shorter, faster and possibly more secure that tying cloud-based applications directly all the way to the data center.

**More about SD-WAN**

  * [How to buy SD-WAN technology: Key questions to consider when selecting a supplier][3]
  * [How to pick an off-site data-backup method][4]
  * [SD-Branch: What it is and why you’ll need it][5]
  * [What are the options for security SD-WAN?][6]



“With Cisco SD-WAN Cloud onRamp for CoLocation operating regionally, connections from colocation facilities to branches are set up and configured according to traffic loads (such as video vs web browsing vs email) SLAs (requirements for low latency/jitter), and Quality of Experience for optimizing cloud application performance,” wrote Anand Oswal, senior vice president of engineering, in Cisco’s Enterprise Networking Business in a [blog about the new service][7].

According to Oswal, each branch or private data center is equipped with a network interface that provides a secure tunnel to the regional colocation facility. In turn, the Cloud onRamp for CoLocation establishes secure tunnels to SaaS application platforms, multi-cloud platform services, and enterprise data centers, he stated.

Traffic is securely routed through the Cloud onRamp for CoLocation stack which includes security features such as application-aware firewalls, URL-filtering, intrusion detection/prevention, DNS-layer security, and Advanced Malware Protection (AMP) Threat Grid, as well as other network services such as load-balancing and Wide Area Application Services, Oswal wrote.

A typical use case for the package is an enterprise that has dozens of distributed branch offices, clustered around major cities, spread over several countries. The goal is to tie each branch to enterprise data center databases, SaaS applications, and multi-cloud services while meeting service level agreements and application quality of experience, Oswal stated.

“With virtualized Cisco SD-WAN running on regional colocation centers, the branch workforce has access to applications and data residing in AWS, Azure, and Google cloud platforms as well as SaaS providers such as Microsoft 365 and Salesforce—transparently and securely,” Oswal said. “Distributing SD-WAN features over a regional architecture also brings processing power closer to where data is being generated—at the cloud edge.”

The idea is that paths to designated SaaS applications will be monitored continuously for performance, and the application traffic will be dynamically routed to the best-performing path, without requiring human intervention, Oswal stated.

For a typical configuration, a region covering a target city uses a colocation IaaS provider that hosts the Cisco Cloud onRamp for CoLocation, which includes:

  * Cisco vManage software that lets customers manage applications and provision, monitor and troubleshooting the WAN.
  * [Cisco Cloud Services Platform (CSP) 5000][8] The systems are x86 Linux Kernel-based Virtual Machine (KVM) software and hardware platforms for the data center, regional hub, and colocation Network Functions Virtualization (NFV). The platforms let enterprise IT teams or service providers deploy any Cisco or third-party network virtual service with Cisco’s [Network Services Orchestrator (NSO)][9] or any other northbound management and orchestration system.
  * The Cisco [Catalyst 9500 Series][10] aggregation switches. Based on an x86 CPU, the Catalyst 9500 Series is Cisco’s lead purpose-built fixed core and aggregation enterprise switching platform, built for security, IoT, and cloud. The switches come with a 4-core x86, 2.4-GHz CPU, 16-GB DDR4 memory, and 16-GB internal storage.



If the features of the package sound familiar, that’s because the [Cloud onRamp for CoLocation][11] package is the second generation of a similar SD-WAN package offered by Viptela which Cisco [bought in 2017][12].

SD-WAN's driving principle is to simplify the way big companies turn up new links to branch offices, better manage the way those links are utilized – for data, voice or video – and potentially save money in the process.

It's a profoundly hot market with tons of players including [Cisco][13], VMware, Silver Peak, Riverbed, Aryaka, Fortinet, Nokia and Versa. IDC says the SD-WAN infrastructure market will hit $4.5 billion by 2022, growing at a more than 40% yearly clip between now and then.

[SD-WAN][14] lets networks route traffic based on centrally managed roles and rules, no matter what the entry and exit points of the traffic are, and with full security. For example, if a user in a branch office is working in Office365, SD-WAN can route their traffic directly to the closest cloud data center for that app, improving network responsiveness for the user and lowering bandwidth costs for the business.

"SD-WAN has been a promised technology for years, but in 2019 it will be a major driver in how networks are built and re-built," Oswal said a Network World [article][15] earlier this year.

Join the Network World communities on [Facebook][16] and [LinkedIn][17] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3393232/cisco-boosts-sd-wan-with-multicloud-to-branch-access-system.html#tk.rss_all

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/02/istock-578801262-100750453-large.jpg
[2]: https://www.networkworld.com/article/3209131/what-sdn-is-and-where-its-going.html
[3]: https://www.networkworld.com/article/3323407/sd-wan/how-to-buy-sd-wan-technology-key-questions-to-consider-when-selecting-a-supplier.html
[4]: https://www.networkworld.com/article/3328488/backup-systems-and-services/how-to-pick-an-off-site-data-backup-method.html
[5]: https://www.networkworld.com/article/3250664/lan-wan/sd-branch-what-it-is-and-why-youll-need-it.html
[6]: https://www.networkworld.com/article/3285728/sd-wan/what-are-the-options-for-securing-sd-wan.html?nsdr=true
[7]: https://blogs.cisco.com/enterprise/cisco-sd-wan-cloud-onramp-for-colocation-multicloud
[8]: https://www.cisco.com/c/en/us/products/collateral/switches/cloud-services-platform-5000/nb-06-csp-5k-data-sheet-cte-en.html#ProductOverview
[9]: https://www.cisco.com/go/nso
[10]: https://www.cisco.com/c/en/us/products/collateral/switches/catalyst-9500-series-switches/data_sheet-c78-738978.html
[11]: https://www.networkworld.com/article/3207751/viptela-cloud-onramp-optimizes-cloud-access.html
[12]: https://www.networkworld.com/article/3193784/cisco-grabs-up-sd-wan-player-viptela-for-610m.html?nsdr=true
[13]: https://www.networkworld.com/article/3322937/what-will-be-hot-for-cisco-in-2019.html
[14]: https://www.networkworld.com/article/3031279/sd-wan/sd-wan-what-it-is-and-why-you-ll-use-it-one-day.html
[15]: https://www.networkworld.com/article/3332027/cisco-touts-5-technologies-that-will-change-networking-in-2019.html
[16]: https://www.facebook.com/NetworkWorld/
[17]: https://www.linkedin.com/company/network-world
