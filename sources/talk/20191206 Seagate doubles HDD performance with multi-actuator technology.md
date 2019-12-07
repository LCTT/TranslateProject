[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Seagate doubles HDD performance with multi-actuator technology)
[#]: via: (https://www.networkworld.com/article/3487824/seagate-doubles-hdd-performance-with-multi-actuator-technology.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Seagate doubles HDD performance with multi-actuator technology
======
By using two separate drive heads, a single drive effectively becomes two in Seagate's Exos 2X14 hard disk drive.
monsitj / Getty Images

Seagate has taken the wraps off its Exos 2X14 enterprise hard drive. It's the first to integrate Seagate's MACH.2 multi-actuator technology, which is a method of turning one hard disk into two and doubling performance.

The technology is pretty straightforward. Say you have four platters in a disk drive. The actuator controls the drive heads and moves them all in unison over all four platters. Seagate's multi-actuator makes two independent actuators out of one, so in a six-platter drive, the two actuators cover three platters each.

**READ MORE:** [SSD vs. HDD: Choosing between solid-state and hard-disk drives][1]

The technology has been around for awhile, but it was too expensive to be viable. Until now. Seagate managed to produce the technology in a cost-effective way and announced the Exos 2X14, which is being tested by Microsoft in its Azure data centers.

The 14TB Exos 2X14 connects via a SAS interface and appears to the server as two 7TB volumes rather than as a single 14RB drive. With two actuators, double the data can be read and write within a single HDD.

The application potential is pretty broad: Seagate claims the MACH.2 interface has demonstrated benefits over single-actuator drives for applications such as content delivery networks, video streaming, mail servers, backup services, Hadoop, cloud applications, and more.

While SSDs have buried HDDs in terms of performance, they simply can’t match HDDs for capacity. Of course there are multi-terabyte SSDs available, but they cost many times more than the 12TB/14TB HDD drives that Seagate and its chief competitor Western Digital offer. And data centers are not about to go all-SSD yet, if ever. So there's definitely a place for faster HDDs in the data center.

Microsoft has been testing Exos 2X14 enterprise hard drives with MACH.2 technology to see if it can maintain the IOPS required for some of Microsoft’s cloud services, including Azure and the Microsoft Exchange Online email service, while increasing available storage capacity per data-center slot.

In order to meet their service level agreements, cloud customers need to achieve a certain level of performance. Data center architects look at enterprise SSDs as one way to provide high IOPS, but SSDs are limited in deployment compared to HDDs. The fact is, HDDs with their lower cost-per-terabyte and higher capacities remain the most effective mass storage tier for cloud providers and on-premises deployments alike.

Microsoft has performed deployment testing of the Exos 2X14, including full infrastructure testing for interoperability and compatibility with the data center infrastructure, product robustness, reliability and ease of integration with its Project Olympus system architecture.

Microsoft partner architect Aaron Ogus worked directly with Seagate on the MACH.2 technology from the beginning and said it delivers the 2x performance boost.

"We did a lot of early testing on Exos 2X14 engineering development units and have now tested out Seagate's Exos 2X14 CTUs (early production customer test units), and based upon that analysis we’ve found we are getting close to twice the throughput and IOPS, which are the improvements we expected to achieve with the MACH.2 technology," Ogus said in a statement.

Microsoft ran a series of tests simulating Exchange 2013 and Exchange 2016 disk I/O load on a server to verify the performance and stability of a disk subsystem. Microsoft has tested sequential throughput (simulating backup operations or streaming) and random read IOPS testing (simulating hyperscale and CDN workloads), among other scenarios.

Seagate said the Exos MACH.2 HDDs will be available in multiple SKUs to accommodate different enterprise use cases, but it has not said when the drives will come to market.

Join the Network World communities on [Facebook][2] and [LinkedIn][3] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3487824/seagate-doubles-hdd-performance-with-multi-actuator-technology.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3482988/ssd-vs-hdd-how-to-choose-between-solid-state-drives-and-hard-disk-drives.html
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world
