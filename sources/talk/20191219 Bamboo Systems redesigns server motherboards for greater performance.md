[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Bamboo Systems redesigns server motherboards for greater performance)
[#]: via: (https://www.networkworld.com/article/3490385/bamboo-systems-redesigns-server-motherboards-for-greater-performance.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Bamboo Systems redesigns server motherboards for greater performance
======
Bamboo Systems, formerly Kaleao, claims its motherboard architecture is more power efficient than traditional designs that cater to x86 processors.
Thinkstock

UK chip designer Kaleao has re-launched as Bamboo Systems with some pre-Series A funding and claims its [Arm][1]-based server chips will be considerably more power efficient than the competition.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][2]

Bamboo is targeting x86 servers, which have a 95% market share, unlike Marvell with its [ThunderX2][3] and Ampere Systems with its [eMAG Arm processors][4]. The company argues that the two Arm processors are no different than x86.

“Marvell and Ampere are chip manufacturers that have built a chip to pretty much slot into the motherboard and chassis configuration that an Intel/AMD chip would fit into. They are therefore going head on against Intel/AMD as chip manufacturers – and history is showing, not creating a sustainable solution for the OEMs,” says John Goodacre, co-founder and chief scientific officer of Bamboo. 

[][5]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][5]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

The motherboard is changed, but the CPU and software layer are not. Currently the company is in the prototype stage. Its server is based on Samsung Arm Cortex-A57 design, so the CPU itself is not changed. Even though they have essentially thrown out traditional motherboard design, Goodacre said the software is fully compatible and will run unchanged. So Linux and Arm-based apps will all run.

Goodacre, a 17-year veteran of Arm and researcher at the University of Manchester working on exascale research projects, said just putting more cores in a die in a workstation designed system isn’t the most power efficient way to build scale out power efficient servers.

“We realized that the system architecture was where your power was consumed more than instruction set. There have been several Arm chips [in servers] and they show the difference in power efficiency in an Arm gives you a few tens of percent. There is very little power efficiency in Arm over x86,” he said.

What he noticed was that because of the motherboard and all of its ports, like USB and I/O, a lot of power was wasted on the motherboard resources. Kaleo, now Bamboo, redesigned the whole motherboard where things like I/O and memory are pooled, so doubling the processor count doesn’t require doubling of motherboards.

This means a shared infrastructure with pooling of non-CPU resources and NVMe to scale up storage. A 3U box can hold up to 192 eight-core servers, 42 U.2 SSDs and 192 directly attached SATA 6 drives.

“The concept of a motherboard is gone. Instead, you put the infrastructure to support processors. We build clusters of machines on boards where the infrastructure is shared across processor elements,” he said.

The result, he claims, is the Bamboo system can deliver the same amount of web traffic in 10x less server space for 5x less energy. “One rack of our stuff equals 10 racks of the competition,” said Goodacre.

Bamboo says it will announce more details in early January.

Join the Network World communities on [Facebook][6] and [LinkedIn][7] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3490385/bamboo-systems-redesigns-server-motherboards-for-greater-performance.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3306447/a-new-arm-based-server-processor-challenges-for-the-data-center.html
[2]: https://www.networkworld.com/newsletters/signup.html
[3]: https://www.networkworld.com/article/3271073/cavium-launches-thunderx2-arm-based-server-processors.html
[4]: https://www.networkworld.com/article/3482248/ampere-preps-an-80-core-arm-processor-for-the-cloud.html
[5]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world
