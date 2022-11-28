[#]: subject: (Application observability with Apache Kafka and SigNoz)
[#]: via: (https://opensource.com/article/21/4/observability-apache-kafka-signoz)
[#]: author: (Nitish Tiwari https://opensource.com/users/tiwarinitish86)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13352-1.html)

使用 Apache Kafka 和 SigNoz 实现应用可观测性
======

> SigNoz 帮助开发者使用最小的精力快速实现他们的可观测性目标。

![](https://img.linux.net.cn/data/attachment/album/202105/01/231703oy5ln5nnqkuhxt1t.jpg)

SigNoz 是一个开源的应用可观察性平台。SigNoz 是用 React 和 Go 编写的，它从头到尾都是为了让开发者能够以最小的精力尽快实现他们的可观察性目标。

本文将详细介绍该软件，包括架构、基于 Kubernetes 的部署以及一些常见的 SigNoz 用途。

### SigNoz 架构

SigNoz 将几个组件捆绑在一起，创建了一个可扩展的、耦合松散的系统，很容易上手使用。其中一些最重要的组件有：

  * OpenTelemetry Collector
  * Apache Kafka
  * Apache Druid

[OpenTelemetry Collector][2] 是跟踪或度量数据收集引擎。这使得 SigNoz 能够以行业标准格式获取数据，包括 Jaeger、Zipkin 和 OpenConsensus。之后，收集的数据被转发到 Apache Kafka。

SigNoz 使用 Kafka 和流处理器来实时获取大量的可观测数据。然后，这些数据被传递到 Apache Druid，它擅长于存储这些数据，用于短期和长期的 SQL 分析。

当数据被扁平化并存储在 Druid 中，SigNoz 的查询服务可以查询并将数据传递给 SigNoz React 前端。然后，前端为用户创建漂亮的图表，使可观察性数据可视化。

![SigNoz architecture][3]

### 安装 SigNoz

SigNoz 的组件包括 Apache Kafka 和 Druid。这些组件是松散耦合的，并协同工作，以确保终端用户的无缝体验。鉴于这些组件，最好将 SigNoz 作为 Kubernetes 或 Docker Compose（用于本地测试）上的微服务组合来运行。

这个例子使用基于 Kubernetes Helm Chart 的部署在 Kubernetes 上安装 SigNoz。作为先决条件，你需要一个 Kubernetes 集群。如果你没有可用的 Kubernetes 集群，你可以使用 [MiniKube][5] 或 [Kind][6] 等工具，在你的本地机器上创建一个测试集群。注意，这台机器至少要有 4GB 的可用空间才能工作。

当你有了可用的集群，并配置了 kubectl 来与集群通信，运行：

```
$ git clone https://github.com/SigNoz/signoz.git && cd signoz
$ helm dependency update deploy/kubernetes/platform
$ kubectl create ns platform
$ helm -n platform install signoz deploy/kubernetes/platform
$ kubectl -n platform apply -Rf deploy/kubernetes/jobs
$ kubectl -n platform apply -f deploy/kubernetes/otel-collector
```

这将在集群上安装 SigNoz 和相关容器。要访问用户界面 （UI），运行 `kubectl port-forward` 命令。例如：

```
$ kubectl -n platform port-forward svc/signoz-frontend 3000:3000
```

现在你应该能够使用本地浏览器访问你的 SigNoz 仪表板，地址为 `http://localhost:3000`。

现在你的可观察性平台已经建立起来了，你需要一个能产生可观察性数据的应用来进行可视化和追踪。对于这个例子，你可以使用 [HotROD][7]，一个由 Jaegar 团队开发的示例应用。

要安装它，请运行：

```
$ kubectl create ns sample-application
$ kubectl -n sample-application apply -Rf sample-apps/hotrod/
```

### 探索功能

现在你应该有一个已经安装合适仪表的应用，并可在演示设置中运行。看看 SigNoz 仪表盘上的指标和跟踪数据。当你登录到仪表盘的主页时，你会看到一个所有已配置的应用列表，这些应用正在向 SigNoz 发送仪表数据。

![SigNoz dashboard][8]

#### 指标

当你点击一个特定的应用时，你会登录到该应用的主页上。指标页面显示最近 15 分钟的信息（这个数字是可配置的），如应用的延迟、平均吞吐量、错误率和应用目前访问最高的接口。这让你对应用的状态有一个大概了解。任何错误、延迟或负载的峰值都可以立即看到。

![Metrics in SigNoz][9]

#### 追踪

追踪页面按时间顺序列出了每个请求的高层细节。当你发现一个感兴趣的请求（例如，比预期时间长的东西），你可以点击追踪，查看该请求中发生的每个行为的单独时间跨度。下探模式提供了对每个请求的彻底检查。

![Tracing in SigNoz][10]

![Tracing in SigNoz][11]

#### 用量资源管理器

大多数指标和跟踪数据都非常有用，但只在一定时期内有用。随着时间的推移，数据在大多数情况下不再有用。这意味着为数据计划一个适当的保留时间是很重要的。否则，你将为存储支付更多的费用。用量资源管理器提供了每小时、每一天和每一周获取数据的概况。

![SigNoz Usage Explorer][12]

### 添加仪表

到目前为止，你一直在看 HotROD 应用的指标和追踪。理想情况下，你会希望对你的应用进行检测，以便它向 SigNoz 发送可观察数据。参考 SigNoz 网站上的[仪表概览][13]。

SigNoz 支持一个与供应商无关的仪表库，OpenTelemetry，作为配置仪表的主要方式。OpenTelemetry 提供了各种语言的仪表库，支持自动和手动仪表。

### 了解更多

SigNoz 帮助开发者快速开始度量和跟踪应用。要了解更多，你可以查阅 [文档][14]，加入[社区][15]，并访问 [GitHub][16] 上的源代码。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/observability-apache-kafka-signoz

作者：[Nitish Tiwari][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/tiwarinitish86
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_captain_devops_kubernetes_steer.png?itok=LAHfIpek (Ship captain sailing the Kubernetes seas)
[2]: https://github.com/open-telemetry/opentelemetry-collector
[3]: https://opensource.com/sites/default/files/uploads/signoz_architecture.png (SigNoz architecture)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://minikube.sigs.k8s.io/docs/start/
[6]: https://kind.sigs.k8s.io/docs/user/quick-start/
[7]: https://github.com/jaegertracing/jaeger/tree/master/examples/hotrod
[8]: https://opensource.com/sites/default/files/uploads/signoz_dashboard.png (SigNoz dashboard)
[9]: https://opensource.com/sites/default/files/uploads/signoz_applicationmetrics.png (Metrics in SigNoz)
[10]: https://opensource.com/sites/default/files/uploads/signoz_tracing.png (Tracing in SigNoz)
[11]: https://opensource.com/sites/default/files/uploads/signoz_tracing2.png (Tracing in SigNoz)
[12]: https://opensource.com/sites/default/files/uploads/signoz_usageexplorer.png (SigNoz Usage Explorer)
[13]: https://signoz.io/docs/instrumentation/overview/
[14]: https://signoz.io/docs/
[15]: https://github.com/SigNoz/signoz#community
[16]: https://github.com/SigNoz/signoz
