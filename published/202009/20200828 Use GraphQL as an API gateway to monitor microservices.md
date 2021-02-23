[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12588-1.html)
[#]: subject: (Use GraphQL as an API gateway to monitor microservices)
[#]: via: (https://opensource.com/article/20/8/microservices-graphql)
[#]: author: (Rigin Oommen https://opensource.com/users/riginoommen)

使用 GraphQL 作为 API 网关来监控微服务
======

> 在问题导致关键的微服务瘫痪之前，使用 GraphQL 的监控功能帮助你及早发现问题。

![](https://img.linux.net.cn/data/attachment/album/202009/06/205052ve8eebyamcace4v8.jpg)

[微服务][2]和 [GraphQL][3] 就像面包和黄油一样，是一个很好的组合。它们本身都很棒，结合起来就更棒了。了解你的微服务的健康状况是很重要的，因为它们运行着重要的服务。如果等到某个关键的服务崩溃了才诊断问题，那是很愚蠢的。让 GraphQL 帮助你及早发现问题并不需要花费太多精力。

![GraphQL in Microservices][4]

常规的健康检查可以让你观察和测试你的服务，在问题影响到你的业务、客户或项目之前，尽早得到通知。说起来很简单，但健康检查到底要做什么呢？

以下是我在设计服务检查时考虑的因素：

服务器健康检查的要求：

  1. 我需要了解我的微服务的可用性状态。
  2. 我希望能够管理服务器的负载。
  3. 我希望对我的微服务进行端到端（e2e）测试。
  4. 我应该能够预测中断。

![Service health in microservices][5]

### 做服务器健康检查的方法

进行健康检查可能比较棘手，因为理论上，你可以检查的东西几乎是无穷无尽的。我喜欢从小处着手，运行最基本的测试：ping 测试。这只是测试运行应用的服务器是否可用。然后，我加强测试以评估特定问题，思考服务器中最重要的元素。我想到那些如果突然消失的话将是灾难性的事情。

  1. **Ping 检查：**Ping 是最简单的监控类型。它只是检查你的应用是否在线。
  2. **脚本化浏览器：**脚本化浏览器比较高级。像 [Selenium][6] 这样的浏览器自动化工具可以让你实现自定义的监控规则集。
  3. **API 测试：**API 测试用于监控 API 端点。这是 ping 检查模型的高级版本，你可以根据 API 响应来定义监控计划。

### 使用 GraphQL 进行健康检查

在一个典型的基于 REST 的微服务中，你需要从头开始构建健康检查功能。这是一个时间密集型的过程，但使用 GraphQL 就不用担心了。

根据它的[网站][7]称：

> “GraphQL 是一种用于 API 的查询语言，也是一种用现有数据完成这些查询的运行时环境。GraphQL 为你的 API 中的数据提供了一个完整的、可理解的描述，让客户有能力精确地仅查询他们所需要的东西，让 API 更容易随着时间的推移而进化，并实现强大的开发者工具。”

当你启动一个 GraphQL 微服务时，你还可以获得监控微服务的运行状况的供给。这是一个隐藏的宝贝。

正如我上面提到的，你可以用 GraphQL 端点执行 API 测试以及 ping 检查。

Apollo GraphQL 服务器提供了一个默认的端点，它可以返回有关你的微服务和服务器健康的信息。它不是很复杂：如果服务器正在运行，它就会返回状态码 200。

默认端点是 `<server-host>/.well-known/apollo/server-health`。

![Health Check with GraphQL][8]

### 高级健康检查

在某些情况下，基本的健康检查可能不足以确保系统的完整性。例如，紧密耦合的系统需要更多的业务逻辑来确保系统的健康。

Apollo GraphQL 在定义服务器的同时，通过声明一个 `onHealthCheck` 函数来有效地管理这种情况。

```
* Defining the Apollo Server */
const apollo = new ApolloServer({
  playground: process.env.NODE_ENV !== 'production',
  typeDefs: gqlSchema,
  resolvers: resolver,
  onHealthCheck: () => {
    return new Promise((resolve, reject) => {
      // Replace the `true` in this conditional with more specific checks!
      if (true) {
        resolve();
      } else {
        reject();
      }
    });
  }
});
```

当你定义一个 `onHealthCheck` 方法时，它返回一个 promise，如果服务器准备好了，它就会返回 `resolve`，如果有错误，它就会返回 `reject`。

GraphQL 让监控 API 变得更容易。此外，在你的服务器基础架构中使用它可以使代码变得可扩展。如果你想尝试采用 GraphQL 作为你的新基础设施定义，请参见我的 GitHub 仓库中的[示例代码和配置][9]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/microservices-graphql

作者：[Rigin Oommen][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/riginoommen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_analytics_cloud.png?itok=eE4uIoaB (Net catching 1s and 0s or data in the clouds)
[2]: https://opensource.com/resources/what-are-microservices
[3]: https://opensource.com/article/19/6/what-is-graphql
[4]: https://opensource.com/sites/default/files/uploads/graphql-microservices.png (GraphQL in Microservices)
[5]: https://opensource.com/sites/default/files/uploads/servicehealth.png (Service health in microservices)
[6]: https://www.selenium.dev/
[7]: https://graphql.org/
[8]: https://opensource.com/sites/default/files/uploads/healthcheck.png (Health Check with GraphQL)
[9]: https://github.com/riginoommen/example-graphql
