轻松应对 Linux 容器性能
============================================================

 ![Performance made easy with Linux containers](https://opensource.com/sites/default/files/styles/image-full-size/public/containers_scale_performance.jpg?itok=A9RwUOXA "Performance made easy with Linux containers") 
图片来源： CC0 Public Domain

应用程序的性能决定了软件能多快完成预期任务。这回答有关应用程序的几个问题，例如：

*   峰值负载下的响应时间
*   与替代方案相比，它易于使用，受支持的功能和用例
*   操作成本（CPU使用率、内存需求、数据吞吐量、带宽等）

该性能分析的价值超出了服务负载所需的计算资源的估计或满足峰值需求所需的应用实例数量。性能显然与成功企业的基本要素挂钩。它通知用户的总体体验，包括确定什么会拖慢客户预期的响应时间，通过设计满足带宽要求的内容交付来提高客户粘性，选择最佳设备，最终帮助企业发展业务。

### 问题

当然，这是对业务服务性能工程价值的过度简化。要了解完成我刚刚描述的挑战，让我们来做一个真正的，有点复杂的事情。

 ![Cloud scale performance](https://opensource.com/sites/default/files/cloud_scale_performance.jpg "Cloud scale performance") 

现实世界的应用程序可能托管在云端。应用程序可以利用非常大（或概念上无穷大）的计算资源。在硬件和软件方面的需求将通过云来满足。从事开发工作的开发人员将使用云提供的功能来实现更快的编码和部署。云托管不是免费的，但成本开销与应用程序的资源需求成正比。

搜索即服务（SaaS）、平台即服务（PaaS）、基础设施即服务（IaaS）以及负载平衡即服务（LBaaS），它是当云端管理托管程序的流量，开发人员可能还会使用这些快速增长的云服务中的一个或多个：

*   安全即服务 （SECaaS），可满足软件和用户的安全需求
*   数据即服务 （DaaS），提供用户的应用需求数据
*   登录即服务 （LaaS），DaaS 的近亲，提供有关日志传送和使用的分析指标
*   搜索即服务 （SaaS），用于应用程序的分析和大数据需求
*   网络即服务 （NaaS），用于通过公共网络发送和接收数据

云服务也呈指数级增长，因为它们使编写复杂应用程序的开发人员更容易。除了软件复杂性之外，所有这些分布式组件的相互作用变得越来越多。用户群变得更加多元化。该软件的要求列表变得更长。对其他服务的依赖性变大。由于这些因素，这个生态系统的缺陷会引发性能问题的多米诺效应。

例如，假设你有一个精心编写的应用程序，它遵循安全编码实践，旨在满足不同的负载要求，并经过彻底测试。另外假设你已经将基础架构和分析工作结合起来，以支持基本的性能要求。在系统的实现、设计和架构中建立性能标准需要做些什么？软件如何跟上不断变化的市场需求和新兴技术？如何测量关键参数以调整系统以获得最佳性能？如何使系统具有弹性和自我恢复能力？你如何更快地识别任何潜在的性能问题，并尽早解决？

### 进入容器

软件[容器][2]以[微服务][3]设计或面向服务的架构（SoA）的优点为基础，提高了性能，因为包含更小，自足的代码块的系统更容易编码，对其他系统组件有更清晰、定义良好的依赖。测试更容易，包括围绕资源利用和内存过度消耗的问题比在宏架构中更容易确定。

当伸缩系统以增加负载时，容器应用程序复制快速而简单。安全漏洞能更好地隔离。补丁可以独立版本化并快速部署。性能监控更有针对性，测量更可靠。你还可以重写和“改版”资源密集型代码，以满足不断变化的性能要求。

容器启动快速，停止也快速。它比虚拟机（VM）有更高效资源利用和更好的进程隔离。容器没有空闲内存和 CPU 开销。它们允许多个应用程序共享机器，而不会丢失数据或性能。容器使应用程序可移植，因此开发人员可以构建并将应用程序发送到任何支持容器技术 Linux 的服务器上，而不必担心性能损失。容器以它们的形式存在，并遵守其集群管理器（如 Cloud Foundry 的 Diego、[Kubernetes][4]、Apache Mesos 和 Docker Swarm）所规定的配额（比如包括存储、计算和对象计数配额）。

虽然容器在性能方面表现出色，但即将到来的 “serverless” 计算（也称为功能即服务（FaaS））的浪潮将扩大容器的优势。在 FaaS 时代，这些临时性或短期的容器将带来超越应用程序性能的优势，直接转化为在云中托管的间接成本的节省。如果容器的工作更快，那么它的寿命就会更短，而且计算量负载纯粹是按需的。

--------------------------------------------------------------------------------

作者简介：

Garima 是 Red Hat 的工程经理，专注于 OpenShift 容器平台。在加入 Red Hat 之前，Garima 帮助 Akamai Technologies＆MathWorks Inc. 开创了创新。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/2/performance-container-world

作者：[Garima][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/garimavsharma
[1]:https://opensource.com/article/17/2/performance-container-world?rate=RozKaIY39AZNxbayqFkUmtkkhoGdctOVuGOAJqVJII8
[2]:https://opensource.com/resources/what-are-linux-containers
[3]:https://opensource.com/resources/what-are-microservices
[4]:https://opensource.com/resources/what-is-kubernetes
[5]:https://opensource.com/user/109286/feed
[6]:https://opensource.com/article/17/2/performance-container-world#comments
[7]:https://opensource.com/users/garimavsharma
