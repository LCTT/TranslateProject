[#]: subject: "4 levels of DevOps documentation maturity"
[#]: via: "https://opensource.com/article/22/2/devops-documentation-maturity"
[#]: author: "Will Kelly https://opensource.com/users/willkelly"
[#]: collector: "lujun9972"
[#]: translator: "toknow-gh"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

DevOps 文档成熟度的四个层次
====== 
提升 DevOps 文档成熟度的过程跟达到 DevOps 或 DevSecOps 成熟化的历程是类似的。
![Green graph of measurements][1]

为了能在软件迭代交付周期内按时交付优质的文档，DevOps 和 DevSecOps 的文档实践也需要是敏捷的。这与实现 DevOps 类似，只是更偏向自动化和敏捷的内容处理方法。如果文档现在才进入组织的 DevOps 讨论，那么是时候让文档实践追上 DevOps 的步伐了。

下面是 DevOps 文档成熟度的四个层次：

### 第一层：临时且孤立

在最低一级成熟度（最不成熟），文档编制工作没有和 DevOps 开发对齐。开发团队和文档团队按照各自的路线开展工作，常常导致文档落后于开发。在竞争激烈的“云”世界里，因为文档问题而推迟产品发布是不可接受的。

#### 人员

这个阶段的文档编制人员还没有摆脱传统的工作方式。<ruby>技术写作<rt>technical writer</rt></ruby>人员隶属于一个中心化的单独团队，与开发团队是脱节的。技术写作组和开发团队之间的鸿可能是由多方面原因造成的：

  * 造成团队分裂和孤立的公司政治
  * 团队只是将技术文档视为项目验收清单上的检查项，而不是推动项目成功的资产
  * 事后才雇佣技术写作人员
  * 技术写作的优先级与开发团队的实际情况不匹配

这个阶段，另一个在人员配置上的挑战是“界定工作完成”。刚接触敏捷实践的技术写作可能难以适应 CI/CD 工具链和流程。

#### 文档工具和流程

这个阶段的技术写作仍习惯于使用传统的办公工具，比如办公套件和布局程序。这些工具不够敏捷，没有版本控制和内容管理的要求。它们无法与 DevOps 工具链高效集成，不能支撑快速开发。在这个成熟度，技术写作仍然参照遗留的模板和流程。

#### 成果

这个级别交付的文档可能是过时的，甚至缺乏技术准确性的。如果开发团队以 DevOps 的速度推进工作，而技术文档编制却遵循传统的非敏捷流程（使用专有的工具和交付格式），这就很难让文档迭代速度并跟上应用程序的变化。

### 第二层：实验和试点

DevOps 文档成熟度的第二层是实验/试验阶段。这个阶段是 DevOps 团队主管和技术写作采取行动打造更敏捷的文档实践和工具的第一步。

理想的情况下，这些实验是<ruby>相关方<rt>stakeholder</rt></ruby>支持的试点项目的一部分。他们能够从文档交付流程的改善以及其与 DevOps 实践的集成中获益。 

#### 人员

本阶段的人员可能来自以下三种形式：

 1. 有远见的技术写作为了更好地完成工作，用自己的时间来实验更敏捷的工具。并且向领导层提出更敏捷的文档编制过程的想法。
 2. DevOps 负责人或工程师试用 Hugo 和 Jekyll 等工具，并将这些工具集成到 CI/CD 流水线中。然后 DevOps 小组教授技术写作如何使用它们。
 3. 团队引入了第三方承包商或顾问，他们在 DevOps 文档工具方面具有专业知识，并且了解文档工具适合嵌入到 CI/CD 工具链和 DevOps 生命周期的位置。
  


#### 文档工具和实践

[Hugo][2] 和 [Jekyll][3] 是本阶段开始出现的工具。在这个阶段也出现新的内容策略和技术写作方法。 

#### 成果

实验试点阶段理想的成果应该能够“<ruby>落地并推广<rt>land and expand</rt></ruby>”。也就是说其它项目组也可以将其付诸实践。

这个阶段的实验也包括内容策略和发布流程上的根本性变化。其它非试点项目组的技术写作可以学习和使用它们。

试点带来的另一个可能的产出是 [技术写作招聘流程][4] 的变化。你需要针对 DevOps 和你新引入的文档工具对内部编写人员进行培训。
 
新的文档工具和流程是此阶段的关键成果，你需要通过演示、状态报告和内部案例研究等方式，将这一成果推给领导层、相关方和其它团队。 

### 第三层：部分自动化和扩展

DevOps 文档成熟度的第三层（部分自动化和扩展）就是“落地并推广”的进一步行动。在这个阶段，其它 DevOps 团队借用试点项目中产生的 DevOps 文档工具和流程，吸取其中的经验教训。

#### 人员

在这个成熟度，技术写作和 DevOps 团队开始更紧密的协作。招聘新的技术写作主要关注具有 DevOps 环境经验的人选。
 

#### 工具和文档实践

技术写作开始从抛弃传统的工具和流程，转到更敏捷的文档工具上，比如：

  * [docToolchain][5]
  * [Docbook][6]
  * Hugo
  * Jekyll


在这个成熟度，技术写作也负责调整遗留的文档实践。

#### 成果

DevOps 文档工具和实践超越试点项目，成为标准实践。在这个成熟度，随着新团队使用新的文档工具和流程，持续学习是必不可少的。


### 第四层：完全采用 
 
在最高一级的 DevOps 文档成熟度（完全采用且自动化）所有工具、实践和流程都是为了支持将文档成为项目中的高优先级事项。要达到这一成熟度，需要不断实验、迭代和团队协作。 

#### 人员
 
完全自动化使 DevOps 团队与技术写作之间的协作更紧密。这一阶段的标志是，技术写作牢牢地融入到项目团队的工作流程中。文档工具的维护工作由一些大型企业负责，它们拥有专职维护 DevOps 工具链的工程师。 

#### 文档工具和实践

在这个成熟度，技术写作统一采用 Markdown 语言和自动化工具。

#### 成果

本阶段的成果是一套完整的工具和实践，它们支持自动化在线文档发布。技术写作者可以按需发布和重新发布文档，以支持迭代开发流程。

持续学习是这个阶段的另一项成果。技术写作和工具链维护者寻找改进自动化和流程的方法，以帮助文档实践。 

### 总结

提升 DevOps 文档成熟度的过程跟达到 DevOps 或 DevSecOps 成熟化的历程是类似的。我希望行业能够将更灵活的文档实践和工具作为公司推进 DevOps 进程中的一个部分。提高 DevOps 文档成熟度应该作整体 DevOps 成熟化甚至 [DevOps 到 DevSecOps 转型][7]的一部分。 

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/devops-documentation-maturity

作者：[Will Kelly][a]
选题：[lujun9972][b]
译者：[toknow-gh](https://github.com/toknow-gh)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/willkelly
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_lead-steps-measure.png?itok=DG7rFZPk (Green graph of measurements)
[2]: https://opensource.com/article/18/3/start-blog-30-minutes-hugo
[3]: https://opensource.com/article/17/4/getting-started-jekyll
[4]: https://opensource.com/article/19/11/hiring-technical-writers-devops
[5]: http://doctoolchain.org/
[6]: https://opensource.com/article/17/9/docbook
[7]: https://opensource.com/article/21/10/devops-to-devsecops
