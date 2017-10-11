Our journey from Redis 2 to Redis 3 while not taking the site down.
============================================================

We use [Redis][2] within Sky Betting & Gaming as a shared in-memory cache for things like identity tokens that need to be known across API servers, or web servers. Within the Core Tribe this is used to help deal with the huge number of logins we have to handle day to day and particularly at busy times when we could have more than 20,000 people logging in within a single minute. This works well in so far as the data is readily available to a large number of servers (in the case of SSO tokens 70 Apache HTTPD servers). We’ve recently embarked upon a process of upgrading our Redis servers, and this upgrade is intended to enable the use of the native clustering features available from Redis 3.2\. This blog post hopes to explain why we’re using clustering, what problems we have encountered along the way, and what our solutions have been.

### In the beginning (or at least before the upgrade)

Our legacy caches consisted of a pair of Redis servers for each cache that we had, with keepalived running to ensure that there was always a master node, listening on a floating IP address. These failover pairs required considerable effort to manage when things went wrong, and the failure modes were sometimes quite interesting. On occasion the slave node, that would only allow reads of the data it held, and not writes, would end up with the floating IP address, which was relatively easy to diagnose, but broke whichever application was trying to use that cache at the time in painful ways.

### The new application

So whilst in this situation we needed to build a new application, one that used a shared in-memory cache, but that we didn’t want to be at the mercy of a dodgy failover process for that cache. So our requirements were a shared in-memory cache, with no single point of failure, that could cope with multiple different failure modes using as little human intervention as possible, and also recover after those events cleanly, also with little human intervention, an additional ask was to improve the security of the cache to reduce the scope for data exfiltration (more on that later). At the time Redis Sentinel was looking promising, and there were a number of applications floating about to allow proxying of Redis connections such as [twemproxy][3]. This would have lead to a setup with many moving parts, it should have worked, with minimal human interaction, but it was complex and needed a large number of servers and services running and communicating with each other.

![Redis Sentinel and TwemProxy](http://engineering.skybettingandgaming.com/images/Redis-Sentinel-and-TwemProxy.svg)

There would be a number of application servers talking to twemproxy, which would route their calls to an appropriate Redis master, and twemproxy would get the information on the masters from a sentinal cluster, which would control which Redis instances were master and which were slave. This setup, as well as being complex, still had a single point of failure, it relied on twemproxy to handle sharding, and connections to the correct Redis instance. It had the advantage of being transparent to the application so we could in theory, having built this, have moved existing applications over to this Redis configuration without changing the application. But we were building an application from scratch, so migration of an application wasn’t a requirement, yet.

Fortunately it was at this time that Redis 3.2 came out, and that had native clustering built in, removing the need for a separate sentinel cluster.

![Redis3 Cluster and Twemproxy](http://engineering.skybettingandgaming.com/images/Redis3-Cluster-and-Twemproxy.svg)

This allowed for a simpler set up, but alas twemproxy didn’t support Redis cluster sharding, it could shard data for you, but if it tried to do so in a manor inconsistent with the cluster sharding it would cause problems. There were guides available to make it match up, but the cluster could change shape automatically and change the way the sharding was set up. And it still had a single point of failure. It is at this point that I will be forever grateful to one of my colleagues who found a Redis cluster aware driver for Node.js, allowing us to drop twemproxy altogether.

![Redis3 Cluster](http://engineering.skybettingandgaming.com/images/Redis3-Cluster.svg)

With this we were able to shard data automatically, and failovers and failbacks were largely automatic. The application knew which nodes existed, and when writing data if they wrote to the wrong node the cluster would redirect that write automatically. This was the configuration that was chosen, and it worked we had a shared in-memory cache that was reasonably robust, and could cope with basic failure modes without intervention. During testing we did find some flaws. Replication was on a node by node basis, so if we lost a master node, then its slave became a single point of failure until the dead node was restored into service, also only the masters voted on the cluster health, so if we lost too many masters too quickly the cluster wouldn’t self heal. But this was better than we had.

### Moving forward

With a new application, using a clustered Redis configuration, we became increasingly uncomfortable with the state of the legacy Redis instances, but the new applicaction simply wasn’t of the same scale as the existing applications (over 30GB of memory is dedicated to the database of our largest legacy Redis instance). So with Redis cluster proven at a low level we decided to migrate to off the legacy Redis instances to new Redis clusters.

As we had a Node.js Redis driver that supported Redis cluster natively, we started with the migration of our Node.js applications onto Redis cluster. But how do you go about moving tens of gigabytes of constantly shifting data from one place to another, without causing major problems? Especially given these bits of data are things like authentication tokens, so if they were wrong our end users would be logged out. One option was to ask for a full site outage, point everything over to the new Redis cluster and migrate the data into it and hope for the best. Another option was to switch over to the new cluster and force all our users to login again. Neither of these proved to be terribly palatable, for obvious reasons. The alternative that was decided upon was to write the data to both the legacy Redis instance, and the cluster that was replacing it, at the same time, we would then read from the cluster increasingly more often as time went on. As the data has a limited shelf life (tokens expire after a few hours) this approach should result in zero downtime, and no risk of data loss. And so it was. The migration was a success.

All that remained was the Redis instances that served our PHP code (well one of them anyway, the other turned out to be unnecessary in the end) and we hit a thorn, actually a couple, in the road. First, and most pressing, was finding a Redis cluster aware driver that we could use in PHP, and the version of PHP we were using. This proved to be something that was doable, because we had upgraded to a recent version of PHP. Alas the driver we chose did not like using Redis auth, something we had decided to use with Redis cluster as an extra security step (I told you there would be more on that security thing). As we were replacing each legacy Redis instance with it’s own Redis cluster the fix seemed straight forward, turn Redis auth off, and all would be well with the world. However this did not prove to be true, for some reason having done this the Redis cluster wouldn’t accept connections from the web servers. A new security feature introduced by Redis in version 3 called protected mode would stop Redis listening to connections from external IP addresses when Redis was bound to any interface, and no Redis auth password was configured. This proved reasonably easy to fix, but caught us off guard.

### And now?

So this is where we find ourselves. We have migrated off some of our legacy Redis instances, and are migrating off the rest. We have, by way of doing this solved some of our technical debt, and improved our platform’s stability. With Redis cluster we can also scale out the in-memory databases as well as scale them up. Redis is single threaded, so just throwing more memory at a single instance is only ever going to allow so much growth, and we are already nipping at the heels of that limit. We’re expecting an improved perfromance from the new cluster, as well as it giving us more options for expansion and load balancing.

### What about the Future?

So we have solved some technical debt, and made our services easier to support, and more stable. That doesn’t mean the job is done, indeed Redis 4 appears to have some features that we may want to look into. And Redis isn’t the only software we use. We will continue to work to improve the platform, and reduce the time spent dealing with technical debt, but as our customer base expands, and we strive to offer ever richer services, we are always going to end up with things that need improving. The next challenge is likely to be related to scaling from more than 20,000 logins a minute to more than 40,000, and even beyond.

--------------------------------------------------------------------------------

via: http://engineering.skybettingandgaming.com/2017/09/25/redis-2-to-redis-3/

作者：[ Craig Stewart][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://engineering.skybettingandgaming.com/authors#craig_stewart
[1]:http://engineering.skybettingandgaming.com/category/devops/
[2]:https://redis.io/
[3]:https://github.com/twitter/twemproxy
