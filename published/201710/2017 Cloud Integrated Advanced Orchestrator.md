Ciao：云集成高级编排器
============================================================

<ruby>云集成高级编排器<rt>Cloud Integrated Advanced Orchestrator</rt></ruby> （Ciao） 是一个新的负载调度程序，用来解决当前云操作系统项目的局限性。Ciao 提供了一个轻量级，完全基于 TLS 的最小配置。它是
工作量无关的、易于更新、具有优化速度的调度程序，目前已针对 OpenStack 进行了优化。

其设计决策和创新方法在对安全性、可扩展性、可用性和可部署性的要求下进行：

- **可扩展性：** 初始设计目标是伸缩超过 5,000 个节点。因此，调度器架构用新的形式实现：
	- 在 ciao 中，决策制定是去中心化的。它基于拉取模型，允许计算节点从调度代理请求作业。调度程序总能知道启动器的容量，而不要求进行数据更新，并且将调度决策时间保持在最小。启动器异步向调度程序发送容量。
	- 持久化状态跟踪与调度程序决策制定相分离，它让调度程序保持轻量级。这种分离增加了可靠性、可扩展性和性能。结果是调度程序让出了权限并且这不是瓶颈。
- **可用性：** 虚拟机、容器和裸机集成到一个调度器中。所有的负载都被视为平等公民。为了更易于使用，网络通过一个组件间最小化的异步协议进行简化，只需要最少的配置。Ciao 还包括一个新的、简单的 UI。所有的这些功能都集成到一起来简化安装、配置、维护和操作。
- **轻松部署：** 升级应该是预期操作，而不是例外情况。这种新的去中心化状态的体系结构能够无缝升级。为了确保基础设施（例如 OpenStack）始终是最新的，它实现了持续集成/持续交付（CI/CD）模型。Ciao 的设计使得它可以立即杀死任何 Ciao 组件，更换它，并重新启动它，对可用性影响最小。
- **安全性是必需的：** 与调度程序的连接总是加密的：默认情况下 SSL 是打开的，而不是关闭的。加密是从端到端：所有外部连接都需要 HTTPS，组件之间的内部通信是基于 TLS 的。网络支持的一体化保障了租户分离。

初步结果证明是显著的：在 65 秒内启动一万个 Docker 容器和五千个虚拟机。进一步优化还在进行。

- 文档：[https://clearlinux.org/documentation/ciao/ciao.html][3]
- Github 链接： [https://github.com/01org/ciao(link is external)][1]
- 邮件列表链接： [https://lists.clearlinux.org/mailman/listinfo/ciao-devel][2]

--------------------------------------------------------------------------------

via: https://clearlinux.org/ciao

作者：[ciao][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://clearlinux.org/ciao
[1]:https://github.com/01org/ciao
[2]:https://lists.clearlinux.org/mailman/listinfo/ciao-devel
[3]:https://clearlinux.org/documentation/ciao/ciao.html
