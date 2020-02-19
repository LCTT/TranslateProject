[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (IBM consolidates storage products under a single brand)
[#]: via: (https://www.networkworld.com/article/3527219/ibm-consolidates-storage-products-under-a-single-brand.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

IBM consolidates storage products under a single brand
======
Big Blue is the latest to pare down multiple storage products under one umbrella, after HPE did it last summer.
[Quest Software][1]

IBM says it is consolidating its Storwize and the Flash Systems lines of storage products under a single family, the FlashSystem, that will span from entry level to advanced. It also announced a trio of all-flash storage products, spanning a range of use cases.

Eric Herzog, chief marketing officer and vice president of worldwide storage channels for IBM storage, made the announcing in a pair of blog posts [here][2] and [here][3]. He noted that different organizations have different requirements for storage, and that storage vendors have traditionally responded with unique storage platforms to meet them

[[Get regularly scheduled insights by signing up for Network World newsletters.]][4]

But with that uniqueness comes complexity: different management and troubleshooting, different APIs and automation, different paths to cloud, and more. Because of this, all related storage costs are among the [top concerns][5] of storage users.

“These concerns can delay deployment of new storage technologies, limit flexibility, impact your applications and workloads, and drive up costs,” he wrote.

He's got a point. Every storage provider has multiple lines to serve different customers. Dell EMC has the most, with five storage product families thanks to the EMC merger, Hitachi Vantara has three and NetApp and Pure Storage have two. HPE could be accused of having four, but it has been working to consolidate its many storage products (3Par, Nimble) under the Primera product line [announced][6] last summer.

It should be noted that this does not impact IBM’s line of mainframe storage products. That remains unchanged.

IBM promises the new FlashSystem family will offer 99.9999 percent availability, full hardware redundancies, and two-site or three-site replication as well as seamless hybrid- and multi-cloud support and integration with full security.

[][7]

IBM is making some big claims around its new products. It boasts that the new FlashSystem 9200 offers three to four times the performance and 17 times the rack density of the current A9000, but at 40% to 60% lower price tag, depending on configuration.

The new FlashSystems can deliver up to 18 million IOPS, with latency down to 70μs and bandwidth up to 45GB/sec from a single unit. That is a big leap over the older FlashSystem A9000R, which delivers up to 2.4 million IOPS with 250μs latency and up to 26GB/sec.

Another new product, the FlashSystem 7200, offers end-to-end NVMe storage for enterprise-class [hybrid cloud][8] and [multicloud][9] functionality in mid-range systems and replaces the Storwize V7000. The FlashSystem 7200 offers 43% greater performance and 55% better throughput.

The new storage systems will use IBM’s Spectrum Virtualize software, like the old systems. That means things like two- and three-site replication for [disaster recovery][10], support for VMware, Kubernetes, Red Hat OpenShift and the Container Storage Interface, and Ansible playbook orchestration. FlashSystems are monitored by IBM Storage Insights service, which receives telemetry from all IBM storage systems and uses AI to monitor the systems and try to automatically fix problems whenever possible.

IBM plans to make the new FlashSystem products available in March. It will sell the older Storwize and FlashSystem products through the end of the year.

Join the Network World communities on [Facebook][11] and [LinkedIn][12] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3527219/ibm-consolidates-storage-products-under-a-single-brand.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.quest.com/whitepaper/storage-switzerland-paper-on-qorestor8134538/
[2]: https://www.ibm.com/blogs/systems/storage-made-simple-hybrid-multicloud/#_ftn1
[3]: https://www.ibm.com/blogs/systems/storage-made-simple-hybrid-multicloud-2/
[4]: https://www.networkworld.com/newsletters/signup.html
[5]: https://www.esg-global.com/research/esg-master-survey-results-2019-data-storage-trends
[6]: https://www.networkworld.com/article/3405583/hpe-promises-100-reliability-with-its-new-storage-system.html
[7]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[8]: http://www.networkworld.com/cms/article/V
[9]: https://www.networkworld.com/article/3252775/multicloud-mania-what-to-know.html
[10]: https://www.networkworld.com/article/3411457/what-is-disaster-recovery-how-to-ensure-business-continuity.html
[11]: https://www.facebook.com/NetworkWorld/
[12]: https://www.linkedin.com/company/network-world
