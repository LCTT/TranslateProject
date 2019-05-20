[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (NVMe over Fabrics creates data-center storage disruption)
[#]: via: (https://www.networkworld.com/article/3394296/nvme-over-fabrics-creates-data-center-storage-disruption.html)
[#]: author: (John Edwards )

NVMe over Fabrics creates data-center storage disruption
======
By delivering high speed and low latency storage over a network fabric, NVMe over Fabrics promises to take demanding applications to a new level of performance. Here's what you need to know.
![Henrik5000 / Getty Images][1]

It's quite a mouthful, but Non-Volatile Memory Express over Fabrics (NVMeoF) is shaping up to become perhaps the most disruptive data center storage technology since the introduction of solid-state drives ([SSD][2]), promising to bring new levels of performance and economy to rapidly expanding storage arrays.

NVMe over Fabrics is designed to deliver the high-speed and low-latency of NVMe SSD technology over a network fabric. There are currently three basic NVMe fabric implementations available: NVMe over Fibre Channel, NVMe over remote direct memory access, and NVMe over TCP.

**Read more about enterprise storage**

  * [Why NVMe? Users weigh benefits of NVMe-accelerated flash storage][3]
  * [What is hyperconvergence?][4]
  * [How NVMe is changing enterprise storage][5]
  * [Making the right hyperconvergence choice: HCI hardware or software?][6]



When the first NVMe SSDs arrived, storage received a massive speed boost, yet the devices still talked to servers over a SCSI-based host connection, a capable yet aging technology with roots stretching back to the 1980s. "What was needed was some way to allow the [NVMe protocol][5] to be used from the CPUs on the server all the way through the network and into the storage array built with NVMe SSDs," explains Eric Burgener, a research vice president in the infrastructure systems, platforms and technologies group at technology research firm [IDC][7]. "That’s what NVMeoF is—a way to run the NVMe protocol over a switched fabric."

Unlike its predecessor, NVMeoF was specifically developed for use with solid-state media. "It doesn't even work with hard disk drives (HDD), yet it gives you much better access to all the great advantages that you have with solid-state media than SCSI did," Burgener notes.

The various NVMeoF versions offer media latency and IOPS per gigabyte that are orders of magnitude better than current solid-state-based storage systems, not to mention HDDs, observes Jeff Kimmel, storage CTO at [Hewlett-Packard Enterprise][8]. "SCSI-based SAN protocols perform very well for solid state storage, but there's still room for improvement in both latency and resource efficiency."

### Higher throughput, lower latency

As servers grow more powerful and storage gains speed with all-flash arrays, the storage fabric will become the bottleneck preventing optimal end-to-end performance," predicts Stuart McRae, storage director of the [Lenovo Data Center Group][9]. "NVMeoF will increase performance for both applications and the network," he says, noting that adopters moving to NVMeoF can expect to receive a 2x improvement in throughput and 52 percebt lower latency.

NVMeoF also opens the way for the pooling and sharing of NVMe SSDs housed in external enclosures known as JBoFs (Just a Bunch of Flashes). "By marrying external NVMe drives with a low-latency, high-efficiency fabric to access them, internal, server-attached SSDs can be replaced with shared resources," Kimmel says. "This block-storage disaggregation enables benefits that have typically been limited to shared storage arrays attached via Fibre Channel or iSCSI SANs."

NVMeoF is a technology that many IT leaders have a hard time wrapping their heads around, observes J Metz, a member of the [Storage Networking Industry Association's][10] board of directors. "For a long time, data center storage has really been incremental—learn a new interface, learn a new management thing, or learn a new box," he notes. NVMeoF is different, however. It changes the way IT leaders view the connection between computing power and storage power. "Instead of a one-to-one relationship that you normally have, now it can possibly be a many-to-many," Metz says.

### NVMe over Fabrics use cases

Not surprisingly, organizations that have performance- and latency-sensitive applications stand to benefit most from NVMeoF. Leading use cases include databases, analytic applications, security applications (such as facial recognition) and transaction processing, McRae says. "For example, a large database that does a query or transaction to external storage where the response time needs to be instantaneous, will benefit from NVMeoF," he says.

Enterprises that rely on super-high-performance databases, such as Wall Street traders, are particularly looking forward to NVMeoF. These organizations are generally eager to embrace the highest performance technologies, regardless of cost. "If they can make the system faster, and go from1,000 to 5,000 transactions per second, then they make more money," Burgener says.

Yet many routine applications will receive little or no benefit from NVMeoF. "Not all applications require low-latency, high-throughput performance," McRae says. "Examples include backup/archive, video storage and traditional file serving."

On the other hand, even less-demanding applications have the chance to become faster and more responsive when bundled together under an NVMeoF umbrella. "It's what I would call a ''general-purpose mixed-workload consolidation,'" Burgener notes.

"With NVMe over Fabrics, you’re going to see some very creative thinking in the next couple years," Metz predicts.

### Dispelling NVMe over Fabrics misconceptions

Like a number of emerging technologies, NVMeoF is something of an enigma to many enterprises, particularly those that are generally comfortable with the status quo. Many IT leaders, for instance, believe that migrating to NVMeoF will be prohibitively expensive. But that's not true, McRae says. "Eventually, this technology will be standard in what all organizations buy and everyone can benefit," he observes. "Today ... this capability is standard in many switches, so there is no premium to deploy."

Another misconception is that NVMeoF can be used as a magic bullet, capable of curing virtually any speed-related problem. "If your application is running slow and you buy a higher-performance storage array, that's only going to make the application run faster if storage was the problem," Burgener notes. "If you’re already running SSDs in a system, it’s a lot less likely that storage is the problem than it was when you had HDDs."

One very real NVMeoF drawback is NVMes' prodigious power appetite.

"People don't think about the power-consumption issue," Burgener observes. NVMe devices use considerably more power than SCSI-based SSDs. "If your data center is already operating very near its maximum power budget, even though you might need less floorspace if you move to NVMe, that might put you over your power budget," he notes.

### Planning and preparing for NVMe over Fabrics

With NVMeoF destined to become a mainstream technology, IT managers should begin planning now.

"Successfully deploying NVMeoF in production demands a robust ecosystem in support of use-case requirements, not just a protocol implementation," Kimmel says. "On the opportunity side, NVMeoF is a catalyst for significant evolution in data-center architecture."

Important first steps include vetting the existing network infrastructure for NVMeoF readiness, including the availability of sufficient network bandwidth, the composability/provisioning of virtual networks and, where applicable, Remote Direct Memory Access (RDMA) readiness. "Additionally, anticipating specific future benefits from storage disaggregation may inform better aligned deployment decisions today," Kimmel notes.

Servers may also need to be prepared for NVMeoF compatibility. Decide on the interconnect, Fibre Channel or Ethernet, and then ensure that the server is equipped with the right level of host bus adapter (HBA), advises Andy Walls, an IBM Fellow and CTO of flash storage at IBM. "Many servers will need to have newer HBAs that support the standards," he adds.

McRae says it's also a good idea to begin deploying fabric switches that support NVMeoF. "If using Fibre Channel, shift new switch and adapter deployments to 32GB solutions that have NVMeoF," he suggests. "For an Ethernet network, choose RDMA over Converged Ethernet (RoCE) 25G or faster switches."

No organization should adopt NVMeoF before it can project a net benefit for specifc use cases, Kimmel advises. It also pays to think big, he notes. "Internal storage implemented at small scale, such as in many remote office/branch office use cases, may not realize any benefit from fabric-based storage."

Additionally, use cases at scale where internal storage remains the best deployment model may not need or benefit from NVMeoF. "Examples include use cases with extreme bandwidth requirements or software architectures optimized for internal storage," Kimmel says.

### NVMeoF outlook

Earlier this year, a new flavor of NVMeoF emerged: NVMeoF over TCP, which takes advantage of the simple and efficient TCP/IP fabric. "Prior to that, you had to buy custom hardware and also custom drivers to install on your server to be able to use NVMe over Fabric," Burgener explains. "The TCP version that is just starting to ship doesn’t require any custom hardware or software."

Cloud-scale Web infrastructure enterprises will be among the first organizations to adopt this new approach, Burgener says. "They've been waiting with baited breath for it," he says. "You're going to see it implemented at Facebook, Google and cloud providers like Amazon and Microsoft Azure."

Such organizations are not likely to add the technology to all of their servers, at least not immediately, Burgener notes. "But they want to have a higher performance storage option, and this just makes it very easy to do it at, basically, not much additional cost."

Other potential NVMeoF adopters should proceed cautiously, however, since many of NVMeoF’s underlying components are still at an embryonic stage. Hypervisors and operating systems are just starting to roll out full support for multi-pathing and Asymmetric Namespace Access (ANA).

"Most data centers are waiting for these standards to mature before adopting NVMeoF in a big way," Walls notes. "However, as we progress further into 2019 and 2020, adoption will increase, and organizations will start to achieve the potential benefits."

Several vendors, including IBM, NetApp and Dell EMC and Pure Storage, are already offering NVMeoF systems, Burgener says. "At this point we haven’t seen a system announced from HPE or Hitachi, but the market's developing very quickly," he notes. "We’re very likely to see systems be announced from those vendors this year."

Join the Network World communities on [Facebook][11] and [LinkedIn][12] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3394296/nvme-over-fabrics-creates-data-center-storage-disruption.html

作者：[John Edwards][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: 
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/08/server_virtualization_data_center_storage_by_henrik5000_gettyimages-173170498_1200x800-100768151-large.jpg
[2]: https://www.networkworld.com/article/3326058/what-is-an-ssd.html
[3]: https://www.networkworld.com/article/3290421/storage/why-nvme-users-weigh-benefits-of-nvme-accelerated-flash-storage.html
[4]: https://www.networkworld.com/article/3207567/what-is-hyperconvergence
[5]: https://www.networkworld.com/article/3280991/what-is-nvme-and-how-is-it-changing-enterprise-storage.html
[6]: https://www.networkworld.com/article/3318683/making-the-right-hyperconvergence-choice-hci-hardware-or-software
[7]: https://www.idc.com/
[8]: https://www.hpe.com/us/en/home.html
[9]: https://solutions.lenovo.com/data-center-solutions/
[10]: https://www.snia.org/
[11]: https://www.facebook.com/NetworkWorld/
[12]: https://www.linkedin.com/company/network-world
