[#]: collector: (lujun9972)
[#]: translator: (GraveAccent)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11098-1.html)
[#]: subject: (5G will augment Wi-Fi, not replace it)
[#]: via: (https://www.networkworld.com/article/3399978/5g-will-augment-wi-fi-not-replace-it.html)
[#]: author: (Zeus Kerravala https://www.networkworld.com/author/Zeus-Kerravala/)


5G 会增强 Wi-Fi，而不是取代它
======
> Aruba 战略和企业发展副总裁 Jeff Lipton 为 5G 炒作增添了一些干货，讨论了它和 Wi-Fi 如何协同工作以及如何最大化两者的价值。

![Thinkstock][1]

如今可以说没有技术主题比 [5G][2] 更热。这是最近 [移动世界大会][3] 节目的一个主题，并且已经在其他活动中占据了主导地位，例如 Enterprise Connect 和我参加的几乎所有供应商活动。

一些供应商将 5G 定位为解决所有网络问题的灵丹妙药，并预测它将消除所有其他形式的网络。像这样的观点显然是极端的，但我相信 5G 会对网络行业产生影响，网络工程师应该意识到这一点。

为了帮助为 5G 炒作带来一些现实感，我最近采访了一家惠普公司旗下的 Aruba 公司的战略和企业发展副总裁 Jeff Lipton，因为我知道惠普已经深入参与了 5G 和 Wi-Fi 的发展。

![Jeff Lipton, VP of strategy and corporate development, Aruba][4]

### Zeus Kerravala: 5G 被吹捧为“明日之星”。你是这样看的吗？

**Jeff Lipton：** 接下来的重点是连接“事物”并从这些事物中产生可操作的见解和背景。5G 是服务于这一趋势的技术之一。Wi-Fi 6 是另一个，还有边缘计算、蓝牙低功耗（BLE）、人工智能（AI）和机器学习（ML）。这一切都很重要，全都有自己的用武之地。

### 你是否在企业中看到 5G 的风头盖过 Wi-Fi？

**Lipton：** 与所有蜂窝接入一样，如果你需要<ruby>宏观区域覆盖<rt>macro area coverage</rt></ruby>和高速切换，使用 5G 是合适的。但对于大多数企业级应用程序而言，它通常不需要这些功能。从性能角度来看，[Wi-Fi 6][5] 和 5G 在大多数指标上大致相等，包括吞吐量、延迟、可靠性和连接密度。它们并不相似的地方在经济方面，Wi-Fi 要好得多。我不认为很多客户愿意用 Wi-Fi 交换 5G，除非他们需要宏观覆盖或高速切换。

### Wi-Fi 和 5G 可以共存吗？ 企业如何一起使用 5G 和 Wi-Fi？

**Lipton：** Wi-Fi 和 5G 可以共存并且应该是互补的。5G 架构将蜂窝核心和无线接入网络（RAN）分离。因此，Wi-Fi 可以是企业无线电前端，并与 5G 核心紧密连接。由于 Wi-Fi（特别是 Wi-Fi 6）的经济有利，并且性能非常好，我们设想许多服务提供商会使用 Wi-Fi 作为其 5G 系统的无线电前端，充当其分布式天线（DAS）和小型蜂窝系统的替代方案。

> “Wi-Fi 和 5G 可以并且应该是互补的。” — Jeff Lipton

### 如果一个企业打算完全转向 5G，那将如何实现以及它的实用性如何？

**Lipton：** 为了将 5G 用于主要的室内访问方式，客户需要升级其网络和几乎所有设备。5G 在室外提供良好的覆盖，但蜂窝信号不能可靠地穿透建筑物，5G 会使这个问题变得更糟，因为它部分依赖于更高频率的无线电。因此，服务提供商需要一种提供室内覆盖的方法。为了提供这种覆盖，他们会部署 DAS 或小型蜂窝系统 —— 由终端客户支付费用。然后，客户将他们的设备直连到这些蜂窝系统，并为每个设备支付服务合同。

这种方法存在一些问题。首先，DAS 和小型蜂窝系统比 Wi-Fi 网络贵得多。并且成本不会仅限于网络。每台设备都需要一台 5G 蜂窝调制解调器，批量价格高达数十美元，而终端用户通常需要花费一百多美元。由于目前很少或者没有 MacBook、PC、打印机、AppleTV 有 5G 调制解调器，因此需要对这些设备进行升级。我不相信很多企业会愿意支付这笔额外费用并升级他们的大部分设备以获得尚不明确的好处。

### 经济性是 5G 与 Wi-Fi 之争的一个要素吗？

**Lipton：** 经济性始终是一个要素。让我们将对话集中在室内企业级应用程序上，因为这是一些运营商打算用 5G 定位的用例。我们已经提到升级到 5G 将要求企业部署昂贵的 DAS 或小型蜂窝系统用于室内覆盖，几乎将所有设备升级到包含 5G 调制解调器，并为每个设备支付服务合同。理解 5G 蜂窝网络和 DAS 系统在许可频谱上运行也很重要，这类似于一条私人高速公路。服务提供商为此频谱支付了数十亿美元，这笔费用需要货币化并嵌入服务成本中。因此，从部署和生命周期的角度来看，Wi-Fi 在经济上比 5G 有利。

### 5G 与 Wi-Fi 相比有任何安全隐患吗？

**Lipton：** 一些人认为蜂窝技术比 Wi-Fi 更安全，但事实并非如此。LTE 相对安全，但也有弱点。例如，普渡大学和爱荷华大学的研究人员表示，LTE 容易受到一系列攻击，包括数据拦截和设备跟踪。5G 通过多种认证方法和更好的密钥管理改进了 LTE 安全性。

Wi-Fi 的安全性也没有停滞不前而是在继续发展。当然，不遵循最佳实践的 Wi-Fi 实现，例如那些甚至没有基本密码保护的实现，并不是最佳的。但那些配置了适当的访问控制和密码的则是非常安全的。随着新标准 —— 特别是 WPA3 和<ruby>增强开放<rt>Enhanced Open</rt></ruby> ——  Wi-Fi 网络安全性进一步提高。

同样重要的是要记住，企业已根据其特定需求对安全性和合规性解决方案进行了大量投资。对于包括 5G 在内的蜂窝网络，企业将失去部署所选安全性和合规性解决方案的能力，以及对流量流的大多数可见性。虽然 5G 的未来版本将通过称为网络切片的功能提供高级别的自定义，但企业仍将失去他们目前需要的和拥有的安全性和合规性定制级别。

### 关于 5G 与 Wi-Fi 之间的讨论的补充想法

**Lipton：** 围绕 Wi-Fi 与 5G 的争论忽略了这一点。它们都有自己的用武之地，而且它们在很多方面都是互补的。由于需要连接和分析越来越多的东西，Wi-Fi 和 5G 市场都将增长。如果客户需要宏观覆盖或高速切换，并且可以为这些功能支付额外成本，那么 5G 是可行的。

5G 也适用于客户需要物理网络分段的某些工业用例。但对于绝大多数企业客户而言，Wi-Fi 将继续像现在一样证明自己作为可靠、安全且经济高效的无线接入技术的价值。

**更多关于 802.11ax (Wi-Fi 6):**

  * [为什么 802.11ax 是无线网络的下一件大事][7]
  * [FAQ：802.11ax Wi-Fi][8]
  * [Wi-Fi 6 (802.11ax) 正在来到你附近的路由器][9]
  * [带有 OFDMA 的 Wi-Fi 6 打开了一个全新的无线可能性世界][10]
  * [802.11ax 预览：支持 Wi-Fi 6 的接入点和路由器随时可用][11]


--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3399978/5g-will-augment-wi-fi-not-replace-it.html

作者：[Zeus Kerravala][a]
选题：[lujun9972][b]
译者：[GraveAccent](https://github.com/graveaccent)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Zeus-Kerravala/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/05/wireless_connection_speed_connectivity_bars_cell_tower_5g_by_thinkstock-100796921-large.jpg
[2]: https://www.networkworld.com/article/3203489/what-is-5g-how-is-it-better-than-4g.html
[3]: https://www.networkworld.com/article/3354477/mobile-world-congress-the-time-of-5g-is-almost-here.html
[4]: https://images.idgesg.net/images/article/2019/06/headshot_jlipton_aruba-100798360-small.jpg
[5]: https://www.networkworld.com/article/3215907/why-80211ax-is-the-next-big-thing-in-wi-fi.html
[6]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fcourses%2Fmobile-device-management-big-picture
[7]: https://www.networkworld.com/article/3215907/mobile-wireless/why-80211ax-is-the-next-big-thing-in-wi-fi.html
[8]: https://%20https//www.networkworld.com/article/3048196/mobile-wireless/faq-802-11ax-wi-fi.html
[9]: https://www.networkworld.com/article/3311921/mobile-wireless/wi-fi-6-is-coming-to-a-router-near-you.html
[10]: https://www.networkworld.com/article/3332018/wi-fi/wi-fi-6-with-ofdma-opens-a-world-of-new-wireless-possibilities.html
[11]: https://www.networkworld.com/article/3309439/mobile-wireless/80211ax-preview-access-points-and-routers-that-support-the-wi-fi-6-protocol-on-tap.html
[12]: https://www.facebook.com/NetworkWorld/
[13]: https://www.linkedin.com/company/network-world
