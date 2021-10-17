[#]: collector: (lujun9972)
[#]: translator: (unigeorge)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13891-1.html)
[#]: subject: (How to process real-time data with Apache)
[#]: via: (https://opensource.com/article/20/2/real-time-data-processing)
[#]: author: (Simon Crosby https://opensource.com/users/simon-crosby)

如何使用 Apache 软件处理实时数据
======

> 开源以丰富的项目画布引领着处理实时事件的方向。

![](https://img.linux.net.cn/data/attachment/album/202110/17/105502opl53qrmj950j3mv.jpg)

在“永不下线”的未来，入网设备规模可能会达到数十亿。存储原始数据，日后再进行分析的方案将不再能满足需求，因为用户需要实时且准确的响应。要对故障等对环境敏感的状况进行预测，实时处理数据也必不可少 —— 数据到达数据库后再处理肯定是来不及的。

有人可能会说，“云可扩展性”能够满足实时处理流数据的需求，但一些简单的例子就能表明它永远无法满足对无界数据流进行实时响应的需求。从移动设备到物联网，都需要一种新的范式来满足需求。尽管云计算依赖于对大数据“先存储后分析”的方案，但也迫切需要一种能够处理持续、杂乱和海量数据流的软件框架，并在数据流到达时立即对其进行处理，以保证实时的响应、预测和对数据的洞悉。

例如，在加利福尼亚州的帕洛阿尔托市，每天从基础交通设施产生的流数据比 Twitter Firehose 还要多。这是很大的数据量。为 Uber、Lyft 和 FedEx 等消费者预测城市交通需要实时的分析、学习和预测。云处理不可避免地导致每个事件大约会有半秒的延迟。

我们需要一个简单而强大的编程范式，让应用程序在类似下面的情况时能够动态处理无界数据流： 

  * 数据量巨大，或原始数据的移动成本很高。
  * 数据由广泛分布的资产（例如移动设备）生成。
  * 数据具有转瞬即逝的价值，即时分析迫在眉睫。
  * 需要始终洞悉最新数据情况，外推法行不通。

### 发布和订阅 

事件驱动系统领域中有一个关键架构模式：<ruby>发布/订阅<rt>publish/subscribe</rt></ruby> 消息传递模式。这是一种异步通信方法，其中消息会从 _发布者_（数据产生方）传递到 _订阅者_（处理数据的应用程序）。发布/订阅模式可以将消息发送者与消费者分离开来。

在发布/订阅模式中，消息源会 _发布_ 针对某个 <ruby>主题<rt>topic</rt></ruby> 的 <ruby>事件<rt>event</rt></ruby> 至 <ruby>服务端<rt>broker</rt></ruby>，后者按接收顺序存储它们。应用程序可以 _订阅_ 一个或多个 _主题_，然后 _服务端_ 会转发匹配的事件。 Apache Kafka 和 Pulsar 以及 CNCF NATS 是发布/订阅系统。 发布/订阅的云服务包括 Google Pub/Sub、AWS Kinesis、Azure Service Bus、Confluent Cloud 等。（LCTT 译注：本段部分术语英文名称更为泛用，针对这些术语，采用了中英文标注。）

发布/订阅系统不会 _运行_ 订阅者应用程序，它们只是 _传递_ 数据给相应主题的订阅者。

流数据通常包含应用程序或基础架构状态更新的事件。在选择架构来处理数据时，发布/订阅框架等数据分发系统的作用是有限的。消费者应用程序的“处理方式”超出了发布/订阅系统的范围。这让开发人员的管理变得极具复杂性。所谓的流处理器是一种特殊的订阅者，可以动态分析数据并将结果返回给同一个服务端。 

### Apache Spark

[Apache Spark][2] 是用于大规模数据处理的统一分析引擎。通常将 Apache Spark Streaming 用作流处理器，例如给机器学习模型提供新数据。Spark Streaming 将数据分成小批量，每个小批量都由 Spark 模型或其他系统独立分析。事件流可以被分组成小批量以进行分析，但流处理器本身必须具有弹性： 

  * 流处理器必须能够根据数据速率进行扩展，甚至要能够跨越服务器和云，并且还可以跨实例实现负载均衡，以确保弹性和其他应用层的需求。
  * 它必须能够分析来自不同来源的数据，这些数据源的报告速率可能相差很大。这意味着它必须是有状态的，或者将状态存储在数据库中。当使用 Spark Streaming 作为流处理器时，通常会使用后一种方法，这种方法在需要超低延迟响应时可能会存在性能问题。

相关项目 [Apache Samza][3] 也提供了一种处理实时事件流的方法，并使用 [Hadoop Yarn][4] 或 [Apache Mesos][5] 来管理计算资源，以便进行弹性扩展。

### 解决数据扩展问题 

需要注意的是，即使是 Samza 也不能完全减轻开发人员的数据处理需求。扩展数据规模意味着处理事件的任务需要跨多个实例进行负载均衡，而使用数据库是实例间共享结果应用层状态的唯一方法。然而，当应用程序任务之间的状态协调转移到数据库时，对性能会产生不可避免的连锁反应。此外，数据库的选择也至关重要。随着系统的扩展，数据库的集群管理会成为下一个潜在的瓶颈。 

这个问题可以通过有状态、有弹性的替代方案来解决，并且这样的解决方案可以用来代替流处理器。在应用程序级别（容器或实例内），这些解决方案依据流的更新，动态构建并发、互连的“web 代理”的有状态模型。代理是并发的“微服务”，它们消费单一来源的原始数据并维护它们的状态。基于数据中发现的源之间的真实关系（如包含和临近）,代理实现互连以共享状态。代理也因此形成了一个并发服务图，可以分析它们自己的状态和链接到的代理的状态。数据源将原始数据转换为状态，并根据自身及其链接子图的变化进行分析、学习和预测，每个代理都为单个这样的数据源提供微服务。

这些解决方案允许大量的代理（真实数据源的数字类比）分布，甚至还有在应用层使代理互连的分布式图，从而简化了应用架构。这是因为代理之间互连的本质，是映射到解决方案的当前运行时执行实例和代理本身的 URL。通过这种方式，应用程序可以跨实例无缝扩展，而无需担心 DevOps 问题。代理消费数据并维护状态，还会计算自己和其他代理的状态。由于代理是有状态的，因此不需要数据库，并且数据洞察是以内存速度计算的。 

### 使用开源阅读数据世界

我们查看数据的方式正在发生翻天覆地的变化：不再将数据库用作记录系统，取而代之的是现实世界，现实世界事物的数字类比可以不断地传输它们的状态。幸运的是，开源社区在处理实时事件的项目丰富度方面处于领先地位。从发布/订阅模式（其中最活跃的社区是 Apache Kafka、Pulsar 和 CNCF NATS）到持续处理流数据的分析框架，包括 Apache Spark、[Flink][6]、[Beam][7]、Samza，以及 Apache 许可的 [SwimOS][8] 和 [Hazelcast][9]，对开发人员来说，可选择项目非常之多。可以说，没有什么地方比开源社区的专有软件框架更多了。试看软件的未来，必是开源的天下。 

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/real-time-data-processing

作者：[Simon Crosby][a]
选题：[lujun9972][b]
译者：[unigeorge](https://github.com/unigeorge)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/simon-crosby
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/clocks_time.png?itok=_ID09GDk (Alarm clocks with different time)
[2]: https://spark.apache.org/
[3]: https://samza.apache.org/
[4]: https://hadoop.apache.org/
[5]: http://mesos.apache.org/
[6]: https://flink.apache.org/
[7]: https://beam.apache.org
[8]: https://github.com/swimos/swim
[9]: https://hazelcast.com/
