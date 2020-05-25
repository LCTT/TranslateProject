[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Lenovo doubles down on AMD support, adds liquid GPU cooling)
[#]: via: (https://www.networkworld.com/article/3544972/lenovo-doubles-down-on-amd-support-adds-liquid-gpu-cooling.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Lenovo doubles down on AMD support, adds liquid GPU cooling
======
Two announcements from Lenovo reflect a push into the lucrative high-performance computing market.
Nvidia

Last year, Lenovo Data Center Group (DCG) [announced][1] single-socket ThinkSystem servers using the AMD Rome generation, which has up to 64 cores per processor. Dual-socket systems are de rigueur in enterprise servers, but that's because those processors have just 20-odd cores. AMD's pitch, which Lenovo and its competitors embraced, was that it could offer more compute in a one-socket, 64-core processor than two 22-core processors, and for less money.

This year Lenovo DGC is following up that launch with the 1U ThinkSystem SR645 and 2U ThinkSystem SR665 two-socket servers, featuring enhanced performance and I/O connectivity for higher performance workloads. With 128 cores/256 threads in a 1U/2U design, a whole lot of computation power can be squeezed into a small space.

Lenovo is targeting industries that need dense computation, like financial services, retail, and manufacturing.

"Our new Lenovo ThinkSystem servers are designed for workloads such as in-memory databases, advanced analytics, virtualization, and AI," said Kamran Amini, vice president and general manager of server, storage and software defined infrastructure at the Lenovo DCG, in a statement. "With the exceptional power, speed and onboard storage of these new servers, our customers have the ability to handle the increasing data requirements of today's workloads with the scalability to grow with their business."

The ThinkSystem SR645 and SR665 servers feature PCI Express 4, which doubles I/O bandwidth from Gen 3, something essential for I/O intensive applications. It supports up to eight Nvidia T4 cards used in applications like video analytics and inference solutions for artificial intelligence. They can also hold a lot of data, with up to 40 2.5-inch drives or up to 32 NVMe SSD drives despite their low profile, making them ideal for a software-defined storage configuration.

They also are available via Lenovo's TruScale pay-per-use program, which allows enterprises to rent the servers rather than acquire them outright and pay for what they use.

### Adding liquid cooling to GPUs

Lenovo has had a liquid cooling initiative called [Neptune][2] for about two years now, focused mostly on CPU cooling. However, as part of Nvidia's launch of the Ampere A100 GPU, Lenovo is adding support for liquid cooling of Nvidia's latest GPU.

Lenovo is collaborating with Nvidia to use its Neptune cooling on the HGX A100 4-GPU with NVLink baseboard. The HGX A100 is a small board that plugs into a server's PCI Express slot and functions as a GPU accelerator, with four A100 Ampere generation chips normally sporting a heat sink. Supermicro is the [first out of the gate][3] with HGX products, but other server vendors are expected to follow.

The HGX A100 board comes with passive cooling, meaning heat sinks without fans. It relies on the fans of the chassis to cool them. That could be a little risky; GPUs run hot. The A100 has a thermal design power (TDP) of 400 watts, which is double that of Intel's top-of-the-line Xeon Platinum 8180 server processor. Now imagine four boards crammed onto a space that's a little bit larger than a smartphone. You could probably cook s'mores over that.

So Lenovo plans to offer Neptune liquid cooling to Nvidia's new GPUs – both the four-way card and the eight-way card. The company says it will bring these solutions to market later this year.

In a [blog post][4] announcing the Nvidia partnership, Scott Tease, general manager of HPC &amp; AI at Lenovo's DCG, noted the advances in technology over 12 years. "What took nearly 300 racks of floor space, 3,000 servers and $100M to achieve the petaFLOPS barrier in 2008, will be achieved in just a half of a rack of our latest Lenovo Neptune liquid-cooled servers supporting the latest NVIDIA A100 Tensor Core GPUs," Tease wrote.

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3544972/lenovo-doubles-down-on-amd-support-adds-liquid-gpu-cooling.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3538469/amd-introduces-high-performance-epyc-processors.html
[2]: https://www.networkworld.com/article/3283228/lenovo-announces-hybrid-liquid-cooling-system-neptune.html
[3]: https://www.supermicro.com/en/products/a100
[4]: https://www.lenovoxperience.com/newsDetail/283yi044hzgcdv7snkrmmx9o9zkcir8ndf9xe50mf6iu8c77
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
