[#]: collector: (lujun9972)
[#]: translator: (zxp93)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12941-1.html)
[#]: subject: (The state of the art of microservices in 2020)
[#]: via: (https://www.linux.com/news/the-state-of-the-art-of-microservices-in-2020/)
[#]: author: (Linux.com Editorial Staff https://www.linux.com/author/linuxdotcom/)

2020 年微服务现状
======

![](https://img.linux.net.cn/data/attachment/album/202012/22/122634t2hwh2hh12bvrbsd.jpg)

> “微服务架构风格是一种将 **单个应用程序** 开发为一套 **小型服务** 的方法，每个服务都在 **自己的进程中运行，并使用轻量级的通信机制（通常是 HTTP 类型的 API）进行通信**。这些服务是围绕 **业务能力** 构建的，并且可以通过 **全自动化的部署机制** 进行 **独立部署**。目前对这些服务几乎没有集中的管理，这些服务可以用 **不同的编程语言** 编写，也能使用 **不同的数据存储技术**。”
>
> —— James Lewis 和 Martin Fowler (2014) [^6]

### 介绍

预计在 2020 年，全球云端的微服务市场将以 22.5% 的速度增长，其中美国市场预计将保持 27.4% 的增长率[^5]。目前的趋势是，开发人员将从本地托管的应用程序转移到云端。这将有助于企业最大限度地减少停机时间、优化资源并降低基础设施成本。同时专家们还预测，到了 2022 年，90% 的应用程序将会使用微服务架构进行开发[^5]。本文将帮助你了解什么是微服务，以及目前的公司如何使用它的。

### 什么是微服务？

微服务已经在全球范围内被广泛使用。但是，微服务到底是什么？微服务是一种基于许多小型、互联服务的体系结构模式。它们基于 **单一责任原则**。根据 Robert C. Martin 的说法，“将因相同原因而变化的事物聚集起来，将因不同原因而变化的事物分离开来”。[^2]微服务架构也被扩展到了 **松耦合服务** 中，可以 **独立地开发、部署和维护**[^2]。

### 远离单体架构

微服务通常和传统的单体软件架构做对比。在单体架构中，软件是被设计为自足的，也就是说，这个程序中的各个组件都是互相连通和互相依赖的，而不是松散耦合的。在一个紧耦合的架构中（<ruby>单体<rt>monolithic</rt></ruby>），每个组件和它相关联的组件必须按照指定的顺序组合起来，才能被执行或编译[^7]。当其中有一个组件需要更新时，整个应用都要被重写。

而这个现象在使用微服务架构的应用中就不会出现。因为每一个模块都是独立的，每个模块都可以更新修改而不影响程序的其他部分。因此，降低了对更改一个组件会对其他组件造成影响的风险。

如果公司的架构很难升级，或者维护过于复杂和昂贵，那么他们可能会遇到麻烦，不能扩展单体架构的应用[^4]。把一个复杂的任务分解成小组件，彼此独立工作，就是解决这个问题的方法。

![][1]

*单一体系架构 vs. 微服务架构 （图片来自 [^3]）*

### 开发者如何构建属于自己的微服务

微服务以提高*可扩展性*和*性能*而闻名。然而，这些是世界各地的开发者开发属于他们自己的微服务的主要原因吗？《微服务 2020 研究现状》[^1]披露了全球开发者如何构建他们的微服务，以及他们对微服务的看法。这份报告是在来自欧洲、北美、中南美洲、中东、东南亚、澳大利亚和新西兰的 660 名微服务专家的帮助下完成的。下表列出了微服务成熟度相关问题的平均评分[^1]：

**分类** | **平均得分（满分为5分）**
---|---
创建新项目 | 3.8
维护与调试 | 3.4
工作效率 | 3.9
解决可扩展性问题 | 4.3
解决性能问题 | 3.9
团队合作 | 3.9

从上表可知，大部分专家都对使用微服务来解决可扩展性问题感到满意。与之相反的是，维护与调试对他们来说似乎是一个挑战。

从他们所使用的架构技术来说，大部分专家使用 Javascript/Typescript （大约 ⅔ 的微服务是使用这些语言构建的），其次使用的是 Java。

尽管有很多部署微服务的选择，但大多数专家使用 AWS（49%），其次是他们自己的服务器。另外，有 62% 的人更喜欢用 AWS Lambda 作为无服务器解决方案。

这些人所使用的大多数微服务都使用 HTTP 进行通信，其次是 events 和 gRPC。此外，大多数专家将 RabbitMQ 用于消息代理，其次是 Kafka 和 Redis。

而且，大多数人使用微服务持续集成（CI）。在报告中，87% 的受访者使用诸如 GitLab CI、Jenkins 或 GitHub Actions 等 CI 解决方案。

在 86% 的受访者中，最受欢迎的调试解决方案是日志，其中 27% 的受访者**只**使用日志。

最后，大多数人认为微服务架构将成为更复杂的系统或后端开发的标准。

### 微服务的成功案例

许多公司已经从单体架构转向微服务架构。

#### 亚马逊

在 2001 年，开发延迟、编码挑战和服务相互依赖性使得<ruby>亚马逊<rt>Amazon</rt></ruby>无法满足其不断增长的用户群的可扩展性需求。由于需要从头开始重构他们的单体架构，亚马逊将其单体架构应用程序拆分为小型的、独立的、针对服务的应用程序[^3][^9]。

2001 年，在微服务这个词开始流行之前的几年，亚马逊决定改用微服务。这一变化使得亚马逊开发了好几种支持微服务架构的解决方案，比如亚马逊 AWS。随着对微服务的快速增长和适应，亚马逊成为全球市值最高的公司，截至 2020 年 7 月 1 日，亚马逊市值为 1.433 万亿美元[^8]。

#### 奈飞

<ruby>奈飞<rt>Netflix</rt></ruby>于 2007 年开始提供电影流媒体服务，到了 2008 年，它也面临着规模扩张的挑战。期间，他们经历了一次严重的数据库损坏，在三天之内，他们不能将 DVD 发送给他们的会员[^10]。这一事故使他们意识到需要将单点故障（如关系数据库）转向云中更可伸缩和更可靠的分布式系统。于是 2009 年，奈飞开始将其单体架构的应用重构为微服务。他们首先将其非面向客户的电影编码平台迁移到云端作为独立的微服务运行[^11]。在改用微服务之后，使奈飞能够解决扩展性挑战和服务中断的问题。并且它还允许他们按照每个流数据而不是数据中心的成本来降低成本[^10]。今天，奈飞每天向 190 个国家的 1.39 亿订户发送约 2.5 亿小时的内容[^11]。

#### Uber

在推出 Uber 服务之后，他们在开发和发布新功能、修复 bug，以及迅速整合新的变化方面遇到了困难。因此，他们决定改用微服务，并将应用程序结构拆分为基于云的微服务。换句话说，Uber 为每个功能创建了一个微服务，比如乘客管理和出行管理。转向微服务给 Uber 带来了很多好处，比如对每项服务的所有权都有一个清晰的概念。这提高了服务访问的速度和质量，通过允许团队只关注他们需要扩展的服务，在更新虚拟服务的同时而不中断其他服务，实现了更可靠的容错，从而促进了快速扩展[^11]。

### 这就是可扩展性！

关于如何提供可伸缩性的一个很好的例子是看看中国。中国人口众多，必须通过创造和试验新的解决方案来适应规模化的新挑战。统计数据显示，中国目前为大约 9 亿互联网用户提供服务[^14]。2019 年“双十一”期间（相当于国外的黑色星期五），阿里巴巴旗下各购物平台的交易峰值为每秒 544000 笔交易。阿里云处理的数据总量约为 970 PB[^15]。那么，这些数量的用户在技术上意味着什么呢？

为了解决可伸缩性问题，许多技术应运而生。例如，[Tars][2] 由腾讯于 2008 年创建，[2018 年贡献给 Linux 基金会][3]。它也在被大规模使用，并在 10 年内得到了很大的提升[^12]。TARS 是开源的，许多组织都在大力贡献和扩展框架的特性和价值[^12]。TARS 支持多种编程语言，包括 C++、Golang、java、node.js、PHP 和 Python；它可以快速构建系统并自动生成代码，使开发人员能够专注于业务逻辑，从而有效地提高操作效率。TARS 已广泛应用于腾讯的 QQ、微信社交网络、金融服务、边缘计算、汽车、视频、网络游戏、地图、应用市场、安全等诸多核心业务。[在 2020 三月，TARS 项目转变为 TARS 基金会][4]，这是一个开源微服务基金会，在建立开放式微服务平台的社区方面中，致力于提升社区贡献和成员的快速增长[^12]。


**一定要看看 Linux 基金会新的免费培训课程**：《[用 TARS 构建微服务平台][5]》

*关于作者：*

*Isabella Ferreira 是 Linux 基金会旗下的开源微服务基金会 TARS 基金会的布道师*

*Mark Shan（单致豪）是腾讯开源联盟的主席，也是 TARS 基金会的董事会主席。*

[^1]: https://tsh.io/state-of-microservices/#ebook
[^2]: https://medium.com/hashmapinc/the-what-why-and-how-of-a-microservices-architecture-4179579423a9
[^3]: https://www.plutora.com/blog/understanding-microservices
[^4]: https://www.leanix.net/en/blog/a-brief-history-of-microservices
[^5]: https://www.charterglobal.com/five-microservices-trends-in-2020/
[^6]: https://martinfowler.com/articles/microservices.html#footnote-etymology
[^7]: https://whatis.techtarget.com/definition/monolithic-architecture
[^8]: https://ycharts.com/companies/AMZN/market_cap
[^9]: https://thenewstack.io/led-amazon-microservices-architecture/
[^10]: https://media.netflix.com/en/company-blog/completing-the-netflix-cloud-migration
[^11]: https://blog.dreamfactory.com/microservices-examples/
[^12]: https://www.linuxfoundation.org/blog/2020/03/the-tars-foundation-the-formation-of-a-microservices-ecosystem/
[^13]: https://medium.com/microservices-architecture/top-10-microservices-framework-for-2020-eefb5e66d1a2
[^14]: https://www.statista.com/statistics/265140/number-of-internet-users-in-china/
[^15]: https://interconnected.blog/china-scale-technology-sandbox/

> 本篇 Linux 基金会白金赞助商内容由腾讯贡献。

--------------------------------------------------------------------------------

via: https://www.linux.com/news/the-state-of-the-art-of-microservices-in-2020/

作者：[Linux.com][a]
选题：[lujun9972][b]
译者：[zhangxiangping](https://github.com/zxp93)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/linuxdotcom/
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/wp-content/uploads/2020/11/microservices_diagram_a.png
[2]: https://tarscloud.org/foundation/index
[3]: https://www.linuxfoundation.org/press-release/2018/06/tars-and-tseer-form-open-source-project-communities-under-the-linux-foundation-to-expand-adoption-and-pace-of-development/
[4]: https://www.linuxfoundation.org/blog/2020/03/the-tars-foundation-the-formation-of-a-microservices-ecosystem/
[5]: https://www.edx.org/course/building-microservice-platforms-with-tars
