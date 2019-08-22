[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (9 open source tools for building a fault-tolerant system)
[#]: via: (https://opensource.com/article/19/3/tools-fault-tolerant-system)
[#]: author: (Bryant Son (Red Hat, Community Moderator) https://opensource.com/users/brson)

9 open source tools for building a fault-tolerant system
======

Maximize uptime and minimize problems with these open source tools.

![magnifying glass on computer screen, finding a bug in the code][1]

I've always been interested in web development and software architecture because I like to see the broader picture of a working system. Whether you are building a mobile app or a web application, it has to be connected to the internet to exchange data among different modules, which means you need a web service.

If you use a cloud system as your application's backend, you can take advantage of greater computing power, as the backend service will scale horizontally and vertically and orchestrate different services. But whether or not you use a cloud backend, it's important to build a _fault-tolerant system_ —one that is resilient, stable, fast, and safe.

To understand fault-tolerant systems, let's use Facebook, Amazon, Google, and Netflix as examples. Millions and billions of users access these platforms simultaneously while transmitting enormous amounts of data via peer-to-peer and user-to-server networks, and you can be sure there are also malicious users with bad intentions, like hacking or denial-of-service (DoS) attacks. Even so, these platforms can operate 24 hours a day and 365 days a year without downtime.

Although machine learning and smart algorithms are the backbones of these systems, the fact that they achieve consistent service without a single minute of downtime is praiseworthy. Their expensive hardware and gigantic datacenters certainly matter, but the elegant software designs supporting the services are equally important. And the fault-tolerant system is one of the principles to build such an elegant system.

### Two behaviors that cause problems in production

Here's another way to think of a fault-tolerant system. When you run your application service locally, everything seems to be fine. Great! But when you promote your service to the production environment, all hell breaks loose. In a situation like this, a fault-tolerant system helps by addressing two problems: Fail-stop behavior and Byzantine behavior.

#### Fail-stop behavior

Fail-stop behavior is when a running system suddenly halts or a few parts of the system fail. Server downtime and database inaccessibility fall under this category. For example, in the diagram below, Service 1 can't communicate with Service 2 because Service 2 is inaccessible:

![Fail-stop behavior due to Service 2 downtime][2]

But the problem can also occur if there is a network problem between the services, like this:

![Fail-stop behavior due to network failure][3]

#### Byzantine behavior

Byzantine behavior is when the system continuously runs but doesn't produce the expected behavior (e.g., wrong data or an invalid value).

Byzantine failure can happen if Service 2 has corrupted data or values, even though the service looks to be operating just fine, like in this example:

![Byzantine failure due to corrupted service][4]

Or, there can be a malicious middleman intercepting between the services and injecting unwanted data:

![Byzantine failure due to malicious middleman][5]

Neither fail-stop nor Byzantine behavior is a desired situation, so we need ways to prevent or fix them. That's where fault-tolerant systems come into play. Following are eight open source tools that can help you address these problems.

### Tools for building a fault-tolerant system

Although building a truly practical fault-tolerant system touches upon in-depth _distributed computing theory_ and complex computer science principles, there are many software tools—many of them, like the following, open source—to alleviate undesirable results by building a fault-tolerant system.

#### Circuit-breaker pattern: Hystrix and Resilience4j

The [circuit-breaker pattern][6] is a technique that helps to return a prepared dummy response or a simple response when a service fails:

![Circuit breaker pattern][7]

Netflix's open source **[Hystrix][8]** is the most popular implementation of the circuit-breaker pattern.

Many companies where I've worked previously are leveraging this wonderful tool. Surprisingly, Netflix announced that it will no longer update Hystrix. (Yeah, I know.) Instead, Netflix recommends using an alternative solution like [**Resilence4j**][9], which supports Java 8 and functional programming, or an alternative practice like [Adaptive Concurrency Limit][10].

#### Load balancing: Nginx and HaProxy

Load balancing is one of the most fundamental concepts in a distributed system and must be present to have a production-quality environment. To understand load balancers, we first need to understand the concept of _redundancy_. Every production-quality web service has multiple servers that provide redundancy to take over and maintain services when servers go down.

![Load balancer][11]

Think about modern airplanes: their dual engines provide redundancy that allows them to land safely even if an engine catches fire. (It also helps that most commercial airplanes have state-of-art, automated systems.) But, having multiple engines (or servers) means that there must be some kind of scheduling mechanism to effectively route the system when something fails.

A load balancer is a device or software that optimizes heavy traffic transactions by balancing multiple server nodes. For instance, when thousands of requests come in, the load balancer acts as the middle layer to route and evenly distribute traffic across different servers. If a server goes down, the load balancer forwards requests to the other servers that are running well.

There are many load balancers available, but the two best-known ones are Nginx and HaProxy.

[**Nginx**][12] is more than a load balancer. It is an HTTP and reverse proxy server, a mail proxy server, and a generic TCP/UDP proxy server. Companies like Groupon, Capital One, Adobe, and NASA use it.

[**HaProxy**][13] is also popular, as it is a free, very fast and reliable solution offering high availability, load balancing, and proxying for TCP and HTTP-based applications. Many large internet companies, including GitHub, Reddit, Twitter, and Stack Overflow, use HaProxy. Oh and yes, Red Hat Enterprise Linux also supports HaProxy configuration.

#### Actor model: Akka

The [actor model][14] is a concurrency design pattern that delegates responsibility when an _actor_ , which is a primitive unit of computation, receives a message. An actor can create even more actors and delegate the message to them.

[**Akka**][15] is one of the most well-known tools for the actor model implementation. The framework supports Java and Scala, which are both based on JVM.

#### Asynchronous, non-blocking I/O using messaging queue: Kafka and RabbitMQ

Multi-threaded development has been popular in the past, but this practice has been discouraged and replaced with asynchronous, non-blocking I/O patterns. For Java, this is explicitly stated in its [Enterprise Java Bean (EJB) specifications][16]:

> "An enterprise bean must not use thread synchronization primitives to synchronize execution of multiple instances.
>
> "The enterprise bean must not attempt to manage threads. The enterprise bean must not attempt to start, stop, suspend, or resume a thread, or to change a thread's priority or name. The enterprise bean must not attempt to manage thread groups."

Now, there are other practices like stream APIs and actor models. But messaging queues like [**Kafka**][17] and [**RabbitMQ**][18] offer the out-of-box support for asynchronous and non-blocking IO features, and they are powerful open source tools that can be replacements for threads by handling concurrent processes.

#### Other options: Eureka and Chaos Monkey

Other useful tools for fault-tolerant systems include monitoring tools, such as Netflix's **[Eureka][19]** , and stress-testing tools, like **[Chaos Monkey][20]**. They aim to discover potential issues earlier by testing in lower environments, like integration (INT), quality assurance (QA), and user acceptance testing (UAT), to prevent potential problems before moving to the production environment.

* * *

What open source tools are you using for building a fault-tolerant system? Please share your favorites in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/tools-fault-tolerant-system

作者：[Bryant Son (Red Hat, Community Moderator)][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/brson
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/mistake_bug_fix_find_error.png?itok=PZaz3dga (magnifying glass on computer screen, finding a bug in the code)
[2]: https://opensource.com/sites/default/files/uploads/1_errordowntimeservice.jpg (Fail-stop behavior due to Service 2 downtime)
[3]: https://opensource.com/sites/default/files/uploads/2_errordowntimenetwork.jpg (Fail-stop behavior due to network failure)
[4]: https://opensource.com/sites/default/files/uploads/3_byzantinefailuremalicious.jpg (Byzantine failure due to corrupted service)
[5]: https://opensource.com/sites/default/files/uploads/4_byzantinefailuremiddleman.jpg (Byzantine failure due to malicious middleman)
[6]: https://martinfowler.com/bliki/CircuitBreaker.html
[7]: https://opensource.com/sites/default/files/uploads/5_circuitbreakerpattern.jpg (Circuit breaker pattern)
[8]: https://github.com/Netflix/Hystrix/wiki
[9]: https://github.com/resilience4j/resilience4j
[10]: https://medium.com/@NetflixTechBlog/performance-under-load-3e6fa9a60581
[11]: https://opensource.com/sites/default/files/uploads/7_loadbalancer.jpg (Load balancer)
[12]: https://www.nginx.com
[13]: https://www.haproxy.org
[14]: https://en.wikipedia.org/wiki/Actor_model
[15]: https://akka.io
[16]: https://jcp.org/aboutJava/communityprocess/final/jsr220/index.html
[17]: https://kafka.apache.org
[18]: https://www.rabbitmq.com
[19]: https://github.com/Netflix/eureka
[20]: https://github.com/Netflix/chaosmonkey
