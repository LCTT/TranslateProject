[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Achieve high-scale application monitoring with Prometheus)
[#]: via: (https://opensource.com/article/19/10/application-monitoring-prometheus)
[#]: author: (Paul Brebner https://opensource.com/users/paul-brebner)

Achieve high-scale application monitoring with Prometheus
======
Prometheus' prowess as a monitoring system and its ability to achieve
high-scalability make it a strong choice for monitoring applications and
servers.
![Tall building with windows][1]

[Prometheus][2] is an increasingly popular—for good reason—open source tool that provides monitoring and alerting for applications and servers. Prometheus' great strength is in monitoring server-side metrics, which it stores as [time-series data][3]. While Prometheus doesn't lend itself to application performance management, active control, or user experience monitoring (although a GitHub extension does make user browser metrics available to Prometheus), its prowess as a monitoring system and ability to achieve high-scalability through a [federation of servers][4] make Prometheus a strong choice for a wide variety of use cases.

In this article, we'll take a closer look at Prometheus' architecture and functionality and then examine a detailed instance of the tool in action.

### Prometheus architecture and components

Prometheus consists of the Prometheus server (handling service discovery, metrics retrieval and storage, and time-series data analysis through the PromQL query language), a data model for metrics, a graphing GUI, and native support for [Grafana][5]. There is also an optional alert manager that allows users to define alerts via the query language and an optional push gateway for short-term application monitoring. These components are situated as shown in the following diagram.

![Promethius architecture][6]

Prometheus can automatically capture standard metrics by using agents to execute general-purpose code in the application environment. It can also capture custom metrics through instrumentation, placing custom code within the source code of the monitored application. Prometheus officially supports [client libraries][7] for Go, Python, Ruby, and Java/Scala and also enables users to write their own libraries. Additionally, many unofficial libraries for other languages are available.

Developers can also utilize third-party [exporters][8] to automatically activate instrumentation for many popular software solutions they might be using. For example, users of JVM-based applications like open source [Apache Kafka][9] and [Apache Cassandra][10] can easily collect metrics by leveraging the existing [JMX exporter][11]. In other cases, an exporter won't be needed because the application will [expose metrics][12] that are already in the Prometheus format. Those on Cassandra might also find Instaclustr's freely available [Cassandra Exporter for Prometheus][13] to be helpful, as it integrates Cassandra metrics from a self-managed cluster into Prometheus application monitoring.

Also important: Developers can leverage an available [node exporter][14] to monitor kernel metrics and host hardware. Prometheus offers a [Java client][15] as well, with a number of features that can be registered either piecemeal or at once through a single **DefaultExports.initialize();** command—including memory pools, garbage collection, JMX, classloading, and thread counts.

### Prometheus data modeling and metrics

Prometheus provides four metric types:

  * **Counter:** Counts incrementing values; a restart can return these values to zero
  * **Gauge:** Tracks metrics that can go up and down
  * **Histogram:** Observes data according to specified response sizes or durations and counts the sums of observed values along with counts in configurable buckets
  * **Summary:** Counts observed data similar to a histogram and offers configurable quantiles that are calculated over a sliding time window



Prometheus time-series data metrics each include a string name, which follows a naming convention to include the name of the monitored data subject, the logical type, and the units of measure used. Each metric includes streams of 64-bit float value that are timestamped down to the millisecond, and a set of key:value pairs labeling the dimensions it measures. Prometheus automatically adds **Job** and **Instance** labels to each metric to keep track of the configured job name of the data target and the **&lt;host&gt;:&lt;port&gt;** piece of the scraped target URL, respectively.

### Prometheus example: the Anomalia Machina anomaly detection experiment

Before moving into the example, download and begin using open source Prometheus by following this [getting started][16] guide.

To demonstrate how to put Prometheus into action and perform application monitoring at a high scale, let's take a look at a recent [experimental Anomalia Machina project][17] we completed at Instaclustr. This project—just a test case, not a commercially available solution—leverages Kafka and Cassandra in an application deployed by Kubernetes, which performs anomaly detection on streaming data. (Such detection is critical to use cases including IoT applications and digital ad fraud, among other areas.) The experimental application relies heavily on Prometheus to collect application metrics across distributed instances and make them readily available to view.

This diagram displays the experiment's architecture:

![Anomalia Machina Architecture][18]

Our goals in utilizing Prometheus included monitoring the application's more generic metrics, such as throughput, as well as the response times delivered by the Kafka load generator (the Kafka producer), the Kafka consumer, and the Cassandra client tasked with detecting any anomalies in the data. Prometheus monitors the system's hardware metrics as well, such as the CPU for each AWS EC2 instance running the application. The project also counts on Prometheus to monitor application-specific metrics such as the total number of rows each Cassandra read returns and, crucially, the number of anomalies it detects. All of this monitoring is centralized for simplicity.

In practice, this means forming a test pipeline with producer, consumer, and detector methods, as well as the following three metrics:

  * A counter metric, called **prometheusTest_requests_total**, increments each time that each pipeline stage executes without incident, while a **stage** label allows for tracking the successful execution of each stage, and a **total** label tracks the total pipeline count.
  * Another counter metric, called **prometheusTest_anomalies_total**, counts any detected anomalies.
  * Finally, a gauge metric called **prometheusTest_duration_seconds** tracks the seconds of duration for each stage (again using a **stage** label and a **total** label).



The code behind these measurements increments counter metrics using the **inc()** method and sets the time value of the gauge metric with the **setToTime()** method. This is demonstrated in the following annotated example code:


```
import java.io.IOException;
import io.prometheus.client.Counter;
import io.prometheus.client.Gauge;
import io.prometheus.client.exporter.HTTPServer;
import io.prometheus.client.hotspot.DefaultExports;
 
// <https://github.com/prometheus/client\_java>
// Demo of how we plan to use Prometheus Java client to instrument Anomalia Machina.
// Note that the Anomalia Machina application will have Kafka Producer and Kafka consumer and rest of pipeline running in multiple separate processes/instances.
// So metrics from each will have different host/port combinations.
public class PrometheusBlog {  
static String appName = "prometheusTest";
// counters can only increase in value (until process restart)
// Execution count. Use a single Counter for all stages of the pipeline, stages are distinguished by labels
static final Counter pipelineCounter = Counter.build()
    .name(appName + "_requests_total").help("Count of executions of pipeline stages")
    .labelNames("stage")
    .register();
// in theory could also use pipelineCounter to count anomalies found using another label
// but less potential for confusion having another counter. Doesn't need a label
static final Counter anomalyCounter = Counter.build()
    .name(appName + "_anomalies_total").help("Count of anomalies detected")
    .register();
// A Gauge can go up and down, and is used to measure current value of some variable.
// pipelineGauge will measure duration in seconds of each stage using labels.
static final Gauge pipelineGauge = Gauge.build()
    .name(appName + "_duration_seconds").help("Gauge of stage durations in seconds")
    .labelNames("stage")
    .register();
 
public static void main(String[] args) {
// Allow default JVM metrics to be exported
   DefaultExports.initialize();
 
   // Metrics are pulled by Prometheus, create an HTTP server as the endpoint
   // Note if there are multiple processes running on the same server need to change port number.
   // And add all IPs and port numbers to the Prometheus configuration file.
HTTPServer server = null;
try {
server = new HTTPServer(1234);
} catch (IOException e) {
e.printStackTrace();
}
// now run 1000 executions of the complete pipeline with random time delays and increasing rate
int max = 1000;
for (int i=0; i &lt; max; i++)
{
// total time for complete pipeline, and increment anomalyCounter
pipelineGauge.labels("total").setToTime(() -&gt; {
producer();
consumer();
if (detector())
anomalyCounter.inc();
});
// total pipeline count
pipelineCounter.labels("total").inc();
System.out.println("i=" + i);
 
// increase the rate of execution
try {
Thread.sleep(max-i);
} catch (InterruptedException e) {
e.printStackTrace();
}
}
server.stop();
}
// the 3 stages of the pipeline, for each we increase the stage counter and set the Gauge duration time
public  static void producer() {
class Local {};
String name = Local.class.getEnclosingMethod().getName();
pipelineGauge.labels(name).setToTime(() -&gt; {
try {
Thread.sleep(1 + (long)(Math.random()*20));
} catch (InterruptedException e) {
e.printStackTrace();
}
});
pipelineCounter.labels(name).inc();
   }
public  static void consumer() {
class Local {};
String name = Local.class.getEnclosingMethod().getName();
pipelineGauge.labels(name).setToTime(() -&gt; {
try {
Thread.sleep(1 + (long)(Math.random()*10));
} catch (InterruptedException e) {
e.printStackTrace();
}
});
pipelineCounter.labels(name).inc();
   }
// detector returns true if anomaly detected else false
public  static boolean detector() {
class Local {};
String name = Local.class.getEnclosingMethod().getName();
pipelineGauge.labels(name).setToTime(() -&gt; {
try {
Thread.sleep(1 + (long)(Math.random()*200));
} catch (InterruptedException e) {
e.printStackTrace();
}
});
pipelineCounter.labels(name).inc();
return (Math.random() &gt; 0.95);
   }
}
```

Prometheus collects metrics by polling ("scraping") instrumented code (unlike some other monitoring solutions that receive metrics via push methods). The code example above creates a required HTTP server on port 1234 so that Prometheus can scrape metrics as needed.

The following sample code addresses Maven dependencies:


```
&lt;!-- The client --&gt;
&lt;dependency&gt;
&lt;groupId&gt;io.prometheus&lt;/groupId&gt;
&lt;artifactId&gt;simpleclient&lt;/artifactId&gt;
&lt;version&gt;LATEST&lt;/version&gt;
&lt;/dependency&gt;
&lt;!-- Hotspot JVM metrics--&gt;
&lt;dependency&gt;
&lt;groupId&gt;io.prometheus&lt;/groupId&gt;
&lt;artifactId&gt;simpleclient_hotspot&lt;/artifactId&gt;
&lt;version&gt;LATEST&lt;/version&gt;
&lt;/dependency&gt;
&lt;!-- Exposition HTTPServer--&gt;
&lt;dependency&gt;
&lt;groupId&gt;io.prometheus&lt;/groupId&gt;
&lt;artifactId&gt;simpleclient_httpserver&lt;/artifactId&gt;
&lt;version&gt;LATEST&lt;/version&gt;
&lt;/dependency&gt;
&lt;!-- Pushgateway exposition--&gt;
&lt;dependency&gt;
&lt;groupId&gt;io.prometheus&lt;/groupId&gt;
&lt;artifactId&gt;simpleclient_pushgateway&lt;/artifactId&gt;
&lt;version&gt;LATEST&lt;/version&gt;
&lt;/dependency&gt;
```

The code example below tells Prometheus where it should look to scrape metrics. This code can simply be added to the configuration file (default: Prometheus.yml) for basic deployments and tests.


```
global:
 scrape_interval:    15s # By default, scrape targets every 15 seconds.
 
# scrape_configs has jobs and targets to scrape for each.
scrape_configs:
# job 1 is for testing prometheus instrumentation from multiple application processes.
 # The job name is added as a label job=&lt;job_name&gt; to any timeseries scraped from this config.
 - job_name: 'testprometheus'
 
   # Override the global default and scrape targets from this job every 5 seconds.
   scrape_interval: 5s
   
   # this is where to put multiple targets, e.g. for Kafka load generators and detectors
   static_configs:
     - targets: ['localhost:1234', 'localhost:1235']
     
 # job 2 provides operating system metrics (e.g. CPU, memory etc).
 - job_name: 'node'
 
  # Override the global default and scrape targets from this job every 5 seconds.
   scrape_interval: 5s
   
   static_configs:
     - targets: ['localhost:9100']
```

Note the job named "node" that uses port 9100 in this configuration file; this job offers node metrics and requires running the [Prometheus node exporter][14] on the same server where the application is running. Polling for metrics should be done with care: doing it too often can overload applications, too infrequently can result in lag. Where application metrics can't be polled, Prometheus also offers a [push gateway][19].

### Viewing Prometheus metrics and results

Our experiment initially used [expressions][20], and later [Grafana][5], to visualize data and overcome Prometheus' lack of default dashboards. Using the Prometheus interface (or [http://localhost:][21]9[090/metrics][21]), select metrics by name and then enter them in the expression box for execution. (Note that it's common to experience error messages at this stage, so don't be discouraged if you encounter a few issues.) With correctly functioning expressions, results will be available for display in tables or graphs as appropriate.

Using the **[irate][22]** or **[rate][23]** function on a counter metric will produce a useful rate graph:

![Rate graph][24]

Here is a similar graph of a gauge metric:

![Gauge graph][25]

Grafana provides much more robust graphing capabilities and built-in Prometheus support with graphs able to display multiple metrics:

![Grafana graph][26]

To enable Grafana, install it, navigate to <http://localhost:3000/>, create a Prometheus data source, and add a Prometheus graph using an expression. A note here: An empty graph often points to a time range issue, which can usually be solved by using the "Last 5 minutes" setting.

Creating this experimental application offered an excellent opportunity to build our knowledge of what Prometheus is capable of and resulted in a high-scale experimental production application that can monitor 19 billion real-time data events for anomalies each day. By following this guide and our example, hopefully, more developers can successfully put Prometheus into practice.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/application-monitoring-prometheus

作者：[Paul Brebner][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/paul-brebner
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/windows_building_sky_scale.jpg?itok=mH6CAX29 (Tall building with windows)
[2]: https://prometheus.io/
[3]: https://prometheus.io/docs/concepts/data_model
[4]: https://prometheus.io/docs/prometheus/latest/federation
[5]: https://grafana.com/
[6]: https://opensource.com/sites/default/files/uploads/prometheus_architecture.png (Promethius architecture)
[7]: https://prometheus.io/docs/instrumenting/clientlibs/
[8]: https://prometheus.io/docs/instrumenting/exporters/
[9]: https://kafka.apache.org/
[10]: http://cassandra.apache.org/
[11]: https://github.com/prometheus/jmx_exporter
[12]: https://prometheus.io/docs/instrumenting/exporters/#software-exposing-prometheus-metrics
[13]: https://github.com/instaclustr/cassandra-exporter
[14]: https://prometheus.io/docs/guides/node-exporter/
[15]: https://github.com/prometheus/client_java
[16]: https://prometheus.io/docs/prometheus/latest/getting_started/
[17]: https://github.com/instaclustr/AnomaliaMachina
[18]: https://opensource.com/sites/default/files/uploads/anomalia_machina_architecture.png (Anomalia Machina Architecture)
[19]: https://prometheus.io/docs/instrumenting/pushing/
[20]: https://prometheus.io/docs/prometheus/latest/querying/basics/
[21]: http://localhost:9090/metrics
[22]: https://prometheus.io/docs/prometheus/latest/querying/functions/#irate
[23]: https://prometheus.io/docs/prometheus/latest/querying/functions/#rate
[24]: https://opensource.com/sites/default/files/uploads/rate_graph.png (Rate graph)
[25]: https://opensource.com/sites/default/files/uploads/gauge_graph.png (Gauge graph)
[26]: https://opensource.com/sites/default/files/uploads/grafana_graph.png (Grafana graph)
