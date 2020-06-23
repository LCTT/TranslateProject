[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Intel unveils third-generation Xeon Scalable processors)
[#]: via: (https://www.networkworld.com/article/3563556/intel-unveils-third-generation-xeon-scalable-processors.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Intel unveils third-generation Xeon Scalable processors
======
Aimed at HPC and AI, the chips come with new instructions and high-speed interconnects well beyond the previous generation.
[Intel][1]

Intel formally unveiled the third generation of its Xeon Scalable processor family, developed under the codename "Cooper Lake." This generation is aimed at the high end of the performance line for functions such as high-performance computing (HPC) and artificial intelligence (AI).

The Cooper Lake line is targeted at four- and eight-socket servers. Xeons based on the Ice Lake architecture are due later this year and will target one- and two-socket servers. The latest announcement includes 11 new SKUs with between 16 and 28 cores, running at up to 3.1 Ghz base clock (and up to 4.3 Ghz with Turbo Boost), plus support for up to six memory channels.

**READ MORE:** [Data center sales dip amid COVID-19 fallout, but public cloud grows][2]

Supermicro and Lenovo are the first system makers to announce servers that are optimized for the new Intel processors, and HPE and Dell are sure to follow.

Much was already known about Cooper Lake, particularly as pertains to the bfloat16 instructions for AI. (See related story, [Intel reshuffles Xeon lineup][3]). So I won't repeat what has already been said.

Beyond bfloat16, Intel has boosted inter-chip communication via UPI (Ultra Path Interconnect). UPI is used to connect multiple CPUs together to act as one system. In the previous generation of Xeon Scalable, called Cascade Lake, the top-end processors each had three UPI links running at 10.4 gigatransfers per second (GT/s).

Cooper Lake has six UPI links also running at 10.4 GT/s. The links can only connect to three other CPUs, just like the prior generation of processors. But the bandwidth is doubled, so CPU-to-CPU connections run 20.8 GT/s.

Another change to Cooper Lake is Intel added support for DDR4-3200, the fastest memory on the market, with the caveat of supporting only one DIMM per channel. Support for DDR4-3200 technically gives the system a boost from 23.46 GB/s per channel to 25.60 GB/s, around a 9% boost. Cooper Lake also upped total memory support from 1TB to 1.125 TB of memory.

### Stratix 10 NX launched

Cooper Lake isn't the only chip launched this week. Intel also introduced the Stratix 10 NX, its first AI-optimized FPGA, featuring expanded AI Tensor blocks, integrated HBM memory, and high bandwidth networking.

By optimizing for efficient tensor pipelines, Intel could put 15 times more AI compute into the same footprint as the DPS-based Stratix 10 MX, said David Moore, corporate vice president and general manager, programmable solutions group, Data Platforms Group at Intel, in a media pre-briefing. Other features for AI include High Bandwidth Memory (HBM) and up to 57.8 Gig PAM4 network transceivers for pooling multiple chips.

"The most disruptive trend that has emerged is the exponential increase in AI model size and complexity," Moore said in the briefing. "What we're seeing is AI model complexity is doubling about every three and a half months or 10x per year. So it's heading to tens of billions of parameters and beyond in the largest and next generation transformer models such as BERT and GPT."

### Optane Gen2

Cooper Lake will also support Intel's second generation of Optane DC Persistent Memory, code-named Barlow Pass. The Optane 200 series capacities are the same as the 100 series – it's available in 128GB, 256GB, and 512GB modules – and it runs at the same speed, DDR4-2666.

But Intel claims that this new generation of Optane offers a 25% improvement in memory bandwidth over the previous generation, thanks to a new Optane controller on the memory and software optimization. The new Optane 200 controller also encrypts memory contents to protect it from being compromised by malicious code.

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3563556/intel-unveils-third-generation-xeon-scalable-processors.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.intel.com
[2]: https://www.networkworld.com/article/3562580/covi-19-fallout-q-1-enterprise-data-center-sales-dip-but-public-cloud-grows.html
[3]: https://www.networkworld.com/article/3533449/intel-reshuffles-xeon-lineup.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
