[#]: collector: (lujun9972)
[#]: translator: (MjSeven)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10757-1.html)
[#]: subject: (5 useful open source log analysis tools)
[#]: via: (https://opensource.com/article/19/4/log-analysis-tools)
[#]: author: (Sam Bocetta https://opensource.com/users/sambocetta)

5 个有用的开源日志分析工具
======

> 监控网络活动既重要又繁琐，以下这些工具可以使它更容易。

![People work on a computer server][1]

监控网络活动是一项繁琐的工作，但有充分的理由这样做。例如，它允许你查找和调查工作站和连接到网络的设备及服务器上的可疑登录，同时确定管理员滥用了什么。你还可以跟踪软件安装和数据传输，以实时识别潜在问题，而不是在损坏发生后才进行跟踪。

这些日志还有助于使你的公司遵守适用于在欧盟范围内运营的任何实体的[通用数据保护条例][2]（GDPR）。如果你的网站在欧盟可以浏览，那么你就有遵守的该条例的资格。

日志记录，包括跟踪和分析，应该是任何监控基础设置中的一个基本过程。要从灾难中恢复 SQL Server 数据库，需要事务日志文件。此外，通过跟踪日志文件，DevOps 团队和数据库管理员（DBA）可以保持最佳的数据库性能，又或者，在网络攻击的情况下找到未经授权活动的证据。因此，定期监视和分析系统日志非常重要。这是一种重新创建导致出现任何问题的事件链的可靠方式。

现在有很多开源日志跟踪器和分析工具可供使用，这使得为活动日志选择合适的资源比你想象的更容易。自由和开源软件社区提供的日志设计适用于各种站点和操作系统。以下是五个我用过的最好的工具，它们并没有特别的顺序。

### Graylog

[Graylog][3] 于 2011 年在德国创立，现在作为开源工具或商业解决方案提供。它被设计成一个集中式日志管理系统，接受来自不同服务器或端点的数据流，并允许你快速浏览或分析该信息。

![Graylog screenshot][4]

Graylog 在系统管理员中有着良好的声誉，因为它易于扩展。大多数 Web 项目都是从小规模开始的，但它们可能指数级增长。Graylog 可以均衡后端服务网络中的负载，每天可以处理几 TB 的日志数据。

IT 管理员会发现 Graylog 的前端界面易于使用，而且功能强大。Graylog 是围绕仪表板的概念构建的，它允许你选择你认为最有价值的指标或数据源，并快速查看一段时间内的趋势。

当发生安全或性能事件时，IT 管理员希望能够尽可能地根据症状追根溯源。Graylog 的搜索功能使这变得容易。它有内置的容错功能，可运行多线程搜索，因此你可以同时分析多个潜在的威胁。

### Nagios

[Nagios][5] 始于 1999 年，最初是由一个开发人员开发的，现在已经发展成为管理日志数据最可靠的开源工具之一。当前版本的 Nagios 可以与运行 Microsoft Windows、Linux 或 Unix 的服务器集成。

![Nagios Core][6]

它的主要产品是日志服务器，旨在简化数据收集并使系统管理员更容易访问信息。Nagios 日志服务器引擎将实时捕获数据，并将其提供给一个强大的搜索工具。通过内置的设置向导，可以轻松地与新端点或应用程序集成。

Nagios 最常用于需要监控其本地网络安全性的组织。它可以审核一系列与网络相关的事件，并帮助自动分发警报。如果满足特定条件，甚至可以将 Nagios 配置为运行预定义的脚本，从而允许你在人员介入之前解决问题。

作为网络审计的一部分，Nagios 将根据日志数据来源的地理位置过滤日志数据。这意味着你可以使用地图技术构建全面的仪表板，以了解 Web 流量是如何流动的。

### Elastic Stack (ELK Stack)

[Elastic Stack][7]，通常称为 ELK Stack，是需要筛选大量数据并理解其日志系统的组织中最受欢迎的开源工具之一（这也是我个人的最爱）。

![ELK Stack][8]

它的主要产品由三个独立的产品组成：Elasticsearch、Kibana 和 Logstash：

  * 顾名思义， Elasticsearch 旨在帮助用户使用多种查询语言和类型在数据集之中找到匹配项。速度是它最大的优势。它可以扩展成由数百个服务器节点组成的集群，轻松处理 PB 级的数据。
  * Kibana 是一个可视化工具，与 Elasticsearch 一起工作，允许用户分析他们的数据并构建强大的报告。当你第一次在服务器集群上安装 Kibana 引擎时，你会看到一个显示着统计数据、图表甚至是动画的界面。
  * ELK Stack 的最后一部分是 Logstash，它作为一个纯粹的服务端管道进入 Elasticsearch 数据库。你可以将 Logstash 与各种编程语言和 API 集成，这样你的网站和移动应用程序中的信息就可以直接提供给强大的 Elastic Stalk 搜索引擎中。

ELK Stack 的一个独特功能是，它允许你监视构建在 WordPress 开源网站上的应用程序。与[跟踪管理日志和 PHP 日志][9]的大多数开箱即用的安全审计日志工具相比，ELK Stack 可以筛选 Web 服务器和数据库日志。

糟糕的日志跟踪和数据库管理是导致网站性能不佳的最常见原因之一。没有定期检查、优化和清空数据库日志，不仅会降低站点的运行速度，还可能导致其完全崩溃。因此，ELK Stack 对于每个 WordPress 开发人员的工具包来说都是一个优秀的工具。

### LOGalyze

[LOGalyze][11] 是一个位于匈牙利的组织，它为系统管理员和安全专家构建开源工具，以帮助他们管理服务器日志，并将其转换为有用的数据点。其主要产品可供个人或商业用户免费下载。

![LOGalyze][12]

LOGalyze 被设计成一个巨大的管道，其中多个服务器、应用程序和网络设备可以使用简单对象访问协议（SOAP）方法提供信息。它提供了一个前端界面，管理员可以登录界面来监控数据集并开始分析数据。

在 LOGalyze 的 Web 界面中，你可以运行动态报告，并将其导出到 Excel 文件、PDF 文件或其他格式。这些报告可以基于 LOGalyze 后端管理的多维统计信息。它甚至可以跨服务器或应用程序组合数据字段，借此来帮助你发现性能趋势。

LOGalyze 旨在不到一个小时内完成安装和配置。它具有预先构建的功能，允许它以法律所要求的格式收集审计数据。例如，LOGalyze 可以很容易地运行不同的 HIPAA 报告，以确保你的组织遵守健康法律并保持合规性。

### Fluentd

如果你所在组织的数据源位于许多不同的位置和环境中，那么你的目标应该是尽可能地将它们集中在一起。否则，你将难以监控性能并防范安全威胁。

[Fluentd][13] 是一个强大的数据收集解决方案，它是完全开源的。它没有提供完整的前端界面，而是作为一个收集层来帮助组织不同的管道。Fluentd 在被世界上一些最大的公司使用，但是也可以在较小的组织中实施。 

![Fluentd architecture][14]

Fluentd 最大的好处是它与当今最常用的技术工具兼容。例如，你可以使用 Fluentd 从 Web 服务器（如 Apache）、智能设备传感器和 MongoDB 的动态记录中收集数据。如何处理这些数据完全取决于你。

Fluentd 基于 JSON 数据格式，它可以与由卓越的开发人员创建的 [500 多个插件][15]一起使用。这使你可以将日志数据扩展到其他应用程序中，并通过最少的手工操作从中获得更好的分析。

### 写在最后

如果出于安全原因、政府合规性和衡量生产力的原因，你还没有使用活动日志，那么现在开始改变吧。市场上有很多插件，它们可以与多种环境或平台一起工作，甚至可以在内部网络上使用。不要等发生了严重的事件，才采取一个积极主动的方法去维护和监督日志。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/log-analysis-tools

作者：[Sam Bocetta][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sambocetta
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_linux11x_cc.png?itok=XMDOouJR (People work on a computer server)
[2]: https://opensource.com/article/18/4/gdpr-impact
[3]: https://www.graylog.org/products/open-source
[4]: https://opensource.com/sites/default/files/uploads/graylog-data.png (Graylog screenshot)
[5]: https://www.nagios.org/downloads/
[6]: https://opensource.com/sites/default/files/uploads/nagios_core_4.0.8.png (Nagios Core)
[7]: https://www.elastic.co/products
[8]: https://opensource.com/sites/default/files/uploads/elk-stack.png (ELK Stack)
[9]: https://www.wpsecurityauditlog.com/benefits-wordpress-activity-log/
[10]: https://websitesetup.org/how-to-speed-up-wordpress/
[11]: http://www.logalyze.com/
[12]: https://opensource.com/sites/default/files/uploads/logalyze.jpg (LOGalyze)
[13]: https://www.fluentd.org/
[14]: https://opensource.com/sites/default/files/uploads/fluentd-architecture.png (Fluentd architecture)
[15]: https://opensource.com/article/18/9/open-source-log-aggregation-tools
