为何 Kubernetes 如此受欢迎？
============================================================

> Google 开发的这个容器管理系统很快成为开源历史上最成功的案例之一。

![Why is Kubernetes so popular?](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/running-containers-two-ship-container-beach.png?itok=wr4zJC6p "Why is Kubernetes so popular?")

图片来源： RIkki Endsley. [CC BY-SA 4.0][7]

[Kubernetes][8] 是一个在过去几年中快速蹿升起来的开源的容器管理系统。它被众多行业中最大的企业用于关键任务，已成为开源方面最成功的案例之一。这是怎么发生的？该如何解释 Kubernetes 的广泛应用呢？

### Kubernetes 的背景：起源于 Google 的 Borg 系统

随着计算世界变得更加分布式、更加基于网络、以及更多的云计算，我们看到了大型的<ruby>独石<rt>monolithic</rt></ruby>应用慢慢地转化为多个敏捷微服务。这些微服务能让用户单独缩放应用程序的关键功能，以处理数百万客户。除此之外，我们还看到像 Docker 这样的容器等技术出现在企业中，为用户快速构建这些微服务创造了一致的、可移植的、便捷的方式。

随着 Docker 继续蓬勃发展，管理这些微服务器和容器成为最重要的要求。这时已经运行基于容器的基础设施已经多年的 Google 大胆地决定开源一个名为 [Borg][15] 的项目。Borg 系统是运行诸如 Google 搜索和 Gmail 这样的 Google 服务的关键。谷歌决定开源其基础设施为世界上任何一家公司创造了一种像顶尖公司一样运行其基础架构的方式。

### 最大的开源社区之一

在开源之后，Kubernetes 发现自己在与其他容器管理系统竞争，即 Docker Swarm 和 Apache Mesos。Kubernetes 近几个月来超过这些其他系统的原因之一得益于社区和系统背后的支持：它是最大的开源社区之一（GitHub 上超过 27,000 多个星标），有来自上千个组织（1,409 个贡献者）的贡献，并且被集中在一个大型、中立的开源基金会里，即[原生云计算基金会][9]（CNCF）。

CNCF 也是更大的 Linux 基金会的一部分，拥有一些顶级企业成员，其中包括微软、谷歌和亚马逊。此外，CNCF 的企业成员队伍持续增长，SAP 和 Oracle 在过去几个月内加入白金会员。这些加入 CNCF 的公司，其中 Kubernetes 项目是前沿和中心的，这证明了有多少企业投注于社区来实现云计算战略的一部分。

Kubernetes 外围的企业社区也在激增，供应商提供了带有更多的安全性、可管理性和支持的企业版。Red Hat、CoreOS 和 Platform 9 是少数几个使企业级 Kubernetes 成为战略前进的关键因素，并投入巨资以确保开源项目继续得到维护的公司。

### 混合云带来的好处

企业以这样一个飞速的方式采用 Kubernetes 的另一个原因是 Kubernetes 可以在任何云端工作。大多数企业在现有的内部数据中心和公共云之间共享资产，对混合云技术的需求至关重要。

Kubernetes 可以部署在公司先前存在的数据中心内、任意一个公共云环境、甚至可以作为服务运行。由于 Kubernetes 抽象了底层基础架构层，开发人员可以专注于构建应用程序，然后将它们部署到任何这些环境中。这有助于加速公司的 Kubernetes 采用，因为它可以在内部运行 Kubernetes，同时继续构建云战略。

### 现实世界的案例

Kubernetes 继续增长的另一个原因是，大型公司正在利用这项技术来解决业界最大的挑战。Capital One、Pearson Education 和 Ancestry.com 只是少数几家公布了 Kubernetes [使用案例][10]的公司。

[Pokemon Go][11] 是最流行的宣传 Kubernetes 能力的使用案例。在它发布之前，人们都觉得在线多人游戏会相当的得到追捧。但当它一旦发布，就像火箭一样起飞，达到了预期流量的 50 倍。通过使用 Kubernetes 作为 Google Cloud 之上的基础设施层，Pokemon Go 可以大规模扩展以满足意想不到的需求。

最初作为来自 Google 的开源项目，背后有 Google 15 年的服务经验和来自 Borg 的继承- Kubernetes 现在是有许多企业成员的大型基金会（CNCF）的一部分。它继续受到欢迎，并被广泛应用于金融、大型多人在线游戏（如 Pokemon Go）以及教育公司和传统企业 IT 的关键任务中。考虑到所有，所有的迹象表明，Kubernetes 将继续更加流行，并仍然是开源中最大的成功案例之一。

--------------------------------------------------------------------------------

作者简介：

Anurag Gupta - Anurag Gupta 是推动统一日志层 Fluentd Enterprise 发展的 Treasure Data 的产品经理。 Anurag 致力于大型数据技术，包括 Azure Log Analytics 和如 Microsoft System Center 的企业 IT 服务。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/10/why-kubernetes-so-popular

作者：[Anurag Gupta][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/anuraggupta
[1]:https://opensource.com/resources/what-are-linux-containers?utm_campaign=containers&intcmp=70160000000h1s6AAA
[2]:https://opensource.com/resources/what-docker?utm_campaign=containers&intcmp=70160000000h1s6AAA
[3]:https://opensource.com/resources/what-is-kubernetes?utm_campaign=containers&intcmp=70160000000h1s6AAA
[4]:https://developers.redhat.com/blog/2016/01/13/a-practical-introduction-to-docker-container-terminology/?utm_campaign=containers&intcmp=70160000000h1s6AAA
[5]:https://opensource.com/article/17/10/why-kubernetes-so-popular?rate=LM949RNFmORuG0I79_mgyXiVXrdDqSxIQjOReJ9_SbE
[6]:https://opensource.com/user/171186/feed
[7]:https://creativecommons.org/licenses/by-sa/4.0/
[8]:https://kubernetes.io/
[9]:https://www.cncf.io/
[10]:https://kubernetes.io/case-studies/
[11]:https://cloudplatform.googleblog.com/2016/09/bringing-Pokemon-GO-to-life-on-Google-Cloud.html
[12]:https://opensource.com/users/anuraggupta
[13]:https://opensource.com/users/anuraggupta
[14]:https://opensource.com/article/17/10/why-kubernetes-so-popular#comments
[15]:http://queue.acm.org/detail.cfm?id=2898444
