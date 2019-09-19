[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Oracle Unleashes World’s Fastest Database Machine ‘Exadata X8M’)
[#]: via: (https://opensourceforu.com/2019/09/oracle-unleashes-worlds-fastest-database-machine-exadata-x8m/)
[#]: author: (Longjam Dineshwori https://opensourceforu.com/author/dineshwori-longjam/)

Oracle Unleashes World’s Fastest Database Machine ‘Exadata X8M’
======

  * _**Exadata X8M is the first database machine with integrated persistent memory and RoCE**_
  * _**Oracle also announced availability of Oracle Zero Data Loss Recovery Appliance X8M (ZDLRA)**_



![][1]

Oracle has released its new Exadata Database Machine X8M with an aim to set a new bar in the database infrastructure market.

Exadata X8M combines Intel Optane DC persistent memory and 100 gigabit remote direct memory access (RDMA) over Converged Ethernet (RoCE) to remove storage bottlenecks and dramatically increase performance for the most demanding workloads such as Online Transaction Processing (OLTP), analytics, IoT, fraud detection and high frequency trading.

“With Exadata X8M, we deliver in-memory performance with all the benefits of shared storage for both OLTP and analytics,” said Juan Loaiza, executive vice president, mission-critical database technologies, Oracle.

“Reducing response times by an order of magnitude using direct database access to shared persistent memory accelerates every OLTP application and is a game changer for applications that need real-time access to large amounts of data such as fraud detection and personalized shopping,” the official added.

**What’s unique about it?**

Oracle Exadata X8M uses RDMA directly from the database to access persistent memory in smart storage servers, bypassing the entire OS, IO and network software stacks. This results in lower latency and higher throughput. Using RDMA to bypass software stacks also frees CPU resources on storage servers to execute more Smart Scan queries in support of analytics workloads.

**No More Storage Bottlenecks**

“High-performance OLTP applications require a demanding mixture of high Input/Output Operations Per Second (IOPS) with low latency. Direct database access to shared persistent memory increases peak performance to 16 million SQL read IOPS, 2.5X greater than the industry leading Exadata X8,” Oracle said in a statement.

Additionally, Exadata X8M dramatically reduces the latency of critical database IOs by enabling remote IO latencies below 19 microseconds – more than 10X faster than the Exadata X8. These ultra-low latencies are achieved even for workloads requiring millions of IOs per second.

**More Efficient Better than AWS and Azure**

The company claimed that compared to the fastest Amazon RDS storage for Oracle, Exadata X8M delivers up to 50X lower latency, 200X more IOPS and 15X more capacity.

Compared to Azure SQL Database Service storage, it says, Exadata X8M delivers 100X lower latency, 150X more IOPS and 300X more capacity.

According to oracle, a single rack Exadata X8M delivers up to 2X the OLTP read IOPS, 3X the throughput and 5X lower latency than shared storage systems with persistent memory such as a single rack of Dell EMC PowerMax 8000.

“By simultaneously supporting faster OLTP queries and greater throughput for analytics workloads, Exadata X8M is the ideal platform on which to converge mixed-workload environments to decrease IT costs and complexity,” it said.

**Oracle Zero Data Loss Recovery Appliance X8**

Oracle today also announced availability of Oracle Zero Data Loss Recovery Appliance X8M (ZDLRA), which uses new 100Gb RoCE for high throughput internal data transfers between compute and storage servers.

Exadata and ZDLRA customers can now choose between RoCE or InfiniBand-based Engineered Systems for optimal flexibility in their architectural deployments.

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/09/oracle-unleashes-worlds-fastest-database-machine-exadata-x8m/

作者：[Longjam Dineshwori][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/dineshwori-longjam/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/02/Oracle-Cloud.jpg?resize=350%2C212&ssl=1
