[#]: collector: (lujun9972)
[#]: translator: (ShuyRoy )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Get started with distributed tracing using Grafana Tempo)
[#]: via: (https://opensource.com/article/21/2/tempo-distributed-tracing)
[#]: author: (Annanay Agarwal https://opensource.com/users/annanayagarwal)

使用Grafana Tempo开始分布式跟踪
======
Grafana Tempo是一个新的开源、大容量分布式跟踪后端。

![Computer laptop in space][1]

Grafana的[Tempo][2]是出自Grafana实验室的一个简单易用、大规模集成、分布式的跟踪后端。Tempo集成了[Grafana][3]、[Prometheus][4]以及[Loki][5]，并且它只需要对象存储进行操作，这使得它是合算的且易操作的。

我从一开始就参与了这个开源项目，所以我将介绍一些关于Tempo的基础知识，并说明为什么本地云社区会注意到它。


### 分布式跟踪

想要收集对应用程序请求的遥测数据是很常见的。但是在现在的服务器中，单个应用通常被分割为多个微服务，可能运行在几个不同的节点上。

分布式跟踪是一种获得关于应用的性能细粒度信息的方式，该应用程序可能由离散的服务组成。当请求到达一个应用时，它提供了请求生命周期的统一视图。Tempo的分布式跟踪可以用于单片或微服务应用，它提供[请求范围的信息][6]，使其成为可观察的第三个支柱（除了度量和日志）。

接下来是一个分布式跟踪系统生成应用程序甘特图的示例。它使用Jaeger [HotROD][7] 的演示应用生成跟踪，并把他们存到Grafana云托管的Tempo上。这个图展示了按照服务和功能划分的请求处理时间。


![Gantt chart from Grafana Tempo][8]

(Annanay Agarwal, [CC BY-SA 4.0][9])

### 减少索引的大小

在丰富且定义良好的数据模型中，跟踪包含大量信息。通常，跟踪后端有两种交互：使用元数据选择器（如服务名或者持续时间）筛选跟踪，并在筛选后可视化跟踪。

为了加强查找，大多数的开源分布式跟踪框架对跟踪中的许多字段进行索引，包括服务名称、操作名称、标记和持续时间。这会导致索引很大，并迫使您使用Elasticsearch或者[Cassandra][10]这样的数据库。但是，这些很难管理，而且大规模操作的成本高，所以我在Grafana实验室的团队打算提出一个更好的解决方案。


在Grafana中，我的待命调试工作流开始使用指标报表（我们使用[Cortex][11]来存储我们应用中的指标，它是一个云本地计算基金会孵化的项目，用于扩展Prometheus）深入研究这个问题，筛选有问题服务的日志（我们将日志存储在Loki中，就像Prometheus一样，只不过Loki是存日志的），然后查看跟踪给定的请求。我们意识到，我们过滤时所需的所有索引信息都可以在Cortex和Loki中找到。但是，我们需要通过这些工具实现跟踪可发现的强大集成，以及根据跟踪ID进行键值查找的免费存储。

这是[Grafana Tempo][12]项目的开始。通过关注给定跟踪ID的跟踪检索，我们将Tempo设计为最小依赖、高容量、低成本的分布式跟踪后端。


### 容易操作和低成本

Tempo使用对象存储后端，这是它唯一的依赖。它既可以被用于单二进制模式下，也可以用于微服务模式（请参考repo中的[例子][13]，了解如何轻松开始）。使用对象存储也意味着你可以在不使用任何抽样的情况下存储应用的的大量跟踪。这可以确保你永远不会丢弃出错或延迟更高的百万分之一的请求。


### 与开源工具的强大集成

[Grafana 7.3包括了Tempo数据源][14]，这意味着你可以在Grafana UI中可视化来自Tempo的跟踪。而且，[Loki 2.0的新查询特性][15]使得Tempo中的跟踪更简单。为了与Prometheus集成，该团队正在添加对范例的支持，范例是可以添加到时间序列数据中的高基数元数据信息。度量存储后端不会对它们建立索引，但是你可以在Grafana UI中检索和显示度量值。尽管exemplars可以存储各种元数据，但是在这个用例中，跟踪的ID被存储以便与Tempo强集成。

这个例子展示了使用带有请求延迟直方图的范例，其中每个范例数据点都链接到Tempo中的一个跟踪。

![Using exemplars in Tempo][16]

(Annanay Agarwal, [CC BY-SA 4.0][9])

### 元数据一致性

作为容器化应用程序运行的应用发出的遥测数据通常具有一些相关的元数据。这可以包括集群ID、命名空间、pod IP等。这对于提供基于需求的信息是好的，但是如果你可以利用包含在元数据的信息来进行一些高效的工作，那就更好了。
 
例如，你可以使用[Grafana云代理将跟踪信息导入Tempo中][17]，代理利用Prometheus服务发现机制轮询Kubernetes接口以查询元数据信息，并且将这些标记添加到应用程序发出的跨域数据中。由于这些元数据也在Loki中也建立了索引，所以通过元数据转换为Loki变迁选择器，可以很容易地从跟踪跳转到查看给定服务的日志。

下面是一个一致元数据的示例，它可用于Tempo跟踪中查看给定范围的日志。

### ![][18]

### 云本地

Grafana Tempo作为一个容器化的应用时可用的，你可以在如Kubernetes、Mesos等任何编排引擎上运行它。根据获取/查询路径上的工作负载，各种服务可以水平伸缩。你还可以使用云本地对象存储，如谷歌云存储、Amazon S3或者Tempo Azure博客存储。更多的信息，请阅读Tempo文档中的[架构部分][19]。

### 试一试Tempo

如果这对你和我们一样有用，可以[克隆Tempo仓库][20]试一试。


--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/tempo-distributed-tracing

作者：[Annanay Agarwal][a]
选题：[lujun9972][b]
译者：[RiaXu](https://github.com/ShuyRoy)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/annanayagarwal
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_space_graphic_cosmic.png?itok=wu493YbB (Computer laptop in space)
[2]: https://grafana.com/oss/tempo/
[3]: http://grafana.com/oss/grafana
[4]: https://prometheus.io/
[5]: https://grafana.com/oss/loki/
[6]: https://peter.bourgon.org/blog/2017/02/21/metrics-tracing-and-logging.html
[7]: https://github.com/jaegertracing/jaeger/tree/master/examples/hotrod
[8]: https://opensource.com/sites/default/files/uploads/tempo_gantt.png (Gantt chart from Grafana Tempo)
[9]: https://creativecommons.org/licenses/by-sa/4.0/
[10]: https://opensource.com/article/19/8/how-set-apache-cassandra-cluster
[11]: https://cortexmetrics.io/
[12]: http://github.com/grafana/tempo
[13]: https://grafana.com/docs/tempo/latest/getting-started/example-demo-app/
[14]: https://grafana.com/blog/2020/10/29/grafana-7.3-released-support-for-the-grafana-tempo-tracing-system-new-color-palettes-live-updates-for-dashboard-viewers-and-more/
[15]: https://grafana.com/blog/2020/11/09/trace-discovery-in-grafana-tempo-using-prometheus-exemplars-loki-2.0-queries-and-more/
[16]: https://opensource.com/sites/default/files/uploads/tempo_exemplar.png (Using exemplars in Tempo)
[17]: https://grafana.com/blog/2020/11/17/tracing-with-the-grafana-cloud-agent-and-grafana-tempo/
[18]: https://lh5.googleusercontent.com/vNqk-ygBOLjKJnCbTbf2P5iyU5Wjv2joR7W-oD7myaP73Mx0KArBI2CTrEDVi04GQHXAXecTUXdkMqKRq8icnXFJ7yWUEpaswB1AOU4wfUuADpRV8pttVtXvTpVVv8_OfnDINgfN
[19]: https://grafana.com/docs/tempo/latest/architecture/architecture/
[20]: https://github.com/grafana/tempo
