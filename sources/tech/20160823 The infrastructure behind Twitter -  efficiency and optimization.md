Eriwoon Start to translate this article
The infrastructure behind Twitter: efficiency and optimization
===========


In the past, we've published details about Finagle, Manhattan, and the summary of how we re-architected the site to be able to handle events like Castle in the Sky, the Super Bowl, 2014 World Cup, the global New Year's Eve celebration, among others. In this infrastructure series, we're focusing on the core infrastructure and components that run Twitter. We're also going to focus each blog on efforts surrounding scalability, reliability, and efficiency in a way that highlights the history of our infrastructure, challenges we've faced, lessons learned, upgrades made, and where we're heading.

### Data center efficiency

#### History

Twitter hardware and data centers are at the scale few technology companies ever reach. However, this was not accomplished without a few missteps along the way. Our uptime has matured through a combination of physical improvements and software-based changes.

During the period when the fail whale was prevalent, outages occurred due to software limitations, as well as physical failures at the hardware or infrastructure level. Failure domains existed in various definitions which had to be aggregated to determine the risk and required redundancy for services. As the business scaled in customers, services, media content, and global presence, the strategy evolved to efficiently and resiliently support the service.

#### Challenges

Software dependencies on bare metal were further dependant on our data centers' ability to operate and maintain uptime of power, fiber connectivity, and environment. These discrete physical failure domains had to be reviewed against the services distributed on the hardware to provide for fault tolerance.

The initial decision of which data center service provider to scale with was done when specialization in site selection, operation, and design was in its infancy. We began in a hosted provider then migrated to a colocation facility as we scaled. Early service interruptions occurred as result of equipment failures, data center design issues, maintenance issues, and human error. As a result, we continually iterated on the physical layer designs to increase the resiliency of the hardware and the data center operations.

The physical reasons for service interruptions were inclusive of hardware failures at the server component level, top of rack switch, and core switches. For example, during the initial evaluation of our customized servers, the hardware team determined the cost of the second power supply was not warranted given the low rate of failure of server power supplies — so they were removed from the design. The data center power topology provides redundancy through separate physical whips to the racks and requires the second power supply. Removal of the second power supply eliminated the redundant power path, leaving the hardware vulnerable to impact during distribution faults in the power system. To mitigate the impact of the single power supply, ATS units were required to be added at the rack level to allow a secondary path for power.

The layering of systems with diverse fiber paths, power sources, and physical domains continued to separate services from impacts at relatively small scale interruptions, thus improving resiliency.

#### Lessons learned and major technology upgrades, migrations, and adoptions

We learned to model dependencies between the physical failure domains, (i.e. building power and cooling, hardware, fiber) and the services distributed across them to better predict fault tolerance and drive improvements.

We added additional data centers providing regional diversity to mitigate risk from natural disaster and the ability to fail between regions when it was needed during major upgrades, deploys or incidents. The active-active operation of data centers provided for staged code deployment reducing overall impacts of code rollouts.

The efficiency of power use by the data centers has improved with expanding the operating ranges of the environmental envelope and designing the hardware for resiliency at the higher operating temperatures.

#### Future work

Our data centers continue to evolve in strategy and operation, providing for live changes to the operating network and hardware without interruption to the users. Our strategy will continue to focus on scale within the existing power and physical footprints through optimization and maintaining flexibility while driving efficiency in the coming years.

### Hardware efficiency

#### History and challenges

Our hardware engineering team was started to qualify and validate performance of off-the-shelf purchased hardware, and evolved into customization of hardware for cost and performance optimizations.

Procuring and consuming hardware at Twitter's scale comes with a unique set of challenges. In order to meet the demands of our internal customers, we initially started a program to qualify and ensure the quality of purchased hardware. The team was primarily focused on performance and reliability testing ensuring that systems could meet the demands. Running systematic tests to validate the behavior was predictable, and there were very few bugs introduced.

As we scaled our major workloads (Mesos, Hadoop, Manhattan, and MySQL) it became apparent the available market offerings didn't quite meet the needs. Off-the-shelf servers come with enterprise features, like raid controllers and hot swap power supplies. These components improve reliability at small scale, but often decrease performance and increase cost; for example some raid controllers interfered with the performance of SSDs and could be a third of the cost of the system.

At the time, we were a large user of mysql databases. Issues arose from both supply and performance of SAS media. The majority of deployments were 1u servers, and the total number of drives used plus a writeback cache could predict the performance of a system often time limited to a sustained 2000 sequential IOPS. In order to continue scaling this workload, we were stranding CPU cores and disk capacity to meet IOPS requirement. We were unable to find cost-effective solutions at this time.

As our volume of hardware reached a critical mass, it made sense to invest in a hardware engineering team for customized white box solutions with focus on reducing the capital expenses and increased performance metrics.

#### Major technology changes and adoption

We've made many transitions in our hardware technology stack. Below is a timeline for adoptions of new technology and internally developed platforms.

- 2012 - SSDs become the primary storage media for our MySQL and key/value databases.
- 2013 - Our first custom solution for Hadoop workloads is developed, and becomes our primary bulk storage solution.
- 2013 - Our custom solution is developed for Mesos, TFE, and cache workloads.
- 2014 - Our custom SSD key/value server completes development.
- 2015 - Our custom database solution is developed.
- 2016 - We developed GPU systems for inference and training of machine learning models.

#### Lessons learned

The objective of our Hardware Engineering team is to significantly reduce the capital expenditure and operating expenditure by making small tradeoffs that improve our TCO. Two generalizations can apply to reduce the cost of a server:

1. Removing the unused components
2. Improving utilization

Twitter's workload is divided into four main verticals: storage, compute, database, and gpu. Twitter defines requirements on a per vertical basis, allowing Hardware Engineering to produce a focused feature set for each. This approach allows us to optimize component selection where the equipment may go unused or underutilized. For example, our storage configuration has been designed specifically for Hadoop workloads and was delivered at a TCO reduction of 20% over the original OEM solution. At the same time, the design improved both the performance and reliability of the hardware. Similarly, for our compute vertical, the Hardware Engineering Team has improved the efficiency of these systems by removing unnecessary features.

There is a minimum overhead required to operate a server, and we quickly reached a point where it could no longer remove components to reduce cost. In the compute vertical specifically, we decided the best approach was to look at solutions that replaced multiple nodes with a single node, and rely on Aurora/Mesos to manage the capacity. We settled on a design that replaced two of our previous generation compute nodes with a single node.

Our design verification began with a series of rough benchmarks, and then progressed to a series of production load tests confirming a scaling factor of 2. Most of this improvement came from simply increasing the thread count of the CPU, but our testing confirmed a 20-50% improvement in our per thread performance. Additionally we saw a 25% increase in our per thread power efficiency, due to sharing the overhead of the server across more threads.

For the initial deployment, our monitoring showed a 1.5 replacement factor, which was well below the design goal. An examination of the performance data revealed there was a flawed assumption in the workload characteristics, and that it needed to be identified.

Our Hardware Engineering Team's initial action was to develop a model to predict the packing efficiency of the current Aurora job set into various hardware configurations. This model correctly predicted the scaling factor we were observing in the fleet, and suggested we were stranding cores due to unforeseen storage requirements. Additionally, the model predicted we would see a still improved scaling factor by changing the memory configuration as well.

Hardware configuration changes take time to implement, so Hardware Engineering identified a few large jobs and worked with our SRE teams to adjust the scheduling requirements to reduce the storage needs. These changes were quick to deploy, and resulted in an immediate improvement to a 1.85 scaling factor.

In order to address the situation permanently, we needed to adjust to configuration of the server. Simply expanding the installed memory and disk capacity resulted in a 20% improvement in the CPU core utilization, at a minimal cost increase. Hardware Engineering worked with our manufacturing partners to adjust the bill of materials for the initial shipments of these servers. Follow up observations confirmed a 2.4 scaling factor exceeding the target design.

### Migration from bare metal to mesos

Until 2012, running a service inside Twitter required hardware requisitions. Service owners had to find out and request the particular model or class of server, worry about your rack diversity, maintain scripts to deploy code, and manage dead hardware. There was essentially no "service discovery." When a web service needed to talk to the user service, it typically loaded up a YAML file containing all of the host IPs and ports of the user service and the service used that list (port reservations were tracked in a wiki page). As hardware died or was added, managing required editing and committing changes to the YAML file that would go out with the next deploy. Making changes in the caching tier meant many deploys over hours and days, adding a few hosts at a time and deploying in stages. Dealing with cache inconsistencies during the deploy was a common occurrence, since some hosts would be using the new list and some the old. It was possible to have a host running old code (because the box was temporarily down during the deploy) resulting in a flaky behavior with the site.

In 2012/2013, two things started to get adopted at Twitter: service discovery (via a zookeeper cluster and a library in the core module of Finagle) and Mesos (including our own scheduler framework on top of Mesos called Aurora, now an Apache project).

Service discovery no longer required static YAML host lists. A service either self-registered on startup or was automatically registered under mesos into a "serverset" (which is just a path to a list of znodes in zookeeper based on the role, environment, and service name). Any service that needed to talk to that service would just watch that path and get a live view of what servers were out there.

With Mesos/Aurora, instead of having a script (we were heavy users of Capistrano) that took a list of hosts, pushed binaries around and orchestrated a rolling restart, a service owner pushed the package into a service called "packer" (which is a service backed by HDFS), uploaded an aurora configuration that described the service (how many CPUs it needed, how much memory, how many instances needed, the command lines of all the tasks each instance should run) and Aurora would complete the deploy. It schedules instances on an available hosts, downloads the artifact from packer, registers it in service discovery, and launches it. If there are any failures (hardware dies, network fails, etc), Mesos/Aurora automatically reschedules the instance on another host.

#### Twitter's Private PaaS

Mesos/Aurora and Service Discovery in combination were revolutionary. There were many bugs and growing pains over the next few years and many hard lessons learned about distributed systems, but the fundamental design was sound. In the old world, the teams were constantly dealing with and thinking about hardware and its management. In the new world, the engineers only have to think about how best to configure their services and how much capacity to deploy. We were also able to radically improve the CPU utilization of Twitter's fleet over time, since generally each service that got their own bare metal hardware didn't fully utilize its resources and did a poor job of managing capacity. Mesos allows us to pack multiple services into a box without having to think about it, and adding capacity to a service is only requesting quota, changing one line of a config, and doing a deploy.

Within two years, most "stateless" services moved into Mesos. Some of the most important and largest services (including our user service and our ads serving system) were among the first to move. Being the largest, they saw the biggest benefit to their operational burden. This allowed them to reduce their operational burden.

We are continuously looking for ways to improve the efficiency and optimization of the infrastructure. As part of this, we regularly benchmark against public cloud providers and offerings to validate our TCO and performance expectations of the infrastructure. We also have a good presence in public cloud, and will continue to utilize the public cloud when it's the best available option. The next series of this post will mainly focus on the scale of our infrastructure.

Special thanks to Jennifer Fraser, David Barr, Geoff Papilion, Matt Singer, and Lam Dong for all their contributions to this blog post.





--------------------------------------------------------------------------------

via: https://blog.twitter.com/2016/the-infrastructure-behind-twitter-efficiency-and-optimization?utm_source=webopsweekly&utm_medium=email

作者：[mazdakh][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twitter.com/intent/user?screen_name=mazdakh
[1]: https://twitter.com/jenniferfraser
[2]: https://twitter.com/davebarr
[3]: https://twitter.com/gpapilion
[4]: https://twitter.com/lamdong







