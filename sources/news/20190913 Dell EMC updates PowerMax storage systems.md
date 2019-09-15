[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Dell EMC updates PowerMax storage systems)
[#]: via: (https://www.networkworld.com/article/3438325/dell-emc-updates-powermax-storage-systems.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Dell EMC updates PowerMax storage systems
======
Dell EMC's new PowerMax enterprise storage systems add support for Intel Optane drives and NVMe over Fabric.
Getty Images/Dell EMC

Dell EMC has updated its PowerMax line of enterprise storage systems to offer Intel’s Optane persistent storage and NVMe-over-Fabric, both of which will give the PowerMax a big boost in performance.

Last year, Dell launched the PowerMax line with high-performance storage, specifically targeting industries that need very low latency and high resiliency, such as banking, healthcare, and cloud service providers.

The company claims the new PowerMax is the first-to-market with dual port Intel Optane SSDs and the use of storage-class memory (SCM) as persistent storage. The Optane is a new type of non-volatile storage that sits between SSDs and memory. It has the persistence of a SSD but almost the speed of a DRAM. Optane storage also has a ridiculous price tag. For example, a 512 GB stick costs nearly $8,000.

**[ Read also: [Mass data fragmentation requires a storage rethink][1] | Get regularly scheduled insights: [Sign up for Network World newsletters][2] ]**

The other big change is support for NVMe-oF, which allows SSDs to talk directly to each other via Fibre Channel rather than making multiple hops through the network. PowerMax already supports NVMe SSDs, but this update adds end-to-end NVMe support.

The coupling of NVMe and Intel Optane on dual port gives the new PowerMax systems up to 15 million IOPS, a 50% improvement over the previous generation released just one year ago, with up to 50% better response times and twice the bandwidth. Response time is under 100 microseconds.

In addition, the new Dell EMC PowerMax systems are validated for Dell Technologies Cloud, an architecture designed to bridge multi-cloud deployments. Dell offers connections between private clouds and Amazon Web Services (AWS), Microsoft Azure, and Google Cloud.

PowerMax comes with a built-in machine learning engine for predictive analytics and pattern recognition to automatically place data on the correct media type, SCM or Flash, based on its I/O profile. PowerMax analyzes and forecasts 40 million data sets in real time, driving 6 billion decisions per day.

It also has several important software integrations. The first is VMware’s vRealize Orchestrator (vRO) plug-in, which allows customers to develop end-to-end automation routines, including provisioning, data protection, and host operations.

Second, it has pre-built Red Hat Ansible modules to allow customers to create Playbooks for storage provisioning, snapshots, and data management workflows for consistent and automated operations. These modules are available on GitHub now.

Finally, there is a container storage interface (CSI) plugin that provisions and manages storage for workloads running on Kubernetes. The CSI plugin, available now on GitHub, extends PowerMax's performance and data services to a growing number of applications built on a micro-services-based architecture.

The new PowerMax systems and PowerBricks will be available Monday, Sept.16.

Join the Network World communities on [Facebook][3] and [LinkedIn][4] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3438325/dell-emc-updates-powermax-storage-systems.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3323580/mass-data-fragmentation-requires-a-storage-rethink.html
[2]: https://www.networkworld.com/newsletters/signup.html
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
