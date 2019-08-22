[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Startup MemVerge combines DRAM and Optane into massive memory pool)
[#]: via: (https://www.networkworld.com/article/3389358/startup-memverge-combines-dram-and-optane-into-massive-memory-pool.html#tk.rss_all)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Startup MemVerge combines DRAM and Optane into massive memory pool
======
MemVerge bridges two technologies that are already a bridge.
![monsitj / Getty Images][1]

A startup called MemVerge has announced software to combine regular DRAM with Intel’s Optane DIMM persistent memory into a single clustered storage pool and without requiring any changes to applications.

MemVerge has been working with Intel in developing this new hardware platform for close to two years. It offers what it calls a Memory-Converged Infrastructure (MCI) to allow existing apps to use Optane DC persistent memory. It's architected to integrate seamlessly with existing applications.

**[ Read also:[Mass data fragmentation requires a storage rethink][2] ]**

Optane memory is designed to sit between high-speed memory and [solid-state drives][3] (SSDs) and acts as a cache for the SSD, since it has speed comparable to DRAM but SSD persistence. With Intel’s new Xeon Scalable processors, this can make up to 4.5TB of memory available to a processor.

Optane runs in one of two modes: Memory Mode and App Direct Mode. In Memory Mode, the Optane memory functions like regular memory and is not persistent. In App Direct Mode, it functions as the SSD cache but apps don’t natively support it. They need to be tweaked to function properly in Optane memory.

As it was explained to me, apps aren’t designed for persistent storage because the data is already in memory on powerup rather than having to load it from storage. So, the app has to know memory doesn’t go away and that it does not need to shuffle data back and forth between storage and memory. Therefore, apps natively don’t work in persistent memory.

### Why didn't Intel think of this?

All of which really begs a question I can’t get answered, at least not immediately: Why didn’t Intel think of this when it created Optane in the first place?

MemVerge has what it calls Distributed Memory Objects (DMO) hypervisor technology to provide a logical convergence layer to run data-intensive workloads at memory speed with guaranteed data consistency across multiple systems. This allows Optane memory to process and derive insights from the enormous amounts of data in real time.

That’s because MemVerge’s technology makes random access as fast as sequential access. Normally, random access is slower than sequential because of all the jumping around with random access vs. reading one sequential file. But MemVerge can handle many small files as fast as it handles one large file.

MemVerge itself is actually software, with a single API for both DRAM and Optane. It’s also available via a hyperconverged server appliance that comes with 2 Cascade Lake processors, up to 512 GB DRAM, 6TB of Optane memory, and 360TB of NVMe physical storage capacity.

However, all of this is still vapor. MemVerge doesn’t expect to ship a beta product until at least June.

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3389358/startup-memverge-combines-dram-and-optane-into-massive-memory-pool.html#tk.rss_all

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/02/big_data_center_server_racks_storage_binary_analytics_by_monsitj_gettyimages-951389152_3x2-100787358-large.jpg
[2]: https://www.networkworld.com/article/3323580/mass-data-fragmentation-requires-a-storage-rethink.html
[3]: https://www.networkworld.com/article/3326058/what-is-an-ssd.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
