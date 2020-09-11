[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Introduction to open source observability on Kubernetes)
[#]: via: (https://opensource.com/article/19/10/open-source-observability-kubernetes)
[#]: author: (Yuri Grinshteyn https://opensource.com/users/yuri-grinshteyn)

Introduction to open source observability on Kubernetes
======
In the first article in this series, learn the signals, mechanisms,
tools, and platforms you can use to observe services running on
Kubernetes.
![Looking back with binoculars][1]

With the advent of DevOps, engineering teams are taking on more and more ownership of the reliability of their services. While some chafe at the increased operational burden, others welcome the opportunity to treat service reliability as a key feature, invest in the necessary capabilities to measure and improve reliability, and deliver the best possible customer experiences.

This change is measured explicitly in the [2019 Accelerate State of DevOps Report][2]. One of its most interesting conclusions (as written in the summary) is:

> "Delivering software quickly, **reliably** _[emphasis mine]_, and safely is at the heart of technology transformation and organizational performance. We see continued evidence that software speed, stability, and **availability** _[emphasis mine]_ contribute to organizational performance (including profitability, productivity, and customer satisfaction). Our highest performers are twice as likely to meet or exceed their organizational performance goals."

The full [report][3] says:

> "**Low performers use more proprietary software than high and elite performers**: The cost to maintain and support proprietary software can be prohibitive, prompting high and elite performers to use open source solutions. This is in line with results from previous reports. In fact, the 2018 Accelerate State of DevOps Report found that elite performers were 1.75 times more likely to make extensive use of open source components, libraries, and platforms."

This is a strong testament to the value of open source as a general accelerator of performance. Combining these two conclusions leads to the rather obvious thesis for this series:

> Reliability is a critical feature, observability is a necessary component of reliability, and open source tooling is at least _A_ right approach, if not _THE_ right approach.

This article, the first in a series, will introduce the types of signals engineers typically rely on and the mechanisms, tools, and platforms that you can use to instrument services running on Kubernetes to emit these signals, ingest and store them, and use and interpret them.

From there, the series will continue with hands-on tutorials, where I will walk through getting started with each of the tools and technologies. By the end, you should be well-equipped to start improving the observability of your own systems!

### What is observability?

While observability as a general [concept in control theory][4] has been around since at least 1960, its applicability to digital systems and services is rather new and in some ways an evolution of how these systems have been monitored for the last two decades. You are likely familiar with the necessity of monitoring services to ensure you know about issues before your users are impacted. You are also likely familiar with the idea of using metric data to better understand the health and state of a system, especially in the context of troubleshooting during an incident or debugging.

The key differentiation between monitoring and observability is that observability is an inherent property of a system or service, rather than something someone does to the system, which is what monitoring fundamentally is. [Cindy Sridharan][5], author of a free [e-book][6] on observability in distributed systems, does a great job of explaining the difference in an excellent [Medium article][7].

It is important to distinguish between these two terms because observability, as a property of the service you build, is your responsibility. As a service developer and owner, you have full control over the signals your system emits, how and where those signals are ingested and stored, and how they're utilized. This is in contrast to "monitoring," which may be done by others (and by you) to measure the availability and performance of your service and generate alerts to let you know that service reliability has degraded.

### Signals

Now that you understand the idea of observability as a property of a system that you control and that is explicitly manifested as the signals you instruct your system to emit, it's important to understand and describe the kinds of signals generally considered in this context.

#### What are metrics?

A metric is a fundamental type of signal that can be emitted by a service or the infrastructure it's running on. At its most basic, it is the combination of:

  1. Some identifier, hopefully descriptive, that indicates what the metric represents
  2. A series of data points, each of which contains two elements:
a. The timestamp at which the data point was generated (or ingested)
b. A numeric value representing the state of the thing you're measuring at that time



Time-series metrics have been and remain the key data structure used in monitoring and observability practice and are the primary way that the state and health of a system are represented over time. They are also the primary mechanism for alerting, but that practice and others (like incident management, on-call, and postmortems) are outside the scope here. For now, the focus is on how to instrument systems to emit metrics, how to store them, and how to use them for charts and dashboards to help you visualize the current and historical state of your system.

Metrics are used for two primary purposes: health and insight.

Understanding the health and state of your infrastructure, platform, and service is essential to keeping them available to users. Generally, these are emitted by the various components chosen to build services, and it's just a matter of setting up the right collection and storage infrastructure to be able to use them. Metrics from the simple (node CPU utilization) to the esoteric (garbage collection statistics) fall into this category.

Metrics are also essential to understanding what is happening in the system to avoid interruptions to your services. From this perspective, a service can emit custom telemetry that precisely describes specific aspects of how the service is functioning and performing. This will require you to instrument the code itself, usually by including specific libraries, and specify an export destination.

#### What are logs?

Unlike metrics that represent numeric values that change over time, logs represent discrete events. Log entries contain both the log payload—the message emitted by a component of the service or the code—and often metadata, such as the timestamp, label, tag, or other identifiers. Therefore, this is by far the largest volume of data you need to store, and you should carefully consider your log ingestion and storage strategies as you look to take on increasing user traffic.

#### What are traces?

Distributed tracing is a relatively new addition to the observability toolkit and is specifically relevant to microservice architectures to allow you to understand latency and how various backend service calls contribute to it. Ted Young published an [excellent article on the concept][8] that includes its origins with Google's [Dapper paper][9] and subsequent evolution. This series will be specifically concerned with the various implementations available.

### Instrumentation

Once you identify the signals you want to emit, store, and analyze, you need to instruct your system to create the signals and build a mechanism to store and analyze them. Instrumentation refers to those parts of your code that are used to generate metrics, logs, and traces. In this series, we'll discuss open source instrumentation options and introduce the basics of their use through hands-on tutorials.

### Observability on Kubernetes

Kubernetes is the dominant platform today for deploying and maintaining containers. As it rose to the top of the industry's consciousness, so did new technologies to provide effective observability tooling around it. Here is a short list of these essential technologies; they will be covered in greater detail in future articles in this series.

#### Metrics

Once you select your preferred approach for instrumenting your service with metrics, the next decision is where to store those metrics and what set of services will support your effort to monitor your environment.

##### Prometheus

[Prometheus][10] is the best place to start when looking to monitor both your Kubernetes infrastructure and the services running in the cluster. It provides everything you'll need, including client instrumentation libraries, the [storage backend][11], a visualization UI, and an alerting framework. Running Prometheus also provides a wealth of infrastructure metrics right out of the box. It further provides [integrations][12] with third-party providers for storage, although the data exchange is not bi-directional in every case, so be sure to read the documentation if you want to store metric data in multiple locations.

Later in this series, I will walk through setting up Prometheus in a cluster for basic infrastructure monitoring and adding custom telemetry to an application using the Prometheus client libraries.

##### Graphite

[Graphite][13] grew out of an in-house development effort at Orbitz and is now positioned as an enterprise-ready monitoring tool. It provides metrics storage and retrieval mechanisms, but no instrumentation capabilities. Therefore, you will still need to implement Prometheus or OpenCensus instrumentation to collect metrics. Later in this series, I will walk through setting up Graphite and sending metrics to it.

##### InfluxDB

[InfluxDB][14] is another open source database purpose-built for storing and retrieving time-series metrics. Unlike Graphite, InfluxDB is supported by a company called InfluxData, which provides both the InfluxDB software and a cloud-hosted version called InfluxDB Cloud. Later in this series, I will walk through setting up InfluxDB in a cluster and sending metrics to it.

##### OpenTSDB

[OpenTSDB][15] is also an open source purpose-built time-series database. One of its advantages is the ability to use [HBase][16] as the storage layer, which allows integration with a cloud managed service like Google's Cloud Bigtable. Google has published a [reference guide][17] on setting up OpenTSDB to monitor your Kubernetes cluster (assuming it's running in Google Kubernetes Engine, or GKE). Since it's a great introduction, I recommend following Google's tutorial if you're interested in learning more about OpenTSDB.

##### OpenCensus

[OpenCensus][18] is the open source version of the [Census library][19] developed at Google. It provides both metric and tracing instrumentation capabilities and supports a number of backends to [export][20] the metrics to—including Prometheus! Note that OpenCensus does not monitor your infrastructure, and you will still need to determine the best approach if you choose to use OpenCensus for custom metric telemetry.

We'll revisit this library later in this series, and I will walk through creating metrics in a service and exporting them to a backend.

#### Logging for observability

If metrics provide "what" is happening, logging tells part of the story of "why." Here are some common options for consistently gathering and analyzing logs.

##### Collecting with fluentd

In the Kubernetes ecosystem, [fluentd][21] is the de-facto open source standard for collecting logs emitted in the cluster and forwarding them to a specified backend. You can use config maps to modify fluentd's behavior, and later in the series, I'll walk through deploying it in a cluster and modifying the associated config map to parse unstructured logs and convert them to structured for better and easier analysis. In the meantime, you can read my post "[Customizing Kubernetes logging (Part 1)][22]" on how to do that on GKE.

##### Storing and analyzing with ELK

The most common storage mechanism for logs is provided by [Elastic][23] in the form of the "ELK" stack. As Elastic says:

> "'ELK' is the acronym for three open source projects: Elasticsearch, Logstash, and Kibana. Elasticsearch is a search and analytics engine. Logstash is a server‑side data processing pipeline that ingests data from multiple sources simultaneously, transforms it, and then sends it to a 'stash' like Elasticsearch. Kibana lets users visualize data with charts and graphs in Elasticsearch."

Later in the series, I'll walk through setting up Elasticsearch, Kibana, and Logstash in
a cluster to store and analyze logs being collected by fluentd.

#### Distributed traces and observability

When asking "why" in analyzing service issues, logs can only provide the information that applications are designed to share with it. The way to go even deeper is to gather traces. As the [OpenTracing initiative][24] says:

> "Distributed tracing, also called distributed request tracing, is a method used to profile and monitor applications, especially those built using a microservices architecture. Distributed tracing helps pinpoint where failures occur and what causes poor performance."

##### Istio

The [Istio][25] open source service mesh provides multiple benefits for microservice architectures, including traffic control, security, and observability capabilities. It does not combine multiple spans into a single trace to assemble a full picture of what happens when a user call traverses a distributed system, but it can nevertheless be useful as an easy first step toward distributed tracing. It also provides other observability benefits—it's the easiest way to get ["golden signal"][26] metrics for each service, and it also adds logging for each request, which can be very useful for calculating error rates. You can read my post on [using it with Google's Stackdriver][27]. I'll revisit it in this series and show how to install it in a cluster and configure it to export observability data to a backend.

##### OpenCensus

I described [OpenCensus][28] in the Metrics section above, and that's one of the main reasons for choosing it for distributed tracing: Using a single library for both metrics and traces is a great option to reduce your instrumentation work—with the caveat that you must be working in a language that supports both the traces and stats exporters. I'll come back to OpenCensus and show how to get started instrumenting code for distributed tracing. Note that OpenCensus provides only the instrumentation library, and you'll still need to use a storage and visualization layer like Zipkin, Jaeger, Stackdriver (on GCP), or X-Ray (on AWS).

##### Zipkin

[Zipkin][29] is a full, distributed tracing solution that includes instrumentation, storage, and visualization. It's a tried and true set of tools that's been around for years and has a strong user and developer community. It can also be used as a backend for other instrumentation options like OpenCensus. In a future tutorial, I'll show how to set up the Zipkin server and instrument your code.

##### Jaeger

[Jaeger][30] is another open source tracing solution that includes all the components you'll need. It's a newer project that's being incubated at the Cloud Native Computing Foundation (CNCF). Whether you choose to use Zipkin or Jaeger may ultimately depend on your experience with them and their support for the language you're writing your service in. In this series, I'll walk through setting up Jaeger and instrumenting code for tracing.

### Visualizing observability data

The final piece of the toolkit for using metrics is the visualization layer. There are basically two options here: the "native" visualization that your persistence layers enable (e.g., the Prometheus UI or Flux with InfluxDB) or a purpose-built visualization tool.

[Grafana][31] is currently the de facto standard for open source visualization. I'll walk through setting it up and using it to visualize data from various backends later in this series.

### Looking ahead

Observability on Kubernetes has many parts and many options for each type of need. Metric, logging, and tracing instrumentation provide the bedrock of information needed to make decisions about services. Instrumenting, storing, and visualizing data are also essential. Future articles in this series will dive into all of these options with hands-on tutorials for each.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/open-source-observability-kubernetes

作者：[Yuri Grinshteyn][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/yuri-grinshteyn
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/look-binoculars-sight-see-review.png?itok=NOw2cm39 (Looking back with binoculars)
[2]: https://cloud.google.com/blog/products/devops-sre/the-2019-accelerate-state-of-devops-elite-performance-productivity-and-scaling
[3]: https://services.google.com/fh/files/misc/state-of-devops-2019.pdf
[4]: https://en.wikipedia.org/wiki/Observability
[5]: https://twitter.com/copyconstruct
[6]: https://t.co/0gOgZp88Jn?amp=1
[7]: https://medium.com/@copyconstruct/monitoring-and-observability-8417d1952e1c
[8]: https://opensource.com/article/18/5/distributed-tracing
[9]: https://research.google.com/pubs/pub36356.html
[10]: https://prometheus.io/
[11]: https://prometheus.io/docs/prometheus/latest/storage/
[12]: https://prometheus.io/docs/operating/integrations/#remote-endpoints-and-storage
[13]: https://graphiteapp.org/
[14]: https://www.influxdata.com/get-influxdb/
[15]: http://opentsdb.net/
[16]: https://hbase.apache.org/
[17]: https://cloud.google.com/solutions/opentsdb-cloud-platform
[18]: https://opencensus.io/
[19]: https://opensource.googleblog.com/2018/03/how-google-uses-opencensus-internally.html
[20]: https://opencensus.io/exporters/#exporters
[21]: https://www.fluentd.org/
[22]: https://medium.com/google-cloud/customizing-kubernetes-logging-part-1-a1e5791dcda8
[23]: https://www.elastic.co/
[24]: https://opentracing.io/docs/overview/what-is-tracing
[25]: http://istio.io/
[26]: https://landing.google.com/sre/sre-book/chapters/monitoring-distributed-systems/
[27]: https://medium.com/google-cloud/istio-and-stackdriver-59d157282258
[28]: http://opencensus.io/
[29]: https://zipkin.io/
[30]: https://www.jaegertracing.io/
[31]: https://grafana.com/
