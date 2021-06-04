[#]: subject: (4 essential characteristics of successful APIs)
[#]: via: (https://opensource.com/article/21/5/successful-apis)
[#]: author: (Tom Wilson https://opensource.com/users/tomwillson4014)
[#]: collector: (lujun9972)
[#]: translator: (ywxgod)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

成功API的4个基本特征
======
创建一个API(译者注：应用程序接口)，我们所要做的远远不止是让它能"正常工作。"
![看地图][1]

如果你正在构建基于C/S模型的应用程序，那么你需要一个应用程序接口(API)。API就是一种非常清晰而又明确的定义，它定义了一个过程(process)与另一个过程(process)之间的边界。 web应用中我们常见的边界定义就是 REST/JSON API.

虽然很多开发者可能主要关注在如何让API正常工作(或功能正常)，但却还有一些“非功能性”的要求也是需要他们注意的。 对于所有API我们有以下4个 _必须有的_ 非功能性的要求：

  * 安全
  * 文档
  * 校验
  * 测试



### 安全

在软件开发中，安全是最基本的要求。对于API开发者来说，API的安全性主要包含以下4个方面：

  1. HTTPS/SSL 证书
  2. 跨域资源共享
  3. 身份认证与JSON Web令牌
  4. 授权与范围划分



#### 1\. HTTPS/SSL 证书

Web应用的黄金标准是使用HTTPS协议，而HTTPS协议的使用是要有SSL证书。关于SSL证书，[Let's Encrypt][2]可以帮我们达到目的。 Let's Encrypt来自于非营利性的互联网安全研究小组(ISRG)，它是一个免费的、自动化的、开放的证书颁发机构。

Let's Encrypt的软件会为你的域(译者注:包含域名、IP等信息)生成一些权威的中央授权证书。而正是这些证书确保了，从你的API到客户端的点到点的数据都是被加密过的。

Let's Encrypt支持多种不同证书管理的部署方案。我们可以通过查看[文档][3]来找出最适合自己需要的方案。

#### 2\. 跨域资源共享

CORS是浏览器基于浏览器安全策略的一个预检。如果你的API服务器与发出请求的客户端不在同一个域中，那么你将要处理CORS。例如，如果你的服务器运行在**api.domain-a.com **并且接到一个来自**domain-b.com**的客户端的请求, 那么CORS就会(让浏览器)发送一个HTTP预检请求，以便查看你的API服务是否会接受来自此客户域的客户端请求。

[来自MDN的定义][4]:

> “跨域资源共享(CORS)是一种基于HTTP头的机制，这种机制允许服务器标记除自身源外的其他任何来源(域、方案或端口)。而对于这些被服务器标识的源，浏览器应该允许我们从它们加载资源。”

![CORS原理][5]

([MDN文档][4]， [CC-BY-SA 2.5][6])

另外，有很多用于[Node.js][7]的辅助库来[帮助API开发者处理CORS][8]。

#### 3\. 身份认证与JSON Web令牌

有多种方法可以验证你的API中的认证用户，但最好的方法之一是使用JSON Web令牌(JWT)，而这些令牌都是被各种知名的加密库进行签名过的。

当客户端登录时，身份管理服务会向客户端提供一个JWT(JSON Web令牌)。然后，客户端可以使用这个令牌向API发出请求，API收到请求后，从服务器读取公钥或私钥来验证这个令牌。

有一些现有的库，可以帮助我们对令牌进行验证，包括[jsonwebtoken][9]。关于JWT的更多信息，以及各种语言中对其的支持库，请查看[JWT.io][10]。 

![JWT验证示例][11]

(Tom Wilson, [Hyper63 blog][12])

#### 4\. 授权与范围划分

认证(或身份认证)很重要，但授权同样很重要。比如, _经过认证的客户端是否有权限让服务器执行某个请求呢？_ 这就是**scopes(范围划分)**的价值所在。 当身份管理服务器对客户端进行身份认证，且创建JWT令牌时，身份管理服务会给当前客户提供一个权限范围，这个权限范围将会决定当前客户的API请求能否被服务器执行。这样也就免去了服务器对访问控制列表的一些不必要的查询。

授权范围通常是一个文本块(通常以空格分隔)，用于描述一个API的访问能力。一般来说，范围被分为资源(Resources)与动作(Actions)。这种模式对REST/JSON API很有效，因为他们有相似的RESOURCE:ACTION结构。（例如，ARTICLE:WRITE或ARTICLE:READ，其中ARTICLE是资源，READ和WRITE是动作）。

授权范围的划分让我们的API能够专注于功能的实现，而不是去考虑各种角色和用户。 身份管理服务可以将不同的角色和用户分配不同的权限范围, 然后再将这些不同的授权范围提供给不同的JWT验证中的客户。

#### 总结

当我们开发和部署API时，安全应该一直是最重要的要求。虽然安全性是一个比较泛的话题，但如果能解决上面四个方面的问题，这对于你的API来说，在生产环境中将会表现得更好。

### 文档

_有什么能比没有文档更糟糕？ 过期的文档._

开发者对文档真的是又爱又恨。 尽管如此，文档仍然是API定义是否成功的一个关键部分。开发者需要从文档中知道如何使用这些API，且你创建的文档对于开发者如何更好地使用API也有着非常巨大的作用。

创建API文档，我们需要关注下面三个方面:

  1. 开发者入门文档 (自述文件/基本介绍)
  2. 技术参考 (说明书/规格)
  3. 使用方法 (如何开始和其他指南)



#### 1\. 入门文档

在构建API服务的时候，你需要明确一些事情，比如：这个API是干嘛的？如何建立开发者环境？如何测试该服务？如何提交问题？如何部署它？

通常我们可以通过README文件来回答上面的这些问题，README文件一般放在你的代码库中，用于为开发者提供使用你项目的最基本的起点和说明。

README文件应该包含:

  * API的描述
  * 技术参考与指南链接
  * 如何以开发者的身份设置你的项目
  * 如何测试这个项目
  * 如何部署这个项目
  * 依赖管理
  * 代码贡献指南
  * 行为准则
  * 许可证
  * 致谢



你的README文件应该简明扼要; 你不必解释每一个方面，但要提供足够的信息，以便开发者在熟悉你的项目后可以进一步深入研究。

#### 2\. 技术参考

在REST/JSON API中, 每一个具体的网址(endpoint)都对应一个特定的功能，所以每一个具体的网址(endpoint)都需要对应一个具体的说明文档，这显得非常重要，文档中会定义API的描述，输入和可能的输出，并为各种客户端提供使用示例。

[OpenAPI][13]是一个创建REST/JSON文档的标准, 它可以指导你完成编写API文档所需的各种细节。OpenAPI还可以为你的API生成演示文档。

#### 3\. 使用方法

对于API的用户来说，仅仅只有技术说明是不够的。他们还需要知道如何在一些特定的情况和场景下来使用这些API，而大多数的潜在用户可能希望通过你的API来解决他们所遇到的问题。

向用户介绍API的一个好的方法是利用一个“开始”页面。“开始”页面可以通过一个简单的用例引导用户，让他们迅速了解你的API能给他们能带来的益处。

#### 总结

对于任何完善的API，文档都是一个很关键的组成部分。当你在创建文档时，你需要关注API文档中的如何入门，技术参考以及如何快速开始等三个方面，这样你的API才算是一个完善的API。

### 校验

API开发过程中经常被忽视的一个点就是校验。 校验是一个验证来自外部源的输入的过程。 这些源可能给是客户端发送过来的JSON数据，或者是你请求别人的服务收到的响应数据。 我们不仅仅要检查这些数据的类型，还要确保这些数据确实是我们要的数据，这样可以消除很多潜在的问题。 了解你的边界以及你能控制的和不能控制的东西，对于API的数据校验来说这是一个很重要的方面。

最好的策略是在进入数据逻辑处理之前，在你能控制的边界的边缘处进行数据的校验。当客户端向你的API发送数据时，你需要对该数据做出任何处理之前应用你的验证，比如：确保email是真实的邮件地址, 日期数据有正确的格式, 字符串符合长度要求。

这种简单的检查可以为你的应用增加安全性和一致性。 还有，当你从某个服务接收数据时，比如数据库或缓存，你需要重新验证这些数据，以确保返回的结果符合你的数据校验。

你可以自己手写这些校验逻辑，当然也可以用像[Lodash][14]或[Ramda][15]这样的函数库，它们对于一些小的数据对象非常有用。像[Joi][16]，[Yup][17]，或[Zod][18]这样的验证库效果会更好，因为它们包含了一些常见的验证，可以节省你的时间和精力。除此，它们还能创建一个可读性强的模式。如果你需要看看与语言无关的东西，请看[JSON Schema][19]。

#### 总结

数据校验虽然并不显眼和突出(译者注：跟API的功能实现以及其他几个方面比), 但它可以帮你节省大量的时间。如果不做校验，这些时间将可能被用于故障排除和编写数据迁移脚本。真的不要相信你的客户端会发送干净的数据给你，也不要让验证不通过(bad data)的数据渗入到你的业务逻辑或持久数据存储中去。花点时间验证你的API收到的数据和请求到的响应数据，虽然在前期你可能会感到一些挫折和不适，但这总比你在后期花大量时间去做各种数据收紧管制，故障排除等要容易得多。

### 测试

测试是软件开发中的最佳实践，它应该是最主要的非功能性的要求。对于任何项目，包括API，确定测试策略都是一个挑战，因为你自始至终都要掌握各种约束，以便相应的来制定你的测试策略。

集成测试是测试API的最有效的方法之一。在集成测试模式中，开发团队会创建一个测试集用来覆盖应用流程中的一个点到另一个点。一个好的集成测试流程包括测试API的入口点以及模拟请求到服务端的响应。 搞定这两点，你就覆盖了整个逻辑，包括从API请求的开始到模拟服务器的响应，并返回数据给API。

虽然使用的是模拟, 但这种方法让能我们专注于代码逻辑层，而不需要去依赖后端服务和展示逻辑来进行测试。没有依赖的测试会更加可靠, 更容易 实现自动化，且更容易被接入持续集成管道流。

集成测试的实施中，我会用[Tape][20]，[Test-server][21]，和[Fetch-mock][22]。这些库让我们能够从API的请求到数据的响应进行隔离测试，使用 Fetch-mock还可以将出站请求捕获到持久层。

#### 总结

虽然其他的各种测试和类型检查对API也都有很好的益处，但集成测试在流程效率，构建和管理时间方面却有着更大的优势。 使用Fetch-mock这样的工具，可以在服务边界提供一个干净的模拟场景。

### 专注于基础

不管是设计和构建应用程序还是API，都要确保包含上面的四个基本要素。它们并不是我们唯一需要考虑的非功能性需求，其他的还包括应用监控，日志和API管理等都是的。 即便如此, 安全、文档、校验和测试这四个基本点，对于构建任何使用场景下的成功API都是至关重要的关注点。 

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/successful-apis

作者：[Tom Wilson][a]
选题：[lujun9972][b]
译者：[ywxgod](https://github.com/ywxgod)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/tomwillson4014
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tips_map_guide_ebook_help_troubleshooting_lightbulb_520.png?itok=L0BQHgjr (Looking at a map)
[2]: https://letsencrypt.org/
[3]: https://letsencrypt.org/docs/
[4]: https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS
[5]: https://opensource.com/sites/default/files/uploads/cors_principle_1.png (CORS principles)
[6]: https://creativecommons.org/licenses/by-sa/2.5/
[7]: https://nodejs.org
[8]: https://www.npmjs.com/search?q=CORS
[9]: https://github.com/auth0/node-jsonwebtoken
[10]: https://jwt.io
[11]: https://opensource.com/sites/default/files/uploads/jwt-verify-example.png (JWT verification example)
[12]: https://blog.hyper63.com/content/images/2021/03/jwt-verify-example.png
[13]: https://spec.openapis.org/oas/v3.1.0
[14]: https://lodash.com
[15]: https://ramdajs.com/
[16]: https://joi.dev/
[17]: https://github.com/jquense/yup
[18]: https://github.com/colinhacks/zod/tree/v3
[19]: https://json-schema.org/
[20]: https://github.com/substack/tape
[21]: https://github.com/twilson63/test-server
[22]: http://www.wheresrhys.co.uk/fetch-mock/
