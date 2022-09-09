[#]: subject: (A beginner's guide to load balancing)
[#]: via: (https://opensource.com/article/21/4/load-balancing)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (FYJNEVERFOLLOWS)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

A beginner's guide to load balancing
======
Load balancing distributes resources to where they're needed most at
that moment.
![eight stones balancing][1]

When the personal computer was young, a household was likely to have one (or fewer) computers in it. Children played games on it during the day, and parents did accounting or programming or roamed through a BBS in the evening. Imagine a one-computer household today, though, and you can predict the conflict it would create. Everyone would want to use the computer at the same time, and there wouldn't be enough keyboard and mouse to go around.

This is, more or less, the same scenario that's been happening to the IT industry as computers have become more and more ubiquitous. Demand for services and servers has increased to the point that they could grind to a halt from overuse. Fortunately, we now have the concept of load balancing to help us handle the demand.

### What is load balancing?

Load balancing is a generic term referring to anything you do to ensure the resources you manage are distributed efficiently. For a web server's systems administrator, load balancing usually means ensuring that the web server software (such as [Nginx][2]) is configured with enough worker nodes to handle a spike in incoming visitors. In other words, should a site suddenly become very popular and its visitor count quadruple in a matter of minutes, the software running the server must be able to respond to each visitor without any of them noticing service degradation. For simple sites, this is as simple as a one-line configuration option, but for complex sites with dynamic content and several database queries for each user, it can be a serious problem.

This problem is supposed to have been solved with cloud computing, but it's not impossible for a web app to fail to scale out when it experiences an unexpected surge.

The important thing to keep in mind when it comes to load balancing is that distributing resources _efficiently_ doesn't necessarily mean distributing them _evenly_. Not all tasks require all available resources at all times. A smart load-balancing strategy provides resources to users and tasks only when those resources are needed. This is often the application developer's domain rather than the IT infrastructure's responsibility. Asynchronous applications are vital to ensuring that a user who walks away from the computer for a coffee break isn't occupying valuable resources on the server.

### How does load balancing work?

Load balancing avoids bottlenecks by distributing a workload across multiple computational nodes. Those nodes may be physical servers in a data center, containers in a cloud, strategically placed servers enlisted for edge computing, separate Java Virtual Machines (JVMs) in a complex application framework, or daemons running on a single Linux server.

The idea is to divide a large problem into small tasks and assign each task to a dedicated computer. For a website that requires its users to log in, for instance, the website might be hosted on Server A, while the login page and all the authentication lookups that go along with it are hosted on Server B. This way, the process of a new user logging into an account doesn't steal resources from other users actively using the site.

#### Load balancing the cloud

Cloud computing uses [containers][3], so there aren't usually separate physical servers to handle distinct tasks (actually, there are many separate servers, but they're clustered together to act as one computational "brain"). Instead, a "pod" is created from several containers. When one pod starts to run out of resources due to its user or task load, an identical pod is generated. Pods share storage and network resources, and each pod is assigned to a compute node as it's created. Pods can be created or destroyed on demand as the load requires so that users experience consistent quality of service regardless of how many users there are.

#### Edge computing

[Edge computing][4] takes the physical world into account when load balancing. The cloud is naturally a distributed system, but in practice, a cloud's nodes are usually concentrated in a few data centers. The further a user is from the data center running the cloud, the more physical barriers they must overcome for optimal service. Even with fiber connections and proper load balancing, the response time of a server located 3,000 miles away is likely greater than the response time of something just 300 miles away.

Edge computing brings compute nodes to the "edge" of the cloud in an attempt to bridge the geographic divide, forming a sort of satellite network for the cloud, so it also plays a part in a good load-balancing effort.

### What is a load-balancing algorithm?

There are many strategies for load balancing, and they range in complexity depending on what technology is involved and what the requirements demand. Load balancing doesn't have to be complicated, and it's important, even when using specialized software like [Kubernetes][5] or [Keepalived][6], to start load balancing from inception.

Don't rely on containers to balance the load when you could design your application to take simple precautions on its own. If you design your application to be modular and ephemeral from the start, then you'll benefit from the load balancing opportunities made available by clever network design, container orchestration, and whatever tomorrow's technology brings.

Some popular algorithms that can guide your efforts as an application developer or network engineer include:

  * Assign tasks to servers sequentially (this is often called _round-robin_).
  * Assign tasks to the server that's currently the least busy.
  * Assign tasks to the server with the best response time.
  * Assign tasks randomly.



These principles can be combined or weighted to favor, for instance, the most powerful server in a group when assigning particularly complex tasks. [Orchestration][7] is commonly used so that an administrator doesn't have to drum up the perfect algorithm or strategy for load balancing, although sometimes it's up to the admin to choose which combination of load balancing schemes to use.

### Expect the unexpected

Load balancing isn't really about ensuring that all your resources are used evenly across your network. Load balancing is all about guaranteeing a reliable user experience even when the unexpected happens. Good infrastructure can withstand a computer crash, application overload, onslaught of network traffic, and user errors. Think about how your service can be resilient and design load balancing accordingly from the ground up.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/load-balancing

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[FYJNEVERFOLLOWS](https://github.com/FYJNEVERFOLLOWS)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/water-stone-balance-eight-8.png?itok=1aht_V5V (eight stones balancing)
[2]: https://opensource.com/business/15/4/nginx-open-source-platform
[3]: https://opensource.com/resources/what-are-linux-containers
[4]: https://opensource.com/article/18/5/edge-computing
[5]: https://opensource.com/resources/what-is-kubernetes
[6]: https://www.redhat.com/sysadmin/keepalived-basics
[7]: https://opensource.com/article/20/11/orchestration-vs-automation
