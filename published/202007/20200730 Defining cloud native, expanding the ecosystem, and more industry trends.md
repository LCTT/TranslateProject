[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12473-1.html)
[#]: subject: (Defining cloud native, expanding the ecosystem, and more industry trends)
[#]: via: (https://opensource.com/article/20/7/cloud-native-expanding-and-more-industry-trends)
[#]: author: (Tim Hildred https://opensource.com/users/thildred)

每周开源点评：定义云原生、拓展生态系统，以及更多的行业趋势
======

> 每周关注开源社区和行业趋势。

![](https://img.linux.net.cn/data/attachment/album/202007/31/235751f5zd9l3rejd2tjss.jpg)

我在一家采用开源软件开发模型的企业软件公司任高级产品营销经理，我的一部分职责是为产品营销人员、经理和其他相关人定期发布有关开源社区、市场和业界发展趋势的更新。以下是该更新中我和他们最喜欢的几篇文章。

### 《随着云原生计算的兴起，它和代码一样在改变文化》

- [文章链接][2]

> 现在是围绕一套云原生计算的共同原则进行行业整合的时候了，因为许多企业已经意识到，他们最初进入云计算的回报有限。国际数据公司去年的一项调查发现，[80% 的受访者曾将工作负载从公有云环境遣返到企业内部][3]，平均而言，他们预计在未来两年内将一半的公有云应用转移到私有场所。

**分析**：在云端的第一次运行主要是大量的“提升和转移”尝试，以提取工作负载并将其投放到云端。第二次运行将涉及更多的工作，以确定转移什么以及如何转移，但随着开发人员对理所当然的事情越来越满意，最终应该会带来更多价值。

### 《为什么云原生基础设施的自动化是所有参与者的胜利》

- [文章链接][4]

> 开发的圣杯是创建和维护安全的应用程序，产生强大的投资回报率和满意的客户。但如果这种开发不是高效、高速和可扩展的，那么这个圣杯很快就会变得遥不可及。如果你发现自己对当前的基础设施有更高的期望，那么可能是时候考虑云原生了。它不仅可以检查所有这些机器，而且为云原生基础设施进行自动化可以提高效率和结果。

**分析**：我还要补充一点，如果没有大量的自动化，真正采用云原生方法是不可能的；涉及的移动部件数量太多，不可能用人的头脑来处理。

### 《Linkerd 案例研究：满足安全要求、减少延迟和从 Istio 迁移》

- [文章链接][5]

> 最后，Subspace 分享了其使用 Linkerd 提供“光速”多人游戏的经验。虽然在超低延迟环境中使用服务网状物起初似乎有悖常理，但 Subspace 发现 Linkerd 的战略使用实际上降低了总延迟 —— 服务网状物是如此轻巧，以至于它增加的最小延迟被它通过可观察性降低的延迟所掩盖。简而言之，Linkerd 的这一独特用例使 Subspace 在运营结果上获得了巨大的净收益。[阅读完整的用户故事][6]。

**分析**：我听说过这样一个观点：你并不能真正降低一个系统的复杂性，你只是把它抽象化，改变它的接触对象。似乎对延迟也有类似的观察：如果你仔细选择你接受延迟的地方，你可以因此减少系统中其他地方的延迟。

### 一位高层管理人员解释了 IBM 的“重要支点”，以赢得开发者、初创企业和合作伙伴的青睐，这是其从微软等竞争对手手中赢得混合云市场计划的一部分

- [文章链接][7]

> 蓝色巨人正在转向一个新的战略，专注于建立一个由开发者、合作伙伴和初创公司组成的生态系统。“我们的服务组织无法接触到所有客户。获取这些客户的唯一方法是激活一个生态系统。”

**分析**：越来越多的公司开始接受这样的理念：有些客户的问题，他们没有帮助就无法解决。也许这可以减少从每个单独客户身上赚到的钱，因为它扩大了更广泛地参与更多问题空间的机会。

希望你喜欢这个列表，下周再见。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/cloud-native-expanding-and-more-industry-trends

作者：[Tim Hildred][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/thildred
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr (Person standing in front of a giant computer screen with numbers, data)
[2]: https://siliconangle.com/2020/07/18/cloud-native-computing-rises-transforming-culture-much-code/
[3]: https://www.networkworld.com/article/3400872/uptick-in-cloud-repatriation-fuels-rise-of-hybrid-cloud.html
[4]: https://thenewstack.io/why-automating-for-cloud-native-infrastructures-is-a-win-for-all-involved/
[5]: https://www.cncf.io/blog/2020/07/21/linkerd-case-studies-meeting-security-requirements-reducing-latency-and-migrating-from-istio/
[6]: https://buoyant.io/case-studies/subspace/
[7]: https://www.businessinsider.com/ibm-developers-tech-ecosystem-red-hat-hybrid-cloud-bob-lord-2020-7?r=AU&IR=T
