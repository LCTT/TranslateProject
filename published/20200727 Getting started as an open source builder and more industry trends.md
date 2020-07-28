[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12461-1.html)
[#]: subject: (Getting started as an open source builder and more industry trends)
[#]: via: (https://opensource.com/article/20/7/open-source-industry-trends)
[#]: author: (Tim Hildred https://opensource.com/users/thildred)

每周开源点评：开源建设者入门，以及更多的行业趋势
======

> 每周关注开源社区和行业趋势。

![](https://img.linux.net.cn/data/attachment/album/202007/28/175317mgsvgtvstvcggsch.jpg)

我在一家采用开源软件开发模型的企业软件公司任高级产品营销经理，我的一部分职责是为产品营销人员、经理和其他相关人定期发布有关开源社区、市场和业界发展趋势的更新。以下是该更新中我和他们最喜欢的五篇文章。

### 《[开放源码建设者：入门][2]》

> "最后，我发现自己想要自己修改代码，"Liz 说。她的第一个贡献是为 Django 框架做了一个授权扩展。她补充说："我记得当时我很担心维护者可能不希望一个完全陌生的人做的改动，所以当它被接受时，我感到很兴奋，也很欣慰……得到认可，甚至感谢你的贡献，这种感觉总是很好。"

**分析：** 这一系列对开源维护者的采访（引自 [Liz Rice][3]）交汇了跳入开源领域的动机和经验。这也是对天才独狼开发者神话的一个点赞，你可以自己走很远的路，但如果你知道如何与其他人很好地合作，你会走得更远，建立更好的东西。如果你知道如何说服和激励他们，你会走得更远。

### 《[Fluent Bit v1.5：轻量级和高性能日志处理器][4]》

> 本次主要版本的最大亮点之一是不同公司与 Fluent Bit 核心维护者的联合工作，为 Google、Amazon、LogDNA、New Relic 和 Sumo Logic 等公司内部提供的可观察性云服务带来了改进和新的连接器。

**分析：** “从不同来源收集数据/日志，统一并将其发送到多个目的地”是一项繁琐的任务，但这是超大规模企业及其客户共同的任务。证据 A：一个开源工作完全如其预期的典型例子。祝贺 Fluent Bit 团队的这次发布！

### 《[Kubernetes 如何让 Nubank 工程师每周部署 700 次][5]》

> 因此，生产环境的部署时间从 90 分钟变成了 15 分钟。而 Nobre 说，这是“最主要的好处，因为它有助于开发人员的体验”。如今，Nubank 的工程师每周部署 700 次。“对于一家银行来说，你会说这太疯狂了，”Capaverde 笑着说。“但这并不疯狂，因为有了 Kubernetes 和金丝雀部署，回滚变化更容易，因为部署速度也更快。人们的出货频率更高，更有信心。”

**分析：** 我觉得这是个赢家，也是个输家。当然，他们降低了做出改变的成本，以一种让人们更有信心去尝试的方式。但他们的开发人员不能再在等待部署完成的同时跑 10 公里，现在只能在一次 TED 演讲中凑合。

希望你喜欢这个列表，下周再见。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/open-source-industry-trends

作者：[Tim Hildred][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/thildred
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr (Person standing in front of a giant computer screen with numbers, data)
[2]: https://idk.dev/open-source-builders-getting-started/
[3]: https://twitter.com/lizrice
[4]: https://www.cncf.io/blog/2020/07/14/fluent-bit-v1-5-lightweight-and-high-performance-log-processor/
[5]: https://www.cncf.io/blog/2020/07/10/how-kubernetes-empowered-nubank-engineers-to-deploy-200-times-a-week/
