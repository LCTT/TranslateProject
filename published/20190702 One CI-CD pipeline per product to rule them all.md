[#]: collector: (lujun9972)
[#]: translator: (chunibyo-wly)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12392-1.html)
[#]: subject: (One CI/CD pipeline per product to rule them all)
[#]: via: (https://opensource.com/article/19/7/cicd-pipeline-rule-them-all)
[#]: author: (Willy-Peter Schaub https://opensource.com/users/wpschaub/users/bclaster/users/matt-micene/users/barkerd427)

使用一条 CI/CD 流水线管理所有的产品
======

> 统一的持续集成与持续交付的流水线的构想是一种梦想吗？

![](https://img.linux.net.cn/data/attachment/album/202007/07/224752iib7xgh7icr8478f.jpg)

当我加入 WorkSafeBC 负责云端运维和工程流程优化的云端运维团队时，我和大家分享了我的梦想，那就是一个工具化的流水线，每一个产品都可以持续集成和持续交付。

根据 Lukas Klose 的说法，<ruby>[流程][2]<rt>flow</rt></ruby>（在软件工程的语境内）是“软件系统以稳定和可预测的速度创造价值的状态”。我认为这是最大的挑战和机遇之一，特别是在复杂的新兴解决方案领域。我力求通过一种持续、高效和优质的解决方案，提供一种持续交付模式，并且能够构建正确的事物让我们的用户感到满意。想办法把我们的系统分解成更小的碎片，这些碎片本身是有价值的，使团队能够渐进式地交付价值。这需要业务和工程部门改变思维方式。

### 持续集成和持续交付的（CI/CD）流水线

CI/CD 流水线是一种 DevOps 实践，用于更频繁、一致、可靠的地交付代码变更。它可以帮助敏捷开发团队提高**部署频率**，减少**变更准备时间**、**变更失败率**和关键绩效指标（KPI）的**平均恢复时间**，从而提高质量并且实现更快的交付。唯一的先决条件就是坚实的开发流程、对质量的心态和对需求从构想到废弃的责任心，以及一个全面的流水线（如下图所示）。

![Prerequisites for a solid development process][3]

它简化了工程流程和产品，以稳定基础架构环境；优化工作流程；并创建一致的、可重复的、自动化的任务。正如 Dave Snowden 的 [Cynefin Sensemaking][4] 模型所说的那样，这样就允许我们将复杂不可解决的任务变成了复杂可解决的任务，降低了维护成本，提高了质量和可靠性。

精简流程的一部分是将 <ruby>[浪费实践类型][5]<rt>wasteful practice types</rt></ruby> Muri（过载）、Mura（变异）和 Muda（浪费）的浪费降低最低。

  * **Muri（过载）**：避免过度工程化，避免与商业价值不相关的功能以及过多的文档。
  * **Mura（变异）**：改善审批和验证流程（比如，安全签批）；推动 <ruby>[左移提前][6]<rt>shift-left</rt></ruby> 策略以推行单元测试、安全漏洞扫描与代码质量检查；并改进风险评定。
  * **Muda（浪费）**：避免技术债、错误或前期的详细文档等浪费。

看起来 80％ 的重点都集中在提供一种可以集成和协作的工程产品上，这些系统可以采用一个创意和计划、开发、测试和监控你的解决方案。然而，一个成功的转型和工程系统是由 5％ 的产品、15％ 的过程和 80％ 的开发人员组成的。

我们可以使用的产品有很多。比如，Azure DevOps 为持续集成（CI）、持续交付（CD）和可扩展性提供了丰富支持，并与 Stryker、SonarQube、WhiteSource、Jenkins 和 Octopus 等开源集成和商用成品（COTS）软件即服务（SaaS）进行集成。对于工程师来说，关注产品总是一种诱惑，但请记住，它们只是我们旅程的 5%。

![5% about products, 15% about process, 80% about people][7]

最大的挑战是打破数十年的规则、规定和已经步入舒适区的流程：“*我们一直都是这样做的；为什么需要改变呢？*”

开发和运维人员之间的摩擦导致了各种支离破碎的、重复的、不间断的集成和交付流水线。开发人员希望能访问所有东西，以便持续迭代，让用户使用起来和持续地快速发布。运维人员希望将所有东西锁起来，保护业务、用户和品质。这些矛盾在不经意间导致了很难做到一种自动化的流程，进而导致发布周期晚于预期。

让我们使用最近的一次白板讨论中的片段来探索流水线。

想要支持流水线的变化是一项困难并且花费巨大的工作；版本和可追溯性的不一致使得这个问题变得更加复杂，因此不断精简开发流程和流水线是一项挑战。

![Improving quality and visibility of pipelines][8]

我主张一些原则使得每个产品都能使用通用流水线：

  * 使一切可自动化的东西都自动化
  * 一次构建
  * 保持持续集成和持续交付
  * 保持持续精简和改进
  * 保持一个构建的定义
  * 保持一个发布流水线的定义
  * 尽早、频繁地扫描漏洞，并且*尽快失败*
  * 尽早、频繁地进行测试，并且*尽快失败*
  * 保持已发布版本的可追踪和监控

但是，如果我要打破这些，最重要的原则就是*保持简单*。如果你不能说明流水线化的原因（是什么、为什么）和过程（如何），你或许是不了解自己的软件过程的。我们大多数人想要的不是最好的、超现代的和具有革命意义的流水线 —— 我们仅仅是需要一个功能强大的、有价值的和能促进工程的流水线。首先需要解决的是那 80% —— 文化、人员和他们的心态。请你的 CI/CD 骑士们穿上闪亮的盔甲，在他们的盾牌上贴上 TLA（<ruby>两个/三个字母的缩写<rt>two/three-lettered acronym</rt></ruby>）符号，加入到实践和经验工程的力量中来。

### 统一流水线

让我们逐步完成我们的白板会议实践。

![CI build/CD release pipeline][9]

每个应用使用一套构建定义来定义一个 CI/CD 流水线，用来触发*拉取请求的预合并验证*与*持续集成*的构建。生成一个带有调试信息的*发布*的构建，并且将其上传到 [符号服务器][10]。这使开发人员可以在本地和远程生产环境进行调试，而在不用考虑需要加载哪个构建和符号，符号服务器为我们施展了这样的魔法。

![Breaking down the CI build pipeline][11]

在构建过程中进行尽可能多的验证（*左移提前*），这允许开发新特性的团队可以尽快失败，不断的提高整体的产品质量，并在拉取请求中为代码审核人员提供宝贵证据。你喜欢有大量提交的拉取请求吗？还是一个带有少数提交和提供了漏洞检查、测试覆盖率、代码质量检查和 [Stryker][12] 突变残余等支持的拉取请求？就我个人而言，我投后者的票。

![Breaking down the CD release pipeline][13]

不要使用构建转换来生成多个特定环境的构建。通过一个构建实现*发布时转换*、*标记化*和 XML/JSON 的*值替换*。换句话说，*右移滞后*具体环境的配置。

![Shift-right the environment-specific configuration][14]

安全存储发布配置数据，并且根据数据的*信任度*和*敏感度*，让开发和运维都能使用。使用开源的密钥管理工具、Azure 密钥保险库、AWS 密钥管理服务或者其他产品，记住你的工具箱中有很多方便的工具。

![Dev-QA-production pipeline][15]

使用*用户组*而不是*用户*，将审批人管理从跨多个流水线的多个阶段移动到简单的组成员。

![Move approver management to simple group membership][16]

创建一条流水线并且对赋予特定的交付阶段的权限，而不是重复流水线让团队进入他们感兴趣的地方。

![Pipeline with access to specific delivery stages][17]

最后，但并非最不重要的是，拥抱拉取请求，以帮助提高对代码仓库的洞察力和透明度，增进整体质量、协作，并将预验证构建发布到选定的环境，比如，开发环境。

这是整个白板更正式的视图。

![The full pipeline][18]

所以，你对 CI/CD 流水线有什么想法和经验？我的通过*一条流水线来管理它们*的这个梦想是空想吗？

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/cicd-pipeline-rule-them-all

作者：[Willy-Peter Schaub][a]
选题：[lujun9972][b]
译者：[chunibyo-wly](https://github.com/chunibyo-wly)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/wpschaub/users/bclaster/users/matt-micene/users/barkerd427
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LAW-Internet_construction_9401467_520x292_0512_dc.png?itok=RPkPPtDe (An intersection of pipes.)
[2]: https://continuingstudies.sauder.ubc.ca/courses/agile-delivery-methods/ii861
[3]: https://opensource.com/sites/default/files/uploads/devops_pipeline_pipe-2.png (Prerequisites for a solid development process)
[4]: https://en.wikipedia.org/wiki/Cynefin_framework
[5]: https://www.lean.org/lexicon/muda-mura-muri
[6]: https://en.wikipedia.org/wiki/Shift_left_testing
[7]: https://opensource.com/sites/default/files/uploads/devops_pipeline_pipe-3.png (5% about products, 15% about process, 80% about people)
[8]: https://opensource.com/sites/default/files/uploads/devops_pipeline_pipe-4_0.png (Improving quality and visibility of pipelines)
[9]: https://opensource.com/sites/default/files/uploads/devops_pipeline_pipe-5_0.png (CI build/CD release pipeline)
[10]: https://en.wikipedia.org/wiki/Microsoft_Symbol_Server
[11]: https://opensource.com/sites/default/files/uploads/devops_pipeline_pipe-6.png (Breaking down the CI build pipeline)
[12]: https://stryker-mutator.io/
[13]: https://opensource.com/sites/default/files/uploads/devops_pipeline_pipe-7.png (Breaking down the CD release pipeline)
[14]: https://opensource.com/sites/default/files/uploads/devops_pipeline_pipe-8.png (Shift-right the environment-specific configuration)
[15]: https://opensource.com/sites/default/files/uploads/devops_pipeline_pipe-9.png (Dev-QA-production pipeline)
[16]: https://opensource.com/sites/default/files/uploads/devops_pipeline_pipe-10.png (Move approver management to simple group membership)
[17]: https://opensource.com/sites/default/files/uploads/devops_pipeline_pipe-11.png (Pipeline with access to specific delivery stages)
[18]: https://opensource.com/sites/default/files/uploads/devops_pipeline_pipe-12.png (The full pipeline)
