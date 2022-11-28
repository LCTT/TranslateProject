[#]: subject: (Why you should care about service mesh)
[#]: via: (https://opensource.com/article/21/3/service-mesh)
[#]: author: (Daniel Oh https://opensource.com/users/daniel-oh)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13261-1.html)

为什么需要关心服务网格
======

> 在微服务环境中，服务网格为开发和运营提供了好处。

![](https://img.linux.net.cn/data/attachment/album/202104/02/201409os5r13omp5p5bssb.jpg)

很多开发者不知道为什么要关心<ruby>[服务网格][2]<rt>Service Mesh</rt></ruby>。这是我在开发者见面会、会议和实践研讨会上关于云原生架构的微服务开发的演讲中经常被问到的问题。我的回答总是一样的：“只要你想简化你的微服务架构，它就应该运行在 Kubernetes 上。”

关于简化，你可能也想知道，为什么分布式微服务必须设计得如此复杂才能在 Kubernetes 集群上运行。正如本文所解释的那样，许多开发人员通过服务网格解决了微服务架构的复杂性，并通过在生产中采用服务网格获得了额外的好处。

### 什么是服务网格？

服务网格是一个专门的基础设施层，用于提供一个透明的、独立于代码的 （polyglot） 方式，以消除应用代码中的非功能性微服务能力。

![Before and After Service Mesh][3]

### 为什么服务网格对开发者很重要

当开发人员将微服务部署到云时，无论业务功能如何，他们都必须解决非功能性微服务功能，以避免级联故障。这些功能通常可以体现在服务发现、日志、监控、<ruby>韧性<rt>resiliency</rt></ruby>、认证、<ruby>弹性<rt>elasticity</rt></ruby>和跟踪等方面。开发人员必须花费更多的时间将它们添加到每个微服务中，而不是开发实际的业务逻辑，这使得微服务变得沉重而复杂。

随着企业加速向云计算转移，服务网格 可以提高开发人员的生产力。Kubernetes 加服务网格平台不需要让服务负责处理这些复杂的问题，也不需要在每个服务中添加更多的代码来处理云原生的问题，而是负责向运行在该平台上的任何应用（现有的或新的，用任何编程语言或框架）提供这些服务。那么微服务就可以轻量级，专注于其业务逻辑，而不是云原生的复杂性。

### 为什么服务网格对运维很重要

这并没有回答为什么运维团队需要关心在 Kubernetes 上运行云原生微服务的服务网格。因为运维团队必须确保在 Kubernetes 环境上的大型混合云和多云上部署新的云原生应用的强大安全性、合规性和可观察性。

服务网格由一个用于管理代理路由流量的控制平面和一个用于注入<ruby>边车<rt>Sidecar</rt></ruby>的数据平面组成。边车允许运维团队做一些比如添加第三方安全工具和追踪所有服务通信中的流量，以避免安全漏洞或合规问题。服务网格还可以通过在图形面板上可视化地跟踪指标来提高观察能力。

### 如何开始使用服务网格

对于开发者和运维人员，以及从应用开发到平台运维来说，服务网格可以更有效地管理云原生功能。

你可能想知道从哪里开始采用服务网格来配合你的微服务应用和架构。幸运的是，有许多开源的服务网格项目。许多云服务提供商也在他们的 Kubernetes 平台中提供 服务网格。

![CNCF Service Mesh Landscape][5]

你可以在 [CNCF Service Mesh Landscape][6] 页面中找到最受欢迎的服务网格项目和服务的链接。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/service-mesh

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_analytics_cloud.png?itok=eE4uIoaB (Net catching 1s and 0s or data in the clouds)
[2]: https://www.redhat.com/en/topics/microservices/what-is-a-service-mesh
[3]: https://opensource.com/sites/default/files/uploads/vm-vs-service-mesh.png (Before and After Service Mesh)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/uploads/service-mesh-providers.png (CNCF Service Mesh Landscape)
[6]: https://landscape.cncf.io/card-mode?category=service-mesh&grouping=category
