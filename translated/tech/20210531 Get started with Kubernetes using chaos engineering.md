[#]: subject: (Get started with Kubernetes using chaos engineering)
[#]: via: (https://opensource.com/article/21/5/kubernetes-chaos)
[#]: author: (Jessica Cherry https://opensource.com/users/cherrybomb)
[#]: collector: (lujun9972)
[#]: translator: (Donkey)
[#]: reviewer: (turbokernel)
[#]: publisher: ( )
[#]: url: ( )

在混沌工程中开始使用 Kubernetes
======
在庆祝 Kubernetes 11 岁生日的系列文章中的第一篇文章中学习混沌工程的基础知识。

![Scrabble letters spell out chaos for chaos engineering][1]

Kubernetes 快 11 岁了，我打算通过给你一些会引起混沌的开源工具来庆祝它的生日。混沌工程是科学、规划以及实验的学科。它在系统上进行训练，来建立系统在生产中承受混乱条件能力的信心的学科。

在我给你礼物前，我会在文章导论部分解释混沌系统如何工作。

### 如何开始学习混沌系统呢？

以我的经验，开始学习混沌系统的最好方式是触发一个此前生产中出现的事件来进行实验。使用过去的数据，制定以相同的方式破坏你的系统的计划，然后建立修复策略并确认结果确实是你想要的。如果计划失败，你就有了一种新的实验方式，并朝着快速处理问题的新方式前进。

最重要的是，你可以随时记录所有内容，这意味着，随着时间的推移，整个系统将被完整记录下以便任何人都可以随时待命而无需太多升级，并且每个人都可以在周末好好休息。

### 你在混沌工程中做什么？

混沌系统实验运行背后有一些科学依据。我已经记录了步骤：

1. **定义一个稳定状态：** 使用监控工具来搜集当系统没有问题或事件时，看起来功能正常的数据。
2. **提出假设或使用先前的事件：** 现在你已经定义了一个稳定状态，请提出一个关于在事件或中断期间会发生（或已经发生）的情况的假设。用这个假设来得出一系列将会发生的事件以及如何解决问题的理论。然后你可以指定一个故意引起该问题的计划。
3. **介绍问题：** 用既定计划来破坏你的系统并开始在真实环境中测试。收集损坏的指标状态，按计划修复，并跟踪在你达到解决方案之前需要多长时间。确保你为之后中断记录了任何事情。
4. **试图推翻你的假设：** 实验中最精彩的部分是尝试推翻你的思考或计划。你想创建一个不同的状态，看看你能走多远，并在系统中生成一个不同的稳定状态。

当你在另一个系统中生成破坏的变量前，确保建立一个处于稳定状态的控制系统。这将使你更容易在实验前、期间和之后发现各种稳态的差异。

### 混沌工程需要什么？

这有一些初学混沌工程很好的工具：

* 良好的记录习惯
* 一个捕捉你系统是否处于稳定状态的监控系统
  * Grafana
  * Prometheus
* 混沌工程工具：
  * Chaos mesh
  * Litmus
  * 之后的文章我会介绍更多
* 一个假设
* 一个计划

### 去搞破坏吧

现在你已经掌握了基础，是时候去安全的摧毁你的系统了。我计划每年造成四次混乱，并努力实现每月的破坏。

混沌工程是一种很好的实践，也是使你的内部文档保持最新的好方法。此外，随着时间的推移，新升级或应用程序部署将更加顺畅，你的日常生活将通过 Kubernetes 管理变得更加轻松。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/kubernetes-chaos

作者：[Jessica Cherry][a]
选题：[lujun9972][b]
译者：[Donkey](https://github.com/Donkey-Hao)
校对：[turbokernel](https://github.com/turbokernel)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cherrybomb
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/brett-jordan-chaos-unsplash.jpg?itok=sApp5dVd (Scrabble letters spell out chaos for chaos engineering)
