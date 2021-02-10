[#]: collector: (lujun9972)
[#]: translator: (ShuyRoy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Intel formally launches Optane for data center memory caching)
[#]: via: (https://www.networkworld.com/article/3387117/intel-formally-launches-optane-for-data-center-memory-caching.html#tk.rss_all)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Intel formally launches Optane for data center memory caching
======

### 英特尔正式推出包含3D Xpoint 内存技术的傲腾持久内存产品线。英特尔的这个解决方案将傲腾持久内存放置在DRAM和NAND中间，以此来提升性能。

![Intel][1]

英特尔在周二（2019年4月2日）的[大数据中心活动][2]中正式推出傲腾持久内存产品线。傲腾持久内存已经问世了一段时间，但是目前的Xeon服务器处理器还不能充分利用它。而新的Xeon8200和9200可以充分利用傲腾持久内存的优势。

由于傲腾是英特尔的产品（与美光合作开发），所以意味着AMD和ARM的服务器处理器不能够支持它。

正如[我之前所说的][3]，傲腾DC持久内存采用与美光合作研发的3D Xpoint内存技术。3D Xpoint是一种比SSD更快的非易失性内存，速度几乎与DRAM相近，而且它具有NAND flash的持久性。

**[ 小编推荐：[为什么是NVMe？用户会权衡基于NVMe加速的闪存的优点。][4] 和 [IDC的十大数据中心预测][5] | 定期更新的新闻[请注册网络世界通信][6] ]**

第一个3D Xpoint产品是被称为英特尔“尺子”的SSD，因为它们被设计成细长的样子，很像尺子的形状。他们被设计得能够适合1u的服务器托架。在周二发布的公告中，英特尔推出了新的利用四-cell或者QLC 3D NAND 内存的英特尔SSD D5-P4325[“尺子”][7]SSD，可以在1u的服务器托架上放1PB的存储。

傲腾DC持久内存的可用容量最初可以通过使用128GB的DIMM达到512GB。这次活动的关键人物——英特尔数据中心集团执行副总裁及总经理Navin Shenoy说：“傲腾DC持久内存可达到的容量是DRAM的2到4倍。”

他说：“我们希望服务器系统的容量可以扩展到每个插槽4.5TB或者8个插槽36TB，这是我们第一代Xeon可扩展芯片的3倍。”

## 英特尔傲腾内存的使用和速度

傲腾有两种不同的运行模式：内存模式和APP直连模式。内存模式是将DRAM放在傲腾内存之上，将DRAM作为傲腾内存的缓存。APP直连模式是将DRAM和傲腾持久内存一起作为内存来最大化总容量。并不是每个工作负载都适合这种配置，所以应该在对延迟不敏感的应用程序中使用。正如英特尔推广的那样，傲腾的主要使用情景是内存模式。

**[[通过PluralSight上的7部分线上课程来获得苹果技术合作者的认证。][8] ]**

几年前，当3D Xpoint最初发布时，英特尔宣称傲腾的速度是NAND的1000倍，忍耐力是NAND的1000倍，密度是DRAM的10倍。这虽然有点夸张，但这些因素确实很令人着迷。

在256B的连续4个缓存行中使用傲腾内存可以达到8.3GB/秒的读速度和3.0GB/秒的写速度。与SATA SSD的500MB/秒左右的读/写速度相比，可以看到性能有很大提升。请记住，傲腾充当内存，所以它会缓存被频繁访问的SSD中的内容。

这是了解傲腾DC的关键。它能将非常大的数据集存储在离内存非常近的位置，因此具有很低延迟的CPU可以最小化访问较慢的存储子系统的访问延迟，无论存储是SSD还是HDD。现在，它提供了将很多TB的数据放在离CPU很近的位置，以获得更快的访问速度。

## 傲腾内存的一个挑战

唯一真正的挑战是傲腾然后插进内存所在的DIMM插槽。现在有些主板的每个CPU有16个插槽，但是这仍然是客户和设备制造商之间需要平衡的：傲腾VS内存。有一些傲腾驱动采用了PCIe接口进行连接，可以减轻主板上内存的拥挤。

3D Xpoint由于它写数据的方式，提供了比传统的NAND flash更高的耐久力。英特尔承诺傲腾提供5年保修期，而很多SSD只提供3年保修期。

加入Facebook[Facebook][9]和LinkedIn[LinkedIn][10]上的网络世界社区，对你最关心的话题发表评论吧。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3387117/intel-formally-launches-optane-for-data-center-memory-caching.html#tk.rss_all

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[RiaXu](https://github.com/ShuyRoy)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/06/intel-optane-persistent-memory-100760427-large.jpg
[2]: https://www.networkworld.com/article/3386142/intel-unveils-an-epic-response-to-amds-server-push.html
[3]: https://www.networkworld.com/article/3279271/intel-launches-optane-the-go-between-for-memory-and-storage.html
[4]: https://www.networkworld.com/article/3290421/why-nvme-users-weigh-benefits-of-nvme-accelerated-flash-storage.html
[5]: https://www.networkworld.com/article/3242807/data-center/top-10-data-center-predictions-idc.html#nww-fsb
[6]: https://www.networkworld.com/newsletters/signup.html#nww-fsb
[7]: https://www.theregister.co.uk/2018/02/02/ruler_and_miniruler_ssd_formats_look_to_banish_diskstyle_drives/
[8]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fapple-certified-technical-trainer-10-11
[9]: https://www.facebook.com/NetworkWorld/
[10]: https://www.linkedin.com/company/network-world
