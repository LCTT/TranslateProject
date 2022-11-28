[#]: subject: (What is serverless with Java?)
[#]: via: (https://opensource.com/article/21/5/what-serverless-java)
[#]: author: (Daniel Oh https://opensource.com/users/daniel-oh)
[#]: collector: (lujun9972)
[#]: translator: (DCOLIVERSUN)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13429-1.html)

什么是 Java 的无服务器化？
======

> Java 仍是开发企业应用程序最流行的语言之一。那么，为什么<ruby>无服务器<rt>serverless</rt></ruby>开发人员对它望而却步？

![](https://img.linux.net.cn/data/attachment/album/202105/27/090038pd7ff7x0yohh38nd.jpg)

几十年来，企业已经在各类平台上开发了关键业务应用程序，包括物理服务器、虚拟机和云环境。这些应用程序在各行各业都有一个共同点，那就是无论需求如何，它们都需要持续可用（24x7x365），保证稳定性、可靠性和性能。因此，即使实际资源利用率低于 50%，每个企业都必须付出高额成本维护基础架构（如 CPU、内存、磁盘、网络等）。

无服务器架构是为了帮助解决这些问题而产生的。无服务器允许开发人员按需构建和运行应用程序，保证高可用性，不必在多云和混合云环境中管理服务器。在幕后，无服务器拓扑中仍有很多服务器，但它们是从应用程序开发中抽象出来的。相反，云提供商使用无服务器进行资源管理，例如配置、维护、联网和扩展服务器实例。

由于其高效性，无服务器开发模式现在是一些企业的需求，这些企业希望按需启动服务，而不是一直运行服务。

许多新建的开源项目用来在 [Kubernetes][2] 集群上通过 Linux 容器包来管理无服务器应用程序。CNCF 的《[交互式无服务器全景][3]》 是一份关于开源项目、工具、框架和公共云平台的指南，帮助 DevOps 团队处理无服务器应用程序。

![CNCF Serverless Landscape][4]

开发人员可以编写代码，然后将其快速部署到各种无服务器环境中。然后，无服务器应用程序响应需求，并根据需要自动伸缩扩展。

你可能想知道什么编程语言和运行环境最适合无服务器应用程序开发，以便与上图中的技术集成。这个问题不只一个答案，但是让我们退一步来讨论在企业生产环境中开发业务应用程序最流行的应用程序运行环境：Java。

据 [Developer Economics][6] 称，截至 2020 年第三季度，仍有 800 多万家企业开发人员在使用 Java 来实现其业务需求。然而，根据 2020 年的一项调查，Java（占比 6%）显然不是有前瞻意识的开发人员的首选，他们使用当前云服务做开发。

![NewRelic data on serverless runtimes and languages][8]

*来自 NewRelic 无服务器基准报告的数据（Daniel Oh, [CC BY-SA 4.0][9]）*

资源使用、响应时间和延迟在无服务器开发中至关重要。公有云提供商提供的无服务器产品通常是按需计量的，只有在无服务器应用程序启动时，才会通过事件驱动的执行模式收费。因此，当无服务器应用程序闲置或缩减为零时，企业无需支付任何费用。

### 带有容器的 Java 状态

在这种背景下，你可能会问：“_既然现有业务应用程序很可能是在 Java 技术上开发的，那么开发人员为什么不尝试使用 Java 栈进行无服务器应用程序开发呢？_”

隐藏的真相是：很难在新的不可变更的基础设施（例如 Kubernetes 这样的容器平台）中优化 Java 应用程序。

![Differences in memory resource usage][10]

该图描述了 Java 进程与竞争的语言、框架（如 [Node.js][11] 和 [Go][12]）之间内存资源使用的差异。Java HotSpot 占用资源最大，其中包括每个<ruby>Java 虚拟机<rt>Java Virtual Machine</rt></ruby>（JVM）实例分配的堆内存。中间显示了 Node.js 每个进程要比 Java 小得多。最后，Go 是一种流行的云服务编程语言，因为它的内存消耗最低。

如你所见，当你在这张图从左到右走，你会看到更密的节点。这就是开发人员在云、容器和 Kubernetes 上编写无服务器应用程序时回避 Java（包括 [Spring Boot][13]，一种顽固的微服务 Java 框架）的原因。

### 下一步是什么？

企业可以通过实现无服务器应用程序获得明显的好处，但是资源密度问题导致他们避免使用 Java 堆栈在 Kubernetes 上开发无服务器应用程序开发。但是选择其他语言会给全球数百万 Java 开发人员带来学习负担。因此，在本系列的下一篇文章中，我将指导你如何开始使用 Java 无服务器函数，而不是使用其他语言。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/what-serverless-java

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[DCOLIVERSUN](https://github.com/DCOLIVERSUN)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/java-coffee-mug.jpg?itok=Bj6rQo8r (Coffee beans and a cup of coffee)
[2]: https://opensource.com/article/19/6/reasons-kubernetes
[3]: https://landscape.cncf.io/serverless?zoom=150
[4]: https://opensource.com/sites/default/files/uploads/cncf-serverless-landscape.png (CNCF Serverless Landscape)
[5]: https://github.com/cncf/landscape/blob/master/LICENSE
[6]: https://developereconomics.com/
[7]: https://newrelic.com/resources/ebooks/serverless-benchmark-report-aws-lambda-2020
[8]: https://opensource.com/sites/default/files/uploads/newrelic_serverlessbenchmarkreport.png (NewRelic data on serverless runtimes and languages)
[9]: https://creativecommons.org/licenses/by-sa/4.0/
[10]: https://opensource.com/sites/default/files/uploads/java-containers.png (Differences in memory resource usage)
[11]: https://nodejs.org/
[12]: https://golang.org/
[13]: https://spring.io/projects/spring-boot
