[#]: collector: "lujun9972"
[#]: translator: "messon007"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-12031-1.html"
[#]: subject: "DevOps vs Agile: What's the difference?"
[#]: via: "https://opensource.com/article/20/2/devops-vs-agile"
[#]: author: "Taz Brown https://opensource.com/users/heronthecli"

DevOps 和敏捷：究竟有什么区别？
======

> 两者之间的区别在于开发完毕之后发生的事情。

![](https://img.linux.net.cn/data/attachment/album/202003/23/200609w2rlzrjjhpf2hzsq.jpg)

早期，软件开发并没有特定的管理流程。随后出现了<ruby>[瀑布开发流程][2]<rt>Waterfall</rt></ruby>，它提出软件开发活动可以用开发和构建应用所耗费的时间来定义。

那时候，由于在开发流程中没有审查环节和权衡考虑，常常需要花费很长的时间来开发、测试和部署软件。交付的软件也是带有缺陷和 Bug 的质量较差的软件，而且交付时间也不满足要求。那时候软件项目管理的重点是长期而拖沓的计划。

瀑布流程与<ruby>[三重约束模型][3]<rt>triple constraint model</rt></ruby>相关，三重约束模型也称为<ruby>项目管理三角形<rt>project management triangle</rt></ruby>。三角形的每一个边代表项目管理三要素的一个要素: **范围、时间和成本**。正如 [Angelo Baretta 写到][4]，三重约束模型“认为成本是时间和范围的函数，这三个约束以一种确定的、可预测的方式相互作用。……如果我们想缩短时间表（时间），就必须增加成本。如果我们想增加范围，就必须增加成本或时间。”

### 从瀑布流程过渡到敏捷开发

瀑布流程来源于生产和工程领域，这些领域适合线性化的流程：正如房屋封顶之前需要先盖好支撑墙。相似地，软件开发问题被认为可以通过提前做好计划来解决。从头到尾，开发流程均由路线图清晰地定义，沿着路线图就可以得到最终交付的产品。

最终，瀑布模型被认为对软件开发是不利的而且违反人的直觉，因为通常直到开发流程的最后才能体现出项目的价值，这导致许多项目最终都以失败告终。而且，在项目结束前客户看不到任何可以工作的软件。

<ruby>敏捷<rt>Agile</rt></ruby>采用了一种不同的方法，它抛弃了规划整个项目，承诺估计的时间点，简单的遵循计划。与瀑布流程相反，它假设和拥抱不确定性。它的理念是以响应变化代替讨论过去，它认为变更是客户需求的一部分。 

### 敏捷价值观

敏捷由<ruby>敏捷宣言<rt>Agile Manifesto</rt></ruby>代言，敏捷宣言定义了 [12 条原则][5]（LCTT 译注：此处没有采用本文原本的简略句式，而是摘录了来自敏捷软件开发宣言官方的[中文译本][14]）：

1. 我们最重要的目标，是通过持续不断地及早交付有价值的软件使客户满意。
2. 欣然面对需求变化，即使在开发后期也一样。
3. 经常交付可工作的软件，相隔几星期或一两个月，倾向于采取较短的周期。
4. 业务人员和开发人员必须相互合作，项目中的每一天都不例外。
5. 激发个体的斗志，以他们为核心搭建项目。提供所需的环境和支援，辅以信任，从而达成目标。
6. 面对面沟通是传递信息的最佳的也是效率最高的方法。
7. 可工作的软件是进度的首要度量标准。
8. 敏捷流程倡导可持续的开发，责任人、开发人员和用户要能够共同维持其步调稳定延续。
9. 坚持不懈地追求技术卓越和良好设计，敏捷能力由此增强。
10. 以简洁为本，它是极力减少不必要工作量的艺术。
11. 最好的架构，需求和设计出自自组织团队
12. 团队定期地反思如何能提高成效，并依此调整自身的举止表现。

敏捷的四个[核心价值观][6]是（LCTT 译注：[此处译文][15]同样来自敏捷软件开发宣言官方）：

* **个体和互动** 高于流程和工具
* **工作的软件** 高于详尽的文档
* **客户合作** 高于合同谈判
* **响应变化** 高于遵循计划

这与瀑布流程死板的计划风格相反。在敏捷流程中，客户是开发团队的一员，而不仅仅是在项目开始时参与项目需求的定义，在项目结束时验收最终的产品。客户帮忙团队完成[验收标准][7]，并在整个过程中保持投入。另外，敏捷需要整个组织的变化和持续的改进。开发团队和其他团队一起合作，包括项目管理团队和测试团队。做什么和计划什么时候做由指定的角色领导，并由整个团队同意。

### 敏捷软件开发

敏捷软件开发需要自适应的规划、演进式的开发和交付。许多软件开发方法、框架和实践遵从敏捷的理念，包括：

* Scrum
* <ruby>看板<rt>Kanban</rt></ruby>（可视化工作流）
* <ruby>极限编程<rt>Xtreme Programming</rt></ruby>（XP）
* <ruby>精益方法<rt>Lean</rt></ruby>
* DevOps
* <ruby>特性驱动开发<rt>Feature-Driven Development</rt></ruby>（FDD）
* <ruby>测试驱动开发<rt>Test-Driven Development</rt></ruby>（TDD）
* <ruby>水晶方法<rt>Crystal</rt></ruby>
* <ruby>动态系统开发方法<rt>Dynamic Systems Development Method</rt></ruby>（DSDM）
* <ruby>自适应软件开发<rt>Adaptive Software Development</rt></ruby>（ASD）

所有这些已经被单独用于或一起用于开发和部署软件。最常用的是 [Scrum][8]、看板（或 Scrumban）和 DevOps。

[Scrum][9] 是一个框架，采用该框架的团队通常由一个 Scrum 教练、产品经理和开发人员组成，该团队以跨职能、自主的工作方式运作，能够加快软件交付速度从而给客户带来巨大的商业价值。其关注点是[较小增量][10]的快速迭代。

[看板][11] 是一个敏捷框架，有时也叫工作流管理系统，它能帮助团队可视化他们的工作从而最大化效率（因而变得敏捷）。看板通常由数字或物理展示板来呈现。团队的工作在展示板上随着进度而移动，例如从未启动到进行中，一直到测试中、已完成。看板使得每个团队成员可以随时查看到所有工作的状态。

### DevOps 价值观

DevOps 是一种文化，是一种思维状态，是一种软件开发的方式或者基础设施的方式，也是一种构建和部署软件和应用的方式。它假设开发和运维之间没有隔阂，他们一起合作，没有矛盾。

DevOps 基于其它两个领域的实践: 精益和敏捷。DevOps 不是一个公司内的岗位或角色；它是一个组织或团队对持续交付、持续部署和持续集成的坚持不懈的追求。[Gene Kim][12]（Phoenix 项目和 Unicorn 项目的作者）认为，有三种方式定义 DevOps 的理念：

* 第一种: 流程原则
* 第二种: 反馈原则
* 第三种: 持续学习原则

### DevOps 软件开发

DevOps 不会凭空产生；它是一种灵活的实践，它的本质是一种关于软件开发和 IT 或基础设施实施的共享文化和思维方式。

当你想到自动化、云、微服务时，你会想到 DevOps。在一次[访谈][13]中，《加速构建和扩张高性能技术组织》的作者 Nicol Forsgren、Jez Humble 和 Gene Kim 这样解释到：

> * 软件交付能力很重要，它极大地影响到组织的成果，例如利润、市场份额、质量、客户满意度以及组织战略目标的达成。
> * 优秀的团队能达到很高的交付量、稳定性和质量；他们并没有为了获得这些属性而进行取舍。
> * 你可以通过实施精益、敏捷和 DevOps 中的实践来提升能力。
> * 实施这些实践和能力也会影响你的组织文化，并且会进一步对你的软件交付能力和组织能力产生有益的提升。
> * 懂得怎样改进能力需要做很多工作。

### DevOps 和敏捷的对比

DevOps 和敏捷有相似性，但是它们不完全相同，一些人认为 DevOps 比敏捷更好。为了避免造成混淆，深入地了解它们是很重要的。

#### 相似之处

* 毫无疑问，两者都是软件开发技术。
* 敏捷已经存在了 20 多年，DevOps 是最近才出现的。
* 两者都追求软件的快速开发，它们的理念都基于怎样在不伤害客户或运维利益的情况下快速开发出软件。

#### 不同之处

* 两者的差异在于软件开发完成后发生的事情。
    * 在 DevOps 和敏捷中，都有软件开发、测试和部署的阶段。然而，敏捷流程在这三个阶段之后会终止。相反，DevOps 包括后续持续的运维。因此，DevOps 会持续的监控软件运行情况和进行持续的开发。
* 敏捷中，不同的人负责软件的开发、测试和部署。而 DevOps 工程角色负责所有活动，开发即运维，运维即开发。
* DevOps 更关注于削减成本，而敏捷则是精益和减少浪费的代名词，侧重于像敏捷项目会计和最小可行产品的概念。
* 敏捷专注于并体现了经验主义（适应、透明和检查），而不是预测性措施。

敏捷 | DevOps
--- | ---
从客户得到反馈 | 从自己得到反馈 
较小的发布周期 | 较小的发布周期，立即反馈 
聚焦于速度 | 聚焦于速度和自动化
对业务不是最好 | 对业务最好

### 总结

敏捷和 DevOps 是截然不同的，尽管它们的相似之处使人们认为它们是相同的。这对敏捷和 DevOps 都是一种伤害。

根据我作为一名敏捷专家的经验，我发现对于组织和团队从高层次上了解敏捷和 DevOps 是什么，以及它们如何帮助团队更高效地工作，更快地交付高质量产品从而提高客户满意度非常有价值。

敏捷和 DevOps 绝不是对抗性的（或至少没有这个意图）。在敏捷革命中，它们更像是盟友而不是敌人。敏捷和 DevOps 可以相互协作一致对外，因此可以在相同的场合共存。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/devops-vs-agile

作者：[Taz Brown][a]
选题：[lujun9972][b]
译者：[messon007](https://github.com/messon007)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/heronthecli
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/collab-team-pair-programming-code-keyboard.png?itok=kBeRTFL1 "Pair programming"
[2]: http://www.agilenutshell.com/agile_vs_waterfall
[3]: https://en.wikipedia.org/wiki/Project_management_triangle
[4]: https://www.pmi.org/learning/library/triple-constraint-erroneous-useless-value-8024
[5]: http://agilemanifesto.org/principles.html
[6]: https://agilemanifesto.org/
[7]: https://www.productplan.com/glossary/acceptance-criteria/
[8]: https://opensource.com/article/19/8/scrum-vs-kanban
[9]: https://www.scrum.org/
[10]: https://www.scrum.org/resources/what-is-an-increment
[11]: https://www.atlassian.com/agile/kanban
[12]: https://itrevolution.com/the-unicorn-project/
[13]: https://www.infoq.com/articles/book-review-accelerate/
[14]: http://agilemanifesto.org/iso/zhchs/principles.html
[15]: http://agilemanifesto.org/iso/zhchs/manifesto.html
