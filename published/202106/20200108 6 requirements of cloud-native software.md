[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13497-1.html)
[#]: subject: (6 requirements of cloud-native software)
[#]: via: (https://opensource.com/article/20/1/cloud-native-software)
[#]: author: (Daniel Oh https://opensource.com/users/daniel-oh)

云原生软件的 6 个要求
======

> 开发和实施云原生（容器优先）软件的检查清单。

![](https://img.linux.net.cn/data/attachment/album/202106/18/101348dcjg3u7wugo5uouw.jpg)

许多年来，单体应用是实现业务需求的标准企业架构。但是，当云基础设施开始以规模和速度为业务加速，这种情况就发生了重大变化。应用架构也发生了转变，以适应云原生应用和 [微服务][2]、[无服务器][3] 以及事件驱动的服务，这些服务运行在跨混合云和多云平台的不可变的基础设施上。

### 云原生与 Kubernetes 的联系

根据 [云原生计算基金会][4] （CNCF） 的说法：

> “云原生技术使企业能够在现代动态环境中建立和运行可扩展的应用，如公共云、私有云和混合云。容器、服务网格、微服务、不可变的基础设施和声明式 API 就是这种方法的典范。”
>
> “这些技术使松散耦合的系统具有弹性、可管理和可观察性。与强大的自动化相结合，它们使工程师能够以最小的工作量频繁地、可预测地进行重要的改变。”

像 [Kubernetes][5] 这样的容器编排平台允许 DevOps 团队建立不可变的基础设施，以开发、部署和管理应用服务。现在，快速迭代的速度与业务需求相一致。构建容器以在 Kubernetes 中运行的开发人员需要一个有效的地方来完成。

### 云原生软件的要求

创建云原生应用架构需要哪些能力，开发人员将从中获得哪些好处？

虽然构建和架构云原生应用的方法有很多，但以下是一些需要考虑的部分：

  * **运行时：** 它们更多是以容器优先或/和 Kubernetes 原生语言编写的，这意味着运行时会如 Java、Node.js、Go、Python 和 Ruby。
  * **安全：** 在多云或混合云应用环境中部署和维护应用时，安全是最重要的，应该是环境的一部分。
  * **可观察性：** 使用 Prometheus、Grafana 和 Kiali 等工具，这些工具可以通过提供实时指标和有关应用在云中的使用和行为的更多信息来增强可观察性。
  * **效率：** 专注于极小的内存占用、更小的构件大小和快速启动时间，使应用可跨混合/多云平台移植。
  * **互操作性：** 将云原生应用与能够满足上述要求的开源技术相结合，包括 Infinispan、MicroProfile、Hibernate、Kafka、Jaeger、Prometheus 等，以构建标准运行时架构。
  * **DevOps/DevSecOps：** 这些方法论是为持续部署到生产而设计的，与最小可行产品 （MVP） 一致，并将安全作为工具的一部分。

### 让云原生具体化

云原生似乎是一个抽象的术语，但回顾一下定义并像开发人员一样思考可以使其更加具体。为了使云原生应用获得成功，它们需要包括一长串定义明确的组成清单。

你是如何规划云原生应用的设计的？在评论中分享你的想法。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/cloud-native-software

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/checklist_todo_clock_time_team.png?itok=1z528Q0y (Team checklist)
[2]: https://opensource.com/resources/what-are-microservices
[3]: https://opensource.com/article/18/11/open-source-serverless-platforms
[4]: https://github.com/cncf/toc/blob/master/DEFINITION.md
[5]: https://opensource.com/resources/what-is-kubernetes
