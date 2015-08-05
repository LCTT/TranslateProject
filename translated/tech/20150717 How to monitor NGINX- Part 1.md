如何监控 NGINX - 第1部分
================================================================================
![](http://www.datadoghq.com/wp-content/uploads/2015/07/NGINX_hero_1.png)

### NGINX 是什么? ###

[NGINX][1] (发音为 “engine X”) 是一种流行的 HTTP 和反向代理服务器。作为一个 HTTP 服务器，NGINX 提供静态内容非常高效可靠，使用较少的内存。作为[反向代理][2]，它可以用作一个单一的控制器来为其他应用代理至后端的多个服务器上，如高速缓存和负载平衡。NGINX 是作为一个免费，开源的产品并有更全的功能，商业版的叫 NGINX Plus。

NGINX 也可以用作邮件代理和通用的 TCP 代理，但本文并不直接说明对 NGINX 的这些用例做监控。

### NGINX 主要指标 ###

通过监控 NGINX 可以捕捉两类问题：NGINX 本身的资源问题，也有很多问题会出现在你的基础网络设施处。大多数 NGINX 用户受益于以下指标的监控，包括**requests per second**，它提供了一个所有用户活动的高级视图；**server error rate** ，这表明你的服务器已经多长没有处理看似有效的请求;还有**request processing time**，这说明你的服务器处理客户端请求的总共时长（并且可以看出性能降低时或当前环境的其他问题）。

更一般地，至少有三个主要的指标类别来监视：

- 基本活动指标
- 错误指标
- 性能指标

下面我们将分析在每个类别中最重要的 NGINX 指标，以及用一个相当普遍的案例来说明，值得特别说明的是：使用 NGINX Plus 作反向代理。我们还将介绍如何使用图形工具或可选择的监控工具来监控所有的指标。

本文引用指标术语[介绍我们的监控在 101 系列][3],，它提供了指标收集和警告框架。

#### 基本活动指标 ####

无论你在怎样的情况下使用 NGINX，毫无疑问你要监视服务器接收多少客户端请求和如何处理这些请求。

NGINX Plus 上像开源 NGINX 一样可以报告基本活动指标，但它也提供了略有不同的辅助模块。我们首先讨论开源的 NGINX，再来说明 NGINX Plus 提供的其他指标的功能。

**NGINX**

下图显示了一个客户端连接，以及如何在连接过程中收集指标的活动周期在开源 NGINX 版本上。

![connection, request states](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/nginx_connection_diagram-2.png)

接受，处理，增加请求的计数器。主动，等待，读，写增加和减少请求量。

注：表格
<table>
<colgroup>
<col style="text-align: left;">
<col style="text-align: left;">
<col style="text-align: left;"> </colgroup>
<thead>
<tr>
<th style="text-align: left;"><strong>Name</strong></th>
<th style="text-align: left;"><strong>Description</strong></th>
<th style="text-align: left;"><strong><a target="_blank" href="https://www.datadoghq.com/blog/monitoring-101-collecting-data/">Metric type</a></strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">accepts</td>
<td style="text-align: left;">Count of client connections attempted by NGINX</td>
<td style="text-align: left;">Resource: Utilization</td>
</tr>
<tr>
<td style="text-align: left;">handled</td>
<td style="text-align: left;">Count of successful client connections</td>
<td style="text-align: left;">Resource: Utilization</td>
</tr>
<tr>
<td style="text-align: left;">active</td>
<td style="text-align: left;">Currently active client connections</td>
<td style="text-align: left;">Resource: Utilization</td>
</tr>
<tr>
<td style="text-align: left;">dropped (calculated)</td>
<td style="text-align: left;">Count of dropped connections (accepts &ndash; handled)</td>
<td style="text-align: left;">Work: Errors*</td>
</tr>
<tr>
<td style="text-align: left;">requests</td>
<td style="text-align: left;">Count of client requests</td>
<td style="text-align: left;">Work: Throughput</td>
</tr>
<tr>
<td colspan="3" style="text-align: left;">*<em>Strictly speaking, dropped connections is <a target="_blank" href="https://www.datadoghq.com/blog/monitoring-101-collecting-data/#resource-metrics">a metric of resource saturation</a>, but since saturation causes NGINX to stop servicing some work (rather than queuing it up for later), “dropped” is best thought of as <a target="_blank" href="https://www.datadoghq.com/blog/monitoring-101-collecting-data/#work-metrics">a work metric</a>.</em></td>
</tr>
</tbody>
</table>

NGINX 进程接受 OS 的连接请求时**accepts** 计数器增加，而**handled** 是当实际的请求得到连接时（通过建立一个新的连接或重新使用一个空闲的）。这两个计数器的值通常都是相同的，表明连接正在被**dropped**，往往由于资源限制，如 NGINX 的[worker_connections][4]的限制已经达到。

一旦 NGINX 成功处理一个连接时，连接会移动到**active**状态，然后保持为客户端请求进行处理：

Active 状态

- **Waiting**: 活动的连接也可以是一个 Waiting 子状态，如果有在此刻没有活动请求。新连接绕过这个状态并直接移动到读，最常见的是使用“accept filter” 和 “deferred accept”，在这种情况下，NGINX 不会接收进程的通知，直到它具有足够的数据来开始响应工作。如果连接设置为 keep-alive ，连接在发送响应后将处于等待状态。

- **Reading**: 当接收到请求时，连接移出等待状态，并且该请求本身也被视为 Reading。在这种状态下NGINX 正在读取客户端请求首部。请求首部是比较少的，因此这通常是一个快速的操作。

- **Writing**: 请求被读取之后，将其计为 Writing，并保持在该状态，直到响应返回给客户端。这意味着，该请求在 Writing 时， NGINX 同时等待来自负载均衡服务器的结果（系统“背后”的      NGINX），NGINX 也同时响应。请求往往会花费大量的时间在 Writing 状态。

通常，一个连接在同一时间只接受一个请求。在这种情况下，Active 连接的数目 == Waiting 连接 + Reading 请求 + Writing 请求。然而，较新的 SPDY 和 HTTP/2 协议允许多个并发请求/响应对被复用的连接，所以 Active 可小于 Waiting，Reading，Writing 的总和。 （在撰写本文时，NGINX 不支持 HTTP/2，但预计到2015年期间将会支持。）

**NGINX Plus**

正如上面提到的，所有开源 NGINX 的指标在 NGINX Plus 中是可用的，但另外也提供其他的指标。本节仅说明了 NGINX Plus 可用的指标。


![connection, request states](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/nginx_plus_connection_diagram-2.png)

接受，中断，总数是不断增加的。活动，空闲和已建立连接的，当前状态下每一个连接或请​​求的数量是随着请求量增加和收缩的。

注：表格
<table>
<colgroup>
<col style="text-align: left;">
<col style="text-align: left;">
<col style="text-align: left;"> </colgroup>
<thead>
<tr>
<th style="text-align: left;"><strong>Name</strong></th>
<th style="text-align: left;"><strong>Description</strong></th>
<th style="text-align: left;"><strong><a target="_blank" href="https://www.datadoghq.com/blog/monitoring-101-collecting-data/">Metric type</a></strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">accepted</td>
<td style="text-align: left;">Count of client connections attempted by NGINX</td>
<td style="text-align: left;">Resource: Utilization</td>
</tr>
<tr>
<td style="text-align: left;">dropped</td>
<td style="text-align: left;">Count of dropped connections</td>
<td style="text-align: left;">Work: Errors*</td>
</tr>
<tr>
<td style="text-align: left;">active</td>
<td style="text-align: left;">Currently active client connections</td>
<td style="text-align: left;">Resource: Utilization</td>
</tr>
<tr>
<td style="text-align: left;">idle</td>
<td style="text-align: left;">Client connections with zero current requests</td>
<td style="text-align: left;">Resource: Utilization</td>
</tr>
<tr>
<td style="text-align: left;">total</td>
<td style="text-align: left;">Count of client requests</td>
<td style="text-align: left;">Work: Throughput</td>
</tr>
<tr>
<td colspan="3" style="text-align: left;">*<em>Strictly speaking, dropped connections is a metric of resource saturation, but since saturation causes NGINX to stop servicing some work (rather than queuing it up for later), “dropped” is best thought of as a work metric.</em></td>
</tr>
</tbody>
</table>

当 NGINX Plus 进程接受 OS 的连接请求时 **accepted** 计数器递增。如果进程请求连接失败（通过建立一个新的连接或重新使用一个空闲），则该连接断开 **dropped** 计数增加。通常连接被中断是因为资源限制，如 NGINX Plus 的[worker_connections][4]的限制已经达到。

**Active** 和 **idle** 和开源 NGINX 的“active” 和 “waiting”状态是相同的，[如上所述][5]，有一个不同的地方：在开源 NGINX 上，“waiting”状态包括在“active”中，而在 NGINX Plus 上“idle”的连接被排除在“active” 计数外。**Current** 和开源 NGINX 是一样的也是由“reading + writing” 状态组成。


**Total** 为客户端请求的累积计数。请注意，单个客户端连接可涉及多个请求，所以这个数字可能会比连接的累计次数明显大。事实上，（total / accepted）是每个连接请求的平均数量。

**开源 和 Plus 之间指标的不同**

注：表格
<table>
<colgroup>
<col style="text-align: left;">
<col style="text-align: left;"> </colgroup>
<thead>
<tr>
<th style="text-align: left;">NGINX (open-source)</th>
<th style="text-align: left;">NGINX Plus</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">accepts</td>
<td style="text-align: left;">accepted</td>
</tr>
<tr>
<td style="text-align: left;">dropped must be calculated</td>
<td style="text-align: left;">dropped is reported directly</td>
</tr>
<tr>
<td style="text-align: left;">reading + writing</td>
<td style="text-align: left;">current</td>
</tr>
<tr>
<td style="text-align: left;">waiting</td>
<td style="text-align: left;">idle</td>
</tr>
<tr>
<td style="text-align: left;">active (includes “waiting” states)</td>
<td style="text-align: left;">active (excludes “idle” states)</td>
</tr>
<tr>
<td style="text-align: left;">requests</td>
<td style="text-align: left;">total</td>
</tr>
</tbody>
</table>

**提醒指标: 中断连接**

被中断的连接数目等于接受和处理之差（NGINX），或被公开直接作为指标的标准（NGINX加）。在正常情况下，中断连接数应该是零。如果每秒中中断连接的速度开始上升，寻找资源可能用尽的地方。

![Dropped connections](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/dropped_connections.png)

**提醒指标: 每秒请求数**

提供你（开源中的**requests**或者 Plus 中**total**）固定时间间隔每秒或每分钟请求的平均数据。监测这个指标可以查看 Web 的输入流量的最大值，无论是合法的还是恶意的，有可能会突然下降，通常可以看出问题。每秒的请求若发生急剧变化可以提醒你出问题了，即使它不能告诉你确切问题的位置所在。请注意，所有的请求都算作是相同的，无论哪个 URLs。

![Requests per second](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/requests_per_sec.png)

**收集活动指标**

开源的 NGINX 提供了一个简单状态页面来显示基本的服务器指标。该状态信息以标准格式被显示，实际上任何图形或监控工具可以被配置去解析相关的数据为分析，可视化，或提醒而用。NGINX Plus 提供一个 JSON 接口来显示更多的数据。阅读[NGINX 指标收集][6]后来启用指标收集的功能。

#### 错误指标 ####

注：表格
<table>
<colgroup>
<col style="text-align: left;">
<col style="text-align: left;">
<col style="text-align: left;">
<col style="text-align: left;"> </colgroup>
<thead>
<tr>
<th style="text-align: left;"><strong>Name</strong></th>
<th style="text-align: left;"><strong>Description</strong></th>
<th style="text-align: left;"><strong><a target="_blank" href="https://www.datadoghq.com/blog/monitoring-101-collecting-data/">Metric type</a></strong></th>
<th style="text-align: left;"><strong>Availability</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">4xx codes</td>
<td style="text-align: left;">Count of client errors</td>
<td style="text-align: left;">Work: Errors</td>
<td style="text-align: left;">NGINX logs, NGINX Plus</td>
</tr>
<tr>
<td style="text-align: left;">5xx codes</td>
<td style="text-align: left;">Count of server errors</td>
<td style="text-align: left;">Work: Errors</td>
<td style="text-align: left;">NGINX logs, NGINX Plus</td>
</tr>
</tbody>
</table>

NGINX 错误指标告诉你服务器经常返回哪些错误，这也是有用的。客户端错误返回4XX状态码，服务器端错误返回5XX状态码。

**提醒指标: 服务器错误率**

服务器错误率等于5xx错误状态代码的总数除以[状态码][7]（1XX，2XX，3XX，4XX，5XX）的总数，每单位时间（通常为一到五分钟）的数目。如果你的错误率随着时间的推移开始攀升，调查可能的原因。如果突然增加，可能需要采取紧急行动，因为客户端可能收到错误信息。

![Server error rate](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/5xx_rate.png)

客户端收到错误时的注意事项：虽然监控4XX是很有用的，但从该指标中你仅可以捕捉有限的信息，因为它只是衡量客户的行为而不捕捉任何特殊的 URLs。换句话说，在4xx出现时只是相当于一点噪音，例如寻找漏洞的网络扫描仪。

**收集错误度量**

虽然开源 NGINX 不会监测错误率，但至少有两种方法可以捕获其信息：

- 使用商业支持的 NGINX Plus 提供的可扩展状态模块
- 配置 NGINX 的日志模块将响应码写入访问日志

阅读关于 NGINX 指标收集的后两个方法的详细说明。

#### 性能指标 ####

注：表格
<table>
<colgroup>
<col style="text-align: left;">
<col style="text-align: left;">
<col style="text-align: left;">
<col style="text-align: left;"> </colgroup>
<thead>
<tr>
<th style="text-align: left;"><strong>Name</strong></th>
<th style="text-align: left;"><strong>Description</strong></th>
<th style="text-align: left;"><strong><a target="_blank" href="https://www.datadoghq.com/blog/monitoring-101-collecting-data/">Metric type</a></strong></th>
<th style="text-align: left;"><strong>Availability</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">request time</td>
<td style="text-align: left;">Time to process each request, in seconds</td>
<td style="text-align: left;">Work: Performance</td>
<td style="text-align: left;">NGINX logs</td>
</tr>
</tbody>
</table>

**提醒指标: 请求处理时间**

请求时间指标记录 NGINX 处理每个请求的时间，从第一个客户端的请求字节读出到完成请求。较长的响应时间可以将问题指向负载均衡服务器。

**收集处理时间指标**

NGINX 和 NGINX Plus 用户可以通过添加 $request_time 变量到访问日志格式中来捕​​捉处理时间数据。关于配置日志监控的更多细节在[NGINX指标收集][8]。

#### 反向代理指标 ####

注：表格
<table>
<colgroup>
<col style="text-align: left;">
<col style="text-align: left;">
<col style="text-align: left;">
<col style="text-align: left;"> </colgroup>
<thead>
<tr>
<th style="text-align: left;"><strong>Name</strong></th>
<th style="text-align: left;"><strong>Description</strong></th>
<th style="text-align: left;"><strong><a target="_blank" href="https://www.datadoghq.com/blog/monitoring-101-collecting-data/">Metric type</a></strong></th>
<th style="text-align: left;"><strong>Availability</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Active connections by upstream server</td>
<td style="text-align: left;">Currently active client connections</td>
<td style="text-align: left;">Resource: Utilization</td>
<td style="text-align: left;">NGINX Plus</td>
</tr>
<tr>
<td style="text-align: left;">5xx codes by upstream server</td>
<td style="text-align: left;">Server errors</td>
<td style="text-align: left;">Work: Errors</td>
<td style="text-align: left;">NGINX Plus</td>
</tr>
<tr>
<td style="text-align: left;">Available servers per upstream group</td>
<td style="text-align: left;">Servers passing health checks</td>
<td style="text-align: left;">Resource: Availability</td>
<td style="text-align: left;">NGINX Plus</td>
</tr>
</tbody>
</table>

[反向代理][9]是 NGINX 最常见的使用方法之一。商业支持的 NGINX Plus 显示了大量有关后端（或“负载均衡”）的服务器指标，这是反向代理设置的。本节重点介绍了几个关键的负载均衡服务器的指标为 NGINX Plus 用户。

NGINX Plus 的负载均衡服务器指标首先是组的，然后是单个服务器的。因此，例如，你的反向代理将请求分配到五个 Web 负载均衡服务器上，你可以一眼看出是否有单个服务器压力过大，也可以看出负载均衡服务器组的健康状况，以确保良好的响应时间。

**活动指标**

**active connections per upstream server**的数量可以帮助你确认反向代理是否正确的分配工作到负载均衡服务器上。如果你正在使用 NGINX 作为负载均衡器，任何一台服务器处理的连接数有显著的偏差都可能表明服务器正在努力处理请求或你配置处理请求的负载均衡的方法（例如[round-robin or IP hashing][10]）不是最适合你流量模式的。

**错误指标**

错误指标，上面所说的高于5XX（服务器错误）状态码，是监控指标中有价值的一个，尤其是响应码部分。 NGINX Plus 允许你轻松地提取每个负载均衡服务器 **5xx codes per upstream server**的数量，以及响应的总数量，以此来确定该特定服务器的错误率。


**可用性指标**

对于 web 服务器的运行状况，另一种观点认为，NGINX 也可以很方便监控你的负载均衡服务器组的健康通过**servers currently available within each group**的总量​​。在一个大的反向代理上，你可能不会非常关心其中一个服务器的当前状态，就像你只要可用的服务器组能够处理当前的负载就行了。但监视负载均衡服务器组内的所有服务器可以提供一个高水平的图像来判断 Web 服务器的健康状况。

**收集负载均衡服务器的指标**

NGINX Plus 负载均衡服务器的指标显示在内部 NGINX Plus 的监控仪表盘上，并且也可通过一个JSON 接口来服务于所有外部的监控平台。在这儿看一个例子[收集 NGINX 指标][11]。

### 结论 ###

在这篇文章中，我们已经谈到了一些有用的指标，你可以使用表格来监控 NGINX 服务器。如果你是刚开始使用 NGINX，下面提供了良好的网络基础设施的健康和活动的可视化工具来监控大部分或所有的指标：

- [Dropped connections][12]
- [Requests per second][13]
- [Server error rate][14]
- [Request processing time][15]

最终，你会学到更多，更专业的衡量指标，尤其是关于你自己基础设施和使用情况的。当然，监控哪一项指标将取决于你可用的工具。参见[一步一步来说明指标收集][16]，不管你使用 NGINX 还是 NGINX Plus。



在 Datadog 中，我们已经集成了 NGINX 和 NGINX Plus，这样你就可以以最小的设置来收集和监控所有 Web 服务器的指标。了解如何用 NGINX Datadog来监控 [在本文中][17]，并开始使用 [免费的 Datadog][18]。

### Acknowledgments ###

在文章发表之前非常感谢 NGINX 团队审阅这篇，并提供重要的反馈和说明。

----------

文章来源在这儿 [on GitHub][19]。问题，更正，补充等？请[告诉我们][20]。


--------------------------------------------------------------------------------

via: https://www.datadoghq.com/blog/how-to-monitor-nginx/

作者：K Young
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[校对者ID](https://github.com/校对者ID)

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
