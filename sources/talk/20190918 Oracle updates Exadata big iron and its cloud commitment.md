[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Oracle updates Exadata big iron and its cloud commitment)
[#]: via: (https://www.networkworld.com/article/3439538/oracle-updates-exadata-big-iron-and-its-cloud-commitment.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Oracle updates Exadata big iron and its cloud commitment
======
Oracle sticks with Intel in its big new database server and plans a massive data center expansion.
Stephen Lawson

Oracle OpenWorld 2019 is the platform for countless software announcements, but since 2010 the company has been in the hardware business thanks to the Sun Microsystems purchase, and the company remains committed to delivering integrated hardware and software systems.

Proving the point, the company took the wraps off the Oracle Exadata X8M designed for acceleration of Oracle’s database applications, featuring new data analytics and business intelligence features along with Oracle's newfound religion on automation.

The new Exadata X8M server platform uses second-generation Xeon Scalable processors and Intel's Optane DC persistent memory to accelerate performance. That's a big win for Intel, which is seeing quite a bit of momentum for AMD's Epyc processor. And it's another win for Optane, which pretty much every server vendor supports.

**Read also: [AI boosts data center availability and efficiency][1]**

Beyond the chips, Exadata X8M comes with 100 gigabit remote direct memory access (RDMA) over Converged Ethernet (RoCE) to remove storage bottlenecks and dramatically increase performance for workloads such as Online Transaction Processing (OLTP), analytics, internet of things (IoT), fraud detection, and high-frequency trading.

RDMA pulls data directly from the database to persistent memory, bypassing the entire OS, I/O, and network software stacks, all of which adds lag and latency. Using RDMA to bypass software stacks also frees CPU resources on storage servers to execute more Smart Scan queries in support of analytics workloads.

The result is peak performance of 16 million SQL read IOPS, 2.5 times greater than the previous generation of hardware, the Exadata X8. By enabling remote I/O latencies below 19 microseconds, the Exadata X8M is more than 10 times faster than the Exadata X8.

Exadata X8M uses the same machine learning capabilities first introduced in the Exadata X8, including Automatic Indexing, which continuously learns and tunes the database as usage patterns change. Based on technology from Oracle Autonomous Database, the entire process is automatic and improves database performance while eliminating manual tuning.

**[ [Get certified as an Apple Technical Coordinator with this seven-part online course from PluralSight.][2] ]**

### Oracle's autonomous systems

Along with the new hardware, Oracle introduced the Autonomous OS, a rebranding and revision of its Oracle Linux, which is basically a hardened version of Red Hat Enterprise Linux. Autonomous Linux is essentially a managed version of Oracle Linux, with less need for admins to manage it.

Oracle started on this road two years ago with the Autonomous Database, which is self-tuning, self-scaling, and self-patching. Autonomous Linux uses Oracle OS Management Service, a cloud-based control plane that utilizes machine learning to perform automated tuning and patching without requiring human intervention or any downtime.

"Autonomous systems eliminate human labor," [said chairman and CTO Larry Ellison during his keynote][3]. "And when you eliminate human labor, you eliminate human error."

Ellison touted the financial savings received from needing fewer people, but he said there was one thing much more important than economic savings: eliminating human error.

"Eliminating human error in autonomous cars, you save tens of thousands of lives. If you eliminate human error, pilot error, if you will, in autonomous systems, you eliminate data theft. As far as I know it's the only way you can eliminate data theft. Clouds are complex. People make mistakes," he said.

### Expanding Oracle's Cloud

Oracle has lagged behind in data center buildout compared to Amazon Web Services (AWS), Microsoft, and Google, but Ellison announced plans to address that. The company intends to add 20 new cloud availability regions to the 16 it already has by the end of next year, covering all regions of the globe.

Unlike other hyperscale data center operators like AWS and Google, Oracle plans to use its own hardware in its data centers, running Oracle software. And with its on-premises Oracle Cloud at Customer software, there is full integration between on-prem and cloud.

Oracle needs this expansion because its lack of a large footprint was one reason cited for why it failed to land the Department of Defense JEDI contract, which it bitterly contested in a lawsuit against Amazon, the leading vendor for the $10 billion contract. The bids haven't even opened yet, and Oracle filed a lawsuit against the procurement process, which was dismissed by a judge in July. Everything else aside, Oracle was considered unlikely to get the bid because it didn't have the data center capacity to match AWS.

At OpenWorld, Oracle also announced a free tier for Oracle Cloud for anyone to try before they buy, essentially. Oracle Cloud Free Tier will include two Autonomous Databases, two compute VMs, two block volumes, 10GB of object storage, one load balancer, and several other features. Developers can build applications with any language or framework on top of Oracle Cloud Autonomous Database and Oracle Cloud Infrastructure.

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3439538/oracle-updates-exadata-big-iron-and-its-cloud-commitment.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3274654/ai-boosts-data-center-availability-efficiency.html
[2]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fapple-certified-technical-trainer-10-11
[3]: https://www.youtube.com/watch?v=nrDVITuNLso
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
