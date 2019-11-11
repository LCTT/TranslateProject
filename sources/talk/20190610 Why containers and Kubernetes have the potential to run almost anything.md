[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why containers and Kubernetes have the potential to run almost anything)
[#]: via: (https://opensource.com/article/19/6/kubernetes-potential-run-anything)
[#]: author: (Scott McCarty https://opensource.com/users/fatherlinux)

Why containers and Kubernetes have the potential to run almost anything
======
Go beyond deployment of simple applications and tackle day two
operations with Kubernetes Operators.
![arrows cycle symbol for failing faster][1]

In my first article, _[Kubernetes is a dump truck: Here's why][2]_, I talked about about how Kubernetes is elegant at defining, sharing, and running applications, similar to how dump trucks are elegant at moving dirt. In the second, _[How to navigate the Kubernetes learning curve][3]_, I explain that the learning curve for Kubernetes is really the same learning curve for running any applications in production, which is actually easier than learning all of the traditional pieces (load balancers, routers, firewalls, switches, clustering software, clustered files systems, etc). This is DevOps, a collaboration between Developers and Operations to specify the way things should run in production, which means there's a learning curve for both sides. In article four, _[Kubernetes basics: Learn how to drive first][4]_, I reframe learning Kubernetes with a focus on driving the dump truck instead of building or equipping it. In the fourth article, _[4 tools to help you drive Kubernetes][5]_, I share tools that I have fallen in love with to help build applications (drive the dump truck) in Kubernetes.

In this final article, I share the reasons why I am so excited about the future of running applications on Kubernetes.

From the beginning, Kubernetes has been able to run web-based workloads (containerized) really well. Workloads like web servers, Java, and associated app servers (PHP, Python, etc) just work. The supporting services like DNS, load balancing, and SSH (replaced by kubectl exec) are handled by the platform. For the majority of my career, these are the workloads I ran in production, so I immediately recognized the power of running production workloads with Kubernetes, aside from DevOps, aside from agile. There is incremental efficiency gain even if we barely change our cultural practices. Commissioning and decommissioning become extremely easy, which were terribly difficult with traditional IT. So, since the early days, Kubernetes has given me all of the basic primitives I need to model a production workload, in a single configuration language (Kube YAML/Json).

But, what happened if you needed to run Multi-master MySQL with replication? What about redundant data using Galera? How do you do snapshotting and backups? What about sophisticated workloads like SAP? Day zero (deployment) with simple applications (web servers, etc) has been fairly easy with Kubernetes, but day two operations and workloads were not tackled. That's not to say that day two operations with sophisticated workloads were harder than traditional IT to solve, but they weren't made easier with Kubernetes. Every user was left to devise their own genius ideas for solving these problems, which is basically the status quo today. Over the last 5 years, the number one type of question I get is around day two operations of complex workloads.

Thankfully, that's changing as we speak with the advent of Kubernetes Operators. With the advent of Operators, we now have a framework to codify day two operations knowledge into the platform. We can now apply the same defined state, actual state methodology that I described in [_Kubernetes basics: Learn how to drive first_][4]—we can now define, automate, and maintain a wide range of systems administration tasks.

I often refer to Operators as "Robot Sysadmins" because they essentially codify a bunch of the day two operations knowledge that a subject matter expert (SME, like database administrator or, systems administrator) for that workload type (database, web server, etc) would normally keep in their notes somewhere in a wiki. The problem with these notes being in a wiki is, for the knowledge to be applied to solve a problem, we need to:

  1. Generate an event, often a monitoring system finds a fault and we create a ticket
  2. Human SME has to investigate the problem, even if it's something we've seen a million times before
  3. Human SME has to execute the knowledge (perform the backup/restore, configure the Galera or transaction replication, etc)



With Operators, all of this SME knowledge can be embedded in a separate container image which is deployed before the actual workload. We deploy the Operator container, and then the Operator deploys and manages one or more instances of the workload. We then manage the Operators using something like the Operator Lifecycle Manager (Katacoda tutorial).

So, as we move forward with Kubernetes, we not only simplify the deployment of applications, but also the management over the lifecycle. Operators also give us the tools to manage very complex, stateful applications with deep configuration requirements (clustering, replication, repair, backup/restore. And, the best part is, the people who built the container are probably the subject matter experts for day two operations, so now they can embed that knowledge into the operations environment.

### The conclusion to this series

The future of Kubernetes is bright, and like virtualization before it, workload expansion is inevitable. Learning how to drive Kubernetes is probably the biggest investment that a developer or sysadmin can make in their own career growth. As the workloads expand, so will the career opportunities. So, here's to driving an amazing [dump truck that's very elegant at moving dirt][2]...

If you would like to follow me on Twitter, I share a lot of content on this topic at [@fatherlinux][6]

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/kubernetes-potential-run-anything

作者：[Scott McCarty][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/fatherlinux
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fail_progress_cycle_momentum_arrow.png?itok=q-ZFa_Eh (arrows cycle symbol for failing faster)
[2]: https://opensource.com/article/19/6/kubernetes-dump-truck
[3]: https://opensource.com/article/19/6/kubernetes-learning-curve
[4]: https://opensource.com/article/19/6/kubernetes-basics
[5]: https://opensource.com/article/19/6/tools-drive-kubernetes
[6]: https://twitter.com/fatherlinux
