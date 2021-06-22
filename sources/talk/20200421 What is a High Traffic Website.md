[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What is a High Traffic Website?)
[#]: via: (https://theartofmachinery.com/2020/04/21/what_is_high_traffic.html)
[#]: author: (Simon Arneaud https://theartofmachinery.com)

What is a High Traffic Website?
======

Terms like “high traffic” are hazardous when designing online services because salespeople, business analysts and engineers all have different perspectives about what they mean. If we’re talking about, say, a high-stakes online poker room, then “high traffic” for the business side will be very low compared to what it is for the technical side. However, all these people will be in a meeting room together making decisions, using the same words to mean different things. It’s obvious how that can lead to bad (and sometimes expensive) choices.

A lot of my day job is talking to business stakeholders and figuring out the technical solutions they need, so this is a problem I have to deal with. So I’ve got my own purely technical way to think about traffic levels for online services.

### Scalability vs performance

First, let’s be clear about two concepts that come up a lot in online service design.

For online services, performance is all about how well (usually how fast) the system can handle a single request or unit of work. Scalability is about the volume or size of work that can be handled. For online services, scalability is usually about the number of user requests that can be handled within a timeframe, while for batch jobs we typically care about the size of the dataset we can process. Sometimes we want the system capacity to grow and shrink based on demand, but sometimes we don’t care as long as we can handle the full range of workloads we expect.

Scalability and performance often get confused because they commonly work together. For example, suppose you have some online service using a slow algorithm and you improve perfomance by replacing the algorithm with another that does the same job with less work. Primarily that’s a performance gain, but as long as the new algorithm doesn’t use more memory or something, you’ll be able to handle more requests in the same time.

There’s a counterexample I’ve discussed before: [internal caches versus external cache servers][1]. Using an external cache server like Redis means your app has to make network calls to do cache lookups, so it has performance overhead. On the other hand, if your app is replicated across multiple machines, a shared, external cache is more effective than a per-app, in-memory cache. The external cache is more scalable.

### Response time

When designing systems, it’s helpful to start by thinking about latency or response time requirements, even if we have to make some up and revise them later. Adding more RAM, more caches, more machines or more disk can solve a lot of problems, but latency problems tend to be fundamental to the system design. For example, suppose you’re designing an online game, and you want latencies of under 100ms for all users. Straight away, the speed of light limit means you can’t have one central server supporting a global game, regardless of whatever algorithms or hardware you throw at the problem.

There’s another reason it’s useful to focus on server response time in practice. If you have a simple, single-function website, such as a mortgage calculator, then the response time can be estimated based on technical things like the hardware specs and code quality. But that’s not how typical online services are built. The online service industry tends to emphasise adding more and more features for less development cost. That means [webpages tend to expand in complexity][2] using the easiest code possible, and only get optimised when they become too slow and users churn. Even the typical mortgage calculator site will end up bloated with advertising and tracking functionality. So the response time of a website in my day job depends mostly on the client’s budget and priorities, not on technical factors, regardless of whether it’s an ecommerce site or a cutting-edge data application.

### Looking at a single worker

Okay, so now imagine a simple web app that gets about one request an hour that takes about 5s to process (ignoring static assets because they’re not the bottleneck). That app has an obvious performance problem because many users will give up before 5s. But there’s no scaling problem because the server will practically never hit capacity limits and drop requests. Even if traffic rises, the performance problem is the bottleneck that takes priority over any hypothetical scalability problems.

That’s a simple insight that we can take further. Lets say we target 100ms per request, and our simple web app processes requests one at a time serially (i.e., no scaling). With 86,400 seconds in a day, a naïve calculation says we can handle 86,400 / 0.1 = 864,000 requests per day before we have scaling problems.

Of course, the real world isn’t that simple.

First, there will be slower and faster requests, and [requests that arrive at random won’t balance themselves nicely][3]. They’ll come in clusters that fill up queues, and the backlog will cause large spikes in response time. (There’s a handy rule that says [if you want to keep response time under control, you should target about 80% usage of theoretical total capacity][4].)

Then there’s diurnal variation. Some local websites get nearly all of their traffic during business hours, or about a third of the day. Even a very global website can easily have 2-3 times more traffic at peak than at trough because populations aren’t distributed evenly around the world (a lot of internet users live in East Asia and North/South America, but not in the huge Pacific ocean). The actual ratio depends on many factors that are hard to predict.

But even if we can’t easily get exact capacity estimates, this simple model is the justification for splitting websites into three traffic levels.

### The three traffic levels

The first level is for sites that get well under 100k dynamic requests a day. Most websites are at this level, and a lot will stay that way while being totally useful and successful. They can also pose complex technical challenges, both for performance and functionality, and a lot of my work is on sites this size. But they don’t have true scalability problems (as opposed to problems that can be solved purely by improving performance).

If a website gets bigger, it can get into the “growing pains” level, which is roughly around 100k-1M dynamic requests a day. This is where scalability problems start to appear. Often the site is at least a bit scalable (thanks to, e.g., async or multithreaded programming), but Web developers scaling a site through this level keep discovering new surprise pain points. Things that a smaller site can get away with start turning into real problems in this level. Some of the biggest challenges are actually sociotechnical, with the team that builds and manages the site needing to learn to think about it in new ways.

The next level is after leaving the 1M dynamic requests a day boundary behind. I think of sites at this level as being high traffic. Let me stress that that’s a technical line, not a value judgment or ego statement. The world’s biggest websites are orders of magnitude bigger than that, while most of the world’s useful websites are smaller. But the line matters because you simply can’t run a site at that scale without treating it like a high traffic site. You can get away with it at low traffic levels, you can fumble through it at the growing pains level, but at high traffic levels you just have to work differently. Coincidentally, it’s around this traffic level where it makes more sense to talk about requests per second than requests per day.

By the way, don’t focus too much on the exact traffic levels above. They’re very rough and honestly I picked them because they’re convenient round numbers that happen to be reasonable for typical websites. The real values depend on the target response time and all the other factors, of course. What I’m trying to explain is 1) that these levels exist, 2) why they exist and 3) what to expect if you’re trying to grow an online service.

### Going to more levels

What happens with sites that get even bigger? Once the problems at one set of bottlenecks are fixed, the site should just scale until it hits a new set of bottlenecks, either because the application has changed significantly, or just because of a very large increase in traffic. For example, once the application servers are scalable, the next scaling bottleneck could be database reads, followed by database writes. However, the basic ideas are the same, just applied to a different part of the system.

Working on a very high-traffic site can be a lot less “exciting” than working on a plain high-traffic site, simply because most major problems need to be solved to get to very high traffic levels in the first place.

### Scaling when you don’t have scaling problems

Some developers try to make online services scalable long before they have any scalability problems on the horizon, usually by adding exotic databases or broker servers or something. In particular, startup founders are often especially concerned that their technical assets might not scale to meet their business ambitions. It’s understandable, but it’s a dangerous trap for a couple of reasons.

One is that Paul Graham’s classic [Do Things That Don’t Scale][5] essay applies to your technology stack, too. You can’t beat bigger companies with scale, but your competitive advantage is that you can choose to _not_ solve the scalability problems that bigger companies are forced to with every step they take. That’s what makes smaller companies agile, and a startup that worries too much about scalability is just a big enterprise without the big to back it up.

The other problem is that premature scalability solutions can easily backfire. If you don’t have real scalability problems to test your solutions against, it’s hard to be sure you’re correctly solving a real problem. In fact, rapidly growing services tend to change requirements rapidly, too, so the risk of a scalability “solution” turning into technical debt is high. If you keep trying to add scalability to a part of the system that’s already scalable enough, chances are the next scaling bottleneck will appear somewhere else, anyway.

Architectures that err on the side of too simple are easier to scale in the long run than architectures that are too complex.

To be more concrete, I personally can’t think of a low-traffic online service I’ve worked on that couldn’t have been implemented cleanly enough using a simple, monolithic web app (in whatever popular language) in front of [a boring relational database][6], maybe with a search index like Xapian or Elasticsearch. [Many major websites aren’t much different from that.][7] It’s not the only valid architecture, but it’s a tried-and-tested one.

Having said all that, sometimes low-traffic sites need things that are sometimes sold as scalability solutions. For example, replicating an app behind a load balancer can help you deploy whenever you want without downtime. One fintech service I worked on split credit card code into its own service, making PCI DSS compliance simpler. In all these cases there’s a clear problem other than scalability that’s being solved, and that’s what avoids overengineering.

I often wish I had a systematic way to just figure out all the technical requirements for an online service in my head. But the real world is complicated and messy, and sometimes the only practical way to be sure is to experiment. However, every piece of software starts with ideas, and this is how I think about scalability for online service ideas during the early design phase.

--------------------------------------------------------------------------------

via: https://theartofmachinery.com/2020/04/21/what_is_high_traffic.html

作者：[Simon Arneaud][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://theartofmachinery.com
[b]: https://github.com/lujun9972
[1]: https://theartofmachinery.com/2016/07/30/server_caching_architectures.html
[2]: https://mobiforge.com/research-analysis/the-web-is-doom
[3]: https://theartofmachinery.com/2020/01/27/systems_programming_probability.html
[4]: https://www.johndcook.com/blog/2009/01/30/server-utilization-joel-on-queuing/
[5]: http://www.paulgraham.com/ds.html
[6]: https://theartofmachinery.com/2017/10/28/rdbs_considered_useful.html
[7]: https://nickcraver.com/blog/2016/02/17/stack-overflow-the-architecture-2016-edition/
