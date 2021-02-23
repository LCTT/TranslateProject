[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11565-1.html)
[#]: subject: (Why containers and Kubernetes have the potential to run almost anything)
[#]: via: (https://opensource.com/article/19/6/kubernetes-potential-run-anything)
[#]: author: (Scott McCarty https://opensource.com/users/fatherlinux)

为什么容器和 Kubernetes 有潜力运行一切
======

> 不仅可以部署简单的应用程序，还可以用 Kubernetes 运维器应对第 2 天运营。

![](https://img.linux.net.cn/data/attachment/album/201911/12/011140mp75sd0ynppd77da.jpg)

在我的第一篇文章 [为什么说 Kubernetes 是一辆翻斗车][2] 中，我谈到了 Kubernetes 如何在定义、分享和运行应用程序方面很出色，类似于翻斗车在移动垃圾方面很出色。在第二篇中，[如何跨越 Kubernetes 学习曲线][3]，我解释了 Kubernetes 的学习曲线实际上与运行任何生产环境中的应用程序的学习曲线相同，这确实比学习所有传统组件要容易（如负载均衡器、路由器、防火墙、交换机、集群软件、集群文件系统等）。这是 DevOps，是开发人员和运维人员之间的合作，用于指定事物在生产环境中的运行方式，这意味着双方都需要学习。在第三篇 [Kubernetes 基础：首先学习如何使用][4] 中，我重新设计了 Kubernetes 的学习框架，重点是驾驶翻斗车而不是制造或装备翻斗车。在第四篇文章 [帮助你驾驭 Kubernetes 的 4 个工具][5] 中，我分享了我喜爱的工具，这些工具可帮助你在 Kubernetes 中构建应用程序（驾驶翻斗车）。

在这最后一篇文章中，我会分享我为什么对在 Kubernetes 上运行应用程序的未来如此兴奋的原因。

从一开始，Kubernetes 就能够很好地运行基于 Web 的工作负载（容器化的）。Web 服务器、Java 和相关的应用程序服务器（PHP、Python等）之类的工作负载都可以正常工作。该平台处理诸如 DNS、负载平衡和 SSH（由 `kubectl exec` 取代）之类的支持服务。在我的职业生涯的大部分时间里，这些都是我在生产环境中运行的工作负载，因此，我立即意识到，除了 DevOps 之外，除了敏捷之外，使用 Kubernetes 运行生产环境工作负载的强大功能。即使是我们几乎不改变我们的文化习惯，也可以提高效率。调试和退役变得非常容易，而这对于传统 IT 来说是极为困难的。因此，从早期开始，Kubernetes 就用一种单一的配置语言（Kube YAML/Json）为我提供了对生产环境工作负载进行建模所需的所有基本原语。

但是，如果你需要运行具有复制功能的多主 MySQL，会发生什么情况？使用 Galera 的冗余数据呢？你如何进行快照和备份？那么像 SAP 这样复杂的工作呢？使用 Kubernetes，简单的应用程序（Web 服务器等）的第 0 天（部署）相当简单，但是没有解决第 2 天的运营和工作负载。这并不是说，具有复杂工作负载的第 2 天运营要比传统 IT 难解决，而是使用 Kubernetes 并没有使它们变得更容易。每个用户都要设计自己的天才想法来解决这些问题，这基本上是当今的现状。在过去的五年中，我遇到的第一类问题是复杂工作负载的第 2 天操作。（LCTT 译注：在软件生命周期中，第 0 天是指软件的设计阶段；第 1 天是指软件的开发和部署阶段；第 2 天是指生产环境中的软件运维阶段。）

值得庆幸的是，随着 Kubernetes <ruby>运维器<rt>Operator</rt></ruby>的出现，这种情况正在改变。随着运维器的出现，我们现在有了一个框架，可以将第 2 天的运维知识汇总到平台中。现在，我们可以应用我在 [Kubernetes 基础：首先学习如何使用][4] 中描述的相同的定义状态、实际状态的方法，现在我们可以定义、自动化和维护各种各样的系统管理任务。

（LCTT 译注： Operator 是 Kubernetes 中的一种可以完成运维工程师的特定工作的组件，业界大多没有翻译这个名词，此处仿运维工程师例首倡翻译为“运维器”。）

我经常将运维器称为“系统管理机器人”，因为它们实质上是在第 2 天的工作中整理出一堆运维知识，该知识涉及<ruby>主题专家<rt>Subject Matter Expert</rt></ruby>（SME、例如数据库管理员或系统管理员）针对的工作负载类型（数据库、Web 服务器等），通常会记录在 Wiki 中的某个地方。这些知识放在 Wiki 中的问题是，为了将该知识应用于解决问题，我们需要：

1. 生成事件，通常监控系统会发现故障，然后我们创建故障单
2. SME 人员必须对此问题进行调查，即使这是我们之前见过几百万次的问题
3. SME 人员必须执行该知识（执行备份/还原、配置 Galera 或事务复制等）

通过运维器，所有这些 SME 知识都可以嵌入到单独的容器镜像中，该镜像在有实际工作负荷之前就已部署。 我们部署运维器容器，然后运维器部署和管理一个或多个工作负载实例。然后，我们使用“运维器生命周期管理器”（Katacoda 教程）之类的方法来管理运维器。

因此，随着我们进一步使用 Kubernetes，我们不仅简化了应用程序的部署，而且简化了整个生命周期的管理。运维器还为我们提供了工具，可以管理具有深层配置要求（群集、复制、修复、备份/还原）的非常复杂的有状态应用程序。而且，最好的地方是，构建容器的人员可能是做第 2 天运维的主题专家，因此现在他们可以将这些知识嵌入到操作环境中。

### 本系列的总结

Kubernetes 的未来是光明的，就像之前的虚拟化一样，工作负载的扩展是不可避免的。学习如何驾驭 Kubernetes 可能是开发人员或系统管理员可以对自己的职业发展做出的最大投资。随着工作负载的增多，职业机会也将增加。因此，这是驾驶一辆令人惊叹的 [在移动垃圾时非常优雅的翻斗车][2]……

你可能想在 Twitter 上关注我，我在 [@fatherlinux][6] 上分享有关此主题的很多内容。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/kubernetes-potential-run-anything

作者：[Scott McCarty][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/fatherlinux
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fail_progress_cycle_momentum_arrow.png?itok=q-ZFa_Eh (arrows cycle symbol for failing faster)
[2]: https://opensource.com/article/19/6/kubernetes-dump-truck
[3]: https://opensource.com/article/19/6/kubernetes-learning-curve
[4]: https://opensource.com/article/19/6/kubernetes-basics
[5]: https://opensource.com/article/19/6/tools-drive-kubernetes
[6]: https://twitter.com/fatherlinux
