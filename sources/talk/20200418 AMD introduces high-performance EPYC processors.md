[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (AMD introduces high-performance EPYC processors)
[#]: via: (https://www.networkworld.com/article/3538469/amd-introduces-high-performance-epyc-processors.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

AMD introduces high-performance EPYC processors
======
With new EPYC 7Fx2 processors, AMD claims to offer the fastest per-core performance in the server space.
AMD

AMD has introduced three new processors in its second-generation EPYC 7Fx2 series, which is optimized for frequency and delivers what AMD claims is the fastest per-core performance in the x86 server market.

In the server space, AMD is besting Intel when it comes to core count. AMD has the 64-core EPYC line. Intel, which currently tops out at 28 cores, has 38- and 48-core parts due later this year. But it's the individual core performances that matter, and in some benchmarks, Intel wins.

**READ MORE:** [How to dispose of IT hardware without hurting the environment][1]

AMD's three new processors, however, have rather modest core counts. The EPYC 7F32 has 8 cores, the EPYC 7F52 has 16 cores, and the EPYC 7F72 has 24 cores. But they also have a speed boost of up to 500Mhz over previous generation EPYCs, as well as greatly expanded L3 cache to unify the cores. They don't replace existing models, according to AMD.

The CPUs are based on AMD's current Zen 2 architecture and use PCIe 4 and DDR4-3200 memory and the AMD Infinity architecture, all of which provide optimum system performance. The increased L3 cache plays a part in the per-core performance as much as the clock bump. The 16-core unit doubles its L3 cache over the previous generation of 16-core processors to 256MB, while the 24-core model sees its cache increased 128MB over the 7400 line to 192MB.

AMD claims the [EPYC 7Fx2 processors][2] provide up to 17% higher SQL Server performance compared to the competition (Intel Xeon Gold 6244), up to 47% higher VMmark 3.1 score using vSAN as the storage tier in a 4-node cluster compared to the competition (Xeon Platinum 8276L), and up to 94% higher per core computational fluid dynamics individual application performance compared to the competition (Xeon Gold 6242).

The one tradeoff is the CPUs do come with a higher TDP (thermal design power) draw thanks to the 500Mhz clock boost, pushing them up from 155/180 watts in comparable older models to as high as 240 watts.

The 7F32 is priced at $2,100, the 7F52 at $3,100, and the 7F72 at $2,450. These prices are higher than the older generation EPYCs with similar core counts but still cheaper than the Xeon Gold and Platinums they compete against.

[][3]

AMD sure got the industry behind it. Many of the heavyweights in IT hardware and software are supporting the new EPYCs:

  * Dell Technologies announced it will support all three processors across its entire lineup Dell EMC PowerEdge servers.
  * HPE will support all three AMD EPYC 7Fx2 processors on the recently announced HPE Apollo 2000 Gen10 Plus system, HPE ProLiant DL385 Gen10 Plus server, and HPE ProLiant DX servers.
  * Lenovo will support the new AMD EPYC 7Fx2 processors on its ThinkSystem SR635 and SR655 platforms.
  * IBM Cloud is the first cloud provider to offer its clients the AMD EPYC 7F72 processors in their bare metal offering.
  * Nutanix, in conjunction with HP Enterprise, announced that it expects that Nutanix HCI software will be supported on select AMD EPYC based HPE ProLiant servers by May.
  * Supermicro is launching the industry's first blade platform built for the new AMD EPYC 7Fx2 processors combined with integrated 25G Ethernet and optional 100G EDR InfiniBand support with 200G HDR in the near future.
  * VMware said it would add support for the new EPYC 7Fx2 processors.



Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3538469/amd-introduces-high-performance-epyc-processors.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3537928/how-to-dispose-of-it-hardware-without-hurting-the-environment.html
[2]: https://www.amd.com/en/press-releases/2020-04-14-new-2nd-gen-amd-epyc-processors-redefine-performance-for-database
[3]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE22140&utm_content=sidebar (ITAAS and Corporate Storage Strategy)
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
