[#]: collector: (lujun9972)
[#]: translator: (CanYellow)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Roy Fielding's Misappropriated REST Dissertation)
[#]: via: (https://twobithistory.org/2020/06/28/rest.html)
[#]: author: (Two-Bit History https://twobithistory.org)

被误用的罗伊·菲尔丁的有关描述性状态迁移的博士论文
======

符合描述性状态迁移的 (RESTful,REST译自审定公布名词数据库) 应用程序接口 (API) 无处不在。有趣的是又有多少人真正了解“符合描述性状态迁移”的应有之义呢？

大概我们中的大多数人都会跟[黑客新闻网站上的这篇公开问答][1]产生共鸣：

> 我阅读了几篇介绍描述性状态迁移(REST)的文章，甚至包括原始论文的部分章节。然而我仍然对REST
到底是什么只有一个相当模糊的想法。我开始认为没有人真的了解它，它仅仅是一个定义相当不充分的概念。

我曾经计划写一篇有关REST的博客，在里面探讨REST是如何成为这样一个在网络通信领域占主导地位的范式的。我通过阅读[2000年发表的罗伊·菲尔丁(Roy Fielding)的博士论文][2]开始我的研究，这篇博士论文向世人介绍了REST的概念。在读过菲尔丁的博士论文以后，我意识到，相比之下，更引人注意的是菲尔丁的理论缘何受到如此普遍的误解。

(相对公平地说)很多人知道REST源自Fielding的博士论文，但并没有读过该论文。因此对于这篇博士论文的原始内容的误解才得以流行。

最大的误解是：这篇博士论文直接讨论了构建API(API)的问题，我此前一直认为REST从一开始就打算成为构建在超文本传输协议(HTTP)之上的网络API(Web API)的架构模型，我相信很多人也这样认为。我猜测此前可能存在一个混乱的试验时期，开发人员采用完全错误的方式在HTTP基础上开发API，然后Fielding出现了并提出了将REST做为网络应用程序开发的正确方式。但是这种想法的时间线对不上：我们今天所熟知的网络服务的API并非是在Fielding出版他的博士论文之后才出现的新生事物。

Fielding的博士论文(名为“架构风格与基于网络的软件架构设计”)(译者注，网络中文版的中文译名)不是讨论如何在HTTP的基础上构建API，而恰恰是讨论HTTP本身。Fielding是HTTP/1.0版规范的贡献者同时也是HTTP/1.1版的共同作者。有感于从HTTP的设计中获得的架构经验，他的博士论文将REST视为指导HTTP/1.1的标准化过程的架构原则的精华。举例而言，他拒绝了使用`MGET`和`MHEAD`方法进行批量请求的提议，因为他认为这违反了REST所定义的约束条件，尤其是在一个符合REST的系统中传递的消息应该是易于代理和缓存的约束条件。[1][3]因此，HTTP/1.1转而围绕持久性连接设计，在此基础上可以发送多个HTTP请求。（Fielding同时认为网页保存在本地的浏览记录(cookies)是不RESTful的，因为它们在一个状态无关的系统中增加了状态描述，然而它们的应用已经根深蒂固了。)[2][4]Fielding认为，REST并非构建基于HTTP的系统的操作指南，而是扩展HTTP的操作指南。

这并不意味着Fielding认为REST不能用于构建其他系统。只是他假定其他系统也是“分布式超媒体系统”(distributed hypermedia systems)。人们对REST还有另一个误解：认为它是一个可以用在任何网络应用中的通用架构。但是从这篇博士论文中Fielding介绍REST的部分你基本上能够得出如下的结论，“请注意，我们只设计了HTTP，但是如果你发现你自己也在设计一个_分布式超媒体系统_，你也应该采用我们提出的称为REST的优秀架构，以让开发变得更容易”。有鉴于互联网已经存在了，我们尚不清楚为什么Fielding认为有人可能试图重新创建这样一个(和HTTP一样的)系统。或许在2000年的时候世界上仍然存在应用不只一个分布式超文本系统的空间吧。无论如何，Fielding已经说得很清楚了，REST意在提供一套解决方案，来解决在试图经由网络连接超文本内容时出现的弹性伸缩与一致性问题，_而不是_作为分布式应用的通用架构模型。

我们现在只记得Fielding的博士论文提出了REST的概念，但事实上，他的博士论文是在讨论通用的软件架构有多么糟糕以及如何更好地选择符合你需求的软件架构。这篇博士论文中仅用了一个章节来讨论REST本身，大量的文本内容都都花在了对你能够在网络应用中运用的不同的架构风格[3][5]的分类上。这些架构风格包括：受Unix的管道设计启发的管道-过滤器(Pipe-and-Filter, PF)风格，客户-服务器(Client-Server, CS)风格的多种改型。这些改型包括分层-客户-服务器(Layered-Client-Server, LCS)风格、客户-缓存-无状态-服务器(Client-Cache-Stateless-Server,C$SS)风格和分层-客户-缓存-无状态-服务器(Layered-Client-Cache-Stateless-Server, LC$SS)。这些原始风格未必实用，但是Fielding认为我们可以通过混合匹配现有风格提供的约束条件来派生出新的风格。REST就是通过这种方式产生的，因此也可以称之为一致性-分层-按需代码-客户-缓存-无状态-服务器(Uniform-Layered-Code-on-Demand-Client-Cache-Stateless-Server, ULCODC$SS)风格，虽然我们并没有这样做。Fielding建立上述分类是为了强调(每一种风格对应的)约束适用于不同的应用。而上述最后一种风格对应的约束是他所认为的最适用于HTTP的。

今天，REST的无处不在是极具讽刺意味的。REST在各种各样的网络应用中被盲目使用，但是Fielding最初只是将REST视作一种指引，通过它指导人们裁剪一种软件架构来适应独立应用的特殊需求。

我极力弄清楚这是如何发生的，毕竟Fielding已经明确地指出了不让形式服从功能的陷阱。他在论文的一开始就作出了警告：由于没有正确地理解软件架构而“使用流行的架构设计是经常发生的”[4][6]。他在几页之后又重新强调了这一点：

> 一些架构风格经常被认为是适用于一切软件形式的锦囊妙计。然而，一名资深的设计人员应该选择能够满足解决特定问题的需要的架构风格[5][7]。

REST自身显然不是这样的锦囊妙计。正如Fielding所指出的，它包含了可能不合适的利弊权衡，除非你试图构建一个分布式超媒体应用：

> REST设计用来进行大粒度的超媒体数据传输，并对网络应用场景中的常用见情形做了优化，但是可能会导致其在与其他形式的软件架构相互作用时不协调。[6][8]

Fielding提出REST是因为网络发展提出了“超越政府的可扩展性(anarchic scalability)”这一棘手问题。在Fielding看来“超越政府的可扩展性”意即跨越不同组织与政府的边界进行文档的高效连接的需求。REST所应用的约束是仔细选择的以用来解决这一“超越政府的扩展性”问题。_面向公众_的网络服务API同样需要解决类似的问题，因此可以理解为什么REST在这些应用中是适用的。时至今日，即使后端应用只需要同工程团队具有完全控制权的客户端交互，仍然有工程团队使用REST开发后端应用，这样的发现一点也不令人惊讶。我们都成为了[蒙蒂巨蟒团队(Monty Python)的独幕滑稽剧][9]中的建筑师，那位建筑师设计了一座具有屠宰场风格的公寓大楼，因为他们只有修建屠宰场的经验。(Fielding使用了这部滑稽剧中的一句台词作为他的博士论文的题词：打扰一下，你说的是“刀”吗？)

有鉴于Fielding的博士论文一直在极力避免提供一种放之四海而皆准的软件架构，REST又怎么会成为所有网络服务的事实上的标准呢？

我认为，在21世纪头十年的中期人们已经厌倦了简单对象访问协议(SOAP)，因此想要创造另一种属于他们自己的四字首字母缩略词。


我只是半开玩笑。简单对象访问协议(SOAP)是一个冗长而复杂的协议，以致于你没法在不事先理解一堆互相关联的可扩展标记语言(XML)规范的基础上使用它。早期的网络服务提供基于SOAP的API。在21世纪头十年中期，随着越来越多的API的提供，被SOAP的复杂性激怒的软件开发者随之集体迁移。

SOAP引起了这群人的蔑视，Rails 之父戴维·海涅迈尔·汉森( David Heinemeier Hansson，译自其所著的《重来》的中文版的作者译名)曾经评论：“我们感觉SOAP过于复杂了，它已经被企业人员接管。而当这一切发生的时候，通常没有什么好结果。”[7][10] 始于这一标志性的评论，Ruby-on-Rails于2007年放弃了对SOAP的支持。“企业人员”总是希望所有内容都被正式指定，反对者认为这是浪费时间。

如果反对者不再继续使用SOAP，他们仍然需要一些标准化的方式来进行工作。所有人都在使用HTTP，而且因为HTTP对代理与缓存的支持，所有人都至少会继续使用HTTP作为传输层。因此最简单的解决方案就是依赖HTTP的现有语义。这正是他们所做的工作。他们曾经称之为：去它的，重载HTTP(即FIOH)。这曾经是真实的名称，任何曾经试图决定业务逻辑错误需要返回什么HTTP状态码的人都能证明这一点。但是在所有进入SOAP的正式规范工作的映衬下，这显得鲁莽而乏味。

幸运的是，出现了这篇由HTTP/1.1规范的共同作者创作的博士论文。这篇博士论文与扩展HTTP有某种模糊的联系，并给予了FIOH一个具有学术体面的外表。因此REST非常适合用来掩饰其实仅仅是FIOH的东西。

我并不是说这是真正发生的事情，或者在所有对REST的滥用初期存在一个真实的阴谋，但是这段历史有助于我理解这样一个现实，即在Fielding的博士论文根本就不是讨论网络服务API的情况下，REST是如何成为用于网络服务API的架构模型的。采用REST的约束存在一些效果，尤其是对于那些面向公众的需要跨越组织边界的API来说。这些API通常会从REST的“统一接口”中受益。这应该是REST起初被提及与构建网络API相关的核心原因。但是想象一个部分因为市场的原因借用了“REST”这一名称的独立存在的被称为“FIOH”的架构，这有助于我理解存在于我们今天所理解的RESTful API与Fielding最初描述的REST的架构风格之间的诸多差异。

举例而言，追求纯正的REST的人经常抱怨，那些所谓RESTful API实际并不是REST API，因为它们根本就没有使用超文本作为应用程序状态引擎(HATEOAS)。Fielding本人也做出过[这样的批评][11]。根据Fielding的观点，一个真正的REST API应当允许你通过跟随链接实现从一个基础端点访问所有的端点。如果你认为这些人的确在试图构建RESTful API，那么存在一个明显的疏漏——使用超文本作为应用程序状态引擎的确是Fielding最初提出的REST概念的基础，尤其是考虑到“描述性状态迁移(REST)”中的“状态迁移(ST)”意指使用资源之间的超链接进行状态机的导航(而不是像很多人所相信的那样通过线路传输资源状态)[8][12]。但是你试想一下，如果每个人都只是在构建FIOH的API，并明里暗里的将之作为REST API宣传，或者更诚实一点说是作为RESTful API宣传，那么自然使用超文本作为应用程序状态引擎也就不重要了。

类似的，你可能会感到惊讶：尽管软件开发者喜欢不断地争论使用PUT方法还是使用PATCH方法来更新资源更加RESTful，Fielding的博士论文却没有讨论HTTP中的方法与增删改查(CURD)操作之间的映射关系。在HTTP操作与CURD操作之间建立一个标准的映射表是有用的，但是这一映射表是FIOH的一部分而不是REST的一部分。

这就是为什么我们应该认为“REST”这一术语是被误用了而不是说没有人理解REST。REST API这一现代概念与Fielding的REST架构之间存在历史联系，但事实上它们是两个不同的概念。历史联系适合作为确定何时构建RESTful API的指引而留在心底。你的API需要像HTTP那样跨越组织和政府边界吗？如果是的话，那么构建具有统一的可预测的接口的RESTful API可能是正确的方式。如果不是的话，你最好记住，Fielding更倾向于形式服从功能。或许类似 GraphQL 的方案或者仅仅 JSON-RPC 更适合您试图完成的工作。


  1. Roy Fielding. “Architectural Styles and the Design of Network-based Software Architectures,” 128. 2000. University of California, Irvine, PhD Dissertation, accessed June 28, 2020, <https://www.ics.uci.edu/~fielding/pubs/dissertation/fielding_dissertation_2up.pdf>. [↩︎][16]

  2. Fielding, 130. [↩︎][17]

  3. Fielding distinguishes between software architectures and software architecture “styles.” REST is an architectural style that has an instantiation in the architecture of HTTP. [↩︎][18]

  4. Fielding, 2. [↩︎][19]

  5. Fielding, 15. [↩︎][20]

  6. Fielding, 82. [↩︎][21]

  7. Paul Krill. “Ruby on Rails 2.0 released for Web Apps,” InfoWorld. Dec 7, 2007, accessed June 28, 2020, <https://www.infoworld.com/article/2648925/ruby-on-rails-2-0-released-for-web-apps.html> [↩︎][22]

  8. Fielding, 109. [↩︎][23]




--------------------------------------------------------------------------------

via: https://twobithistory.org/2020/06/28/rest.html

作者：[Two-Bit History][a]
选题：[lujun9972][b]
译者：[CanYellow](https://github.com/CanYellow)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twobithistory.org
[b]: https://github.com/lujun9972
[1]: https://news.ycombinator.com/item?id=7201871
[2]: https://www.ics.uci.edu/~fielding/pubs/dissertation/fielding_dissertation_2up.pdf
[3]: tmp.Ewi4FpMIg6#fn:1
[4]: tmp.Ewi4FpMIg6#fn:2
[5]: tmp.Ewi4FpMIg6#fn:3
[6]: tmp.Ewi4FpMIg6#fn:4
[7]: tmp.Ewi4FpMIg6#fn:5
[8]: tmp.Ewi4FpMIg6#fn:6
[9]: https://www.youtube.com/watch?v=vNoPJqm3DAY
[10]: tmp.Ewi4FpMIg6#fn:7
[11]: https://roy.gbiv.com/untangled/2008/rest-apis-must-be-hypertext-driven
[12]: tmp.Ewi4FpMIg6#fn:8
[13]: https://twitter.com/TwoBitHistory
[14]: https://twobithistory.org/feed.xml
[15]: https://twitter.com/TwoBitHistory/status/1247187881946275841?ref_src=twsrc%5Etfw
[16]: tmp.Ewi4FpMIg6#fnref:1
[17]: tmp.Ewi4FpMIg6#fnref:2
[18]: tmp.Ewi4FpMIg6#fnref:3
[19]: tmp.Ewi4FpMIg6#fnref:4
[20]: tmp.Ewi4FpMIg6#fnref:5
[21]: tmp.Ewi4FpMIg6#fnref:6
[22]: tmp.Ewi4FpMIg6#fnref:7
[23]: tmp.Ewi4FpMIg6#fnref:8
