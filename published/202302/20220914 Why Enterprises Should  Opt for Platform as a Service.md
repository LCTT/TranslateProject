[#]: subject: "Why Enterprises Should  Opt for Platform as a Service"
[#]: via: "https://www.opensourceforu.com/2022/09/why-enterprises-should-opt-for-platform-as-a-service/"
[#]: author: "Gopala Krishna Behara https://www.opensourceforu.com/author/gopalakrishna-behara/"
[#]: collector: "lkxed"
[#]: translator: "onionstalgia"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15548-1.html"

为什么企业应该选择平台即服务（PaaS）
======

![][0]

> 平台即服务能够快速、轻松地创建网络应用，而无需购买和维护其下的软件和基础设施。本文解释了它为什么有用。

<ruby>平台即服务<rt>PaaS</rt></ruby>（以下简称 PaaS）指的是云计算服务，它为客户提供了开发、运行和管理应用程序的平台，而免去了建立和维护与开发和启动应用程序相关的基础设施的复杂工作。这是云原生应用和支持系统所依托的核心平台。

PaaS 通常包括不同的应用基础功能，包括应用平台、集成平台、业务分析平台、事件流服务和移动后端服务。此外，它还包括一套与监控、管理、部署相关的功能。

开发人员希望他们的开发环境不需要等待，而运营团队则更关心性能和稳定性。这经常引起两方间的冲突。PaaS 为这两方创造了和平的环境。一个作为服务交付的应用平台被称作 PaaS，它被用于部署用户代码。Cloud Foundry、Cloudify 和 OpenShift 这些开源环境都可用作 PaaS。

### PaaS 的采用模式

云计算必须满足五个基本特征：按需服务、接入网络、资源池化、弹性和可度量的服务。为此，云计算提供了三种服务模式：<ruby>软件即服务<rt>Software as a Service</rt></ruby>（SaaS）、<ruby>平台即服务<rt>Platform as a Service</rt></ruby>（PaaS）、<ruby>基础设施即服务<rt>Infrastructure as a Service</rt></ruby>（IaaS）。

业务选用 PaaS 的关键驱动力：

* 减少提供业务的资本支出和运营费用
* 通过减少应用程序的交付时间和提高开发和交付质量，最大限度地降低 IT 成本
* 增加中间件之间的灵活性和集成度

*简单 PaaS*：踏入 PaaS 领域的入口。它可以提供应用程序服务，并将它们暴露在自助服务的目录中；自动部署和计量服务使用的资源。

*管理 PaaS*：管理已配置应用程序的<ruby>服务级别协议<rt>SLA</rt></ruby>和<ruby>服务质量<rt>QoS</rt></ruby>，例如弹性、应用程序性能、安全性等。

*编程 PaaS*：允许应用程序与外部应用程序或公共云集成，并实现自动扩展和云爆发场景。

*面向流程 PaaS*：允许通过创建持续交付流程来实现<ruby>开发运维<rt>DevOps</rt></ruby>流程，该流程可以自动构建、测试应用程序并将其交付到云环境中。

除了这些采用模式之外，还有其他的 PaaS 变体如下，这些变化可能与上文的模式有一定重合：

*集成平台即服务（iPaaS）*：一套能够开发、执行和管理集成流的云服务。集成流可以是个人内部或跨多个组织连接的，可以包含任何企业内部或基于云的流程、服务、应用和数据。这些组合变化可能也符合上述的模式之一，例如 MuleSoft CloudHub 和 BizTalk。

*移动平台即服务（mPaaS）*：为开发移动应用提供的集成开发环境（IDE），并且支持多种移动平台。

*数据库平台即服务（dbPaas）*：一种按需的、安全且可扩展的自助式数据库平台，可自动配置和管理数据库。dbPaaS 使扩展数据库变得更加容易，并使它们更加可靠。

*物联网平台即服务（IoTPaaS）*：提供了实现异构物联网拓扑所需的通信、安全、分析和管理的通用基础架构。它为构建物联网解决方案提供了更简单、更敏捷的模型。

*业务流程管理平台即服务（bpmPaaS）*：一个完整的预集成业务流程管理平台，托管在云端并作为服务交付。它被用于开发和执行整个企业的业务流程和以工作流程为中心的应用程序。例如 Pega cloud 和 OpenText Cordys cloud。

PaaS 的一些基本特征：

* 在同一集成开发环境中开发、测试、部署、托管和维护应用程序的服务
* 多租户架构，即多个并发用户使用同样的开发程序
* 部署软件的内置可扩展性，包括负载平衡和故障转移
* 与异构平台和系统的集成
* 支持开发团队的协作
* 包含处理帐单和管理订阅的工具

### 主要的开源 PaaS

在选择 PaaS 之前，企业主要考虑关注以下几点：

* 部署灵活性
* 操作简便性
* 应用堆栈的选择
* 语言、数据库和框架支持
* 规模的可扩展性
* 服务质量（QoS）
* 开发和运营的工具
* 它有多适合你的业务

现在让我们快速浏览下流行的开源 PaaS。

*Cloud Foundry*：提供了多种云的选择、开发者框架和应用服务。Cloud Foundry 使构建、测试、部署和扩展应用程序变得更快、更容易。

它有不同的发行版本，其中比较流行的是 Pivotal 和 IBM。它包含应用<ruby>运行时<rt>runtime</rt></ruby>和容器运行时。在 Pivotal 上包含有应用服务和容器服务。

*OpenShift*：红帽的云计算 PaaS 产品。这是一个云端的应用平台，应用开发者和团队可以在这里构建、测试、部署和运行他们的应用程序。

*Cloudify*：在开放的原则下开发和设计，用以推动 IT 转型革命。它使组织能够在其上设计、建立和提供各种商业应用和网络服务。Cloudify 的最新版本为 4.3，它包含了先进的安全、控制和<ruby>真自服务<rt>true self-service</rt></ruby>等增强功能。Cloudify 4.3 还为 Kubernetes 容器编排引入了全新的概念。

| 功能 | Cloud Foundry | Cloudify | OpenShift |
| :- | :- | :- | :- |
| 核心功能 | Cloud controller                                            | Manager                    | Broker                                             |
| 提供第三方数据库服务 | Service broker                                              | Agent                      | Cartridge                                          |
| 传入流量的路由 | Router                                                      | Manager                    | REST API                                           |
| 查询应用程序的状态 | Cloud controller                                            | CLI client                 | Broker                                             |
| 消息传递 | Message bus | Manager | Broker |
| 应用实例管理 | Droplet execution agent | Agent | Node |
| 应用程序状态管理 | Health manager | Manager | Broker |
| Broker | Warden | Agent | Gear |
| 用户请求的负载平衡 | Droplet execution agent | Manager | Broker |
| 框架提供者 | Blob store | Agent | Cartridge |
|技术 ||||
| 语言 | Java, Ruby, Scala, Node.js, Groovy, Grails, PHP, Go, Python | Java, PHP, Ruby | Java, Ruby, Node.js, PHP, Python, Perl, JavaScript|
| 数据库 | MongoDB，MySQL |||
|MongoDB、MySQL、PostgreSQL | MySQL、MongoDB | MongoDB、MySQL、PostgreSQL||
| 框架 | Spring, Rails, Grails, Play Sinatra | JavaScript, Node.js | Rails, Flask, Django, Drupal, Vertx |
| 水平扩展 | 是 | 是 | 是|
| 垂直扩展 | 是 | 否 | 是|
| 弹性伸缩 | 是 | 是 | 是|

表 1 列出了 Cloud Foundry、Cloudify 和 OpenShift 的基本功能及其对应的架构组件。以上完全基于个人观点，所支持的功能的真实需求应与云供应商进行验证。

从行业统计数据中，我们可以清楚地看出 PaaS 的使用率正在迅速上升。PaaS 使企业应用程序可以是<ruby>云无关<rt>cloud-agnostic</rt></ruby>的，它们可以在任何云平台上运行——无论是公共的还是私有的。这意味着一个在亚马逊的 AWS 上开发的应用可以很容易地移植到微软 Azure、VMWare vSphere、Red Hat RHEV 等等其他平台。

当多个开发人员共同参与一个开发项目，或外部用户需要与开发过程协作时，PaaS 是很有用的。因此，PaaS 尤其适合于敏捷开发，因为它降低了围绕软件快速开发和迭代的难度。

### 鸣谢

作者感谢 Kiran M.R. 和 Wipro 有限公司的数字架构实践 Raju Alluri 为本文提供的支持。

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/09/why-enterprises-should-opt-for-platform-as-a-service/

作者：[Gopala Krishna Behara][a]
选题：[lkxed][b]
译者：[onionstalgia](https://github.com/onionstalgia)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/gopalakrishna-behara/
[b]: https://github.com/lkxed

[0]: https://img.linux.net.cn/data/attachment/album/202302/17/094352atasztuxqg4t1ctt.jpg