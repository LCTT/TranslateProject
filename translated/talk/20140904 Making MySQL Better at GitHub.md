优化 GitHub 服务器上的 MySQL 数据库性能
================================================================================
> 在 GitHub 我们总是说“如果网站响应速度不够快，说明我们的工作没完成”。我们之前在[前端的体验速度][1]这篇文章中介绍了一些提高网站响应速率的方法，但这只是故事的一部分。真正影响到 GitHub.com 性能的因素是 MySQL 数据库架构。让我们来瞧瞧我们的基础架构团队是如何无缝升级了 MySQL 架构吧，这事儿发生在去年8月份，成果就是大大提高了 GitHub 网站的速度。

### 任务 ###

去年我们把 GitHub 上的大部分数据移到了新的数据中心，这个中心有世界顶级的硬件资源和网络平台。自从使用了 MySQL 作为我们的后端基本存储系统，我们一直期望着一些改进来大大提高数据库性能，但是在数据中心使用全新的硬件来部署一套全新的集群环境并不是一件简单的工作，所以我们制定了一套计划和测试工作，以便数据能平滑过渡到新环境。

### 准备工作 ###

像我们这种关于架构上的巨大改变，在执行的每一步都需要收集数据指标。新机器上安装好了基础操作系统，接下来就是测试新配置下的各种性能。为了模拟真实的工作负载环境，我们使用 tcpdump 工具从老集群那里复制正在发生的 SELECT 请求，并在新集群上重新响应一遍。

MySQL 微调是个繁琐的细致活，像众所周知的 innodb_buffer_pool_size 这个参数往往能对 MySQL 性能产生巨大的影响。对于这类参数，我们必须考虑在内，所以我们列了一份参数清单，包括 innodb_thread_concurrency，innodb_io_capacity，and innodb_buffer_pool_instances，还有其它的。

We were careful to only make one test configuration change at a time, and to run tests for at least 12 hours. We looked for query response time changes, stalls in queries per second, and signs of reduced concurrency. We observed the output of SHOW ENGINE INNODB STATUS, particularly the SEMAPHORES section, which provides information on work load contention.

Once we were relatively comfortable with configuration settings, we started migrating one of our largest tables onto an isolated cluster. This served as an early test of the process, gave us more space in the buffer pools of our core cluster and provided greater flexibility for failover and storage. This initial migration introduced an interesting application challenge, as we had to make sure we could maintain multiple connections and direct queries to the correct cluster.

In addition to all our raw hardware improvements, we also made process and topology improvements: we added delayed replicas, faster and more frequent backups, and more read replica capacity. These were all built out and ready for go-live day.

### Making a list; checking it twice ###

With millions of people using GitHub.com on a daily basis, we did not want to take any chances with the actual switchover. We came up with a thorough [checklist][2] before the transition:

![](https://cloud.githubusercontent.com/assets/1155781/4116929/13fc6f50-328b-11e4-837b-922aad3055a8.png)

We also planned a maintenance window and [announced it on our blog][3] to give our users plenty of notice.

### Migration day ###

At 5am Pacific Time on a Saturday, the migration team assembled online in chat and the process began:

![](https://cloud.githubusercontent.com/assets/1155781/4060850/39f52cd4-2df3-11e4-9aca-1f54a4870d24.png)

We put the site in maintenance mode, made an announcement on Twitter, and set out to work through the list above:

![](https://cloud.githubusercontent.com/assets/1155781/4060864/54ff6bac-2df3-11e4-95da-b059c0ec668f.png)

**13 minutes** later, we were able to confirm operations of the new cluster:

![](https://cloud.githubusercontent.com/assets/1155781/4060870/6a4c0060-2df3-11e4-8dab-654562fe628d.png)

Then we flipped GitHub.com out of maintenance mode, and let the world know that we were in the clear.

![](https://cloud.githubusercontent.com/assets/1155781/4060878/79b9884c-2df3-11e4-98ed-d11818c8915a.png)

Lots of up front testing and preparation meant that we kept the work we needed on go-live day to a minimum.

### Measuring the final results ###

In the weeks following the migration, we closely monitored performance and response times on GitHub.com. We found that our cluster migration cut the average GitHub.com page load time by half and the 99th percentile by *two-thirds*:

![](https://cloud.githubusercontent.com/assets/1155781/4060886/9106e54e-2df3-11e4-8fda-a4c64c229ba1.png)

### What we learned ###

#### Functional partitioning ####

During this process we decided that moving larger tables that mostly store historic data to separate cluster was a good way to free up disk and buffer pool space. This allowed us to leave more resources for our "hot" data, splitting some connection logic to enable the application to query multiple clusters. This proved to be a big win for us and we are working to reuse this pattern.

#### Always be testing ####

You can never do too much acceptance and regression testing for your application. Replicating data from the old cluster to the new cluster while running acceptance tests and replaying queries were invaluable for tracing out issues and preventing surprises during the migration.

#### The power of collaboration ####

Large changes to infrastructure like this mean a lot of people need to be involved, so pull requests functioned as our primary point of coordination as a team. We had people all over the world jumping in to help.

Deploy day team map:

<iframe width="620" height="420" frameborder="0" src="https://render.githubusercontent.com/view/geojson?url=https://gist.githubusercontent.com/anonymous/5fa29a7ccbd0101630da/raw/map.geojson"></iframe>

This created a workflow where we could open a pull request to try out changes, get real-time feedback, and see commits that fixed regressions or errors -- all without phone calls or face-to-face meetings. When everything has a URL that can provide context, it's easy to involve a diverse range of people and make it simple for them give feedback.

### One year later.. ###

A full year later, we are happy to call this migration a success — MySQL performance and reliability continue to meet our expectations. And as an added bonus, the new cluster enabled us to make further improvements towards greater availability and query response times. I'll be writing more about those improvements here soon.

--------------------------------------------------------------------------------

via: https://github.com/blog/1880-making-mysql-better-at-github

作者：[samlambert][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://github.com/samlambert
[1]:https://github.com/blog/1756-optimizing-large-selector-sets
[2]:https://help.github.com/articles/writing-on-github#task-lists
[3]:https://github.com/blog/1603-site-maintenance-august-31st-2013
