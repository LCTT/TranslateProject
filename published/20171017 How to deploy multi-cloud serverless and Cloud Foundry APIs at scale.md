如何成规模地部署多云的无服务器程序和 Cloud Foundry API
============================================================

> IBM 的 Ken Parmelee 说：“微服务和 API 是产品，我们需要以这种方式思考。”

领导 IBM 的 API 网关和 Big Blue 开源项目的的 Ken Parmelee 对以开源方式 “进攻” API 以及如何创建微服务和使其伸缩有一些思考。

Parmelee 说：“微服务和 API 是产品，我们需要以这种方式思考这些问题。当你开始这么做，人们依赖它作为它们业务的一部分。这是你在这个领域所做的关键方面。”

![](http://superuser.openstack.org/wp-content/uploads/2017/10/Screen-Shot-2017-10-16-at-10.49.26-595x277.png)

他在最近的[北欧 APIs 2017 平台峰会][3]登上讲台，并挑战了一些流行的观念。

“快速失败不是一个很好的概念。你想在第一场比赛中获得一些非常棒的东西。这并不意味着你需要花费大量的时间，而是应该让它变得非常棒，然后不断的发展和改进。如果一开始真的很糟糕，人们就不会想要用你。”

他谈及包括 [OpenWhisk][4] 在内的 IBM 现代无服务器架构，这是一个 IBM 和 Apache 之间的开源伙伴关系。 云优先的基于分布式事件的编程服务是这两年多来重点关注这个领域的成果；IBM 是该领域领先的贡献者，它是 IBM 云服务的基础。它提供基础设施即服务（IaaS）、自动缩放、为多种语言提供支持、用户只需支付实际使用费用即可。这次旅程充满了挑战，因为他们发现服务器操作需要安全、并且需要轻松 —— 匿名访问、缺少使用路径、固定的 URL 格式等。

任何人都可以在 30 秒内在 [https://console.bluemix.net/openwhisk/][5] 上尝试这些无服务器 API。“这听起来很有噱头，但这是很容易做到的。我们正在结合 [Cloud Foundry 中完成的工作][6]，并在 OpenWhisk 下的 Bluemix 中发布了它们，以提供安全性和可扩展性。”

他说：“灵活性对于微服务也是非常重要的。 当你使用 API 在现实世界中工作时，你开始需要跨云进行扩展。”这意味着从你的内部云走向公共云，并且“对你要怎么做有一个实在的概念很重要”。

![](http://superuser.openstack.org/wp-content/uploads/2017/10/Screen-Shot-2017-10-16-at-14.51.06-595x274.png)

在思考“任何云概念”的时候，他警告说，不是“将其放入一个 Docker 容器，并到处运行。这很棒，但需要在这些环境中有效运行。Docker 和 Kubernetes 有提供了很多帮助，但是你想要你的操作方式付诸实施。” 提前考虑 API 的使用，无论是在内部运行还是扩展到公有云并可以公开调用 - 你需要有这样的“架构观”，他补充道。

Parmelee 说：“我们都希望我们所创造的有价值，并被广泛使用。” API 越成功，将其提升到更高水平的挑战就越大。

![](http://superuser.openstack.org/wp-content/uploads/2017/10/Screen-Shot-2017-10-16-at-15.01.00-595x299.png)

*API 是微服务或“服务间”的组成部分。*

他说，API 的未来是原生云的 - 无论你从哪里开始。关键因素是可扩展性，简化后端管理，降低成本，避免厂商锁定。

你可以在下面或在 [YouTube][7] 观看他整整 23 分钟的演讲。

--------------------------------------------------------------------------------

via: http://superuser.openstack.org/articles/deploy-multi-cloud-serverless-cloud-foundry-apis-scale/

作者：[Superuser][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://superuser.openstack.org/articles/author/superuser/
[1]:http://superuser.openstack.org/articles/author/superuser/
[2]:http://superuser.openstack.org/articles/deploy-multi-cloud-serverless-cloud-foundry-apis-scale/
[3]:https://nordicapis.com/events/the-2017-api-platform-summit/
[4]:https://developer.ibm.com/openwhisk/
[5]:https://console.bluemix.net/openwhisk/
[6]:https://cloudfoundry.org/the-foundry/ibm-cloud/
[7]:https://www.youtube.com/jA25Kmxr6fU
