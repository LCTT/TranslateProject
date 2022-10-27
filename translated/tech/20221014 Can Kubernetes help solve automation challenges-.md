[#]: subject: "Can Kubernetes help solve automation challenges?"
[#]: via: "https://opensource.com/article/22/10/kubernetes-solve-automation-challenges"
[#]: author: "Rom Adams https://opensource.com/users/romdalf"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Kubernetes 能否帮助解决自动化挑战？
======
组织层面的自动化一直是一个难以实现的目标，但 Kubernetes 或许能够改变这一切。

当我在 2002 年采用 Gentoo Linux 作为我的主要操作系统时，我开始了我的自动化之旅。二十年后，自动化还没有完成。当我与客户和合作伙伴会面时，他们分享了团队内部的自动化胜利，但他们也描述了在组织层面实现类似成功所面临的挑战。

大多数 IT 组织都能够端到端地配置虚拟机，从而将过去 4 周的交付周期缩短到仅 5 分钟。这种级别的自动化本身就是一个复杂的工作流程，需要网络（IP 地址管理、DNS、代理、网络区域等）、身份访问管理、[hypervisor][2]、存储、备份、更新操作系统、应用最新的配置文件、监控、安全和强化以及合规性基准测试。哇！

满足高速、可扩展和按需自动化的业务需求并不容易。例如，考虑使用经典的网上商店或在线政府服务来提交纳税申报表。工作负载有明确的峰值需要吸收。

处理此类负载的一种常见方法是拥有一个超大的服务器集群，以供 IT 专业人员的特定团队使用，监控客户或公民的季节性涌入。每个人都希望及时部署整个栈。他们希望基础架构在混合云场景的上下文中运行工作负载，使用“构建-消耗-垃圾”模型来优化成本，同时从无限弹性中受益。

换句话说，每个人都想要乌托邦式的“云体验”。

### 云真的能交付吗？

一切都没有丢失，这主要归功于 [Kubernetes][3] 的设计方式。 Kubernetes 的指数级采用推动了创新，取代了管理平台和应用的标准传统做法。 Kubernetes 需要使用 Everything-as-Code (EaC) 来定义所有资源的期望状态，从简单的计算节点到 TLS 证书。 Kubernetes 强制使用三种主要的设计结构：

* 一个标准接口，以减少内部和外部组件之间的整合问题
* API 优先及仅 API 的方法来标准化其所有组件的 CRUD（创建、读取、更新、删除）操作
* 使用 [YAML][4] 作为通用语言，以简单易读的方式定义这些组件的所有所需状态

这三个关键组成部分基本上是选择自动化平台的相同要求，至少如果你想让跨职能团队轻松采用。这也模糊了团队之间的职责分工，有助于提高跨孤岛的协作，这是一件好事！

事实上，采用 Kubernetes 的客户和合作伙伴正在加速进入超自动化状态。 Kubernetes 有机地推动团队采用多种 [DevOps 基础和实践][5]，如： EaC、[使用 Git 进行版本控制][6]、同行评审、[文档即代码][7]并鼓励跨职能协作。这些实践有助于提高团队的自动化技能，并帮助团队在处理应用生命周期和基础架构的 GitOps 和 CI/CD 管道方面获得良好的开端。

### 让自动化成为现实

你没看错！网络商店或政府报告等复杂系统的整个栈可以用清晰、可理解、通用的术语定义，可以在任何本地或云提供商上执行。可以定义具有自定义指标的自动伸缩器以触发所需栈的即时部署，以解决季节性高峰期间客户或市民的涌入问题。当指标恢复正常，且云计算资源不再有存在的理由时，你将它们回收并恢复常规运营，一组核心资产在本地接管业务，直到下一次激增。

### 鸡和蛋的悖论

考虑到 Kubernetes 和云原生模式，自动化是必须的。但它提出了一个重要的问题：一个组织可以在解决自动化战略之前采用 Kubernetes 吗？

似乎从 Kubernetes 开始可以激发更好的自动化，但这并不是一个定局。工具不是对技能、实践和文化问题的解决方案。但是，设计良好的平台可以成为 IT 组织内学习、变革和跨职能协作的催化剂。

### 开始使用 Kubernetes

即使你觉得自己错过了自动化列车，也不要害怕从简单、不复杂的栈上开始使用 Kubernetes。当你[掌握了初始步骤][8]，就可以拥抱这个出色的编排器的简单性，并根据更复杂的需求进行迭代。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/10/kubernetes-solve-automation-challenges

作者：[Rom Adams][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/romdalf
[b]: https://github.com/lkxed
[2]: https://www.redhat.com/en/topics/virtualization/what-is-a-hypervisor?intcmp=7013a000002qLH8AAM
[3]: https://www.redhat.com/en/topics/containers/what-is-kubernetes?intcmp=7013a000002qLH8AAM
[4]: https://opensource.com/article/21/9/yaml-cheat-sheet
[5]: https://opensource.com/resources/devops
[6]: https://opensource.com/life/16/7/stumbling-git
[7]: https://opensource.com/article/21/3/devops-documentation
[8]: https://opensource.com/article/17/11/getting-started-kubernetes
