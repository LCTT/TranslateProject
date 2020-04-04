[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why use GraphQL?)
[#]: via: (https://opensource.com/article/19/6/why-use-graphql)
[#]: author: (Zach Lendon https://opensource.com/users/zachlendon/users/goncasousa/users/patrickhousley)

为什么使用 GraphQL?
======

> 这就是 GraphQL 在标准 REST API 技术上获得发展的原因。

[][1]

正如我[以前][3]所写，[GraphQL][2] 是下一代 API 技术，它正在改变客户端应用程序与后端系统的通信方式以及后端系统的设计方式。

由于一开始就从创建它的组织 Facebook 获得了支持，并得到了其他技术巨头（如 Github、Twitter 和 AirBnB）的支持，因此 GraphQL 作为应用程序系统的关键技术的地位似乎是可靠的 —— 无论现在还是将来。

### GraphQL 在崛起

移动应用程序性能和组织敏捷性重要性的提高为 GraphQL 登上现代企业体系结构的顶端提供了助推器。

鉴于 [REST][4] 是一种非常流行的体系结构风格，早已提供了数据交互机制，与 [REST][4] 相比，GraphQL 这项新技术具有哪些优势？GraphQL 中的 “QL” 代表查询语言，而这是一个很好的起点。

借助 GraphQL，组织内的不同客户端应用程序可以轻松地仅查询所需数据，从而取代了其他 REST 方法，并提高了实际应用程序的性能。 使用传统的 [REST][4] API 端点，客户端应用程序将详询服务器资源，并接收包含了与请求匹配的所有数据的响应。如果来自 [REST][4] API 端点的成功响应返回 35 个字段，那么客户端应用程序就会接收 35 个字段。

### 提取的问题

传统上，[REST][4] API 无法为客户端应用程序提供简便的方法来仅检索或更新它们关心的数据。这通常被描述为“<ruby>过度获取<rt>over-fetching</rt></ruby>”的问题。随着移动应用程序在人们的日常生活中的普遍使用，过度获取问题会给现实世界带来不良后果。移动应用程序需要发出的每个请求都必须发送和接收的每个字节，对最终用户的性能造成的负面影响越来越大。数据连接速度较慢的用户尤其会受到不太好的 API 设计方案的影响。在性能体验不佳时，使用移动应用程序的客户更有可能不购买产品或不使用服务。低效的 API 设计只会浪费公司的钱。

并非只有“过度获取”是问题，“欠缺获取”同样也是问题。默认情况下，仅返回客户端实际需要的部分数据的端点或许会要求客户端进行其他调用以满足其数据需求，这就需要其他的 HTTP 请求。由于过度和欠缺的获取问题及其对客户端应用程序性能的影响，促进有效获取的 API 技术才有机会在市场上引起轰动 —— GraphQL 大胆地介入并填补了这一空白。

### REST 的应对

[REST][4] API 设计师不战而退，他们尝试通过以下几种方式来应对移动应用程序性能问题：

* “include” 和 “exclude” 查询参数，允许客户端应用程序通过可能较长的查询格式来指定所需的字段。
* “复合”服务，组合了多个端点，以使客户端应用程序在其发出的请求数量和接收到的数据方面更高效。
   
尽管这些模式是 [REST][4] API 社区为解决移动客户端所面临的挑战而做出的英勇尝试，但它们在以下几个关键方面仍存在不足：

* 包含和排除查询的键/值对很快变得混乱，特别是对于需要嵌套“点表示法”语法（或类似方法）以包含和排除更深的目标数据的对象图而言。此外，在此模型中调试查询字符串的问题通常需要手动分解 URL。
* 包含和排除查询的服务器实现通常是自定义的，因为基于服务器的应用程序没有标准的方式来处理包含和排除查询的使用，就像没有定义包含和排除查询的标准方式一样。
* 复合服务的兴起创建了更加紧密耦合的后端和前端系统，需要加强协调以交付项目，并且一旦将敏捷项目转回瀑布式。这种协调和耦合顺便还能稍减组织敏捷性的痛苦。此外，根据定义，组合服务不是 RESTful。
   
### GraphQL 的起源

对于 Facebook 来说，从其 2011-2012 年基于 HTML5 版本的旗舰移动应用程序中感受到的痛点和体验，才造就了 GraphQL。Facebook 工程师意识到提高性能至关重要，因此意识到他们需要一种新的 API 设计来确保最佳性能。可能考虑到以上 [REST][4] 的局限性，并且需要支持许多 API 客户端的不同需求，因此人们开始去了解其共同创建者 Lee Byron 和 Dan Schaeffer（那时尚是 Facebook 员工）撒播下的早期种子，创建了后来被称之为 GraphQL 的技术。

通过 GraphQL 查询语言，客户端（通常是单个 GraphQL 端点）应用程序通常可以显著减少所需的网络调用数量，并确保仅检索所需的数据。在许多方面，这可以追溯到早期的 Web 编程模型，在该模型中，客户端应用程序代码将直接查询后端系统，有些人可能还记得 10 到 15 年前在 JSP 上用 JSTL 编写 SQL 查询吧！

现在最大的区别是使用 GraphQL，我们有了一个跨多种客户端和服务器语言和库实现的规范。借助 GraphQL 这样一种 API 技术，我们通过引入 GraphQL 应用程序中间层来分离后端和前端应用程序系统，该层提供了一种以与组织的业务领域相一致的方式来访问组织数据的机制。

除了解决软件工程团队遇到的技术挑战之外，GraphQL 还促进了组织敏捷性的提高，特别是在企业中。启用 GraphQL 的组织敏捷性通常归因于以下因素：

 * GraphQL API 设计人员和开发人员无需在客户端需要一个或多个新字段时创建新的端点，而是能够将这些字段包含在现有的图形实现中，从而以较少的开发工作量和跨应用程序系统的较少更改的方式公开新功能。
 *  通过鼓励 API 设计团队将更多的精力放在定义对象图上，而不是在专注于客户端应用程序交付上，前端和后端软件团队为客户交付解决方案的速度日益解耦。
   
### 采纳之前的注意事项

尽管 GraphQL 具有引人注目的优势，但 GraphQL 并非没有实施挑战。一些例子包括：

* 为 [REST][4] API 建立的缓存机制更加成熟。
* 用于使用 [REST][4] 来构建 API 的模式已经非常完善。
* 尽管工程师可能更喜欢 GraphQL 等新技术，但与 GraphQL 相比，市场上的人才库更多是从事于构建基于 [REST][4] 的解决方案。

### 结论

通过同时提高性能和组织敏捷性，GraphQL 在公司中的采纳在过去几年中猛增。但是，与 RESTful API 设计生态系统相比，它确实还需要更成熟一些。

GraphQL 的一大优点是，它并不是作为替代 API 解决方案的批发替代品而设计的。相反，可以实现 GraphQL 来补充或增强现有的 API。因此，鼓励公司探索逐步采用 GraphQL 的方法，这对他们来说最有意义，他们发现它对应用程序性能和组织敏捷性具有最大的积极影响。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/why-use-graphql

作者：[Zach Lendon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/zachlendon/users/goncasousa/users/patrickhousley
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_graph_stats_blue.png?itok=OKCc_60D
[2]: https://graphql.org/
[3]: https://opensource.com/article/19/6/what-is-graphql
[4]: https://en.wikipedia.org/wiki/Representational_state_transfer
