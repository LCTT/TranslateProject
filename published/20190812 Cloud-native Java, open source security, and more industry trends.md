[#]: collector: (lujun9972)
[#]: translator: (laingke)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11400-1.html)
[#]: subject: (Cloud-native Java, open source security, and more industry trends)
[#]: via: (https://opensource.com/article/19/8/cloud-native-java-and-more)
[#]: author: (Tim Hildred https://opensource.com/users/thildred)

每周开源点评：云原生 Java、开源安全以及更多行业趋势
======

> 开源社区和行业趋势的每周总览。

![Person standing in front of a giant computer screen with numbers, data][1]

作为我在具有开源开发模型的企业软件公司担任高级产品营销经理的角色的一部分，我为产品营销人员、经理和其他影响者定期发布有关开源社区，市场和行业趋势的定期更新。 以下是该更新中我和他们最喜欢的五篇文章。

### 《为什么现代 web 开发如此复杂？》

- [文章地址][2]

> 现代前端 web 开发带来了一种两极分化的体验：许多人喜欢它，而其他人则鄙视它。
>
> 我是现代Web开发的忠实拥护者，尽管我将其描述为“魔法”——而魔法也有其优点和缺点……。最近，我一直在向那些只具有粗略的原始 web 开发工作流程的人们讲解“现代 web 开发工作流程”……，但我发现需要解释的内容实在是太多了！甚至笼统的解释最终都会变得冗长。因此，在我努力写下更多解释的过程中，这里是对 web 开发演变的一个长期而笼统的解释的开始……

**影响**：足够具体，对前端开发人员非常有用（特别是对新开发人员），且足够简单，解释得足够好，可以帮助非开发人员更好地理解前端开发人员的一些问题。到最后，你将（有点）了解 Javascript 和 WebAPI 之间的区别，以及 2019 年的 Javascript 与 2006 年的 Javascript 有何不同。

### 开源 Kubernetes 安全审计

- [文章链接][3]

> 去年，云原生计算基金会（CNCF）开始为其项目执行并开源第三方安全审计，以提高我们生态系统的整体安全性。这个想法是从一些项目开始，并从 CNCF 社区收集了关于这个试点项目是否有用的反馈。第一批经历这个过程的项目是 [CoreDNS][4]、[Envoy][5] 和 [Prometheus][6]。这些首次公开审计发现了从一般漏洞到严重漏洞的安全问题。有了这些结果，CoreDNS、Envoy 和 Prometheus 的项目维护者就能够解决已发现的漏洞，并添加文档来帮助用户。
>
> 从这些初始审计中得出的主要结论是，公开安全审计是测试开源项目的质量及其漏洞管理过程的一个很好的方法，更重要的是，测试开源项目的安全实践有多大的弹性。特别是 CNCF 的[毕业项目][7]，它们被世界上一些最大的公司广泛应用于生产中，它们必须坚持最高级别的安全最佳实践。

**影响**：就像 Linux 之于数据中心一样，很多公司都把云计算押宝在 Kubernetes 上。从安全的角度来看，看到其中 4 家公司以确保项目正在做应该做的事情，这激发了人们的信心。共享这项研究表明，开源远远不止是仓库中的代码；它是以一种有益于整个社区而不是少数人利益的方式获取和分享专家意见。

### Quarkus——这个轻量级 Java 框架的下一步是什么？

- [文章链接][8]

> “容器优先”是什么意思？Quarkus 有哪些优势？0.20.0 版本有什么新功能？未来我们可以期待哪些功能？1.0.0 版什么时候发布？我们对 Quarkus 有很多问题，而 Alex Soto 也很耐心地回答了所有问题。 随着 Quarkus 0.20.0 的发布，我们和 [JAX 伦敦演讲者][9]，Java 拥护者和红帽的开发人员体验总监 Alex Soto 进行了接触。他很好地回答了我们关于 Quarkus 的过去、现在和未来的所有问题。看起来我们对这个令人兴奋的轻量级框架有很多期待！

**影响**：最近有个聪明的人告诉我，Quarkus 有潜力使 Java “可能成为容器和无服务器环境的最佳语言之一”。不禁使我多看了一眼。尽管 Java 是最流行的编程语言之一（[如果不是最流行的][10]），但当你听到“云原生”一词时，它可能并不是第一个想到的语言。Quarkus 可以通过让开发人员将他们的经验应用到新的挑战中，从而扩展和提高他们所拥有的技能的价值。

### Julia 编程语言：用户批露他们最喜欢和最讨厌它的地方

- [文章链接][11]

> Julia 最受欢迎的技术特性是速度和性能，其次是易用性，而最受欢迎的非技术特性是使用者无需付费即可使用它。
>
> 用户还报告了他们对该语言最大的不满。排在首位的是附加功能的包不够成熟，或者维护得不够好，无法满足他们的需求。

**影响**：Julia 1.0 版本已经发布了一年，并且在一系列相关指标（下载、GitHub 星级等）中取得了令人瞩目的增长。它是一种直接针对我们当前和未来最大挑战（“科学计算、机器学习、数据挖掘、大规模线性代数、分布式和并行计算”）的语言，因此，了解用户对它的感受，就可以间接看到有关这些挑战的应对情况。

### 多云数据解读：11 个有趣的统计数据

- [文章链接][12]

> 如果你把我们最近对 [Kubernetes 的有趣数据][13]的深入研究归结最基本的一条，它看起来是这样的：[Kubernetes][14] 的受欢迎程度在可预见的未来将持续下去。
>
> 剧透警报：当你挖掘有关[多云][15]使用情况的最新数据时，他们告诉你一个类似的描述：使用率正在飙升。
>
> 这种一致性是有道理的。也许不是每个组织都将使用 Kubernetes 来管理其多云和/或[混合云][16]基础架构，但是两者越来越紧密地联系在一起。即使不这样做，它们都反映了向更分散和异构 IT 环境的普遍转变，以及[云原生开发][17]和其他重叠趋势。

**影响**：越来越多地采用“多云战略”的另一种解释是，它们将组织中单独部分未经协商而作出的决策追溯为“战略”，从而使决策合法化。“等等，所以你从谁那里买了几个小时？又从另一个人那里买了几个小时？为什么在会议纪要中没有呢？我想我们现在是一家多云公司！”。当然，我在开玩笑，我敢肯定大多数大公司的协调能力远胜于此，对吗？

*我希望你喜欢这张上周让我印象深刻的列表，并在下周一回来了解更多的开放源码社区、市场和行业趋势。*

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/cloud-native-java-and-more

作者：[Tim Hildred][a]
选题：[lujun9972][b]
译者：[laingke](https://github.com/laingke)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/thildred
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr (Person standing in front of a giant computer screen with numbers, data)
[2]: https://www.vrk.dev/2019/07/11/why-is-modern-web-development-so-complicated-a-long-yet-hasty-explanation-part-1/
[3]: https://www.cncf.io/blog/2019/08/06/open-sourcing-the-kubernetes-security-audit/
[4]: https://coredns.io/2018/03/15/cure53-security-assessment/
[5]: https://github.com/envoyproxy/envoy/blob/master/docs/SECURITY_AUDIT.pdf
[6]: https://cure53.de/pentest-report_prometheus.pdf
[7]: https://www.cncf.io/projects/
[8]: https://jaxenter.com/quarkus-whats-next-for-the-lightweight-java-framework-160793.html
[9]: https://jaxlondon.com/cloud-kubernetes-serverless/java-particle-acceleration-using-quarkus/
[10]: https://opensource.com/article/19/8/possibly%20one%20of%20the%20best%20languages%20for%20containers%20and%20serverless%20environments.
[11]: https://www.zdnet.com/article/julia-programming-language-users-reveal-what-they-love-and-hate-the-most-about-it/#ftag=RSSbaffb68
[12]: https://enterprisersproject.com/article/2019/8/multi-cloud-statistics
[13]: https://enterprisersproject.com/article/2019/7/kubernetes-statistics-13-compelling
[14]: https://www.redhat.com/en/topics/containers/what-is-kubernetes?intcmp=701f2000000tjyaAAA
[15]: https://www.redhat.com/en/topics/cloud-computing/what-is-multicloud?intcmp=701f2000000tjyaAAA
[16]: https://enterprisersproject.com/hybrid-cloud
[17]: https://enterprisersproject.com/article/2018/10/how-explain-cloud-native-apps-plain-english
