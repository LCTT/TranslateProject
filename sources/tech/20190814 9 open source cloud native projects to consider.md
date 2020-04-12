[#]: collector: (lujun9972)
[#]: translator: (messon007)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (9 open source cloud native projects to consider)
[#]: via: (https://opensource.com/article/19/8/cloud-native-projects)
[#]: author: (Bryant Son https://opensource.com/users/brsonhttps://opensource.com/users/marcobravo)

9 open source cloud native projects to consider 值得考虑的9个开源的云原生项目
======
Work with containers? Get familiar with these projects from the Cloud
Native Computing Foundation
工作中使用了容器？熟悉来自云原生计算基金会的这些项目

![clouds in the sky with blue pattern][1]

As the practice of developing applications with containers is getting more popular, [cloud-native applications][2] are also on the rise. By [definition][3]:
随着通过容器开发应用的实践变得流行，[云原生应用][2]也在上升。其定义：
云原生技术被用于开发应用程序，这些程序通过将服务打包在容器中来完成构建，部署为微服务，通过敏捷的DevOps流程和持续集成工作流在弹性基础设施上管理。

> "Cloud-native technologies are used to develop applications built with services packaged in containers, deployed as microservices, and managed on elastic infrastructure through agile DevOps processes and continuous delivery workflows."

This description includes four elements that are integral to cloud-native applications:
这个描述包括构成云原生应用的4个元素：

  1. Container 容器
  2. Microservice 微服务
  3. DevOps DevOps
  4. Continuous integration and continuous delivery (CI/CD) 持续集成和持续交付



Although these technologies have very distinct histories, they complement each other well and have led to surprisingly exponential growth of cloud-native applications and toolsets in a short time. This [Cloud Native Computing Foundation][4] (CNCF) infographic shows the size and breadth of the cloud-native application ecosystem today.
尽管这些技术有非常独特的历史，它们互相补充，共同导致了短时间内的云原生应用和工具的惊人的指数级增长。这个[云原生计算基金会][4]信息图现实了今天的云原生应用生态的规模和广度。

![Cloud-Native Computing Foundation applications ecosystem][5]

Cloud-Native Computing Foundation projects
云原生计算基金会项目

I mean, just look at that! And this is just a start. Just as NodeJS’s creation sparked the explosion of endless JavaScript tools, the popularity of container technology started the exponential growth of cloud-native applications.
我的意思是，留意吧！这仅仅是一个开始。 正如NodeJS的出现引发了无休止的JavaScript工具的爆炸式增长一样，容器技术的普及也推动了云原生应用程序的指数增长。

The good news is that there are several organizations that oversee and connect these dots together. One is the [**Open Containers Initiative (OCI)**][6], which is a lightweight, open governance structure (or project), "formed under the auspices of the Linux Foundation for the express purpose of creating open industry standards around container formats and runtime." The other is the **CNCF**, "an open source software foundation dedicated to making cloud native computing universal and sustainable."
好消息是，有几个组织负责监管这些技术并将它们融合在一起。 其中之一是[** Open Containers Initiative（OCI）**][6]，它是一种轻量级的，开放的治理结构（或项目），“是在Linux基金会的主持下形成的，其明确目的是创建开放的行业标准容器格式和运行时。” 另一个是** CNCF **，“致力于使云原生计算具有通用性和可持续性的开源软件基金会”。

In addition to building a community around cloud-native applications generally, CNCF also helps projects set up structured governance around their cloud-native applications. CNCF created the concept of maturity levels—Sandbox, Incubating, or Graduated—which correspond to the Innovators, Early Adopters, and Early Majority tiers on the diagram below.
除了通常围绕云原生应用建立社区之外，CNCF还帮助项目围绕其云原生应用建立结构化的管理。CNCF创建了成熟度级别的概念（沙箱，孵化或毕业），与下图中的“创新者”，“早期采用者”和“早期多数”层相对应。
![CNCF project maturity levels][7]

CNCF project maturity levels CNCF项目成熟度级别

The CNCF has detailed [criteria][8] for each maturity level (included below for readers’ convenience). A two-thirds supermajority of the Technical Oversight Committee (TOC) is required for a project to be Incubating or Graduated.
CNCF为每个成熟度级别制定了详细的[标准][8]（为方便读者而列在下面）。 获得技术监督委员会（TOC）的三分之二的同意才能转为孵化或毕业项目。

### Sandbox stage 沙箱级

> To be accepted in the sandbox, a project must have at least two TOC sponsors. See the CNCF Sandbox Guidelines v1.0 for the detailed process. 要成为沙箱级，一个项目必须至少有两个TOC赞助商。 有关详细过程，请参见《 CNCF沙箱指南v1.0》。


### Incubating stage 孵化级

> Note: The incubation level is the point at which we expect to perform full due diligence on projects.
>
> To be accepted to incubating stage, a project must meet the sandbox stage requirements plus:
>
>   * Document that it is being used successfully in production by at least three independent end users which, in the TOC’s judgement, are of adequate quality and scope.
>   * Have a healthy number of committers. A committer is defined as someone with the commit bit; i.e., someone who can accept contributions to some or all of the project.
>   * Demonstrate a substantial ongoing flow of commits and merged contributions.
>   * Since these metrics can vary significantly depending on the type, scope, and size of a project, the TOC has final judgement over the level of activity that is adequate to meet these criteria
>
>注意：孵化级是我们期望对项目进行全面尽职调查的起点。
>
>要进入孵化阶段，项目除了满足沙箱阶段的要求之外还要满足：
>
> *证明至少有三个独立的最终用户已成功将其用于生产，且TOC判断这些最终用户具有足够的质量和范围。
> *合入者的数量要合理。合入者定义为具有合入权的人。即可以接受对部分或全部项目贡献的人。
> *演示有大量正在进行的提交和合并的贡献。
> *由于这些指标可能会根据项目的类型，范围和大小而有很大差异，因此TOC对足以满足这些标准的活动级别拥有最终决策权



### Graduated stage 毕业级

> To graduate from sandbox or incubating status, or for a new project to join as a graduated project, a project must meet the incubating stage criteria plus:
>
>   * Have committers from at least two organizations.
>   * Have achieved and maintained a Core Infrastructure Initiative Best Practices Badge.
>   * Have completed an independent and third party security audit with results published of similar scope and quality as the following example (including critical vulnerabilities addressed): <https://github.com/envoyproxy/envoy#security-audit> and all critical vulnerabilities need to be addressed before graduation.
>   * Adopt the CNCF Code of Conduct.
>   * Explicitly define a project governance and committer process. This preferably is laid out in a GOVERNANCE.md file and references an OWNERS.md file showing the current and emeritus committers.
>   * Have a public list of project adopters for at least the primary repo (e.g., ADOPTERS.md or logos on the project website).
>   * Receive a supermajority vote from the TOC to move to graduation stage. Projects can attempt to move directly from sandbox to graduation, if they can demonstrate sufficient maturity. Projects can remain in an incubating state indefinitely, but they are normally expected to graduate within two years.
>
>要从沙箱或孵化状态毕业，或者要使一个新项目作为已毕业项目加入，项目除了必须满足孵化阶段标准外还要满足：
>
> *至少有两个组织的提交者。
> *已获得并维护了“核心基础设施计划最佳实践徽章”。
> *已完成独立和第三方安全审核，并发布了具有与以下示例类似的范围和质量的结果（包括已解决的关键漏洞）：<https://github.com/envoyproxy/envoy#security-audit>和所有关键毕业之前需要解决漏洞。
> *采用CNCF行为准则。
> *明确定义项目治理和提交流程。最好将其排布在GOVERNANCE.md文件中，并引用显示当前提交者和荣誉提交者的OWNERS.md文件。
> *至少有主仓的项目采用者的公开列表（例如，ADOPTERS.md或项目网站上的徽标）。
> *获得TOC的多数票，进入毕业阶段。如果项目能够证明足够的成熟度，则可以尝试直接从沙箱过渡到毕业。项目可以无限期保持孵化状态，但是通常预计它们会在两年内毕业。

## 9 projects to consider 值得考虑的9个项目

While it’s impossible to cover all of the CNCF projects in this article, I’ll describe are nine of most interesting Graduated and Incubating open source projects.
本文不可能涵盖所有的CNCF项目，我将介绍最有趣的9个“毕业和孵化中”的开源项目。

Name | License | What It Is
名称|授权类型|简要描述
---|---|---
[Kubernetes][9] | Apache 2.0 | Orchestration platform for containers 容器编排平台
[Prometheus][10] | Apache 2.0 | Systems and service monitoring tool 系统和服务监控工具
[Envoy][11] | Apache 2.0 | Edge and service proxy 边缘和服务代理
[rkt][12] | Apache 2.0 | Pod-native container engine Pod原生的容器引擎
[Jaeger][13] | Apache 2.0 | Distributed tracing system 分布式跟踪系统
[Linkerd][14] | Apache 2.0 | Transparent service mesh 无感服务网格
[Helm][15] | Apache 2.0 | Kubernetes package manager K8s包管理器
[Etcd][16] | Apache 2.0 | Distributed key-value store 分布式键值存储
[CRI-O][17] | Apache 2.0 | Lightweight runtime for Kubernetes 专门用于K8s的轻量级运行时环境

I also created this video tutorial to walk through these projects.
我也创建了这个视频材料来介绍这些项目。

## Graduated projects 毕业项目

Graduated projects are considered mature—adopted by many organizations—and must adhere to the CNCF’s guidelines. Following are three of the most popular open source CNCF Graduated projects. (Note that some of these descriptions are adapted and reused from the projects' websites.)
已毕业的项目被认为是成熟的，已被许多组织采用的，并且严格遵守了CNCF的准则。 以下是三个最受欢迎的开源CNCF毕业项目。 （请注意，其中一些描述来源于项目的网站并被做了改编。）

### Kubernetes K8S

Ah, Kubernetes. How can we talk about cloud-native applications without mentioning Kubernetes? Invented by Google, Kubernetes is undoubtedly the most famous container-orchestration platform for container-based applications, and it is also an open source tool.
Kubernetes。我们如何在不提及Kubernetes的情况下谈论云原生应用程序？ Google发明的Kubernetes无疑是最著名的基于容器的应用程序的容器编排平台，而且它还是一个开源工具。

What is a container orchestration platform? Basically, a container engine on its own may be okay for managing a few containers. However, when you are talking about thousands of containers and hundreds of services, managing those containers becomes super complicated. This is where the container engine comes in. The container-orchestration engine helps scale containers by automating the deployment, management, networking, and availability of containers.
什么是容器编排平台？ 通常，一个容器引擎本身可以管理几个容器。 但是，当您谈论数千个容器和数百个服务时，管理这些容器变得非常复杂。 这就是容器编排引擎的用武之地。容器编排引擎通过自动化容器的部署，管理，网络和可用性来帮助管理大量的容器。

Docker Swarm and Mesosphere Marathon are other container-orchestration engines, but it is safe to say that Kubernetes has won the race (at least for now). Kubernetes also gave birth to Container-as-a-Service (CaaS) platforms like [OKD][18], the Origin community distribution of Kubernetes that powers [Red Hat OpenShift][19].
Docker Swarm和Mesosphere Marathon也是容器编排引擎，但是可以肯定地说Kubernetes在竞争中胜出（至少现在是这样）。Kubernetes还诞生了容器即服务（CaaS）平台如[OKD][18]，它是Origin社区针对Kubernetes的发行版，并成了[Red Hat OpenShift][19]的一部分。

To get started, visit the [Kubernetes GitHub repository][9], and access its documentation and learning resources from the [Kubernetes documentation][20] page.
想开始学习请访问[Kubernetes GitHub仓库][9]，并从[Kubernetes文档][20]页面访问其文档和学习资源。

### Prometheus

Prometheus is an open source system monitoring and alerting toolkit built at SoundCloud in 2012. Since then, many companies and organizations have adopted Prometheus, and the project has a very active developer and user community. It is now a standalone open source project that is maintained independently of the company.
Prometheus是2012年在SoundCloud上构建的一个开源系统监控和告警工具。之后，许多公司和组织都使用了Prometheus，并且该项目拥有非常活跃的开发者和用户群体。 现在，它是一个独立于公司的独立维护的开源项目。

![Prometheus’ architecture][21]

Prometheus’ architecture Prometheus的架构

The easiest way to think about Prometheus is to visualize a production system that needs to be up 24 hours a day and 365 days a year. No system is perfect, and there are techniques to reduce failures (called fault-tolerant systems). However, if an issue occurs, the most important thing is to identify it as soon as possible. That is where a monitoring tool like Prometheus comes in handy. Prometheus is more than a container-monitoring tool, but it is most popular among cloud-native application companies. In addition, other open source monitoring tools, including [Grafana][22], leverage Prometheus.
理解Prometheus的最简单方法是可视化一个生产系统，该系统需要24(小时)x365天都可以正常运行。 没有哪个系统是完美的，也有减少故障的技术（称为容错系统）。 但是，如果出现问题，最重要的是尽快识别它。 这就是像Prometheus这样的监控工具的用武之地。Prometheus不仅是容器监控工具，它在云原生应用公司中也最受欢迎。 此外，其他开源监视工具，包括[Grafana][22]，都借鉴了Prometheus。
The best way to get started with Prometheus is to check out its [GitHub repo][10]. Running Prometheus locally is easy, but you need to have a container engine installed. You can access detailed documentation on [Prometheus’ website][23].
开始使用Prometheus的最佳方法是下载其[GitHub仓库][10]。 在本地运行Prometheus很容易，但是您需要安装一个容器引擎。 您可以在[Prometheus网站][23]上查看详细的文档。

### Envoy

Envoy (or Envoy Proxy) is an open source edge and service proxy designed for cloud-native applications. Created at Lyft, Envoy is a high-performance, C++, distributed proxy designed for single services and applications, as well as a communications bus and a universal data plane designed for large microservice service mesh architectures. Built on the learnings of solutions such as Nginx, HAProxy, hardware load balancers, and cloud load balancers, Envoy runs alongside every application and abstracts the network by providing common features in a platform-agnostic manner.
Envoy（或Envoy代理）是专为云原生应用设计的开源的边缘代理和服务代理。 由Lyft创建的Envoy是为单一服务和应用而设计的高性能的C++分布式代理，同时也是为由大量微服务组成的服务网格架构而设计的通信总线和通用数据平面。 基于对Nginx，HAProxy，硬件负载均衡器和云负载均衡器等方案了解的基础上，Envoy与每个应用相伴(并行)运行，并对网络进行了高度抽象，最终以平台无关的方式来提供通用功能。

When all service traffic in an infrastructure flows through an Envoy mesh, it becomes easy to visualize problem areas via consistent observability, tune overall performance, and add substrate features in a single place. Basically, Envoy Proxy is a service mesh tool that helps organizations build a fault-tolerant system for production environments.
当基础设施中的所有服务流量都经过一个Envoy网格时，很容易就可以通过连贯的监测来可视化问题域，调整整体性能，并在单个位置添加基础功能。基本上，Envoy代理是一个可帮助组织为生产环境构建容错系统的服务网格工具。

There are numerous alternatives for service mesh applications, such as Uber’s [Linkerd][24] (discussed below) and [Istio][25]. Istio extends Envoy Proxy by deploying as a [Sidecar][26] and leveraging the [Mixer][27] configuration model. Notable Envoy features are:

  * All the "table stakes" features (when paired with a control plane, like Istio) are included
  * Low, 99th percentile latencies at scale when running under load
  * Acts as an L3/L4 filter at its core with many L7 filters provided out of the box
  * Support for gRPC and HTTP/2 (upstream/downstream)
  * It’s API-driven and supports dynamic configuration and hot reloads
  * Has a strong focus on metric collection, tracing, and overall observability

服务网格应用程序有很多替代方案，例如Uber的[Linkerd][24]（下面会讨论）和[Istio][25]。 Istio通过将其部署为[Sidecar][26]并利用了[Mixer][27]的配置模型，实现了对Envoy的扩展。 Envoy的显著特性有：

   *所有的“table stakes(入场筹码,引申为基础必备特性)”特性（与控制平面（例如Istio）组合时）
   *带载运行时99%数据可达到低延时
   *将L3/L4过滤器作为核心，支持额外的L7过滤器
   *支持gRPC和HTTP / 2（上行/下行）
   *由API驱动，并支持动态配置和热重载
   *重点关注指标收集，跟踪和整体可监测性


Understanding Envoy, proving its capabilities, and realizing its full benefits require extensive experience with running production-level environments. You can learn more in its [detailed documentation][28] and by accessing its [GitHub][11] repository.
要想了解Envoy，证实其能力并意识到其全部优势，需要丰富的在生产级环境运行的经验。 您可以在[详细文档][28]或访问其[GitHub][11]仓库了解更多信息。

## Incubating projects 孵化项目

Following are six of the most popular open source CNCF Incubating projects. 
下面是最流行的开源的CNCF孵化项目中的六个。

### rkt

rkt, pronounced "rocket," is a pod-native container engine. It has a command-line interface (CLI) for running containers on Linux. In a sense, it is similar to other containers, like [Podman][29], Docker, and CRI-O.
rkt, 拼为"rocket", 是一个pod原生的容器引擎。它有一个命令行接口用来在Linux上运行容器。从某种意义上讲，它和其他容器如[Podman][29], Docker和CRI-O相似。

rkt was originally developed by CoreOS (later acquired by Red Hat), and you can find detailed [documentation][30] on its website and access the source code on [GitHub][12].
rkt最初由CoreOS开发（后来被Red Hat收购），您可以在其网站上找到详细的[文档][30]，以及在[GitHub][12]上访问其源代码。

### Jaeger 

Jaeger is an open source, end-to-end distributed tracing system for cloud-native applications. In one way, it is a monitoring solution like Prometheus. Yet it is different because its use cases extend into:
Jaeger是面向云原生应用的开源的端到端的分布式跟踪系统。 在某种程度上，它是像Prometheus这样的监控解决方案。但它有所不同，因为其使用场景有所扩展：

  * Distributed transaction monitoring 分布式事务监控
  * Performance and latency optimization 性能和延时优化
  * Root-cause analysis 根因分析
  * Service dependency analysis 服务的依赖分析
  * Distributed context propagation 分布式上下文传播



Jaeger is an open source technology built by Uber. You can find [detailed documentation][31] on its website and its [source code][13] on GitHub.
Jaeger是Uber建立的开源的技术。 您可以在其网站上找到[详细文档][31]，以及在GitHub上找到其[源码][13]。

### Linkerd

Like Lyft with Envoy Proxy, Uber developed Linkerd as an open source solution to maintain its service at the production level. In some ways, Linkerd is just like Envoy, as both are service mesh tools designed to give platform-wide observability, reliability, and security without requiring configuration or code changes.

However, there are some subtle differences between the two. While Envoy and Linkerd function as proxies and can report over services that are connected, Envoy isn’t designed to be a Kubernetes Ingress controller, as Linkerd is. Notable features of Linkerd include:

  * Support for multiple platforms (Docker, Kubernetes, DC/OS, Amazon ECS, or any stand-alone machine)
  * Built-in service discovery abstractions to unite multiple systems
  * Support for gRPC, HTTP/2, and HTTP/1.x requests plus all TCP traffic

像创建Envoy代理的Lyft一样，Uber开发了Linkerd开源解决方案用于生产级别上的服务维护。 在某些方面，Linkerd就像Envoy一样，因为两者都是服务网格工具，旨在提供平台级的可观测性，可靠性和安全性，而无需进行配置或代码更改。

但是，两者之间存在一些细微的差异。 尽管Envoy和Linkerd充当代理并可以通过所连接的服务进行上报，但是Envoy并不像Linkerd那样被设计为Kubernetes Ingress控制器。 Linkerd的显著功能包括：

   *支持多种平台（Docker，Kubernetes，DC / OS，Amazon ECS或单机）
   *内置服务发现抽象将多个系统集成在一起
   *支持gRPC，HTTP / 2和HTTP / 1.x请求和所有的TCP流量


You can read more about it on [Linkerd’s website][32] and access its source code on [GitHub][14].
您可以在[Linkerd网站][32]上阅读有关它的更多信息，并在[GitHub][14]上访问其源码。

### Helm

Helm is basically the package manager for Kubernetes. If you’ve used Apache Maven, Maven Nexus, or a similar service, you will understand Helm’s purpose. Helm helps you manage your Kubernetes application. It uses "Helm Charts" to define, install, and upgrade even the most complex Kubernetes applications. Helm isn’t the only method for this; another concept becoming popular is [Kubernetes Operators][33], which are used by Red Hat OpenShift 4.

You can try Helm by following the [quickstart guide][34] in its documentation or its [GitHub guide][15].

Helm基本上是Kubernetes的软件包管理器。 如果您使用过Apache Maven，Maven Nexus或类似的服务，您就会理解Helm的作用。 Helm可帮助您管理Kubernetes应用程序。 它使用“Helm图”来定义，安装和升级最复杂的Kubernetes应用程序。 Helm并不是实现此功能的唯一方法； 另一个流行的概念是[Kubernetes Operators][33]，它被Red Hat OpenShift 4所使用。

您可以按照其文档中的[快速开始指南][34]或[GitHub指南][15]来试用Helm。

### Etcd

Etcd is a distributed, reliable key-value store for the most critical data in a distributed system. Its key features are:

  * Well-defined, user-facing API (gRPC)
  * Automatic TLS with optional client certificate authentication
  * Speed (benchmarked at 10,000 writes per second)
  * Reliability (distributed using Raft)

Etcd是用于分布式系统中最关键数据的分布式的，可靠的键值存储。 其主要特性有：

   *定义明确的，面向用户的API（gRPC）
   *客户端证书验证可选的自动TLS
   *速度（可达每秒10,000次写入）
   *可靠性（使用Raft实现分布式）

Etcd is used as a built-in default data storage for Kubernetes and many other technologies. That said, it is rarely run independently or as a separate service; instead, it utilizes the one integrated into Kubernetes, OKD/OpenShift, or another service. There is also an [etcd Operator][35] to manage its lifecycle and unlock its API management capabilities:

Etcd是Kubernetes和许多其他技术的默认的内置数据存储方案。也就是说，它很少独立运行或作为单独的服务运行； 相反，它利用了集成到Kubernetes，OKD / OpenShift或其他服务中的一个。 还有[etcd Operator][35]来管理其生命周期并解锁其API管理功能：
You can learn more in [etcd’s documentation][36] and access its [source code][16] on GitHub.
您可以在[etcd文档][36]中了解更多信息，并在GitHub上访问其[源码][16]。

### CRI-O

CRI-O is an Open Container Initiative (OCI)-compliant implementation of the Kubernetes runtime interface. CRI-O is used for various functions including:

  * Runtime using runc (or any OCI runtime-spec implementation) and OCI runtime tools
  * Image management using containers/image
  * Storage and management of image layers using containers/storage
  * Networking support through the Container Network Interface (CNI)

CRI-O是Kubernetes运行时接口的兼容开放容器倡议（OCI）实现。 CRI-O用于各种功能，包括：

   *使用runc（或遵从OCI运行时规范的任何实现）和OCI运行时工具运行
   *使用容器/镜像进行镜像管理
   *使用容器/存储来存储和管理镜像层
   *通过容器网络接口（CNI）来提供网络支持

CRI-O provides plenty of [documentation][37], including guides, tutorials, articles, and even podcasts, and you can also access its [GitHub page][17].
CRI-O提供了大量的[文档][37]，包括指南，教程，文章，甚至播客，您还可以访问其[GitHub页面][17]。

* * *

Did I miss an interesting open source cloud-native project? Please let me know in the comments.
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
