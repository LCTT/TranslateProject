[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What to know before upgrading to Windows Server 2019)
[#]: via: (https://www.networkworld.com/article/3512020/what-to-know-before-upgrading-from-windows-server-2016-to-server-2019.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

What to know before upgrading to Windows Server 2019
======
Even though it’s only been one refresh cycle, the changes to the latest version of Windows Server are considerable. Microsoft makes the process of upgrading from Windows Server 2016 easy.
Getty Images/Microsoft

IT generally requires a good reason to disrupt a smooth working environment, which is why some hardware sits deployed for decades. Even though Windows Server 2016 is relatively young, there’s a decent argument to be made for upgrading a Server 2016 environment to [Server 2019][1], the most recent release.

There’s a longer span between Windows Server releases than the desktop version of the software because of slower migration habits on the server side, and this means bigger changes between releases. Windows Server 2016 was the first server OS built on the Windows 10 kernel, and some of the changes were rather rough. Windows Server 2019 is markedly faster, and it has a number of changes under the hood, from security to hybrid cloud integration. Here’s a rundown of what’s new and what are the most compelling arguments for upgrade.

**SEE ALSO:** [Top 6 features in Windows Server 2019][1]

### In-place Windows Server 2019 upgrades

For a long as the desktop version of Windows has been on the market, it has allowed users the option to upgrade over the existing OS installation and migrate all apps. Microsoft aggressively pushed updates from Windows 7 and 8 to Windows 10.

[][2]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][2]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

Windows Server, though, has not had that option until now. You either got Windows Server with new hardware, or did a clean installation, where you install on a blank server or overwrite an existing operating system. And because Server 2019 is built on the 2016 code base, app compatibility is maintained.

Windows Server 2019 has the option of upgrading old installations, all the way back to Server 2012. This way you can maintain your installation configurations, settings, Active Directory, server roles, and so forth. Server 2019 also has Cluster OS Rolling Upgrade, which enables an administrator to upgrade the operating system of the cluster nodes from Windows Server 2012 R2 and Windows Server 2016 without stopping the Hyper-V or the Scale-Out File Server workloads.

Advertisement

“The first thing customers should look at is if in-place OS upgrades work for them or a clean install works,” says Arpan Shah, general manager of Azure at Microsoft. “The hardware requirements have not changed from Server 2016 to 2019, which is why an in-place upgrade is possible.”

The dividing line, Shah says, is whether customers might keep and upgrade their servers or refresh the hardware. When they are changing hardware, then they would do a clean install. If a customer is not planning on new hardware, then they should evaluate an in-place upgrade.

But Philip Elder, co-owner of MPECS, a consultancy that specializes in high availability solutions and Microsoft MVP, is a little leery of the upgrade process. “With an in-place upgrade I inherit all the baggage that OS has. Am I completely guaranteed it will run down the road and have no issues? If not, then no [to an upgrade],” he says.

Elder says the speed of Server 2019 is 75% to 80% faster with the same resources assigned to virtual machines over Server 2016. It does not matter the configuration of the virtual machine or what resources it uses, "everything on 2016 takes longer," he says.

### Better security and patching with Windows Server 2019

Shah says Microsoft’s top investment in 2019 is security. Some noteworthy areas of improvement and new features include:

  * Windows Defender ATP agent
  * New Shielded VM improvements
  * Virtual network encryption
  * System Guard Runtime Monitor



Windows Defender Advanced Threat Protection (ATP) has been significantly upgraded to provide visibility into memory and kernel-level attacker activities and the ability to take actions on compromised machines. Defender not only detects and blocks ransomeware but also restores files and data in case of a ransomware attack.

Shielded VM was introduced in Server 2016 and has undergone considerable revision. It allows virtual machines such as domain controllers to be encrypted when they are on disk to prevent attackers from gaining access to the virtual disks. The Active Directory-based attestation for the host guardian service is being deprecated in favor of a host key attestation mechanism, which is easier to configure.

Virtual network encryption works with Shielded VMs to protect network data that is in motion around the network so it can’t be snooped or manipulated.

System Guard Runtime Monitor is a new security system that was part of the Fall 2018 Windows 10 Creator’s Update. In it, Microsoft reorganized all of the system integrity features into a single runtime built into the core of Windows 10 itself. It provides kernel-level process protection as well as supports hardware-rooted security, such as virtualization-based security to mitigate attacks at the VM level.

Elder adds there is a “huge improvement” in patching over 2016. “There are some issues with patching in 2016 and as a result, patching in 2016 takes a huge amount of time. Every role and feature in ‘19 relative to ‘16 patching speed is exponentially faster in comparison, and so far the patches are actually smaller,” he says.

Server 2019 also rolls in changes for x86 security flaws like Meltdown and Spectre. There was a fix for it in Server 2016 but wasn’t very good, says Elder. “The initial 2016 fixes were very painful. We had a lot of blue screens. In 2019 they have been relatively smooth,” he says.

### Storage, Kubernetes and Linux

Server 2016 Datacenter saw the introduction of Storage Spaces Direct (S2D), a distributed data storage system that allows the local disks of several servers to be organized into fault-tolerant and scalable storage that is protected from disk and server failure. But it had limits. For starters, data deduplication would not work on the Resilient File Systems (ReFS). Server 2019 integrates the two for much greater performance.

Server 2019 also has a new feature called Storage Migration Service, which allows you to migrate storage systems from as far back as Windows Server 2003 as well as a variety of *nix operating systems (Unix and Linux) in a very seamless manner.

The Storage Migration Service runs on Windows Server 2019 and acts as an orchestrator for the inventory, transfer, and cutover phases of the migration process. It transfers data, shares, configurations, security, file attributes, and share permissions on nodes that you choose to migrate.

Server 2019 also features much improved support for Kubernetes to deploy and scale containers. Server 2016 had Kubernetes support as an add-on, but this is native. Containers are as much as 75% smaller from the previous version, according to Shah.

Server 2019 now supports running Ubuntu, Red Hat Enterprise Linux, and SUSE Linux Enterprise Server inside shielded virtual machines. In addition, Linux VMs are now supported for shielded VM protection.

### Azure Stack HCI

Microsoft released [Azure Stack][3] after Server 2016, so this is the first version to natively support it. Azure Stack allows customers to run an Azure-like cloud environment on their own hardware, basically giving them an Azure environment within the confines of their firewall. At the same time, Azure Stack is fully integrated with the Azure service, and you can move apps between the two.

A part of the Azure Stack product line is Azure Stack HCI, a hyperconverged Windows Server 2019 cluster that uses validated hardware to run virtualized workloads on-premises with the option to use Azure services for cloud-based backup, site-recovery, and more.

Azure Stack HCI solutions use Microsoft-validated hardware to ensure optimal performance and reliability (translation: HPE, Dell, and Lenovo) and includes support for technologies such as NVMe drives, persistent memory, and remote-direct memory access (RDMA) networking.

Elder says Azure Stack HCI “is exponentially better in 2019 performance-wise and is significantly faster. The difference in health monitoring systems capabilities is black and white because it’s not there in 2016.”

### Windows Server 2019 highlights

Other features new to Server 2019 include:

[System Insights][4]: This feature brings local predictive analytics capabilities native to Windows Server. By analyzing Windows Server system data, the goal is to enable greater automation of server operations and help reduce the operational expenses associated with reactively managing Windows Server instances.

Unified Management: Windows Admin Center is a browser-based HCI remote management interface that includes software-defined network configuration and monitoring.

Storage class memory: Server 2019 includes support for new generation of server hardware including storage class memory, which drastically improves performance for server applications. 

[Cluster-wide monitoring][5]: This feature monitors memory and CPU usage, storage capacity, IOPS, throughput, and latency in real time with clear alerts when something’s not right.

[Software Defined Networking (SDN) support][5]: Server 2019 adds the ability to manage and monitor virtual networks and subnets, connect virtual machines to virtual networks, and monitor SDN infrastructure. SDN provides a method to centrally configure and manage physical and virtual network devices. Also, Windows Server 2019 now supports IPv6 and dual stack IPv4/IPv6 addressing as well. Server 2016 did not support IPv6, just IPv4.

[Persistent memory support][6]: Supports Intel’s Optane persistent memory, which is basically a SSD with near-DRAM speeds. Server 2019 provides byte-level access to non-volatile media while also reducing the latency of storing or retrieving data significantly.

"There’s no reason to hold off," Elder says. "Anyone that wants to migrate their workloads should, especially the Server 2008 folks."

**More about enterprise infrastructure:**

  * [For enterprise storage, persistent memory is here to stay][7]
  * [Top 6 features in Windows Server 2019][1]
  * [High performance computing: Do you need it?][8]
  * [NVMe over Fabrics creates data-center storage disruption][9]
  * [SSD vs. HDD: Choosing between solid-state and hard-disk drives][10]



Join the Network World communities on [Facebook][11] and [LinkedIn][12] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3512020/what-to-know-before-upgrading-from-windows-server-2016-to-server-2019.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3265052/top-6-features-in-windows-server-2019.html
[2]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[3]: https://www.networkworld.com/article/3208029/azure-stack-microsoft-s-private-cloud-platform-and-what-it-pros-need-to-know-about-it.html
[4]: https://cloudblogs.microsoft.com/windowsserver/2018/06/19/introducing-windows-server-system-insights/
[5]: https://docs.microsoft.com/en-us/windows-server/manage/windows-admin-center/use/manage-hyper-converged
[6]: https://docs.microsoft.com/en-us/windows-server/storage/storage-spaces/deploy-pmem
[7]: https://www.networkworld.com/article/3398988/for-enterprise-storage-persistent-memory-is-here-to-stay.html
[8]: https://www.networkworld.com/article/3444399/high-performance-computing-do-you-need-it.html
[9]: https://www.networkworld.com/article/3394296/nvme-over-fabrics-creates-data-center-storage-disruption.html
[10]: https://www.networkworld.com/article/3482988/ssd-vs-hdd-how-to-choose-between-solid-state-drives-and-hard-disk-drives.html
[11]: https://www.facebook.com/NetworkWorld/
[12]: https://www.linkedin.com/company/network-world
