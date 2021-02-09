[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Migrating to SD-WAN? Avoid these Pitfalls, Say IT Leaders)
[#]: via: (https://www.networkworld.com/article/3453198/migrating-to-sd-wan-avoid-these-pitfalls-say-it-leaders.html)
[#]: author: (Cato Networks https://www.networkworld.com/author/Matt-Conran/)

Migrating to SD-WAN? Avoid these Pitfalls, Say IT Leaders
======
Every network migration has its hidden challenges. Here are practical tips from IT pros who've already made the switch to SD-WAN
phototechno

Whether you’re switching from MPLS or Internet VPNs, [SD-WAN][1] can jumpstart network performance, agility, and scalability, particularly for cloud applications. However, as with any migration, there can be challenges and surprises. Don’t squash productivity with unplanned outages or security breaches. Plan your migration carefully, ask the right questions, and cover your bases. Here are some key pitfalls to avoid from those who’ve been there.

### Security Should Work with Your SD-WAN

If you’re used to backhauling cloud traffic through data-center security via MPLS, you’re bound to see a big boost in branch office cloud performance using direct Internet access. However, bypassing data-center security means you must find a way to deliver the same level of security at the branch-office level or risk a data breach. Last year, enterprises with completed SD-WAN deployments were 1.3 times more likely to experience a branch-office security breach than without, Shamus McGillicudy, Research Director at analyst firm Enterprise Management Associates reported on a [recent webinar][2].

In most cases, you’ll need a full suite of security functions at each location, including next-generation firewalls, IPS, malware protection, a secure Web gateway, and a cloud security broker. Andrew Thomson, director of IT systems and services at [BioIVT, a provider of biological products to life sciences and pharmaceutical firms,][3] found out just how much work securing the branch office could be when he was looking at telco SD-WAN solutions.

“Updating our security architecture was going to require running to different vendors, piecing together a solution, and going through all the deployment and management pains,” says Thomson. A simpler option may be to move traffic inspection and security policy enforcement into the cloud.

### Size Appliances with Room to Grow

Costs may be lowering when comparing [SD-WAN vs. MPLS][4], but that initial SD-WAN appliance purchase can be daunting, especially when you add on all the security functions you need to integrate and deploy. Don’t let the cost scare you into skimping on sizing, especially if you’re a growing business. Your branch offices will likely grow, which means more tunnels, features, and bandwidth. Even if they don’t, WAN usage tends to grow with digital transformation and new applications and cloud services

A good rule of thumb is to price another 20% capacity beyond what you think you need today and compare that cost to the cost of upgrading or replacing your appliance in three years. You may want to spring for that capacity now.

### Plan for High Availability

If your business depends on network uptime, you’d better have a solid plan in place for high availability. This means two SD-WAN appliances with failover capabilities at each location AND dual homing with more than one ISP across diversely routed connections for that precious last mile. (Since it’s often hard to be sure last-mile providers don’t share the same underlying infrastructure, it's even better to use LTE with terrestrial connections.) When you’re planning your SD-WAN budget, make sure to account for the licensing fees for those additional backup appliances.

[Salcomp, a manufacturer of adapters for mobile phone companies][5], had to rely on backup local Internet connections to compensate for the erratic connectivity of its MPLS provider’s global last mile connectivity partners.

“In Brazil we had a problem with an MPLS circuit, and the office was out for six months,” says Ville Sarja, CIO and Group Security Officer. “Luckily we had Internet redundancy, so we were able to direct traffic to the Internet, and bandwidth and connectivity were good enough.”

### Test Your Application Performance

Make sure your evaluation includes testing your data-center and cloud applications at different times of the day to ensure they perform as expected under various loads and conditions. If you’re a global organization, make sure you test those applications globally at different times as well. As pointed out in the eBook, [The Internet is Broken][6], global connectivity often depends more on service provider commercial peering relationships than actual best path selection or network congestion. This means that packets may travel across longer distances and more hops than they should, with unnecessarily high latency as a result.

For its SD-WAN evaluation, Salcomp tested SharePoint file transfers and sharing, SAP user experience, and Office 365 performance from its Finland data-center locations across China, Taiwan, and India. By switching from MPLS to a global private backbone, Salcomp was able to reduce costs and improve application performance.

“Users just aren’t complaining anymore,” says Sarja, “And that’s a very good thing.” 

### Make Some Changes and See How Long It Takes

Okay, your SD-WAN seems to be performing, but what about your SD-WAN provider? Are they responsive and competent when you need to make a change or troubleshoot a problem? The only way to find out is to test them as well. Your provider should be able to tell you what its timetable is for every type of change, whether it’s QOS or something else. Ask. Then include a set of predefined changes during the evaluation phase and see if your provider comes through.

[Fisher &amp; Company][7], parent of a precision metal parts company, was glad it tested changes with its chosen SD-WAN provider.

“We trialed a telco-managed SD-WAN service, but the provider was difficult to work with,” says Systems Manager Kevin McDaid. “They wanted us to submit requests for configuration changes; it was like our MPLS provider all over again.”

One way to save valuable time is to choose an SD-WAN provider with a co-management or self-service management model that allows the customer to make some network and security changes directly through a portal. You shouldn’t have to rely on the provider’s staff to make every single change.

### One Step at a Time

Transitions can stumble, so most IT managers prefer a phased migration, with the new SD-WAN functioning side by side with your legacy WAN for a time to permit a quick cutover when necessary.

Draw up a migration plan with your supplier that will cause the least business disruption possible. At minimum, you should be able to transition one network at a time. However, if you want to minimize disruption even further you may want to consider a segment-by-segment transition. If your business depends on application performance, you may even want to transition one business-critical application at a time. 

Make sure your network and security policies are configured and ready to go with each step. You don’t want to leave your organization open to malware and security breaches during the transition by configuring these on the fly.

[Financial information provider FDMG Mediagroep][8] used a carefully planned, phased approach when transitioning to a global private backbone to allay internal concerns about working with a new company. It started by connecting a few users at the Amsterdam office. It then connected an internal AWS site to evaluate cloud connectivity. Once those transitions succeeded it began converting individual production sites to SD-WAN.

And in the end, be sure to have a backup plan if something goes wrong during the cutover to SD-WAN.  Find out how long it takes your vendor to respond when issues come up or even to cut back to your legacy WAN if necessary.

SD-WAN migration can seem overwhelming when you’ve been relying for so long on MPLS. There’s no question there are potential pitfalls, but if you plan carefully and evaluate your strategy step by step along the way, you can reap all the benefits of SD-WAN without the migration headaches. 

** **

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3453198/migrating-to-sd-wan-avoid-these-pitfalls-say-it-leaders.html

作者：[Cato Networks][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Matt-Conran/
[b]: https://github.com/lujun9972
[1]: https://www.catonetworks.com/sd-wan?utm_source=idg
[2]: https://go.catonetworks.com/VOD_The-6-Keys-to-Successful-WAN-Transformation?utm_source=idg
[3]: https://www.catonetworks.com/customers/bioivt-connects-and-secures-global-network-with-cato-cloud-and-the-cato-managed-threat-detection-and-response-mdr-service?utm_source=idg
[4]: https://www.catonetworks.com/blog/sd-wan-vs-mpls-vs-public-internet?utm_source=idg
[5]: https://www.catonetworks.com/customers/salcomp-replaces-global-mpls-firewalls-and-wan-optimizers-with-cato-cloud?utm_source=idg
[6]: https://go.catonetworks.com/The_Internet_is_Broken?utm_source=idg
[7]: https://www.catonetworks.com/customers/fisher-company-lowers-mpls-costs-improves-wan-performance?utm_source=idg
[8]: https://www.catonetworks.com/customers/fdmg-cuts-costs-revolutionizes-mobile-experience-by-replacing-mpls-and-mobile-vpn?utm_source=idg
