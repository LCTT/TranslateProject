[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (NVMe over Fabrics enterprise storage spec enters final review process)
[#]: via: (https://www.networkworld.com/article/3411958/nvme-over-fabrics-enterprise-storage-spec-enters-final-review-process.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

NVMe over Fabrics enterprise storage spec enters final review process
======
The NVMe over Fabric (NVMe-oF) architecture is closer to becoming a formal specification. It's expected improve storage network fabric communications and network performance.
![Gremlin / Getty Images][1]

NVM Express Inc., the developer of the [NVMe][2] spec for enterprise SSDs, announced that its NVMe-oF architecture has entered a final 45-day review, an important step toward release of a formal specification for enterprise SSD makers.

NVMe-oF stands for [NVMe over Fabrics][3], a mechanism to transfer data between a host computer and a target SSD or system over a network, such as Ethernet, Fibre Channel (FC), or InfiniBand. NVM Express first released the 1.0 spec of NVMe-oF in 2016, so this is long overdue.

**[ Read also: [NVMe over Fabrics creates data-center storage disruption][3] ]**

NVMe has become an important advance in enterprise storage because it allows for intra-network data sharing. Before, when PCI Express-based SSDs first started being used in servers, they could not easily share data with another physical server. The SSD was basically for the machine it was in, and moving data around was difficult.

With NVMe over Fabrics, it’s possible for one machine to directly reach out to another for data and have it transmitted over a variety of high-speed fabrics rather than just Ethernet.

### How NVMe-oF 1.1 improves storage network fabric communication

The NVMe-oF 1.1 architecture is designed to improve storage network fabric communications in several ways:

  * Adds TCP transport supports NVMe-oF on current data center TCP/IP network infrastructure.
  * Asynchronous discovery events inform hosts of addition or removal of target ports in a fabric-independent manner.
  * Fabric I/O Queue Disconnect enables finer-grain I/O resource management.
  * End-to-end (command to response) flow control improves concurrency.



### New enterprise features for NVMe 1.4

The organization also announced the release of the NVMe 1.4 base specification with new “enterprise features” described as a further maturation of the protocol. The specification provides important benefits, such as improved quality of service (QoS), faster performance, improvements for high-availability deployments, and scalability optimizations for data centers.

Among the new features:

  * Rebuild Assist simplifies data recovery and migration scenarios.
  * Persistent Event Log enables robust drive history for issue triage and debug at scale.
  * NVM Sets and IO Determinism allow for better performance, isolation, and QoS.
  * Multipathing enhancements or Asymmetric Namespace Access (ANA) enable optimal and redundant paths to namespaces for high availability and full multi-controller scalability.
  * Host Memory Buffer feature reduces latency and SSD design complexity, benefiting client SSDs.



The upgraded NVMe 1.4 base specification and the pending over-fabric spec will be demonstrated at the Flash Memory Summit August 6-8, 2019 in Santa Clara, California.

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3411958/nvme-over-fabrics-enterprise-storage-spec-enters-final-review-process.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/02/big_data_storage_businessman_walks_through_futuristic_data_center_by_gremlin_gettyimages-1098116540_2400x1600-100788347-large.jpg
[2]: https://www.networkworld.com/article/3280991/what-is-nvme-and-how-is-it-changing-enterprise-storage.html
[3]: https://www.networkworld.com/article/3394296/nvme-over-fabrics-creates-data-center-storage-disruption.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
