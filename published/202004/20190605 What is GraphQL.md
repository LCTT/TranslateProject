[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12070-1.html)
[#]: subject: (What is GraphQL?)
[#]: via: (https://opensource.com/article/19/6/what-is-graphql)
[#]: author: (Zach Lendon https://opensource.com/users/zachlendon)

什么是 GraphQL？
======

> GraphQL 是一种查询语言、一个执行引擎，也是一种规范，它让开发人员重新思考如何构建客户端和 API 应用。

![](https://img.linux.net.cn/data/attachment/album/202004/04/112938odz6sbw6hzwsh7f6.jpg)

GraphQL 是当今软件技术中最大的流行语之一。但它*究竟*是什么？是像 [SQL][2] 一样的查询语言吗？是像 [JVM][3] 这样的执行引擎？还是像 [XML][4] 这样的规范？

如果你回答上面这些都是，那么你是对的！[GraphQL][5] 是一种查询语言的语法、是一种编程语言无关的执行引擎，也是一种不断发展的规范。

让我们深入了解一下 GraphQL 如何成为所有这些东西的，并了解一下人们为什么对它感到兴奋。

### 查询语言

GraphQL 作为查询语言似乎是合理的 —— 毕竟 “QL” 似乎重要到出现在名称中。但是我们查询什么呢？看一个示例查询请求和相应的响应可能会有所帮助。

以下的用户查询：

```
{
    user(id: 4) {
        name
        email
        phoneNumber
    }
}
```

可能会返回下面的 JSON 结果：

```
{
    "user": {
        "name": "Zach Lendon"
        “email”: “zach@hydrate.io”
        “phoneNumber”: “867-5309”
    }
}
```

想象一下，客户端应用查询用户详细信息、获取结果，并使用它填充配置屏幕。作为查询语言，GraphQL 的核心优势之一是客户端应用可以*只请求它需要*的数据，并期望以一致的方式返回这些数据。

那么 GraphQL 响应返回的*什么*呢？这就是执行引擎发挥的作用，通常是以 GraphQL 服务器的形式出现。

### 执行引擎

![GraphQL execution engine][7]

GraphQL 执行引擎负责处理 GraphQL 查询并返回 JSON 响应。所有 GraphQL 服务器由两个核心组件组成，分别定义了执行引擎的结构和行为：模式和解析器。

GraphQL 模式是一种自定义类型语言，它公开哪些查询既允许（有效），又由 GraphQL 服务器实现处理。上面用户示例查询的模式可能如下所示：

```
type User {
    name: String
    email: String
    phoneNumber: String
}

type Query {
    user: User
}
```

此模式定义了一个返回用户的用户查询。客户端可以通过用户查询请求用户上的任何字段，并且 GraphQL 服务器将仅返回请求的字段。通过使用强类型模式，GraphQL 服务器可以根据定义的模式验证传入的查询，以确保是有效的。

确定查询有效后，就会由 GraphQL 服务器的解析器处理。解析器函数支持每个 GraphQL 类型的每个字段。我们的这个用户查询的示例解析器可能如下所示：

```
Query: {
    user(obj, args, context, info) {
        return context.db.loadUserById(args.id).then(
            userData => new User(userData)
        )
    }
}
```

虽然上面的例子是用 JavaScript 编写的，但 GraphQL 服务器可以用任意语言编写。这是因为 GraphQL 也是*也是*一种规范！

### 规范

GraphQL 规范定义了 GraphQL 实现必须遵循的功能和特性。作为一个在开放网络基金会的最终规范协议（[OWFa 1.0][8]）下提供的开放规范，技术社区可以审查 GraphQL 实现必须符合规范的要求，并帮助制定 GraphQL 的未来。

虽然该规范对 GraphQL 的语法，什么是有效查询以及模式的工作方式进行了非常具体的说明，但它没有提供有关如何存储数据或 GraphQL 服务器应使用哪种编程语言实现的指导。这在软件领域是非常强大的，也是相对独特的。它允许以各种编程语言创建 GraphQL 服务器，并且由于它们符合规范，因此客户端会确切知道它们的工作方式。GraphQL 服务器已经有多种语言实现，人们不仅可以期望像 JavaScript、Java和 C# 这样的语言，还可以使用 Go、Elixir 和 Haskell 等。服务器实现所使用的语言不会成为采用过程的障碍。它不仅存在多种语言实现，而且它们都是开源的。如果没有你选择的语言的实现，那么可以自己实现。

### 总结

GraphQL 是开源 API 领域中一个令人兴奋的、相对较新的参与者。它将查询语言、执行引擎与开源规范结合在一起，它定义了 GraphQL 实现的外观和功能。

GraphQL 已经开始改变企业对构建客户端和 API 应用的看法。通过将 GraphQL 作为技术栈的一部分，前端开发人员可以自由地查询所需的数据，而后端开发人员可以将客户端应用需求与后端系统架构分离。通常，公司在使用 GraphQL 的过程中，首先会在其现有的后端服务之上构建一个 GraphQL API “层”。这使得客户端应用开始获得他们所追求的性能和运营效率，同时使后端团队有机会确定他们可能需要在 GraphQL 层后面的“幕后”进行哪些更改。通常，这些更改都是为了优化，这些优化有助于确保使用 GraphQL 的应用可以尽可能高效地运行。由于 GraphQL 提供了抽象性，因此系统团队可以进行更改的同时继续在其 GraphQL API 级别上遵守 GraphQL 的“合约”。

由于 GraphQL 相对较新，因此开发人员仍在寻找新颖而激动人心的方法来利用它构建更好的软件解决方案。GraphQL 将如何改变你构建应用的方式，它是否对得起众望所归？只有一种方法可以找到答案 —— 用 GraphQL 构建一些东西！

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/what-is-graphql

作者：[Zach Lendon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/zachlendon
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/analytics-graphs-charts.png?itok=sersoqbV (Analytics: Charts and Graphs)
[2]: https://opensource.com/article/18/2/getting-started-sql
[3]: https://www.cubrid.org/blog/understanding-jvm-internals/
[4]: https://www.w3.org/TR/xml/
[5]: http://graphql.org/
[6]: mailto:zach@hydrate.io
[7]: https://opensource.com/sites/default/files/pictures/graphql-execution-engine.png (GraphQL execution engine)
[8]: http://www.openwebfoundation.org/legal/the-owf-1-0-agreements/owfa-1-0---patent-only
