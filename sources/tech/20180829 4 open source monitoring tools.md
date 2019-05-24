4 open source monitoring tools
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/mistake_bug_fix_find_error.png?itok=PZaz3dga)

Isn’t monitoring just monitoring? Doesn’t it include logging, visualization, and time-series data?

The terminology around monitoring has caused a lot of confusion over the years and has led to some poor tools that tout the ability to do everything in one format. Observability proponents recognize there are many levels for observing a system. Metrics aggregation is primarily time-series data, and that’s what we’ll discuss in this article.

### Features of time-series data

#### Counters

A counter is a metric that represents a numeric value that will only increase. (In other words, a counter should never decrease.) Counters accumulate values and present the current total when requested. These are commonly used for things like the total number of web requests, number of errors, number of visitors, etc. This is analogous to the person with a counter device standing at the entrance to an event counting all the people entering. There is generally no option to decrement the counter without resetting it.

#### Gauges

A gauge is similar to a counter in that it represents a single numeric value, but it can also decrease. It is essentially a representation of some value at a point in time. A thermometer is a good example of a gauge: It moves up and down with the temperature and offers a point-in-time reading. Other uses include CPU usage, memory usage, network usage, and number of threads.

#### Quantiles

Quantiles aren’t a type of metric, but they’re germane to the next two sections: histograms and summaries. Let’s clarify our understanding of quantiles with an example:

A percentile is a type of quantile. Percentiles are something we see regularly, and they should help us understand the general concept more easily. A percentile has 100 “buckets” of values. We often see them related to testing or performance and generally stated as someone scoring, for example, within the 85th percentile or some other value. This means the person scoring within that percentile had a real value that fell within the bucket between the 85th and 86th percentile. This person also scored in the top 15% of all students. We don’t know the scores in the bucket based off this metric, but that can be derived based on the sum of all scores in the bucket divided by the count of those scores.

Quantiles allow us to understand our data better than using a mean or some other statistical function that doesn’t take into account outliers and uneven distributions.

#### Histograms

A histogram is a little more complicated than a counter or a gauge. It is a sample of observations. It consists of a counter, which counts all the observations, and what is essentially a gauge that sums the values of the observations. It uses “buckets” or groupings to segment the values in order to bound the datasets in a productive way. This is commonly seen with quantiles related to request service-level agreements (SLAs). Let’s say we want to ensure that 95% of our requests are below 500ms. We could use a bucket with an upper bound of 0.5s to collect all values that fall under 500ms. We would then be able to determine how many of the total requests have fallen into that bucket. We can also determine how far we are from our SLA, but this can be difficult to do (as is explained more in the [Prometheus documentation][1]).

Histograms are aggregate metrics that are accumulated from multiple instances into a central server. This provides an opportunity to understand the system as a whole rather than on a node-by-node basis.

#### Summaries

Summaries are similar to histograms in that they are a sample of observations, but the aggregation occurs on the server side. Also, the estimate of the quantile is more accurate than in a histogram. A summary uses a sliding time window, so it serves a slightly different case than a histogram but is generally used for the same types of metrics. I normally use a histogram unless I need a very accurate measure of the quantile.

### Push/pull

No article can be written about metrics aggregation tools without addressing the push vs. pull debate.

The debate centers around whether it is better for your metrics aggregation system to have data pushed to it or to have your metrics aggregation system reach out and gather the data by scraping an endpoint. Multiple articles discuss this (like [this one][2] and [this one][3]). My perspective is that it mostly doesn’t matter. Additional research is left to the reader’s discretion.

### Tool options

There are many tools available, both open source and commercial. We will focus on open source tools, but some of these have an open core model with a paid component.

Some of these tools feature additional components of observability—principally alerting and visualizations. These will be covered in this section as additional features and won’t be covered in subsequent articles.

#### Prometheus

This is the most well-recognized time-series monitoring solution for cloud-native applications. It is hosted within the [Cloud Native Computing Foundation][4] (CNCF), but it was created by Matt Proud and Julius Volz and sponsored by [SoundCloud][5], with external contributors coming in early to help develop it. Brian Brazil of [Robust Perception][6] has built a business of helping companies adopt Prometheus. He also has an excellent [blog][7] on his website. The [Prometheus documentation][8] is extensive and provides a lot of detail for understanding and using the tool.

[Prometheus][9] is a pull-based system that uses local configuration to describe the endpoints to collect from and the interval desired for collection. Each endpoint has a client collecting the data and updating that representation upon each request (or however the client is configured). This data is collected and saved in a highly efficient storage engine on local disk. The storage system uses an append-only file per metric. This storage isn’t lossy, which means the fidelity of data from a year ago is as high as the data you are collecting today. However, you may not want to keep that much data locally. Fortunately, there is an option for remote storage for long-term retention and analysis.

Prometheus includes an advanced expression language for selecting and presenting data called [PromQL][10]. This data can be displayed graphically, tabularly, or used by external systems through a REST API. The expression language allows a user to create regressions, analyze real-time data, or trend historical data. Labels are also a great tool for filtering and querying data. Labels can be associated with each metric name.

Prometheus also offers a federation model, which encourages more localized control by allowing teams to have their own [Prometheis][11] while central teams can also have their own. The central systems could scrape the same endpoints as the local Prometheis, but they can also scrape the local Prometheis to get the aggregated data that the local instances are collecting. This reduces overhead on the endpoints. This federation model also allows local instances to collect data from each other.

Prometheus comes with [AlertManager][12] to handle alerts. This system allows for aggregation of alerts as well as more complex flows to limit when an alert is sent.

Let’s say 10 nodes suddenly go down at the same time a switch goes down. You probably don’t need to send an alert about the 10 nodes, as everyone who receives them will likely be unable to do anything until the switch is fixed. With the AlertManager, it’s possible to send an alert only to the networking team for the switch and include additional information about other systems that might be affected. It’s also possible to send an email (rather than a page) to the systems team so they know those nodes are down and they don’t need to respond unless the systems don’t come up after the switch is repaired. If that occurs, then AlertManager will reactivate those alerts that were suppressed by the switch alert.

#### Graphite

[Graphite][13] has been around for a long time, and James Turnbull's recent book [_The Art of Monitoring_][14] covers Graphite in detail. Graphite has become ubiquitous in the industry, with many large companies using it at scale.

Graphite is a push-based system that receives data from applications by having the application push the data into Graphite’s Carbon component. Carbon stores this data in the Whisper database, and that database and Carbon are read by the Graphite web component that allows a user to graph their data in a browser or pull it through an API. A really cool feature is the ability to export these graphs as images or data files to easily embed them in other applications.

Whisper is a fixed-size database that provides fast, reliable storage of numeric data over time. It is a lossy database, which means the resolution of your metrics will degrade over time. It will provide high-fidelity metrics for the most recent collections and gradually reduce that fidelity over time.

Graphite also uses dot-separated naming, which implies dimensionality. This dimensionality allows for some creative aggregation of metrics and relationships between metrics. This enables aggregation of services across different versions or data centers and (getting more specific) a single version running in one data center in a specific Kubernetes cluster. Granular-level comparisons can also be made to determine if a particular cluster is underperforming.

Another interesting feature of Graphite is the ability to store arbitrary events that should be related to time-series metrics. In particular, application or infrastructure deployments can be added and tracked within Graphite. This allows the operator or developer troubleshooting an issue to have more context about what has happened in the environment related to the anomalous behavior being investigated.

Graphite also has a substantial [list of functions][15] that can be applied to metrics series. However, it lacks a powerful query language, which some other tools include. It also lacks any alerting functionality or built-in alerting system.

#### InfluxDB

[InfluxDB][16] is a relatively new entrant, newer than Prometheus. It uses an open core model, which means scaling and clustering cost extra. InfluxDB is part of the larger [TICK stack][17] (of Telegraf, InfluxDB, Chronograf, and Kapacitor), so we will include all those components’ features in this analysis.

InfluxDB uses a key-value pair system called tags to add dimensionality to metrics, similar to Prometheus and Graphite. The results are similar to what we discussed previously for the other systems. The metric data can be of type **float64** , **int64** , **bool** , and **string** with nanosecond resolution. This is a broader range than most other tools in this space. In fact, the TICK stack is more of an event-aggregation platform than a native time-series metrics-aggregation system.

InfluxDB uses a system similar to a log-structured merge tree for storage. It is called a time-structured merge tree in this context. It uses a write-ahead log and a collection of read-only data files, which are similar to Sorted Strings Tables but have series data rather than pure log data. These files are sharded per block of time. To learn more, check out [this great resource][18] on the InfluxData website.

The architecture of the TICK stack is different depending on if it’s the open source or commercial version. The open source InfluxDB system is self-contained within a single host, while the commercial version is inherently distributed. This is true of the other central components as well. In the open source version, everything runs on a single host. No data or configuration is stored on external systems, so it is fairly easy to manage, but it isn’t as robust as the commercial version.

InfluxDB includes a SQL-like language called InfluxQL for querying data from the databases. The primary means for querying data is the HTTP API. The query language doesn’t have as many built-in helper functions as Prometheus, but those familiar with SQL will likely feel more comfortable with the language.

The TICK stack also includes an alerting system. This system can do some mild aggregation but doesn’t have the full capabilities of Prometheus’ AlertManager. It does offer many integrations, though. Also, to reduce load on InfluxDB, continuous queries can be scheduled to store results of queries that Kapacitor will pick up for alerting.

#### OpenTSDB

[OpenTSDB][19] is an open source time-series database, as its name implies. It’s unique in this collection of tools in that it stores its metrics in Hadoop. This means it is inherently scalable. If you already have a Hadoop cluster, this might be a good option for metrics you want to store over the long term. If you don’t have a Hadoop cluster, the operational overhead might be too large of a burden for you to bear. However, OpenTSDB now supports Google’s [Bigtable][20] as a backend, which is a cloud service you don’t have to operate.

OpenTSDB shares a lot of features with the other systems. It uses a key-value pairing system it calls tags for identifying metrics and adding dimensionality. It has a query language, but it is more limited than Prometheus’ PromQL. It does, however, have several built-in functions that help with learning and usage. The API is the main entry point for querying, similar to InfluxDB. This system also stores all data forever, unless there’s a time-to-live set in HBase, so you don't have to worry about fidelity degradation.

OpenTSDB doesn’t offer an alerting capability, which will make it harder to integrate with your incident response process. This type of system might be great for long-term Prometheus data storage and for performing more historical analytics to reveal systemic issues, rather than as a tool to quickly identify and respond to acute concerns.

### OpenMetrics standard

[OpenMetrics][21] is a working group seeking to establish a standard exposition format for metrics data. It is influenced by Prometheus. If this initiative is successful, we’ll have an industry-wide abstraction that would allow us to switch between tools and providers with ease. Leading companies like [Datadog][22] have already started offering tools that can consume the Prometheus exposition format, which will be easy to convert to the OpenMetrics standard once it’s released.

It’s also important to note that the contributors to this project include Google and InfluxData (among others). This likely means InfluxDB will eventually adopt the OpenMetrics standard. This may also mean that one of the three largest cloud providers will adopt it if Google’s involvement is an indicator. Of course, the exposition format is already being used in the Google-created [Kubernetes][23] project. [SolarWinds][24], [Robust Perception][6], and [SpaceNet][25] are also involved.


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/8/open-source-monitoring-tools

作者：[Dan barker][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/barkerd427
[1]: https://prometheus.io/docs/practices/histograms/
[2]: https://thenewstack.io/exploring-prometheus-use-cases-brian-brazil/
[3]: https://prometheus.io/blog/2016/07/23/pull-does-not-scale-or-does-it/
[4]: https://www.cncf.io/
[5]: https://soundcloud.com/
[6]: https://www.robustperception.io/
[7]: https://www.robustperception.io/blog/
[8]: https://prometheus.io/docs/
[9]: https://prometheus.io/
[10]: https://prometheus.io/docs/prometheus/latest/querying/basics/
[11]: https://prometheus.io/docs/introduction/faq/#what-is-the-plural-of-prometheus
[12]: https://prometheus.io/docs/alerting/alertmanager/
[13]: https://graphiteapp.org/
[14]: https://www.artofmonitoring.com/
[15]: http://graphite.readthedocs.io/en/latest/functions.html
[16]: https://www.influxdata.com/
[17]: https://www.thoughtworks.com/radar/platforms/tick-stack
[18]: https://docs.influxdata.com/influxdb/v1.5/concepts/storage_engine/
[19]: http://opentsdb.net/
[20]: https://cloud.google.com/bigtable/
[21]: https://github.com/RichiH/OpenMetrics
[22]: https://www.datadoghq.com/blog/monitor-prometheus-metrics/
[23]: https://opensource.com/resources/what-is-kubernetes
[24]: https://www.solarwinds.com/
[25]: https://spacenetchallenge.github.io/
