[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11968-1.html)
[#]: subject: (How to set up your own fast, private open source mesh network)
[#]: via: (https://opensource.com/article/20/2/mesh-network-freemesh)
[#]: author: (Spencer Thomason https://opensource.com/users/spencerthomason)

如何建立自己的快速、私有的开源网状网络（mesh）
======

> 只需要不到 10 分钟的安装时间，就可以用 FreeMesh 搭建一个经济实惠、性能卓越、尊重隐私的网格系统。

![](https://img.linux.net.cn/data/attachment/album/202003/06/234848jaga52a0wx05w0f0.jpg)

[FreeMesh][2] 系统有望为大众带来完全开源的<ruby>网状网络<rt>mesh network</rt></ruby>（LCTT 译注：也称之为“多跳网络”）。我最近有机会对它进行了测试；它安装迅速，性能非常好  —— 特别是相对它的价格而言。

### 为什么要网格化和开源？

使用开源的原因很简单：隐私。有了 FreeMesh，你的数据就是你自己的。它不会跟踪或收集数据。不相信吗？毕竟，你可以轻松检查 —— 它是开源的！而其它大型高科技企业集团提供的一些流行的网状网络解决方案，你是否相信它们会保护你的数据？

另一个重要因素：更新。FreeMesh 表示，它将致力于定期发布安全性和性能更新。从现在起到 10 年后呢？使用开源解决方案，你可以根据需要自由地更新产品。

那么为什么要用网状网络呢？在网状网络中，多个无线路由器一起工作以广播单个超大型的无线网络。网状网络中的每个路由器都可与其他路由器智能地通信，以便为你的数据提供最佳的“路径”。FreeMesh 网站上的以下图片突出显示了使用单个无线路由器和网状网络之间的区别。红色网络表示单个无线路由器，绿色网络是网状网络。

![单路由器网络] [3]

![网状网络] [4]

### 采购设备

要开始使用 FreeMesh，请[订购套件][5]。它提供两种套件：标准套件和 4G LTE。

顾名思义，4G LTE 套件支持蜂窝数据连接。此功能在消费级网络领域非常罕见，但对某些人来说非常有用。你可以在提供电源和电池的任何地方建立具有完整的快速故障转移功能的便携式网状网络。

FreeMesh 套件带有一个主路由器和两个节点。路由器和节点使用 802.11ac、802.11r 和 802.11s 标准。随附的固件运行定制版本的 [OpenWrt] [6]，这是嵌入式设备的 Linux 发行版。

FreeMesh 路由器的一些规格非常好：

* CPU：双核 880MHz MediaTek MT7621AT（双核/四线程！）
* 内存：DDR3 512MB
* 接口：1 个 GbE WAN、4 个 GbE LAN、1 个 USB 2.0 端口、1 个 microSD 卡插槽、1 个 SIM 插槽
* 天线：2 个 5dBi 2.4GHz、2 个 5dBi 5GHz、2 个 3dBi 3G/4G（内置）
* 4G LTE 调制解调器：LTE 4 类模块，下行 150Mbps/上行 50Mbps

### 设置

设置很容易，FreeMesh 的 [README][7] 提供了简单的说明和图表。首先首先设置主路由器。然后按照以下简单步骤操作：

1、将第一个节点（蓝色 WAN 端口）连接到主路由器（黄色 LAN 端口）。

![FreeMesh 设置步骤 1][8]

2、等待约 30 至 60 秒。设置完成后，节点的 LED 将会闪烁。

![FreeMesh 设置步骤 2][9]

3、将节点移到另一个位置。

仅此而已！节点不需要手动设置。你只需将它们插入主路由器，其余的工作就完成了。你可以以相同的方式添加更多节点；只需重复上述步骤即可。

### 功能

FreeMesh 是开箱即用的，它由 OpenWRT 和 LuCI 组合而成。它具有你期望路由器提供的所有功能。是否要安装新功能或软件包？SSH 连入并开始魔改！

![FreeMesh 网络上的实时负载][10]

![FreeMesh 网络概览][11]

![OpenWrt 状态报告][12]

### 性能如何

设置完 FreeMesh 系统后，我将节点移动到了房屋周围的各个地方。我使用 [iPerf][13] 测试带宽，它达到了约 150Mbps。WiFi 可能会受到许多环境变量的影响，因此你的结果可能会有所不同。节点与主路由器之间的距离在带宽中也有很大的影响。

但是，网状网络的真正优势不是高峰速度，而是整个空间的平均速度要好得多。即使在我家很远的地方，我仍然能够用流媒体播放视频并正常工作。我甚至可以在后院工作。在出门之前，我只是将一个节点重新放在窗口前面而已。

### 结论

FreeMesh 确实令人信服。它以简单、开源的形式为你提供高性价比和隐私。

以我的经验，设置非常容易，而且足够快。覆盖范围非常好，远远超过了任何单路由器环境。你可以随意魔改和定制 FreeMesh 设置，但是我觉得没有必要。它提供了我需要的一切。

如果你正在寻找价格可承受、性能良好且尊重隐私的网格系统，且该系统可以在不到 10 分钟的时间内安装完毕，你可以考虑一下 FreeMesh。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/mesh-network-freemesh

作者：[Spencer Thomason][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/spencerthomason
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus-networking.png?itok=fHmulI9p (people on top of a connected globe)
[2]: https://freemeshwireless.com/
[3]: https://opensource.com/sites/default/files/uploads/singlerouternetwork.png (Single-router network)
[4]: https://opensource.com/sites/default/files/uploads/meshnetwork.png (Mesh network)
[5]: https://freemeshwireless.com/#pricing
[6]: https://openwrt.org/
[7]: https://gitlab.com/slthomason/freemesh/-/blob/master/README.md
[8]: https://opensource.com/sites/default/files/uploads/connecttorouter.png (FreeMesh setup step 1)
[9]: https://opensource.com/sites/default/files/uploads/setupcomplete.png (FreeMesh setup step 2)
[10]: https://opensource.com/sites/default/files/uploads/freemeshrealtimeload.png (Real-time load on FreeMesh network)
[11]: https://opensource.com/sites/default/files/uploads/freemeshwirelessoverview.png (Overview of FreeMesh network)
[12]: https://opensource.com/sites/default/files/uploads/openwrt.png (OpenWrt status report)
[13]: https://opensource.com/article/20/1/internet-speed-tests
