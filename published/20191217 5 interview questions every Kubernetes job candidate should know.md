[#]: collector: (lujun9972)
[#]: translator: (Morisun029)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11730-1.html)
[#]: subject: (5 interview questions every Kubernetes job candidate should know)
[#]: via: (https://opensource.com/article/19/12/kubernetes-interview-questions)
[#]: author: (Jessica Repka https://opensource.com/users/jrepka)

每个 Kubernetes 应聘者应该知道的 5 个面试题
======

> 如果你是要面试 Kubernetes 相关职位的应聘者，这里给出了要提问的问题以及这些问题的重要性。

![](https://img.linux.net.cn/data/attachment/album/201912/31/101229mmjumsesrzhh6rhk.jpg)

面试对面试官及候选人来说都很不容易。最近，我发现面试 Kubernetes 相关工作的候选人似乎尤其困难。为什么呢？一方面，很难找到可以回答他们问题的人。而且，不管回答者回答的怎样，都很难确定他们是否有正确的经验。

跳过这个问题，让我们来看看面试 [Kubernetes][2] 求职者时应该提问的一些问题。

### Kubernetes 是什么？

我发现这个问题是面试中最好的问题之一。我经常听到有人说“我用 Kubernetes 工作”，但是当我问道“Kubernetes 是什么”时，从来都没有得到过一个满意答案。

我最喜欢 [Chris Short][3] 给出的答案：“Kubernetes 就是带有一些 YAML 文件的 API 。”

虽然他的回答没有错，但我会给你更详细的解释。 Kubernetes 是一个可移植容器的编排工具，用于自动执行管理、监控、扩展和部署容器化应用程序。

我认为“用于部署容器化应用程序的编排工具”这个回答可能与你期望的答案差不多了。能回答出这个，我觉得已经很不错了。尽管许多人认为 Kubernetes 做了更多更棒的工作，但总的来说，它为其核心功能——容器编排——添加了许多 API。

我认为，这是你在面试中可以提问的最好的问题之一，因为它至少证明了候选人是否知道 Kubernetes 是什么。

### Kubernetes 的节点和 Pod 有什么区别?

该问题揭示了候选人对 Kubernetes 复杂性的初步了解。它将面试对话转换为对体系结构的概述，并可能导向许多有趣的后续细节问题。我已经听到了无数次关于该问题的错误解释了。

[节点][4] 是工作计算机。该计算机可以是虚拟机（VM）或物理计算机，具体取决于你是在虚拟机监控程序上运行还是在裸机上运行。该节点包含用于运行容器的服务，包括 kubelet、kube-proxy 和容器运行时。

[Pod][5] 包括：一个或多个**容器**、具有共享**网络**和**存储**，以及有关如何运行一起部署的容器的**规范**。这四个细节都很重要。更进一步，职位申请人应从技术层面解释，Pod 是 Kubernetes 可以创建和管理的最小可部署单元，而不是容器。

对于这个问题，我听到的最好的简答是：“节点是计算机，而 Pod 是容器运行于其中的东西。”这个区别很重要。Kubernetes 管理员的大部分工作是知道什么时间要部署什么，而节点的部署成本可能非常非常高，具体取决于它们的运行位置。我不希望有人一遍又一遍地部署节点，他们需要做的就是部署一堆 Pod。

### kubectl 是什么？（你怎么发音？）

这个问题是我优先级较高的问题之一，但可能与你和你的团队无关。在我的团队中，我们不会使用图形化界面来管理 Kubernetes 环境，我们使用命令行操作。

那么什么是 [kubectl][6]？它是 Kubernetes 的命令行界面。你可以从该界面获取并设置任何内容，从收集日志和事件到编辑部署环境和机密文件。随机提问候选人关于如何使用此工具对测试候选人对 kubectl 的熟悉度是很有帮助的。

你是怎么读的？好吧，你随便吧（对此有很大的分歧），但是我很高兴向你介绍我朋友 [Waldo][7] 的精彩视频演示。

### 命名空间是什么？

在多次面试中，我都没有得到关于这个问题的答案。我不确定在其他环境中使用的命名空间是否会在我所在的团队经常使用。我在这里给出一个简短的答案：命名空间是 Pod 中的虚拟集群。这种抽象可以使你将多个虚拟集保留在多个环境中以此来进行隔离。

### 容器是什么?

了解 Pod 中正在部署的内容总是有帮助的，因为如果都不知道其中部署的是什么，何谈部署？容器是打包代码及其所有依赖项的软件的标准单元。我收到了两个可以接受的答案，其中包括：a）精简的操作系统镜像，以及 b）在受限的操作系统环境中运行的应用程序。如果你可以叫得出使用 [Docker][8] 以外的其他容器的编排软件（例如你最喜欢的公共云的容器服务），则可以得到加分。

### 其他问题

如果你想知道为什么我没有在此问题列表中添加更多问题，那么我可以给出一个简单的答案：我所列出的这些问题是在面试候选人时应了解的最基本的问题。接下来的问题应该是基于具体的团队、环境及组织。当你仔细研究这些内容时，尝试寻找有关技术如何相互作用的有趣问题，以了解人们如何应对基础架构挑战。考虑一下你的团队最近遇到的挑战（中断），要求逐步进行部署，或者考虑改善团队积极想要改进的策略（例如减少部署时间）。问题越不抽象，对面试后真正重要的技能的询问就越多。

没有两个环境是完全相同的。这也适用于面试中。我在每次面试中都会混合提问。我也有一个测试面试者的小环境。我经常发现回答问题是最容易的部分，而你所做的工作才是对你的真正的考验。

我给面试官的最后一点建议是：如果你遇到一个很有潜力但没有经验的候选人时，请给他们一个证明自己的机会。如果当初没有人看到我的潜力，没有给我机会的话，我不会拥有今天的知识和经验。

还有哪些重要的问题？请留言告诉我们。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/kubernetes-interview-questions

作者：[Jessica Repka][a]
选题：[lujun9972][b]
译者：[Morisun029](https://github.com/Morisun029)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jrepka
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/collab-team-pair-programming-code-keyboard.png?itok=kBeRTFL1 (Pair programming)
[2]: https://kubernetes.io/
[3]: https://twitter.com/ChrisShort
[4]: https://kubernetes.io/docs/concepts/architecture/nodes/
[5]: https://kubernetes.io/docs/concepts/workloads/pods/pod/
[6]: https://kubernetes.io/docs/reference/kubectl/kubectl/
[7]: https://opensource.com/article/18/12/kubectl-definitive-pronunciation-guide
[8]: https://opensource.com/resources/what-docker
[9]: https://enterprisersproject.com/article/2019/2/kubernetes-job-interview-questions-how-prepare
