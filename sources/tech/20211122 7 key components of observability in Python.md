[#]: subject: "7 key components of observability in Python"
[#]: via: "https://opensource.com/article/21/11/observability-python"
[#]: author: "Moshe Zadka https://opensource.com/users/moshez"
[#]: collector: "lujun9972"
[#]: translator: "MCGA"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

7 key components of observability in Python
======
Learn why observability is important for Python and how to implement it
into your software development lifecycle.
![Searching for code][1]

The applications you write execute a lot of code, in a way that's essentially invisible. So how can you know:

  * Is the code working?
  * Is it working well?
  * Who's using it, and how?



Observability is the ability to look at data that tells you what your code is doing. In this context, the main problem area is server code in distributed systems. It's not that observability isn't important for client applications; it's that clients tend not to be written in Python. It's not that observability does not matter for, say, data science; it's that tooling for observability in data science (mostly Juptyter and quick feedback) is different.

### Why observability matters

So why does observability matter? Observability is a vital part of the software development life cycle (SDLC).

Shipping an application is not the end; it is the beginning of a new cycle. In that cycle, the first stage is to confirm that the new version is running well. Otherwise, a rollback is probably needed. Which features are working well? Which ones have subtle bugs? You need to know what's going on to know what to work on next. Things fail in weird ways. Whether it's a natural disaster, a rollout of underlying infrastructure, or an application getting into a strange state, things can fail at any time, for any reason.

Outside of the standard SDLC, you need to know that everything is still running. If it's not running, it's essential to have a way to know how it is failing.

### Feedback

The first part of observability is getting feedback. When code gives information about what it is doing, feedback can help in many ways. In a staging or testing environment, feedback helps find problems and, more importantly, triage them in a faster way. This improves the tooling and communication around the validation step.

When doing a canary deployment or changing a feature flag, feedback is also important to let you know whether to continue, wait longer, or roll it back.

### Monitor

Sometimes you suspect that something has gone wrong. Maybe a dependent service is having issues, or maybe social media is barraging you with questions about your site. Maybe there's a complicated operation in a related system, and you want to make sure your system is handling it well. In those cases, you want to aggregate the data from your observability system into dashboards.

When writing an application, these dashboards need to be part of the design criteria. The only way they have data to display is when your application shares it with them.

### Alerts

Watching dashboards for more than 15 minutes at a time is like watching paint dry. No human should be subjected to this. For that task, we have alerting systems. Alerting systems compare the observability data to the expected data and send a notification when it doesn't match up. Fully delving into incident management is beyond the scope of this article. However, observable applications are alert-friendly in two ways:

  * They produce enough data, with enough quality, that high-quality alerts can be sent.
  * The alert has enough data, or the receiver can easily get the data, to help triage the source.



High-quality alerts have three properties:

  * Low false alarms: If there's an alert, there's definitely a problem.
  * Low missing alarms: When there's a problem, an alert is triggered.
  * Timely: An alert is sent quickly to minimize time to recovery.



These three properties are in a three-way conflict. You can reduce false alarms by raising the threshold of detection at the cost of increasing missing alarms. You can reduce missing alarms by lowering the threshold of detection at the expense of increasing false alarms. You can reduce both false alarms and missing alarms by collecting more data at the cost of timeliness.

Improving all three parameters is harder. This is where the quality of observability data comes in. Higher quality data can reduce all three.

### Logging

Some people like to make fun of print-based debugging. But in a world where most software runs on not-your-local-PC, print debugging is all you can do. Logging is a formalization of print debugging. The Python logging library, for all of its faults, allows standardized logging. Most importantly, it means you can log from libraries.

The application is responsible for configuring which logs go where. Ironically, after many years where applications were literally responsible for configuration, this is less and less true. Modern applications in a modern container orchestration environment log to standard error and standard output and trust the orchestration system to manage the log properly.

However, you should not rely on it in libraries, or pretty much anywhere. If you want to let the operator know what's going on, _use logging, not print_.

#### Logging levels

One of the most important features of logging is _logging levels_. Logging levels allow you to filter and route logs appropriately. But this can only be done if logging levels are consistent. At the very least, you should make them consistent across your applications.

With a little help, libraries that choose incompatible semantics can be retroactively fixed by appropriate configuration at the application level. Do this by using the most important universal convention in Python: using the `getLogger(__name-_)`.

Most reasonable libraries follow this convention. Filters can modify logging objects in place before they are emitted. You can attach a filter to the handler that will modify the messages based on the name to have appropriate levels.


```


import logging

LOGGER=logging.getLogger(__name__)

```

With this in mind, you now have to actually specify semantics for logging levels. There are a lot of options, but the following are my favorite:

  * Error: This sends an immediate alert. The application is in a state that requires operator attention. (This means that Critical and Error are folded.)
  * Warning: I like to call these “Business hours alerts.” Someone should look at this within one business day.
  * Info: This is emitted during normal flow. It's designed to help people understand what the application is doing if they already suspect a problem.
  * Debug: This is not emitted in the production environment by default. It might or might not be emitted in development or staging, and it can be turned on explicitly in production if more information is needed.



In no case should you include PII (Personal Identifiable Information) or passwords in logs. This is true regardless of levels. Levels change, debug levels are activated, and so on. Logging aggregation systems are rarely PII-safe, especially with evolving PII regulation (HIPAA, GDPR, and others).

#### Log aggregation

Modern systems are almost always distributed. Redundancy, scaling, and sometimes jurisdictional needs mean horizontal distribution. Microservices mean vertical distribution. Logging into each machine to check the logs is no longer realistic. It is often a bad idea for proper control reasons: allowing developers to log into machines gives them too many privileges.

All logs should be sent into an aggregator. There are commercial offerings, you can configure an ELK stack, or you can use any other database (SQL or no-SQL). As a really low-tech solution, you can write the logs to files and ship them to an object storage. There are too many solutions to explain, but the most important thing is choosing one and aggregating everything.

#### Logging queries

After logging everything to one place, there are too many logs. The specific aggregator defines how to write queries, but whether it's grepping through storage or writing NoSQL queries, logging queries to match source and details are useful.

### Metric scraping

Metrics scraping is a server pull model. The metrics server connects to the application periodically and pulls the metrics.

At the very least, this means the server needs connectivity and discovery for all relevant application servers.

#### Prometheus as a standard

The [Prometheus][2] format as an endpoint is useful if your metrics aggregator is Prometheus. But it is also useful if it is not! Almost all systems contain a compatibility shim for Prometheus endpoints.

Adding a Prometheus shim to your application using the client Python library allows it to be scraped by most metrics aggregators. Prometheus expects to find, once it discovers the server, a metrics endpoint. This is often part of the application routing, often at `/metrics`. Regardless of the platform of the web application, if you can serve a custom byte stream with a custom content type at a given endpoint, you can be scraped by Prometheus.

For the most popular framework, there is also a middleware plugin or something equivalent that automatically collects some metrics, like latency and error rates. This is not usually enough. You want to collect custom application data: for example, cache hit/miss rates per endpoint, database latency, and so on.

#### Using counters

Prometheus supports several data types. One important and subtle type is the counter. Counters always advance—with one caveat.

When the application resets, the counter goes back to zero. These “epochs” in counters are managed by having the counter “creation time” sent as metadata. Prometheus will know not to compare counters from two different epochs.

#### Using gauges

Gauges are much simpler: They measure instantaneous values. Use them for measurements that go up and down: for example, total allocated memory, size of cache, and so on.

#### Using enums

Enums are useful for states of the application as a whole, although they can be collected on a more granular basis. For example, if you are using a feature-gating framework, a feature that can have several states (e.g., in use, disabled, shadowing) might be useful to have as an enum.

### Analytics

Analytics are different from metrics in that they correspond to coherent events. For example, in network servers, an event is one outside request and its resulting work. In particular, the analytics event cannot be sent until the event is finished.

An event contains specific measurements: latency, number and possibly details of resulting requests to other services, and so on.

#### Structured Logging

One current possible option is structured logging. The send event is just sending a log with a properly formatted payload. This data can be queried from the log aggregator, parsed, and ingested into an appropriate system for allowing visibility into it.

### Error tracking

You can use logs to track errors, and you can use analytics to track errors. But a dedicated error system is worthwhile. A system optimized for errors can afford to send more data since errors are rare. It can send the right data, and it can do smart things with the data. Error-tracking systems in Python usually hook into a generic exception handler, collect data, and send it to a dedicated error aggregator.

#### Using Sentry

In many cases, running Sentry yourself is the right thing to do. When an error has occurred, something has gone wrong. Reliably removing sensitive data is not possible, since these are precisely the cases where the sensitive data might have ended up somewhere it shouldn't.

It is often not a big load: exceptions are supposed to be rare. Finally, this is not a system that needs high-quality, high-reliability backups. Yesterday's errors are already fixed, hopefully, and if they are not—you'll know!

### Fast, safe, repeatable: choose all three

Observable systems are faster to develop since they give you feedback. They are safer to run since, when they go wrong, they let you know sooner. Finally, observability lends itself to building repeatable processes around it since there is a feedback loop. Observability gives you knowledge about your application. And knowing is half the battle.

#### Upfront investment pays off

Building all the observability layers is hard work. It also often feels like wasted work, or at least like “nice to have but not urgent.”

Can you build it later? Maybe, but you shouldn't. Building it right lets you speed up the rest of development so much at all stages: testing, monitoring, and even onboarding new people. In an industry with as much churn as tech, just reducing the overhead of onboarding a new person is worth it.

The fact is, observability is important, so write it in early in the process and maintain it throughout. In turn, it will help you maintain your software.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/observability-python

作者：[Moshe Zadka][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/moshez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/search_find_code_python_programming.png?itok=ynSL8XRV (Searching for code)
[2]: https://opensource.com/article/21/7/run-prometheus-home-container
