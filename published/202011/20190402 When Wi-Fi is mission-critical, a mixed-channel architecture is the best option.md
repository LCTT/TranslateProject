[#]: collector: (lujun9972)
[#]: translator: (chenmu-kk)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12817-1.html)
[#]: subject: (When Wi-Fi is mission-critical, a mixed-channel architecture is the best option)
[#]: via: (https://www.networkworld.com/article/3386376/when-wi-fi-is-mission-critical-a-mixed-channel-architecture-is-the-best-option.html#tk.rss_all)
[#]: author: (Zeus Kerravala https://www.networkworld.com/author/Zeus-Kerravala/)

当 Wi-Fi 成为关键业务时，混合信道架构是最好的多信道选择
======

> 混合信道架构是最好的多信道选择，但它并不总是最佳的选择。当需要可靠的 Wi-Fi 时，单信道和混合 AP 提供了令人信服的替代方案。

![Getty Images][1]

我曾与许多实施数字项目的公司合作过，结果却发现它们失败了。正确的想法，健全地施行，现存的市场机遇。哪里是薄弱的环节？是 Wi-Fi 网络。

例如，一家大型医院希望通过将遥测信息发送到移动设备，来提高临床医生对患者警报的响应时间。如果没有这个系统，护士了解病人警报的唯一途径就是通过声音警报。在所有嘈杂的背景音中，通常很难分辨噪音来自哪里。问题是这家医院中的 Wi-Fi 网络已经很多年未升级了，这导致信息传递严重延迟（通常需要 4~5 分钟）。过长的信息传递导致人们对该系统失去信心，因此许多临床医生停止使用该系统，转而使用手动警报。最终，人们认为这个项目是失败的。

我曾在制造业、K-12 教育、娱乐和其他行业中见过类似的案例。企业竞争的基础是客户体验，而竞争的动力来自不断扩展又无处不在的无线优势。好的 Wi-Fi 并不意味着市场领导地位，但是劣质的 Wi-Fi 将会对客户和员工产生负面影响。而在当今竞争激烈的环境下，这是灾难的根源。

### Wi-Fi 性能历来不一致

Wi-Fi 的问题在于它本身就很脆弱。我相信每个阅读这篇文章的人都经历过下载失败、连接中断、性能不一致以及连接公用热点的漫长等待时间等缺陷。

想象一下，你在一个会议上，在一个主题演讲之前，你可以随意地发推特、发电子邮件、浏览网页以及做其他事情。然后主讲人上台，所有观众开始拍照，上传并流传信息——然后网络崩溃了。我发现这不仅仅是一个例外，更是一种常态，强调了对[无损 Wi-Fi][3]的需求。

对于网络技术人员的问题是如何让一个地方的 Wi-Fi 达到全部时间都保持不间断。有人说只要加强现存的网络可以做到，这也许可以，但在某些情况下，Wi-Fi 的类型可能并不合适。

最常见的 Wi-Fi 部署类型是多信道，也称为微蜂窝，每个客户端通过无线信道连接到接入点（AP）。高质量的通话体验基于两点：良好的信号强度和最小的干扰。有几个因素会导致干扰，例如接入点距离太近、布局问题或者来自其他设备的干扰。为了最大程度地减少干扰，企业需要投入大量的时间和资金在[现场调查中规划最佳的信道地图][2]，但即使这些做得很好，Wi-Fi 故障仍然可能发生。

## 多通道 Wi-Fi 并非总是最佳选择

对于许多铺着地毯的办公室来说，多通道 Wi-Fi 可能是可靠的，但在某些环境中，外部环境会影响性能。一个很好的例子是多租户建筑，其中有多个 Wi-Fi 网络在同一信道上传输并相互干扰。另一个例子是医院，这里有许多工作人员在多个接入点间流动。客户端将试图连接到最佳接入点，导致客户端不断断开连接并重新连接，从而导致会话中断。还有一些环境，例如学校、机场和会议设施，那里存在大量的瞬态设备，而多通道则难以跟上。

## 单通道 Wi-Fi 提供更好的可靠性但与此同时性能会受到影响

网络管理器要做什么？不一致的 Wi-Fi 只是一个既成事实吗？多信道是一种标准，但它并非是为动态物理环境或那些需要可靠的连接环境而设计的。

几年前提出了一项解决这些问题的替代架构。顾名思义，“单信道”Wi-Fi 在网络中为所有接入点使用单一的无线频道。可以把它想象成在一个信道上运行的单个 Wi-Fi 结构。这种架构中，接入点的位置无关紧要，因为它们都利用相同的通道，因此不会互相干扰。这有一个显而易见的简化优势，比如，如果覆盖率很低，那就没有理由再做一次昂贵的现场调查。相反，只需在需要的地方布置接入点就可以了。

单通道的缺点之一是总网络吞吐量低于多通道，因为只能使用一个通道。在可靠性高于性能的环境中，这可能会很好，但许多组织希望二者兼而有之。

## 混合接入点提供了两全其美的优势

单信道系统制造商最近进行了创新，将信道架构混合在一起，创造了一种“两全其美”的部署，可提供多信道的吞吐量和单信道的可靠性。举个例子，Allied Telesis 提供了混合接入点，可以同时在多信道和单信道模式下运行。这意味着可以分配一些 Web 客户端到多信道以获得最大的吞吐量，而其他的 Web 客户端则可使用单信道来获得无缝漫游体验。

这种混合的实际用例可能是物流设施，办公室工作人员使用多通道，但叉车操作员在整个仓库移动时使用单一通道持续连接。

Wi-Fi 曾是一个便利的网络，但如今它或许是所有网络中最关键的任务。传统的多信道体系也许可以工作，但应该做一些尽职调查来看看它在重负下如何运转。IT 领导者需要了解 Wi-Fi 对数字转型计划的重要性，并进行适当的测试，以确保它不是基础设施链中的薄弱环节，并为当今环境选择最佳技术。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3386376/when-wi-fi-is-mission-critical-a-mixed-channel-architecture-is-the-best-option.html

作者：[Zeus Kerravala][a]
选题：[lujun9972][b]
译者：[chenmu-kk](https://github.com/chenmu-kk)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Zeus-Kerravala/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/09/tablet_graph_wifi_analytics-100771638-large.jpg
[2]: https://www.networkworld.com/article/3315269/wi-fi-site-survey-tips-how-to-avoid-interference-dead-spots.html
[3]: https://www.alliedtelesis.com/blog/no-compromise-wi-fi
[4]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fcourses%2Fmobile-device-management-big-picture
[5]: https://www.networkworld.com/article/3273439/review-icinga-enterprise-grade-open-source-network-monitoring-that-scales.html?nsdr=true#nww-fsb
[6]: https://www.networkworld.com/article/3304307/nagios-core-monitoring-software-lots-of-plugins-steep-learning-curve.html
[7]: https://www.networkworld.com/article/3269279/review-observium-open-source-network-monitoring-won-t-run-on-windows-but-has-a-great-user-interface.html?nsdr=true#nww-fsb
[8]: https://www.networkworld.com/article/3304253/zabbix-delivers-effective-no-frills-network-monitoring.html
[9]: https://www.facebook.com/NetworkWorld/
[10]: https://www.linkedin.com/company/network-world
