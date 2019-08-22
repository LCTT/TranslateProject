[#]: collector: "lujun9972"
[#]: translator: "zgj1024"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-10834-1.html"
[#]: subject: "Why DevOps is the most important tech strategy today"
[#]: via: "https://opensource.com/article/19/3/devops-most-important-tech-strategy"
[#]: author: "Kelly Albrecht https://opensource.com/users/ksalbrecht"

为何 DevOps 是如今最重要的技术策略
======

> 消除一些关于 DevOps 的疑惑。

![CICD with gears][1]

很多人初学 [DevOps][2] 时，看到它其中一个结果就问这个是如何得来的。其实理解这部分 Devops 的怎样实现并不重要，重要的是——理解（使用） DevOps 策略的原因——这是做一个行业的领导者还是追随者的差别。

你可能会听过些 Devops 的难以置信的成果，例如生产环境非常有弹性，就算是有个“<ruby>[癫狂的猴子][3]<rt>Chaos Monkey</rt></ruby>）跳来跳去将不知道哪个插头随便拔下，每天仍可以处理数千个发布。这是令人印象深刻的，但就其本身而言，这是一个 DevOps 的证据不足的案例，其本质上会被一个[反例][4]困扰：DevOps 环境有弹性是因为严重的故障还没有被观测到。

有很多关于 DevOps 的疑惑，并且许多人还在尝试弄清楚它的意义。下面是来自我 LinkedIn Feed 中的某个人的一个案例：

> 最近我参加一些 #DevOps 的交流会，那里一些演讲人好像在倡导 #敏捷开发是 DevOps 的子集。不知为何，我的理解恰恰相反。
>
> 能听一下你们的想法吗？你认为敏捷开发和 DevOps 之间是什么关系呢？
>
>   1. DevOps 是敏捷开发的子集
>   2. 敏捷开发是 DevOps 的子集
>   3. DevOps 是敏捷开发的扩展，从敏捷开发结束的地方开始
>   4. DevOps 是敏捷开发的新版本

科技行业的专业人士在那篇 LinkedIn 的帖子上表达了各种各样的答案，你会怎样回复呢？

### DevOps 源于精益和敏捷

如果我们从亨利福特的战略和丰田生产系统对福特车型的改进（的历史）开始， DevOps 就更有意义了。精益制造就诞生在那段历史中，人们对精益制作进行了良好的研究。James P. Womack 和 Daniel T. Jones 将精益思维（[Lean Thinking][5]）提炼为五个原则：

  1. 指明客户所需的价值
  2. 确定提供该价值的每个产品的价值流，并对当前提供该价值所需的所有浪费步骤提起挑战
  3. 使产品通过剩余的增值步骤持续流动
  4. 在可以连续流动的所有步骤之间引入拉力
  5. 管理要尽善尽美，以便为客户服务所需的步骤数量和时间以及信息量持续下降

精益致力于持续消除浪费并增加客户的价值流动。这很容易识别并明白精益的核心原则：单一流。我们可以做一些游戏去了解为何同一时间移动单个比批量移动要快得多。其中的两个游戏是[硬币游戏][6]和[飞机游戏][7]。在硬币游戏中，如果一批 20 个硬币到顾客手中要用 2 分钟，顾客等 2 分钟后能拿到整批硬币。如果一次只移动一个硬币，顾客会在 5 秒内得到第一枚硬币，并会持续获得硬币，直到在大约 25 秒后第 20 个硬币到达。（LCTT 译注：有相关的视频的）

这是巨大的不同，但是不是生活中的所有事都像硬币游戏那样简单并可预测的。这就是敏捷的出现的原因。我们当然看到了高效绩敏捷团队的精益原则，但这些团队需要的不仅仅是精益去做他们要做的事。

为了能够处理典型的软件开发任务的不可预见性和变化，敏捷开发的方法论会将重点放在意识、审议、决策和行动上，以便在不断变化的现实中调整。例如，敏捷框架（如 srcum）通过每日站立会议和冲刺评审会议等仪式提高意识。如果 scrum 团队意识到新的事实，框架允许并鼓励他们在必要时及时调整路线。

要使团队做出这些类型的决策，他们需要高度信任的环境中的自我组织能力。以这种方式工作的高效绩敏捷团队在不断调整的同时实现快速的价值流，消除错误方向上的浪费。

### 最佳批量大小

要了解 DevOps 在软件开发中的强大功能，这会帮助我们理解批处理大小的经济学。请考虑以下来自Donald Reinertsen 的[产品开发流程原则][8]的U曲线优化示例：

![U-curve optimization illustration of optimal batch size][9]

这可以类比杂货店购物来解释。假设你需要买一些鸡蛋，而你住的地方离商店只有 30 分钟的路程。买一个鸡蛋（图中最左边）意味着每次要花 30 分钟的路程，这就是你的*交易成本*。*持有成本*可能是鸡蛋变质和在你的冰箱中持续地占用空间。*总成本*是*交易成本*加上你的*持有成本*。这个 U 型曲线解释了为什么对大部分人来说，一次买一打鸡蛋是他们的*最佳批量大小*。如果你就住在商店的旁边，步行到那里不会花费你任何的时候，你可能每次只会买一小盒鸡蛋，以此来节省冰箱的空间并享受新鲜的鸡蛋。

这 U 型优化曲线可以说明为什么在成功的敏捷转换中生产力会显著提高。考虑敏捷转换对组织决策的影响。在传统的分级组织中，决策权是集中的。这会导致较少的人做更大的决策。敏捷方法论会有效地降低组织决策中的交易成本，方法是将决策分散到最被人熟知的认识和信息的位置：跨越高度信任，自组织的敏捷团队。

下面的动画演示了降低事务成本后，最佳批量大小是如何向左移动。在更频繁地做出更快的决策方面，你不能低估组织的价值。

![U-curve optimization illustration][10]

### DevOps 适合哪些地方

自动化是 DevOps 最知名的事情之一。前面的插图非常详细地展示了自动化的价值。通过自动化，我们将交易成本降低到接近于零，实质上是可以免费进行测试和部署。这使我们可以利用越来越小的批量工作。较小批量的工作更容易理解、提交、测试、审查和知道何时能完成。这些较小的批量大小也包含较少的差异和风险，使其更易于部署，如果出现问题，可以进行故障排除和恢复。通过自动化与扎实的敏捷实践相结合，我们可以使我们的功能开发非常接近单件流程，从而快速、持续地为客户提供价值。

更传统地说，DevOps 被理解为一种打破开发团队和运营团队之间混乱局面的方法。在这个模型中，开发团队开发新的功能，而运营团队则保持系统的稳定和平稳运行。摩擦的发生是因为开发过程中的新功能将更改引入到系统中，从而增加了停机的风险，运营团队并不认为要对此负责，但无论如何都必须处理这一问题。DevOps 不仅仅尝试让人们一起工作，更重要的是尝试在复杂的环境中安全地进行更频繁的更改。

我们可以看看 [Ron Westrum][11] 在有关复杂组织中实现安全性的研究。在研究为什么有些组织比其他组织更安全时，他发现组织的文化可以预测其安全性。他确定了三种文化：病态的、官僚主义的和生产式的。他发现病态的可以预测其安全性较低，而生产式文化被预测为更安全（例如，在他的主要研究领域中，飞机坠毁或意外住院死亡的数量要少得多）。

![Three types of culture identified by Ron Westrum][12]

高效的 DevOps 团队通过精益和敏捷的实践实现了一种生成性文化，这表明速度和安全性是互补的，或者说是同一个问题的两个方面。通过将决策和功能的最佳批量大小减少到非常小，DevOps 实现了更快的信息流和价值，同时消除了浪费并降低了风险。

与 Westrum 的研究一致，在提高安全性和可靠性的同时，变化也很容易发生。当一个敏捷的 DevOps 团队被信任做出自己的决定时，我们将获得 DevOps 目前最为人所知的工具和技术：自动化和持续交付。通过这种自动化，交易成本比以往任何时候都进一步降低，并且实现了近乎单一的精益流程，每天创造数千个决策和发布的潜力，正如我们在高效绩的 DevOps 组织中看到的那样

### 流动、反馈、学习

DevOps 并不止于此。我们主要讨论了 DevOps 实现了革命性的流程，但通过类似的努力可以进一步放大精益和敏捷实践，从而实现更快的反馈循环和更快的学习。在[DevOps手册][13] 中，作者除了详细解释快速流程外， DevOps 如何在整个价值流中实现遥测，从而获得快速且持续的反馈。此外，利用[精益求精的突破][14]和 scrum 的[回顾][15]，高效的 DevOps 团队将不断推动学习和持续改进深入到他们的组织的基础，实现软件产品开发行业的精益制造革命。

### 从 DevOps 评估开始

利用 DevOps 的第一步是，经过大量研究或在 DevOps 顾问和教练的帮助下，对高效绩 DevOps 团队中始终存在的一系列维度进行评估。评估应确定需要改进的薄弱或不存在的团队规范。对评估的结果进行评估，以找到具有高成功机会的快速获胜焦点领域，从而产生高影响力的改进。快速获胜非常重要，能让团队获取解决更具挑战性领域所需的动力。团队应该产生可以快速尝试的想法，并开始关注 DevOps 转型。

一段时间后，团队应重新评估相同的维度，以衡量改进并确立新的高影响力重点领域，并再次采纳团队的新想法。一位好的教练将根据需要进行咨询、培训、指导和支持，直到团队拥有自己的持续改进方案，并通过不断地重新评估、试验和学习，在所有维度上实现近乎一致。

在本文的[第二部分][16]中，我们将查看 Drupal 社区中 DevOps 调查的结果，并了解最有可能找到快速获胜的位置。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/devops-most-important-tech-strategy

作者：[Kelly Albrecht][a]
选题：[lujun9972][b]
译者：[zgj1024](https://github.com/zgj1024)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksalbrecht/users/brentaaronreed/users/wpschaub/users/wpschaub/users/ksalbrecht
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cicd_continuous_delivery_deployment_gears.png?itok=kVlhiEkc "CICD with gears"
[2]: https://opensource.com/resources/devops
[3]: https://github.com/Netflix/chaosmonkey
[4]: https://en.wikipedia.org/wiki/Burden_of_proof_(philosophy)#Proving_a_negative
[5]: https://www.amazon.com/dp/B0048WQDIO/ref=dp-kindle-redirect?_encoding=UTF8&btkr=1
[6]: https://youtu.be/5t6GhcvKB8o?t=54
[7]: https://www.shmula.com/paper-airplane-game-pull-systems-push-systems/8280/
[8]: https://www.amazon.com/dp/B00K7OWG7O/ref=dp-kindle-redirect?_encoding=UTF8&btkr=1
[9]: https://opensource.com/sites/default/files/uploads/batch_size_optimal_650.gif "U-curve optimization illustration of optimal batch size"
[10]: https://opensource.com/sites/default/files/uploads/batch_size_650.gif "U-curve optimization illustration"
[11]: https://en.wikipedia.org/wiki/Ron_Westrum
[12]: https://opensource.com/sites/default/files/uploads/information_flow.png "Three types of culture identified by Ron Westrum"
[13]: https://www.amazon.com/DevOps-Handbook-World-Class-Reliability-Organizations/dp/1942788002/ref=sr_1_3?keywords=DevOps+handbook&qid=1553197361&s=books&sr=1-3
[14]: https://en.wikipedia.org/wiki/Kaizen
[15]: https://www.scrum.org/resources/what-is-a-sprint-retrospective
[16]: https://opensource.com/article/19/3/where-drupal-community-stands-devops-adoption
[17]: https://events.drupal.org/seattle2019/sessions/devops-why-how-and-what
[18]: https://events.drupal.org/seattle2019/bofs/devops-getting-started
[19]: https://events.drupal.org/seattle2019
