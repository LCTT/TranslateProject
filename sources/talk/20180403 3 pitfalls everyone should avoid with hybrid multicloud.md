3 pitfalls everyone should avoid with hybrid multicloud
======
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BIZ_darwincloud_520x292_0311LL.png?itok=74DLgd8Q)

This article was co-written with [Roel Hodzelmans][1].

We're all told the cloud is the way to ensure a digital future for our businesses. But which cloud? From cloud to hybrid cloud to hybrid multi-cloud, you need to make choices, and these choices don't preclude the daily work of enhancing your customers' experience or agile delivery of the applications they need.

This article is the first in a four-part series on avoiding pitfalls in hybrid multi-cloud computing. Let's start by examining multi-cloud, hybrid cloud, and hybrid multi-cloud and what makes them different from one another.

### Hybrid vs. multi-cloud

There are many conversations you may be having in your business around moving to the cloud. For example, you may want to take your on-premises computing capacity and turn it into your own private cloud. You may wish to provide developers with a cloud-like experience using the same resources you already have. A more traditional reason for expansion is to use external computing resources to augment those in your own data centers. The latter leads you to the various public cloud providers, as well as to our first definition, multi-cloud.

#### Multi-cloud

Multi-cloud means using multiple clouds from multiple providers for multiple tasks.

![Multi-cloud][3]

Figure 1. Multi-cloud IT with multiple isolated cloud environments

Typically, multi-cloud refers to the use of several different public clouds in order to achieve greater flexibility, lower costs, avoid vendor lock-in, or use specific regional cloud providers.

A challenge of the multi-cloud approach is achieving consistent policies, compliance, and management with different providers involved.

Multi-cloud is mainly a strategy to expand your business while leveraging multi-vendor cloud solutions and spreading the risk of lock-in. Figure 1 shows the isolated nature of cloud services in this model, without any sort of coordination between the services and business applications. Each is managed separately, and applications are isolated to services found in their environments.

#### Hybrid cloud

Hybrid cloud solves issues where isolation and coordination are central to the solution. It is a combination of one or more public and private clouds with at least a degree of workload portability, integration, orchestration, and unified management.

![Hybrid cloud][5]

Figure 2. Hybrid clouds may be on or off premises, but must have a degree of interoperability

The key issue here is that there is an element of interoperability, migration potential, and a connection between tasks running in public clouds and on-premises infrastructure, even if it's not always seamless or otherwise fully implemented.

If your cloud model is missing portability, integration, orchestration, and management, then it's just a bunch of clouds, not a hybrid cloud.

The cloud environments in Fig. 2 include at least one private and public cloud. They can be off or on premises, but they have some degree of the following:

  * Interoperability
  * Application portability
  * Data portability
  * Common management



As you can probably guess, combining multi-cloud and hybrid cloud results in a hybrid multi-cloud. But what does that look like?

### Hybrid multi-cloud

Hybrid multi-cloud pulls together multiple clouds and provides the tools to ensure interoperability between the various services in hybrid and multi-cloud solutions.

![Hybrid multi-cloud][7]

Figure 3. Hybrid multi-cloud solutions using open technologies

Bringing these together can be a serious challenge, but the result ensures better use of resources without isolation in their respective clouds.

Fig. 3 shows an example of hybrid multi-cloud based on open technologies for interoperability, workload portability, and management.

### Moving forward: Pitfalls of hybrid multi-cloud

In part two of this series, we'll look at the first of three pitfalls to avoid with hybrid multi-cloud. Namely, why cost is not always the obvious motivator when determining how to transition your business to the cloud.

This article is based on "[3 pitfalls everyone should avoid with hybrid multi-cloud][8]," a talk the authors will be giving at [Red Hat Summit 2018][9], which will be held May 8-10 in San Francisco. [Register by May 7][9] to save US$ 500 off of registration. Use discount code **OPEN18** on the payment page to apply the discount.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/pitfalls-hybrid-multi-cloud

作者：[Eric D.Schabell][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/eschabell
[1]:https://opensource.com/users/roelh
[3]:https://opensource.com/sites/default/files/u128651/multi-cloud.png (Multi-cloud)
[5]:https://opensource.com/sites/default/files/u128651/hybrid-cloud.png (Hybrid cloud)
[7]:https://opensource.com/sites/default/files/u128651/hybrid-multicloud.png (Hybrid multi-cloud)
[8]:https://agenda.summit.redhat.com/SessionDetail.aspx?id=153892
[9]:https://www.redhat.com/en/summit/2018
