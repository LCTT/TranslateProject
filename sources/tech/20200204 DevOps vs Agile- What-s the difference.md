[#]: collector: "lujun9972"
[#]: translator: "messon007"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "
[#]: subject: "DevOps vs Agile: What's the difference?"
[#]: via: "https://opensource.com/article/20/2/devops-vs-agile"
[#]: author: "Taz Brown https://opensource.com/users/heronthecli"

DevOps vs Agile: What's the difference? DevOps和Agile的差别
======

The difference between the two is what happens after development. 两者之间的差别在于开发完成之后发生的事情。
![Pair programming][1]

Early on, software development didn't really fit under a particular management umbrella. Then along came [waterfall][2], which spoke to the idea that software development could be defined by the length of time an application took to create or build.

早期, 软件开发并没有特定的管理流程。随后出现了瀑布开发模型, 它提出了软件开发活动可以被应用开发和构建花费的时间来定义。

Back then, it often took long periods of time to create, test, and deploy software because there were no checks and balances during the development process. The results were poor software quality with defects and bugs and unmet timelines. **The focus was on long, drawn-out plans for software projects.</u>**

回想那时候, 由于在开发流程中没有审查和权衡活动, 常常需要花费很长的时间来开发, 测试和部署软件。交付的软件也是带有缺陷和Bug的质量较差的软件, 而且交付时间也不满足要求。软件项目的重点是长期的计划。

**Waterfall projects have been associated with the [triple constraint][3] model,** which is also called the project management triangle. Each side of the triangle represents a component of the triple constraints of project management: **scope**, **time**, and **cost**. As [Angelo Baretta writes][4], the triple constraint model "says that cost is a function of time and scope, that these three factors are related in a defined and predictable way… [I]f we want to shorten the schedule (time), we must increase cost. It says that if we want to increase scope, we must increase cost or schedule."

瀑布模型与三重约束模型相关, 三重约束模型也称为项目管理三角形。三角形的每一个边代表项目管理三要素的一个组件: **范围, 时间和成本。**Angelo Baretta写到, 三重约束模型认为成本是时间和范围的函数, 这三个约束以一种确定的, 可预测的方式相关联。如果我们想缩短时间, 我们必须增加成本。如果我们想增加范围, 我们必须增加成本或时间。

### Transitioning from waterfall to agile 从瀑布模型过渡到敏捷开发

Waterfall came from manufacturing and engineering, where a linear process makes sense; **you build the wall before you build the roof.** Similarly, software development problems were viewed as something that could be solved with planning. From beginning to end, the development process was clearly defined by a **roadmap that would lead to the final delivery of a product.**

瀑布模型来源于生产和工程, 线性流程适用于这些领域: 建屋顶之前需要先建墙。相似地, 软件开发问题被认为可以通过计划来解决。从头到尾, 开发流程被待交付产品的路线图清晰地定义。

Eventually, waterfall was recognized as detrimental and counterintuitive to software development because, often, the value could not be determined until the very end of the project cycle, and in many cases, the projects failed. Also, the customer didn't get to see any working software until the end of the project.

最终, 瀑布模型被认为对软件开发不利, 且违反人的直觉, 因为直到开发环节的最后才能体现出价值, 在许多情况下项目以失败告终。而且, 客户在项目结束前看不到任何可以工作的软件。

Agile takes a different approach that moves away from planning the entire project, committing to estimated dates, and being accountable to a plan. Rather, agile assumes and embraces uncertainty. It is built around the idea of responding to change instead of charging past it or ignoring the need for it. Instead, change is considered as a way to fulfill the needs of the customer.

敏捷采用了一种不同的方法, 它抛弃了规划整个项目, 承诺估计的时间点, 遵循计划。与瀑布流程相反, 它假设和拥抱不确定性。它的理念是以响应变化代替讨论过去, 变更被认为是完成客户需求的一种方式。 

### Agile values 敏捷价值观

Agile is governed by the Agile Manifesto, which defines [12 principles][5]:

敏捷由敏捷宣言代表, 敏捷宣言定义了12条原则:

  1. Satisfying the customer is the top priority

     我们最重要的目标，是通过持续不断地及早交付有价值的软件使客户满意。

  2. Welcome changing requirements, even late in development

     欣然面对需求变化，即使在开发后期也一样。

  3. Deliver working software frequently

     经常交付可工作的软件，相隔几星期或一两个月，倾向于采取较短的周期。

  4. Development and business must work together

     业务人员和开发人员必须相互合作，项目中的每一天都不例外。

  5. Build projects around motivated people

     激发个体的斗志，以他们为核心搭建项目。提供所需的环境和支援，辅以信任，从而达成目标。

  6. Face-to-face communication is the most efficient and effective method of conveying information

     面对面沟通是传递信息的最佳的也是效率最高的方法。

  7. The primary measure of success is working software

     可工作的软件是进度的首要度量标准。

  8. Agile processes promote sustainable development

     敏捷流程倡导可持续的开发，责任人、开发人员和用户要能够共同维持其步调稳定延续。

  9. Maintain continuous attention to technical excellence and good design

     坚持不懈地追求技术卓越和良好设计，敏捷能力由此增强。

  10. Simplicity is essential

      以简洁为本，它是极力减少不必要工作量的艺术。

  11. The best architectures, requirements, and designs emerge from self-organizing teams

      最好的架构, 需求和设计出自自组织团队

  12. Regularly reflect on work, then tune and adjust behavior

      团队定期地反思如何能提高成效，并依此调整自身的举止表现。



Agile's four [core values][6] are:

敏捷的四个核心价值观是:

**个体和互动** 高于 流程和工具
**工作的软件** 高于 详尽的文档
**客户合作** 高于 合同谈判
**响应变化** 高于 遵循计划

  * **Individuals and interactions** over processes and tools
  * **Working software** over comprehensive documentation
  * **Customer collaboration** over contract negotiation
  * **Responding to change** over following a plan



This contrasts with waterfall's rigid planning style. In agile, the customer is a member of the development team rather than engaging only at the beginning, when setting business requirements, and at the end, when reviewing the final product (as in waterfall). The customer helps the team write the [acceptance criteria][7] and remains engaged throughout the process. In addition, agile requires changes and continuous improvement throughout the organization. The development team works with other teams, including the project management office and the testers. What gets done and when are led by a designated role and agreed to by the team as a whole.

这与瀑布流程死板的规划风格相反。在敏捷流程中，客户是开发团队的一员，而不仅仅是在项目开始时参与项目需求的定义, 在项目结束时验收最终的产品。客户帮忙团队完成准入标准，保持参与整个流程。另外，敏捷需要整个组织的变化和持续的改进。开发团队和其他团队一起合作, 包括项目管理团队和测试团队。做什么和计划什么时候做由指定的角色领导, 并由整个团队同意。

### Agile software development 敏捷软件开发

Agile software development requires adaptive planning, evolutionary development, and delivery. Many software development methodologies, frameworks, and practices fall under the umbrella of being agile, including:

敏捷软件开发需要自适应规划，演进式开发和交付。许多软件开发方法，框架和实践遵从敏捷的理念，包括:

  * Scrum
  * Kanban (visual workflow) Kanban (可视化工作流)
  * XP (eXtreme Programming) XP(极限编程)
  * Lean
  * DevOps
  * Feature-driven development (FDD) 特性驱动开发(FDD)
  * Test-driven development (TDD) 测试驱动开发(TDD)
  * Crystal
  * Dynamic systems development method (DSDM) 动态系统开发方法(DSDM)
  * Adaptive software development (ASD) 自适应软件开发(ASD)



All of these have been used on their own or in combination for developing and deploying software. The most common are [scrum, kanban][8] (or the combination called scrumban), and DevOps.

所有这些已经被单独用于或一起用于开发和部署软件。最常用的是scrum, kanban(或scrumban)和DevOps.

[Scrum][9] is a framework under which a team, generally consisting of a scrum master, product owner, and developers, operates cross-functionally and in a self-directed manner to increase the speed of software delivery and to bring greater business value to the customer. The focus is on faster iterations with smaller [increments][10].

Scrum是一个框架, 采用该框架的团队通常由一个scrum教练, 产品经理和开发人员组成, 该功能团队采用自主的方式来工作, 并能加快软件交付速度并给客户带来巨大的商业价值。其关注点是较小增量的快速迭代。

[Kanban][11] is an agile framework, sometimes called a workflow management system, that helps teams visualize their work and maximize efficiency (thus being agile). Kanban is usually represented by a digital or physical board. A team's work moves across the board, for example, from not started, to in progress, testing, and finished, as it progresses. Kanban allows each team member to see the state of all work at any time.

Kanban是一个敏捷框架，有时也叫工作流管理系统，它能帮助团队可视化他们的工作从而最大化效率。Kanban通常由数字或物理展示板来呈现。团队的工作移到展示板上，例如未启动，进行中, 测试中, 已完成。Kanban使得每个团队成员可以随时看到所有工作的状态。

### DevOps values DevOps价值观

DevOps is a culture, a state of mind, a way that software development or infrastructure is, and a way that software and applications are built and deployed. There is no wall between development and operations; they work simultaneously and without silos.

DevOps是一种文化, 思维状态, 一种软件开发的方式。

DevOps is based on two other practice areas: lean and agile. DevOps is not a title or role within a company; it's really a commitment that an organization or team makes to continuous delivery, deployment, and integration. According to [Gene Kim][12], author of _The Phoenix Project_ and _The Unicorn Project_, there are three "ways" that define the principles of DevOps:

  * The First Way: Principles of flow
  * The Second Way: Principles of feedback
  * The Third Way: Principles of continuous learning



### DevOps software development

DevOps does not happen in a vacuum; it is a flexible practice that, in its truest form, is a shared culture and mindset around software development and IT or infrastructure implementation.

When you think of automation, cloud, microservices, you think of DevOps. In an [interview][13], _Accelerate: Building and Scaling High Performing Technology Organizations_ authors Nicole Forsgren, Jez Humble, and Gene Kim explained:

>   * Software delivery performance matters, and it has a significant impact on organizational outcomes such as profitability, market share, quality, customer satisfaction, and achieving organizational and mission goals.
>   * High performers achieve levels of throughput, stability, and quality; they're not trading off to achieve these attributes.
>   * You can improve your performance by implementing practices from the lean, agile, and DevOps playbooks.
>   * Implementing these practices and capabilities also has an impact on your organizational culture, which in turn has an impact on both your software delivery performance and organizational performance.
>   * There's still lots of work to do to understand how to improve performance.
>


### DevOps vs. agile

Despite their similarities, DevOps and agile are not the same, and some argue that DevOps is better than agile. To eliminate the confusion, it's important to get down to the nuts and bolts.

#### Similarities

  * Both are software development methodologies; there is no disputing this.
  * Agile has been around for over 20 years, and DevOps came into the picture fairly recently.
  * Both believe in fast software development, and their principles are based on how fast software can be developed without causing harm to the customer or operations.



#### Differences

  * **The difference between the two** is what happens after development.
    * Software development, testing, and deployment happen in both DevOps and agile. However, pure agile tends to stop after these three stages. In contrast, DevOps includes operations, which happen continually. Therefore, monitoring and software development are also continuous.
  * In agile, separate people are responsible for developing, testing, and deploying the software. In DevOps, the DevOps engineering role is are responsible for everything; development is operations, and operations is development.
  * DevOps is more associated with cost-cutting, and agile is more synonymous with lean and reducing waste, and concepts like agile project accounting and minimum viable product (MVP) are relevant.
  * Agile focuses on and embodies empiricism (**adaptation**, **transparency**, and **inspection**) instead of predictive measures.

Agile | DevOps
---|---
Feedback from customer | Feedback from self
Smaller release cycles | Smaller release cycles, immediate feedback
Focus on speed | Focus on speed and automation
Not the best for business | Best for business

### Wrapping up

Agile and DevOps are distinct, although their similarities lead people to think they are one and the same. This does both agile and DevOps a disservice.

In my experience as an agilist, I have found it valuable for organizations and teams to understand—from a high level—what agile and DevOps are and how they aid teams in working faster and more efficiently, delivering quality faster, and improving customer satisfaction.

Agile and DevOps are not adversarial in any way (or at least the intent is not there). They are more allies than enemies in the agile revolution. Agile and DevOps can operate exclusively and inclusively, which allows both to exist in the same space.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/devops-vs-agile

作者：[Taz Brown][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/heronthecli
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/collab-team-pair-programming-code-keyboard.png?itok=kBeRTFL1 "Pair programming"
[2]: http://www.agilenutshell.com/agile_vs_waterfall
[3]: https://en.wikipedia.org/wiki/Project_management_triangle
[4]: https://www.pmi.org/learning/library/triple-constraint-erroneous-useless-value-8024
[5]: https://agilemanifesto.org/principles.html
[6]: https://agilemanifesto.org/
[7]: https://www.productplan.com/glossary/acceptance-criteria/
[8]: https://opensource.com/article/19/8/scrum-vs-kanban
[9]: https://www.scrum.org/
[10]: https://www.scrum.org/resources/what-is-an-increment
[11]: https://www.atlassian.com/agile/kanban
[12]: https://itrevolution.com/the-unicorn-project/
[13]: https://www.infoq.com/articles/book-review-accelerate/
