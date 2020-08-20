[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (IBM details next-gen POWER10 processor)
[#]: via: (https://www.networkworld.com/article/3571415/ibm-details-next-gen-power10-processor.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

IBM details next-gen POWER10 processor
======
New CPU is optimized for enterprise hybrid cloud and AI inferencing, and it features a new technology for creating petabyte-scale memory clusters.
IBM

IBM on Monday took the wraps off its latest POWER RISC CPU family, optimized for enterprise hybrid-cloud computing and artificial intelligence (AI) inferencing, along with a number of other improvements.

Power is the last of the Unix processors from the 1990s, when Sun Microsystems, HP, SGI, and IBM all had competing Unixes and RISC processors to go with them. Unix gave way to Linux and RISC gave way to x86, but IBM holds on.

This is IBM's first 7-nanometer processor, and IBM claims it will deliver an up-to-three-times improvement in capacity and processor energy efficiency within the same power envelope as its POWER9 predecessor. The processor comes in a 15-core design (actually 16-cores but one is not used) and allows for single or dual chip models, so IBM can put two processors in the same form factor. Each core can have up to eight threads, and each socket supports up to 4TB of memory.

More interesting is a new memory clustering technology called Memory Inception. This form of clustering allows the system to view memory in another physical server as though it were its own. So instead of putting a lot of memory in each box, servers can literally borrow from their neighbors when there is a spike in demand for memory. Or admins can set up one big server with lots of memory in the middle of a cluster and surround it with low-memory servers that can borrow memory as needed from the high capacity server.

All of this is done with a latency of 50 to 100 nanoseconds. "This has been a holy grail of the industry for a while now," said William Starke, a distinguished engineer with IBM, on a video conference in advance of the announcement. "Instead of putting a lot of memory in each box, when we have a spike demand for memory I can borrow from my neighbors."

POWER10 uses something called Open Memory Interfaces (OMI), so the server can use DDR4 now and be upgraded to DDR5 when it hits the market, and it can also use GDDR6 memory used in GPUs. In theory, POWER10 will come with 1TB/sec of memory bandwidth and 1TB/sec of SMP of bandwidth.

The POWER10 processor has quadruple the number of AES encryption engines per core compared to the POWER9. This enables several security enhancements. First, it means full memory encryption without degradation of performance, so no intruder can scan the contents of memory.

Second, it enables hardware and software security for containers to provide isolation. This is designed to address new security considerations associated with the higher density of containers. If a container were to be compromised, the POWER10 processor is designed to be able to prevent other containers in the same virtual machine from being affected by the same intrusion.

Finally, the POWER10 offers in-core AI business inferencing. It achieves this through on-chip support for bfloat16 for training as well as INT8 and INT4, which are commonly used in AI inferencing. This will allow transactional workloads to add AI inferencing in their apps. IBM says the AI inferencing in POWER10 is 20 times that of POWER9.

Not mentioned in the announcement is operating system support. POWER runs AIX, IBM's flavor of Unix, as well as Linux. That's not too surprising since the news is coming at Hot Chips, the annual semiconductor conference held every year at Stanford University. Hot Chips is focused on the latest chip advances, so software is usually left out.

IBM generally announces new POWER processors about a year in advance of release, so there is plenty of time for an AIX update.

Join the Network World communities on [Facebook][1] and [LinkedIn][2] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3571415/ibm-details-next-gen-power10-processor.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.facebook.com/NetworkWorld/
[2]: https://www.linkedin.com/company/network-world
