老树发新芽：微服务
======

![](https://csccommunity.files.wordpress.com/2018/05/old-building-with-modern-addition.jpg?w=610)

如果我告诉你有这样一种软件架构，一个应用程序的组件通过基于网络的通讯协议为其它组件提供服务，我估计你可能会说它是 …

是的，它和你编程的年限有关。如果你从上世纪九十年代就开始了你的编程生涯，那么你肯定会说它是 <ruby>[面向服务的架构][1]<rt> Service-Oriented Architecture</rt></ruby>（SOA）。但是，如果你是个年青人，并且在云上获得初步的经验，那么，你将会说：“哦，你说的是 <ruby>[微服务][2]<rt>Microservices</rt></ruby>。”

你们都没错。如果想真正地了解它们的差别，你需要深入地研究这两种架构。

在 SOA 中，服务是一个功能，它是定义好的、自包含的、并且是不依赖上下文和其它服务的状态的功能。总共有两种服务。一种是消费者服务，它从另外类型的服务 —— 提供者服务 —— 中请求一个服务。一个 SOA 服务可以同时扮演这两种角色。

SOA 服务可以与其它服务交换数据。两个或多个服务也可以彼此之间相互协调。这些服务执行基本的任务，比如创建一个用户帐户、提供登录功能、或验证支付。

与其说 SOA 是模块化一个应用程序，还不如说它是把分布式的、独立维护和部署的组件，组合成一个应用程序。然后在服务器上运行这些组件。

早期版本的 SOA 使用面向对象的协议进行组件间通讯。例如，微软的 <ruby>[分布式组件对象模型][3]<rt> Distributed Component Object Model</rt></ruby>（DCOM） 和使用 <ruby>[通用对象请求代理架构][5]<rt>Common Object Request Broker Architecture</rt></ruby>（CORBA） 规范的 <ruby>[对象请求代理][4]<rt> Object Request Broker</rt></ruby>（ORB）。

用于消息服务的最新的版本，有 <ruby>[Java 消息服务][6]<rt> Java Message Service</rt></ruby>（JMS）或者 <ruby>[高级消息队列协议][7]<rt>Advanced Message Queuing Protocol</rt></ruby>（AMQP）。这些服务通过<ruby>企业服务总线<rt>Enterprise Service Bus</rt></ruby>（ESB） 进行连接。基于这些总线，来传递和接收可扩展标记语言（XML）格式的数据。

[微服务][2] 是一个架构样式，其中的应用程序以松散耦合的服务或模块组成。它适用于开发大型的、复杂的应用程序的<ruby>持续集成<rt>Continuous Integration</rt></ruby>/<ruby>持续部署<rt>Continuous Deployment</rt></ruby>（CI/CD）模型。一个应用程序就是一堆模块的汇总。

每个微服务提供一个应用程序编程接口（API）端点。它们通过轻量级协议连接，比如，<ruby>[表述性状态转移][8]<rt> REpresentational State Transfer</rt></ruby>（REST），或 [gRPC][9]。数据倾向于使用 <ruby>[JavaScript 对象标记][10]<rt> JavaScript Object Notation</rt></ruby>（JSON）或 [Protobuf][11] 来表示。

这两种架构都可以用于去替代以前老的整体式架构，整体式架构的应用程序被构建为单个的、自治的单元。例如，在一个客户机 —— 服务器模式中，一个典型的 Linux、Apache、MySQL、PHP/Python/Perl (LAMP) 服务器端应用程序将去处理 HTTP 请求、运行子程序、以及从底层的 MySQL 数据库中检索/更新数据。所有这些应用程序“绑”在一起提供服务。当你改变了任何一个东西，你都必须去构建和部署一个新版本。

使用 SOA，你可以只改变需要的几个组件，而不是整个应用程序。使用微服务，你可以做到一次只改变一个服务。使用微服务，你才能真正做到一个解耦架构。

微服务也比 SOA 更轻量级。不过 SOA 服务是部署到服务器和虚拟机上，而微服务是部署在容器中。协议也更轻量级。这使得微服务比 SOA 更灵活。因此，它更适合于要求敏捷性的电商网站。

说了这么多，到底意味着什么呢？微服务就是 SOA 在容器和云计算上的变种。

老式的 SOA 并没有离我们远去，而因为我们不断地将应用程序搬迁到容器中，所以微服务架构将越来越流行。

--------------------------------------------------------------------------------

via: https://blogs.dxc.technology/2018/05/08/everything-old-is-new-again-microservices/

作者：[Cloudy Weather][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blogs.dxc.technology/author/steven-vaughan-nichols/
[1]:https://www.service-architecture.com/articles/web-services/service-oriented_architecture_soa_definition.html
[2]:http://microservices.io/
[3]:https://technet.microsoft.com/en-us/library/cc958799.aspx
[4]:https://searchmicroservices.techtarget.com/definition/Object-Request-Broker-ORB
[5]:http://www.corba.org/
[6]:https://docs.oracle.com/javaee/6/tutorial/doc/bncdq.html
[7]:https://www.amqp.org/
[8]:https://www.service-architecture.com/articles/web-services/representational_state_transfer_rest.html
[9]:https://grpc.io/
[10]:https://www.json.org/
[11]:https://github.com/google/protobuf/
