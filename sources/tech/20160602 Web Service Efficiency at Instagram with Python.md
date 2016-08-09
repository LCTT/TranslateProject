Being translated by ChrisLeeGit

Web Service Efficiency at Instagram with Python
===============================================

Instagram currently features the world’s largest deployment of the Django web framework, which is written entirely in Python. We initially chose to use Python because of its reputation for simplicity and practicality, which aligns well with our philosophy of “do the simple thing first.” But simplicity can come with a tradeoff: efficiency. Instagram has doubled in size over the last two years and recently crossed 500 million users, so there is a strong need to maximize web service efficiency so that our platform can continue to scale smoothly. In the past year we’ve made our efficiency program a priority, and over the last six months we’ve been able to maintain our user growth without adding new capacity to our Django tiers. In this post, we’ll share some of the tools we built and how we use them to optimize our daily deployment flow.

### Why Efficiency?

Instagram, like all software, is limited by physical constraints like servers and datacenter power. With these constraints in mind, there are two main goals we want to achieve with our efficiency program:

1. Instagram should be able to serve traffic normally with continuous code rollouts in the case of lost capacity in one data center region, due to natural disaster, regional network issues, etc.
2. Instagram should be able to freely roll out new products and features without being blocked by capacity.

To meet these goals, we realized we needed to persistently monitor our system and battle regression.

### Defining Efficiency

Web services are usually bottlenecked by available CPU time on each server. Efficiency in this context means using the same amount of CPU resources to do more work, a.k.a, processing more user requests per second (RPS). As we look for ways to optimize, our first challenge is trying to quantify our current efficiency. Up to this point, we were approximating efficiency using ‘Average CPU time per requests,’ but there were two inherent limitations to using this metric:

1. Diversity of devices. Using CPU time for measuring CPU resources is not ideal because it is affected by both CPU models and CPU loads.
2. Request impacts data. Measuring CPU resource per request is not ideal because adding and removing light or heavy requests would also impact the efficiency metric using the per-requests measurement.

Compared to CPU time, CPU instruction is a better metric, as it reports the same numbers regardless of CPU models and CPU loads for the same request. Instead of linking all our data to each user request, we chose to use a ‘per active user’ metric. We eventually landed on measuring efficiency by using ‘CPU instruction per active user during peak minute.’ With our new metric established, our next step was to learn more about our regressions by profiling Django.

### Profiling the Django Service

There are two major questions we want to answer by profiling our Django web service:

1. Does a CPU regression happen?
2. What causes the CPU regression and how do we fix it?

To answer the first question, we need to track the CPU-instruction-per-active-user metric. If this metric increases, we know a CPU regression has occurred.

The tool we built for this purpose is called Dynostats. Dynostats utilizes Django middleware to sample user requests by a certain rate, recording key efficiency and performance metrics such as the total CPU instructions, end to end requests latency, time spent on accessing memcache and database services, etc. On the other hand, each request has multiple metadata that we can use for aggregation, such as the endpoint name, the HTTP return code of the request, the server name that serves this request, and the latest commit hash on the request. Having two aspects for a single request record is especially powerful because we can slice and dice on various dimensions that help us narrow down the cause of any CPU regression. For example, we can aggregate all requests by their endpoint names as shown in the time series chart below, where it is very obvious to spot if any regression happens on a specific endpoint.

![](https://d262ilb51hltx0.cloudfront.net/max/800/1*3iouYiAchYBwzF-v0bALMw.png)

CPU instructions matter for measuring efficiency — and they’re also the hardest to get. Python does not have common libraries that support direct access to the CPU hardware counters (CPU hardware counters are the CPU registers that can be programmed to measure performance metrics, such as CPU instructions). Linux kernel, on the other hand, provides the perf_event_open system call. Bridging through Python ctypes enables us to call the syscall function in standard C library, which also provides C compatible data types for programming the hardware counters and reading data from them.
 
 With Dynostats, we can already find CPU regressions and dig into the cause of the CPU regression, such as which endpoint gets impacted most, who committed the changes that actually cause the CPU regression, etc. However, when a developer is notified that their changes have caused a CPU regression, they usually have a hard time finding the problem. If it was obvious, the regression probably wouldn’t have been committed in the first place!
 
 That’s why we needed a Python profiler that the developer can use to find the root cause of the regression (once Dynostats identifies it). Instead of starting from scratch, we decided to make slight alterations to cProfile, a readily available Python profiler. The cProfile module normally provides a set of statistics describing how long and how often various parts of a program were executed. Instead of measuring in time, we took cProfile and replaced the timer with a CPU instruction counter that reads from hardware counters. The data is created at the end of the sampled requests and sent to some data pipelines. We also send metadata similar to what we have in Dynostats, such as server name, cluster, region, endpoint name, etc.
On the other side of the data pipeline, we created a tailer to consume the data. The main functionality of the tailer is to parse the cProfile stats data and create entities that represent Python function-level CPU instructions. By doing so, we can aggregate CPU instructions by Python functions, making it easier to tell which functions contribute to CPU regression.

### Monitoring and Alerting Mechanism

At Instagram, we [deploy our backend 30–50 times a day][1]. Any one of these deployments can contain troublesome CPU regressions. Since each rollout usually includes at least one diff, it is easy to identify the cause of any regression. Our efficiency monitoring mechanism includes scanning the CPU instruction in Dynostats before and after each rollout, and sending out alerts when the change exceeds a certain threshold. For the CPU regressions happening over longer periods of time, we also have a detector to scan daily and weekly changes for the most heavily loaded endpoints.
 
 Deploying new changes is not the only thing that can trigger a CPU regression. In many cases, the new features or new code paths are controlled by global environment variables (GEV). There are very common practices for rolling out new features to a subset of users on a planned schedule. We added this information as extra metadata fields for each request in Dynostats and cProfile stats data. Grouping requests by those fields reveal possible CPU regressions caused by turning the GEVs. This enables us to catch CPU regressions before they can impact performance.

### What’s Next?

Dynostats and our customized cProfile, along with the monitoring and alerting mechanism we’ve built to support them, can effectively identify the culprit for most CPU regressions. These developments have helped us recover more than 50% of unnecessary CPU regressions, which would have otherwise gone unnoticed. 
 
 There are still areas where we can improve and make it easier to embed into Instagram’s daily deployment flow:

1. The CPU instruction metric is supposed to be more stable than other metrics like CPU time, but we still observe variances that make our alerting noisy. Keeping signal:noise ratio reasonably low is important so that developers can focus on the real regressions. This could be improved by introducing the concept of confidence intervals and only alarm when it is high. For different endpoints, the threshold of variation could also be set differently.
2. One limitation for detecting CPU regressions by GEV change is that we have to manually enable the logging of those comparisons in Dynostats. As the number of GEVs increases and more features are developed, this wont scale well. Instead, we could leverage an automatic framework that schedules the logging of these comparisons and iterates through all GEVs, and send alerts when regressions are detected.
3. cProfile needs some enhancement to handle wrapper functions and their children functions better.

With the work we’ve put into building the efficiency framework for Instagram’s web service, we are confident that we will keep scaling our service infrastructure using Python. We’ve also started to invest more into the Python language itself, and are beginning to explore moving our Python from version 2 to 3. We will continue to explore this and more experiments to keep improving both infrastructure and developer efficiency, and look forward to sharing more soon.

--------------------------------------------------------------------------------

via: https://engineering.instagram.com/web-service-efficiency-at-instagram-with-python-4976d078e366#.tiakuoi4p

作者：[Min Ni][a]
译者：[ChrisLeeGit](https://github.com/chrisleegit)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://engineering.instagram.com/@InstagramEng?source=post_header_lockup
[1]: https://engineering.instagram.com/continuous-deployment-at-instagram-1e18548f01d1#.p5adp7kcz
