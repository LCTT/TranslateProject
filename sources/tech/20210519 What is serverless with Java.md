[#]: subject: (What is serverless with Java?)
[#]: via: (https://opensource.com/article/21/5/what-serverless-java)
[#]: author: (Daniel Oh https://opensource.com/users/daniel-oh)
[#]: collector: (lujun9972)
[#]: translator: (DCOLIVERSUN)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

What is serverless with Java?
======
Java is still one of the most popular languages for developing
enterprise applications. So, why are serverless developers shying away
from it?
![Coffee beans and a cup of coffee][1]

For decades, enterprises have developed business-critical applications on various platforms, including physical servers, virtual machines, and cloud environments. The one thing these applications have in common across industries is they need to be continuously available (24x7x365) to guarantee stability, reliability, and performance, regardless of demand. Therefore, every enterprise must be responsible for the high costs of maintaining an infrastructure (e.g., CPU, memory, disk, networking, etc.) even if actual resource utilization is less than 50%.

Serverless architecture was developed to help solve these problems. Serverless allows developers to build and run applications on demand, guaranteeing high availability without having to manage servers in multi- and hybrid-cloud environments. Behind the scenes, there are still many servers in the serverless topology, but they are abstracted away from application development. Instead, cloud providers use serverless services for resource management, such as provisioning, maintaining, networking, and scaling server instances.

Because of its effectiveness, the serverless development model is now a requirement for enterprises that want to spin up their business applications on demand rather than running them all the time.

Many open source projects have been created to manage serverless applications on [Kubernetes][2] clusters with the Linux container package over virtual machines. The [CNCF's Interactive Serverless Landscape][3] is a guide to open source projects, tools, frameworks, and public cloud platforms that enable DevOps teams to handle serverless applications.

![CNCF Serverless Landscape][4]

([CNCF][3], [Apache License 2.0][5])

Developers can write code then deploy it quickly to various serverless environments. Then the serverless application responds to demand and automatically scales up and down as needed.

You may be wondering what programming language and runtime are best suited for serverless application development to integrate with the technologies in the figure above. There's not just one answer to this question, but let's take a step back to discuss the application runtime that is most popular for developing business applications in enterprise production environments: Java.

According to [Developer Economics][6], as of Q3 2020, more than 8 million enterprise developers are still using Java to achieve their business requirements. Yet, according to a [2020 NewRelic survey][7], Java (at 6%) is clearly not the top choice for forward-thinking developers using a popular cloud service.

![NewRelic data on serverless runtimes and languages][8]

Data from NewRelic's Serverless Benchmark Report (Daniel Oh, [CC BY-SA 4.0][9])

Resource usage, response times, and latency are critical in serverless development. Serverless offerings from public cloud providers are usually metered on-demand, charged only when a serverless application is up, through an event-driven execution model. Therefore, enterprises don't pay anything when a serverless application is idle or scaled down to zero.

### The state of Java with containers

With this background, you may be asking: "_Why_ _don't_ _developers try to use_ _the_ _Java stack for serverless application development_ _given that_ _existing business applications are most likely developed on Java technologies?_"

Here is the hidden truth: It's hard to optimize Java applications in the new immutable infrastructure, also known as container platforms (e.g., Kubernetes).

![Differences in memory resource usage][10]

(Daniel Oh, [CC BY-SA 4.0][9])

This diagram depicts the differences in memory resource usage between a Java process and competing languages and frameworks, such as [Node.js][11] and [Go][12]. Java HotSpot has the largest footprint, which includes the heap memory allocated per Java Virtual Machine (JVM) instance. The middle shows how much smaller each process is on Node.js compared to Java. And finally, Go is a compiled language popular on the cloud due to its low memory consumption.

As you can see, you get higher density as you go from left to right on this diagram. This is the reason developers shy away from Java (including [Spring Boot][13], an opinionated microservice Java framework) when writing serverless applications on the cloud, containers, and Kubernetes.

### What's next?

Enterprises can gain significant benefits by implementing serverless applications, but resource-density issues cause them to avoid using the Java stack for developing serverless application development on Kubernetes. But choosing a different language creates a burden on the millions of Java developers worldwide. Therefore, in the next article in this series, I will guide you on how to get started with Java serverless functions instead of choosing a different language.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/what-serverless-java

作者：[Daniel Oh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/daniel-oh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/java-coffee-mug.jpg?itok=Bj6rQo8r (Coffee beans and a cup of coffee)
[2]: https://opensource.com/article/19/6/reasons-kubernetes
[3]: https://landscape.cncf.io/serverless?zoom=150
[4]: https://opensource.com/sites/default/files/uploads/cncf-serverless-landscape.png (CNCF Serverless Landscape)
[5]: https://github.com/cncf/landscape/blob/master/LICENSE
[6]: https://developereconomics.com/
[7]: https://newrelic.com/resources/ebooks/serverless-benchmark-report-aws-lambda-2020
[8]: https://opensource.com/sites/default/files/uploads/newrelic_serverlessbenchmarkreport.png (NewRelic data on serverless runtimes and languages)
[9]: https://creativecommons.org/licenses/by-sa/4.0/
[10]: https://opensource.com/sites/default/files/uploads/java-containers.png (Differences in memory resource usage)
[11]: https://nodejs.org/
[12]: https://golang.org/
[13]: https://spring.io/projects/spring-boot
