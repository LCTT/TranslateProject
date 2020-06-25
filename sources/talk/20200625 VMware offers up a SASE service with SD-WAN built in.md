[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (VMware offers up a SASE service with SD-WAN built in)
[#]: via: (https://www.networkworld.com/article/3564154/vmware-offers-up-a-sase-service-with-sd-wan-built-in.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

VMware offers up a SASE service with SD-WAN built in
======
VMware SD-WAN Zero Trust Service addresses the need to secure remote access for growing remote workforces.
sd-wan

VMware is boosting secure access for remote and mobile workers by mixing its Workspace ONE offering with its [SD-WAN][1] package.

The resulting VMware SD-WAN Zero Trust Service promises to help enterprises  handle growing distributed workloads for remote workers. The service also represents a big step toward [secure-access service edge (SASE)][2], a new secuity architecture with a growning portfolio of products across vendors that promise to blend SD-WAN networking and security technologies into cloud-based services.

**More about SD-WAN**: [How to buy SD-WAN technology: Key questions to consider when selecting a supplier][3] • [How to pick an off-site data-backup method][4] •  [SD-Branch: What it is and why you’ll need it][5] • [What are the options for security SD-WAN?][6]

“The scope of SD-WAN is expanding to include remote desktops, laptops and mobile users and much of that expansion is due to the COVID-19 pandemic,” said Sanjay Uppal, vice president and general manager of VMware’s VeloCloud Business Unit.  “There is a growing need for zero trust networks as companies don’t want to allow this influx of remote users to come into the network and go anywhere. IT needs to control device access to specific applications or containers.”

Specifically, the VMware SD-WAN Zero Trust Service will be delivered through VMware’s service-node network deployed across more than 100 global locations, operated by both VMware and more than 120 telecom service-provider partners.  It will also become part of its VMware Workspace ONE Intelligent Hub, which is used on millions of devices, Uppal said.

According to VMware, the Workspace ONE platform securely manages end users' mobile devices and cloud-hosted virtual desktops and applications from the cloud or on-premise.

The remote-access client automatically connects to the closest VMware SD-WAN cloud PoP. Based on enterprise policy, the user traffic may be passed to a cloud firewall, a web security service, to another enterprise branch or data center, to an application or service that's needed. The service employs split tunneling in which only enterprise traffic goes to the service; personal traffic gets forwarded directly to the internet.

The idea is to avoid latency-inducing hairpinned paths through an enterprise data center where strained VPN appliances might have been hosted in the past, Uppal said. The service works with a variety of third-party services from vendors such as Zscaler, Uppal said.

Routing policy and security controls remain in enterprise control while the VMware SD-WAN cloud service handles scaling, management, upgrading and multi-region VPN service presence, Uppal said.

If users work from home or travel, the service establishes secure trust with their devices and grants access to authorized applications. The service supports multi-factor authentication, Uppal said.

In the future the service will be integrated with AI-based network management and analytics that VMware recently bought from [Nyansa][7].

When VMware bought  Nyansain January it said the technology would be targeted at boosting monitoring and troubleshooting for LAN/WAN deployments within its [SD-WAN package][8]. 

### SASE on the rise

The market behind SASE is growing, with VMware, Cisco and others including Palo Alto, Cato Networks, Fortinet and many more taking steps toward supporting it. 

Jeff Reed, senior vice president of product, Cisco’s Security Business Group recently wrote in a [blog][9] post: “The rapid adoption of [SD-WAN][10] for connecting to [multi-cloud][11] applications provides enterprises with the opportunity to rethink how access and security are managed from campus to cloud to edge. With 60% of organizations expecting the majority of applications to be in the cloud by 2021 and over 50% of the workforce to be operating remotely, new networking and security models such SASE offer a new way to manage the new normal.”

At this point though vendors such as VMware and Cisco, while it is important that they support SASE concepts full-on, are still very early in the journey, said Lee Doyle, principal analyst at Doyle Research and [Network World][12] contributor. 

“VMware says VPNs are broken and hard to manage and don’t scale well; indeed its time for a new type of integrated, more cloud-oriented endpoint security and this new service is a good start,” he said.

Join the Network World communities on [Facebook][13] and [LinkedIn][14] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3564154/vmware-offers-up-a-sase-service-with-sd-wan-built-in.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3031279/sd-wan-what-it-is-and-why-you-ll-use-it-one-day.html
[2]: https://www.networkworld.com/article/3545778/sase-could-bolster-security-for-remote-workers.html
[3]: https://www.networkworld.com/article/3323407/sd-wan/how-to-buy-sd-wan-technology-key-questions-to-consider-when-selecting-a-supplier.html
[4]: https://www.networkworld.com/article/3328488/backup-systems-and-services/how-to-pick-an-off-site-data-backup-method.html
[5]: https://www.networkworld.com/article/3250664/lan-wan/sd-branch-what-it-is-and-why-youll-need-it.html
[6]: https://www.networkworld.com/article/3285728/sd-wan/what-are-the-options-for-securing-sd-wan.html
[7]: http://www.networkworld.com/cms/article/additional%20sec%20services
[8]: https://www.networkworld.com/article/3434619/vmware-touts-hyperscale-sd-wan.html
[9]: https://blogs.cisco.com/security/building-a-bridge-to-secure-access-service-edge
[10]: https://www.networkworld.com/article/3527194/multicloud-security-integration-drive-massive-sd-wan-adoption.html
[11]: https://www.networkworld.com/article/3429258/real-world-tools-for-multi-cloud-management.html
[12]: https://www.networkworld.com/author/Lee-Doyle/?start=12
[13]: https://www.facebook.com/NetworkWorld/
[14]: https://www.linkedin.com/company/network-world
