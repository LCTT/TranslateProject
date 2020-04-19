[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Ethernet consortium announces completion of 800GbE spec)
[#]: via: (https://www.networkworld.com/article/3538529/ethernet-consortium-announces-completion-of-800gbe-spec.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Ethernet consortium announces completion of 800GbE spec
======
The specification for 800GbE doubles the maximum speed of the current Ethernet standard, but also tweaks other aspects including latency.
Martyn Williams/IDGNS

The industry-backed Ethernet Technology Consortium has announced the completion of a specification for 800 Gigabit Ethernet technology.

Based on many of the technologies used in the current top-end 400 Gigabit Ethernet protocol, the new spec is formally known as 800GBASE-R. The consortium that designed it (then known as the 25 Gigabit Ethernet Consortium) was also instrumental in developing the 25, 50, and 100 Gigabit Ethernet protocols and includes Broadcom, Cisco, Google, and Microsoft among its members.

**[ Now see [the hidden cause of slow internet and how to fix it][1].]**

The 800GbE spec adds new media access control (MAC) and physical coding sublayer (PCS) methods, which tweaks these functions to distribute data across eight physical lanes running at a native 106.25Gbps. (A lane can be a copper twisted pair or in optical cables, a strand of fiber or a wavelength.)  The 800GBASE-R specification is built on two 400 GbE 2xClause PCSs to create a single MAC which operates at a combined 800Gbps.

And while the focus is on eight 106.25G lanes, it's not locked in. It is possible to run 16 lanes at half the speed, or 53.125Gbps.

The new standard offers half the latency of 400G Ethernet specification, but the new spec also cuts the forward error correction (FEC) overhead on networks running at 50 Gbps, 100 Gbps, and 200 Gbps by half, thus reducing the packet-processing load on the NIC.

By lowering latency this will feed the need for speed in latency-sensitive applications like [high-performance computing][2] and artificial intelligence, where lots of data needs to be moved around as fast as possible.

[][3]

Doubling from 400G to 800G wasn’t too great of a technological leap. It meant adding more lanes at the same transfer rate, with a few tweaks. But breaking a terabit, something Cisco and other networking firms have been talking about for a decade, will require a significant reworking of the technology and won’t be an easy fix.

It likely won’t be cheap, either. 800G works with existing hardware and 400GbE switches are not cheap, running as high as six figures. Moving past the terabit barrier with a major revision to the technology will likely be even more expensive. But for hyperscalers and HPC customers, that’s par for the course.

The ETC didn’t say when to expect new hardware supporting the 800G, but given its modest change to existing specs, it could appear this year, assuming the pandemic-induced shutdown doesn’t throw a monkey wrench into plans.

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3538529/ethernet-consortium-announces-completion-of-800gbe-spec.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3107744/internet/the-hidden-cause-of-slow-internet-and-how-to-fix-it.html
[2]: https://www.networkworld.com/article/3444399/high-performance-computing-do-you-need-it.html
[3]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE22140&utm_content=sidebar (ITAAS and Corporate Storage Strategy)
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
