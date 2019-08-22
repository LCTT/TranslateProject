[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (ShadowReader: Serverless load tests for replaying production traffic)
[#]: via: (https://opensource.com/article/19/3/shadowreader-serverless)
[#]: author: (Yuki Sawa https://opensource.com/users/yukisawa1/users/yongsanchez)

ShadowReader: Serverless load tests for replaying production traffic
======
This open source tool recreates serverless production conditions to
pinpoint causes of memory leaks and other errors that aren't visible in
the QA environment.
![Traffic lights at night][1]

While load testing has become more accessible, configuring load tests that faithfully re-create production conditions can be difficult. A good load test must use a set of URLs that are representative of production traffic and achieve request rates that mimic real users. Even performing distributed load tests requires the upkeep of a fleet of servers.

[ShadowReader][2] aims to solve these problems. It gathers URLs and request rates straight from production logs and replays them using AWS Lambda. Being serverless, it is more cost-efficient and performant than traditional distributed load tests; in practice, it has scaled beyond 50,000 requests per minute.

At Edmunds, we have been able to utilize these capabilities to solve problems, such as Node.js memory leaks that were happening only in production, by recreating the same conditions in our QA environment. We're also using it daily to generate load for pre-production canary deployments.

The memory leak problem we faced in our Node.js application confounded our engineering team; as it was only occurring in our production environment; we could not reproduce it in QA until we introduced ShadowReader to replay production traffic into QA.

### The incident

On Christmas Eve 2017, we suffered an incident where there was a jump in response time across the board with error rates tripling and impacting many users of our website.

![Christmas Eve 2017 incident][3]

![Christmas Eve 2017 incident][4]

Monitoring during the incident helped identify and resolve the issue quickly, but we still needed to understand the root cause.

At Edmunds, we leverage a robust continuous delivery (CD) pipeline that releases new updates to production multiple times a day. We also dynamically scale up our applications to accommodate peak traffic and scale down to save costs. Unfortunately, this had the side effect of masking a memory leak.

In our investigation, we saw that the memory leak had existed for weeks, since early December. Memory usage would climb to 60%, along with a slow increase in 99th percentile response time.

Between our CD pipeline and autoscaling events, long-running containers were frequently being shut down and replaced by newer ones. This inadvertently masked the memory leak until December, when we decided to stop releasing software to ensure stability during the holidays.

![Slow increase in 99th percentile response time][5]

### Our CD pipeline

At a glance, Edmunds' CD pipeline looks like this:

  1. Unit test
  2. Build a Docker image for the application
  3. Integration test
  4. Load test/performance test
  5. Canary release



The solution is fully automated and requires no manual cutover. The final step is a canary deployment directly into the live website, allowing us to release multiple times a day.

For our load testing, we leveraged custom tooling built on top of JMeter. It takes random samples of production URLs and can simulate various percentages of traffic. Unfortunately, however, our load tests were not able to reproduce the memory leak in any of our pre-production environments.

### Solving the memory leak

When looking at the memory patterns in QA, we noticed there was a very healthy pattern. Our initial hypothesis was that our JMeter load testing in QA was unable to simulate production traffic in a way that allows us to predict how our applications will perform.

While the load test takes samples from production URLs, it can't precisely simulate the URLs customers use and the exact frequency of calls (i.e., the burst rate).

Our first step was to re-create the problem in QA. We used a new tool called ShadowReader, a project that evolved out of our hackathons. While many projects we considered were product-focused, this was the only operations-centric one. It is a load-testing tool that runs on AWS Lambda and can replay production traffic and usage patterns against our QA environment.

The results it returned were immediate:

![QA results in ShadowReader][6]

Knowing that we could re-create the problem in QA, we took the additional step to point ShadowReader to our local environment, as this allowed us to trigger Node.js heap dumps. After analyzing the contents of the dumps, it was obvious the memory leak was coming from two excessively large objects containing only strings. At the time the snapshot dumped, these objects contained 373MB and 63MB of strings!

![Heap dumps show source of memory leak][7]

We found that both objects were temporary lookup caches containing metadata to be used on the client side. Neither of these caches was ever intended to be persisted on the server side. The user's browser cached only its own metadata, but on the server side, it cached the metadata for all users. This is why we were unable to reproduce the leak with synthetic testing. Synthetic tests always resulted in the same fixed set of metadata in the server-side caches. The leak surfaced only when we had a sufficient amount of unique metadata being generated from a variety of users.

Once we identified the problem, we were able to remove the large caches that we observed in the heap dumps. We've since instrumented the application to start collecting metrics that can help detect issues like this faster.

![Collecting metrics][8]

After making the fix in QA, we saw that the memory usage was constant and the leak was plugged.

![Graph showing memory leak fixed][9]

### What is ShadowReader?

ShadowReader is a serverless load-testing framework powered by AWS Lambda and S3 to replay production traffic. It mimics real user traffic by replaying URLs from production at the same rate as the live website. We are happy to announce that after months of internal usage, we have released it as open source!

#### Features

  * ShadowReader mimics real user traffic by replaying user requests (URLs). It can also replay certain headers, such as True-Client-IP and User-Agent, along with the URL.


  * It is more efficient cost- and performance-wise than traditional distributed load tests that run on a fleet of servers. Managing a fleet of servers for distributed load testing can cost $1,000 or more per month; with a serverless stack, it can be reduced to $100 per month by provisioning compute resources on demand.


  * We've scaled it up to 50,000 requests per minute, but it should be able to handle more than 100,000 reqs/min.


  * New load tests can be spun up and stopped instantly, unlike traditional load-testing tools, which can take many minutes to generate the test plan and distribute the test data to the load-testing servers.


  * It can ramp traffic up or down by a percentage value to function as a more traditional load test.


  * Its plugin system enables you to switch out plugins to change its behavior. For instance, you can switch from past replay (i.e., replays past requests) to live replay (i.e., replays requests as they come in).


  * Currently, it can replay logs from the [Application Load Balancer][10] and [Classic Load Balancer][11] Elastic Load Balancers (ELBs), and support for other load balancers is coming soon.



### How it works

ShadowReader is composed of four different Lambdas: a Parser, an Orchestrator, a Master, and a Worker.

![ShadowReader architecture][12]

When a user visits a website, a load balancer (in this case, an ELB) typically routes the request. As the ELB routes the request, it will log the event and ship it to S3.

Next, ShadowReader triggers a Parser Lambda every minute via a CloudWatch event, which parses the latest access (ELB) logs on S3 for that minute, then ships the parsed URLs into another S3 bucket.

On the other side of the system, ShadowReader also triggers an Orchestrator lambda every minute. This Lambda holds the configurations and state of the system.

The Orchestrator then invokes a Master Lambda function. From the Orchestrator, the Master receives information on which time slice to replay and downloads the respective data from the S3 bucket of parsed URLs (deposited there by the Parser).

The Master Lambda divides the load-test URLs into smaller batches, then invokes and passes each batch into a Worker Lambda. If 800 requests must be sent out, then eight Worker Lambdas will be invoked, each one handling 100 URLs.

Finally, the Worker receives the URLs passed from the Master and starts load-testing the chosen test environment.

### The bigger picture

The challenge of reproducibility in load testing serverless infrastructure becomes increasingly important as we move from steady-state application sizing to on-demand models. While ShadowReader is designed and used with Edmunds' infrastructure in mind, any application leveraging ELBs can take full advantage of it. Soon, it will have support to replay the traffic of any service that generates traffic logs.

As the project moves forward, we would love to see it evolve to be compatible with next-generation serverless runtimes such as Knative. We also hope to see other open source communities build similar toolchains for their infrastructure as serverless becomes more prevalent.

### Getting started

If you would like to test drive ShadowReader, check out the [GitHub repo][2]. The README contains how-to guides and a batteries-included [demo][13] that will deploy all the necessary resources to try out live replay in your AWS account.

We would love to hear what you think and welcome contributions. See the [contributing guide][14] to get started!

* * *

_This article is based on "[How we fixed a Node.js memory leak by using ShadowReader to replay production traffic into QA][15]," published on the_ _Edmunds Tech Blog_ _with the help of Carlos Macasaet, Sharath Gowda, and Joey Davis._ _Yuki_ _Sawa_ _also presented this_ as* [ShadowReader—Serverless load tests for replaying production traffic][16] at ([SCaLE 17x][17]) March 7-10 in Pasadena, Calif.*

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/shadowreader-serverless

作者：[Yuki Sawa][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/yukisawa1/users/yongsanchez
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/traffic-light-go.png?itok=nC_851ys (Traffic lights at night)
[2]: https://github.com/edmunds/shadowreader
[3]: https://opensource.com/sites/default/files/uploads/shadowreader_incident1_0.png (Christmas Eve 2017 incident)
[4]: https://opensource.com/sites/default/files/uploads/shadowreader_incident2.png (Christmas Eve 2017 incident)
[5]: https://opensource.com/sites/default/files/uploads/shadowreader_99thpercentile.png (Slow increase in 99th percentile response time)
[6]: https://opensource.com/sites/default/files/uploads/shadowreader_qa.png (QA results in ShadowReader)
[7]: https://opensource.com/sites/default/files/uploads/shadowreader_heapdumps.png (Heap dumps show source of memory leak)
[8]: https://opensource.com/sites/default/files/uploads/shadowreader_code.png (Collecting metrics)
[9]: https://opensource.com/sites/default/files/uploads/shadowreader_leakplugged.png (Graph showing memory leak fixed)
[10]: https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html
[11]: https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/introduction.html
[12]: https://opensource.com/sites/default/files/uploads/shadowreader_architecture.png (ShadowReader architecture)
[13]: https://github.com/edmunds/shadowreader#live-replay
[14]: https://github.com/edmunds/shadowreader/blob/master/CONTRIBUTING.md
[15]: https://technology.edmunds.com/2018/08/25/Investigating-a-Memory-Leak-and-Introducing-ShadowReader/
[16]: https://www.socallinuxexpo.org/scale/17x/speakers/yuki-sawa
[17]: https://www.socallinuxexpo.org/
