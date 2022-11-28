[#]: subject: "Learn more about distributed databases with ShardingSphere"
[#]: via: "https://opensource.com/article/21/12/apache-shardingsphere"
[#]: author: "Trista Pan https://opensource.com/users/trista-pan"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14095-1.html"

ShardingSphere 分布式数据库简介
======

> Apache ShardingSphere 是一个开源的分布式数据库，它还有一个用户和开发人员需要的生态系统，为之提供了定制和云原生的体验。

![](https://img.linux.net.cn/data/attachment/album/202112/19/093406msdyogai9rzo2rvo.jpg)

Apache ShardingSphere 是一个开源的分布式数据库，它还有一个用户和开发人员需要的生态系统，为之提供了定制和云原生的体验。在加入 Apache 基金会的三年里，ShardingSphere 核心团队与社区一起努力工作，创建了一个开源的、强大的、分布式的数据库和一个支持性生态系统。

ShardingSphere 并不完全符合业界通常的简单分布式数据库中间件解决方案的模式。ShardingSphere 重新创建了分布式可插拔系统，使实际的用户实施方案得以蓬勃发展，并为社区和数据库行业贡献有价值的解决方案。

ShardingSphere 的目标是 _Database Plus_ 概念。

### Database Plus

Database Plus 的出发点是在零散的数据库基本服务之上建立一个标准层和生态系统层。统一的、标准化的数据库使用规范为上层应用提供了保障，尽可能的减少了企业因底层数据库碎片化而面临的挑战。为了连接数据库和应用，它使用了流量和数据的渲染和解析。它为用户提供了增强的核心功能，如分布式数据库、数据安全、数据库网关和压力测试。

ShardingSphere 为 Database Plus 使用了可插拔的内核架构。这意味着模块化，这为用户提供了灵活性。它有几个不同的层：

 * **基础层：** 提供各种访问终端和访问形式，满足用户在不同场景下的需求。
 * **插件层：** 通过实现可扩展性提供基础设施支持。
 * **功能层：** 提供各种满足用户需求的功能插件，使用户在选择和组合插件时具有高度的灵活性。
 * **产品层：** 这是终端用户看到的层。这为他们提供了面向行业和特定场景的产品。换句话说，它为用户提供了适合他们所做的任何工作的工具。

![Database Plus platform][2]

（Trista Pan, [CC BY-SA 4.0][3]）

### 用 DistSQL 进行标准化的集群管理

Apache ShardingSphere 采用独特的 SQL 方言 DistSQL（分布式 SQL）来连接 ShardingSphere 生态系统的所有元素。作为 ShardingSphere 分布式数据库生态系统的标准交互语言，DistSQL 允许用户使用一个 SQL 命令来创建、修改或删除分布式数据库表或对其进行加密或解密。DistSQL 还支持分布式调度管理。

![DistSQL][4]

（Trista Pan, [CC BY-SA 4.0][3]）

### 多访问终端

ShardingSphere JDBC 和 ShardingSphere Proxy 经过两年的打磨和测试，目前已经可以投入生产。许多社区用户提供了相关的生产社区案例。

多亏共享核心架构，以及不同的 ShardingSphere 适配器，如果用户的生产环境需要，可以选择混合适配器部署（如下图所示）。

![Hybrid deployment][5]

（Trista Pan, [CC BY-SA 4.0][3]）

### 分布式治理

在 ShardingSphere 生态系统中，计算和存储是分开的，因此具备对数据库进行分布式治理的能力，所以你可以维护许多存储节点、计算节点，实施断路器，并确保高可用性。

![Distributed governance][6]

（Trista Pan, [CC BY-SA 4.0][3]）

### 使用 Grafana 监控

ShardingSphere 也有状态指标来监控你的基础设施。代理动态加载机制为你提供了指标和跟踪指标，方便您将 APM 系统与 Grafana 仪表板集成。

![Grafana dashboard][7]

（Trista Pan, [CC BY-SA 4.0][3]）

### 分布式社区的分布式数据库

社区正在继续优化 ShardingSphere，并整合新的想法和行业场景。社区构建了它，而开发的主要动力之一是用户反馈。这是开源的一个特点，但也是这个团队的实践方法。ShardingSphere 社区的核心团队成员很乐意指导任何对开源感兴趣的人，并为有兴趣帮助开发的学生提供实践问题。团队也希望有新的朋友或贡献者加入社区，促进思想的开放交流，创造一个真正的全球开发者社区。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/apache-shardingsphere

作者：[Trista Pan][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/trista-pan
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bus_cloud_database.png?itok=lhhU42fg (Cloud and databsae incons)
[2]: https://opensource.com/sites/default/files/uploads/database-plus-platform.png (Database Plus platform)
[3]: tps://creativecommons.org/licenses/by-sa/4.0/
[4]: https://opensource.com/sites/default/files/uploads/distsql.png (DistSQL)
[5]: https://opensource.com/sites/default/files/uploads/hybrid-deployment.png (Hybrid deployment)
[6]: https://opensource.com/sites/default/files/uploads/distributed-governance.png (Distributed governance)
[7]: https://opensource.com/sites/default/files/uploads/grafana-dashboard.png (Grafana dashboard)
