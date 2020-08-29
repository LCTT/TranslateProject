[#]: collector: (lujun9972)
[#]: translator: ( chenmu-kk )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (9 open source tools for building a fault-tolerant system)
[#]: via: (https://opensource.com/article/19/3/tools-fault-tolerant-system)
[#]: author: (Bryant Son (Red Hat, Community Moderator) https://opensource.com/users/brson)

九个用来构建容错系统的开源工具
======

这些开源工具可以最大化延长运行时间并且在最大程度上减少问题。

![magnifying glass on computer screen, finding a bug in the code][1]

我总是对web开发和软件体系结构很感兴趣，因为我喜欢看到一个工作系统的更广阔的前景。无论是构建一个移动应用程序还是一个web应用程序，都必须连接到internet才能在不同的模块中交换数据，这意味着你需要web服务。


如果选择云系统作为应用程序的后端，则可以利用更优秀的计算能力，因为后端服务将会在水平和垂直方向上进行扩展并编排不同的服务。但无论你是否使用云后端，建造一个灵活、稳定、快速又安全的容错系统是必不可少的。

要了解容错系统，让我们以脸书、亚马逊、谷歌和奈飞为例。数以亿计的用户会同时接入这些平台并通过对等网络和用户-服务器网络传输大量数据，你可以肯定这其中还存在许多的带有不法目的的恶意用户，例如黑客攻击和拒绝服务（DoS）攻击。即使如此，这些平台无需停机也可以全年无休地运转。

尽管机器学习和智能算法是这些系统的基础，但它们实现一致服务而不需要一分钟停机的事实值得称赞。它们昂贵的硬件设备和巨大的数据中心当然十分重要，但是支持服务的精密软件设计也同样重要。而且容错系统是一个构建如此精密系统的法则之一。

### 生产过程中导致错误的两种行为

这是考虑容错系统的另一种方法。当你在本地运行应用程序服务时，每件事似乎都很完美。棒极了！但当你提升服务到生产环境时，一切都会变得一团糟。在这种情况下，容错系统通过解决两个问题来提供帮助：故障停止行为和拜占庭行为。

#### 故障停止行为

故障停止行为是运行中系统突然停止运行或者系统中的某些部分发生了故障时。服务器停机时间和数据库不可访问都属于此种类型。举个例子，在下图中，由于服务2无法访问，因此服务1无法与服务2进行通信。

![Fail-stop behavior due to Service 2 downtime][2]

但是，如果服务之间存在网络问题，也会出现此问题，如下图所示：

![Fail-stop behavior due to network failure][3]

#### 拜占庭行为

拜占庭行为是指系统连续运行，但并不产生预期行为(例如：错误的数据或者无效的数据)。

如果服务2的数据或者值已损坏则可能会发生拜占庭故障，即使服务看起来运行得很好，比如下面的例子:

![Byzantine failure due to corrupted service][4]

或者，可能存在恶意的中间人在服务之间拦截并注入不需要的数据：

![Byzantine failure due to malicious middleman][5]

故障停止和拜占庭行为都不是理想的情况，因此我们需要一些预防或修复它们的手段。这里容错系统就起作用了。以下是可以帮助你解决这些问题的8个开源工具。

### 构建容错系统的工具

尽管构建一个真正实用的容错系统涉及到深入的“分布式计算理论”和复杂的计算机科学原理，但有许多的软件工具（其中许多是开放源代码的软件）通过构建容错系统来减轻不良后果。

#### 断路模式：Hystrix 和Resilience4j

[断路模式][6]是一种有助于在服务失败时返回准备好的虚拟回应或者简单回应的一种技术。

![Circuit breaker pattern][7]

奈飞的开源**[Hystrix][8]** 是断路模式中最流行的应用。

我之前工作过的很多家公司都在用这款出色的工具。令人意外的是，奈飞宣布将不再更新Hystrix（是的，我知道）。相反，奈飞建议使用另一种支持Java8和函数式编程的[**Resilence4j**][9]之类的替代解决方案，或者类似于[Adaptive Concurrency Limit][10]的适应性解决方案。

#### 负载均衡：Nginx 和HaProxy

负载均衡是分布式系统中最基本的概念之一，它必须具备生产质量的环境。要理解负载均衡器，首先我们需要明白冗余的概念。每个生产质量的web服务都有多个服务器在服务器宕机时提供冗余来接管和维持服务。

![Load balancer][11]

想想现代飞机：它们的双引擎提供冗余，使它们即使在一个引擎着火的情况下也能安全的着陆。（这也有助于大多数商用飞机拥有最先进的自动化系统）。但是，拥有多引擎（或者多服务器）也意味着必须存在一些调度机制在故障时有效地对系统进行路由。

负载均衡器是一种通过平衡多个服务节点来优化重流量事务的设备或者软件。举个例子，当数以千计的请求涌入时，负载均衡器可以作为中间层在不同的服务期间路由和平均分配流量。如果服务器宕机，负载均衡器会将请求转发给其他运行良好的服务器。

有许多可用的负载均衡器，但其中最出名的两个就是Nginx 和HaProxy。

[**Nginx**][12]不仅仅是一个负载均衡器。它是HTTP和反向代理服务器、邮件代理服务器和通用TCP/UDP代理服务器。Groupon、Capital One、 Adobe和NASA等公司都在使用它。

[**HaProxy**][13] 也很受欢迎，因为它是一个免费，快且可靠的解决方案，它为基于TCP和HTTP的应用程序提供高可用性、负载平衡和代理。许多大型网络公司，包括Github、Reddit、Twitter和Stack Overflow都使用HaProxy。是的，Red Hat Enterprise Linux同样支持HaProxy设置。

#### 参与者模型：Akka

[参与者模型][14] 是一种并发设计模式，当作为基本计算单位的_actor_接收到消息时，它会分派责任。一个actor可以创建更多的actor，并将消息委派给他们。

[**Akka**][15] 是用于actor模式实现的最著名工具之一。框架同时支持基于JVM的Java和Scala。

#### 使用消息队列的异步、非阻塞I/O:Kafka和RabbitMQ 

多线程开发在过去很流行，但是这种做法一直不被鼓励，取而代之的是异步的、非阻塞的I/O模式。对于Java，这一点在[EnterpriseJavaBean（EJB）规范][16]中明确说明:

> “企业bean一定不能使用线程同步原语来同步多个实例的执行。”
>
> “企业bean不得试图去管理线程。企业bean不得试图启动、停止、挂起或恢复线程，或者去更改线程的优先级或者名称。企业bean不得试图管理线程组。”

如今，有其他做法像流API和参与者模型。但像[**Kafka**][17] 和[**RabbitMQ**][18]之类的消息队列为异步和非阻塞IO功能提供了开箱即用的支持，同时它们也是功能强大的开源工具，通过处理并发进程可以替代线程。

#### 其他的选择：Eureka 和Chaos Monkey

用于容错系统其他有用的工具包括奈飞的**[Eureka][19]** 之类的监控工具，以及像 **[Chaos Monkey][20]** 这样的压力测试工具。它们旨在通过在较低环境中的测试（像集成（INT），质量保障（QA）和用户接受测试（UAT））来早早发现潜在问题以防止在转移到生产环境之前出现潜在问题。

* * *

你在使用什么开源工具来构建一个容错系统呢？请在评论中分享您的收藏夹。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/tools-fault-tolerant-system

作者：[Bryant Son (Red Hat, Community Moderator)][a]
选题：[lujun9972][b]
译者：[chenmu-kk](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brson
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/mistake_bug_fix_find_error.png?itok=PZaz3dga (magnifying glass on computer screen, finding a bug in the code)
[2]: https://opensource.com/sites/default/files/uploads/1_errordowntimeservice.jpg (Fail-stop behavior due to Service 2 downtime)
[3]: https://opensource.com/sites/default/files/uploads/2_errordowntimenetwork.jpg (Fail-stop behavior due to network failure)
[4]: https://opensource.com/sites/default/files/uploads/3_byzantinefailuremalicious.jpg (Byzantine failure due to corrupted service)
[5]: https://opensource.com/sites/default/files/uploads/4_byzantinefailuremiddleman.jpg (Byzantine failure due to malicious middleman)
[6]: https://martinfowler.com/bliki/CircuitBreaker.html
[7]: https://opensource.com/sites/default/files/uploads/5_circuitbreakerpattern.jpg (Circuit breaker pattern)
[8]: https://github.com/Netflix/Hystrix/wiki
[9]: https://github.com/resilience4j/resilience4j
[10]: https://medium.com/@NetflixTechBlog/performance-under-load-3e6fa9a60581
[11]: https://opensource.com/sites/default/files/uploads/7_loadbalancer.jpg (Load balancer)
[12]: https://www.nginx.com
[13]: https://www.haproxy.org
[14]: https://en.wikipedia.org/wiki/Actor_model
[15]: https://akka.io
[16]: https://jcp.org/aboutJava/communityprocess/final/jsr220/index.html
[17]: https://kafka.apache.org
[18]: https://www.rabbitmq.com
[19]: https://github.com/Netflix/eureka
[20]: https://github.com/Netflix/chaosmonkey
