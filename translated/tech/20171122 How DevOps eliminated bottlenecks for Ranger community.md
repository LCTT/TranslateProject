DevOps 如何消除掉 Ranger 社区的瓶颈
======
![配图](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/traffic-light-go.png?itok=nC_851ys)

Visual Studio Application Lifecycle Management（ALM）项目 ——  [Ranger][1] 是一个志愿者社区，它提供专业的指导、实践经验、以及开发者社区的漏洞修补解决方案。它创建于 2006 年，作为微软内部社区去 "connect the product group with the field and remove adoption blockers"。 在 2009 时，社区已经有超过 200 位成员，这导致了协作和计划面临很大的挑战，在依赖和手工流程上产生了瓶颈，并导致了开发者社区不断增加的延迟和各种报怨。在 2010 时，计划进一步去扩充包括微软最有价值专家（MVP）在内的分布在全球的社区。

这个社区被分割成十几个活跃的团队。每个团队都致力于通过它的生命周期去设计、构建和支持一个指导或处理项目。在以前，团队的瓶颈在团队管理级别上，原因是严格的、瀑布式的流程和高度依赖一个或多个项目经理。在制作、发布和“为什么、做什么、和怎么做”驱动的决定上，项目经理都要介入其中。另外，缺乏一个实时的指标阻止了团队对他们的解决方案效率的监控，以及对来自社区的关于 bug 和常见问题的关注。

是时候去寻找一些做好这些事情的方法了，更好地实现开发者社区的价值。

### DevOps 去“灭火”

> "DevOps 是人员、流程、和产品的结合，使我们的最终用户能够持续传递价值。" --[Donovan Brown][2]

为解决这些挑战，社区停止了所有对新项目的冲刺，去探索敏捷实践和新产品。致力于使社区重新活跃起来，为找到促进自治、掌控、和目标的方法，正如在 Daniel H. Pink 的书 —— [Drive][3] 中所说的那样，对僵化的流程和产品进行彻底的改革。

> “成熟的自组织、自管理、和跨职能团队，在自治、掌控、和目标上茁壮成长。" --Drive, Daniel H. Pink.

从文化开始 —— 人 —— 第一步是去拥抱 DevOps。社区实现了 [Scrum][4] 框架，使用 [kanban][5] 去提升工程化流程，并且通过可视化去提升透明度、意识和最重要的东西 —— 信任。使用自组织团队后，传统的等级制度和指挥系统消失了。自管理促使团队去积极监视和设计它们自己的流程。

在 2010 年 4 月份，社区再次实施了另外的关键一步，切换并提交它们的文化、流程、以及产品到云上。虽然开放的”为社区而社区“的核心 [解决方案][6] 仍然是指导和补充，但是在开源解决方案（OSS）上大量增加投资去研究和共享 DevOps 转换的成就。

持续集成（CI）和持续交付（CD）使用自动化流水线代替了死板的人工流程。这使得团队在不受来自项目经理的干预的情况下为早期问题和早期应用者部署解决方案。增加遥测技术可以使团队关注他们的解决方案，以及在用户注意到它们之前，检测和处理未知的问题。

DevOps 转变是一个持续进化的过程，通过实验去探索和验证人、流程、和产品的改革。最新的试验引入了流水线革新，它可以持续提升价值流。自动扫描组件、持续地、以及静默地检查安全、协议、和开源组件的品质。部署环和特性标志允许团队对所有或者特定用户进行更细粒度的控制。

在 2017 年 10 月，社区将大部分的私有版本控制仓库转移到 [GitHub][7] 上。对所有仓库转移所有者和管理职责到 ALM DevOps Rangers 社区，给团队提供自治和机会，去激励更多的社区对开源解决方案作贡献。团队被授权向他们的最终用户交付质量和价值。

### 好处和成就

拥抱 DevOps 使 Ranger 社区变得更加敏捷，实现了对市场的快速反应和快速学习和反应的流程，减少了宝贵的时间投入，并宣布自治。

下面是从这个转变中观察到的一个列表，排列没有特定的顺序：

  * 自治、掌控、和目标是核心。
  * 从可触摸的和可迭代的东西开始 —— 避免摊子铺的过大。
  * 可触摸的和可操作的指标很重要 —— 确保不要掺杂其它东西。
  * 人（文化）的转变是最具挑战的部分。
  * 没有蓝图；任何一个组织和任何一个团队都是独一无二的。
  * 转变是一个持续的过程。
  * 透明和可视非常关键。
  * 使用工程化流程去强化预期行为。



转换变化表：~~（致核对：以下是表格，格式转换造成错乱了。）~~

PAST CURRENT ENVISIONED Branching Servicing and release isolation Feature Master Build Manual and error prone Automated and consistent  Issue detection Call from user Proactive telemetry  Issue resolution Days to weeks Minutes to days Minutes Planning Detailed design Prototyping and storyboards  Program management 2 program managers (PM) 0.25 PM 0.125 PM Release cadence 6 to 12 months 3 to 5 sprints Every sprint Release Manual and error prone Automated and consistent  Sprints 1 month 3 weeks  Team size 10 to 15 2 to 5  Time to build Hours Seconds  Time to release Days Minutes

但是，我们还没有做完，相反，我们就是一个令人兴奋的、持续不断的、几乎从不结束的转变的一部分。

如果你想去学习更多的关于我们的转变、有益的经验、以及想知道我们所经历的挑战，请查看 [转变到 DevOps 文化的记录][8]。"

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/11/devops-rangers-transformation

作者：[Willy Schaub][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/wpschaub
[1]:https://aka.ms/vsaraboutus
[2]:http://donovanbrown.com/post/what-is-devops
[3]:http://www.danpink.com/books/drive/
[4]:http://www.scrumguides.org/scrum-guide.html
[5]:https://leankit.com/learn/kanban/what-is-kanban/
[6]:https://aka.ms/vsarsolutions
[7]:https://github.com/ALM-Rangers
[8]:https://github.com/ALM-Rangers/Guidance/blob/master/src/Stories/our-journey-of-transforming-to-a-devops-culture.md
