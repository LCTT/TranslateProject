Monitoring database health and behavior: Which metrics matter?
======
Monitoring your database can be overwhelming or seem not important. Here's how to do it right.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_graph_stats_blue.png?itok=OKCc_60D)

We don’t talk about our databases enough. In this age of instrumentation, we monitor our applications, our infrastructure, and even our users, but we sometimes forget that our database deserves monitoring, too. That’s largely because most databases do their job so well that we simply trust them to do it. Trust is great, but confirmation of our assumptions is even better.

![](https://opensource.com/sites/default/files/styles/medium/public/uploads/image1_-_bffs.png?itok=BZQM_Fos)

### Why monitor your databases?

There are plenty of reasons to monitor your databases, most of which are the same reasons you'd monitor any other part of your systems: Knowing what’s going on in the various components of your applications makes you a better-informed developer who makes smarter decisions.

![](https://opensource.com/sites/default/files/styles/medium/public/uploads/image5_fire.png?itok=wsip2Fa4)

More specifically, databases are great indicators of system health and behavior. Odd behavior in the database can point to problem areas in your applications. Alternately, when there’s odd behavior in your application, you can use database metrics to help expedite the debugging process.

### The problem

The slightest investigation reveals one problem with monitoring databases: Databases have a lot of metrics. "A lot" is an understatement—if you were Scrooge McDuck, you could swim through all of the metrics available. If this were Wrestlemania, the metrics would be folding chairs. Monitoring them all doesn’t seem practical, so how do you decide which metrics to monitor?

![](https://opensource.com/sites/default/files/styles/medium/public/uploads/image2_db_metrics.png?itok=Jd9NY1bt)

### The solution

The best way to start monitoring databases is to identify some foundational, database-agnostic metrics. These metrics create a great start to understanding the lives of your databases.

### Throughput: How much is the database doing?

The easiest way to start monitoring a database is to track the number of requests the database receives. We have high expectations for our databases; we expect them to store data reliably and handle all of the queries we throw at them, which could be one massive query a day or millions of queries from users all day long. Throughput can tell you which of those is true.

You can also group requests by type (reads, writes, server-side, client-side, etc.) to begin analyzing the traffic.

### Execution time: How long does it take the database to do its job?

This metric seems obvious, but it often gets overlooked. You don’t just want to know how many requests the database received, but also how long the database spent on each request. It’s important to approach execution time with context, though: What's slow for a time-series database like InfluxDB isn’t the same as what's slow for a relational database like MySQL. Slow in InfluxDB might mean milliseconds, whereas MySQL’s default value for its `SLOW_QUERY` variable is ten seconds.

![](https://opensource.com/sites/default/files/styles/medium/public/uploads/image4_slow_is_relative.png?itok=9RkuzUi8)

Monitoring execution time is not the same thing as improving execution time, so beware of the temptation to spend time on optimizations if you have other problems in your app to fix.

### Concurrency: How many jobs is the database doing at the same time?

Once you know how many requests the database is handling and how long each one takes, you need to add a layer of complexity to start getting real value from these metrics.

If the database receives ten requests and each one takes ten seconds to complete, is the database busy for 100 seconds, ten seconds—or somewhere in between? The number of concurrent tasks changes the way the database’s resources are used. When you consider things like the number of connections and threads, you’ll start to get a fuller picture of your database metrics.

Concurrency can also affect latency, which includes not only the time it takes for the task to be completed (execution time) but also the time the task needs to wait before it’s handled.

### Utilization: What percentage of the time was the database busy?

Utilization is a culmination of throughput, execution time, and concurrency to determine how often the database was available—or alternatively, how often the database was too busy to respond to a request.

![](https://opensource.com/sites/default/files/styles/medium/public/uploads/image6_telephone.png?itok=YzdpwUQP)

This metric is particularly useful for determining the overall health and performance of your database. If it’s available to respond to requests only 80% of the time, you can reallocate resources, work on optimization, or otherwise make changes to get closer to high availability.

### The good news

It can seem overwhelming to monitor and analyze, especially because most of us aren’t database experts and we may not have time to devote to understanding these metrics. But the good news is that most of this work is already done for us. Many databases have an internal performance database (Postgres: pg_stats, CouchDB: Runtime_Statistics, InfluxDB: _internal, etc.), which is designed by database engineers to monitor the metrics that matter for that particular database. You can see things as broad as the number of slow queries or as detailed as the average microseconds each event in the database takes.

### Conclusion

Databases create enough metrics to keep us all busy for a long time, and while the internal performance databases are full of useful information, it’s not always clear which metrics you should care about. Start with throughput, execution time, concurrency, and utilization, which provide enough information for you to start understanding the patterns in your database.

![](https://opensource.com/sites/default/files/styles/medium/public/uploads/image3_3_hearts.png?itok=iHF-OSwx)

Are you monitoring your databases? Which metrics have you found to be useful? Tell me about it!

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/database-metrics-matter

作者：[Katy Farmer][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/thekatertot
[b]: https://github.com/lujun9972
