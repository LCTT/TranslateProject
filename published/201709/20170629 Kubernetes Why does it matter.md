Kubernetes 为什么这么重要？
============================================================

> 在开发和部署云原生应用程序时，运行容器化负载的 Kubernetes 平台起到了重大作用。

![Kubernetes: Why does it matter?](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/freesoftwareway_law3.png?itok=wyze_0fV "Kubernetes: Why does it matter?")

自然而然的，开发和部署云原生应用程序已经变得非常受欢迎。对于一个允许快速部署和连续交付的 bug 修复和新功能的流程来说，它有明显的优势，但是没有人会谈到鸡和鸡蛋问题：怎样才能达成这样的目的呢？从头开始构建基础设施和开发流程来开发和维护云原生应用程序是个不简单的、耗时的任务。

[Kubernetes][3] 是一个相对较新的运行容器化负载的平台，它解决了这些问题。它原本是 Google 内部的一个项目，Kubernetes 在 2015 年被捐赠给了[云原生计算基金会][4]，并吸引了来自世界各地开源社区的开发人员。 Kubernetes 的设计基于 Google 15 年的在生产和开发环境运维的经验。由于它是开源的，任何人都可以下载并使用它，并实现其带来的优势。

那么为什么 Kubernetes 会有这么大的惊喜呢？我认为它在像 OpenStack 这样的基础架构即服务（IaaS）和完整的平台即服务 （PaaS）的资源之间达到了最佳平衡，它的底层运行时实现完全由供应商控制。Kubernetes 提供了两个优势：对管理基础设施的抽象，以及深入裸机进行故障排除的工具和功能。

### IaaS 与 PaaS

OpenStack 被大多数人归类为 IaaS 解决方案，其中物理资源池（如处理器、网络和存储）在不同用户之间分配和共享。它使用传统的基于硬件的虚拟化实现用户之间的隔离。

OpenStack 的 REST API 允许使用代码自动创建基础架构，但是这就是问题所在。IaaS 产品输出的也是基础设施。其创建后，支持和管理那些更多的基础设施的服务方式并不多。在一定程度上，OpenStack 生产的底层基础架构（如服务器和 IP 地址）成为管理工作的重中之重。一个众所周知的结果是虚拟机（VM）的无序蔓延，而同样的情况也出现于网络、加密密钥和存储卷方面。这样，开发人员建立和维护应用程序的时间就更少了。

像其它基于集群的解决方案一样，Kubernetes 以单个服务器级别的方式运行，以实现水平缩放。它可以轻松添加新的服务器，并立即在新硬件上安排负载。类似地，当服务器没有被有效利用或需要维护时，可以从集群中删除服务器。其它 Kubernetes 可以自动处理的其他任务是编排活动，如工作调度、健康监测和维护高可用性。

网络是另一个可能难以在 IaaS 环境中可靠编排的领域。微服务之间通过 IP 地址通信可能是很棘手的。Kubernetes 实现了 IP 地址管理、负载均衡、服务发现和 DNS 名称注册，以在集群内提供无痛、透明的网络环境。

### 专为部署而设计

一旦创建了运行应用程序的环境，部署就是一件小事了。可靠地部署一个应用程序是说起来容易做起来难的任务 —— 它并不是最简单的。Kubernetes 相对其他环境的巨大优势是，部署是一等公民。

使用一个单独的 Kubernetes 命令行界面（CLI）的命令，可以描述应用程序并将其安装在群集上。Kubernetes 从初始部署、推出新版本以及（当一个关键功能出现问题时）进行回滚，实现了应用程序的整个生命周期。运行中的部署也可以暂停和恢复。拥有现成的、内置的工具和支持应用程序部署，而不用自己构建部署系统，这是不容小觑的优点。Kubernetes 用户既不必重新发明应用程序部署的轮子，也不会发现这是一项艰巨的任务。

Kubernetes 还可以监控运行中的部署的状态。虽然你可以在 IaaS 环境中像编写部署过程一样编写这个功能，但这是一个非常困难的任务，而这样的情况还比比皆是。

### 专为 DevOps 而设计

随着你在开发和部署 Kubernetes 应用程序方面获得更多经验，你将沿着与 Google 和其他前行者相同的路径前行。你将发现有几种 Kubernetes 功能对于多服务应用程序的有效开发和故障排除是非常重要的。

首先，Kubernetes 能够通过日志或 SSH（安全 shell）轻松检查正在运行的服务的能力非常重要。通过一条命令行调用，管理员可以检查在 Kubernetes 下运行的服务的日志。这可能听起来像一个简单的任务，但在 IaaS 环境中，除非你已经做了一些工作，否则这并不容易。大型应用程序通常具有专门用于日志收集和分析的硬件和人员。在Kubernetes 中的日志可能不能替代完整功能的日志和指标解决方案，但它足以提供基本的故障排除。

第二，Kubernetes 提供内置的密钥管理。从头开发过自己的部署系统的团队知道的另一个问题是，将敏感数据（如密码和 API 令牌）安全地部署到虚拟机上很困难。通过将密钥管理变成一等公民，Kubernetes 可以避免你的团队发明自己的不安全的、错误的密钥分发系统或在部署脚本中硬编码凭据。

最后，Kubernetes 有一些用于自动进行缩放、负载均衡和重新启动应用程序的功能。同样，这些功能是开发人员在使用 IaaS 或裸机时要自己编写的。你的 Kubernetes 应用程序的缩放和运行状况检查在服务定义中进行声明，而 Kubernetes 会确保正确数量的实例健康运行。

### 总结

IaaS 和 PaaS 系统之间的差异是巨大的，包括 PaaS 可以节省大量的开发和调试时间。作为一种 PaaS，Kubernetes 实现了强大而有效的功能，可帮助你开发、部署和调试云原生应用程序。它的架构和设计代表了数十年的难得的经验，而你的团队能够免费获得该优势。


（题图：opensource.com）

--------------------------------------------------------------------------------

作者简介：

Tim Potter - Tim 是 Hewlett Packard Enterprise 的高级软件工程师。近二十年来，他一直致力于自由和开源软件的开发工作，其中包括 Samba、Wireshark、OpenPegasus 和 Docker 等多个项目。Tim 博客在 https://elegantinfrastructure.com/ ，关于 Docker、Kubernetes 和其他基础设施相关主题。

-----


via: https://opensource.com/article/17/6/introducing-kubernetes

作者：[Tim Potter][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/tpot
[1]:https://opensource.com/article/17/6/introducing-kubernetes?rate=RPoUoHXYQXbTb7DHQCDsHgR1ZcfLSoquZ8xVZzfMtxM
[2]:https://opensource.com/user/63281/feed
[3]:https://kubernetes.io/
[4]:https://www.cncf.io/
[5]:https://opensource.com/users/tpot
