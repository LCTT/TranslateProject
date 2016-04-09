如何监控 NGINX（第一篇）
================================================================================
![](http://www.datadoghq.com/wp-content/uploads/2015/07/NGINX_hero_1.png)

### NGINX 是什么? ###

[NGINX][1] (发音为 “engine X”) 是一种流行的 HTTP 和反向代理服务器。作为一个 HTTP 服务器，NGINX 可以使用较少的内存非常高效可靠地提供静态内容。作为[反向代理][2]，它可以用作多个后端服务器或类似缓存和负载平衡这样的其它应用的单一访问控制点。NGINX 是一个自由开源的产品，并有一个具备更全的功能的叫做 NGINX Plus 的商业版。

NGINX 也可以用作邮件代理和通用的 TCP 代理，但本文并不直接讨论 NGINX 的那些用例的监控。

### NGINX 主要指标 ###

通过监控 NGINX 可以 捕获到两类问题：NGINX 本身的资源问题，和出现在你的基础网络设施的其它问题。大多数 NGINX 用户会用到以下指标的监控，包括**每秒请求数**，它提供了一个由所有最终用户活动组成的上层视图；**服务器错误率** ，这表明你的服务器已经多长没有处理看似有效的请求；还有**请求处理时间**，这说明你的服务器处理客户端请求的总共时长（并且可以看出性能降低或当前环境的其他问题）。

更一般地，至少有三个主要的指标类别来监视：

- 基本活动指标
- 错误指标
- 性能指标

下面我们将分析在每个类别中最重要的 NGINX 指标，以及用一个相当普遍但是值得特别提到的案例来说明：使用 NGINX Plus 作反向代理。我们还将介绍如何使用图形工具或可选择的监控工具来监控所有的指标。

本文引用指标术语[来自我们的“监控 101 系列”][3],，它提供了一个指标收集和警告框架。

#### 基本活跃指标 ####

无论你在怎样的情况下使用 NGINX，毫无疑问你要监视服务器接收多少客户端请求和如何处理这些请求。

NGINX Plus 上像开源 NGINX 一样可以报告基本活跃指标，但它也提供了略有不同的辅助模块。我们首先讨论开源的 NGINX，再来说明 NGINX Plus 提供的其他指标的功能。

**NGINX**

下图显示了一个客户端连接的过程，以及开源版本的 NGINX 如何在连接过程中收集指标。

![connection, request states](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/nginx_connection_diagram-2.png)

Accepts（接受）、Handled（已处理）、Requests（请求）是一直在增加的计数器。Active（活跃）、Waiting（等待）、Reading（读）、Writing（写）随着请求量而增减。

| 名称 | 描述| [指标类型](https://www.datadoghq.com/blog/monitoring-101-collecting-data/)|
|-----------|-----------------|-------------------------------------------------------------------------------------------------------------------------|
| Accepts |  NGINX 所接受的客户端连接数 | 资源: 功能 |
| Handled | 成功的客户端连接数 | 资源: 功能 |
| Active | 当前活跃的客户端连接数| 资源: 功能 |
| Dropped（已丢弃，计算得出）| 丢弃的连接数（接受 - 已处理）| 工作：错误*|
| Requests | 客户端请求数 | 工作：吞吐量 |


_*严格的来说，丢弃的连接是 [一个资源饱和指标](https://www.datadoghq.com/blog/monitoring-101-collecting-data/#resource-metrics)，但是因为饱和会导致	 NGINX 停止服务（而不是延后该请求），所以，“已丢弃”视作 [一个工作指标](https://www.datadoghq.com/blog/monitoring-101-collecting-data/#work-metrics) 比较合适。_

NGINX worker 进程接受 OS 的连接请求时 **Accepts** 计数器增加，而**Handled** 是当实际的请求得到连接时（通过建立一个新的连接或重新使用一个空闲的）。这两个计数器的值通常都是相同的，如果它们有差别则表明连接被**Dropped**，往往这是由于资源限制，比如已经达到 NGINX 的[worker_connections][4]的限制。

一旦 NGINX 成功处理一个连接时，连接会移动到**Active**状态，在这里对客户端请求进行处理：

Active状态

- **Waiting**: 活跃的连接也可以处于 Waiting 子状态，如果有在此刻没有活跃请求的话。新连接可以绕过这个状态并直接变为到 Reading 状态，最常见的是在使用“accept filter（接受过滤器）” 和 “deferred accept（延迟接受）”时，在这种情况下，NGINX 不会接收 worker 进程的通知，直到它具有足够的数据才开始响应。如果连接设置为 keep-alive ，那么它在发送响应后将处于等待状态。

- **Reading**: 当接收到请求时，连接离开 Waiting 状态，并且该请求本身使 Reading 状态计数增加。在这种状态下 NGINX 会读取客户端请求首部。请求首部是比较小的，因此这通常是一个快速的操作。

- **Writing**: 请求被读取之后，其使 Writing 状态计数增加，并保持在该状态，直到响应返回给客户端。这意味着，该请求在 Writing 状态时， 一方面 NGINX 等待来自上游系统的结果（系统放在 NGINX “后面”），另外一方面，NGINX 也在同时响应。请求往往会在 Writing 状态花费大量的时间。

通常，一个连接在同一时间只接受一个请求。在这种情况下，Active 连接的数目 ==  Waiting  的连接 + Reading 请求 + Writing 。然而，较新的 SPDY 和 HTTP/2 协议允许多个并发请求/响应复用一个连接，所以 Active 可小于 Waiting 的连接、 Reading 请求、Writing 请求的总和。 （在撰写本文时，NGINX 不支持 HTTP/2，但预计到2015年期间将会支持。）

**NGINX Plus**

正如上面提到的，所有开源 NGINX 的指标在 NGINX Plus 中是可用的，但另外也提供其他的指标。本节仅说明了 NGINX Plus 可用的指标。


![connection, request states](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/nginx_plus_connection_diagram-2.png)

Accepted （已接受）、Dropped，总数是不断增加的计数器。Active、 Idle（空闲）和处于 Current（当前）处理阶段的各种状态下的连接或请​​求的当前数量随着请求量而增减。

| 名称 | 描述| [指标类型](https://www.datadoghq.com/blog/monitoring-101-collecting-data/)|
|-----------|-----------------|-------------------------------------------------------------------------------------------------------------------------|
| Accepted |  NGINX 所接受的客户端连接数 | 资源: 功能 |
| Dropped |丢弃的连接数（接受 - 已处理）| 工作：错误*|
| Active | 当前活跃的客户端连接数| 资源: 功能 |
| Idle | 没有当前请求的客户端连接| 资源: 功能 |
| Total（全部） | 客户端请求数 | 工作：吞吐量 |

_*严格的来说，丢弃的连接是 [一个资源饱和指标](https://www.datadoghq.com/blog/monitoring-101-collecting-data/#resource-metrics)，但是因为饱和会导致	 NGINX 停止服务（而不是延后该请求），所以，“已丢弃”视作 [一个工作指标](https://www.datadoghq.com/blog/monitoring-101-collecting-data/#work-metrics) 比较合适。_

当 NGINX Plus worker 进程接受 OS 的连接请求时 **Accepted** 计数器递增。如果 worker 进程为请求建立连接失败（通过建立一个新的连接或重新使用一个空闲），则该连接被丢弃， **Dropped** 计数增加。通常连接被丢弃是因为资源限制，如 NGINX Plus 的[worker_connections][4]的限制已经达到。

**Active** 和 **Idle** 和[如上所述][5]的开源 NGINX 的“active” 和 “waiting”状态是相同的，但是有一点关键的不同：在开源 NGINX 上，“waiting”状态包括在“active”中，而在 NGINX Plus 上“idle”的连接被排除在“active” 计数外。**Current** 和开源 NGINX 是一样的也是由“reading + writing” 状态组成。

**Total** 为客户端请求的累积计数。请注意，单个客户端连接可涉及多个请求，所以这个数字可能会比连接的累计次数明显大。事实上，（total / accepted）是每个连接的平均请求数量。

**开源 和 Plus 之间指标的不同**

|NGINX （开源） |NGINX Plus|
|-----------------------|----------------|
| accepts | accepted |
| dropped 通过计算得来| dropped 直接得到 |
| reading + writing| current|
| waiting| idle|
| active （包括 “waiting”状态） | active （排除 “idle” 状态）|
| requests| total|

**提醒指标: 丢弃连接**

被丢弃的连接数目等于 Accepts 和 Handled 之差（NGINX 中），或是可直接得到标准指标（NGINX Plus 中）。在正常情况下，丢弃连接数应该是零。如果在每个单位时间内丢弃连接的速度开始上升，那么应该看看是否资源饱和了。

![Dropped connections](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/dropped_connections.png)

**提醒指标: 每秒请求数**

按固定时间间隔采样你的请求数据（开源 NGINX 的**requests**或者 NGINX Plus 中**total**） 会提供给你单位时间内（通常是分钟或秒）所接受的请求数量。监测这个指标可以查看进入的 Web 流量尖峰，无论是合法的还是恶意的，或者突然的下降，这通常都代表着出现了问题。每秒请求数若发生急剧变化可以提醒你的环境出现问题了，即使它不能告诉你确切问题的位置所在。请注意，所有的请求都同样计数，无论 URL 是什么。

![Requests per second](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/requests_per_sec.png)

**收集活跃指标**

开源的 NGINX 提供了一个简单状态页面来显示基本的服务器指标。该状态信息以标准格式显示，实际上任何图形或监控工具可以被配置去解析这些相关数据，以用于分析、可视化、或提醒。NGINX Plus 提供一个 JSON 接口来供给更多的数据。阅读相关文章“[NGINX 指标收集][6]”来启用指标收集的功能。

#### 错误指标 ####

| 名称 | 描述| [指标类型](https://www.datadoghq.com/blog/monitoring-101-collecting-data/)| 可用于 | 
|-----------|-----------------|--------------------------------------------------------------------------------------------------------|----------------|
| 4xx 代码 | 客户端错误计数 | 工作：错误 | NGINX 日志, NGINX Plus|
| 5xx 代码| 服务器端错误计数 | 工作：错误 | NGINX 日志, NGINX Plus|

NGINX 错误指标告诉你服务器是否经常返回错误而不是正常工作。客户端错误返回4XX状态码，服务器端错误返回5XX状态码。

**提醒指标: 服务器错误率**

服务器错误率等于在单位时间（通常为一到五分钟）内5xx错误状态代码的总数除以[状态码][7]（1XX，2XX，3XX，4XX，5XX）的总数。如果你的错误率随着时间的推移开始攀升，调查可能的原因。如果突然增加，可能需要采取紧急行动，因为客户端可能收到错误信息。

![Server error rate](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/5xx_rate.png)

关于客户端错误的注意事项：虽然监控4XX是很有用的，但从该指标中你仅可以捕捉有限的信息，因为它只是衡量客户的行为而不捕捉任何特殊的 URL。换句话说，4xx出现的变化可能是一个信号，例如网络扫描器正在寻找你的网站漏洞时。

**收集错误度量**

虽然开源 NGINX 不能马上得到用于监测的错误率，但至少有两种方法可以得到：

- 使用商业支持的 NGINX Plus 提供的扩展状态模块
- 配置 NGINX 的日志模块将响应码写入访问日志

关于这两种方法，请阅读相关文章“[NGINX 指标收集][6]”。

#### 性能指标 ####

| 名称 | 描述| [指标类型](https://www.datadoghq.com/blog/monitoring-101-collecting-data/)| 可用于 | 
|-----------|-----------------|--------------------------------------------------------------------------------------------------------|----------------|
| request time （请求处理时间）| 处理每个请求的时间，单位为秒 | 工作：性能 | NGINX 日志|

**提醒指标: 请求处理时间**

请求处理时间指标记录了 NGINX 处理每个请求的时间，从读到客户端的第一个请求字节到完成请求。较长的响应时间说明问题在上游。

**收集处理时间指标**

NGINX 和 NGINX Plus 用户可以通过添加 $request_time 变量到访问日志格式中来捕​​捉处理时间数据。关于配置日志监控的更多细节在[NGINX指标收集][6]。

#### 反向代理指标 ####

| 名称 | 描述| [指标类型](https://www.datadoghq.com/blog/monitoring-101-collecting-data/)| 可用于 | 
|-----------|-----------------|--------------------------------------------------------------------------------------------------------|----------------|
| 上游服务器的活跃链接 | 当前活跃的客户端连接 | 资源：功能 | NGINX Plus |
| 上游服务器的 5xx 错误代码| 服务器错误 | 工作：错误 | NGINX Plus |
| 每个上游组的可用服务器 | 服务器传递健康检查 | 资源：可用性| NGINX Plus

[反向代理][9]是 NGINX 最常见的使用方法之一。商业支持的 NGINX Plus 显示了大量有关后端（或“上游 upstream”）的服务器指标，这些与反向代理设置相关的。本节重点介绍了几个 NGINX Plus 用户可用的关键上游指标。

NGINX Plus 首先将它的上游指标按组分开，然后是针对单个服务器的。因此，例如，你的反向代理将请求分配到五个上游的 Web 服务器上，你可以一眼看出是否有单个服务器压力过大，也可以看出上游组中服务器的健康状况，以确保良好的响应时间。

**活跃指标**

**每上游服务器的活跃连接**的数量可以帮助你确认反向代理是否正确的分配工作到你的整个服务器组上。如果你正在使用 NGINX 作为负载均衡器，任何一台服务器处理的连接数的明显偏差都可能表明服务器正在努力消化请求，或者是你配置使用的负载均衡的方法（例如[round-robin 或 IP hashing][10]）不是最适合你流量模式的。

**错误指标**

错误指标，上面所说的高于5XX（服务器错误）状态码，是监控指标中有价值的一个，尤其是响应码部分。 NGINX Plus 允许你轻松地提取**每个上游服务器的 5xx 错误代码**的数量，以及响应的总数量，以此来确定某个特定服务器的错误率。

**可用性指标**

对于 web 服务器的运行状况，还有另一种角度，NGINX 可以通过**每个组中当前可用服务器的总量**很方便监控你的上游组的健康。在一个大的反向代理上，你可能不会非常关心其中一个服务器的当前状态，就像你只要有可用的服务器组能够处理当前的负载就行了。但监视上游组内的所有工作的服务器总量可为判断 Web 服务器的健康状况提供一个更高层面的视角。

**收集上游指标**

NGINX Plus 上游指标显示在内部 NGINX Plus 的监控仪表盘上，并且也可通过一个JSON 接口来服务于各种外部监控平台。在我们的相关文章“[NGINX指标收集][6]”中有个例子。

### 结论 ###

在这篇文章中，我们已经谈到了一些有用的指标，你可以使用表格来监控 NGINX 服务器。如果你是刚开始使用 NGINX，监控下面提供的大部分或全部指标，可以让你很好的了解你的网络基础设施的健康和活跃程度：

- [已丢弃的连接][12]
- [每秒请求数][13]
- [服务器错误率][14]
- [请求处理数据][15]

最终，你会学到更多，更专业的衡量指标，尤其是关于你自己基础设施和使用情况的。当然，监控哪一项指标将取决于你可用的工具。参见相关的文章来[逐步指导你的指标收集][6]，不管你使用 NGINX 还是 NGINX Plus。

在 Datadog 中，我们已经集成了 NGINX 和 NGINX Plus，这样你就可以以最少的设置来收集和监控所有 Web 服务器的指标。 [在本文中][17]了解如何用 NGINX Datadog来监控，并开始[免费试用 Datadog][18]吧。

### 诚谢 ###

在文章发表之前非常感谢 NGINX 团队审阅这篇，并提供重要的反馈和说明。


--------------------------------------------------------------------------------

via: https://www.datadoghq.com/blog/how-to-monitor-nginx/

作者：K Young
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:http://nginx.org/en/
[2]:http://nginx.com/resources/glossary/reverse-proxy-server/
[3]:https://www.datadoghq.com/blog/monitoring-101-collecting-data/
[4]:http://nginx.org/en/docs/ngx_core_module.html#worker_connections
[5]:https://www.datadoghq.com/blog/how-to-monitor-nginx/#active-state
[6]:https://www.datadoghq.com/blog/how-to-collect-nginx-metrics/
[7]:http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html
[8]:https://www.datadoghq.com/blog/how-to-collect-nginx-metrics/
[9]:https://en.wikipedia.org/wiki/Reverse_proxy
[10]:http://nginx.com/blog/load-balancing-with-nginx-plus/
[11]:https://www.datadoghq.com/blog/how-to-collect-nginx-metrics/
[12]:https://www.datadoghq.com/blog/how-to-monitor-nginx/#dropped-connections
[13]:https://www.datadoghq.com/blog/how-to-monitor-nginx/#requests-per-second
[14]:https://www.datadoghq.com/blog/how-to-monitor-nginx/#server-error-rate
[15]:https://www.datadoghq.com/blog/how-to-monitor-nginx/#request-processing-time
[16]:https://www.datadoghq.com/blog/how-to-collect-nginx-metrics/
[17]:https://www.datadoghq.com/blog/how-to-monitor-nginx-with-datadog/
[18]:https://www.datadoghq.com/blog/how-to-monitor-nginx/#sign-up
[19]:https://github.com/DataDog/the-monitor/blob/master/nginx/how_to_monitor_nginx.md
[20]:https://github.com/DataDog/the-monitor/issues
