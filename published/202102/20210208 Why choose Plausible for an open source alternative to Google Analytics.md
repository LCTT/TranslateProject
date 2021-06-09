[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13135-1.html)
[#]: subject: (Why choose Plausible for an open source alternative to Google Analytics)
[#]: via: (https://opensource.com/article/21/2/plausible)
[#]: author: (Ben Rometsch https://opensource.com/users/flagsmith)

为什么选择 Plausible 作为 Google Analytics 的开源替代品？
======

> Plausible 作为 Google Analytics 的可行、有效的替代方案正在引起用户的关注。

![](https://img.linux.net.cn/data/attachment/album/202102/19/233627sb7mvtt7hn93lvvr.jpg)

替代 Google Analytics 似乎是一个巨大的挑战。实际上，你可以说这听起来似乎不合理（LCTT 译注：Plausible 意即“貌似合理”）。但这正是 [Plausible.io][2] 取得巨大成功的原因，自 2018 年以来已注册了数千名新用户。

Plausible 的联合创始人 Uku Taht 和 Marko Saric 最近出现在 [The Craft of Open Source][3] 播客上，谈论了这个项目以及他们是如何:

* 创建了一个可行的替代 Google Analytics 的方案
* 在不到两年的时间里获得了如此大的发展势头
* 通过开源他们的项目实现其目标

请继续阅读他们与播客主持人和 Flagsmith 创始人 Ben Rometsch 的对话摘要。

### Plausible 是如何开始的

2018 年冬天，Uku 开始编写一个他认为急需的项目：一个可行的、有效的 Google Analytics 替代方案。因为他对 Google 产品的发展方向感到失望，而且所有其他数据解决方案似乎都把 Google 当作“数据处理中间人”。

Uku 的第一直觉是利用现有的数据库解决方案专注于分析方面的工作。马上，他就遇到了一些挑战。开始尝试使用了 PostgreSQL，这在技术上很幼稚，因为它很快就变得不堪重负，效率低下。因此，他的目标蜕变成了做一个分析产品，可以处理大量的数据点，而且性能不会有明显的下降。简而言之，Uku 成功了，Plausible 现在每月可以收取超过 8000 万条记录。

Plausible 的第一个版本于 2019 年夏天发布。2020 年 3 月，Marko 加入，负责项目的传播和营销方面的工作。从那时起，它它的受欢迎程度有了很大的增长。

### 为什么要开源？

Uku 热衷于遵循“独立黑客”的软件开发路线：创建一个产品，把它投放出去，然后看看它如何成长。开源在这方面是有意义的，因为你可以迅速发展一个社区并获得人气。

但 Plausible 一开始并不是开源的。Uku 最初担心软件的敏感代码，比如计费代码，但他很快就发布了，因为这对没有 API 令牌的人来说是没有用的。

现在，Plausible 是在 [AGPL][4] 下完全开源的，他们选择了 AGPL 而不是 MIT 许可。Uku 解释说，在 MIT 许可下，任何人都可以不受限制地对代码做任何事情。在 AGPL 下，如果有人修改代码，他们必须将他们的修改开源，并将代码回馈给社区。这意味着，大公司不能拿着原始代码在此基础上进行构建，然后获得所有的回报。他们必须共享，使得竞争环境更加公平。例如，如果一家公司想插入他们的计费或登录系统，他们有法律义务发布代码。

在播客中，Uku 向我询问了关于 Flagsmith 的授权，目前 Flagsmith 的授权采用 BSD 三句版许可，该许可证是高度开放的，但我即将把一些功能移到更严格的许可后面。到目前为止，Flagsmith 社区已经理解了这一变化，因为他们意识到这将带来更多更好的功能。

### Plausible vs. Google Analytics

Uku 说，在他看来，开源的精神是，代码应该是开放的，任何人都可以进行商业使用，并与社区共享，但你可以把一个闭源的 API 模块作为专有附加组件保留下来。这样一来，Plausible 和其他公司就可以通过创建和销售定制的 API 附加许可来满足不同的使用场景。

Marko 职位上是一名开发者，但从营销方面来说，他努力让这个项目在 Hacker News 和 Lobster 等网站上得到报道，并建立了 Twitter 帐户以帮助产生动力。这种宣传带来的热潮也意味着该项目在 GitHub 上起飞，从 500 颗星到 4300 颗星。随着流量的增长，Plausible 出现在 GitHub 的趋势列表中，这让其受欢迎程度像滚雪球一样。

Marko 还非常注重发布和推广博客文章。这一策略得到了回报，在最初的 6 个月里，有四五篇文章进入了病毒式传播，他利用这些峰值来放大营销信息，加速了增长。

Plausible 成长过程中最大的挑战是让人们从 Google Analytics 上转换过来。这个项目的主要目标是创建一个有用、高效、准确的网络分析产品。它还需要符合法规，并为企业和网站访问者提供高度的隐私。

Plausible 现在已经在 8000 多个网站上运行。通过与客户的交谈，Uku 估计其中约 90% 的客户运行过 Google Analytics。

Plausible 以标准的软件即服务 （SaaS） 订阅模式运行。为了让事情更公平，它按月页面浏览量收费，而不是按网站收费。对于季节性网站来说，这可能会有麻烦，比如说电子商务网站在节假日会激增，或者美国大选网站每四年激增一次。这些可能会导致月度订阅模式下的定价问题，但它通常对大多数网站很好。

### 查看播客

想要了解更多关于 Uku 和 Marko 如何以惊人的速度发展开源 Plausible 项目，并使其获得商业上的成功，请[收听播客][3]，并查看[其他剧集][5]，了解更多关于“开源软件社区的来龙去脉”。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/plausible

作者：[Ben Rometsch][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/flagsmith
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/analytics-graphs-charts.png?itok=sersoqbV (Analytics: Charts and Graphs)
[2]: https://plausible.io/
[3]: https://www.flagsmith.com/podcast/02-plausible
[4]: https://www.gnu.org/licenses/agpl-3.0.en.html
[5]: https://www.flagsmith.com/podcast