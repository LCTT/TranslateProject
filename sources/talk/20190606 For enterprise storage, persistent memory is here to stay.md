[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (For enterprise storage, persistent memory is here to stay)
[#]: via: (https://www.networkworld.com/article/3398988/for-enterprise-storage-persistent-memory-is-here-to-stay.html)
[#]: author: (John Edwards )

For enterprise storage, persistent memory is here to stay
======
Persistent memory – also known as storage class memory – has tantalized data center operators for many years. A new technology promises the key to success.
![Thinkstock][1]

It's hard to remember a time when semiconductor vendors haven't promised a fast, cost-effective and reliable persistent memory technology to anxious [data center][2] operators. Now, after many years of waiting and disappointment, technology may have finally caught up with the hype to make persistent memory a practical proposition.

High-capacity persistent memory, also known as storage class memory ([SCM][3]), is fast and directly addressable like dynamic random-access memory (DRAM), yet is able to retain stored data even after its power has been switched off—intentionally or unintentionally. The technology can be used in data centers to replace cheaper, yet far slower traditional persistent storage components, such as [hard disk drives][4] (HDD) and [solid-state drives][5] (SSD).

**Learn more about enterprise storage**

  * [Why NVMe over Fabric matters][6]
  * [What is hyperconvergence?][7]
  * [How NVMe is changing enterprise storage][8]
  * [Making the right hyperconvergence choice: HCI hardware or software?][9]



Persistent memory can also be used to replace DRAM itself in some situations without imposing a significant speed penalty. In this role, persistent memory can deliver crucial operational benefits, such as lightning-fast database-server restarts during maintenance, power emergencies and other expected and unanticipated reboot situations.

Many different types of strategic operational applications and databases, particularly those that require low-latency, high durability and strong data consistency, can benefit from persistent memory. The technology also has the potential to accelerate virtual machine (VM) storage and deliver higher performance to multi-node, distributed-cloud applications.

In a sense, persistent memory marks a rebirth of core memory. "Computers in the ‘50s to ‘70s used magnetic core memory, which was direct access, non-volatile memory," says Doug Wong, a senior member of [Toshiba Memory America's][10] technical staff. "Magnetic core memory was displaced by SRAM and DRAM, which are both volatile semiconductor memories."

One of the first persistent memory devices to come to market is [Intel’s Optane DC][11]. Other vendors that have released persistent memory products or are planning to do so include [Samsung][12], Toshiba America Memory and [SK Hynix][13].

### Persistent memory: performance + reliability

With persistent memory, data centers have a unique opportunity to gain faster performance and lower latency without enduring massive technology disruption. "It's faster than regular solid-state NAND flash-type storage, but you're also getting the benefit that it’s persistent," says Greg Schulz, a senior advisory analyst at vendor-independent storage advisory firm [StorageIO.][14] "It's the best of both worlds."

Yet persistent memory offers adopters much more than speedy, reliable storage. In an ideal IT world, all of the data associated with an application would reside within DRAM to achieve maximum performance. "This is currently not practical due to limited DRAM and the fact that DRAM is volatile—data is lost when power fails," observes Scott Nelson, senior vice president and general manager of Toshiba Memory America's memory business unit.

Persistent memory transports compatible applications to an "always on" status, providing continuous access to large datasets through increased system memory capacity, says Kristie Mann, [Intel's][15] director of marketing for data center memory and storage. She notes that Optane DC can supply data centers with up to three-times more system memory capacity (as much as 36TBs), system restarts in seconds versus minutes, 36% more virtual machines per node, and up to 8-times better performance on [Apache Spark][16], a widely used open-source distributed general-purpose cluster-computing framework.

System memory currently represents 60% of total platform costs, Mann says. She observes that Optane DC persistent memory provides significant customer value by delivering 1.2x performance/dollar on key customer workloads. "This value will dramatically change memory/storage economics and accelerate the data-centric era," she predicts.

### Where will persistent memory infiltrate enterprise storage?

Persistent memory is likely to first enter the IT mainstream with minimal fanfare, serving as a high-performance caching layer for high performance SSDs. "This could be adopted relatively-quickly," Nelson observes. Yet this intermediary role promises to be merely a stepping-stone to increasingly crucial applications.

Over the next few years, persistent technology will impact data centers serving enterprises across an array of sectors. "Anywhere time is money," Schulz says. "It could be financial services, but it could also be consumer-facing or sales-facing operations."

Persistent memory supercharges anything data-related that requires extreme speed at extreme scale, observes Andrew Gooding, vice president of engineering at [Aerospike][17], which delivered the first commercially available open database optimized for use with Intel Optane DC.

Machine learning is just one of many applications that stand to benefit from persistent memory. Gooding notes that ad tech firms, which rely on machine learning to understand consumers' reactions to online advertising campaigns, should find their work made much easier and more effective by persistent memory. "They’re collecting information as users within an ad campaign browse the web," he says. "If they can read and write all that data quickly, they can then apply machine-learning algorithms and tailor specific ads for users in real time."

Meanwhile, as automakers become increasingly reliant on data insights, persistent memory promises to help them crunch numbers and refine sophisticated new technologies at breakneck speeds. "In the auto industry, manufacturers face massive data challenges in autonomous vehicles, where 20 exabytes of data needs to be processed in real time, and they're using self-training machine-learning algorithms to help with that," Gooding explains. "There are so many fields where huge amounts of data need to be processed quickly with machine-learning techniques—fraud detection, astronomy... the list goes on."

Intel, like other persistent memory vendors, expects cloud service providers to be eager adopters, targeting various types of in-memory database services. Google, for example, is applying persistent memory to big data workloads on non-relational databases from vendors such as Aerospike and [Redis Labs][18], Mann says.

High-performance computing (HPC) is yet another area where persistent memory promises to make a tremendous impact. [CERN][19], the European Organization for Nuclear Research, is using Intel's Optane DC to significantly reduce wait times for scientific computing. "The efficiency of their algorithms depends on ... persistent memory, and CERN considers it a major breakthrough that is necessary to the work they are doing," Mann observes.

### How to prepare storage infrastructure for persistent memory

Before jumping onto the persistent memory bandwagon, organizations need to carefully scrutinize their IT infrastructure to determine the precise locations of any existing data bottlenecks. This task will be primary application-dependent, Wong notes. "If there is significant performance degradation due to delays associated with access to data stored in non-volatile storage—SSD or HDD—then an SCM tier will improve performance," he explains. Yet some applications will probably not benefit from persistent memory, such as compute-bound applications where CPU performance is the bottleneck.

Developers may need to reevaluate fundamental parts of their storage and application architectures, Gooding says. "They will need to know how to program with persistent memory," he notes. "How, for example, to make sure writes are flushed to the actual persistent memory device when necessary, as opposed to just sitting in the CPU cache."

To leverage all of persistent memory's potential benefits, significant changes may also be required in how code is designed. When moving applications from DRAM and flash to persistent memory, developers will need to consider, for instance, what happens when a program crashes and restarts. "Right now, if they write code that leaks memory, that leaked memory is recovered on restart," Gooding explains. With persistent memory, that isn't necessarily the case. "Developers need to make sure the code is designed to reconstruct a consistent state when a program restarts," he notes. "You may not realize how much your designs rely on the traditional combination of fast volatile DRAM and block storage, so it can be tricky to change your code designs for something completely new like persistent memory."

Older versions of operating systems may also need to be updated to accommodate the new technology, although newer OSes are gradually becoming persistent memory aware, Schulz says. "In other words, if they detect that persistent memory is available, then they know how to utilize that either as a cache, or some other memory."

Hypervisors, such as [Hyper-V][20] and [VMware][21], now know how to leverage persistent memory to support productivity, performance and rapid restarts. By utilizing persistent memory along with the latest versions of VMware, a whole system can see an uplift in speed and also maximize the number of VMs to fit on a single host, says Ian McClarty, CEO and president of data center operator [PhoenixNAP Global IT Services][22]. "This is a great use case for companies who want to own less hardware or service providers who want to maximize hardware to virtual machine deployments."

Many key enterprise applications, particularly databases, are also becoming persistent memory aware. SQL Server and [SAP’s][23] flagship [HANA][24] database management platform have both embraced persistent memory. "The SAP HANA platform is commonly used across multiple industries to process data and transactions, and then run advanced analytics ... to deliver real-time insights," Mann observes.

In terms of timing, enterprises and IT organizations should begin persistent memory planning immediately, Schulz recommends. "You should be talking with your vendors and understanding their roadmap, their plans, for not only supporting this technology, but also in what mode: as storage, as memory."

Join the Network World communities on [Facebook][25] and [LinkedIn][26] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3398988/for-enterprise-storage-persistent-memory-is-here-to-stay.html

作者：[John Edwards][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: 
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2017/08/file_folder_storage_sharing_thinkstock_477492571_3x2-100732889-large.jpg
[2]: https://www.networkworld.com/article/3353637/the-data-center-is-being-reimagined-not-disappearing.html
[3]: https://www.networkworld.com/article/3026720/the-next-generation-of-storage-disruption-storage-class-memory.html
[4]: https://www.networkworld.com/article/2159948/hard-disk-drives-vs--solid-state-drives--are-ssds-finally-worth-the-money-.html
[5]: https://www.networkworld.com/article/3326058/what-is-an-ssd.html
[6]: https://www.networkworld.com/article/3273583/why-nvme-over-fabric-matters.html
[7]: https://www.networkworld.com/article/3207567/what-is-hyperconvergence
[8]: https://www.networkworld.com/article/3280991/what-is-nvme-and-how-is-it-changing-enterprise-storage.html
[9]: https://www.networkworld.com/article/3318683/making-the-right-hyperconvergence-choice-hci-hardware-or-software
[10]: https://business.toshiba-memory.com/en-us/top.html
[11]: https://www.intel.com/content/www/us/en/architecture-and-technology/optane-dc-persistent-memory.html
[12]: https://www.samsung.com/semiconductor/
[13]: https://www.skhynix.com/eng/index.jsp
[14]: https://storageio.com/
[15]: https://www.intel.com/content/www/us/en/homepage.html
[16]: https://spark.apache.org/
[17]: https://www.aerospike.com/
[18]: https://redislabs.com/
[19]: https://home.cern/
[20]: https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/about/
[21]: https://www.vmware.com/
[22]: https://phoenixnap.com/
[23]: https://www.sap.com/index.html
[24]: https://www.sap.com/products/hana.html
[25]: https://www.facebook.com/NetworkWorld/
[26]: https://www.linkedin.com/company/network-world
