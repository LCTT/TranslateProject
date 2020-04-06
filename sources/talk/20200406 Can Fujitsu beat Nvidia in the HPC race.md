[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Can Fujitsu beat Nvidia in the HPC race?)
[#]: via: (https://www.networkworld.com/article/3535812/can-fujitsu-beat-nvidia-in-the-hpc-race.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Can Fujitsu beat Nvidia in the HPC race?
======
The Japanese electronics giant is making bold performance claims about its supercomputer processor.
Riken Advanced Institute for Computational Science

Arm processors on servers has gone from failed starts (Calxeda) to modest successes (ThunderX2) to real contenders (ThunderX3, Ampere). Now, details have emerged about Japanese IT giant Fujitsu’s Arm processor, which it claims will offer better HPC performance than Nvidia GPUs but at a lower power cost.

Fujitsu is developing the A64FX, a 48-core Arm8 derivative specifically engineered for high-performance computing (HPC). Rather than design general-purpose compute cores, Fujitsu has added compute engines specific to artificial intelligence, machine learning, and other technologies specific to the needs of HPC.

It will go in a new supercomputer called Fugaku, or [Post-K][1]. Post-K is a reference to the K supercomputer, at one time the fastest supercomputer in the world, that ran on custom Sparc chips before RIKEN Lab, where it was installed, pulled the plug.

**[ Read also: [How to plan a software-defined data-center network][2] ]**

Fujitsu has revealed some new details, and they are impressive. The design of the A64FX is a major departure from traditional design. Instead of the chiplet design of the AMD Epyc and some Xeons, it is a single monolithic design. More important, there are four chips of High Bandwidth Memory 2 (HBM2), an expensive but very fast memory used only in high-end systems, connected to the CPU. Two 8GB modules are placed on each side of the CPU.

Prototypes of the A64FX motherboard reveal it has no RAM DIMM sockets. An Intel or AMD motherboard will show up to a dozen memory DIMM sockets for each CPU but the A64FX motherboard has none. That’s because the A64FX has the HBM2 memory on the die for 32GB per CPU.

In HPC, memory bandwidth has been the bottleneck, and data intensive workloads like analytics, simulations, and machine learning are slowing them down. And much more power – up to 100 times as much – is used in moving data around in HPC than in actually processing it. So to achieve energy efficiency, data needs to move as little as possible.

So A64FX has a totally different design than your standard Arm or x86 chip. No system memory, just 32GB per processor of extremely fast memory directly connected to the chip via a high-speed interconnect instead of through a much slower memory bus. This will greatly reduce latency between CPU and memory and also reduce power because data doesn’t have to be moved in and out of memory sockets.

[][3]

The 48 cores of the A64FX function like a GPU in that they are connected by a very fast interconnect called Tofu, which was first used in the K supercomputer and has been advanced in the A64FX. Tofu is designed for energy efficiency and low latency. The A64FX is capable of 3Tflops of peak bandwidth while being 10 times more power efficient than a x86 processor.

A Fugaku prototype made the number-one spot on the [Green500][4] list, a list of the most energy efficient supercomputers published by the same group that does the Top500 supercomputer list, and that’s a prototype, not a finished design.

In [early benchmarks][5], Fujitsu claims to trounce the Xeon Platinum, Intel’s top of the line, and is competitive with Nvidia’s Volta line of HPC GPUs. However that’s not final silicon, and I always wait for third-party benchmarks.

So why should you care? Because Fujitsu struck a deal with Cray to make HPC servers using A64FX and sold under the Cray brand name. Cray has since [been bought out by HP Enterprise][6], so HPE will be peddling not one but two Arm-based servers, its more mainstream Project Moonshot servers, and A64FX.

And there is a long history of technologies starting in HPC and slowly mainstreaming, from GPU computing to liquid cooling to modular server design. There’s no reason the A64FX can’t go mainstream either and bring AI, ML, and other high-performance tasks to more than just supercomputing facilities.

The HBM2/no DIMMs is a massive twist on system memory, and I am really curious to see if Intel and AMD follow.

Join the Network World communities on [Facebook][7] and [LinkedIn][8] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3535812/can-fujitsu-beat-nvidia-in-the-hpc-race.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3389748/fujitsu-completes-design-of-exascale-supercomputer-promises-to-productize-it.html
[2]: https://www.networkworld.com/article/3284352/data-center/how-to-plan-a-software-defined-data-center-network.html
[3]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE22140&utm_content=sidebar (ITAAS and Corporate Storage Strategy)
[4]: https://www.top500.org/green500/lists/2019/11/
[5]: https://www.csm.ornl.gov/srt/conferences/Scala/2019/keynote_2.pdf
[6]: https://www.networkworld.com/article/3397087/with-cray-buy-hpe-rules-but-does-not-own-the-supercomputing-market.html
[7]: https://www.facebook.com/NetworkWorld/
[8]: https://www.linkedin.com/company/network-world
