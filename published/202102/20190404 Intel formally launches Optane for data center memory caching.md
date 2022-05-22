[#]: collector: (lujun9972)
[#]: translator: (ShuyRoy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13109-1.html)
[#]: subject: (Intel formally launches Optane for data center memory caching)
[#]: via: (https://www.networkworld.com/article/3387117/intel-formally-launches-optane-for-data-center-memory-caching.html#tk.rss_all)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

英特尔 Optane：用于数据中心内存缓存
======

![](https://img.linux.net.cn/data/attachment/album/202102/12/111720yq1rvxcncjdsjb0g.jpg)

> 英特尔推出了包含 3D Xpoint 内存技术的 Optane 持久内存产品线。英特尔的这个解决方案介乎于 DRAM 和 NAND 中间，以此来提升性能。

![Intel][1]

英特尔在 2019 年 4 月的[大规模数据中心活动][2]中正式推出 Optane 持久内存产品线。它已经问世了一段时间，但是目前的 Xeon 服务器处理器还不能充分利用它。而新的 Xeon8200 和 9200 系列可以充分利用 Optane 持久内存的优势。

由于 Optane 是英特尔的产品（与美光合作开发），所以意味着 AMD 和 ARM 的服务器处理器不能够支持它。

正如[我之前所说的][3]，OptaneDC 持久内存采用与美光合作研发的 3D Xpoint 内存技术。3D Xpoint 是一种比 SSD 更快的非易失性内存，速度几乎与 DRAM 相近，而且它具有 NAND 闪存的持久性。

第一个 3D Xpoint 产品是被称为英特尔“尺子”的 SSD，因为它们被设计成细长的样子，很像尺子的形状。它们被设计这样是为了适合 1u 的服务器机架。在发布的公告中，英特尔推出了新的利用四芯或者 QLC 3D NAND 内存的英特尔 SSD D5-P4325 [尺子][7] SSD，可以在 1U 的服务器机架上放 1PB 的存储。

OptaneDC 持久内存的可用容量最初可以通过使用 128GB 的 DIMM 达到 512GB。英特尔数据中心集团执行副总裁及总经理 Navin Shenoy 说：“OptaneDC 持久内存可达到的容量是 DRAM 的 2 到 4 倍。”

他说：“我们希望服务器系统的容量可以扩展到每个插槽 4.5TB 或者 8 个插槽 36TB，这是我们第一代 Xeon 可扩展芯片的 3 倍。”

### 英特尔Optane内存的使用和速度

Optane 有两种不同的运行模式：内存模式和应用直连模式。内存模式是将 DRAM 放在 Optane 内存之上，将 DRAM 作为 Optane 内存的缓存。应用直连模式是将 DRAM 和 OptaneDC 持久内存一起作为内存来最大化总容量。并不是每个工作负载都适合这种配置，所以应该在对延迟不敏感的应用程序中使用。正如英特尔推广的那样，Optane 的主要使用情景是内存模式。

几年前，当 3D Xpoint 最初发布时，英特尔宣称 Optane 的速度是 NAND 的 1000 倍，耐用是 NAND 的 1000 倍，密度潜力是 DRAM 的 10 倍。这虽然有点夸张，但这些因素确实很令人着迷。

在 256B 的连续 4 个缓存行中使用 Optane 内存可以达到 8.3GB/秒的读速度和 3.0GB/秒的写速度。与 SATA SSD 的 500MB/秒左右的读/写速度相比，可以看到性能有很大提升。请记住，Optane 充当内存，所以它会缓存被频繁访问的 SSD 中的内容。

这是了解 OptaneDC 的关键。它能将非常大的数据集存储在离内存非常近的位置，因此具有很低延迟的 CPU 可以最小化访问较慢的存储子系统的访问延迟，无论存储是 SSD 还是 HDD。现在，它提供了一种可能性，即把多个 TB 的数据放在非常接近 CPU 的地方，以实现更快的访问。

### Optane 内存的一个挑战

唯一真正的挑战是 Optane 插进内存所在的 DIMM 插槽。现在有些主板的每个 CPU 有多达 16 个 DIMM 插槽，但是这仍然是客户和设备制造商之间需要平衡的电路板空间：Optane 还是内存。有一些 Optane 驱动采用了 PCIe 接口进行连接，可以减轻主板上内存的拥挤。

3D Xpoint 由于它写数据的方式，提供了比传统的 NAND 闪存更高的耐用性。英特尔承诺 Optane 提供 5 年保修期，而很多 SSD 只提供 3 年保修期。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3387117/intel-formally-launches-optane-for-data-center-memory-caching.html#tk.rss_all

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[RiaXu](https://github.com/ShuyRoy)
校对：[wxy](https://github.com/wxy)

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
