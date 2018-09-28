Why moving all your workloads to the cloud is a bad idea
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cloud-globe.png?itok=_drXt4Tn)

As we've been exploring in this series, cloud hype is everywhere, telling you that migrating your applications to the cloud—including hybrid cloud and multicloud—is the way to ensure a digital future for your business. This hype rarely dives into the pitfalls of moving to the cloud, nor considers the daily work of enhancing your customer's experience and agile delivery of new and legacy applications.

In [part one][1] of this series, we covered basic definitions (to level the playing field). We outlined our views on hybrid cloud and multi-cloud, making sure to show the dividing lines between the two. This set the stage for [part two][2], where we discussed the first of three pitfalls: Why cost is not always the obvious motivator for moving to the cloud.

In part three, we'll look at the second pitfall: Why moving all your workloads to the cloud is a bad idea.

### Everything's better in the cloud?

There's a misconception that everything will benefit from running in the cloud. All workloads are not equal, and not all workloads will see a measurable effect on the bottom line from moving to the cloud.

As [InformationWeek wrote][3], "Not all business applications should migrate to the cloud, and enterprises must determine which apps are best suited to a cloud environment." This is a hard fact that the utility company in part two of this series learned when labor costs rose while trying to move applications to the cloud. Discovering this was not a viable solution, the utility company backed up and reevaluated its applications. It found some applications were not heavily used and others had data ownership and compliance issues. Some of its applications were not certified for use in a cloud environment.

Sometimes running applications in the cloud is not physically possible, but other times it's not financially viable to run in the cloud.

Imagine a fictional online travel company. As its business grew, it expanded its on-premises hosting capacity to over 40,000 servers. It eventually became a question of expanding resources by purchasing a data center at a time, not a rack at a time. Its business consumes bandwidth at such volumes that cloud pricing models based on bandwidth usage remain prohibitive.

### Get a baseline

Sometimes running applications in the cloud is not physically possible, but other times it's not financially viable to run in the cloud.

As these examples show, nothing is more important than having a thorough understanding of your application landscape. Along with a having good understanding of what applications need to migrate to the cloud, you also need to understand current IT environments, know your present level of resources, and estimate your costs for moving.

As these examples show, nothing is more important than having a thorough understanding of your application landscape. Along with a having good understanding of what applications need to migrate to the cloud, you also need to understand current IT environments, know your present level of resources, and estimate your costs for moving.

Understanding your baseline–each application's current situation and performance requirements (network, storage, CPU, memory, application and infrastructure behavior under load, etc.)–gives you the tools to make the right decision.

If you're running servers with single-digit CPU utilization due to complex acquisition processes, a cloud with on-demand resourcing might be a great idea. However, first ask these questions:

  * How long did this low-utilization exist?
  * Why wasn't it caught earlier?
  * Isn't there a process or effective monitoring in place?
  * Do you really need a cloud to fix this? Or just a better process for both getting and managing your resources?
  * Will you have a better process in the cloud?



### Are containers necessary?

Many believe you need containers to be successful in the cloud. This popular [catchphrase][4] sums it up nicely, "We crammed this monolith into a container and called it a microservice."

Containers are a means to an end, and using containers doesn't mean your organization is capable of running maturely in the cloud. It's not about the technology involved, it's about applications that often were written in days gone by with technology that's now outdated. If you put a tire fire into a container and then put that container on a container platform to ship, it's still functionality that someone is using.

Is that fire easier to extinguish now? These container fires just create more challenges for your DevOps teams, who are already struggling to keep up with all the changes being pushed through an organization moving everything into the cloud.

Note, it's not necessarily a bad decision to move legacy workloads into the cloud, nor is it a bad idea to containerize them. It's about weighing the benefits and the downsides, assessing the options available, and making the right choices for each of your workloads.

### Coming up

In part four of this series, we'll describe the third and final pitfall everyone should avoid with hybrid multi-cloud. Find out what the cloud means for your data.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/why-you-cant-move-everything-cloud

作者：[Eric D.Schabell][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/eschabell
[1]:https://opensource.com/article/18/4/pitfalls-hybrid-multi-cloud
[2]:https://opensource.com/article/18/6/reasons-move-to-cloud
[3]:https://www.informationweek.com/cloud/10-cloud-migration-mistakes-to-avoid/d/d-id/1318829
[4]:https://speakerdeck.com/caseywest/containercon-north-america-cloud-anti-patterns?slide=22
