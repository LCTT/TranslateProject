[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Intel unveils new 3D chip packaging design)
[#]: via: (https://www.networkworld.com/article/3408177/intel-unveils-new-3d-chip-packaging-design.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Intel unveils new 3D chip packaging design
======
Intel's new chip packaging design doesn't sound exciting, but it is important for server processor technology.
![Intel / Baks / Getty Images][1]

Intel has unveiled a new packaging innovation for creating 3D chip packages and multiple chip connections ahead of the Semicon West conference in San Francisco this week.

The company is detailing its Embedded Multi-Die Interconnect Bridge (EMIB) technologies and Foveros 3D chip packages. This may sound like very inside baseball and best suited for the propellerhead crowd, but hear me out.

**[ Also read: [What is quantum computing (and why enterprises should care)][2] ]**

Chip packaging has always played a critical role in semiconductors, and it’s getting more important as chipmakers such as Intel and AMD strain against the limits of [Moore’s Law][3]. The chip’s package is how the chip’s electrical signals and power are routed.

As we move to 3D stacking, advanced packaging techniques allow for more complex semiconductor designs and break previous limits. 3D stacking has become standard in NAND flash, with chips packing up to 96 layers.

CPU design is a little different. Even with process shrinks, chips are simply growing larger as more cores and more cache are added. This results in heat density and latency, as data has to be moved around the chip.

### AMD solves the problem, Intel plays catch-up

AMD, once again taking the lead, solved this problem with its Epyc server chips. Rather than making a monolithic 32-core piece of silicon the size of a half dollar, it broke things up into four “chiplets” with eight cores each and connected by a very high-speed interconnect. This allowed for more cores while controlling heat and electronics.

Intel did what it always does when AMD comes up with a new idea: It pooh-poohed it, then quietly adopted it (they did the same thing with multicore, 64-bit computing and on-CPU memory controllers). It is introducing what Intel calls co-EMIB. Co-EMIB, or Embedded Multi-die Interconnect Bridge, enables the connection of two or more Foveros (3D stacked chip) chiplets, just like Epyc.

**[ [Get certified as an Apple Technical Coordinator with this seven-part online course from PluralSight.][4] ]**

Foveros is already in production today in Intel’s Stratix 10 field programmable gate arrays (FPGAs), 8th Gen Intel Core processors with Radeon Graphics, and Intel’s forthcoming Lakefield hybrid CPU.

However, Co-EMIB and Foveros is a short-term solution. Long-term, Intel is working on Omni-Directional Interconnect (ODI). ODI uses both horizontal plane communications like Co-EMIB but also something called Through-Silicon Vias (TSVs) for 3D stacking.

Intel says TSVs offer lower resistance, which means more power, along with low latency, high-bandwidth paths between chips and the package substrate.

The problem with making TSVs is it’s a monumentally expensive manufacturing process that can add 30% to the wafer cost, and Intel isn’t going to eat that — customers are.

These are important support technologies that will help CPUs and FPGAs continue to make big leaps in performance, hopefully well beyond the 5-7% they’ve been averaging. It means a significant redesign of chip architecture and manufacturing.

As more data-intensive applications such as artificial intelligence (AI), machine learning (ML), and analytics dominate the data center, the pressure is on to increase performance — and the massive, monolithic chip design clearly was reaching its limit. Co-EMIB and ODI represent new designs to address those limits and keep up performance.

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3408177/intel-unveils-new-3d-chip-packaging-design.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/05/intel_cpu_chip_security_credit_intel_and_baks_gettyimages_1200x800-100796394-large.jpg
[2]: https://www.networkworld.com/article/3275367/what-s-quantum-computing-and-why-enterprises-need-to-care.html
[3]: https://en.wikipedia.org/wiki/Moore%27s_law
[4]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fapple-certified-technical-trainer-10-11
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
