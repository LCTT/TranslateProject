KevinSJ Translating
How to monitor NGINX - Part 1
================================================================================
![](http://www.datadoghq.com/wp-content/uploads/2015/07/NGINX_hero_1.png)

### What is NGINX? ###

[NGINX][1] (pronounced “engine X”) is a popular HTTP server and reverse proxy server. As an HTTP server, NGINX serves static content very efficiently and reliably, using relatively little memory. As a [reverse proxy][2], it can be used as a single, controlled point of access for multiple back-end servers or for additional applications such as caching and load balancing. NGINX is available as a free, open-source product or in a more full-featured, commercially distributed version called NGINX Plus.

NGINX can also be used as a mail proxy and a generic TCP proxy, but this article does not directly address NGINX monitoring for these use cases.

### Key NGINX metrics ###

By monitoring NGINX you can catch two categories of issues: resource issues within NGINX itself, and also problems developing elsewhere in your web infrastructure. Some of the metrics most NGINX users will benefit from monitoring include **requests per second**, which provides a high-level view of combined end-user activity; **server error rate**, which indicates how often your servers are failing to process seemingly valid requests; and **request processing time**, which describes how long your servers are taking to process client requests (and which can point to slowdowns or other problems in your environment).

More generally, there are at least three key categories of metrics to watch:

- Basic activity metrics
- Error metrics
- Performance metrics

Below we’ll break down a few of the most important NGINX metrics in each category, as well as metrics for a fairly common use case that deserves special mention: using NGINX Plus for reverse proxying. We will also describe how you can monitor all of these metrics with your graphing or monitoring tools of choice.

This article references metric terminology [introduced in our Monitoring 101 series][3], which provides a framework for metric collection and alerting.

#### Basic activity metrics ####

Whatever your NGINX use case, you will no doubt want to monitor how many client requests your servers are receiving and how those requests are being processed.

NGINX Plus can report basic activity metrics exactly like open-source NGINX, but it also provides a secondary module that reports metrics slightly differently. We discuss open-source NGINX first, then the additional reporting capabilities provided by NGINX Plus.

**NGINX**

The diagram below shows the lifecycle of a client connection and how the open-source version of NGINX collects metrics during a connection.

![connection, request states](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/nginx_connection_diagram-2.png)

Accepts, handled, and requests are ever-increasing counters. Active, waiting, reading, and writing grow and shrink with request volume.

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

The **accepts** counter is incremented when an NGINX worker picks up a request for a connection from the OS, whereas **handled** is incremented when the worker actually gets a connection for the request (by establishing a new connection or reusing an open one). These two counts are usually the same—any divergence indicates that connections are being **dropped**, often because a resource limit, such as NGINX’s [worker_connections][4] limit, has been reached.

Once NGINX successfully handles a connection, the connection moves to an **active** state, where it remains as client requests are processed:

Active state

- **Waiting**: An active connection may also be in a Waiting substate if there is no active request at the moment. New connections can bypass this state and move directly to Reading, most commonly when using “accept filter” or “deferred accept”, in which case NGINX does not receive notice of work until it has enough data to begin working on the response. Connections will also be in the Waiting state after sending a response if the connection is set to keep-alive.
- **Reading**: When a request is received, the connection moves out of the waiting state, and the request itself is counted as Reading. In this state NGINX is reading a client request header. Request headers are lightweight, so this is usually a fast operation.
- **Writing**: After the request is read, it is counted as Writing, and remains in that state until a response is returned to the client. That means that the request is Writing while NGINX is waiting for results from upstream systems (systems “behind” NGINX), and while NGINX is operating on the response. Requests will often spend the majority of their time in the Writing state.

Often a connection will only support one request at a time. In this case, the number of Active connections == Waiting connections + Reading requests + Writing requests. However, the newer SPDY and HTTP/2 protocols allow multiple concurrent requests/responses to be multiplexed over a connection, so Active may be less than the sum of Waiting, Reading, and Writing. (As of this writing, NGINX does not support HTTP/2, but expects to add support during 2015.)

**NGINX Plus**

As mentioned above, all of open-source NGINX’s metrics are available within NGINX Plus, but Plus can also report additional metrics. The section covers the metrics that are only available from NGINX Plus.

![connection, request states](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/nginx_plus_connection_diagram-2.png)

Accepted, dropped, and total are ever-increasing counters. Active, idle, and current track the current number of connections or requests in each of those states, so they grow and shrink with request volume.

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

The **accepted** counter is incremented when an NGINX Plus worker picks up a request for a connection from the OS. If the worker fails to get a connection for the request (by establishing a new connection or reusing an open one), then the connection is dropped and **dropped** is incremented. Ordinarily connections are dropped because a resource limit, such as NGINX Plus’s [worker_connections][4] limit, has been reached.

**Active** and **idle** are the same as “active” and “waiting” states in open-source NGINX as described [above][5], with one key exception: in open-source NGINX, “waiting” falls under the “active” umbrella, whereas in NGINX Plus “idle” connections are excluded from the “active” count. **Current** is the same as the combined “reading + writing” states in open-source NGINX.

**Total** is a cumulative count of client requests. Note that a single client connection can involve multiple requests, so this number may be significantly larger than the cumulative number of connections. In fact, (total / accepted) yields the average number of requests per connection.

**Metric differences between Open-Source and Plus**

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

**Metric to alert on: Dropped connections**

The number of connections that have been dropped is equal to the difference between accepts and handled (NGINX) or is exposed directly as a standard metric (NGINX Plus). Under normal circumstances, dropped connections should be zero. If your rate of dropped connections per unit time starts to rise, look for possible resource saturation.

![Dropped connections](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/dropped_connections.png)

**Metric to alert on: Requests per second**

Sampling your request data (**requests** in open-source, or **total** in Plus) with a fixed time interval provides you with the number of requests you’re receiving per unit of time—often minutes or seconds. Monitoring this metric can alert you to spikes in incoming web traffic, whether legitimate or nefarious, or sudden drops, which are usually indicative of problems. A drastic change in requests per second can alert you to problems brewing somewhere in your environment, even if it cannot tell you exactly where those problems lie. Note that all requests are counted the same, regardless of their URLs.

![Requests per second](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/requests_per_sec.png)

**Collecting activity metrics**

Open-source NGINX exposes these basic server metrics on a simple status page. Because the status information is displayed in a standardized form, virtually any graphing or monitoring tool can be configured to parse the relevant data for analysis, visualization, or alerting. NGINX Plus provides a JSON feed with much richer data. Read the companion post on [NGINX metrics collection][6] for instructions on enabling metrics collection.

#### Error metrics ####

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

NGINX error metrics tell you how often your servers are returning errors instead of producing useful work. Client errors are represented by 4xx status codes, server errors with 5xx status codes.

**Metric to alert on: Server error rate**

Your server error rate is equal to the number of 5xx errors divided by the total number of [status codes][7] (1xx, 2xx, 3xx, 4xx, 5xx), per unit of time (often one to five minutes). If your error rate starts to climb over time, investigation may be in order. If it spikes suddenly, urgent action may be required, as clients are likely to report errors to the end user.

![Server error rate](https://d33tyra1llx9zy.cloudfront.net/blog/images/2015-06-nginx/5xx_rate.png)

A note on client errors: while it is tempting to monitor 4xx, there is limited information you can derive from that metric since it measures client behavior without offering any insight into particular URLs. In other words, a change in 4xx could be noise, e.g. web scanners blindly looking for vulnerabilities.

**Collecting error metrics**

Although open-source NGINX does not make error rates immediately available for monitoring, there are at least two ways to capture that information:

- Use the expanded status module available with commercially supported NGINX Plus
- Configure NGINX’s log module to write response codes in access logs

Read the companion post on NGINX metrics collection for detailed instructions on both approaches.

#### Performance metrics ####

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

**Metric to alert on: Request processing time**

The request time metric logged by NGINX records the processing time for each request, from the reading of the first client bytes to fulfilling the request. Long response times can point to problems upstream.

**Collecting processing time metrics**

NGINX and NGINX Plus users can capture data on processing time by adding the $request_time variable to the access log format. More details on configuring logs for monitoring are available in our companion post on [NGINX metrics collection][8].

#### Reverse proxy metrics ####

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

One of the most common ways to use NGINX is as a [reverse proxy][9]. The commercially supported NGINX Plus exposes a large number of metrics about backend (or “upstream”) servers, which are relevant to a reverse proxy setup. This section highlights a few of the key upstream metrics that are available to users of NGINX Plus.

NGINX Plus segments its upstream metrics first by group, and then by individual server. So if, for example, your reverse proxy is distributing requests to five upstream web servers, you can see at a glance whether any of those individual servers is overburdened, and also whether you have enough healthy servers in the upstream group to ensure good response times.

**Activity metrics**

The number of **active connections per upstream server** can help you verify that your reverse proxy is properly distributing work across your server group. If you are using NGINX as a load balancer, significant deviations in the number of connections handled by any one server can indicate that the server is struggling to process requests in a timely manner or that the load-balancing method (e.g., [round-robin or IP hashing][10]) you have configured is not optimal for your traffic patterns

**Error metrics**

Recall from the error metric section above that 5xx (server error) codes are a valuable metric to monitor, particularly as a share of total response codes. NGINX Plus allows you to easily extract the number of **5xx codes per upstream server**, as well as the total number of responses, to determine that particular server’s error rate.

**Availability metrics**

For another view of the health of your web servers, NGINX also makes it simple to monitor the health of your upstream groups via the total number of **servers currently available within each group**. In a large reverse proxy setup, you may not care very much about the current state of any one server, just as long as your pool of available servers is capable of handling the load. But monitoring the total number of servers that are up within each upstream group can provide a very high-level view of the aggregate health of your web servers.

**Collecting upstream metrics**

NGINX Plus upstream metrics are exposed on the internal NGINX Plus monitoring dashboard, and are also available via a JSON interface that can serve up metrics into virtually any external monitoring platform. See examples in our companion post on [collecting NGINX metrics][11].

### Conclusion ###

In this post we’ve touched on some of the most useful metrics you can monitor to keep tabs on your NGINX servers. If you are just getting started with NGINX, monitoring most or all of the metrics in the list below will provide good visibility into the health and activity levels of your web infrastructure:

- [Dropped connections][12]
- [Requests per second][13]
- [Server error rate][14]
- [Request processing time][15]

Eventually you will recognize additional, more specialized metrics that are particularly relevant to your own infrastructure and use cases. Of course, what you monitor will depend on the tools you have and the metrics available to you. See the companion post for [step-by-step instructions on metric collection][16], whether you use NGINX or NGINX Plus.

At Datadog, we have built integrations with both NGINX and NGINX Plus so that you can begin collecting and monitoring metrics from all your web servers with a minimum of setup. Learn how to monitor NGINX with Datadog [in this post][17], and get started right away with [a free trial of Datadog][18].

### Acknowledgments ###

Many thanks to the NGINX team for reviewing this article prior to publication and providing important feedback and clarifications.

----------

Source Markdown for this post is available [on GitHub][19]. Questions, corrections, additions, etc.? Please [let us know][20].

--------------------------------------------------------------------------------

via: https://www.datadoghq.com/blog/how-to-monitor-nginx/

作者：K Young
译者：[译者ID](https://github.com/译者ID)
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
