[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (MemVerge ships software-defined persistent memory software)
[#]: via: (https://www.networkworld.com/article/3575845/memverge-ships-software-defined-persistent-memory-software.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

MemVerge ships software-defined persistent memory software
======
Memory Machine does in-memory virtualization and memory snapshots using DRAM and Optane in combination.
Intel

Big Memory software startup MemVerge launched its Memory Machine software designed to t[urn DRAM and Intel Optane persistent memory into a software-defined memory pool][1], bringing DRAM performance to persistent memory (PMEM).

For some use cases, [SSDs][2] just aren’t fast enough. “Despite all the great advances in storage, the latency difference between memory and storage remains at more than three orders of magnitude, making this data movement inefficient,” said Alper Ilkbahar, vice president and general manager of the memory and storage product group at Intel in a conference call with MemVerge.

Moore’s Law slowing down and DRAM speed can’t keep up with computational power as well as the growth of the data we’re experiencing in data centers, creating significant cost and performance bottlenecks in computing today, he added.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][3]

“If we only had the fast data problem, where the data needs to processed in real time but not in great amounts, then you can have in-memory apps running in DRAM to address this problem,” said Chares Fan, CEO of MemVerge on the conference call.

“But we are living in a world that’s entering an era of big and fast data where both the quantity and velocity of data are increasing at the same time. That’s opening a gap in terms of what infrastructure is needed to address this stuff where DRAM is not big enough and storage is not fast enough,” Fan added.

Intel’s Optane persistent memory is designed to address that. It has the persistent storage of SSDs but almost the speed of DRAM. Functionally, it sits between DRAM and storage and acts as a cache. With a setting change, it can enter full blown DRAM mode and run at DRAM speed but without persistence.

Memory Machine lets admins build virtual machines with a DRAM-to-PMEM ratio for optimal performance. Current Xeon-based servers can access up to 1.5TB of DRAM and 3TB of PMEM, meaning 9TB of memory in a standard two-socket system.

MemVerge said the Memory Machine offers the benefits of high-performance DRAM along with lower-cost and persistent memory, where software-defined pools of DRAM and persistent memory can be deployed like a traditional virtual machine but entirely in memory.

Once DRAM and PMEM are virtualized, Memory Machine makes PMEM appear as DRAM to the system, allowing any application to work with the pool of memory and think it is running in memory when in fact it is writing to a storage unit.

The advanced version of Memory Machine has a feature called ZeroIO, which allows for taking snapshots of the virtual memory once every minute. If there is a failure or crash, the system reloads the virtual image from the snapshot rather than SSD, resulting in recoveries in seconds or minutes instead of hours.

Memory Manage will be available from MemVerge this week. Optane is only available on the newest generation of Intel processors.

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3575845/memverge-ships-software-defined-persistent-memory-software.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3389358/startup-memverge-combines-dram-and-optane-into-massive-memory-pool.html
[2]: https://www.networkworld.com/article/3326058/what-is-an-ssd.html
[3]: https://www.networkworld.com/newsletters/signup.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
