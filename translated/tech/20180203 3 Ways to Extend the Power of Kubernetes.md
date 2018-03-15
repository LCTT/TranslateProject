3种扩展 Kubernetes 能力的方式
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/chen-goldberg-kubecon.png?itok=WR_4i31u)

Google 的工程总监 Chen Goldberg 在奥斯汀最近的[KubeCon 和 CloudNativeCon][1]上说，Kubernetes 的扩展能力是它的秘密武器。

在建立帮助工程师提高工作效率的工具的竞赛中，Goldberg 谈到他曾经领导过一个开发这样一个平台的团队。尽管平台最初有用，但它无法扩展，并且修改也很困难。

幸运的是，Goldberg 说，Kubernetes 没有这些问题。首先，Kubernetes 是一个自我修复系统，因为它使用的控制器实现了“_协调环_”（Reconciliation Loop）。在协调环中，控制器观察系统的当前状态并将其与所需状态进行比较。一旦它确定了这两个状态之间的差异，它就会努力实现所需的状态。这使得 Kubernetes 非常适合动态环境。

### 3种扩展 Kubernetes 的方式

Goldberg 然后解释说，要建立控制器，你需要资源，也就是说，你需要扩展 Kubernetes。有三种方法可以做到这一点，从最灵活（但也更困难）到最简单的是：使用 Kube 聚合器，使用 API​​ 服务器构建器或创建自定义资源定义（或 CRD）。

后者允许即使使用最少的编码来扩展 Kubernetes 的功能。为了演示它是如何完成的，Goggle 软件工程师 Anthony Yeh 出席并展示了为 Kubernetes 添加一个状态集。 （状态集对象用于管理有状态应用，即需要存储应用状态的程序，跟踪例如用户身份及其个人设置。）使用 _catset_，在一个 100 行 JavaScript 的文件中实现的 CRD，Yeh 展示了如何将状态集添加到 Kubernetes 部署中。之前的扩展不是 CRD，需要 24 个文件和 3000 多行代码。

为解决 CRD 可靠性问题，Goldberg 表示，Kubernetes 已经启动了一项认证计划，允许公司在 Kubernetes 社区注册和认证其扩展。在一个月内，已有 30 多家公司报名参加该计划。

Goldberg 继续解释 Kubernetes 的可扩展性如何成为今年 KubeCon 的热门话题，以及 Google 和 IBM 如何构建一个使用 CRD 管理和保护微服务的平台。或者一些开发人员如何将机器学习带入 Kubernetes，另外展示开放服务代理以及在混合设置上的服务消费。

Goldberg 总结说，可扩展性是种增能。而且，Kubernetes 的可扩展性使其成为开发者的通用平台，并且易于使用，这使得他们可以运行任何应用程序。

你可以在下面观看整个视频：

https://www.youtube.com/embed/1kjgwXP_N7A?enablejsapi=1

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/event/kubecon/2018/2/3-ways-extend-power-kubernetes

作者：[PAUL BROWN][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/bro66
[1]:http://events17.linuxfoundation.org/events/kubecon-and-cloudnativecon-north-america
