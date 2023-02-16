[#]: subject: "A DevOps guide to documentation"
[#]: via: "https://opensource.com/article/21/3/devops-documentation"
[#]: author: "Will Kelly https://opensource.com/users/willkelly"
[#]: collector: "lujun9972"
[#]: translator: "Veryzzj"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15349-1.html"

文档写作的 DevOps 指南
======

> 将文档写作加入到 DevOps 的生命周期中。

![][0]

DevOps 正在挑战技术文档的规范，这在 IT 历史上是前所未有的。从自动化到提高交付速度，再到拆除瀑布式软件开发生命周期模型，这意味着业务和技术文档写作的理念需要做出巨大改变。

以下是 DevOps 对技术文档写作不同方面的影响。

### 技术写手的角色变化

技术写手必须适应 DevOps。好消息是，许多技术写手已经加入到开发团队中，并且拥有合作关系和不断增长的产品知识的技术写手很具优势。

但是如果一个技术写手习惯于独立工作，并依赖于领域专家的草稿作为文档的基础，那么就需要做一些调整。

进行一些投资，以确保文档和其他与项目有关的内容开发工作获得所需的工具、结构和支持。从改变 [技术写手聘用方式][2] 开始。以 [DevOps 的速度][3] 编写文档需要重新思考内容规划，并打破 DevOps 团队和支持项目的技术写手之间长期存在的隔阂。

DevOps 使开发团队摆脱了传统文档实践的束缚。首先，文档 [完成的定义][4] 必须改变。一些企业的文化使技术写手成为软件开发的被动参与者。DevOps 提出了新的要求：随着 DevOps 文化的转变，技术写手的角色也应发生变化。技术写手需要（且必须适应）DevOps 提供的透明度。他们必须融入 DevOps 团队。取决于组织如何塑造这个角色，将技术写手带入团队可能会带来技能上的挑战。

### 文档标准、方法和规格

虽然 DevOps 还没有影响到技术文档本身，但开源社区已经加强了对应用编程接口（API）文档的帮助，已经有不同规模的企业的 DevOps 团队正在使用这些文档。

用于记录 API 的开源规范和工具是个非常值得关注的领域。我想这是由于 [谷歌文档季][5] 的影响，它使开源软件项目能够获得专业的技术写作人才来解决他们最关键的文档项目。

开源 API 属于 DevOps 文档讨论的一部分。云原生应用集成需求的重要性正在上升。[OpenAPI 规范][6]（一个定义和记录 API 的开放标准）是在 DevOps 环境下 API 文档的良好资源。然而，该规范会导致文档的创建和更新过程变得很费时，这使其饱受批评。

曾经也有短暂尝试过创建 <ruby>[持续文档][7]<rt>Continuous Documentation</rt></ruby>，并且还有一个来自 CA（现在的 Broadcom）的创建 [DocOps][8] 框架的运动。然而，DocOps 从来没有作为一个行业运动流行起来。

DevOps 文档标准的现状意味着 DevOps 团队（包括技术写手）需要在项目的最初阶段就开始创建文档。要做到这一点，你需要把文档作为一个敏捷故事和（同样重要的）管理期望，并且把它与年度绩效评估放在一起执行。

### 文档工具

文档的编写应该以一种所有团队成员都可以使用的格式或平台在线进行。MediaWiki、DokuWiki、TikiWiki 和其他 [开源维基][9] 为 DevOps 团队提供了一个编写和维护文档的中央仓库。

让团队选择他们的维基平台，就像让他们选择他们的其他持续集成/持续开发（CI/CD）工具链一样。开源维基强大之处在于其可扩展性。例如，DokuWiki 包括一系列的扩展，你可以通过安装这些扩展来创建一个符合你的 DevOps 团队的创作要求的平台。

如果你有足够的野心来加强你的团队的编写和协作能力，[Nextcloud][10]（一个开源的云协作套件）是一个让你的 DevOps 团队上网并给他们提供编写文档所需工具的选择。

### DevOps 最佳实践

文档在 DevOps 转型中也发挥着作用。例如，你会想要记录组织从 DevOps 实现效率和流程增益的最佳实践，这些信息太重要了，不能靠着 DevOps 团中之间口耳相传。如果你所在的组织有多个 DevOps 团队，那么文档就是统一的力量，它可以促进最佳实践的标准化，并设置了衡量代码质量的基准指标。

一般情况下，开发人员承担了记录 DevOps 实践的工作。即使他们的组织有技术写手，他们也可能跨开发团队工作。因此，开发人员和系统管理员能够捕捉、记录和交流他们的最佳实践是很重要的。这里有一些朝正确的方向发展的提示：

* 提前花时间为 DevOps 最佳实践创建标准模板。不要陷入复制在线模板的陷阱。采访利益相关者和团队来创建一个符合团队需求的模板。 
* 寻找一些创造性的信息收集的方法，例如记录团队会议和使用聊天系统日志来作为文档的基础。 
* 建立一个用于发布最佳实践的维基。使用维基可以跟踪编辑和更新。这样的平台可以帮助团队在最佳实践发生变化时进行更新和维护。  

当在构建 CI/CD 工具链时记录依赖关系是非常明智的。尤其是当加入新的团队成员时，你会发现这些记录非常有用，另外当团队成员忘记一些事情时，这也是一种保险。

最后，自动化对 DevOps 利益相关者和从业者都很有吸引力。在自动化中断之前，一切都很有趣。拥有自动化运行手册、管理指南和其他内容的文档（并且是最新的）意味着无论何时发生故障，员工都可以让自动化重新工作。

### 最后一些想法

DevOps 对于技术文档来说是一个积极的因素。它将内容开发纳入 DevOps 生命周期，并打破组织文化中开发人员和技术作者之间的隔阂。在没有技术写手的情况下，团队就可以使用工具来加快文档创作的速度，以与 DevOps 的速度相匹配。 

你的组织将如何把文档加入到 DevOps 生命周期？请在评论区分享你的经验。 

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/devops-documentation

作者：[Will Kelly][a]
选题：[lujun9972][b]
译者：[Veryzzj](https://github.com/Veryzzj)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/willkelly
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/typewriter-hands.jpg?itok=oPugBzgv "Typewriter with hands"
[2]: https://opensource.com/article/19/11/hiring-technical-writers-devops
[3]: https://searchitoperations.techtarget.com/opinion/Make-DevOps-documentation-an-integral-part-of-your-strategy?_ga=2.73253915.980148481.1610758264-908287796.1564772842
[4]: https://www.agilealliance.org/glossary/definition-of-done
[5]: https://developers.google.com/season-of-docs
[6]: https://swagger.io/specification/
[7]: https://devops.com/continuous-documentation
[8]: https://www.cmswire.com/cms/information-management/the-importance-of-docops-in-the-new-era-of-business-027489.php
[9]: https://opensource.com/article/20/7/sharepoint-alternative
[10]: https://opensource.com/article/20/7/nextcloud
[0]: https://img.linux.net.cn/data/attachment/album/202212/15/101537c4kcxxzqzh6fxkor.jpg