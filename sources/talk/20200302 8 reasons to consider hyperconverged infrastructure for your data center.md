[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (8 reasons to consider hyperconverged infrastructure for your data center)
[#]: via: (https://www.networkworld.com/article/3530072/eight-reasons-to-consider-hyperconverged-infrastructure-for-your-data-center.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

8 reasons to consider hyperconverged infrastructure for your data center
======

Thinkstock

Demand for on-premises data center equipment is shrinking as organizations move workloads to the cloud. But on-prem is far from dead, and one segment that’s thriving is hyperconverged infrastructure ([HCI][1]).

HCI is a form of scale-out, software-integrated infrastructure that applies a modular approach to compute, network and storage capacity. Rather than silos with specialized hardware, HCI leverages distributed, horizontal blocks of commodity hardware and delivers a single-pane dashboard for reporting and management. Form factors vary: Enterprises can choose to deploy hardware-agnostic [hyperconvergence software][2] from vendors such as Nutanix and VMware, or an integrated HCI appliance from vendors such as HP Enterprise, Dell, Cisco, and Lenovo.

**Learn more about enterprise infrastructure trends**

  * [Making the right hyperconvergence choice: HCI hardware or software?][3]
  * [10 of the world's fastest supercomputers][4]
  * [NVMe over Fabrics creates data-center storage disruption][5]
  * [For enterprise storage, persistent memory is here to stay][6]



The market is growing fast. By 2023, Gartner projects 70% of enterprises will be running some form of hyperconverged infrastructure, up from less than 30% in 2019. And as HCI grows in popularity, cloud providers such as Amazon, Google and Microsoft are providing connections to on-prem HCI products for hybrid deployment and management.

So why is it so popular? Here are some of the top reasons.

### 1) Simplified design

A traditional data center design is comprised of separate storage silos with individual tiers of servers and specialized networking spanning the compute and storage silos. This worked in the pre-cloud era, but it’s too rigid for the cloud era. “It’s untenable for IT teams to take weeks or months to provision new infrastructure so the dev team can produce new apps and get to market quickly,” says Greg Smith, vice president of product marketing at Nutanix.

“HCI radically simplifies data center architectures and operations, reducing the time and expense of managing data and delivering apps,” he says.

### 2) Cloud integration

HCI software, such as from Nutanix or VMware, is deployed the same way in both a customer’s data center and cloud instances; it runs on bare metal instances in the cloud exactly the same as it does in a data center. HCI “is the best foundation for companies that want to build a hybrid cloud. They can deploy apps in their data center and meld it with a public cloud,” Smith says.

[][7]

“Because it’s the same on both ends, I can have one team manage an end-to-end hybrid cloud and with confidence that whatever apps run in my private cloud will also run in that public cloud environment,” he adds.

### 3) Ability to start small, grow large

“HCI allows you to consolidate compute, network, and storage into one box, and grow this solution quickly and easily without a lot of downtime,” says Tom Lockhart, IT systems manager with Hastings Prince Edward Public Health in Bellville, Ontario, Canada.

In a legacy approach, multiple pieces of hardware – a server, Fiber Channel switch, host-based adapters, and a hypervisor – have to be installed and configured separately. With hyperconvergence, everything is software-defined. HCI uses the storage in the server, and the software almost entirely auto-configures and detects the hardware, setting up the connections between compute, storage, and networking.

“Once we get in on a workload, [customers] typically have a pretty good experience. A few months later, they try another workload, then another, and they start to extend it out of their data center to remote sites,” says Chad Dunn, vice president of product management for HCI at Dell.

“They can start small and grow incrementally larger but also have a consistent operating model experience, whether they have 1,000 nodes or three nodes per site across 1,000 sites, whether they have 40 terabytes of data or 40 petabytes. They have consistent software updates where they don’t have to retrain their people because it’s the same toolset,” Dunn added.

### 4) Reduced footprint

By starting small, customers find they can reduce their hardware stack to just what they need, rather than overprovision excessive capacity. Moving away from the siloed approach also allows users to eliminate certain hardware.

Josh Goodall, automation engineer with steel fabricator USS-POSCO Industries, says his firm deployed HCI primarily for its ability to do stretched clusters, where the hardware cluster is in two physical locations but linked together. This is primarily for use as a backup, so if one site went down, the other can take over the workload. In the process, though, USS-POSCO got rid of a lot of expensive hardware and software. “We eliminated several CPU [software] licenses, we eliminated the SAN from other site, we didn’t need SRM [site recovery management] software, and we didn’t need Commvault licensing. We saved between $25,000 and $30,000 on annual license renewals,” Goodall says.

### 5) No special skills needed

To run a traditional three-tiered environment, companies need specialists in compute, storage, and networking. With HCI, a company can manage its environment with general technology consultants and staff rather than the more expensive specialists.

“HCI has empowered the storage generalist,” Smith says. “You don’t have to hire a storage expert, a network expert. Everyone has to have infrastructure, but they made the actual maintenance of infrastructure a lot easier than under a typical scenario, where a deep level of expertise is needed to manage under those three skill sets.”

Lockhart of Hastings Prince Edward Public Health says adding new compute/storage/networking is also much faster when compared to traditional infrastructure. “An upgrade to our server cluster was 20 minutes with no down time, versus hours of downtime with an interruption in service using the traditional method,” he says.

“Instead of concentrating on infrastructure, you can expand the amount of time and resources you spend on workloads, which adds value to your business. When you don’t have to worry about infrastructure, you can spend more time on things that add value to your clients,” Lockhart adds.

### 6) Faster disaster recovery

Key elements of hyperconvergence products are their backup, recovery, data protection, and data deduplication capabilities, plus analytics to examine it all. Disaster recovery components are managed from a single dashboard, and HCI monitors not only the on-premises storage but also cloud storage resources. With deduplication, compression rates as high as 55:1, and backups can be done in minutes.

USS-POSCO Industries is an HP Enterprise shop and uses HPE’s SimpliVity HCI software, which includes dedupe, backup, and recovery. Goodall says he gets about 12-15:1 compression on mixed workloads, and that has eliminated the need for third-party backup software.

More importantly, recovery timeframes have dropped. “The best recent example is a Windows update messed up a manufacturing line, and the error wasn’t realized for a few weeks. In about 30 minutes, I rolled through four weeks of backups, updated the system, rebooted and tested a 350GB system. Restoring just one backup would have been a multi-hour process,” Goodall says.

### 7) Hyperconvergence analytics

HCI products come with a considerable amount of analytics software to monitor workloads and find resource constraints. The monitoring software is consolidated into a single dashboard view of system performance, including negatively impacted performance.

Hastings recently had a problem with a Windows 7 migration, but the HCI model made it easy to get performance info. “It showed that workloads, depending on time of day, were running out of memory, and there was excessive CPU queuing and paging,” Lockhart says. “We had the entire [issue] written up in an hour. It was easy to determine where problems lie. It can take a lot longer without that single-pane-of-glass view.”

### 8) Less time managing network, storage resources

Goodall says he used to spend up to 50% of his time dealing with storage issues and backup matrixes. Now he spends maybe 20% of his time dealing with it and most of his time tackling and addressing legacy systems. And his apps are better performing under HCI. “We’ve had no issues with our SQL databases; if anything, we’ve seen huge performance gain due to the move to full SSDs [instead of hard disks] and the data dedupe, reducing reads and writes in the environment.”

Join the Network World communities on [Facebook][8] and [LinkedIn][9] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3530072/eight-reasons-to-consider-hyperconverged-infrastructure-for-your-data-center.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3207567/what-is-hyperconvergence.html?nsdr=true
[2]: https://www.networkworld.com/article/3318683/making-the-right-hyperconvergence-choice-hci-hardware-or-software.html
[3]: https://www.networkworld.com/article/3318683/making-the-right-hyperconvergence-choice-hci-hardware-or-software
[4]: https://www.networkworld.com/article/3236875/embargo-10-of-the-worlds-fastest-supercomputers.html#slide1
[5]: https://www.networkworld.com/article/3394296/nvme-over-fabrics-creates-data-center-storage-disruption.html
[6]: https://www.networkworld.com/article/3398988/for-enterprise-storage-persistent-memory-is-here-to-stay.html
[7]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[8]: https://www.facebook.com/NetworkWorld/
[9]: https://www.linkedin.com/company/network-world
