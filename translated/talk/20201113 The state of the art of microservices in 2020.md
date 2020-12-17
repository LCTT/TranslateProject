[#]: collector: (lujun9972)
[#]: translator: (zhangxiangping)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The state of the art of microservices in 2020)
[#]: via: (https://www.linux.com/news/the-state-of-the-art-of-microservices-in-2020/)
[#]: author: (Linux.com Editorial Staff https://www.linux.com/author/linuxdotcom/)

The state of the art of microservices in 2020
2020年微服务现状
======

### _“微服务架构风格是一种将_ _**单个应用程序**_ _开发为一套_ _**小服务**_*的方法，每个服务都在* _**自己的进程中运行，并使用轻量级的通信机制进行通信**_*，通常是HTTP类型的API。这些服务是基于_**业务能力**_构建的，并且是可以通过**完全自动化部署机制**进行**独立部署**。目前对这些服务的集中管理非常有限，这些服务可以用* _**不同的编程语言**_ _编写，也能使用_ _**不同的数据存储技术。**__ ”_

### James Lewis and Martin Fowler (2014) [6]

## 简介

预计在2020年，全球云微服务市场将以22.5%的速度增长，其中美国市场预计将保持27.4%的增长率[5]。目前的趋势是，开发人员将会把本地托管的应用程序转移到云端进行托管。这将有助于企业最大限度地减少停机时间、优化资源并降低基础设施成本。同时专家们还预测，到了2022年，90%的应用程序将会使用微服务架构进行开发[5]。本文将帮助您了解什么是微服务，以及目前的公司如何使用它。

## 什么是微服务？

微服务已经在全球范围内广泛地被使用了。但是，微服务到底是什么？微服务是一种基于许多小型、互联服务的体系结构模式。它们基于**单一责任原则**。根据罗伯特·C·马丁的说法，“将因相同原因而改变的事物聚集起来，将因不同原因而改变的事物分离开来”[2]。微服务架构也被扩展到了**松耦合服务**中，也可以**独立地开发、部署和维护**[2]。

## 远离单一体系结构

微服务通常和传统的单一体系的软件架构做对比。在单一体系架构中，一个软件是被设计为自包含的，也就是说，这个程序中的各个组件都是互相连通和互相依赖的，而不是松散耦合的。在一个紧耦合的架构中（单一体系），为了执行或编译代码，每个组件和它相关联的组件必须按照指定的顺序组合起来[7]。当其中有一个组件需要更新时，整个应用都要被重写。

而这个现象在使用微服务体系结构的应用中就不会出现。因为每一个模块都是独立的，每个模块都可以更新修改而不影响程序的其他部分。因此，降低了对更改一个组件会对其他组件造成影响的风险。

如果公司的架构很难升级或者维护过于复杂和昂贵，那么他们就不能扩展一个单一的体系结构的应用，他们可能会遇到麻烦[4]。把一个复杂的任务分解成彼此独立工作的小组件就是解决这个问题的方法。

![单一体系架构 vs. 微服务架构 （图片来自 \[3\].）][1]


## 开发者如何构建属于自己的微服务

微服务以提高_可扩展性_和_性能_而闻名。然而，这些是世界各地的开发者开发属于他们自己的微服务的主要原因吗？微服务2020研究现状[1]发现了全球开发者如何构建他们的微服务，以及他们对微服务的看法。这份报告是在来自欧洲、北美、中南美洲、中东、东南亚、澳大利亚和新西兰的660名微服务专家的帮助下完成的。下表列出了微服务成熟度相关问题的平均评分[1]

**分类** | **平均得分（满分为5分）**
---|---
创建新项目 | 3.8
维护与调试 | 3.4
工作效率 | 3.9
解决可扩展性问题 | 4.3
解决性能问题 | 3.9
团队合作 | 3.9

从上表可知，大部分专家都更愿意使用微服务来解决可扩展性问题。与之相反的是，维护与调试对他们来说似乎是一个挑战。

从他们所使用的架构技术来说，大部分专家使用Javascript/Typescript(大约⅔的微服务使用这些语言构建的)。其次使用的是Java。

尽管有很多部署微服务的选择，但大多数专家使用Amazon Web服务（49%），其次是他们自己的服务器。另外，有62%的人更喜欢AWS Lambda作为无服务器解决方案。

这些人所使用的大多数微服务都使用HTTP进行通信，其次是events和gRPC。此外，大多数专家将RabbitMQ用于消息代理，其次是Kafka和Redis。

而且，大多数人使用微服务持续集成（CI）。在报告中，87%的受访者使用诸如GitLab CI、Jenkins或GitHub Actions等CI解决方案。

在86%的受访者中，最受欢迎的调试解决方案是日志，其中27%的受访者只使用日志

最后，大多数人认为微服务架构将成为更复杂系统或后端开发的标准。

## 微服务的成功案例

许多公司已经从单一的体系结构转向微服务架构。

### Amazon

在2001年，开发延迟、编码挑战和服务相互依赖性使得Amazon无法满足其不断增长的用户群的可扩展性需求。由于需要从头开始重构他们的单一体系结构，Amazon将其单一体系架构应用程序拆分为小型的、独立的、指定服务的应用程序[3][9]。

2001年，在微服务这个词开始流行之前的几年,亚马逊决定改用微服务。这一变化使得Amazon开发了好几种支持微服务架构的解决方案，比如amazonaws。随着对微服务的快速增长和适应，亚马逊成为全球市值最高的公司，截至2020年7月1日，亚马逊市值为1.433万亿美元[8]。

### Netflix

Netflix于2007年开始提供电影流媒体服务，到了2008年，它也面临着规模扩张的挑战。期间，他们经历了一次严重的数据库损坏，在三天之内，他们不能将dvd发送给他们的会员[10]。这一事故使他们意识到需要将单点故障（如关系数据库）转向云中更可伸缩和更可靠的分布式系统。于是2009年，Netflix开始将其单一架构的应用重构为微服务。他们首先将其非面向客户的电影编码平台迁移到云端作为独立的微服务运行[11]。在该用改用微服务之后，使Netflix能够解决扩展性挑战和服务中断的问题。并且它还允许他们通过云的方式处理每串流式数据而不是数据中心的模式来降低成本[10]。今天，Netflix每天向190个国家的1.39亿订户发送约2.5亿小时的内容[11]。

### Uber

在推出Uber之后，他们努力开发和发布新功能，修复bug，并迅速整合新的变化。因此，他们决定改用微服务，并将应用程序结构拆分为基于云的微服务。换句话说，Uber为每个功能创建了一个微服务，比如乘客管理和出行管理。转向微服务给Uber带来了很多好处，比如对每项服务的所有权都有一个清晰的概念。这提高了服务访问的速度和质量，通过允许团队只关注他们需要扩展的服务，在更新虚拟服务的同时而不中断其他服务，实现了更可靠的容错，从而促进了快速扩展[11]。

## 一切都和可扩展性有关！

关于如何提供可伸缩性的一个很好的例子是看看中国。中国人口众多，必须通过创造和试验新的解决方案来适应大规模的新挑战。统计数据显示，中国目前为大约9亿互联网用户提供服务[14]。2019年“双十一”期间（相当于国外的黑色星期五），阿里巴巴旗下各购物平台的交易峰值为每秒544000笔交易。阿里云处理的数据总量约为970兆字节[15]。那么，这些数量的用户在技术上意味着什么呢？

为了解决可伸缩性问题，许多技术应运而生。例如，[Tars][2]由腾讯于2008年创建，[2018年贡献给Linux基金会][3]。它也在被大规模使用，并在10年内得到了很大的提升[12]。Tars是开源的，许多组织都在大力贡献和扩展框架的特性和价值[12]。TARS支持多种编程语言，包括C++、Golang、java、node.js、PHP和Python；它可以快速构建系统并自动生成代码，使开发人员能够专注于业务逻辑，从而有效地提高操作效率。Tars已广泛应用于腾讯的QQ、微信社交网络、金融服务、边缘计算、汽车、视频、网络游戏、地图、应用市场、安全等诸多核心业务。[在2020三月，TARS项目转变为TARS基金会][4]，一个开源微服务基金会，在建立开放式微服务平台的社区方面中，致力于提升社区贡献和成员的快速增长[12]。


**一定要看看Linux基金会新的免费培训课程**, [用TARS构建微服务平台][5]

*关于作者：*

*_Isabella Ferreira_是TARS基金会的一个倡导者，也是*cloud-native open-source microservice foundation under the Linux Foundation*的倡导者。*.*

*markshan是腾讯开源联盟的主席，也是TARS基金会的董事会主席。*


**References:**

[1] <https://tsh.io/state-of-microservices/#ebook>

[2]<https://medium.com/hashmapinc/the-what-why-and-how-of-a-microservices-architecture-4179579423a9>

[3] <https://www.plutora.com/blog/understanding-microservices>

[4] <https://www.leanix.net/en/blog/a-brief-history-of-microservices>

[5] <https://www.charterglobal.com/five-microservices-trends-in-2020/>

[6] <https://martinfowler.com/articles/microservices.html#footnote-etymology>

[7] <https://whatis.techtarget.com/definition/monolithic-architecture>

[8] <https://ycharts.com/companies/AMZN/market_cap>

[9] <https://thenewstack.io/led-amazon-microservices-architecture/>

[10] <https://media.netflix.com/en/company-blog/completing-the-netflix-cloud-migration>

[11] <https://blog.dreamfactory.com/microservices-examples/>

[12] <https://www.linuxfoundation.org/blog/2020/03/the-tars-foundation-the-formation-of-a-microservices-ecosystem/>

[13] <https://medium.com/microservices-architecture/top-10-microservices-framework-for-2020-eefb5e66d1a2>

[14] <https://www.statista.com/statistics/265140/number-of-internet-users-in-china/>

[15] <https://interconnected.blog/china-scale-technology-sandbox/>

#### _This Linux Foundation Platinum Sponsor content was contributed by Tencent._

--------------------------------------------------------------------------------

via: https://www.linux.com/news/the-state-of-the-art-of-microservices-in-2020/

作者：[Linux.com Editorial Staff][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/zxp93)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/author/linuxdotcom/
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/wp-content/uploads/2020/11/microservices_diagram_a.png
[2]: https://tarscloud.org/foundation/index
[3]: https://www.linuxfoundation.org/press-release/2018/06/tars-and-tseer-form-open-source-project-communities-under-the-linux-foundation-to-expand-adoption-and-pace-of-development/
[4]: https://www.linuxfoundation.org/blog/2020/03/the-tars-foundation-the-formation-of-a-microservices-ecosystem/
[5]: https://www.edx.org/course/building-microservice-platforms-with-tars
