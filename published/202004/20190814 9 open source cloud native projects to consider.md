[#]: collector: (lujun9972)
[#]: translator: (messon007)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12135-1.html)
[#]: subject: (9 open source cloud native projects to consider)
[#]: via: (https://opensource.com/article/19/8/cloud-native-projects)
[#]: author: (Bryant Son https://opensource.com/users/brsonhttps://opensource.com/users/marcobravo)

值得关注的 9 个开源云原生项目
======

> 工作中用了容器？熟悉这些出自云原生计算基金会的项目吗？

![](https://img.linux.net.cn/data/attachment/album/202004/21/222735oa1wib1wgypoiwpp.jpg)

随着用容器来开发应用的实践变得流行，[云原生应用][2]也在增长。云原生应用的定义为：

> “云原生技术用于开发使用打包在容器中的服务所构建的应用程序，以微服务的形式部署，并通过敏捷的 DevOps 流程和持续交付工作流在弹性基础设施上进行管理。”

这个定义提到了构成云原生应用的不可或缺的四个元素：

  1. 容器
  2. 微服务
  3. DevOps
  4. 持续集成和持续交付 (CI/CD)

尽管这些技术各有各自独特的历史，但它们之间却相辅相成，在短时间内实现了云原生应用和工具的惊人的指数级增长。这个[云原生计算基金会（CNCF）][4]信息图呈现了当今云原生应用生态的规模和广度。

![Cloud-Native Computing Foundation applications ecosystem][5]

*云原生计算基金会项目*

我想说，瞧着吧！这仅仅是一个开始。正如 NodeJS 的出现引发了无数的 JavaScript 工具的爆炸式增长一样，容器技术的普及也推动了云原生应用的指数增长。

好消息是，有几个组织负责监管并将这些技术连接在一起。 其中之一是 <ruby>[开放容器倡议][6]<rt>Open Containers Initiative</rt></ruby>（OCI），它是一个轻量级的、开放的治理机构（或项目），“它是在 Linux 基金会的支持下形成的，其明确目的是创建开放的行业标准的容器格式和运行时。” 另一个是 CNCF，它是“一个致力于使云原生计算普及和可持续发展的开源软件基金会”。

通常除了围绕云原生应用建立社区之外，CNCF 还帮助项目围绕其云原生应用建立结构化管理。CNCF 创建了成熟等级的概念（沙箱级、孵化级或毕业级），分别与下图中的“创新者”、“早期采用者”和“早期大量应用”相对应。

![CNCF project maturity levels][7]

*CNCF 项目成熟等级*

CNCF 为每个成熟等级制定了详细的[标准][8]（为方便读者而列在下面）。获得技术监督委员会（TOC）三分之二的同意才能转为孵化或毕业级。

**沙箱级**

> 要想成为沙箱级，一个项目必须至少有两个 TOC 赞助商。 有关详细过程，请参见《CNCF 沙箱指南 v1.0》。

**孵化级**

> 注：孵化级是我们期望对项目进行全面的尽职调查的起点。
>
> 要进入孵化级，项目除了满足沙箱级的要求之外还要满足：
>
> * 证明至少有三个独立的最终用户已成功将其用于生产，且 TOC 判断这些最终用户具有足够的质量和范围。
> * 提交者的数量要合理。提交者定义为具有提交权的人，即可以接受部分或全部项目贡献的人。
> * 显示出有大量持续提交和合并贡献。
> * 由于这些指标可能会根据项目的类型、范围和大小而有很大差异，所以 TOC 有权决定是否满足这些标准的活动水平。

**毕业级**

> 要从沙箱或孵化级毕业，或者要使一个新项目作为已毕业项目加入，项目除了必须满足孵化级的标准外还要满足：
>
> * 至少有两个来自组织的提交者。
> * 已获得并保持了“核心基础设施计划最佳实践徽章”。
> * 已完成独立的第三方安全审核，并发布了具有与以下示例类似的范围和质量的结果（包括已解决的关键漏洞）：<https://github.com/envoyproxy/envoy#security-audit>，并在毕业之前需要解决所有关键的漏洞。
> * 采用《CNCF 行为准则》。
> * 明确规定项目治理和提交流程。最好将其列在 `GOVERNANCE.md` 文件中，并引用显示当前提交者和荣誉提交者的 `OWNERS.md` 文件。
> * 至少有一个主仓的项目采用者的公开列表（例如，`ADOPTERS.md` 或项目网站上的徽标）。
> * 获得 TOC 的绝大多数票，进入毕业阶段。如果项目能够表现出足够的成熟度，则可以尝试直接从沙箱级过渡到毕业级。项目可以无限期保持孵化状态，但是通常预计它们会在两年内毕业。

### 值得关注的 9 个项目

本文不可能涵盖所有的 CNCF 项目，我将介绍最有趣的 9 个毕业和孵化的开源项目。

名称|授权类型|简要描述
---|---|---
[Kubernetes][9] | Apache 2.0 | 容器编排平台
[Prometheus][10] | Apache 2.0 | 系统和服务监控工具
[Envoy][11] | Apache 2.0 | 边缘和服务代理
[rkt][12] | Apache 2.0 | Pod 原生的容器引擎
[Jaeger][13] | Apache 2.0 | 分布式跟踪系统
[Linkerd][14] | Apache 2.0 | 透明服务网格
[Helm][15] | Apache 2.0 | Kubernetes 包管理器
[Etcd][16] | Apache 2.0 | 分布式键值存储
[CRI-O][17] | Apache 2.0 | 专门用于 Kubernetes 的轻量级运行时环境

我也创建了视频材料来介绍这些项目。

- [video](https://youtu.be/3cDxYO2GK4w)

### 毕业项目

毕业的项目被认为是成熟的，已被许多组织采用的，并且严格遵守了 CNCF 的准则。以下是三个最受欢迎的开源 CNCF 毕业项目。（请注意，其中一些描述来源于项目的网站并被做了改编。）

#### Kubernetes（希腊语“舵手”）

Kubernetes! 说起云原生应用，怎么能不提 Kubernetes 呢？ Google 发明的 Kubernetes 无疑是最著名的基于容器的应用程序的容器编排平台，而且它还是一个开源工具。

什么是容器编排平台？通常，一个容器引擎本身可以管理几个容器。但是，当你谈论数千个容器和数百个服务时，管理这些容器变得非常复杂。这就是容器编排引擎的用武之地。容器编排引擎通过自动化容器的部署、管理、网络和可用性来帮助管理大量的容器。

Docker Swarm 和 Mesosphere Marathon 也是容器编排引擎，但是可以肯定地说，Kubernetes 已经赢得了这场比赛（至少现在是这样）。Kubernetes 还催生了像 [OKD][18] 这样的容器即服务（CaaS）平台，它是 Kubernetes 的 Origin 社区发行版，并成了 [Red Hat OpenShift][19] 的一部分。

想开始学习，请访问 [Kubernetes GitHub 仓库][9]，并从 [Kubernetes 文档][20]页面访问其文档和学习资源。

#### Prometheus（普罗米修斯）

Prometheus 是 2012 年在 SoundCloud 上构建的一个开源的系统监控和告警工具。之后，许多公司和组织都采用了 Prometheus，并且该项目拥有非常活跃的开发者和用户群体。现在，它已经成为一个独立的开源项目，独立于公司之外进行维护。

![Prometheus’ architecture][21]

*Prometheus 的架构*

理解 Prometheus 的最简单方法是可视化一个生产系统，该系统需要 24（小时）x 365（天）都可以正常运行。没有哪个系统是完美的，也有减少故障的技术（称为容错系统），但是，如果出现问题，最重要的是尽快发现问题。这就是像 Prometheus 这样的监控工具的用武之地。Prometheus 不仅仅是一个容器监控工具，但它在云原生应用公司中最受欢迎。此外，其他开源监视工具，包括 [Grafana][22]，都借助了 Prometheus。

开始使用 Prometheus 的最佳方法是下载其 [GitHub 仓库][10]。在本地运行 Prometheus 很容易，但是你需要安装一个容器引擎。你可以在 [Prometheus 网站][23]上查看详细的文档。

#### Envoy（使者）

Envoy（或 Envoy 代理）是专为云原生应用设计的开源的边缘代理和服务代理。由 Lyft 创建的 Envoy 是为单一服务和应用而设计的高性能的 C++ 开发的分布式代理，同时也是为由大量微服务组成的服务网格架构而设计的通信总线和通用数据平面。Envoy 建立在 Nginx、HAProxy、硬件负载均衡器和云负载均衡器等解决方案的基础上，Envoy 与每个应用相伴（并行）运行，并通过提供平台无关的方式提供通用特性来抽象网络。

当基础设施中的所有服务流量都经过 Envoy 网格时，很容易就可以通过一致的可观测性来可视化问题域，调整整体性能，并在单个位置添加基础功能。基本上，Envoy 代理是一个可帮助组织为生产环境构建容错系统的服务网格工具。

服务网格应用有很多替代方案，例如 Uber 的 [Linkerd][24]（下面会讨论）和 [Istio][25]。Istio 通过将其部署为 [Sidecar][26] 并利用了 [Mixer][27] 的配置模型，实现了对 Envoy 的扩展。Envoy 的显著特性有：

* 包括所有的“<ruby>入场筹码<rt>table stakes</rt></ruby>（LCTT 译注：引申为基础必备特性）”特性（与 Istio 这样的控制平面组合时）
* 带载运行时 99% 数据可达到低延时
* 可以作为核心的 L3/L4 过滤器，提供了开箱即用的 L7 过滤器
* 支持 gRPC 和 HTTP/2（上行/下行）
* 由 API 驱动，并支持动态配置和热重载
* 重点关注指标收集、跟踪和整体可监测性

要想了解 Envoy，证实其能力并实现其全部优势，需要丰富的生产级环境运行的经验。你可以在其[详细文档][28]或访问其 [GitHub][11] 仓库了解更多信息。

### 孵化项目

下面是六个最流行的开源的 CNCF 孵化项目。

#### rkt（火箭）

rkt, 读作“rocket”，是一个 Pod 原生的容器引擎。它有一个命令行接口用来在 Linux 上运行容器。从某种意义上讲，它和其他容器如 [Podman][29]、Docker 和 CRI-O 相似。

rkt 最初是由 CoreOS （后来被 Red Hat 收购）开发的，你可以在其网站上找到详细的[文档][30]，以及在 [GitHub][12] 上访问其源代码。

#### Jaeger（贼鸥）

Jaeger 是一个开源的端到端的分布式追踪系统，适用于云端应用。在某种程度上，它是像 Prometheus 这样的监控解决方案。但它有所不同，因为其使用场景有所扩展：

* 分布式事务监控
* 性能和延时优化
* 根因分析
* 服务依赖性分析
* 分布式上下文传播

Jaeger 是一项 Uber 打造的开源技术。你可以在其网站上找到[详细文档][31]，以及在 [GitHub][13] 上找到其源码。

#### Linkerd

像创建 Envoy 代理的 Lyft 一样，Uber 开发了 Linkerd 开源解决方案用于生产级的服务维护。在某些方面，Linkerd 就像 Envoy 一样，因为两者都是服务网格工具，旨在提供平台级的可观测性、可靠性和安全性，而无需进行配置或代码更改。

但是，两者之间存在一些细微的差异。 尽管 Envoy 和 Linkerd 充当代理并可以通过所连接的服务进行上报，但是 Envoy 并不像 Linkerd 那样被设计为 Kubernetes Ingress 控制器。Linkerd 的显著特点包括：

* 支持多种平台（Docker、Kubernetes、DC/OS、Amazon ECS 或任何独立的机器）
* 内置服务发现抽象，可以将多个系统联合在一起
* 支持 gRPC、HTTP/2 和 HTTP/1.x请 求和所有的 TCP 流量

你可以在 [Linkerd 网站][32]上阅读有关它的更多信息，并在 [GitHub][14] 上访问其源码。

#### Helm（舵轮）

Helm 基本上就是 Kubernetes 的包管理器。如果你使用过 Apache Maven、Maven Nexus 或类似的服务，你就会理解 Helm 的作用。Helm 可帮助你管理 Kubernetes 应用程序。它使用“Helm Chart”来定义、安装和升级最复杂的 Kubernetes 应用程序。Helm 并不是实现此功能的唯一方法；另一个流行的概念是 [Kubernetes Operators][33]，它被 Red Hat OpenShift 4 所使用。

你可以按照其文档中的[快速开始指南][34]或 [GitHub 指南][15]来试用 Helm。

#### Etcd

Etcd 是一个分布式的、可靠的键值存储，用于存储分布式系统中最关键的数据。其主要特性有：

* 定义明确的、面向用户的 API（gRPC）
* 自动 TLS，可选的客户端证书验证
* 速度（可达每秒 10,000 次写入）
* 可靠性（使用 Raft 实现分布式）

Etcd 是 Kubernetes 和许多其他技术的默认的内置数据存储方案。也就是说，它很少独立运行或作为单独的服务运行；相反，它以集成到 Kubernetes、OKD/OpenShift 或其他服务中的形式来运作。还有一个 [etcd Operator][35] 可以用来管理其生命周期并解锁其 API 管理功能：

你可以在 [etcd 文档][36]中了解更多信息，并在 [GitHub][16]上访问其源码。

#### CRI-O

CRI-O 是 Kubernetes 运行时接口的 OCI 兼容实现。CRI-O 用于各种功能，包括：

* 使用 runc（或遵从 OCI 运行时规范的任何实现）和 OCI 运行时工具运行
* 使用容器/镜像进行镜像管理
* 使用容器/存储来存储和管理镜像层
* 通过容器网络接口（CNI）来提供网络支持

CRI-O 提供了大量的[文档][37]，包括指南、教程、文章，甚至播客，你还可以访问其 [GitHub 页面][17]。

我错过了其他有趣且开源的云原生项目吗？请在评论中提醒我。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/cloud-native-projects

作者：[Bryant Son][a]
选题：[lujun9972][b]
译者：[messon007](https://github.com/messon007)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brsonhttps://opensource.com/users/marcobravo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003601_05_mech_osyearbook2016_cloud_cc.png?itok=XSV7yR9e (clouds in the sky with blue pattern)
[2]: https://opensource.com/article/18/7/what-are-cloud-native-apps
[3]: https://thenewstack.io/10-key-attributes-of-cloud-native-applications/
[4]: https://www.cncf.io
[5]: https://opensource.com/sites/default/files/uploads/cncf_1.jpg (Cloud-Native Computing Foundation applications ecosystem)
[6]: https://www.opencontainers.org
[7]: https://opensource.com/sites/default/files/uploads/cncf_2.jpg (CNCF project maturity levels)
[8]: https://github.com/cncf/toc/blob/master/process/graduation_criteria.adoc
[9]: https://github.com/kubernetes/kubernetes
[10]: https://github.com/prometheus/prometheus
[11]: https://github.com/envoyproxy/envoy
[12]: https://github.com/rkt/rkt
[13]: https://github.com/jaegertracing/jaeger
[14]: https://github.com/linkerd/linkerd
[15]: https://github.com/helm/helm
[16]: https://github.com/etcd-io/etcd
[17]: https://github.com/cri-o/cri-o
[18]: https://www.okd.io/
[19]: https://www.openshift.com
[20]: https://kubernetes.io/docs/home
[21]: https://opensource.com/sites/default/files/uploads/cncf_3.jpg (Prometheus’ architecture)
[22]: https://grafana.com
[23]: https://prometheus.io/docs/introduction/overview
[24]: https://linkerd.io/
[25]: https://istio.io/
[26]: https://istio.io/docs/reference/config/networking/v1alpha3/sidecar
[27]: https://istio.io/docs/reference/config/policy-and-telemetry
[28]: https://www.envoyproxy.io/docs/envoy/latest
[29]: https://podman.io
[30]: https://coreos.com/rkt/docs/latest
[31]: https://www.jaegertracing.io/docs/1.13
[32]: https://linkerd.io/2/overview
[33]: https://coreos.com/operators
[34]: https://helm.sh/docs
[35]: https://github.com/coreos/etcd-operator
[36]: https://etcd.io/docs/v3.3.12
[37]: https://github.com/cri-o/cri-o/blob/master/awesome.md
