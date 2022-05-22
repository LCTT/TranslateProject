[#]: subject: (Plausible: Privacy-Focused Google Analytics Alternative)
[#]: via: (https://itsfoss.com/plausible/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13283-1.html)

Plausible：注重隐私的 Google Analytics 替代方案
======

![](https://img.linux.net.cn/data/attachment/album/202104/10/110720jc8hckngaqr6wch1.jpg)

[Plausible][1]是一款简单的、对隐私友好的分析工具。它可以帮助你分析独立访客数量、页面浏览量、跳出率和访问时间。

如果你有一个网站，你可能会理解这些术语。作为一个网站所有者，它可以帮助你了解你的网站是否随着时间的推移获得更多的访问者，流量来自哪里，如果你对这些事情有一定的了解，你可以努力改进你的网站，以获得更多的访问量。

说到网站分析，统治这个领域的一个服务就是谷歌的免费工具 Google Analytics。就像 Google 是事实上的搜索引擎一样，Google Analytics 是事实上的分析工具。但你不必再忍受它，尤其是当你无法信任大科技公司使用你和你的网站访问者的数据的时候。

Plausible 让你摆脱 Google Analytics 的束缚，我将在本文中讨论这个开源项目。

请注意，如果你从来没有管理过网站或对分析感兴趣，文章中的一些技术术语可能对你来说是陌生的。

### Plausible 是隐私友好的网站分析工具

Plausible 使用的分析脚本是非常轻量级的，大小不到 1KB。

其重点在于保护隐私，因此你可以在不影响访客隐私的情况下获得有价值且可操作的统计数据。Plausible 是为数不多的不需要 cookie 横幅或 GDP 同意的分析工具之一，因为它在隐私方面已经符合 [GDPR 标准][2]。这是超级酷的。

在功能上，它没有 Google Analytics 那样的粒度和细节。Plausible 靠的是简单。它显示的是你过去 30 天的流量统计图。你也可以切换到实时视图。

![][3]

你还可以看到你的流量来自哪里，以及你网站上的哪些页面访问量最大。来源也可以显示 UTM 活动。

![][4]

你还可以选择启用 GeoIP 来了解网站访问者的地理位置。你还可以检查有多少访问者使用桌面或移动设备访问你的网站。还有一个操作系统的选项，正如你所看到的，[Linux Handbook][5] 有 48% 的访问者来自 Windows 设备。很奇怪，对吧？

![][6]

显然，提供的数据与 Google Analytics 的数据相差甚远，但这是有意为之。Plausible 意图是为你提供简单的模式。

### 使用 Plausible：选择付费托管或在你的服务器上自行托管

使用 Plausible 有两种方式：注册他们的官方托管服务。你必须为这项服务付费，这最终会帮助 Plausible 项目的发展。它们有 30 天的试用期，甚至不需要你这边提供任何支付信息。

定价从每月 1 万页浏览量 6 美元开始。价格会随着页面浏览量的增加而增加。你可以在 Plausible 网站上计算价格。

- [Plausible 价格][7]

你可以试用 30 天，看看你是否愿意向 Plausible 开发者支付服务费用，并拥有你的数据。

如果你觉得定价不合理，你可以利用 Plausible 是开源的优势，自己部署。如果你有兴趣，请阅读我们的 [使用 Docker 自助托管 Plausible 实例的深度指南][8]。

我们自行托管 Plausible。我们的 Plausible 实例添加了我们的三个网站。

![Plausble dashboard for It’s FOSS websites][9]

如果你维护一个开源项目的网站，并且想使用 Plausible，你可以通过我们的 [High on Cloud 项目][10] 联系我们。通过 High on Cloud，我们帮助小企业在其服务器上托管和使用开源软件。

### 总结

如果你不是超级痴迷于数据，只是想快速了解网站的表现，Plausible 是一个不错的选择。我喜欢它，因为它是轻量级的，而且遵守隐私。这也是我在 Linux Handbook，我们 [教授 Linux 服务器相关的门户网站][11] 上使用它的主要原因。

总的来说，我对 Plausible 相当满意，并向其他网站所有者推荐它。

你也经营或管理一个网站吗？你是用什么工具来做分析，还是根本不关心这个？

--------------------------------------------------------------------------------

via: https://itsfoss.com/plausible/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://plausible.io/
[2]: https://gdpr.eu/compliance/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/03/plausible-graph-lhb.png?resize=800%2C395&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/03/plausible-stats-lhb-2.png?resize=800%2C333&ssl=1
[5]: https://linuxhandbook.com/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/plausible-geo-ip-stats.png?resize=800%2C331&ssl=1
[7]: https://plausible.io/#pricing
[8]: https://linuxhandbook.com/plausible-deployment-guide/
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/03/plausible-analytics-for-itsfoss.png?resize=800%2C231&ssl=1
[10]: https://highoncloud.com/
[11]: https://linuxhandbook.com/about/#ethical-web-portal
