[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Western Digital rolls out NVMe-over-Fabric SSDs for legacy storage migration)
[#]: via: (https://www.networkworld.com/article/3564607/western-digital-rolls-out-nvme-over-fabric-ssds-for-legacy-storage-migration.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Western Digital rolls out NVMe-over-Fabric SSDs for legacy storage migration
======
An all-flash NVMeoF system from Western Digital is designed to replace SATA and SAS for high-performance applications in the enterprise.
[Quest Software][1]

Western Digital is firmly associated with traditional mechanical hard drives, but now it has launched one of the first all-flash solutions for enterprises looking to migrate off traditional storage and enable high-performance apps.

The company announced a new enterprise SSD designed for high-bandwidth, low-latency apps, a high-speed [NVMe][2] controller, and one of the first, if not the first [NVMe-over-fabrics][3] storage devices. (Even Western and analysts I spoke with aren’t really sure if this is a first.)

What is clear is that with the drive, controller, and enclosure, WD now has a complete all-flash storage offering that is entirely made by the company. It even makes its own NAND flash memory chips through a partnership with Kioxia, formerly Toshiba.

WD says that cloud hyperscalers have heavily adopted NVMe but traditional enterprises are still largely using SSDs with SATA and SAS interfaces. The announcement last week was specifically aimed at enterprises looking to migrate to NVMe for applications that need high performance, low latency and dual-port high availability for things like [high-performance computing (HPC)][4], cloud computing, SQL/NoSQL databases, virtualization (VMs/containers), AI/ML and data analytics.

There's three pieces to this scheme: an NVMe [SSD][5], a controller and an NVMeoF storage platform.

### A dual-port NVMe SSD

The first piece of the pie is the dual-port Ultrastar DC SN840 NVMe SSD. A dual-port SSD has the ability to be connected to two hosts at a time for greater throughput. They can be connected directly to a host CPU or via PCIe switch.

Phil Bullinger, senior vice president for the data-center business at WD, said the SN840 is for companies transitioning from SAS and focused on cloud and mission-critical apps that require high availability. It complements the SN860, which is designed for high-read workloads, and the SN340m designed for large block apps.

“The common theme around these use models is they put a number of SSDs together for deployments of multiple mixed drives,” he said. “This allows for consistent response time and low latencies. The dual-ported nature is key. Enterprise adoption of SSDs is a typical workload that uses dual port so you have redundant ports to all resources.”

The Ultrastar DC SN840 Gen3.1 NVMe SSD is the company’s third-generation solution with a vertically integrated in-house NVMe controller, firmware and 96-layer 3D TLC NAND technology. It has capacity ranging from 1.6TB to 15.36TB.

### The controller 

The RapidFlex controller provides sub-500 nanosecond latency for projected platform performance of up to 13M IOPS, when used in a six-controller configuration. The six controllers can be connected to a 100GBit Ethernet connection without requiring a switch.

### The NVMe-oF storage platform

The controllers and SSDs go into the third piece, the OpenFlex Data24 NVMe-oF Storage Platform. OpenFlex Data24 is a 2U device able to hold 24 hot swappable SSDs for up to 368TB of storage. It enables the full bandwidth of Ultrastar NVMe SSDs to be shared by multiple hosts over a low-latency Ethernet fabric as if they were locally attached to the servers.

Enterprise SSD has gone through three stages of growth. Step one was a PCI Express card plugged into a server. That drive could only be accessed by the server in which it was installed. Then came NVMe, which allowed for SSDs to be accessed by servers other than where they resided, but it required a hardwired connection.

NVMe-over-fabric means any server can access any SSD, no dedicated connections needed. Simply connect the OpenFlex Data24 to the switch in the server cabinet and it is accessible by any server.

“The challenge has been how do you get all the performance potential out of all these drives?” says Bullinger. “An HCI system would have all these servers landlocked inside a single chassis. The fabric takes the capabilities of NVMe and shares over an Ethernet fabric. This opens drives to a collection of servers versus drives landlocked to a single server at the same time.”

RapidFlex NVMe-oF controllers are available now, the Ultrastar DC SN840 NVMe SSD will begin shipping next month and the OpenFlex Data24 NVMe-oF Storage Platform is scheduled to ship in late 2020.

Join the Network World communities on [Facebook][6] and [LinkedIn][7] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3564607/western-digital-rolls-out-nvme-over-fabric-ssds-for-legacy-storage-migration.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.quest.com/whitepaper/storage-switzerland-paper-on-qorestor8134538/
[2]: https://www.networkworld.com/article/3280991/what-is-nvme-and-how-is-it-changing-enterprise-storage.html
[3]: https://www.networkworld.com/article/3394296/nvme-over-fabrics-creates-data-center-storage-disruption.html
[4]: https://www.networkworld.com/article/3444399/high-performance-computing-do-you-need-it.html
[5]: https://www.networkworld.com/article/3326058/what-is-an-ssd.html
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world
