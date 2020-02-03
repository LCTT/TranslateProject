chenmu-kk is translating .
How the four components of a distributed tracing system work together
分布式追踪系统的四大功能模块如何协同工作
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/touch-tracing.jpg?itok=rOmsY-nU)
Ten years ago, essentially the only people thinking hard about distributed tracing were academics and a handful of large internet companies. Today, it’s turned into table stakes for any organization adopting microservices. The rationale is well-established: microservices fail in surprising and often spectacular ways, and distributed tracing is the best way to describe and diagnose those failures.
早在十年前，认真研究过分布式追踪基本上只有学者和一小部分大型互联网公司中的人。对于任何采用微服务的组织来说，它如今成为一种筹码。其公认的观点是：微服务通常会发生让人意想不到的错误，而分布式追踪则是描述和诊断那些错误的最好方法。

That said, if you set out to integrate distributed tracing into your own application, you’ll quickly realize that the term “Distributed Tracing” means different things to different people. Furthermore, the tracing ecosystem is crowded with partially-overlapping projects with similar charters. This article describes the four (potentially) independent components in distributed tracing, and how they fit together.
也就是说，一旦你准备将分布式追踪集成到你自己的应用程序中，你将很快意识到对于不同的人来说“分布式追踪”一词意味着不同的事物。此外，追踪生态系统挤满了具有相似内容的重叠项目。本文介绍了分布式追踪系统中四个（潜在的）独立的功能模块并描述了它们间将如何协同工作。

### Distributed tracing: A mental model
分布式追踪：一种思维模型

Most mental models for tracing descend from [Google’s Dapper paper][1]. [OpenTracing][2] uses similar nouns and verbs, so we will borrow the terms from that project:
大多数追踪的思维模型来源于[Google的Dapper论文][1]。[OpenTracing][2]会使用相似的术语，因此，我们从那借用了以下术语：

![Tracing][3]

  * **Trace:** The description of a transaction as it moves through a distributed system.
  事物在分布式系统运行的过程描述。
  * **Span:** A named, timed operation representing a piece of the workflow. Spans accept key:value tags as well as fine-grained, timestamped, structured logs attached to the particular span instance.
   一种命名的定时操作，表示工作流的一部分。 Spans 可接受 key : value 标签以及附加到特定 Span 实例的细粒度、带有时间戳的结构化日志。
  * **Span context:** Trace information that accompanies the distributed transaction, including when it passes from service to service over the network or through a message bus. The span context contains the trace identifier, span identifier, and any other data that the tracing system needs to propagate to the downstream service.
携带分布式事务的追踪信息，包括当它通过网络或消息总线将服务传递给服务时。 span 上下文包含 trace 标识符、 span 标识符以及追踪系统所需传播到下游服务的任何其他数据。  



If you would like to dig into a detailed description of this mental model, please check out the [OpenTracing specification][4].
如果你想要深入研究这种思维模式的细节，请仔细参照[OpenTracing技术规范][1]。

### The four big pieces
四大功能模块

From the perspective of an application-layer distributed tracing system, a modern software system looks like the following diagram:
从应用层分布式追踪系统的观点来看，现代软件系统架构如下图所示：

![Tracing][5]

The components in a modern software system can be broken down into three categories:
现代软件系统的组件可分为三类：

  * **Application and business logic:** Your code.
  应用程序和业务逻辑：你的代码。
  * **Widely shared libraries:** Other people's code.
  广泛共享库：他人的代码
  * **Widely shared services:** Other people’s infrastructure.
  广泛共享服务：他人的基础架构



These three components have different requirements and drive the design of the Distributed Tracing systems which is tasked with monitoring the application. The resulting design yields four important pieces:
这三类组件有着不同的需求，驱动监控应用程序的分布式追踪系统的设计。最终的设计得到了四个重要的部分：

  * **A tracing instrumentation API:** What decorates application code.
  追踪测试API：修饰应用程序代码
  * **Wire protocol:** What gets sent alongside application data in RPC requests.
  有线协议：在 RPC 请求中与应用程序数据一同发送的规定
  * **Data protocol:** What gets sent asynchronously (out-of-band) to your analysis system.
  数据协议：将异步信息（带外）发送到你的分析系统的规定
  * **Analysis system:** A database and interactive UI for working with the trace data.
  分析系统：用于处理追踪数据的数据库和交互式用户界面



To explain this further, we’ll dig into the details which drive this design. If you just want my suggestions, please skip to the four big solutions at the bottom.
为了更深入的解释这个概念，我们将深入研究驱动该设计的细节。如果你只需要我的一些建议，请跳转至下方的四大解决方案。

### Requirements, details, and explanations
需求，细节和解释

Application code, shared libraries, and shared services have notable operational differences, which heavily influence the requirements for instrumenting them.
应用程序代码、共享库以及共享式服务在操作上有显著的差别，这种差别严重影响了对其进行检测的请求操作。

#### Instrumenting application code and business logic
测试应用程序代码和业务逻辑

In any particular microservice, the bulk of the code written by the microservice developer is the application or business logic. This is the code that defines domain-specific operations; typically, it contains whatever special, unique logic justified the creation of a new microservice in the first place. Almost by definition, **this code is usually not shared or otherwise present in more than one service.**
在任何特定的微服务中，由微服务开发者编写的大段代码是应用程序或者商业逻辑。这段代码规定了特定区域的操作。通常，它包含任何特殊、独一无二的逻辑判断，这些逻辑判断首先证明了创建新型微服务的合理性。在几乎所有定义的操作中， 该代码通常不会在多个服务中共享或者以其他方式出现。

That said, you still need to understand it, and that means it needs to be instrumented somehow. Some monitoring and tracing analysis systems auto-instrument code using black-box agents, and others expect explicit "white-box" instrumentation. For the latter, abstract tracing APIs offer many practical advantages for microservice-specific application code:
也即是说你仍需理解它，这也意味着需要以某种方式对它进行测试。一些监控和追踪分析系统使用黑盒代理自动检测代码，另一些系统更想使用显式的白盒检测工具。对于后者，抽象追踪API 提供了许多对于微服务的应用程序代码来说更为实用的优势：

  * An abstract API allows you to swap in new monitoring tools without re-writing instrumentation code. You may want to change cloud providers, vendors, and monitoring technologies, and a huge pile of non-portable instrumentation code would add meaningful overhead and friction to that procedure.
  抽象API 允许你在不重新编写测试代码的条件下换新的监视工具。你可能想要变更云服务提供商，供应商和监测技术，而一大堆不可移植的检测代码将会为该过程增加有意义的开销和麻烦。
  * It turns out there are other interesting uses for instrumentation, beyond production monitoring. There are existing projects that use this same tracing instrumentation to power testing tools, distributed debuggers, “chaos engineering” fault injectors, and other meta-applications.
  事实证明，除了生产监控之外，该工具还有其他有趣的用途。现有的项目使用相同的追踪工具来驱动测试工具、分布式调试器、“混沌工程”故障注入器和其他元应用程序。
  * But most importantly, what if you wanted to extract an application component into a shared library? That leads us to:
  但更重要的是，若将应用程序组件提取到共享库中要怎么办呢？由上述内容可得到结论：



#### Instrumenting shared libraries
测试共享库

The utility code present in most applications—code that handles network requests, database calls, disk writes, threading, queueing, concurrency management, and so on—is often generic and not specific to any particular application. This code is packaged up into libraries and frameworks which are then installed in many microservices, and deployed into many different environments.
在大多数应用程序中出现的实用程序代码（处理网络请求、数据库调用、磁盘写操作、线程、并发管理等）通常情况下是通用的，而非特别应用于某个特定应用程序。这段代码会被打包成库和框架，而后就可以被装载到许多的微服务上并且被部署到多种不同的环境中。

This is the real difference: with shared code, someone else is the user. Most users have different dependencies and operational styles. If you attempt to instrument this shared code, you will note a couple of common issues:
其真正的不同是：对于共享代码，其他人则成为了使用者。大多数用户有不同的依赖关系和操作风格。如果尝试去使用该共享代码，你将会注意到几个常见的问题：

  * You need an API to write instrumentation. However, your library does not know what analysis system is being used. There are many choices, and all the libraries running in the same application cannot make incompatible choices.
  你需要一个 API 来编写测试工具。然而，你的库并不知道你正在使用哪个分析系统。会有多种选择，并且运行在相同应用下的所有库无法做出不兼容的选择。
  * The task of injecting and extracting span contexts from request headers often falls on RPC libraries, since those packages encapsulate all network-handling code. However, a shared library cannot not know which tracing protocol is being used by each application.
  由于这些包封装了所有网络处理代码，因此从请求报头注入和提取 span上下文的任务往往指向RPC库。然而，共享库必须了解到每个应用程序正在使用哪种追踪协议。
  * Finally, you don’t want to force conflicting dependencies on your user. Most users have different dependencies and operational styles. Even if they use gRPC, will it be the same version of gRPC you are binding to? So any monitoring API your library brings in for tracing must be free of dependencies.
  最后，你不想强制用户使用相互冲突的依赖项。大多数用户有不同的依赖关系和操作风格。即使他们使用gRPC会使它会成为你正在绑定的相同的gRPC版本？因此任何你的库附带用于追踪的监控API必定是免于依赖的。



**So, an abstract API which (a) has no dependencies, (b) is wire protocol agnostic, and (c) works with popular vendors and analysis systems should be a requirement for instrumenting shared library code.**
所以，一个无依赖的抽象API，是网络协议的不可知论，并且使用流行的供应商和分析系统应该是一个对于配置共享库代码的请求

#### Instrumenting shared services
配置共享服务

Finally, sometimes entire services—or sets of microservices—are general-purpose enough that they are used by many independent applications. These shared services are often hosted and managed by third parties. Examples might be cache servers, message queues, and databases.
最后，有时整个服务或微服务集合体的通用性足以使许多独立的应用程序使用它们。这种共享式服务通常由第三方托管和管理，例如缓存服务器、消息队列以及数据库。

It’s important to understand that **shared services are essentially "black boxes" from the perspective of application developers.** It is not possible to inject your application’s monitoring solution into a shared service. Instead, the hosted service often runs its own monitoring solution.
从应用程序开发者的角度来看，理解共享式服务本质上是黑盒子是极其重要的。它不可能将你的应用程序监控注入到共享式服务。恰恰相反，托管服务通常会运行它自己的监控方案。

### **The four big solutions**
四大解决方案

So, an abstracted tracing API would help libraries emit data and inject/extract Span Context. A standard wire protocol would help black-box services interconnect, and a standard data format would help separate analysis systems consolidate their data. Let's have a look at some promising options for solving these problems.
因此，一个抽象的追踪应用程序接口将会帮助库发出数据并且注入/抽取 Span Context。一个标准有线协议将会方案帮助黑盒服务相互连接，而且一个标准数据格式将会帮助分离分析系统固化其中的数据。让我们来看一下部分有希望解决这些问题的方案。

#### Tracing API: The OpenTracing project
追踪 API：OpenTracing项目

#### As shown above, in order to instrument application code, a tracing API is required. And in order to extend that instrumentation to shared libraries, where most of the Span Context injection and extraction occurs, the API must be abstracted in certain critical ways.
如你所见，我们需要一个追踪API 来检测应用程序代码。为了将这种工具扩展到大多数进行 Span Context 注入和提取的共享库中，则必须以某种关键方式对API进行抽象。

The [OpenTracing][2] project aims to solve this problem for library developers. OpenTracing is a vendor-neutral tracing API which comes with no dependencies, and is quickly gaining support from a large number of monitoring systems. This means that, increasingly, if libraries ship with native OpenTracing instrumentation baked in, tracing will automatically be enabled when a monitoring system connects at application startup.
[OpenTracing][2]项目主要针对解决库开发者的问题，OpenTracing 是一个与供应商无关的 Tracing API，它没有依赖关系并且能从许多监控系统中迅速获取支持。这意味着，如果库附带内置的本地 OpenTracing 工具，当监控系统在应用程序启动连接时，追踪将会自动启动。

Personally, as someone who has been writing, shipping, and operating open source software for over a decade, it is profoundly satisfying to work on the OpenTracing project and finally scratch this observability itch.
就个人而言，作为一个已经编写、发布和操作开源软件十多年的人，在 OpenTracing 项目上工作并最终解决这个观察性的难题令我十分满意。

In addition to the API, the OpenTracing project maintains a growing list of contributed instrumentation, some of which can be found [here][6]. If you would like to get involved, either by contributing an instrumentation plugin, natively instrumenting your own OSS libraries, or just want to ask a question, please find us on [Gitter][7] and say hi.
除了 API 之外，OpenTracing 项目还维护了一个不断增长的工具列表，其中一些可以在[这里][6]找到。如果你想参与进来，无论是通过提供一个插装插件，对你自己的OSS库进行本地测试，或者仅仅只想问个问题，都可以通过[Gitter][7]向我们打招呼。

#### Wire Protocol: The trace-context HTTP headers
有线协议： trace-context 的HTTP报头

In order for monitoring systems to interoperate, and to mitigate migration issues when changing from one monitoring system to another, a standard wire protocol is needed for propagating Span Context.
为了监控系统能进行交互操作以及减轻监控系统间切换事务时带来的迁移问题，需要标准的有线协议来传播 Span 上下文。

The [w3c Distributed Trace Context Community Group][8] is hard at work defining this standard. Currently, the focus is on defining a set of standard HTTP headers. The latest draft of the specification can be found [here][9]. If you have questions for this group, the [mailing list][10] and [Gitter chatroom][11] are great places to go for answers.
[w3c Distributed Trace Context Community Group][8]在努力制定此标准。目前的焦点是制定一系列标准的HTTP报头。该规范的最新草案可以在[此处][9]找到。如果你对这个组织有任何的疑问， [邮件列表][10] 和 [Gitter 聊天室][11]是很好的解惑地点。

#### Data protocol (Doesn't exist yet!!)
数据协议 （还未出现！！）

For black-box services, where it is not possible to install a tracer or otherwise interact with the program, a data protocol is needed to export data from the system.
对于黑盒服务，在无法安装追踪程序或无法与程序进行交互的情况下，需要使用数据协议从系统中导出数据。

Work on this data format and protocol is currently at an early stage, and mostly happening within the context of the w3c Distributed Trace Context Working Group. There is particular interest is in defining higher-level concepts, such as RPC calls, database statements, etc, in a standard data schema. This would allow tracing systems to make assumptions about what kind of data would be available. The OpenTracing project is also working on this issue, by starting to define a [standard set of tags][12]. The plan is for these two efforts to dovetail with each other.
目前这种数据格式和协议的开发工作尚处在初级阶段，并且大多在w3c分布式追踪上下文工作组的上下文中进行工作。 令人特别感兴趣的是在标准数据模式中定义更高级别的概念，例如 RPC 调用，数据库语句等。这将允许追踪系统对可用数据类型做出假设。OpenTracing 项目也通过定义一套 [标准标签集][12]来解决这一事务。该计划是为了使这两项努力结果相互配合。

Note that there is a middle ground available at the moment. For “network appliances” that the application developer operates, but does not want to compile or otherwise perform code modifications to, dynamic linking can help. The primary examples of this are service meshes and proxies, such as Envoy or NGINX. For this situation, an OpenTracing-compliant tracer can be compiled as a shared object, and then dynamically linked into the executable at runtime. This option is currently provided by the [C++ OpenTracing API][13]. For Java, an OpenTracing [Tracer Resolver][14] is also under development.
注意当前有一个中间地带。对于由应用程序开发者操作但不想编译或以其他方式执行代码修改的“网络设备”，动态链接可以帮助避免这种情况。主要的例子就是服务网格和代理，就像 Envoy 或者 NGINX。针对这种情况，可将兼容 OpenTracing 的追踪器编译为共享对象，然后在运行时动态链接到可执行文件中。目前[C++ OpenTracing API][13]提供了该选项。而 JAVA 的 OpenTracing [追踪器解析][14]也在开发中。

These solutions work well for services that support dynamic linking, and are deployed by the application developer. But in the long run, a standard data protocol may solve this problem more broadly.
这些解决方案适用于支持动态链接的服务，并由应用程序开发者开发。但从长远来看，标准的数据协议可以更广泛地解决该问题。

#### Analysis system: A service for extracting insights from trace data
分析系统：从追踪数据中提取有见解的服务

Last but not least, there is now a cornucopia of tracing and monitoring solutions. A list of monitoring systems known to be compatible with OpenTracing can be found [here][15], but there are many more options out there. I would encourage you to research your options, and I hope you find the framework provided in this article to be useful when comparing options. In addition to rating monitoring systems based on their operational characteristics (not to mention whether you like the UI and features), make sure you think about the three big pieces above, their relative importance to you, and how the tracing system you are interested in provides a solution to them.
最后不得不提的是，现在有足够多的追踪监视解决方案。可以在[此处][15]找到与 OpenTracing 兼容的已知监控系统列表，但除此之外仍有更多的选择。我更鼓励你研究自定义选项，同时发现本文提供的框架在对比选择时是非常有用的。除了根据监控系统的操作特性对其进行评级外，监控系统基于它们的操作特征(更不用提你是否喜欢 UI 和其功能),确保你考虑到了上述三大组件、它们对你的相对重要性以及你感兴趣的追踪系统如何为它们提供解决方案。

### Conclusion
结论

In the end, how important each piece is depends heavily on who you are and what kind of system you are building. For example, open source library authors are very interested in the OpenTracing API, while service developers tend to be more interested in the Trace-Context specification. When someone says one piece is more important than the other, they usually mean “one piece is more important to me than the other."
最后，每个部分的重要性在很大程度上取决于你是谁以及正在建立什么样的系统。举个例子，开源库的作者对 OpenTracing API 非常感兴趣，而服务开发者对 trace-context 规范更感兴趣。当有人说一部分比另一部分重要时，他们的意思通常是“一部分对我来说比另一部分重要”。

However, the reality is this: Distributed Tracing has become a necessity for monitoring modern systems. In designing the building blocks for these systems, the age-old approach—"decouple where you can"—still holds true. Cleanly decoupled components are the best way to maintain flexibility and forwards-compatibility when building a system as cross-cutting as a distributed monitoring system.
然而，事实是：分布式追踪已经成为监控现代系统所必不可少的事物。在为这些系统进行构建模块时，“尽可能分离的”老方法仍然适用。在构建像分布式监控系统一样的跨系统的系统，干净地分离组件是维持灵活性和前向兼容性地最佳方式。

Thanks for reading! Hopefully, now when you're ready to implement tracing in your own application, you have a guide to understanding which pieces they are talking about, and how they fit together.
感谢您的阅读！现在当你准备好在你自己的应用程序中实现追踪服务时，你已有一份指南来了解他们正在谈论哪部分片段以及他们之间如何相互协作。

Want to learn more? Sign up to attend [KubeCon EU][16] in May or [KubeCon North America][17] in December.
想学到更多？报名参加5月份的[KubeCon EU]或者12月份的[KubeCon North America]吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/distributed-tracing

作者：[Ted Young][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[chenmu-kk](https://github.com/chenmu-kk)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/tedsuo
[1]:https://research.google.com/pubs/pub36356.html
[2]:http://opentracing.io/
[3]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/uploads/tracing1_0.png?itok=dvDTX0JJ (Tracing)
[4]:https://github.com/opentracing/specification/blob/master/specification.md
[5]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/uploads/tracing2_0.png?itok=yokjNLZk (Tracing)
[6]:https://github.com/opentracing-contrib/
[7]:https://gitter.im/opentracing/public
[8]:https://www.w3.org/community/trace-context/
[9]:https://w3c.github.io/distributed-tracing/report-trace-context.html
[10]:http://lists.w3.org/Archives/Public/public-trace-context/
[11]:https://gitter.im/TraceContext/Lobby
[12]:https://github.com/opentracing/specification/blob/master/semantic_conventions.md
[13]:https://github.com/opentracing/opentracing-cpp
[14]:https://github.com/opentracing-contrib/java-tracerresolver
[15]:http://opentracing.io/documentation/pages/supported-tracers
[16]:https://events.linuxfoundation.org/kubecon-eu-2018/
[17]:https://events.linuxfoundation.org/events/kubecon-cloudnativecon-north-america-2018/
