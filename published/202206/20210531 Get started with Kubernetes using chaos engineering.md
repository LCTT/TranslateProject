[#]: subject: (Get started with Kubernetes using chaos engineering)
[#]: via: (https://opensource.com/article/21/5/kubernetes-chaos)
[#]: author: (Jessica Cherry https://opensource.com/users/cherrybomb)
[#]: collector: (lujun9972)
[#]: translator: (Donkey-Hao)
[#]: reviewer: (turbokernel, wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14743-1.html)

在 Kubernetes 中使用混沌工程
======

> 在这篇文章中学习混沌工程的基础知识。

![](https://img.linux.net.cn/data/attachment/album/202206/22/110901xbb88ccb8lfcgcrl.jpg)

混沌工程是由科学、规划以及实验组成的。它是一门在系统上进行实验的学科，用来建立系统在生产中承受混乱条件能力的信心。

首先，我会在文章导论部分解释混沌系统如何工作。

### 如何开始学习混沌系统呢？

以我的经验，开始学习混沌系统的最好方式是触发一个此前生产中出现的事故来进行实验。使用过去的数据，制定一个计划，以相同的方式破坏你的系统，然后建立修复策略，并确认结果满足你预期。如果计划失败，你就有了一种新的实验方式，并朝着快速处理问题的新方式前进。

最重要的是，你可以随时记录所有内容，这意味着，随着时间的推移，整个系统将被完整记录下来，任何人都可以值守而无需太多加码，每个人都可以在周末好好休息。

### 你要在混沌工程中做什么？

混沌系统实验运行背后有一些科学依据。我记录了其中一些步骤：

1. **定义一个稳定状态：** 使用监控工具来搜集当系统没有问题或事故时，看起来功能正常的数据。
2. **提出假设或使用先前的事故：** 现在你已经定义了一个稳定状态，请提出一个关于在事故或中断期间会发生（或发生过）的情况的假设。用这个假设来得出一系列将会发生的事故，以及如何解决问题的理论。然后你可以制定一个故意引发该问题的计划。
3. **引发问题：** 用这个计划来破坏系统，并开始在真实环境中测试。收集破坏时的指标状态，按计划修复，并追踪提出解决方案所需时长。确保你把所有的东西都记录下来，以备将来发生故障时使用。
4. **试图推翻你的假设：** 实验中最精彩的部分是尝试推翻你的思考或计划。你要创建一个不同的状态，看看你能走多远，并在系统中生成一个不同的稳定状态。

确保在你在另一个系统中生成的破坏因素前，建立一个处于稳定状态的控制系统。这将使你更容易在实验前、期间和之后发现各种稳定状态的差异。

### 混沌工程需要什么？

这有一些初学混沌工程很好的工具：

* 良好的文档编制方法
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

现在你已经掌握了基础，是时候去安全的摧毁你的系统了。我计划每年制造四次混乱，然后努力实现每月一次的破坏。

混沌工程是一种很好的实践，也是推进你的内部文档保持最新的好方法。此外，随着时间的推移，新升级或应用程序部署将更加顺畅，你的日常生活管理将通过 Kubernetes 变得更加轻松。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/kubernetes-chaos

作者：[Jessica Cherry][a]
选题：[lujun9972][b]
译者：[Donkey](https://github.com/Donkey-Hao)
校对：[turbokernel](https://github.com/turbokernel), [wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cherrybomb
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/brett-jordan-chaos-unsplash.jpg?itok=sApp5dVd (Scrabble letters spell out chaos for chaos engineering)
