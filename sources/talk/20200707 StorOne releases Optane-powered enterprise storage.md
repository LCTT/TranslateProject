[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (StorOne releases Optane-powered enterprise storage)
[#]: via: (https://www.networkworld.com/article/3565189/storone-releases-optane-powered-enterprise-storage.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

StorOne releases Optane-powered enterprise storage
======
StorOne is combining its software-defined storage technology with Intel servers, Optane and QLC flash storage technologies.
Intel

StorOne, a company that specializes in software-defined storage (SDS) products, has ventured into the hardware business through a partnership with Intel to provide significant storage performance acceleration.

The Array.next is a combination of server hardware, quad-level cell (QLC) SSDs and Intel Optane. [QLC memory][1] means it holds four bits per cell, the densest of SSD cells. More on that later. Finally, Optane is Intel’s high-speed memory cache for SSDs. It has almost the speed of DRAM but the storage capability of SSDs and sits between main memory and flash storage.

George Crump, chief marketing officer for StorOne, calls his company’s software “storage consolidation done right. Our software can use anybody’s hardware,” he says.

Crump says a lot of file-storage software systems date back to the 1990s when everything was hard-drive oriented. StorOne’s software was written from the ground up to address the efficiency of SSD and faster ports to get more performance per drive. “We’ve reinvented storage algorithms. Many were written two decades ago. Give us a hundred gig pipe, and we’ll fill it,” he says.

Companies boast of their IOPS, but Crum claims his competitors get 20% of potential IOPS out of the drive because of their antiquated software. StorOne claims it gets 85% of potential IOPS from storage systems. That is Array.next’s pitch; getting more performance out of existing storage arrays.

### Less Hardware Needed

The Array.next box consists of four Optane drives and up to eight Intel SSDs, with capacity ranging from 23TB to 736TB. QLC is relatively new to the market and is not as proven as the older flash technologies, and it also has a much lower write limit. Array.next handles this by treating Optane as the first line of storage, so rather than writing to flash first, data writes to Optane.

When the Optane capacity is filled, it then does a massive sequential write to the flash storage, and QCL handles large sequential writes very well. “We’re getting 10 times the life expectancy [of QLC] than rated because of the way we write to it. A large majority of writes are done once and then there are hardly any updates. So we want to get as close to WORM [wrote once, read many] as possible,” says Crump.

The primary customer for Array.next is a database customer who needs more performance. The most common solution is to throw more server hardware at the problem but Crump says that with Array.next’s 1M IOPS and 10Gbit of bandwidth, more servers are not needed.

He told of one customer, a Microsoft SQL Server shop, that was getting ready to buy two more servers to solve performance problems. Not only did they need to buy the hardware but Microsoft enterprise licensing charges by the core, so they were looking at a considerable bill. With Array.next the customer got a lot more performance out of the hardware they already had. In the end, the customer saved $80,000 on hardware and licensing.

StorOne has an [online sales page][2] where anyone can select the configuration they want or need, starting with hardware and software and then getting details on availability and capacity. Most enterprise IT firms make you register to get a quote but StorOne lets anyone come configure the hardware, no registration needed.

Customers can buy the SDS software by itself or installed on servers from HP Enterprise, Dell, and Supermicro, or Intel Server. Intel isn’t widely known for its server hardware but does [offer it][3]. Crump is happy to have it.

“We’re not exactly a household name. The fact we’re partnering with Intel and the hardware is Intel puts people at ease,” he says.

Array.next is available now through StorOne or resellers.

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3565189/storone-releases-optane-powered-enterprise-storage.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3256217/micron-sets-its-sights-on-quad-cell-storage.html
[2]: https://www.storone.com/truprice/
[3]: https://www.intel.com/content/www/us/en/products/servers/server-chassis-systems.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
