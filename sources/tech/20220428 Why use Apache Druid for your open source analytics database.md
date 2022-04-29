[#]: subject: "Why use Apache Druid for your open source analytics database"
[#]: via: "https://opensource.com/article/22/4/apache-druid-open-source-analytics"
[#]: author: "David Wang https://opensource.com/users/davidwang"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Why use Apache Druid for your open source analytics database
======
Your external analytics applications are critical for your users. It's important to build the right data architecture.

![metrics and data shown on a computer screen][1]

(Image by: Opensource.com)

Analytics isn't just for internal stakeholders anymore. If you're building an analytics application for customers, you're probably wondering what the right database backend is for you.

Your natural instinct might be to use what you know, like PostgreSQL or [MySQL][2]. You might even think to extend a data warehouse beyond its core BI dashboards and reports. Analytics for external users is an important feature, though, so you need the right tool for the job.

The key to answering this comes down to user experience. Here are some key technical considerations for users of your external analytics apps.

### Avoid delays with Apache Druid

The waiting game of processing queries in a queue can be annoying. The root cause of delays comes down to the amount of data you're analyzing, the processing power of the database, and the number of users and API calls, along with the ability for the database to keep up with the application.

There are a few ways to build an interactive data experience with any generic Online Analytical Processing (OLAP) database when there's a lot of data, but they come at a cost. Pre-computing queries makes architecture very expensive and rigid. Aggregating the data first can minimize insight. Limiting the data analyzed to only recent events doesn't give your users the complete picture.

The "no compromise" answer is an optimized architecture and data format built for interactivity at scale, which is precisely what [Apache Druid][3], a real-time database designed to power modern analytics applications, provides.

* First, Druid has a unique distributed and elastic architecture that pre-fetches data from a shared data layer into a near-infinite cluster of data servers. This architecture enables faster performance than a decoupled query engine like a cloud data warehouse because there's no data to move and more scalability than a scale-up database like PostgreSQL and MySQL.

* Second, Druid employs automatic (sometimes called "automagic") multi-level indexing built right into the data format to drive more queries per core. This is beyond the typical OLAP columnar format with the addition of a global index, data dictionary, and bitmap index. This maximizes CPU cycles for faster crunching.

### High Availability can't be a "nice to have"

If you and your dev team build a backend for internal reporting, does it really matter if it goes down for a few minutes or even longer? Not really. That's why there's always been tolerance for unplanned downtime and maintenance windows in classical OLAP databases and data warehouses.

But now your team is building an external analytics application for customers. They notice outages, and it can impact customer satisfaction, revenue, and definitely your weekend. It's why resiliency, both high availability and data durability, needs to be a top consideration in the database for external analytics applications.

Rethinking resiliency requires thinking about the design criteria. Can you protect from a node or a cluster-wide failure? How bad would it be to lose data, and what work is involved to protect your app and your data?

Servers fail. The default way to build resiliency is to replicate nodes and remember to [make backups][4]. But if you're building apps for customers, the sensitivity to data loss is much higher. The *occasional* backup is just not going to cut it.

The easiest answer is built right into Apache Druid's core architecture. Designed to withstand anything without losing data (even recent events), Apache Druid features a capable and simple approach to resiliency.

Druid implements High Availability (HA) and durability based on automatic, multi-level replication with shared data in object storage. It enables the HA properties you expect, and what you can think of as continuous backup to automatically protect and restore the latest state of the database even if you lose your entire cluster.

### More users should be a good thing

The best applications have the most active users and engaging experience, and for those reasons architecting your back end for high concurrency is important. The last thing you want are frustrated customers because applications are getting hung up. Architecting for internal reporting is different because the concurrent user count is much smaller and finite. The reality is that the database you use for internal reporting probably just isn't the right fit for highly-concurrent applications.

Architecting a database for high concurrency comes down to striking the right balance between CPU usage, scalability, and cost. The default answer for addressing concurrency is to throw more hardware at it. Logic says that if you increase the number of CPUs, you'll be able to run more queries. While true, this can also be a costly approach.

A better approach is to look at a database like Apache Druid with an optimized storage and query engine that drives down CPU usage. The operative word is "optimized." A database shouldn't read data that it doesn't have to. Use something that lets your infrastructure serve more queries in the same time span.

Saving money is a big reason why developers turn to Apache Druid for their external analytics applications. Apache Druid has a highly optimized data format that uses a combination of multi-level indexing, borrowed from the search engine world, along with data reduction algorithms to minimize the amount of processing required.

The net result is that Apache Druid delivers far more efficient processing than anything else out there. It can support from tens to thousands of queries per second at Terabyte or even Petabyte scale.

### Build what you need today but future-proof it

Your external analytics applications are critical for your users. It's important to build the right data architecture.

The last thing you want is to start with the wrong database, and then deal with the headaches as you scale. Thankfully, Apache Druid can start small and easily scale to support any app imaginable. Apache Druid has [excellent documentation][5], and of course it's open source, so you can try it and get up to speed quickly.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/4/apache-druid-open-source-analytics

作者：[David Wang][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/davidwang
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/metrics_data_dashboard_system_computer_analytics.png
[2]: https://opensource.com/downloads/mariadb-mysql-cheat-sheet
[3]: https://druid.apache.org/
[4]: https://opensource.com/article/19/3/backup-solutions
[5]: https://druid.apache.org/docs/latest/design/
