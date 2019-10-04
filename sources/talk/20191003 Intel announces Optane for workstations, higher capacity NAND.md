[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Intel announces Optane for workstations, higher capacity NAND)
[#]: via: (https://www.networkworld.com/article/3442718/intel-announces-optane-for-workstations-higher-capacity-nand.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Intel announces Optane for workstations, higher capacity NAND
======
The CPU maker is making a big push into memory, giving it competitive advantages over its rivals.
Intel

At its Memory and Storage Day 2019 in Seoul last week, Intel made several announcements concerning its Optane persistent storage as well as NAND flash capacity.

Optane is a new form of non-volatile memory from Intel that has the storage capacity of a solid state drive (SSD) but speed almost equal to DRAM. It sits between memory and storage to act as a large, fast cache. While some come in a PCI Express card design, the predominant design is DRAM memory sticks that plug into the motherboard. And they cost a fortune. A 512GB Optane stick will run you $8,000.

[See how AI can boost data-center availability and efficiency][1]

Intel announced a new generation of Optane memory codenamed "Alder Stream," which it said has a 50x lower failure rate than 3D NAND and also triples the transfers per second compared to the current generation of Optane on the market today.

**[ [Get certified as an Apple Technical Coordinator with this seven-part online course from PluralSight.][2] ]**

Up to now, Optane has only been available for the second-generation Intel Xeon Scalable processors, its newest server chips. But in one of the slides at the show, Intel announced Optane DCPMM for high-end workstations, running on Core i9 and Xeon CPUs used in workstations. There is a family of Xeon processors, mostly the E5 line, designed for workstations used in CAD and other performance-intensive engineering jobs.

Optane runs in three modes: App Direct mode, where it is used as persistent storage; Memory Mode, where it functions as DRAM; and Mixed Mode, where portions of the memory are partitioned for both use cases. In App Direct Mode it will considerably speed up disk writes, since no workstation doesn't come with an SSD as the boot drive any more, and that will undoubtedly increase app performance.

Advertisement

### Four- and five-level SSD cells

Also at the show the company showed off a new 96-layer quad-level cell (QLC) drive that is set to go into production in this quarter and ship next year. QLC drives have four storage bits per cell, whereas the majority of SSDs have three bits per cell.

Intel is bringing QLC drives to the market but is not stopping there. It announced penta-level cell (PLC), which has five bits per cell, and it plans to bring that out by next year. They will have to do some serious engineering magic because one of the shortcomings to QLC is its very low lifespan. A triple-level cell (TLC) has a lifespan 3,000 to 5,000 writes. After that the cell degrades and eventually becomes useless. A QLC cell has a lifespan of just 1,000 writes, so in a heavy I/O scenario it will die a lot faster.

Intel is also adding to the layers. When it became prohibitive to spread out transistors in a two dimensional pattern, memory makers turned to stacking, which is exactly what the name implies: Layers of memory are stacked like pancakes. Intel's QLC drives have 96 layers of memory and starting next year will go to 144 layers. The rest of the DRAM industry is aiming for 128 layers.

There is no doubt that Optane is a major competitive advantage for Intel and for which AMD has no answer. AMD has the core and performance lead, which is a lot easier gap to close. I wouldn't be surprised if AMD and Micron link arms to come out with a competitive response, but it won't be an overnight thing.

The flash memory is more dubious. I remain unsold on the viability of QLC because of its low write limit. Maybe the hyperscale-data-center operators have a high tolerance for hardware failure but enterprises do not, and they won't abide swapping out SSDs after a few months. Some serious benchmarking is in order before I'll be convinced of QLC's and PLC's viability.

Join the Network World communities on [Facebook][3] and [LinkedIn][4] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3442718/intel-announces-optane-for-workstations-higher-capacity-nand.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3274654/ai-boosts-data-center-availability-efficiency.html
[2]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fapple-certified-technical-trainer-10-11
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
