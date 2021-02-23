[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11405-1.html)
[#]: subject: (IBM brings blockchain to Red Hat OpenShift; adds Apache CouchDB for hybrid cloud customers)
[#]: via: (https://www.networkworld.com/article/3441362/ibm-brings-blockchain-to-red-hat-openshift-adds-apache-couchdb-for-hybrid-cloud-customers.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

IBM 将区块链引入红帽 OpenShift；为混合云客户添加了Apache CouchDB
======

> IBM 在其区块链平台上增加了红帽 OpenShift 支持，并将用于 Apache CouchDB 的 Kubernetes Operator 引入其混合云服务中。

![](https://images.idgesg.net/images/article/2019/08/cloudjourney1200x800-100808549-large.jpg)

IBM 本周继续推进其红帽和开源集成工作，在其[区块链][1]平台上添加了红帽 OpenShift 支持，并在其[混合云][2]服务产品之外为 Apache CouchDB 引入了 Kubernetes Operator。

在该公司的旗舰级企业 Kubernetes 平台 [红帽 OpenShift 上部署 IBM 区块链][3] 的能力，意味着 IBM 区块链的开发人员将能够在本地、公共云或混合云架构中部署安全软件。

区块链是一个分布式数据库，维护着一个不断增长的记录列表，可以使用哈希技术对其进行验证，并且 IBM 区块链平台包括用于构建、操作、治理和发展受保护的区块链网络的工具。

IBM 表示，其区块链 / OpenShift 组合的目标客户面对的公司客户是：希望保留区块链分类帐副本并在自己的基础设施上运行工作负载以实现安全性，降低风险或合规性；需要将数据存储在特定位置以满足数据驻留要求；需要在多个云或混合云架构中部署区块链组件。

自 7 月份完成对红帽的收购以来，IBM 一直在围绕红帽基于 Kubernetes 的 OpenShift 容器平台构建云开发生态系统。最近，这位蓝色巨人将其[新 z15 大型机与 IBM 的红帽][4]技术融合在一起，称它将为红帽 OpenShift 容器平台提供 IBM z/OS 云代理。该产品将通过连接到 Kubernetes 容器为用户提供 z/OS 计算资源的直接自助访问。

IBM 表示，打算在 IBM z 系列和 LinuxONE 产品上向 Linux 提供 IBM [Cloud Pak 产品][5]。Cloud Paks 是由 OpenShift 与 100 多种其他 IBM 软件产品组成的捆绑包。LinuxONE 是 IBM 专为支持 Linux 环境而设计的非常成功的大型机系统。

IBM 表示，愿景是使支持 OpenShift 的 IBM 软件成为客户用来转变其组织的基础构建组件。

IBM 表示：“我们的大多数客户都需要支持混合云工作负载以及可在任何地方运行这些工作负载的灵活性的解决方案，而用于红帽的 z/OS 云代理将成为我们在平台上启用云原生的关键。”

在相关新闻中，IBM 宣布支持开源 Apache CouchDB，这是 [Apache CouchDB][7] 的 Kubernetes Operator，并且该 Operator 已通过认证可与红帽 OpenShift 一起使用。Operator 可以自动部署、管理和维护 Apache CouchDB 部署。Apache CouchDB 是非关系型开源 NoSQL 数据库。

在最近的 [Forrester Wave 报告][8]中，研究人员说：“企业喜欢 NoSQL 这样的能力，可以使用低成本服务器和可以存储、处理和访问任何类型的业务数据的灵活的无模式模型进行横向扩展。NoSQL 平台为企业基础设施专业人士提供了对数据存储和处理的更好控制，并提供了可加速应用程序部署的配置。当许多组织使用 NoSQL 来补充其关系数据库时，一些组织已开始替换它们以支持更好的性能、扩展规模并降低其数据库成本。”

当前，IBM 云使用 Cloudant Db 服务作为其针对新的云原生应用程序的标准数据库。IBM 表示，对 CouchDB 的强大支持为用户提供了替代方案和后备选项。IBM 表示，能够将它们全部绑定到红帽 OpenShift Kubernetes 部署中，可以使客户在部署应用程序并在多个云环境中移动数据时使用数据库本地复制功能来维持对数据的低延迟访问。

“我们的客户正在转向基于容器化和[微服务][9]的架构，以提高速度、敏捷性和运营能力。在云原生应用程序开发中，应用程序需要具有支持可伸缩性、可移植性和弹性的数据层。”IBM 院士兼云数据库副总裁 Adam Kocoloski 写道，“我们相信数据可移植性和 CouchDB 可以大大改善多云架构的功能，使客户能够构建真正可在私有云、公共云和边缘位置之间移植的解决方案。”

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3441362/ibm-brings-blockchain-to-red-hat-openshift-adds-apache-couchdb-for-hybrid-cloud-customers.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3330937/how-blockchain-will-transform-the-iot.html
[2]: https://www.networkworld.com/article/3268448/what-is-hybrid-cloud-really-and-whats-the-best-strategy.html
[3]: https://www.ibm.com/blogs/blockchain/2019/09/ibm-blockchain-platform-meets-red-hat-openshift/
[4]: https://www.networkworld.com/article/3438542/ibm-z15-mainframe-amps-up-cloud-security-features.html
[5]: https://www.networkworld.com/article/3429596/ibm-fuses-its-software-with-red-hats-to-launch-hybrid-cloud-juggernaut.html
[6]: https://www.networkworld.com/article/3400740/achieve-compliant-cost-effective-hybrid-cloud-operations.html
[7]: https://www.ibm.com/cloud/learn/couchdb
[8]: https://reprints.forrester.com/#/assets/2/363/RES136481/reports
[9]: https://www.networkworld.com/article/3137250/what-you-need-to-know-about-microservices.html
[10]: https://www.facebook.com/NetworkWorld/
[11]: https://www.linkedin.com/company/network-world
