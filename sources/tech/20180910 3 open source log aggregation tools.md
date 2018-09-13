3 open source log aggregation tools
======
Log aggregation systems can help with troubleshooting and other tasks. Here are three top options.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/data_metrics_analytics_desktop_laptop.png?itok=9QXd7AUr)

How is metrics aggregation different from log aggregation? Can’t logs include metrics? Can’t log aggregation systems do the same things as metrics aggregation systems?

These are questions I hear often. I’ve also seen vendors pitching their log aggregation system as the solution to all observability problems. Log aggregation is a valuable tool, but it isn’t normally a good tool for time-series data.

A couple of valuable features in a time-series metrics aggregation system are the regular interval and the storage system customized specifically for time-series data. The regular interval allows a user to derive real mathematical results consistently. If a log aggregation system is collecting metrics in a regular interval, it can potentially work the same way. However, the storage system isn’t optimized for the types of queries that are typical in a metrics aggregation system. These queries will take more resources and time to process using storage systems found in log aggregation tools.

So, we know a log aggregation system is likely not suitable for time-series data, but what is it good for? A log aggregation system is a great place for collecting event data. These are irregular activities that are significant. An example might be access logs for a web service. These are significant because we want to know what is accessing our systems and when. Another example would be an application error condition—because it is not a normal operating condition, it might be valuable during troubleshooting.

A handful of rules for logging:

  * DO include a timestamp
  * DO format in JSON
  * DON’T log insignificant events
  * DO log all application errors
  * MAYBE log warnings
  * DO turn on logging
  * DO write messages in a human-readable form
  * DON’T log informational data in production
  * DON’T log anything a human can’t read or react to



### Cloud costs

When investigating log aggregation tools, the cloud might seem like an attractive option. However, it can come with significant costs. Logs represent a lot of data when aggregated across hundreds or thousands of hosts and applications. The ingestion, storage, and retrieval of that data are expensive in cloud-based systems.

As a point of reference from a real system, a collection of around 500 nodes with a few hundred apps results in 200GB of log data per day. There’s probably room for improvement in that system, but even reducing it by half will cost nearly $10,000 per month in many SaaS offerings. This often includes retention of only 30 days, which isn’t very long if you want to look at trending data year-over-year.

This isn’t to discourage the use of these systems, as they can be very valuable—especially for smaller organizations. The purpose is to point out that there could be significant costs, and it can be discouraging when they are realized. The rest of this article will focus on open source and commercial solutions that are self-hosted.

### Tool options

#### ELK

[ELK][1], short for Elasticsearch, Logstash, and Kibana, is the most popular open source log aggregation tool on the market. It’s used by Netflix, Facebook, Microsoft, LinkedIn, and Cisco. The three components are all developed and maintained by [Elastic][2]. [Elasticsearch][3] is essentially a NoSQL, Lucene search engine implementation. [Logstash][4] is a log pipeline system that can ingest data, transform it, and load it into a store like Elasticsearch. [Kibana][5] is a visualization layer on top of Elasticsearch.

A few years ago, Beats were introduced. Beats are data collectors. They simplify the process of shipping data to Logstash. Instead of needing to understand the proper syntax of each type of log, a user can install a Beat that will export NGINX logs or Envoy proxy logs properly so they can be used effectively within Elasticsearch.

When installing a production-level ELK stack, a few other pieces might be included, like [Kafka][6], [Redis][7], and [NGINX][8]. Also, it is common to replace Logstash with Fluentd, which we’ll discuss later. This system can be complex to operate, which in its early days led to a lot of problems and complaints. These have largely been fixed, but it’s still a complex system, so you might not want to try it if you’re a smaller operation.

That said, there are services available so you don’t have to worry about that. [Logz.io][9] will run it for you, but its list pricing is a little steep if you have a lot of data. Of course, you’re probably smaller and may not have a lot of data. If you can’t afford Logz.io, you could look at something like [AWS Elasticsearch Service][10] (ES). ES is a service Amazon Web Services (AWS) offers that makes it very easy to get Elasticsearch working quickly. It also has tooling to get all AWS logs into ES using Lambda and S3. This is a much cheaper option, but there is some management required and there are a few limitations.

Elastic, the parent company of the stack, [offers][11] a more robust product that uses the open core model, which provides additional options around analytics tools, and reporting. It can also be hosted on Google Cloud Platform or AWS. This might be the best option, as this combination of tools and hosting platforms offers a cheaper solution than most SaaS options and still provides a lot of value. This system could effectively replace or give you the capability of a [security information and event management][12] (SIEM) system.

The ELK stack also offers great visualization tools through Kibana, but it lacks an alerting function. Elastic provides alerting functionality within the paid X-Pack add-on, but there is nothing built in for the open source system. Yelp has created a solution to this problem, called [ElastAlert][13], and there are probably others. This additional piece of software is fairly robust, but it increases the complexity of an already complex system.

#### Graylog

[Graylog][14] has recently risen in popularity, but it got its start when Lennart Koopmann created it back in 2010. A company was born with the same name two years later. Despite its increasing use, it still lags far behind the ELK stack. This also means it has fewer community-developed features, but it can use the same Beats that the ELK stack uses. Graylog has gained praise in the Go community with the introduction of the Graylog Collector Sidecar written in [Go][15].

Graylog uses Elasticsearch, [MongoDB][16], and the Graylog Server under the hood. This makes it as complex to run as the ELK stack and maybe a little more. However, Graylog comes with alerting built into the open source version, as well as several other notable features like streaming, message rewriting, and geolocation.

The streaming feature allows for data to be routed to specific Streams in real time while they are being processed. With this feature, a user can see all database errors in a single Stream and web server errors in a different Stream. Alerts can even be based on these Streams as new items are added or when a threshold is exceeded. Latency is probably one of the biggest issues with log aggregation systems, and Streams eliminate that issue in Graylog. As soon as the log comes in, it can be routed to other systems through a Stream without being processed fully.

The message rewriting feature uses the open source rules engine [Drools][17]. This allows all incoming messages to be evaluated against a user-defined rules file enabling a message to be dropped (called Blacklisting), a field to be added or removed, or the message to be modified.

The coolest feature might be Graylog’s geolocation capability, which supports plotting IP addresses on a map. This is a fairly common feature and is available in Kibana as well, but it adds a lot of value—especially if you want to use this as your SIEM system. The geolocation functionality is provided in the open source version of the system.

Graylog, the company, charges for support on the open source version if you want it. It also offers an open core model for its Enterprise version that offers archiving, audit logging, and additional support. There aren’t many other options for support or hosting, so you’ll likely be on your own if you don’t use Graylog (the company).

#### Fluentd

[Fluentd][18] was developed at [Treasure Data][19], and the [CNCF][20] has adopted it as an Incubating project. It was written in C and Ruby and is recommended by [AWS][21] and [Google Cloud][22]. Fluentd has become a common replacement for Logstash in many installations. It acts as a local aggregator to collect all node logs and send them off to central storage systems. It is not a log aggregation system.

It uses a robust plugin system to provide quick and easy integrations with different data sources and data outputs. Since there are over 500 plugins available, most of your use cases should be covered. If they aren’t, this sounds like an opportunity to contribute back to the open source community.

Fluentd is a common choice in Kubernetes environments due to its low memory requirements (just tens of megabytes) and its high throughput. In an environment like [Kubernetes][23], where each pod has a Fluentd sidecar, memory consumption will increase linearly with each new pod created. Using Fluentd will drastically reduce your system utilization. This is becoming a common problem with tools developed in Java that are intended to run one per node where the memory overhead hasn’t been a major issue.


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/open-source-log-aggregation-tools

作者：[Dan Barker][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/barkerd427
[1]: https://www.elastic.co/webinars/introduction-elk-stack
[2]: https://www.elastic.co/
[3]: https://www.elastic.co/products/elasticsearch
[4]: https://www.elastic.co/products/logstash
[5]: https://www.elastic.co/products/kibana
[6]: http://kafka.apache.org/
[7]: https://redis.io/
[8]: https://www.nginx.com/
[9]: https://logz.io/
[10]: https://aws.amazon.com/elasticsearch-service/
[11]: https://www.elastic.co/cloud
[12]: https://en.wikipedia.org/wiki/Security_information_and_event_management
[13]: https://github.com/Yelp/elastalert
[14]: https://www.graylog.org/
[15]: https://opensource.com/tags/go
[16]: https://www.mongodb.com/
[17]: https://www.drools.org/
[18]: https://www.fluentd.org/
[19]: https://www.treasuredata.com/
[20]: https://www.cncf.io/
[21]: https://aws.amazon.com/blogs/aws/all-your-data-fluentd/
[22]: https://cloud.google.com/logging/docs/agent/
[23]: https://opensource.com/resources/what-is-kubernetes
