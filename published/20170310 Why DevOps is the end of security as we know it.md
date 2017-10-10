为什么 DevOps 如我们所知道的那样，是安全的终结
==========

![](https://techbeacon.com/sites/default/files/styles/article_hero_image/public/field/image/rugged-devops-end-of-security.jpg?itok=Gp1xxSMK)

安全难以推行。在企业管理者迫使开发团队尽快发布程序的大环境下，很难说服他们花费有限的时间来修补安全漏洞。但是鉴于所有网络攻击中有 84％ 发生在应用层，作为一个组织是无法承担其开发团队不包括安全性带来的后果。

DevOps 的崛起为许多安全负责人带来了困境。Sonatype 的前 CTO [Josh Corman][2] 说：“这是对安全的威胁，但这也是让安全变得更好的机会。” Corman 是一个坚定的[将安全和 DevOps 实践整合起来创建 “坚固的 DevOps”][3]的倡导者。_Business Insights_ 与 Corman 谈论了安全和 DevOps 共同的价值，以及这些共同价值如何帮助组织更少地受到中断和攻击的影响。

### 安全和 DevOps 实践如何互惠互利？

**Josh Corman：** 一个主要的例子是 DevOps 团队对所有可测量的东西进行检测的倾向。安全性一直在寻找更多的情报和遥测。你可以获取许多 DevOps 团队正在测量的信息，并将这些信息输入到你的日志管理或 SIEM （安全信息和事件管理系统）。

一个 OODA 循环（<ruby>观察<rt>observe</rt></ruby>、<ruby>定向<rt>orient</rt></ruby>、<ruby>决定<rt>decide</rt></ruby>、<ruby>行为<rt>act</rt></ruby>）的前提是有足够普遍的眼睛和耳朵，以注意到窃窃私语和回声。DevOps 为你提供无处不在的仪器。

### 他们有分享其他文化观点吗？

**JC：** “严肃对待你的代码”是一个共同的价值观。例如，由 Netflix 编写的软件工具 Chaos Monkey 是 DevOps 团队的分水岭。它是为了测试亚马逊网络服务的弹性和可恢复性而创建的，Chaos Monkey 使得 Netflix 团队更加强大，更容易为中断做好准备。

所以现在有个想法是我们的系统需要测试，因此，James Wickett 和我及其他人决定做一个邪恶的、带有攻击性的 Chaos Monkey，这就是 GAUNTLT 项目的来由。它基本上是一堆安全测试, 可以在 DevOps 周期和 DevOps 工具链中使用。它也有非常适合 DevOps 的API。

### 企业安全和 DevOps 价值在哪里相交？

**JC：** 这两个团队都认为复杂性是一切事情的敌人。例如，[安全人员和 Rugged DevOps 人员][4]实际上可以说：“看，我们在我们的项目中使用了 11 个日志框架 - 也许我们不需要那么多，也许攻击面和复杂性可能会让我们受到伤害或者损害产品的质量或可用性。”

复杂性往往是许多事情的敌人。通常情况下，你不会很难说服 DevOps 团队在架构层面使用更好的建筑材料：使用最新的、最不易受攻击的版本，并使用较少的组件。

### “更好的建筑材料”是什么意思？

**JC：** 我是世界上最大的开源仓库的保管人，所以我能看到他们在使用哪些版本，里面有哪些漏洞，何时他们没有修复漏洞，以及等了多久。例如，某些日志记录框架从不会修复任何错误。其中一些会在 90 天内修复了大部分的安全漏洞。人们越来越多地遭到攻击，因为他们使用了一个毫无安全的框架。

除此之外，即使你不知道日志框架的质量，拥有 11 个不同的框架会变得非常笨重、出现 bug，还有额外的工作和复杂性。你暴露在漏洞中的风险是非常大的。你想把时间花在修复大量的缺陷上，还是在制造下一个大的破坏性的事情上？

[Rugged DevOps 的关键是软件供应链管理][5]，其中包含三个原则：使用更少和更好的供应商、使用这些供应商的最高质量的部分、并跟踪这些部分，以便在发生错误时，你可以有一个及时和敏捷的响应。

### 所以变更管理也很重要。

**JC：** 是的，这是另一个共同的价值。我发现，当一家公司想要执行诸如异常检测或净流量分析等安全测试时，他们需要知道“正常”的样子。让人们失误的许多基本事情与仓库和补丁管理有关。

我在 _Verizon 数据泄露调查报告_中看到，追踪去年被成功利用的漏洞后，其中 97％ 归结为 10 个 CVE（常见漏洞和风险），而这 10 个已经被修复了十多年。所以，我们羞于谈论高级间谍活动。我们没有做基本的补丁工作。现在，我不是说如果你修复这 10 个CVE，那么你就没有被利用，而是这占据了人们实际失误的最大份额。

[DevOps 自动化工具][6]的好处是它们已经成为一个意外的变更管理数据库。其真实反应了谁在哪里什么时候做了变更。这是一个巨大的胜利，因为我们经常对安全性有最大影响的因素无法控制。你承受了 CIO 和 CTO 做出的选择的后果。随着 IT 通过自动化变得更加严格和可重复，你可以减少人为错误的机会，并且哪里发生了变化更加可追溯。

### 你认为什么是最重要的共同价值？

**JC：** DevOps 涉及到过程和工具链，但我认为定义这种属性的是文化，特别是同感。 DevOps 有用是因为开发人员和运维团队能够更好地了解彼此，并做出更明智的决策。不是在解决孤岛中的问题，而是为了活动流程和目标解决。如果你向 DevOps 的团队展示安全如何能使他们变得更好，那么作为回馈他们往往会问：“那么，我们是否有任何选择让你的生活更轻松？”因为他们通常不知道他们做的 X、Y 或 Z 的选择使它无法包含安全性。

对于安全团队，驱动价值的方法之一是在寻求帮助之前变得更有所帮助，在我们告诉 DevOps 团队要做什么之前提供定性和定量的价值。你必须获得 DevOps 团队的信任，并获得发挥的权利，然后才能得到回报。它通常比你想象的快很多。

--------------------------------------------------------------------------------

via: https://techbeacon.com/why-devops-end-security-we-know-it

作者：[Mike Barton][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://twitter.com/intent/follow?original_referer=https%3A%2F%2Ftechbeacon.com%2Fwhy-devops-end-security-we-know-it%3Fimm_mid%3D0ee8c5%26cmp%3Dem-webops-na-na-newsltr_20170310&ref_src=twsrc%5Etfw&region=follow_link&screen_name=mikebarton&tw_p=followbutton
[1]:https://techbeacon.com/resources/application-security-devops-true-state?utm_source=tb&utm_medium=article&utm_campaign=inline-cta
[2]:https://twitter.com/joshcorman
[3]:https://techbeacon.com/want-rugged-devops-team-your-release-security-engineers
[4]:https://techbeacon.com/rugged-devops-rsa-6-takeaways-security-ops-pros
[5]:https://techbeacon.com/josh-corman-security-devops-how-shared-team-values-can-reduce-threats
[6]:https://techbeacon.com/devops-automation-best-practices-how-much-too-much
