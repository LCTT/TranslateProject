translating by belitex

What breaks our systems: A taxonomy of black swans
======

Find and fix outlier events that create issues before they trigger severe production problems.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/black-swan-pair_0.png?itok=MkshwqVg)

Black swans are a metaphor for outlier events that are severe in impact (like the 2008 financial crash). In production systems, these are the incidents that trigger problems that you didn't know you had, cause major visible impact, and can't be fixed quickly and easily by a rollback or some other standard response from your on-call playbook. They are the events you tell new engineers about years after the fact.

Black swans, by definition, can't be predicted, but sometimes there are patterns we can find and use to create defenses against categories of related problems.

For example, a large proportion of failures are a direct result of changes (code, environment, or configuration). Each bug triggered in this way is distinctive and unpredictable, but the common practice of canarying all changes is somewhat effective against this class of problems, and automated rollbacks have become a standard mitigation.

As our profession continues to mature, other kinds of problems are becoming well-understood classes of hazards with generalized prevention strategies.

### Black swans observed in the wild

All technology organizations have production problems, but not all of them share their analyses. The organizations that publicly discuss incidents are doing us all a service. The following incidents describe one class of a problem and are by no means isolated instances. We all have black swans lurking in our systems; it's just some of us don't know it yet.

#### Hitting limits

Running headlong into any sort of limit can produce very severe incidents. A canonical example of this was [Instapaper's outage in February 2017][1] . I challenge any engineer who has carried a pager to read the outage report without a chill running up their spine. Instapaper's production database was on a filesystem that, unknown to the team running the service, had a 2TB limit. With no warning, it stopped accepting writes. Full recovery took days and required migrating its database.

Limits can strike in various ways. Sentry hit [limits on maximum transaction IDs in Postgres][2] . Platform.sh hit [size limits on a pipe buffer][3] . SparkPost [triggered AWS's DDoS protection][4] . Foursquare hit a performance cliff when one of its [datastores ran out of RAM][5]

One way to get advance knowledge of system limits is to test periodically. Good load testing (on a production replica) ought to involve write transactions and should involve growing each datastore beyond its current production size. It's easy to forget to test things that aren't your main datastores (such as Zookeeper). If you hit limits during testing, you have time to fix the problems. Given that resolution of limits-related issues can involve major changes (like splitting a datastore), time is invaluable.

When it comes to cloud services, if your service generates unusual loads or uses less widely used products or features (such as older or newer ones), you may be more at risk of hitting limits. It's worth load testing these, too. But warn your cloud provider first.

Finally, where limits are known, add monitoring (with associated documentation) so you will know when your systems are approaching those ceilings. Don't rely on people still being around to remember.

#### Spreading slowness

> "The world is much more correlated than we give credit to. And so we see more of what Nassim Taleb calls 'black swan events'—rare events happen more often than they should because the world is more correlated."
>  —[Richard Thaler][6]

HostedGraphite's postmortem on how an [AWS outage took down its load balancers][7] (which are not hosted on AWS) is a good example of just how much correlation exists in distributed computing systems. In this case, the load-balancer connection pools were saturated by slow connections from customers that were hosted in AWS. The same kinds of saturation can happen with application threads, locks, and database connections—any kind of resource monopolized by slow operations.

HostedGraphite's incident is an example of externally imposed slowness, but often slowness can result from saturation somewhere in your own system creating a cascade and causing other parts of your system to slow down. An [incident at Spotify][8] demonstrates such spread—the streaming service's frontends became unhealthy due to saturation in a different microservice. Enforcing deadlines for all requests, as well as limiting the length of request queues, can prevent such spread. Your service will serve at least some traffic, and recovery will be easier because fewer parts of your system will be broken.

Retries should be limited with exponential backoff and some jitter. An outage at Square, in which its [Redis datastore became overloaded][9] due to a piece of code that retried failed transactions up to 500 times with no backoff, demonstrates the potential severity of excessive retries. The [Circuit Breaker][10] design pattern can be helpful here, too.

Dashboards should be designed to clearly show [utilization, saturation, and errors][11] for all resources so problems can be found quickly.

#### Thundering herds

Often, failure scenarios arise when a system is under unusually heavy load. This can arise organically from users, but often it arises from systems. A surge of cron jobs that starts at midnight is a venerable example. Mobile clients can also be a source of coordinated demand if they are programmed to fetch updates at the same time (of course, it is much better to jitter such requests).

Events occurring at pre-configured times aren't the only source of thundering herds. Slack experienced [multiple outages][12] over a short time due to large numbers of clients being disconnected and immediately reconnecting, causing large spikes of load. CircleCI saw a [severe outage][13] when a GitLab outage ended, leading to a surge of builds queued in its database, which became saturated and very slow.

Almost any service can be the target of a thundering herd. Planning for such eventualities—and testing that your plan works as intended—is therefore a must. Client backoff and [load shedding][14] are often core to such approaches.

If your systems must constantly ingest data that can't be dropped, it's key to have a scalable way to buffer this data in a queue for later processing.

#### Automation systems are complex systems

> "Complex systems are intrinsically hazardous systems."
>  —[Richard Cook, MD][15]

If your systems must constantly ingest data that can't be dropped, it's key to have a scalable way to buffer this data in a queue for later processing.

The trend for the past several years has been strongly towards more automation of software operations. Automation of anything that can reduce your system's capacity (e.g., erasing disks, decommissioning devices, taking down serving jobs) needs to be done with care. Accidents (due to bugs or incorrect invocations) with this kind of automation can take down your system very efficiently, potentially in ways that are hard to recover from.

The trend for the past several years has been strongly towards more automation of software operations. Automation of anything that can reduce your system's capacity (e.g., erasing disks, decommissioning devices, taking down serving jobs) needs to be done with care. Accidents (due to bugs or incorrect invocations) with this kind of automation can take down your system very efficiently, potentially in ways that are hard to recover from.

Christina Schulman and Etienne Perot of Google describe some examples in their talk [Help Protect Your Data Centers with Safety Constraints][16]. One incident sent Google's entire in-house content delivery network (CDN) to disk-erase.

Schulman and Perot suggest using a central service to manage constraints, which limits the pace at which destructive automation can operate, and being aware of system conditions (for example, avoiding destructive operations if the service has recently had an alert).

Automation systems can also cause havoc when they interact with operators (or with other automated systems). [Reddit][17] experienced a major outage when its automation restarted a system that operators had stopped for maintenance. Once you have multiple automation systems, their potential interactions become extremely complex and impossible to predict.

It will help to deal with the inevitable surprises if all this automation writes logs to an easily searchable, central place. Automation systems should always have a mechanism to allow them to be quickly turned off (fully or only for a subset of operations or targets).

### Defense against the dark swans

These are not the only black swans that might be waiting to strike your systems. There are many other kinds of severe problem that can be avoided using techniques such as canarying, load testing, chaos engineering, disaster testing, and fuzz testing—and of course designing for redundancy and resiliency. Even with all that, at some point your system will fail.

To ensure your organization can respond effectively, make sure your key technical staff and your leadership have a way to coordinate during an outage. For example, one unpleasant issue you might have to deal with is a complete outage of your network. It's important to have a fail-safe communications channel completely independent of your own infrastructure and its dependencies. For instance, if you run on AWS, using a service that also runs on AWS as your fail-safe communication method is not a good idea. A phone bridge or an IRC server that runs somewhere separate from your main systems is good. Make sure everyone knows what the communications platform is and practices using it.

Another principle is to ensure that your monitoring and your operational tools rely on your production systems as little as possible. Separate your control and your data planes so you can make changes even when systems are not healthy. Don't use a single message queue for both data processing and config changes or monitoring, for example—use separate instances. In [SparkPost: The Day the DNS Died][4], Jeremy Blosser presents an example where critical tools relied on the production DNS setup, which failed.

### The psychology of battling the black swan

To ensure your organization can respond effectively, make sure your key technical staff and your leadership have a way to coordinate during an outage.

Dealing with major incidents in production can be stressful. It really helps to have a structured incident-management process in place for these situations. Many technology organizations (

Dealing with major incidents in production can be stressful. It really helps to have a structured incident-management process in place for these situations. Many technology organizations ( [including Google][18] ) successfully use a version of FEMA's Incident Command System. There should be a clear way for any on-call individual to call for assistance in the event of a major problem they can't resolve alone.

For long-running incidents, it's important to make sure people don't work for unreasonable lengths of time and get breaks to eat and sleep (uninterrupted by a pager). It's easy for exhausted engineers to make a mistake or overlook something that might resolve the incident faster.

### Learn more

There are many other things that could be said about black (or formerly black) swans and strategies for dealing with them. If you'd like to learn more, I highly recommend these two books dealing with resilience and stability in production: Susan Fowler's [Production-Ready Microservices][19] and Michael T. Nygard's [Release It!][20].

Laura Nolan will present [What Breaks Our Systems: A Taxonomy of Black Swans][21] at [LISA18][22], October 29-31 in Nashville, Tennessee, USA.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/taxonomy-black-swans

作者：[Laura Nolan][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lauranolan
[b]: https://github.com/lujun9972
[1]: https://medium.com/making-instapaper/instapaper-outage-cause-recovery-3c32a7e9cc5f
[2]: https://blog.sentry.io/2015/07/23/transaction-id-wraparound-in-postgres.html
[3]: https://medium.com/@florian_7764/technical-post-mortem-of-the-august-incident-82ab4c3d6547
[4]: https://www.usenix.org/conference/srecon18americas/presentation/blosser
[5]: https://groups.google.com/forum/#!topic/mongodb-user/UoqU8ofp134
[6]: https://en.wikipedia.org/wiki/Richard_Thaler
[7]: https://blog.hostedgraphite.com/2018/03/01/spooky-action-at-a-distance-how-an-aws-outage-ate-our-load-balancer/
[8]: https://labs.spotify.com/2013/06/04/incident-management-at-spotify/
[9]: https://medium.com/square-corner-blog/incident-summary-2017-03-16-2f65be39297
[10]: https://en.wikipedia.org/wiki/Circuit_breaker_design_pattern
[11]: http://www.brendangregg.com/usemethod.html
[12]: https://slackhq.com/this-was-not-normal-really
[13]: https://circleci.statuspage.io/incidents/hr0mm9xmm3x6
[14]: https://www.youtube.com/watch?v=XNEIkivvaV4
[15]: https://web.mit.edu/2.75/resources/random/How%20Complex%20Systems%20Fail.pdf
[16]: https://www.usenix.org/conference/srecon18americas/presentation/schulman
[17]: https://www.reddit.com/r/announcements/comments/4y0m56/why_reddit_was_down_on_aug_11/
[18]: https://landing.google.com/sre/book/chapters/managing-incidents.html
[19]: http://shop.oreilly.com/product/0636920053675.do
[20]: https://www.oreilly.com/library/view/release-it/9781680500264/
[21]: https://www.usenix.org/conference/lisa18/presentation/nolan
[22]: https://www.usenix.org/conference/lisa18
