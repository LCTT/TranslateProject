[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Get started with distributed tracing using Grafana Tempo)
[#]: via: (https://opensource.com/article/21/2/tempo-distributed-tracing)
[#]: author: (Annanay Agarwal https://opensource.com/users/annanayagarwal)

Get started with distributed tracing using Grafana Tempo
======
Grafana Tempo is a new open source, high-volume distributed tracing
backend.
![Computer laptop in space][1]

Grafana's [Tempo][2] is an easy-to-use, high-scale, distributed tracing backend from Grafana Labs. Tempo has integrations with [Grafana][3], [Prometheus][4], and [Loki][5] and requires only object storage to operate, making it cost-efficient and easy to operate.

I've been involved with this open source project since its inception, so I'll go over some of the basics about Tempo and show why the cloud-native community has taken notice of it.

### Distributed tracing

It's common to want to gather telemetry on requests made to an application. But in the modern server world, a single application is regularly split across many microservices, potentially running on several different nodes.

Distributed tracing is a way to get fine-grained information about the performance of an application that may consist of discreet services. It provides a consolidated view of the request's lifecycle as it passes through an application. Tempo's distributed tracing can be used with monolithic or microservice applications, and it gives you [request-scoped information][6], making it the third pillar of observability (alongside metrics and logs).

The following is an example of a Gantt chart that distributed tracing systems can produce about applications. It uses the Jaeger [HotROD][7] demo application to generate traces and stores them in Grafana Cloud's hosted Tempo. This chart shows the processing time for the request, broken down by service and function.

![Gantt chart from Grafana Tempo][8]

(Annanay Agarwal, [CC BY-SA 4.0][9])

### Reducing index size

Traces have a ton of information in a rich and well-defined data model. Usually, there are two interactions with a tracing backend: filtering for traces using metadata selectors like the service name or duration, and visualizing a trace once it's been filtered.

To enhance search, most open source distributed tracing frameworks index a number of fields from the trace, including the service name, operation name, tags, and duration. This results in a large index and pushes you to use a database like Elasticsearch or [Cassandra][10]. However, these can be tough to manage and costly to operate at scale, so my team at Grafana Labs set out to come up with a better solution.

At Grafana, our on-call debugging workflows start with drilling down for the problem using a metrics dashboard (we use [Cortex][11], a Cloud Native Computing Foundation incubating project for scaling Prometheus, to store metrics from our application), sifting through the logs for the problematic service (we store our logs in Loki, which is like Prometheus, but for logs), and then viewing traces for a given request. We realized that all the indexing information we need for the filtering step is available in Cortex and Loki. However, we needed a strong integration for trace discoverability through these tools and a complimentary store for key-value lookup by trace ID.

This was the start of the [Grafana Tempo][12] project. By focusing on retrieving traces given a trace ID, we designed Tempo to be a minimal-dependency, high-volume, cost-effective distributed tracing backend.

### Easy to operate and cost-effective

Tempo uses an object storage backend, which is its only dependency. It can be used in either single binary or microservices mode (check out the [examples][13] in the repo on how to get started easily). Using object storage also means you can store a high volume of traces from applications without any sampling. This ensures that you never throw away traces for those one-in-a-million requests that errored out or had higher latencies.

### Strong integration with open source tools

[Grafana 7.3 includes a Tempo data source][14], which means you can visualize traces from Tempo in the Grafana UI. Also, [Loki 2.0's new query features][15] make trace discovery in Tempo easy. And to integrate with Prometheus, the team is working on adding support for exemplars, which are high-cardinality metadata information you can add to time-series data. The metric storage backends do not index these, but you can retrieve and display them alongside the metric value in the Grafana UI. While exemplars can store various metadata, trace-IDs are stored to integrate strongly with Tempo in this use case.

This example shows using exemplars with a request latency histogram where each exemplar data point links to a trace in Tempo.

![Using exemplars in Tempo][16]

(Annanay Agarwal, [CC BY-SA 4.0][9])

### Consistent metadata

Telemetry data emitted from applications running as containerized applications generally has some metadata associated with it. This can include information like the cluster ID, namespace, pod IP, etc. This is great for providing on-demand information, but it's even better if you can use the information contained in metadata for something productive. 

For instance, you can use the [Grafana Cloud Agent to ingest traces into Tempo][17], and the agent leverages the Prometheus Service Discovery mechanism to poll the Kubernetes API for metadata information and adds these as tags to spans emitted by the application. Since this metadata is also indexed in Loki, it makes it easy for you to jump from traces to view logs for a given service by translating metadata into Loki label selectors.

The following is an example of consistent metadata that can be used to view the logs for a given span in a trace in Tempo.

### ![][18]

### Cloud-native

Grafana Tempo is available as a containerized application, and you can run it on any orchestration engine like Kubernetes, Mesos, etc. The various services can be horizontally scaled depending on the workload on the ingest/query path. You can also use cloud-native object storage, such as Google Cloud Storage, Amazon S3, or Azure Blog Storage with Tempo. For further information, read the [architecture section][19] in Tempo's documentation.

### Try Tempo

If this sounds like it might be as useful for you as it has been for us, [clone the Tempo repo][20] and give it a try.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/tempo-distributed-tracing

作者：[Annanay Agarwal][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
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
