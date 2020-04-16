[#]: collector: (lujun9972)
[#]: translator: (messon007)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (9 open source cloud native projects to consider)
[#]: via: (https://opensource.com/article/19/8/cloud-native-projects)
[#]: author: (Bryant Son https://opensource.com/users/brsonhttps://opensource.com/users/marcobravo)

值得考虑的9个开源的云原生项目
======
工作中用了容器？熟悉这些出自云原生计算基金会的项目？

![clouds in the sky with blue pattern][1]

随着用容器来开发应用的实践变得流行，[云原生应用][2]也在增长。云原生应用的定义为：
> "云原生技术被用于开发应用程序，这些应用通过将服务打包在容器中来完成构建，被部署为微服务，并通过敏捷的DevOps流程和持续集成工作流在弹性基础设施上管理。"

这个定义提到了构成云原生应用的4个元素：

  1. 容器
  2. 微服务
  3. DevOps
  4. 持续集成和持续交付 (CI/CD)


尽管这些技术各有各自独特的历史，但它们相互补充，共同导致了云原生应用和工具在短时间内惊人的指数级增长。这个[云原生计算基金会][4]信息图呈现了当今云原生应用生态的规模和广度。

![Cloud-Native Computing Foundation applications ecosystem][5]

云原生计算基金会项目

我想说，瞧着吧！这仅仅是一个开始。正如NodeJS的出现引发了无休止的JavaScript工具的爆炸式增长一样，容器技术的普及也推动了云原生应用的指数增长。

好消息是，有几个组织负责监管这些技术并将它们融合在一起。 其中之一是[**Open Containers Initiative（OCI)**][6]，它是一个轻量级的，开放的治理机构（或项目），“它是在Linux基金会的主持下形成的，其明确目的是创建开放的行业标准的容器格式和运行时。” 另一个是** CNCF **，“它是一个致力于使云原生计算具有通用性和可持续性的开源软件基金会”。

除了常见的围绕云原生应用建立社区之外，CNCF还帮助项目基于其云原生应用建立结构化的管理。CNCF创建了成熟等级的概念（沙箱级，孵化级或毕业级），分别与下图中的“创新者”，“早期采用者”和“早期大量应用”相对应。
![CNCF project maturity levels][7]

CNCF项目成熟等级

CNCF为每个成熟等级制定了详细的[标准][8]（为方便读者而列在下面）。 获得技术监督委员会（TOC）三分之二的同意才能转为孵化或毕业级。

### 沙箱级

> 要想成为沙箱级，一个项目必须至少有两个TOC赞助商。 有关详细过程，请参见《 CNCF沙箱指南v1.0》。


### 孵化级

>注意：孵化级是我们期望对项目进行全面尽职调查的起点。
>
>要进入孵化阶段，项目除了满足沙箱阶段的要求之外还要满足：
>
> *证明至少有三个独立的最终用户已成功将其用于生产，且TOC判断这些最终用户具有足够的质量和范围。
> *合入者的数量要合理。合入者定义为具有合入权的人。即可以接受对部分或全部项目贡献的人。
> *演示有大量正在进行的提交和合并的贡献。
> *由于这些指标可能会根据项目的类型，范围和大小而有很大差异，因此TOC对足以满足这些标准的活动级别拥有最终决策权



### 毕业级

>要从沙箱或孵化级毕业，或者要使一个新项目作为已毕业项目加入，项目除了必须满足孵化级的标准外还要满足：
>
> *至少有两个组织的提交者。
> *已获得并维护了“核心基础设施计划最佳实践徽章”。
> *已完成独立和第三方安全审核，并发布了具有与以下示例类似的范围和质量的结果（包括已解决的关键漏洞）：<https://github.com/envoyproxy/envoy#security-audit>和所有关键毕业之前需要解决漏洞。
> *采用CNCF行为准则。
> *明确定义项目治理和提交流程。最好将其排布在GOVERNANCE.md文件中，并引用显示当前提交者和荣誉提交者的OWNERS.md文件。
> *至少有主仓的项目采用者的公开列表（例如，ADOPTERS.md或项目网站上的徽标）。
> *获得TOC的多数票，进入毕业阶段。如果项目能够证明足够的成熟度，则可以尝试直接从沙箱过渡到毕业。项目可以无限期保持孵化状态，但是通常预计它们会在两年内毕业。

## 值得考虑的9个项目

本文不可能涵盖所有的CNCF项目，我将介绍最有趣的9个“已毕业和孵化中”的开源项目。

名称|授权类型|简要描述
---|---|---
[Kubernetes][9] | Apache 2.0 | 容器编排平台
[Prometheus][10] | Apache 2.0 | 系统和服务监控工具
[Envoy][11] | Apache 2.0 | 边缘和服务代理
[rkt][12] | Apache 2.0 | Pod原生的容器引擎
[Jaeger][13] | Apache 2.0 | 分布式跟踪系统
[Linkerd][14] | Apache 2.0 | 无感服务网格
[Helm][15] | Apache 2.0 | Kubernetes包管理器
[Etcd][16] | Apache 2.0 | 分布式键值存储
[CRI-O][17] | Apache 2.0 | 专门用于Kubernetes的轻量级运行时环境

我也创建了视频材料来介绍这些项目。

## 毕业项目

已毕业的项目被认为是成熟的，已被许多组织采用的，并且严格遵守了CNCF的准则。 以下是三个最受欢迎的开源CNCF毕业项目。 （请注意，其中一些描述来源于项目的网站并被做了改编。）

### Kubernetes

Kubernetes! 我们如何在不提及Kubernetes的情况下谈论云原生应用程序？ Google发明的Kubernetes无疑是最著名的基于容器的应用程序的容器编排平台，而且它还是一个开源工具。

什么是容器编排平台？ 通常，一个容器引擎本身可以管理几个容器。 但是，当您谈论数千个容器和数百个服务时，管理这些容器变得非常复杂。 这就是容器编排引擎的用武之地。容器编排引擎通过自动化容器的部署，管理，网络和可用性来帮助管理大量的容器。

Docker Swarm和Mesosphere Marathon也是容器编排引擎，但是可以肯定地说Kubernetes在竞争中胜出（至少现在是这样）。Kubernetes还诞生了容器即服务（CaaS）平台如[OKD][18]，它是Origin社区针对Kubernetes的发行版，并成了[Red Hat OpenShift][19]的一部分。

想开始学习请访问[Kubernetes GitHub仓库][9]，并从[Kubernetes文档][20]页面访问其文档和学习资源。

### Prometheus

Prometheus是2012年在SoundCloud上构建的一个开源系统监控和告警工具。之后，许多公司和组织都使用了Prometheus，并且该项目拥有非常活跃的开发者和用户群体。 现在，它是一个独立于公司的独立维护的开源项目。

![Prometheus’ architecture][21]

Prometheus的架构

理解Prometheus的最简单方法是可视化一个生产系统，该系统需要24(小时)x365天都可以正常运行。 没有哪个系统是完美的，也有减少故障的技术（称为容错系统）。 但是，如果出现问题，最重要的是尽快识别它。 这就是像Prometheus这样的监控工具的用武之地。Prometheus不仅是容器监控工具，它在云原生应用公司中也最受欢迎。 此外，其他开源监视工具，包括[Grafana][22]，都借鉴了Prometheus。

开始使用Prometheus的最佳方法是下载其[GitHub仓库][10]。 在本地运行Prometheus很容易，但是您需要安装一个容器引擎。 您可以在[Prometheus网站][23]上查看详细的文档。

### Envoy

Envoy（或Envoy代理）是专为云原生应用设计的开源的边缘代理和服务代理。 由Lyft创建的Envoy是为单一服务和应用而设计的高性能的C++分布式代理，同时也是为由大量微服务组成的服务网格架构而设计的通信总线和通用数据平面。 基于对Nginx，HAProxy，硬件负载均衡器和云负载均衡器等方案了解的基础上，Envoy与每个应用相伴(并行)运行，并对网络进行了高度抽象，最终以平台无关的方式来提供通用功能。

当基础设施中的所有服务流量都经过一个Envoy网格时，很容易就可以通过连贯的监测来可视化问题域，调整整体性能，并在单个位置添加基础功能。基本上，Envoy代理是一个可帮助组织为生产环境构建容错系统的服务网格工具。

服务网格应用有很多替代方案，例如Uber的[Linkerd][24]（下面会讨论）和[Istio][25]。 Istio通过将其部署为[Sidecar][26]并利用了[Mixer][27]的配置模型，实现了对Envoy的扩展。 Envoy的显著特性有：

   *所有的“table stakes(入场筹码,引申为基础必备特性)”特性（与控制平面（例如Istio）组合时）
   *带载运行时99%数据可达到低延时
   *将L3/L4过滤器作为核心，支持额外的L7过滤器
   *支持gRPC和HTTP / 2（上行/下行）
   *由API驱动，并支持动态配置和热重载
   *重点关注指标收集，跟踪和整体可监测性


要想了解Envoy，证实其能力并意识到其全部优势，需要丰富的在生产级环境运行的经验。 您可以在[详细文档][28]或访问其[GitHub][11]仓库了解更多信息。

## 孵化项目

下面是最流行的开源的CNCF孵化项目中的六个。

### rkt

rkt, 拼为"rocket", 是一个pod原生的容器引擎。它有一个命令行接口用来在Linux上运行容器。从某种意义上讲，它和其他容器如[Podman][29], Docker和CRI-O相似。

rkt最初由CoreOS开发（后来被Red Hat收购），您可以在其网站上找到详细的[文档][30]，以及在[GitHub][12]上访问其源代码。

### Jaeger 

Jaeger是面向云原生应用的开源的端到端的分布式跟踪系统。 在某种程度上，它是像Prometheus这样的监控解决方案。但它有所不同，因为其使用场景有所扩展：

  * 分布式事务监控
  * 性能和延时优化
  * 根因分析
  * 服务的依赖分析
  * 分布式上下文传播



Jaeger是Uber建立的开源的技术。 您可以在其网站上找到[详细文档][31]，以及在GitHub上找到其[源码][13]。

### Linkerd

像创建Envoy代理的Lyft一样，Uber开发了Linkerd开源解决方案用于生产级的服务维护。在某些方面，Linkerd就像Envoy一样，因为两者都是服务网格工具，旨在提供平台级的可观测性，可靠性和安全性，而无需进行配置或代码更改。

但是，两者之间存在一些细微的差异。 尽管Envoy和Linkerd充当代理并可以通过所连接的服务进行上报，但是Envoy并不像Linkerd那样被设计为Kubernetes Ingress控制器。 Linkerd的显著功能包括：

   *支持多种平台（Docker，Kubernetes，DC / OS，Amazon ECS或单机）
   *内置服务发现抽象将多个系统集成在一起
   *支持gRPC，HTTP / 2和HTTP / 1.x请求和所有的TCP流量


您可以在[Linkerd网站][32]上阅读有关它的更多信息，并在[GitHub][14]上访问其源码。

### Helm

Helm基本上是Kubernetes的软件包管理器。 如果您使用过Apache Maven，Maven Nexus或类似的服务，您就会理解Helm的作用。 Helm可帮助您管理Kubernetes应用程序。 它使用“Helm图”来定义，安装和升级最复杂的Kubernetes应用程序。 Helm并不是实现此功能的唯一方法； 另一个流行的概念是[Kubernetes Operators][33]，它被Red Hat OpenShift 4所使用。

您可以按照其文档中的[快速开始指南][34]或[GitHub指南][15]来试用Helm。

### Etcd

Etcd是用于分布式系统中最关键数据的分布式的，可靠的键值存储。 其主要特性有：

   *定义明确的，面向用户的API（gRPC）
   *客户端证书验证可选的自动TLS
   *速度（可达每秒10,000次写入）
   *可靠性（使用Raft实现分布式）

Etcd是Kubernetes和许多其他技术的默认的内置数据存储方案。也就是说，它很少独立运行或作为单独的服务运行； 相反，它利用了集成到Kubernetes，OKD / OpenShift或其他服务中的一个。 还有[etcd Operator][35]来管理其生命周期并解锁其API管理功能：

您可以在[etcd文档][36]中了解更多信息，并在GitHub上访问其[源码][16]。

### CRI-O

CRI-O是Kubernetes运行时接口的OCI兼容实现。CRI-O用于各种功能，包括：

   *使用runc（或遵从OCI运行时规范的任何实现）和OCI运行时工具运行
   *使用容器/镜像进行镜像管理
   *使用容器/存储来存储和管理镜像层
   *通过容器网络接口（CNI）来提供网络支持

CRI-O提供了大量的[文档][37]，包括指南，教程，文章，甚至播客，您还可以访问其[GitHub页面][17]。

* * *

我错过了其他有趣且开源的云原生项目吗？ 请在评论中提醒我。
--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/cloud-native-projects

作者：[Bryant Son][a]
选题：[lujun9972][b]
译者：[messon007](https://github.com/messon007)
校对：[校对者ID](https://github.com/校对者ID)

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
