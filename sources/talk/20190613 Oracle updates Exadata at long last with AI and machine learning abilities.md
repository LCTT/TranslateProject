[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Oracle updates Exadata at long last with AI and machine learning abilities)
[#]: via: (https://www.networkworld.com/article/3402559/oracle-updates-exadata-at-long-last-with-ai-and-machine-learning-abilities.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Oracle updates Exadata at long last with AI and machine learning abilities
======
Oracle to update the Oracle Exadata Database Machine X8 server line to include artificial intelligence (AI) and machine learning capabilities, plus support for hybrid cloud.
![Magdalena Petrova][1]

After a rather [long period of silence][2], Oracle announced an update to its server line, the Oracle Exadata Database Machine X8, which features hardware and software enhancements that include artificial intelligence (AI) and machine learning capabilities, as well as support for hybrid cloud.

Oracle acquired a hardware business nine years ago with the purchase of Sun Microsystems. It steadily whittled down the offerings, getting out of the commodity hardware business in favor of high-end mission-critical hardware. Whereas the Exalogic line is more of a general-purpose appliance running Oracle’s own version of Linux, Exadata is a purpose-built database server, and they really made some upgrades.

The Exadata X8 comes with the latest Intel Xeon Scalable processors and PCIe NVME flash technology to drive performance improvements, which Oracle promises a 60% increase in I/O throughput for all-Flash storage and a 25% increase in IOPS per storage server compared to Exadata X7. The X8 offers a 60% performance improvement over the previous generation for analytics with up to 560GB per second throughput. It can scan a 1TB table in under two seconds.

**[ Also read:[What is quantum computing (and why enterprises should care)][3] ]**

The company also enhanced the storage server to offload Oracle Database processing, and the X8 features 60% more cores and 40% higher capacity disk drives over the X7.

But the real enhancements come on the software side. With Exadata X8, Oracle introduces new machine-learning capabilities, such as Automatic Indexing, which continuously learns and tunes the database as usage patterns change. The Indexing technology originated with the Oracle Autonomous Database, the cloud-based software designed to automate management of Oracle databases.

And no, MySQL is not included in the stack. This is for Oracle databases only.

“We’re taking code from Autonomous Database and making it available on prem for our customers,” said Steve Zivanic, vice president for converged infrastructure at Oracle’s Cloud Business Group. “That enables companies rather than doing manual indexing for various Oracle databases to automate it with machine learning.”

In one test, it took a 15-year-old Netsuite database with over 9,000 indexes built up over the lifespan of the database, and in 24 hours, its AI indexer rebuilt the indexes with just 6,000, reducing storage space and greatly increasing performance of the database, since the number of indexes to search were smaller.

### Performance improvements with Exadata

Zivanic cited several examples of server consolidation done with Exadata but would not identify companies by name. He told of a large healthcare company that achieved a 10-fold performance improvement over IBM Power servers and consolidated 600 Power servers with 50 Exadata systems.

A financial services company replaced 4,000 Dell servers running Red Hat Linux and VMware with 100 Exadata systems running 6,000 production Oracle databases. Not only did it reduce its power footprint, but patching was down 99%. An unnamed retailer with 28 racks of hardware from five vendors went from installing 1,400 patches per year to 16 patches on four Exadata racks.

Because Oracle owns the entire stack, from hardware to OS to middleware and database, Exadata can roll all of its patch components – 640 in all – into a single bundle.

“The trend we’ve noticed is you see these [IT hardware] companies who try to maintain an erector set mentality,” said Zivanic. “And you have people saying why are we trying to build pods? Why don’t we buy finished goods and focus on our core competency rather than build erector sets?”

### Oracle Zero Data Loss Recovery Appliance X8 now available

Oracle also announced the availability of the Oracle Zero Data Loss Recovery Appliance X8, its database backup appliance, which offers up to 10 times faster data recovery of an Oracle Database than conventional data deduplication appliances while providing sub-second recoverability of all transactions.

The new Oracle Recovery Appliance X8 now features 30% larger capacity, nearly a petabyte in a single rack, for the same price, Oracle says.

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3402559/oracle-updates-exadata-at-long-last-with-ai-and-machine-learning-abilities.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://images.techhive.com/images/article/2017/03/vid-still-79-of-82-100714308-large.jpg
[2]: https://www.networkworld.com/article/3317564/is-oracles-silence-on-its-on-premises-servers-cause-for-concern.html
[3]: https://www.networkworld.com/article/3275367/what-s-quantum-computing-and-why-enterprises-need-to-care.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
