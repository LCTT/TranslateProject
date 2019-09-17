[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Two AMD Epyc processors crush four Intel Xeons in tests)
[#]: via: (https://www.networkworld.com/article/3435727/two-amd-epyc-processors-crush-four-intel-xeons-in-tests.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Two AMD Epyc processors crush four Intel Xeons in tests
======
Tests show the AMD Epyc processors performed almost 25% better, and at one quarter the price
AMD

Tests by the evaluation and testing site ServeTheHome found a server with two AMD Epyc processors can outperform a four-socket Intel system that costs considerably more.

If you don’t read [ServeTheHome][1], you should. It’s cut from the same cloth as Tom’s Hardware Guide and AnandTech but with a focus on server hardware, mostly the low end but they throw in some enterprise stuff, as well.

[ServeTheHome ran tests][2] comparing the AMD Epyc 7742, which has 64 cores and 128 threads, and the Intel Xeon Platinum 8180M with its 28 cores and 56 threads. The dollars, though, show a real difference. Each Epyc 7742 costs $6,950, while each Xeon Platinum 8180M goes for $13,011. So, two Epyc 7742 processors cost you $13,900, and four Xeon Platinum 8180M processors cost $52,044, four times as much as the AMD chips.

**Also read: [How AI can boost data-center availability and efficiency][3]**

And that’s just the chips. The actual servers will also set you back a pretty penny, especially since four-socket servers cost much more than two-socket servers regardless of the processor you use.

ServeTheHome used GeekBench, a Linux-based benchmark tool that measures both single- and multi-core performance. It’s purely a performance measure and looks only to see how fast a processor can go. It does not use real-world apps the way PCMark uses spreadsheets and graphics apps to test application performance.

Nonetheless, the dual Epyc system racked up single- and multi-core scores of 4,876 and 193,554 points, respectively, while the quad Xeon Platinum 8180M system scored 4,700 and 155,050 points in the single-core and multi-core tests, respectively.

So, the two-socket AMD system outperforms the four-socket Intel system by up to 3.74% in single-core workloads and 24.83% in multi-core workloads. And it costs one quarter the price. In terms of price/performance, it’s not even close.

**[ [Get certified as an Apple Technical Coordinator with this seven-part online course from PluralSight.][4] ]**

And ServeTheHome used an AMD reference server for the Epyc tests, while it used a Dell PowerEdge R840 for the Xeons. What that means is when HPE, Dell, Lenovo, Supermicro, etc. start shipping their servers, they will tune and optimize the daylights out of them vs. the AMD reference box and get even better performance.

There are other advantages to the AMD processor, as well: support for up to 4TB per socket vs. Xeon’s 1.5TB per socket, and PCI Express 4 for AMD vs. PCI Express 3 for Intel, which is half the speed of PCIe 4.

AMD has clearly built a better mousetrap. Now to bring in the customers.

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3435727/two-amd-epyc-processors-crush-four-intel-xeons-in-tests.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.servethehome.com/
[2]: https://www.servethehome.com/geekbench-4-2p-amd-epyc-7742-sets-world-record/
[3]: https://www.networkworld.com/article/3274654/ai-boosts-data-center-availability-efficiency.html
[4]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fapple-certified-technical-trainer-10-11
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
