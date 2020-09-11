[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Google Cloud bare-metal initiative targets migrating legacy apps from on-prem)
[#]: via: (https://www.networkworld.com/article/3487626/google-cloud-bare-metal-initiative-targets-migrating-legacy-apps-from-on-prem.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Google Cloud bare-metal initiative targets migrating legacy apps from on-prem
======
Google Cloud now offers Google Bare Metal Solution, a service that supplies hardware in the cloud for enterprises that want full control of the entire stack from operating system on up to their most important legacy apps.
Google

In the cloud-services market, [bare metal offerings][1] have lagged behind virtualized ones, mostly because the use of the cloud for things like elastic apps and developer environments are better suited to instances with a native operating system.

The term “bare metal” simply means no software of any kind, not even a [hypervisor][2]. Customers provide their own operating environments, and the provider offers nothing more than CPUs, memory, and storage. Up to now, IBM has led the charge with bare-metal services because SoftLayer, the major data-center provider it acquired in 2014, was heavily involved in that business.

Now Google Cloud is going after that market, especially targeting “lift and shift” of an entire operating environment – OS, hypervisor, apps, and data -- from on-premises data centers to the cloud.

[][3]

BrandPost Sponsored by HPE

[HPE Synergy For Dummies][3]

Here’s how IT can provide an anytime, anywhere, any workload infrastructure.

Google [recently announced][4] the Google Bare Metal Solution for legacy applications that must run on dedicated hardware and have strict hardware certification requirements, as well as dedicated, low-latency and highly resilient interconnects, and connections to all native Google Cloud services.

Bare Metal Solution uses OEM hardware that is certified for many ISV software applications as well as custom-built applications, with Oracle Database the one commercial software product specifically named. The hardware is a bit of a mystery, since Google, like most hyperscale data-center operators, uses off-brand hardware from Gigabyte, Inspur, and Supermicro, but it’s usually hardware from HPE, Dell, and Lenovo that gets those kinds of certifications. Not that the white-box brands don’t have it, but it’s usually not as much of a priority for them.

These hardware configurations are offered as a subscription, billed monthly with a preferred term length of 36 months, which means they want you to stick around a while. There are no data ingress and egress charges between Bare Metal Solution and Google Cloud in the same region, however for now, Bare Metal Solutions are only available in East Coast data centers.

Moving an Oracle database to the cloud isn’t trivial. If the database stretches into the petabytes, that could get very expensive. Not to mention Oracle is doing its darnedest to keep that business by making it easier for customers to migrate their databases into Oracle’s cloud infrastructure.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][5]

Storage comes in 1TB increments, either a mix of HDD and SSD or all-flash. As for the rest of the configurations:

Dual-socket x86 systems

  * 16 core with 384 GB DRAM
  * 24 core with 768 GB DRAM
  * 56 core with 1536 GB DRAM



Quad-socket x86 systems

  * 56 core with 1536 GB DRAM
  * 112 core with 3072 GB DRAM



Other benefits of the service are:

  * End-to-end infrastructure management such as compute, storage and networking, as well as fully managed and monitored environments such as power, cooling and facilities.
  * Support for infrastructure, including defined SLAs for initial response; 24X7 coverage for all Priority 1 and 2 issues; unified billing across Google Cloud and Bare Metal Solution.
  * Enterprise-grade SLAs for hardware uptime and interconnect availability.



Bare metal has its appeal but caveats, too. The allure of the cloud is its bursty elasticity. Many on-prem apps are used to running all out for much if not all of the day. In a cloud setting that can get expensive in a hurry, so it’s up to IT staff to decide if it’s a good idea to migrate an Oracle database to the cloud. If it's serving up reads and writes constantly, any savings from moving it off premises will be immediately offset by paying to run it at high utilization in the cloud.

Join the Network World communities on [Facebook][6] and [LinkedIn][7] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3487626/google-cloud-bare-metal-initiative-targets-migrating-legacy-apps-from-on-prem.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3261113/why-a-bare-metal-cloud-provider-might-be-just-what-you-need.html
[2]: https://www.networkworld.com/article/3243262/what-is-a-hypervisor.html
[3]: https://www.networkworld.com/article/3399618/hpe-synergy-for-dummies.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE19718&utm_content=sidebar (HPE Synergy For Dummies)
[4]: https://cloud.google.com/blog/products/gcp/bare-metal-solution-enabling-specialized-workloads-in-google-cloud
[5]: https://www.networkworld.com/newsletters/signup.html
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world
