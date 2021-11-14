[#]: collector: "lujun9972"
[#]: translator: "MjSeven"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13983-1.html"
[#]: subject: "Scaling a GraphQL Website"
[#]: via "https://theartofmachinery.com/2020/06/29/scaling_a_graphql_site.html"
[#]: author: "Simon Arneaud https://theartofmachinery.com"

扩展一个 GraphQL 网站
======

![](https://img.linux.net.cn/data/attachment/album/202111/14/113411shrp6jpp3a8x1cjq.jpg)

我通常会抽象地总结我为他人所做的工作（出于显而易见的原因），但是我被允许公开谈论一个网站：[Vocal][1] 。我去年为它做了一些 SRE 工作。实际上早在 2 月份，我就在 [GraphQL 悉尼会议上做过一次演讲][2]，不过这篇博客推迟了一点才发表。

Vocal 是一个基于 GraphQL 的网站，它获得了人们的关注，然后就遇到了可扩展性问题，而我是来解决这个问题的。这篇文章会讲述我的工作。显然，如果你正在扩展一个 GraphQL 站点，你会发现这篇文章很有用，但其中大部分内容讲的都是当一个站点获得了足够的流量而出现的必须解决的技术问题。如果你对站点可扩展性有兴趣，你可能想先阅读 [最近我发表的一系列关于可扩展性的文章][3]。

### Vocal

![][4]

Vocal 是一个博客平台，内容包括日记、电影评论、文章评论、食谱、专业或业余摄影、美容和生活小贴士以及诗歌，当然，还有可爱的猫猫和狗狗照片。

![][5]

Vocal 的不同之处在于，它允许人们制作观众感兴趣的作品而获得报酬。作者的页面每次被浏览都可以获得一小笔钱，还能获得其他用户的捐赠。有很多专业人士在这个平台上展示他们的工作，但对于大多数普通用户来说，他们只是把 Vocal 当作一个兴趣爱好，碰巧还能赚些零花钱作为奖励。

Vocal 是新泽西初创公司 ~~[Jerrick Media][6]~~ 的产品，更新：Jerrick Media 已经更名为 Creatd，在纳斯达克上市。2015 年，他们与 [Thinkmill][7] 合作一起开发，Thinkmill 是一家悉尼中型软件开发咨询公司，擅长 JavaScript、React 和 GraphQL 开发。

### 剧透

不幸的是，有人告诉我，由于法律原因，我不能提供具体的流量数字，但公开的信息可以说明。Alexa 对所有网站按照流量进行排名。这是我演讲中展示的 Alexa 排名图，从 2019 年 11 月到今年 2 月，Vocal 流量增长到全球排名第 5567 位。

![去年 11 月到今年 2 月 Vocal 的全球排名从 9574 名增长到 5567 名][8]

曲线增长变慢是正常的，因为它需要越来越多的流量来赢得每个位置。Vocal 现在排名 4900 名左右，显然还有很长的路要走，但对于一家初创公司来说，这一点也不寒酸。大多数初创公司都很乐意与 Vocal 互换排名。

在网站升级后不久，Creatd 开展了一项营销活动，使流量翻了一番。在技术方面，我们要做的就是观察仪表盘上的上升的数字。自发布以来的 9 个月里，只有两个平台问题需要员工干预：[3 月份每五年一次的 AWS RDS 证书轮换][9]，以及一款应用推出时遇到的 Terraform 错误。作为一名 SRE，我很高兴看到 Vocal 不需要太多的平台工作来保持运行。更新：该系统也抗过了 2020 年的美国大选，没有任何意外。

以下是本文技术内容的概述：

  * 技术和历史背景
  * 从 MongoDB 迁移到 Postgres
  * 部署基础设施的改造
  * 使应用程序兼容扩展措施
  * 让 HTTP 缓存发挥作用
  * 其他一些性能调整

### 一些背景信息

Thinkmill 使用 [Next.js][10]（一个基于 React 的 Web 框架）构建了一个网站，和  [Keystone][11] 在 MongoDB 前面提供的 GraphQL API 进行交互。Keystone 是一个基于 GraphQL 的无头 CMS 库：在 JavaScripy 中定义一个模式，将它与一些数据存储挂钩，并获得一个自动生成的 GraphQL API 用于数据访问。这是一个自由开源软件项目，由 Thinkmill 提供商业支持。

#### Vocal V2

Vocal 的第一版就受到了关注，它找到了一个喜欢它的用户群，并不断壮大，最终 Creatd 请求 Thinkmill 帮助开发 V2，并于去年 9 月成功推出。Creatd 员工避免了 [第二个系统效应][12]，他们一般都是根据用户的反馈进行改变，所以他们 [主要是 UI 和功能更改，我就不赘述了][13]。相反，我将讨论下我的工作内容：使新站点更加健壮和可扩展。

声明：我很感谢能与 Creatd 以及 Thinkmill 在 Vocal 上的合作，并且他们允许我发表这个故事，但 [我仍然是一名独立顾问][14]，我写这篇文章没有报酬，甚至没有被要求写它，这仍然是我自己的个人博客。

### 迁移数据库

Thinkmill 在使用 MongoDB 时遇到了几个可扩展性问题，因此决定升级到 Keystone 5 以利用其新的 Postgres 支持。

如果你从事技术工作的时间足够长，那你可能还记得 00 年代末的 “NOSQL” 营销，这可能听起来很有趣。NoSQL 的一个重要特点是，像 Postgres 这样的关系数据库（SQL）不像 MongoDB 这样“网站级规模”的 NoSQL 数据库那样具有可扩展性。从技术上将，这种说法是正确的，但 NoSQL 数据库的可扩展性来自它可以有效处理各种查询的折衷。简单的非关系数据库（如文档数据库和键值数据库）有其一席之地，但当它们用作应用的通用后端时，应用程序通常会在超出关系数据库的理论扩展限制之前，就超出了数据库的查询限制。Vocal 的原本的大多数数据库查询在 MongoDB 上运行良好，但随着时间推移，越来越多的查询需要特殊技巧才能工作。

在技术要求方面，Vocal 与维基百科非常相似。维基百科是世界上最大的网站之一，它运行在 MySQL（或者说它的分支 MariaDB）上。当然，这需要一些重要的工程来实现，但在可预见的未来，我认为关系数据库不会对 Vocal 的扩展构成严重威胁。

我做过一个比较，托管的 AWS RDS Postgres 实例的成本不到旧 MongoDB 实例的五分之一，但 Postgres 实例的 CPU 使用率仍然低于 10%，尽管它提供的流量比旧站点多。这主要是因为一些重要的查询在文档数据库架构下一直效率很低。

迁移的过程可以新写一篇博客文章来讲述，但基本上是 Thinkmill 开发人员构建了一个 [ETL 管道][15]，使用 [MoSQL][16] 来完成这项繁重的工作。由于 Keystone 对于 Postgres 支持仍然比较基础，但它是一个 FOSS 项目，所以我能够解决在 SQL 生成性能方面遇到的问题。对于这类事情，我总是推荐 Markys Winand 的 SQL 博文：[使用 Luke 索引][17] 和 [现代 SQL][18]。他的文章很友好，甚至对那些暂时不太关注 SQL 人来说也是容易理解的，但他拥有你大多数需要的理论知识。如果你仍然有问题，一本好的、专注于即可性能的书可以帮助你。

### 平台

#### 架构

V1 是几个 Node.js 应用，运行在 Cloudflare（作为 CDN）背后的单个虚拟专用服务器（VPS）上。我喜欢把避免过度工程化作为一个高度优先事项，所以我对这一架构竖起了大拇指。然而，在 V2 开始开发时，很明显，Vocal 已经超越了这个简单的架构。在处理巨大峰值流量时，它没有给 Thinkmill 开发人员提供很多选择，而且它很难在不停机情况下安全部署更新。

这是 V2 的新架构：

![Vocal V2 的技术架构，请求从 CDN 进入，然后经过 AWS 的负载均衡。负载均衡将流量分配到两个应用程序 “Platform” 和 “Website”。“Platform” 是一款 Keystone 应用程序，将数据存储在 Redis 和 Postgres 中。][19]

基本上就是两个 Node.js 应用程序复制放在负载均衡器后面，非常简单。有些人认为可扩展架构要比这复杂得多，但是我曾经在一些比 Vocal 规模大几个数量级的网站工作过，它们仍然只是在负载均衡器后面复制服务，带有 DB 后端。你仔细想想，如果平台架构需要随着站点的增长而变得越来越复杂，那么它就不是真正“可扩展的”。网站可扩展性主要是解决那些破坏可扩展的实现细节。

如果流量增长得足够多，Vocal 的架构可能需要一些补充，但它变得更加复杂的主要原因是新功能。例如，如果（出于某种原因）Vocal 将来需要处理实时地理空间数据，那将是一个与博客文章截然不同的技术，所以我预期它会进行架构上的更改。大型网站架构的复杂性主要来自于复杂的功能。

不知道未来的架构应该是什么样子很正常，所以我总是建议你尽可能从简单开始。修复一个简单架构要比复杂架构更容易，成本也更低。此外，不必要的复杂架构更有可能出现错误，而这些错误将更难调试。

顺便说一下，Vocal 分成了两个应用程序，但这并不重要。一个常见的扩展错误是，以可扩展的名义过早地将应用分割成更小的服务，但将应用分割在错误的位置，从而导致更多的可扩展性问题。作为一个单体应用，Vocal 可以扩展的很好，但它的分割做的也很好。

#### 基础设施

Thinkmill 有一些人有使用 AWS 经验，但它主要是一个开发车间，需要一些比之前的 Vocal 部署更容易上手的东西。我最终在 AWS Fargate 上部署了新的 Vocal，这是弹性容器服务（ECS）的一个相对较新的后端。在过去，许多人希望 ECS 作为一个“托管服务运行 Docker 容器”的简单产品，但人们仍然必须构建和管理自己的服务器集群，这让人感到失望。使用 ECS Fargate，AWS 就可以管理集群了。它支持运行带有复制、健康检查、滚动更新、自动缩放和简单警报等基本功能的 Docker 容器。

一个好的替代方案是平台即服务（PaaS），比如 App Engine 或 Heroku。Thinkmill 已经在简单的项目中使用它们，但通常在其他项目中需要更大的灵活性。在 PaaS 上运行的网站规模要大得多，但 Vocal 的规模决定了使用自定义云部署是有经济意义的。

另一个明显的替代方案是 Kubernetes。Kubernetes 比 ECS Fargate 拥有更多的功能，但它的成本要高得多 —— 无论是资源开销还是维护（例如定期节点升级）所需的人员。一般来说，我不向任何没有专门 DevOps 员工的地方推荐 Kubernetes。Fargate 具有 Vocal 需要的功能，使得 Thinkmill 和 Creatd 能专心于网站改进，而不是忙碌于搭建基础设施。

另一种选择是“无服务器”功能产品，例如 AWS Lambda 或 Google 云。它们非常适合处理流量很低或很不规则的服务，但是 ECS Fargate 的自动伸缩功能足以满足 Vocal 的后端。这些产品的另一个优点是，它们允许开发人员在云环境中部署东西，但无需了解很多关于云环境的知识。权衡的结果是，无服务器产品与开发过程、测试以及调试过程紧密耦合。Thinkmill 内部已经有足够的 AWS 专业知识来管理 Fargate 的部署，任何知道如何开发 Node.js 简单的 Hello World 应用程序的开发人员都可以在 Vocal 上工作，而无需了解无服务器功能或 Fargate 的知识。

ECS Fargate 的一个明显缺点是供应商锁定。但是，避免供应商锁定是一种权衡，就像避免停机一样。如果你担心迁移，那么在平台独立性花费比迁移上更多的钱是没有意义的。在 Vocal 中，依赖于 Fargate 的代码总量小于 500 行 [Terraform][23]。最重要的是 Vocal 应用程序代码本身与平台无关，它可以在普通开发人员的机器上运行，然后打包成一个 Docker 容器，几乎可以运行在任何可以运行 Docker 容器的地方，包括 ECS Fargate。

Fargate 的另一个缺点是设置复杂。与 AWS 中的大多数东西一样，它处于一个 VPC、子网、IAM 策略世界中。幸运的是，这类东西是相对静态的（不像服务器集群一样需要维护）。

### 制作一个可扩展的应用程序

如果你想轻松地运行一个大规模的应用程序，需要做一大堆正确的事情。如果你遵循 <ruby>[应用程序设计的十二个守则][22]<rt>the Twelve-Factor App design</rt></ruby>，事情会变得容易，所以我不会在这里赘述。

如果员工无法规模化操作，那么构建一个“可扩展”系统就毫无意义 —— 就像在独轮车上安装喷气式发动机一样。使 Vocal 可扩展的一个重要部分是建立 CI/CD 和 [基础设施即代码][23] 之类的东西。同样，有些部署的思路也不值得考虑，因为它们使生产与开发环境相差太大（参阅 [应用程序设计守则第十守则][24]）。生产和开发之间的任何差异都会降低应用程序的开发速度，并且（在实践中）最终可能会导致错误。

### 缓存

缓存是一个很大的话题 —— 我曾经做过 [一个关于 HTTP 缓存的演讲][25]，相对比较基础。我将在这里谈论缓存对于 GraphQL 的重要性。

首先，一个重要的警告：每当遇到性能问题时，你可能会想：“我可以将这个值放入缓存中吗，以便再次使用时速度更快？”**微基准测试 _总是_ 告诉你：是的。** 然而，由于缓存一致性等问题，随处设置缓存往往会使整个系统 **变慢**。以下是我对于缓存的检查表：

  1. 是否需要通过缓存解决性能问题
  2. 再仔细想想（非缓存的性能往往更加健壮）
  3. 是否可以通过改进现有的缓存来解决问题
  4. 如果所有都失败了，那么可以考虑添加新的缓存

在 Web 系统中，你经常使用的一个缓存是 HTTP 缓存系统，因此，在添加额外缓存之前，试着使用 HTTP 缓存是一个好主意。我将在这篇文章中重点讨论这一点。

另一个常见的陷阱是使用哈希映射或应用程序内部其他东西进行缓存。[它在本地开发中效果很好，但在扩展时表现糟糕][26]。最好的办法是使用支持显式缓存库，支持 Redis 或 Memcached 这样的可插拔后端。

#### 基础知识

HTTP 规范中有两种类型缓存：私有和公共。私有缓存不会和多个用户共享数据 —— 实际上就是用户的浏览器缓存。其余的就是公共缓存。它们包括受你控制的（例如 CDN、Varnish 或 Nginx 等服务器）和不受你控制的（代理）。代理缓存在当今的 HTTPS 世界中很少见，但一些公司网络会有。

![][27]

缓存查找键通常基于 URL，因此如果你遵循“相同的内容，相同的 URL；不同的内容，不同的 URL” 规则，即，给每个页面一个规范的 URL，避免从同一个 URL 返回不同的内容这样“聪明”的技巧，缓存就会强壮一点。显然，这对 GraphQL API 端点有影响（我将在后面讨论）。

你的服务器可以采用自定义配置，但配置 HTTP 缓存的主要方法是在 Web 响应上设置 HTTP 头。最重要的标头是 `cache-control`。下面这一行说明所有缓存都可以缓存页面长达 3600 秒（一小时）：

```
cache-control: max-age=3600, public
```

对于针对用户的页面（例如用户设置页面），重要的是使用 `private` 而不是 `public` 来告诉公共缓存不要存储响应，防止其提供给其他用户。

另一个常见的标头是 `vary`，它告诉缓存，响应是基于 URL 之外的一些内容而变化。（实际上，它将 HTTP 头和 URL 一起添加到缓存键中。）这是一个非常生硬的工具，这就是为什么尽可能使用良好 URL 结构的原因，但一个重要的用例是告诉浏览器响应取决于登录的 cookie，以便在登录或注销时更新页面。

```
vary: cookie
```

如果页面根据登录状态而变化，你需要 `cache-control:private`（和 `vary:cookie`），即使是在公开的、已登出的页面版本上，以确保响应不会混淆。

其他有用的标头包括 `etag` 和 `last-modified`，但我不会在这里介绍它们。你可能仍然会看到一些诸如 `expires` 和 `pragma:cache` 这种老旧的 HTTP 标头。它们早在 1997 年就被 HTTP/1.1 淘汰了，所以我只在我想禁用缓存或者我感到偏执时才使用它们。

#### 客户端标头

鲜为人知的是，HTTP 规范允许在客户端请求中使用 `cache-control` 标头以减少缓存时间并获得最新响应。不幸的是，似乎大多数浏览器都不支持大于 0 的 `max-age` ，但如果你有时在更新后需要一个最新响应，`no-cache` 会很有用。

#### HTTP 缓存和 GraphQL

如上，正常的缓存键是 URL。但是 GraphQL API 通常只使用一个端点（比如说 `/api/`）。如果你希望 GraphQL 查询可以缓存，你需要查询参数出现在 URL 路径中，例如 `/api/?query={user{id}}&variables={"x":99}`（忽略了 URL 转义）。诀窍是将 GraphQL 客户端配置为使用 HTTP GET 请求进行查询（例如，[将 `apollo-link-http` 设置为 `useGETForQueries`][28] ）。

Mutation 不能缓存，所以它们仍然需要使用 HTTP POST 请求。对于 POST 请求，缓存只会看到 `/api/` 作为 URL 路径，但缓存会直接拒绝缓存 POST 请求。请记住，GET 用于非 Mutation 查询（即幂等），POST 用于 Mutation（即非幂等）。在一种情况下，你可能希望避免使用 GET 查询：如果查询变量包含敏感信息。URL 经常出现在日志文件、浏览器历史记录和聊天中，因此 URL 中包含敏感信息通常是一个坏主意。无论如何，像身份验证这种事情应该作为不可缓存的 Mutation 来完成，这是一个特殊的情况，值得记住。

不幸的是，有一个问题：GraphQL 查询往往比 REST API URL 大得多。如果你简单地切换到基于 GET 的查询，你会得到一些非常长的 URL，很容易超过 2000 字节的限制，目前一些流行的浏览器和服务器还不会接受它们。一种解决方案是发送某种查询 ID，而不是发送整个查询，即类似于 `/api/?queryId=42&variables={"x":99}`。Apollo GraphQL 服务器对此支持两种方式：

一种方法是 [从代码中提取所有 GraphQL 查询，并构建一个服务器端和客户端共享的查询表][29]。缺点之一是这会使构建过程更加复杂，另一个缺点是它将客户端项目与服务器项目耦合，这与 GraphQL 的一个主要卖点背道而驰。还有一个缺点是 X 版本和 Y 版本的代码可能识别一组不同的查询，这会成为一个问题，因为 1：复制的应用程序将在更新推出或回滚期间提供多个版本，2：客户端可能会使用缓存的 JavaScript，即使你升级或降级服务器。 

另一种方式是 Apollo GraphQL 所宣称的 [自动持久查询（APQ）][30]。对于 APQ 而言，查询 ID 是查询的哈希值。客户端向服务器发出请求，通过哈希查询。如果服务器无法识别该查询，则客户端会在 POST 请求中发送完整的查询，服务器会保存此次查询的散列值，以便下次识别。

![][31]

#### HTTP 缓存和 Keystone 5

如上所述，Vocal 使用 Keystone 5 生成 GraphQL API，而 Keystone 5 和 Apollo GraphQL 服务器配合一起工作。那么我们是如何设置缓存标头的呢？

Apollo 支持 GraphQL 模式的<ruby>缓存提示<rt>cache hint</rt></ruby>。巧妙地是，Apollo 会收集查询涉及的所有内容的所有缓存提示，然后它会自动计算适当的缓存标头值。例如，以这个查询为例：

```
query userAvatarUrl {
    authenticatedUser {
        name
        avatar_url
    }
}
```

如果 `name` 的最长期限为 1 天，而 `avatar_url` 的最长期限为 1 小时，则整体缓存最长期限将是最小值，即 1 小时。`authenticatedUser` 取决于登录 cookie，因此它需要一个 `private` 提示，它会覆盖其他字段的 `public`，因此生成的 HTTP 头将是 `cache-control:max-age=3600,private`。

我 [对 Keystone 列表和字段添加了缓存提示支持][32]。以下是一个简单例子，在文档的待办列表演示中给一个字段添加缓存提示：

```
const keystone = new Keystone({
  name: 'Keystone To-Do List',
  adapter: new MongooseAdapter(),
});

keystone.createList('Todo', {
  schemaDoc: 'A list of things which need to be done',
  fields: {
    name: {
      type: Text,
      schemaDoc: 'This is the thing you need to do',
      isRequired: true,
      cacheHint: {
        scope: 'PUBLIC',
        maxAge: 3600,
      },
    },
  },
});
```

#### 另一个问题：CORS

令人沮丧的是，<ruby>跨域资源共享<rt>Cross-Origin Resource Sharing</rt></ruby>（CORS）规则会与基于 API 网站中的缓存产生冲突。

在深入问题细节之前，让我们跳到最简单的解决方案：将主站点和 API 放在一个域名上。如果你的站点和 API 位于同一个域名上，就不必担心 CORS 规则（但你可能需要考虑 [限制 cookie][33]）。如果你的 API 专门用于网站，这是最简单的解决方案，你可以愉快地跳过这一节。

在 Vocal V1 中，网站（Next.js）和平台（Keystone GraphQL）应用程序处于不同域（`vocal.media`  和 `api.vocal.media`）。为了保护用户免受恶意网站的侵害，现代浏览器不会随便让一个网站与另一个网站进行交互。因此，在允许 `vocal.media` 向 `api.vocal.media` 发出请求之前，浏览器会对 `api.vocal.media` 进行“预检”。这是一个使用 `OPTIONS` 方法的 HTTP 请求，主要是询问跨域资源共享是否允许。预检通过后，浏览器会发出最初的正常请求。

令人沮丧的是，预检是针对每个 URL 的。浏览器为每个 URL 发出一个新的 `OPTIONS` 请求，服务器每次都会响应。[服务器没法说 `vocal.media` 是所有 `api.vocal.media` 请求的可信来源][34] 。当所有内容都是对一个 API 端点的 POST 请求时，这个问题并不严重，但是在为每个查询提供 GET 式 URL 后，每个查询都因预检而延迟。更令人沮丧的是，HTTP 规范说 `OPTIONS` 请求不能被缓存，所以你会发现你所有的 GraphQL 数据都被完美地缓存在用户身旁的 CDN 中，但浏览器仍然必须向源服务器发出所有的预检请求。

如果你不能只使用一个共享的域，有几种解决方案。

如果你的 API 足够简单，你或许可以利用 [CORS 规则的例外][35]。

某些缓存服务器可以配置为忽略 HTTP 规范，任何情况都会缓存 `OPTIONS` 请求。例如，基于 Varnish 的缓存和 AWS CloudFrone。这不如完全避免预检那么有效，但比默认的要好。

另一个很魔改的选项是 [JSONP][36]。当心：如果做错了，那么可能会创建安全漏洞。

#### 让 Vocal 更好地利用缓存

让 HTTP 缓存在底层工作之后，我需要让应用程序更好地利用它。 

HTTP 缓存的一个限制是它在响应级别上要么是全有要么是全无的。大多数响应都可以缓存，但如果一个字节不能缓存，那整个页面就无法缓存。作为一个博客平台，大多数 Vocal 数据都是可缓存的，但在旧网站上，由于右上角的菜单栏，几乎没有页面可以缓存。对于匿名用户，菜单栏将显示邀请用户登录或创建账号的链接。对于已登录用户，它会变成用户头像和用户个人资料菜单，因为页面会根据用户登录状态而变化，所以无法在 CDN 中缓存任何页面。

![Vocal 的一个典型页面。该页面的大部分内容都是高度可缓存的内容，但在旧网站中，由于右上角有一个小菜单，实际上没有一个内容是可缓存的。][37]

这些页面是由 React 组件的服务器端渲染（SSR）的。解决方法是将所有依赖于登录 cookie 的 React 组件，强制它们 [只在客户端进行延迟呈现][38]。现在，服务器会返回完全通用的页面，其中包含用于个性化组件（如登录菜单栏）的占位符。当页面在浏览器中加载时，这些占位符将通过调用 GraphQL API 在客户端填充。通用页面可以安全地缓存到 CDN 中。

这一技巧不仅提高了缓存命中率，还帮助改善了人们感知的页面加载时间。空白屏幕和旋转动画让我们不耐烦，但一旦第一个内容出现，它会分散我们几百毫秒的注意力。如果人们在社交媒体上点击一个 Vocal 帖子的链接，主要内容就会立即从 CDN 中出现，很少有人会注意到，有些组件直到几百毫秒后才会完全出现。

顺便说一下，另一个让用户更快地看到第一个内容的技巧是 [流式渲染][39]，而不是等待整个页面渲染完成后再发送。不幸的是，[Node.js 还不支持这个功能][40]。

拆分响应来提高可缓存性也适用于 GraphQL。通过一个请求查询多个数据片段的能力通常是 GraphQL 的一个优势，但如果响应的不同部分具有差别很大的缓存，那么最好将它们分开。举个简单的例子，Vocal 的分页组件需要知道当前页面的页数和内容。最初，组件在一个查询中同时获取两个页面，但由于页面的总数是所有页面的一个常量，所有我将其设置为一个单独的查询，以便缓存它。

#### 缓存的好处

缓存的明显好处是它减轻了 Vocal 后端服务器的负载。这很好。但是依赖缓存来获得容量是危险的，你仍然需要一个备份计划，以便当有一天你不可避免地放弃缓存。

提高页面响应速度是使用缓存是一个更好的理由。

其他一些好处可能不那么明显。峰值流量往往是高度本地化的。如果一个有很多社交媒体粉丝的人分享了一个页面的链接，那么 Vocal 的流量就会大幅上升，但主要是指向分享的那个页面及其元素。这就是为什么缓存擅长吸收最糟糕的流量峰值，它使后端流量模式相对更平滑，更容易被自动伸缩处理。

另一个好处是<ruby>优雅的退化<rt>graceful degradation</rt></ruby>。即使后端由于某些原因出现了严重的问题，站点最受欢迎的部分仍然可以通过 CDN 缓存来提供服务。

### 其他的性能调整

正如我常说的，可扩展的秘诀不是让事情变得更复杂。它只是让事情变得不比需要的更复杂，然后彻底解决所有阻碍扩展的东西。扩展 Vocal 的规模涉及到许多小事，在这篇文章中无法一一说明。

一个经验：对于分布式系统中难以调试的问题，最困难的部分通常是获取正确的数据，从而了解发生的原因。我能想到很多时候，我被困住了，只能靠猜测来“即兴发挥”，而不是想办法找到正确的数据。有时这行得通，但对复杂的问题却不行。

一个相关技巧是，你可以通过获取系统中每个组件的实时数据（甚至只是 `tail -F` 的日志），在不同的窗口中显示，然后在另一个窗口中单击网站来了解很多信息。比如：“为什么切换这个复选框会在后台产生这么多的 DB 查询？”

这里有个修复的例子。有些页面需要几秒钟以上的时间来呈现，但这个情况只会在部署环境中使用 SSR 时会出现。监控仪表盘没有显示任何 CPU 使用量峰值，应用程序也没有使用磁盘，所以这表明应用程序可能正在等待网络请求，可能是对后端的请求。在开发环境中，我可以使用 [sysstat 工具][42]来记录 CPU、RAM、磁盘使用情况，以及 Postgres 语句日志和正常的应用日志来观察应用程序是如何工作的。[Node.js 支持探测跟踪 HTTP 请求][42]，比如使用 [bpftrace][44]，但处于某些无聊的原因，它们不能在开发环境中工作，所以我在源代码中找到了探针，并创建了一个带有请求日志的 Node.js 版本。我使用 [tcpdump][45] 记录网络数据，这让我找到了问题所在：对于网站发出的每一个 API 请求，都要创建一个新的网络连接到 “Platform”。（如果这都不起作用，我想我会在应用程序中添加请求跟踪功能。）

网络连接在本地机器上速度很快，但在现实网络上却不可忽略。建立加密连接（比在生产环境中）需要更长时间。如果你向一个服务器（比如一个 API）发出大量请求，保持连接打开并重用它是很重要的。浏览器会自动这么做，但 Node.js 默认不会，因为它不知道你是否发出了很多请求，所以这个问题只出现在 SSR 上。与许多漫长的调试过程一样，修复却非常简单：只需将 SSR 配置为 [保持连接存活][46]，这样会使页面的呈现时间大幅下降。

如果你想了解更多这方面的知识，我强烈建议你阅读《[高性能浏览器网络][47]》这本书（可免费在线阅读），并跟进 [Brendan Gregg 发表的指南][48]。

### 你的站点呢？

实际上，我们还可以做很多事情来提升 Vocal 的速度，但我们没有全做。这是因为在初创公司和在大公司身为一个固定员工做 SRE 工作还是有很大区别的。我们的目标、预算和发布日期都很紧张，但最终我们的网站得到了很大改善，给了用户他们想要的东西。

同样的，你的站点有它自己的目标，并且可能与 Vocal 有很大的不同。然而，我希望这篇文章和它的链接至少能给你一些有用的思路，为用户创造更好的东西。

--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2020/06/29/scaling_a_graphql_site.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
[1]: https://vocal.media
[2]: https://www.meetup.com/en-AU/GraphQL-Sydney/events/267681845/
[3]: https://theartofmachinery.com/2020/04/21/what_is_high_traffic.html
[4]: https://theartofmachinery.com/images/scaling_a_graphql_site/vocal1.png
[5]: https://theartofmachinery.com/images/scaling_a_graphql_site/vocal2.png
[6]: https://jerrick.media
[7]: https://www.thinkmill.com.au/
[8]: https://theartofmachinery.com/images/scaling_a_graphql_site/alexa.png
[9]: https://aws.amazon.com/blogs/database/amazon-rds-customers-update-your-ssl-tls-certificates-by-february-5-2020/
[10]: https://github.com/vercel/next.js
[11]: https://www.keystonejs.com/
[12]: https://wiki.c2.com/?SecondSystemEffect
[13]: https://vocal.media/resources/vocal-2-0
[14]: https://theartofmachinery.com/about.html
[15]: https://en.wikipedia.org/wiki/Extract,_transform,_load
[16]: https://github.com/stripe/mosql
[17]: https://use-the-index-luke.com/
[18]: https://modern-sql.com/
[19]: https://theartofmachinery.com/images/scaling_a_graphql_site/architecture.svg
[20]: https://aws.amazon.com/fargate/
[21]: https://www.terraform.io/docs/providers/aws/r/ecs_task_definition.html
[22]: https://12factor.net/
[23]: https://theartofmachinery.com/2019/02/16/talks.html
[24]: https://12factor.net/dev-prod-parity
[25]: https://www.meetup.com/en-AU/Port80-Sydney/events/lwcdjlyvjblb/
[26]: https://theartofmachinery.com/2016/07/30/server_caching_architectures.html
[27]: https://theartofmachinery.com/images/scaling_a_graphql_site/http_caches.svg
[28]: https://www.apollographql.com/docs/link/links/http/#options
[29]: https://www.apollographql.com/blog/persisted-graphql-queries-with-apollo-client-119fd7e6bba5
[30]: https://www.apollographql.com/blog/improve-graphql-performance-with-automatic-persisted-queries-c31d27b8e6ea
[31]: https://theartofmachinery.com/images/scaling_a_graphql_site/apq.png
[32]: https://www.keystonejs.com/api/create-list/#cachehint
[33]: https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies#Define_where_cookies_are_sent
[34]: https://lists.w3.org/Archives/Public/public-webapps/2012AprJun/0236.html
[35]: https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS#Simple_requests
[36]: https://en.wikipedia.org/wiki/JSONP
[37]: https://theartofmachinery.com/images/scaling_a_graphql_site/cachablepage.png
[38]: https://nextjs.org/docs/advanced-features/dynamic-import#with-no-ssr
[39]: https://medium.com/the-thinkmill/progressive-rendering-the-key-to-faster-web-ebfbbece41a4
[40]: https://github.com/vercel/next.js/issues/1209
[41]: https://linux.die.net/man/1/tail
[42]: https://github.com/sysstat/sysstat/
[43]: http://www.brendangregg.com/blog/2016-10-12/linux-bcc-nodejs-usdt.html
[44]: https://theartofmachinery.com/2019/04/26/bpftrace_d_gc.html
[45]: https://danielmiessler.com/study/tcpdump/
[46]: https://www.npmjs.com/package/agentkeepalive
[47]: https://hpbn.co/
[48]: http://www.brendangregg.com/