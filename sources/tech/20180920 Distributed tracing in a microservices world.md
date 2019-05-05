Distributed tracing in a microservices world
======
What is distributed tracing and why is it so important in a microservices environment?

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/pixelated-world.png?itok=fHjM6m53)

[Microservices][1] have become the default choice for greenfield applications. After all, according to practitioners, microservices provide the type of decoupling required for a full digital transformation, allowing individual teams to innovate at a far greater speed than ever before.

Microservices are nothing more than regular distributed systems, only at a larger scale. Therefore, they exacerbate the well-known problems that any distributed system faces, like lack of visibility into a business transaction across process boundaries.

Given that it's extremely common to have multiple versions of a single service running in production at the same time—be it in a [A/B testing][2] scenario or as part of rolling out a new release following the [Canary release][3] technique—when we account for the fact that we are talking about hundreds of services, it's clear that what we have is chaos. It's almost impossible to map the interdependencies and understand the path of a business transaction across services and their versions.

### Observability

This chaos ends up being a good thing, as long as we can observe what's going on and diagnose the problems that will eventually occur.

A system is said to be observable when we can understand its state based on the [metrics, logs, and traces][4] it emits. Given that we are talking about distributed systems, knowing the state of a single instance of a single service isn't enough; we need to be able to aggregate the metrics for all instances of a given service, perhaps grouped by version. Metrics solutions like [Prometheus][5] are very popular in tackling this aspect of the observability problem. Similarly, we need logs to be stored in a central location, as it's impossible to analyze the logs from the individual instances of each service. [Logstash][6] is usually applied here, in combination with a backing storage like [Elasticsearch][7]. And finally, we need to get end-to-end traces to understand the path a given transaction has taken. This is where distributed tracing solutions come into play.

### Distributed tracing

In monolithic web applications, logging frameworks provide enough capabilities to do a basic root-cause analysis when something fails. A developer just needs to place log statements in the code. Information like "context" (usually "thread") and "timestamp" are automatically added to the log entry, making it easier to understand the execution of a given request and correlate the entries.

```
Thread-1 2018-09-03T15:52:54+02:00 Request started
Thread-2 2018-09-03T15:52:55+02:00 Charging credit card x321
Thread-1 2018-09-03T15:52:55+02:00 Order submitted
Thread-1 2018-09-03T15:52:56+02:00 Charging credit card x123
Thread-1 2018-09-03T15:52:57+02:00 Changing order status
Thread-1 2018-09-03T15:52:58+02:00 Dispatching event to inventory
Thread-1 2018-09-03T15:52:59+02:00 Request finished
```

We can safely say that the second log entry above is not related to the other entries, as it's being executed in a different thread.

In microservices architectures, logging alone fails to deliver the complete picture. Is this service the first one in the call chain? And what happened at the inventory service (where we apparently dispatched an event)?

A common strategy to answer this question is creating an identifier at the very first building block of our transaction and propagating this identifier across all the calls, probably by sending it as an HTTP header whenever a remote call is made.

In a central log collector, we could then see entries like the ones below. Note how we could log the correlation ID (the first column in our example), so we know that the second entry is not related to the other entries.

```
abc123 Order     2018-09-03T15:52:58+02:00 Dispatching event to inventory
def456 Order     2018-09-03T15:52:58+02:00 Dispatching event to inventory
abc123 Inventory 2018-09-03T15:52:59+02:00 Received `order-submitted` event
abc123 Inventory 2018-09-03T15:53:00+02:00 Checking inventory status
abc123 Inventory 2018-09-03T15:53:01+02:00 Updating inventory
abc123 Inventory 2018-09-03T15:53:02+02:00 Preparing order manifest
```

This technique is one of the concepts at the core of any modern distributed tracing solution, but it's not really new; correlating log entries is decades old, probably as old as "distributed systems" itself.

What sets distributed tracing apart from regular logging is that the data structure that holds tracing data is more specialized, so we can also identify causality. Looking at the log entries above, it's hard to tell if the last step was caused by the previous entry, if they were performed concurrently, or if they share the same caller. Having a dedicated data structure also allows distributed tracing to record not only a message in a single point in time but also the start and end time of a given procedure.

![Trace showing spans][9]

Trace showing spans similar to the logs described above

[Click to enlarge][10]

Most of the modern distributed tracing tools are inspired by a 2010 [paper about Dapper][11], the distributed tracing solution used at Google. In that paper, the data structure described above was called a span, and you can see nine of them in the image above. This particular "forest" of spans is called a trace and is equivalent to the correlated log entries we've seen before.

The image above is a screenshot of a trace displayed in [Jaeger][12], an open source distributed tracing solution hosted by the [Cloud Native Computing Foundation (CNCF)][13]. It marks each service with a color to make it easier to see the process boundaries. Timing information can be easily visualized, both by looking at the macro timeline at the top of the screen or at the individual spans, giving a sense of how long each span takes and how impactful it is in this particular execution. It's also easy to observe when processes are asynchronous and therefore may outlive the initial request.

Like with logging, we need to annotate or instrument our code with the data we want to record. Unlike logging, we record spans instead of messages and do some demarcation to know when the span starts and finishes so we can get accurate timing information. As we would probably like to have our business code independent from a specific distributed tracing implementation, we can use an API such as [OpenTracing][14], leaving the decision about the concrete implementation as a packaging or runtime concern. Following is pseudo-Java code showing such demarcation.

```
try (Scope scope = tracer.buildSpan("submitOrder").startActive(true)) {
    scope.span().setTag("order-id", "c85b7644b6b5");
    chargeCreditCard();
    changeOrderStatus();
    dispatchEventToInventory();
}
```

Given the nature of the distributed tracing concept, it's clear the code executed "between" our business services can also be part of the trace. For instance, we could [turn on][15] the distributed tracing integration for [Istio][16], a service mesh solution that helps in the communication between microservices, and we'll suddenly have a better picture about the network latency and routing decisions made at this layer. Another example is the work done in the OpenTracing community to provide instrumentation for popular stacks, frameworks, and APIs, such as Java's [JAX-RS][17], [Spring Cloud][18], or [JDBC][19]. This enables us to see how our business code interacts with the rest of the middleware, understand where a potential problem might be happening, and identify the best areas to improve. In fact, today's middleware instrumentation is so rich that it's common to get started with distributed tracing by using only the so-called "framework instrumentation," leaving the business code free from any tracing-related code.

While a microservices architecture is almost unavoidable nowadays for established companies to innovate faster and for ambitious startups to achieve web scale, it's easy to feel helpless while conducting a root cause analysis when something eventually fails and the right tools aren't available. The good news is tools like Prometheus, Logstash, OpenTracing, and Jaeger provide the pieces to bring observability to your application.

Juraci Paixão Kröhling will present [What are My Microservices Doing?][20] at [Open Source Summit Europe][21], October 22-24 in Edinburgh, Scotland.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/distributed-tracing-microservices-world

作者：[Juraci Paixão Kröhling][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jpkroehling
[1]: https://en.wikipedia.org/wiki/Microservices
[2]: https://en.wikipedia.org/wiki/A/B_testing
[3]: https://martinfowler.com/bliki/CanaryRelease.html
[4]: https://blog.twitter.com/engineering/en_us/a/2016/observability-at-twitter-technical-overview-part-i.html
[5]: https://prometheus.io/
[6]: https://github.com/elastic/logstash
[7]: https://github.com/elastic/elasticsearch
[8]: /file/409621
[9]: https://opensource.com/sites/default/files/uploads/distributed-trace.png (Trace showing spans)
[10]: /sites/default/files/uploads/trace.png
[11]: https://ai.google/research/pubs/pub36356
[12]: https://www.jaegertracing.io/
[13]: https://www.cncf.io/
[14]: http://opentracing.io/
[15]: https://istio.io/docs/tasks/telemetry/distributed-tracing/
[16]: https://istio.io/
[17]: https://github.com/opentracing-contrib/java-jaxrs
[18]: https://github.com/opentracing-contrib/java-spring-cloud
[19]: https://github.com/opentracing-contrib/java-jdbc
[20]: https://osseu18.sched.com/event/FxW3/what-are-my-microservices-doing-juraci-paixao-krohling-red-hat#
[21]: https://osseu18.sched.com/
