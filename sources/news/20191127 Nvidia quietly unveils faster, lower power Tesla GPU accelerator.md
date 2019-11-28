[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Nvidia quietly unveils faster, lower power Tesla GPU accelerator)
[#]: via: (https://www.networkworld.com/article/3482097/nvidia-quietly-unveils-faster-lower-power-tesla-gpu-accelerator.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Nvidia quietly unveils faster, lower power Tesla GPU accelerator
======
Nvidia has upgraded its Volta line of Tesla GPU-accelerator cards to work faster using the same power as its old model.
client

Nvidia was all over Supercomputing 19 last week, not surprisingly, and made a lot of news which we will get into later. But overlooked was perhaps the most interesting news of all: a new generation graphics-acceleration card that is faster and way more power efficient.

Multiple attendees and news sites spotted it at the show, and Nvidia confirmed to me that this is indeed a new card. Nvidia’s “Volta” generation of Tesla GPU-accelerator cards has been out since 2017, so an upgrade was well overdue.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][1]

The V100S comes only in PCI Express 3 form factor for now but is expected to eventually support Nvidia’s SXM2 interface. SXM is a dual-slot card design by Nvidia that requires no connection to the power supply, unlike the PCIe cards. SXM2 allows the GPU to communicate either with each other or to the CPU through Nvidia’s NVLink, a high-bandwidth, energy-efficient interconnect that can transfer data up to ten times faster than PCIe.

[][2]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][2]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

With this card, Nvidia is claiming 16.4 single-precision TFLOPS, 8.2 double-precision TFLOPS, and Tensor Core performance of up to 130 TFLOPS. That is only a 4-to-5 percent improvement over the V100 SXM2 design, but 16-to-17 percent faster than the PCIe V100 variant.

Memory capacity remains at 32GB but Nvidia added High Bandwidth Memory 2 (HBM2) to increase memory performance to 1,134GB/s, a 26 percent improvement over both PCIe and SXM2.

Now normally a performance boost would see a concurrent increase in power demand, but in this case, the power envelope for the PCIe card is 250 watts, same as the prior generation PCIe card. So this card delivers 16-to-17 percent more compute performance and 26 percent more memory bandwidth at the same power draw.

**Other News**

Nvidia made some other news at the conference:

  * A new reference design and ecosystem support for its GPU-accelerated Arm-based reference servers for high-performance computing. The company says it has support from HPE/Cray, Marvell, Fujitsu, and Ampere, the startup led by former Intel executive Renee James looking to build Arm-based server processors.
  * These companies will use Nvidia's reference design, which consists of hardware and software components, to build their own GPU-accelerated servers for everything from hyperscale cloud providers to high-performance storage and exascale supercomputing. The design also comes with CUDA-X, a special version of Nvidia’s CUDA GPU development language for Arm processors.
  * Launch of Nvidia Magnum IO suite of software designed to help data scientists and AI and high-performance-computing researchers process massive amounts of data in minutes rather than hours. It is optimized to eliminate storage and I/O bottlenecks to deliver up to 20x faster data processing for multi-server, multi-GPU computing nodes.
  * Nvidia and DDN, developer of AI and multicloud data management, announced a bundling of DDN’s A3ITM data management system with Nvidia’s DGX SuperPOD systems with so customers can deploy HPC infrastructure with minimal complexity and reduced timelines. The SuperPODs would also come with the new NVIDIA Magnum IO software stack.
  * DDN said that SuperPOD was able to be deployed within hours and a single appliance could scale all to 80 nodes.  Benchmarks over a variety of different deep-learning models showed that the DDN system could keep a DGXSuperPOD system fully saturated with data.



**Now see** [**10 of the world's fastest supercomputers**][3]

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3482097/nvidia-quietly-unveils-faster-lower-power-tesla-gpu-accelerator.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[3]: https://www.networkworld.com/article/3236875/embargo-10-of-the-worlds-fastest-supercomputers.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
