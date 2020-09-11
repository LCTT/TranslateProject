[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Intel unveils an epic response to AMD’s server push)
[#]: via: (https://www.networkworld.com/article/3386142/intel-unveils-an-epic-response-to-amds-server-push.html#tk.rss_all)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Intel unveils an epic response to AMD’s server push
======

### Intel introduced more than 50 new Xeon Scalable Processors for servers that cover a variety of workloads.

![Intel][1]

Intel on Tuesday introduced its second-generation Xeon Scalable Processors for servers, developed under the codename Cascade Lake, and it’s clear AMD has lit a fire under a once complacent company.

These new Xeon SP processors max out at 28 cores and 56 threads, a bit shy of AMD’s Epyc server processors with 32 cores and 64 threads, but independent benchmarks are still to come, which may show Intel having a lead at single core performance.

And for absolute overkill, there is the Xeon SP Platinum 9200 Series, which sports 56 cores and 112 threads. It will also require up to 400W of power, more than twice what the high-end Xeons usually consume.

**[ Now read:[What is quantum computing (and why enterprises should care)][2] ]**

The new processors were unveiled at a big event at Intel’s headquarters in Santa Clara, California, and live-streamed on the web. [Newly minted CEO][3] Bob Swan kicked off the event, saying the new processors were the “first truly data-centric portfolio for our customers.”

“For the last several years, we have embarked on a journey to transform from a PC-centric company to a data-centric computing company and build the silicon processors with our partners to help our customers prosper and grow in an increasingly data-centric world,” he added.

He also said the move to a data-centric world isn’t just CPUs, but a suite of accelerant technologies, including the [Agilex FPGA processors][4], Optane memory, and more.

This launch is the largest Xeon launch in the company’s history, with more than 50 processor designs across the Xeon 8200 and 9200 lines. While something like that can lead to confusion, many of these are specific to certain workloads instead of general-purpose processors.

**[[Get certified as an Apple Technical Coordinator with this seven-part online course from PluralSight.][5] ]**

Cascade Lake chips are the replacement for the previous Skylake platform, and the mainstream Cascade Lake chips have the same architecture as the Purley motherboard used by Skylake. Like the current Xeon Scalable processors, they have up to 28 cores with up to 38.5 MB of L3 cache, but speeds and feeds have been bumped up.

The Cascade Lake generation supports the new UPI (Ultra Path Interface) high-speed interconnect, up to six memory channels, AVX-512 support, and up to 48 PCIe lanes. Memory capacity has been doubled, from 768GB to 1.5TB of memory per socket. They work in the same socket as Purley motherboards and are built on a 14nm manufacturing process.

Some of the new Xeons, however, can access up to 4.5TB of memory per processor: 1.5TB of memory and 3TB of Optane memory, the new persistent memory that sits between DRAM and NAND flash memory and acts as a massive cache for both.

## Built-in fixes for Meltdown and Spectre vulnerabilities

Most important, though, is that these new Xeons have built-in fixes for the Meltdown and Spectre vulnerabilities. There are existing fixes for the exploits, but they have the effect of reducing performance, which varies based on workload. Intel showed a slide at the event that shows the company is using a combination of firmware and software mitigation.

New features also include Intel Deep Learning Boost (DL Boost), a technology developed to accelerate vector computing that Intel said makes this the first CPU with built-in inference acceleration for AI workloads. It works with the AVX-512 extension, which should make it ideal for machine learning scenarios.

Most of the new Xeons are available now, except for the 9200 Platinum, which is coming in the next few months. Many Intel partners – Dell, Cray, Cisco, Supermicro – all have new products, with Supermicro launching more than 100 new products built around Cascade Lake.

## Intel also rolls out Xeon D-1600 series processors

In addition to its hot rod Xeons, Intel also rolled out the Xeon D-1600 series processors, a low power variant based on a completely different architecture. Xeon D-1600 series processors are designed for space and/or power constrained environments, such as edge network devices and base stations.

Along with the new Xeons and FPGA chips, Intel also announced the Intel Ethernet 800 series adapter, which supports 25, 50 and 100 Gigabit transfer speeds.

Thank you, AMD. This is what competition looks like.

Join the Network World communities on [Facebook][6] and [LinkedIn][7] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3386142/intel-unveils-an-epic-response-to-amds-server-push.html#tk.rss_all

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/04/intel-xeon-family-1-100792811-large.jpg
[2]: https://www.networkworld.com/article/3275367/what-s-quantum-computing-and-why-enterprises-need-to-care.html
[3]: https://www.networkworld.com/article/3336921/intel-promotes-swan-to-ceo-bumps-off-itanium-and-eyes-mellanox.html
[4]: https://www.networkworld.com/article/3386158/intels-agilex-fpga-family-targets-data-intensive-workloads.html
[5]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fapple-certified-technical-trainer-10-11
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world
