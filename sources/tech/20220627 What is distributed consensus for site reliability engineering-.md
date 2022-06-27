[#]: subject: "What is distributed consensus for site reliability engineering?"
[#]: via: "https://opensource.com/article/22/6/distributed-consensus-site-reliability-engineering"
[#]: author: "Robert Kimani https://opensource.com/users/robert-charles"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

What is distributed consensus for site reliability engineering?
======
Keeping your infrastructure healthy takes time and attention, but done correctly it's an automated process that keeps your systems running smoothly.

![drawings of people shapes on green background][1]

Image by: Opensource.com

In my [previous article][2], I discussed how to enforce best practices within your infrastructure. A site reliability engineer (SRE) is responsible for reliability, first and foremost, and enforcing policies that help keep things running is essential.

### Distributed consensus

With microservices, containers, and cloud native architectures, almost every application today is going to be a distributed application. Distributed consensus is a core technology that powers distributed systems.

Distributed consensus is a protocol for building reliable distributed systems. You cannot rely on "heartbeats" (signals from your hardware or software to indicate that they're operating normally) because network failures are inevitable.

There are some inherent problems to highlight when it comes to distributed systems. Hardware will fail. Nodes in a distributed system can randomly fail.

This is one of the important assumptions you have to make before you design a distributed system. Network outages are inevitable. You cannot always guarantee 100% network connectivity. Finally, you need a consistent view of any node within a distributed system.

According to the [CAP theorem][3], a distributed system cannot simultaneously have all of these three properties:

1. Consistency: Consistent views of data at each node. This means that it is possible that you don't see the same data when viewed from 2 different nodes in a distributed system.
2. Availability: Refers to the availability of data at each node.
3. Partition tolerance: Refers to tolerance to network failures (which results in network partitions).

Therefore a node needs to have these qualities to function properly.

Over the years, several protocols have been developed in the area of distributed consensus, including Paxos, [Raft][4], and Zab.

Paxos, for instance, was one of the original solutions to the distributed consensus problem. In the Paxos algorithm, nodes in a distributed system send a series of proposals with a unique sequence number. When the majority of processes in the distributed system accept the proposal, that proposal wins, and the sender generates a commit message. The key here is that the majority of the processes accept the proposal.

The strict sequence numbering of proposals is how it avoids duplication of data, and how it solves the problem of ordering.

### Open source distributed consensus

You don't have to reinvent the wheel by writing your own distributed consensus code. There are many open source implementations already available, such as the most popular one [Zookeeper][5]. Other implementations are [Consul][6] and [e][7][tcd][8].

### Designing autoscaling

Autoscaling is a process by which the number of servers in a server farm are automatically increased or decreased based on the load. The term "server farm" is used here to refer to any pool of servers in a distributed system. These servers are commonly behind a load balancer, as described in my previous article.

There are numerous benefits to autoscaling, but here are the 4 major ones:

1. Reduce cost by running only the required servers. For instance, you can automatically remove servers from your pool when the load is relatively low.
2. Flexibility to run less time-sensitive workload during low traffic, which is another variation of automatically reducing the number of servers.
3. Automatically replace unhealthy servers (most cloud vendors provide this functionality).
4. Increase reliability and uptime of your services.

While there are numerous benefits, there are some inherent problems with autoscaling:

1. A dependent back-end server or a service can get overwhelmed when you automatically expand your pool of servers. The service that you depend on, for example, the remote service your application connects to, may not be aware of the autoscaling activity of your service.
2. Software bugs can trigger the autoscaler to expand the server farm abruptly. This is a dangerous situation that can happen in production systems. A configuration error, for instance, can cause the autoscaler to uncontrollably start new instances.
3. Load balancing may not be intelligent enough to consider new servers. For example, a newly added server to the pool usually requires a warm up period before it can actually receive traffic from the load balancer. When the load balancer isn't fully aware of this situation, it can inundate the new server before it's ready.

### Autoscaling best practices

Scaling down is more sensitive and dangerous than scaling up. You must fully test all scale-down scenarios.

Ensure the back-end systems, such as your database, remote web service, and so on, or any external systems that your applications depend on can handle the increased load. You may be automatically adding new servers to your pool to handle increased load, but the remote service that your application depends on may not be aware of this.

You must configure an upper limit on the number of servers. This is important. You don't want the autoscaler to uncontrollably start new instances.

Have a "kill switch" you can use to easily stop the autoscaling process. If you hit a bug or configuration error that causes the autoscaler to behave erratically, you need a way to stop it.

### 3 systems that act in concert for successful autoscaling

There are three systems to consider for successful implementation of autoscaling:

1. LoadBalancing: One of the crucial benefits of [load balancing][9] is the ability to minimize latency by routing traffic to the location closest to the user.
2. LoadShedding: In order to accept all incoming requests, you only process the ones you can. Drop the excess traffic. Examples of load shedding systems are [Netflix Zuul][10], and [Envoy][11].
3. Autoscaling: Based on load, your infrastructure automatically scales up or down.

When you're designing your distributed applications, think through all the situations your applications might encounter. You should clearly document how load balancing, load shedding, and autoscaling work together to handle all situations.

### Implementing effective health checks

The core job of load balancers is to direct traffic to a set of back-end servers. Load balancers need to know which servers are alive and healthy in order for it to successfully direct traffic to them. You can use health checks to determine which servers are healthy and can receive requests.

Here's what you need to learn about effective health checks:

* Simple: Monitor for the availability of a back-end server.
* Content verification: Send a small request to the back-end server and examine the response. For instance, you could look for a particular string or response code.
* Failure: Your server may be up, but the application listening on a particular pod may be down. Or the pod may be listening, but it may not be accepting new connections. A health check must be intelligent enough to identify a problematic back-end server.

Health checks with sophisticated content verification can increase network traffic. Find the balance between a simple health check (a simple ping, for instance) and a sophisticated content-based health check.

In general, for a web application, hitting the home page of a web server and looking for a proper HTML response can serve as a reasonable health check. These kinds of checks can be automated using the [curl command][12].

Whenever you are doing a postmortem analysis of an outage, review your health check policies and determine how fast your load balancer marked a server up or down. This can be very useful to determine your health check policies.

### Stay healthy

Keeping your infrastructure healthy takes time and attention, but done correctly it's an automated process that keeps your systems running smoothly. There's yet more to an SRE's job to discuss, but those are topics for my next article.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/distributed-consensus-site-reliability-engineering

作者：[Robert Kimani][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/robert-charles
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/Community.jpg
[2]: https://opensource.com/article/22/6/circuit-breaker-pattern-site-reliability-engineering
[3]: https://en.wikipedia.org/wiki/CAP_theorem
[4]: https://raft.github.io/
[5]: https://zookeeper.apache.org/
[6]: https://www.consul.io/
[7]: https://etcd.io/
[8]: https://etcd.io
[9]: https://opensource.com/article/21/4/load-balancing
[10]: https://github.com/Netflix/zuul
[11]: https://github.com/envoyproxy/envoy
[12]: https://opensource.com/article/20/5/curl-cheat-sheet#headers
