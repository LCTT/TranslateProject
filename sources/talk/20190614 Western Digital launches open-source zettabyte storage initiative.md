[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Western Digital launches open-source zettabyte storage initiative)
[#]: via: (https://www.networkworld.com/article/3402318/western-digital-launches-open-source-zettabyte-storage-initiative.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Western Digital launches open-source zettabyte storage initiative
======
Western Digital's Zoned Storage initiative leverages new technology to create more efficient zettabyte-scale data storage for data centers by improving how data is organized when it is stored.
![monsitj / Getty Images][1]

Western Digital has announced a project called the Zoned Storage initiative that leverages new technology to create more efficient zettabyte-scale data storage for data centers by improving how data is organized when it is stored.

As part of this, the company also launched a [developer site][2] that will host open-source, standards-based tools and other resources.

The Zoned Storage architecture is designed for Western Digital hardware and its shingled magnetic recording (SMR) HDDs, which hold up to 15TB of data, as well as the emerging zoned namespaces (ZNS) standard for NVMe SSDs, designed to deliver better endurance and predictability.

**[ Now read:[What is quantum computing (and why enterprises should care)][3] ]**

This initiative is not being retrofitted for non-SMR drives or non-NVMe SSDs. Western Digital estimates that by 2023, half of all its HDD shipments are expected to be SMR. And that will be needed because IDC predicts data will be generated at a rate of 103 zettabytes a year by 2023.

With this project Western Digital is targeting cloud and hyperscale providers and anyone building a large data center who has to manage a large amount of data, according to Eddie Ramirez, senior director of product marketing for Western Digital.

Western Digital is changing how data is written and stored from the traditional random 4K block writes to large blocks of sequential data, like Big Data workloads and video streams, which are rapidly growing in size and use in the digital age.

“We are now looking at a one-size-fits-all architecture that leaves a lot of TCO [total cost of ownership] benefits on the table if you design for a single architecture,” Ramirez said. “We are looking at workloads that don’t rely on small block randomization of data but large block sequential write in nature.”

Because drives use 4k write blocks, that leads to overprovisioning of storage, especially around SSDs. This is true of consumer and enterprise SSDs alike. My 1TB SSD drive has only 930GB available. And that loss scales. An 8TB SSD has only 6.4TB available, according to Ramirez. SSDs also have to be built with DRAM for caching of small block random writes. You need about 1GB of DRAM per 1TB of NAND to act as a buffer, according to Ramirez.

### The benefits of Zoned Storage

Zoned Storage allows for 15-20% more storage on a HDD the than traditional storage mechanism. It eliminates the overprovisioning of SSDs, so you get all the NAND flash the drive has and you need far fewer DRAM chips on an SSD. Additionally, Western Digital promises you will need up to one-eighth as much DRAM to act as a cache in future SSD drives, lowering the cost.

Ramirez also said quality of service will improve, not necessarily that peak performance is better, but it will manage latency from outliers better.

Western Digital has not disclosed what if any pricing is associated with the project. It plans to work with the open-source community, customers, and industry players to help accelerate application development around Zoned Storage through its website.

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3402318/western-digital-launches-open-source-zettabyte-storage-initiative.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/02/big_data_center_server_racks_storage_binary_analytics_by_monsitj_gettyimages-951389152_3x2-100787358-large.jpg
[2]: http://ZonedStorage.io
[3]: https://www.networkworld.com/article/3275367/what-s-quantum-computing-and-why-enterprises-need-to-care.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
