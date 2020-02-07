[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (OpenCensus to monitor your Kubernetes cluster)
[#]: via: (https://opensource.com/article/20/2/kubernetes-opencensus)
[#]: author: (Yuri Grinshteyn https://opensource.com/users/yuri-grinshteyn)

OpenCensus to monitor your Kubernetes cluster
======
Learn how to use OpenCensus, a set of open source libraries for
observability instrumentation and metrics tracing.
![Ship captain sailing the Kubernetes seas][1]

In my last article in this series, I [introduced monitoring with Prometheus][2], the leading open source metric instrumentation, collection, and storage toolkit. While Prometheus has become the de facto standard for monitoring Kubernetes for many users, there may be reasons why you might choose another approach for metric telemetry.

One reason is that using Prometheus introduces another component in your cluster that needs to be maintained and updated and will require additional management to ensure data persistence over the long term. Another reason is that Prometheus collects an incredibly large set of metrics right out of the box, and this could become cost-prohibitive in situations where metric volume is an input into your overall observability costs.

This article will introduce you to [OpenCensus][3], a set of open source libraries for observability instrumentation. OpenCensus is the currently recommended library to use for instrumenting services to collect traces and metrics. The OpenTracing and OpenCensus projects have been merged into [OpenTelemetry][4], which will become the recommended library.

While OpenCensus enables both metrics and distributed tracing, this article focuses on metrics by:

  * Describing the OpenCensus approach to instrumentation and its data model
  * Walking through a tutorial to explain how to instrument an application, deploy a sample application, and review the metrics that you can create with OpenCensus



I will revisit tracing in a future article.

### OpenCensus basics

OpenCensus' implementation depends on three core components:

  * The [instrumentation][5] to create metrics and record data points (varies by language)
  * An [exporter][6] to send metric data to a storage backend (varies by language)
  * The backend to store metrics and enable querying metric data (varies by database)



To use OpenCensus in your application to record custom metrics, you will need to understand these elements for your particular programming languages and infrastructure.

#### Instrumentation

To understand how to instrument your application, you need first to understand OpenCensus' primitives, which are **measurements**, **measures**, **views**, and **aggregations**.

  * **Measurement:** A measurement is the most fundamental entity; it's the single data point collected that represents a value at a point in time. For example, for a latency metric measured in milliseconds (ms), a measurement of 100 could represent an event with 100ms latency.
  * **Measure:** A measure represents a metric to be recorded. For example, you could use a "latency" measure to record HTTP response latency from your service. A measure is made up of a name, a description, and the units that the metric uses. For example, to measure latency, you might specify:
    * Name: response_latency
    * Description: latency of server response in ms
    * Unit: ms
  * **View:** A view is the combination of a measure, an aggregation, and optional tags. Views are the mechanism you'll use to connect to an exporter to send the captured values to a storage backend. A view includes:
    * Name
    * Description
    * The measure that will produce measurements for this collection
    * TagKeys, if you're using tags
  * **Aggregations:** Each view is also required to specify an aggregation; that is, how the view will treat multiple measures. Aggregations can be one of the following:
    * Count: The count of the number of measurement points in the view
    * Distribution: Histogram distribution of the points in the view
    * Sum: A sum of the values of the measurement points
    * LastValue: Only the last recorded value in the measurement



You can also refer to OpenCensus' [source][7] for additional information about the primitives.

#### Exporters

Once you have written the instrumentation to create measures, capture measurements, and aggregate them into views, you need an exporter to send your recorded metric data to your chosen storage backend. Unlike Prometheus, where you expose a dedicated metric endpoint to be scraped, OpenCensus works on a push model—the exporter pushes your collected data to the specified backend. You need to [choose the exporter][6] based on:

  * The language that your application and instrumentation are written in
  * Available support for stats (metrics)
  * The available backend options



Using an exporter requires instantiating it in your code, registering it, and then registering your view to have the exporter send the collected data to the backend.

### Leverage metrics in OpenCensus

Now that you understand the terminology for how OpenCensus works to collect and export metrics, the next thing to learn is how metrics in OpenCensus function. Unlike [Prometheus][8], where you have to define the metric kind upfront, OpenCensus simply requires you to _collect_ the measurements and then _aggregate_ them in the _view_ before sending them to the _exporter_. The measurements support integer and float values. From there, you can use create histograms using the _distribution_ aggregation, add up the number of samples using the _count_ aggregation, or add up the collected values using the _sum_ aggregation.

Now you have a basic understanding of what OpenCensus is, how it works, and the kinds of data it can collect and store. Download your favorite tooling (or use [my tutorial here][9] and a [quickstart lab][10]) and take OpenCensus for a spin.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/kubernetes-opencensus

作者：[Yuri Grinshteyn][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/yuri-grinshteyn
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/ship_captain_devops_kubernetes_steer.png?itok=LAHfIpek (Ship captain sailing the Kubernetes seas)
[2]: https://opensource.com/article/19/11/introduction-monitoring-prometheus
[3]: https://opencensus.io/
[4]: https://opentelemetry.io/
[5]: https://github.com/census-instrumentation
[6]: https://opencensus.io/exporters/supported-exporters/
[7]: https://opencensus.io/stats/
[8]: https://prometheus.io/docs/concepts/metric_types/
[9]: https://github.com/yuriatgoogle/stack-doctor
[10]: https://google.qwiklabs.com/
