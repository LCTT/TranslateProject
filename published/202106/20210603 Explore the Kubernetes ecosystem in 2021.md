[#]: subject: (Explore the Kubernetes ecosystem in 2021)
[#]: via: (https://opensource.com/article/21/6/kubernetes-ebook)
[#]: author: (Chris Collins https://opensource.com/users/clcollins)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13506-1.html)

探索 Kubernetes 生态系统（2021 版）
======

> 这份可下载的指南充满了有用的教程，让 SRE 和系统管理员使用 Kubernetes 获得便利。

![](https://img.linux.net.cn/data/attachment/album/202106/21/162617ikidrw6q8i6nif2n.jpg)

Kubernetes 是容器编排的事实标准，在基础设施管理和应用开发方面已经迅速发展成为容器环境的主导。作为一个拥有庞大的爱好者和专业人士社区的开源平台，以及作为云原生计算基金会的一部分，Kubernetes 不仅成为一个强大而令人印象深刻的编排系统本身，而且它还促进了一个庞大的相关工具和服务的生态系统，使其更容易使用，并通过更强大和复杂的组件扩展其功能。

在这本新的电子书《[给 SRE 和系统管理员的 Kubernetes 指导][2]》中，[Jess Cherry][3]（Ben Finkel 也有贡献）涵盖了一系列用于管理和整合 Kubernetes 的工具和服务。Cherry 和 Finkel 提供了一些有用的 _入门_ 指南，包括 Kubernetes 和一些工具。他们甚至还分享了面试问题，以帮助读者为在这个快速增长的大规模生态系统中工作做好准备。

### 了解 Kubernetes

如果你刚开始接触 Kubernetes 和容器，Ben Finkel 的 《[Kubernetes 入门][4]》文如其题，也是一篇对你需要了解的相关概念的出色介绍。它也是一本轻量级的快速入门指南，用于设置和使用单节点集群进行测试。没有什么比亲身体验技术并直接进入学习更好的方法了。什么是<ruby>吊舱<rt>Pod</rt></ruby>？ 如何在集群上部署一个应用程序？ Ben 一一为你做了介绍。

与集群交互的主要方式是 [kubectl][5] 命令，这是一种 CLI 工具，它提供了一种与管理集群本身的 API 服务器交互的适合方式。例如，你可以使用 `kubectl get` 来列出上述的吊舱和部署，但正如你对 Kubernetes 这样复杂的东西所期望的那样，它的 CLI 界面有很强的功能和灵活性。Jess Cherry 的《[9 个系统管理员需要知道的 kubectl 命令][6]》速查表是一个很好的介绍，是使用 `kubectl` 的入门好方法。

同样，Cherry 的《[给初学者的 Kubernetes 命令空间][7]》也很好地解释了什么是命名空间以及它们在 Kubernetes 中的使用方式。

### 简化 Kubernetes 的工作

在一个复杂的系统中工作是很困难的，尤其是使用像 `kubectl` 这样强大而极简的 CLI 工具。幸运的是，在围绕 Kubernetes 的生态系统中，有许多工具可用于简化事情，使扩展服务和集群管理更容易。

可用于在 Kubernetes 上部署和维护应用和服务的 `kubectl` 命令主要使用的是 YAML 和 JSON。然而，一旦你开始管理更多应用，用 YAML 的大型仓库这样做会变得既重复又乏味。一个好的解决方案是采用一个模板化的系统来处理你的部署。[Helm][8] 就是这样一个工具，被称为 “Kubernetes 的包管理器”，Helm 提供了一种方便的方式来打包和共享应用。Cherry 写了很多关于 Helm 的有用文章：创建有效的 《[Helm 海图][9]》和有用的《[Helm 命令][10]》。

`kubectl` 也为你提供了很多关于集群本身的信息：上面运行的是什么，以及正在发生的事件。这些信息可以通过 `kubectl` 来查看和交互，但有时有一个更直观的 GUI 来进行交互是有帮助的。[K9s][11] 符合这两个世界的要求。虽然它仍然是一个终端应用，但它提供了视觉反馈和一种与集群交互的方式，而不需要长长的 `kubectl` 命令。Cherry 也写了一份很好的《[k9s 使用入门][12]》的指南。

### 建立在 Kubernetes 的强大和灵活性之上的扩展

幸运的是，尽管 Kubernetes 是复杂而强大的，但它惊人的灵活并且开源。它专注于其核心优势：容器编排，并允许围绕它的爱好者和专业人士的社区扩展其能力，以承担不同类型的工作负载。其中一个例子是 [Knative][13]，在 Kubernetes 之上提供组件，它为无服务器和事件驱动的服务提供工具，并利用 Kubernetes 的编排能力在容器中运行最小化的微服务。事实证明，这样做非常高效，既能提供在容器中开发小型、易于测试和维护的应用的好处，又能提供仅在需要时运行这些应用的成本优势，可以在特定事件中被触发，但在其他时候处于休眠。

在这本电子书中，Cherry 介绍了 Knative 和它的事件系统，以及为什么值得自己研究使用 Knative。

### 有一个完整的世界可以探索

通过 Jess Cherry 和 Ben Finkel 的这本新的[电子书][2]，可以开始了解 Kubernetes 和围绕它的生态系统。除了上述主题外，还有一些关于有用的 Kubernetes 扩展和第三方工具的文章。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/kubernetes-ebook

作者：[Chris Collins][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clcollins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_wheel_gear_devops_kubernetes.png?itok=xm4a74Kv (A ship wheel with someone steering)
[2]: https://opensource.com/downloads/kubernetes-sysadmin
[3]: https://opensource.com/users/cherrybomb
[4]: https://opensource.com/article/17/11/getting-started-kubernetes
[5]: https://kubernetes.io/docs/reference/kubectl/kubectl/
[6]: https://opensource.com/article/20/5/kubectl-cheat-sheet
[7]: https://opensource.com/article/19/12/kubernetes-namespaces
[8]: https://helm.sh/
[9]: https://opensource.com/article/20/5/helm-charts
[10]: https://opensource.com/article/20/2/kubectl-helm-commands
[11]: https://k9scli.io/
[12]: https://opensource.com/article/20/5/kubernetes-administration
[13]: https://cloud.google.com/knative/
