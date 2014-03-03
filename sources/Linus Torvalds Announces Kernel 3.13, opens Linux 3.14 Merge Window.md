>> Translating by ThomazL
Linus Torvalds Announces Kernel 3.13, opens Linux 3.14 Merge Window
================================================================================
Linux Kernel 3.13 has been released. However, it must be noted that the final release doesn’t bring in anything new except for a few fixes and the patch from rc8 is fairly small in size as it has a small number of architecture updates including those for ARM, PowerPC, x86, SPARC and driver updates including GPU and networking.

![](http://www.efytimes.com/admin/useradmin/photo/Z82K112446AM1212014.jpeg)

The prominent changes include: nftables, the successor of iptables, a revamp of the block layer designed for high-performance SSDs, a power capping framework to cap power consumption in Intel RAPL devices, improved squashfs performance, AMD Radeon power management enabled by default and automatic AMD Radeon GPU switching, improved NUMA and hugepage performance , TCP Fast Open enabled by default, support for NFC payments, support for the high-availability Seamless Redundancy protocol, new drivers and many other small improvements.

### A scalable block layer for high performance SSD storage ###

This release includes a new design for the Linux block layer, based on two levels of queues: one level of per-CPU queues for submitting IO, which then funnel down into a second level of hardware submission queues. Experiments shown that this design can achieve many millions of IOs per second, leveraging the new capabilities of NVM-Express or high-end PCI-E devices and multicore CPUs, while still providing the common interface and convenience features of the block layer.

### nftables, the successor of iptables ###

There are new iptables/iptables utilities that translate iptables rules to nftables bytecode, and it is also possible to use and add new xtable modules. As a bonus, these new utilities provide features that weren't possible with the old iptables design: notification for changes in tables/chains, better incremental rule update support, and the ability to enable/disable the chains per table. The new nft utility has a improved syntax. 

### Radeon: power management enabled by default, automatic GPU switching, R9 290X Hawaii support ###

The power management support provides improved power consumption, which is critical for battery powered devices, but it is also a requirement to provide good high-end performance, as it provides the ability to reclock to GPU to higher power states in GPUs and APUs that default to slower clock speeds.

### Power capping framework ###

This release includes a framework designed around the Intel RAPL (Running Average Power Limit) that allow to set power consumption limits to devices that support it.

### Support for the Intel Many Integrated Core Architecture ###

This release adds support for the Intel Many Integrated Core Architecture or MIC, a multiprocessor computer architecture incorporating earlier work on the Larrabee many core architecture, the Teraflops Research Chip multicore chip research project, and the Intel Single-chip Cloud Computer multicore microprocessor.

### Improved performance in NUMA systems ###

This release includes many of such policies that attempt to put a process near its memory, and can handle cases such as shared pages between processes or transparent huge pages. New sysctls have been added to enable/disable and tune the NUMA scheduling.

### Improved page table access scalability in hugepage workloads ###

This release uses finer grained locking improving the page table access scalability in threaded hugepage workloads. For more details, see the recommended LWN article.

### Squashfs performance improved ###

Squashfs, the read-only filesystem used by most live distributions, installers, and some embedded Linux distributions, has got important improvements that dramatically increase performance in workloads with multiple parallel reads.

### Applications can cap the rate computed by network transport layer ###

This release adds a new socket option, SO_MAX_PACING_RATE, which offers applications the ability to cap the rate computed by transport layer. It has been designed as a bufferbloat mechanism to avoid buffers getting filled up with packets, but it can also be used to limit the transmission rate in applications.

### TCP Fast Open enabled by default ###

Optimisation to the process of stablishing a TCP connection that allows the elimination of one round time trip from certain kinds of TCP conversation, which can improve the load speed of web pages

### NFC payments support ###

This release implements support for the Secure Element. A netlink API is available to enable, disable and discover NFC attached (embedded or UICC ones) secure elements. With some userspace help, this allows to support NFC payments, used to implement financial transactions.

Support for the High-availability Seamless Redundancy protocol

It is suited for applications that demand high availability and very short reaction time.

Features Courtesy [http://kernelnewbies.org/Linux_3.13][1]

--------------------------------------------------------------------------------

via: http://www.efytimes.com/e1/fullnews.asp?edid=127445

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://kernelnewbies.org/Linux_3.13
