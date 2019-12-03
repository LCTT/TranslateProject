[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Branch Office SD-WAN Availability: Last-Mile Considerations)
[#]: via: (https://www.networkworld.com/article/3482378/branch-office-sd-wan-availability-last-mile-considerations.html)
[#]: author: (Cato Networks https://www.networkworld.com/author/Matt-Conran/)

Branch Office SD-WAN Availability: Last-Mile Considerations
======
Here’s how to ensure that branch office last-mile availability on an SD-WAN matches, or even exceeds, that of an MPLS service.
metamorworks

MPLS is showing its age in the era of digital transformation. SD-WAN’s agility, low cost, and direct branch office cloud access increasingly make more sense for global, cloud-enabled organizations. The big question for many IT leaders is: Can  [SD-WANs][1] and their Internet last-mile connections match MPLS’s availability to serve as an [MPLS alternative][2]?

The short answer? Yes.  Here’s why.

### **MPLS’s Last-Mile Availability Problem**

MPLS has long been known for its uptime. As managed services that’s no surprise; the telcos do a very good job keeping an eye on the core of their networks. But what’s often a surprise to outsiders is the problem MPLS services have with the last mile. The high cost of MPLS services makes it impractical to equip branch offices with redundant last-mile MPLS connections, and without redundancy delivering on uptime is challenging. And even with Internet backup, failover is often manual or slow enough to disrupt the user experience.

And when MPLS networks connect offices out of region, things are even worse. MPLS providers lose management control over the last-mile connection, relying on their local partners to troubleshoot—often with disastrous consequences.

“In Brazil, we had a problem with an MPLS circuit, and the office was out of service for six months,” says [Ville Sarja, CIO  of Salcomp][3], an electronics manufacturer. “Luckily we had Internet redundancy. Our MPLS provider was never able to resolve the problem.”

### **High Availability for Branch Office SD-WAN and Security Devices**

But precisely because SD-WAN was designed to use affordable, unpredictable Internet connections, the technology addresses many of the last-mile issues ignored by MPLS. [Research has shown that a fully redundant SD-WAN connection][4] can match and even exceed the uptime of MPLS. But redundancy at every stage of the SD-WAN design is essential.

Within the branch office, that means redundant SD-WAN devices and (if relevant) security infrastructure. The SD-WAN devices should be configured in high availability (HA) configuration. That’s what [Sanne Group, a global provider of alternative asset and corporate administrative services,][5] did when the company switched from MPLS and Internet connections to SD-WAN.

Be sure to consider the upfront and ongoing management costs of that additional appliance.  Sanne Group was able to afford equipping its branch offices with redundant Cato Sockets, Cato’s SD-WAN device, by using Cato’s Affordable HA configuration, which carries no additional recurring charge on the secondary Socket.

In addition, if you’re deploying branch office security devices, they too need to be fully redundant. A [secure access service edge (SASE)][6] service, such as Cato Cloud, will already include the necessary security services, saving those headaches. 

### **Active/Active for Last-Mile Redundancy**

With your branch devices configured in HA, turn your attention to the last mile. Every SD-WAN device on the market today will provide some last-mile protection, running two or more last-mile connections in active/active mode. Not only does that improve last-mile uptime but (a bit off topic here) it provides you with a way to easily grow the capacity of a branch office either by increasing last-mile connection bandwidth or by adding more connections.

SD-WAN devices actively monitor the last-mile. Should there be a brownout or blackout, SD-WAN devices will automatically move traffic to the alternate connection. Custom policies guide the failover (and failback), prioritizing key applications or flows accordingly. Depending on the platform, failover is often fast enough to prevent impacting the user experience.

### **Diverse Routing to Protect Against Circuit Breaks**

Alone, active/active configurations enable companies to dramatically improve last-mile availability. Still, there’s no guarantee that the two connections won’t share common physical infrastructure (such as ducting). An errant backhoe operator, for example, can accidently sever the last-mile line, disrupting both connections.

Which is why best practices call for diverse routing to branch offices. The two last-mile connections shouldn’t share any common last-mile infrastructure. Ideally the connections should come in from separate points of entry, using separate wiring ducts, and more.

Ascertaining whether cabling is diversely routed isn’t always feasible, which is why many enterprises prefer to mix last-mile technologies. Case in point is Centrient, a global pharmaceutical company. When the company switched from MPLS to SD-WAN, [Matthieu Cijsouw, the Global IT Manager at Centrient][7], connected his offices with two and sometimes three last-mile Internet connections using different last-mile technologies—typically fiber and radio.

### **Dual Homing to Protect Against ISP Failures**

Diverse routing all but removes the possibility of an outage occurring because of some physical event in the last mile. However, it doesn’t protect you from a failure in the ISP infrastructure. If both diversely routed connections terminate on the same router, for example, the branch office is still susceptible to a to a router failure.

To protect against such ISP outages, best practices for reliability call for dual homing branch offices—that is, connecting the offices to at least two ISPs, ideally on two different Internet backbones. Should the ISPs sit on the same Internet backbone, a backbone outage or meltdown will still disconnect the branch.

Just ask [Sun Rich][8], a provider of fresh-cut fruit to food service and retail markets, which discovered how much Internet routes can underperform even in the US and other developed regions. Even with multiple local Internet links, ISPs bounced traffic from the company’s Pennsylvania office across 30 hops before reaching Sun Rich’s data center, says Sun Rich’s systems administrator Adam Laing.

Of course, insisting that ISPs be on separate Internet backbones defies best practices from a performance engineering standpoint. [Generally, intra-Internet backbone performance is better than inter-Internet backbone performance][9]. A properly designed global private backbone offers a compromise, providing better-than-Internet performance but built with the necessary redundancy to prevent an outage. [Cato Cloud is one such approach][10].

How many of these strategies you incorporate depends on how much you’re willing to spend vs. the cost of downtime in lost revenue. By incorporating SD-WAN HA with dual-homing and diverse routing, organizations can ensure they achieve that coveted “five nines” availability even at their branch offices.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3482378/branch-office-sd-wan-availability-last-mile-considerations.html

作者：[Cato Networks][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Matt-Conran/
[b]: https://github.com/lujun9972
[1]: https://www.catonetworks.com/sd-wan?utm_source=idg
[2]: https://www.catonetworks.com/blog/mpls-alternatives-can-sd-wan-replace-mpls?utm_source=idg
[3]: https://www.catonetworks.com/customers/salcomp-replaces-global-mpls-firewalls-and-wan-optimizers-with-cato-cloud?utm_source=idg
[4]: https://www.sd-wan-experts.com/blog/calculate-network-availability-multiple-wan-circuits/
[5]: https://www.catonetworks.com/customers/sanne-group-replaces-internet-and-mpls-simplifying-citrix-access-and-improving-performance-with-cato-cloud?utm_source=idg
[6]: https://www.catonetworks.com/sase?utm_source=idg
[7]: https://www.catonetworks.com/customers/pharmaceutical-leader-replaces-mpls-with-cato-cloud-cutting-costs-while-quadrupling-capacity?utm_source=idg
[8]: https://www.catonetworks.com/customers/sun-rich-converges-network-and-security-into-cato-cloud?utm_source=idg
[9]: https://go.catonetworks.com/Cato-Networks-Internet-is-Broken?utm_source=idg
[10]: https://www.catonetworks.com/cato-cloud#global-private-backbone
