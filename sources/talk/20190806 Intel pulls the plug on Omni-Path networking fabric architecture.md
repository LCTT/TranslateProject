[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Intel pulls the plug on Omni-Path networking fabric architecture)
[#]: via: (https://www.networkworld.com/article/3429614/intel-pulls-the-plug-on-omni-path-networking-fabric-architecture.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Intel pulls the plug on Omni-Path networking fabric architecture
======
Omni-Path Architecture, which Intel had high hopes for in the high-performance computing (HPC) space, has been scrapped after one generation.
![Gerd Altmann \(CC0\)][1]

Intel’s battle to gain ground in the high-performance computing (HPC) market isn’t going so well. The Omni-Path Architecture it had pinned its hopes on has been scrapped after one generation.

An Intel spokesman confirmed to me that the company will no longer offer Intel OmniPath Architecture 200 (OPA200) products to customers, but it will continue to encourage customers, OEMs, and partners to use OPA100 in new designs. 

“We are continuing to sell, maintain, and support OPA100. We actually announced some new features for OPA100 back at International Supercomputing in June,” the spokesperson said via email.

**[ Learn [who's developing quantum computers][2]. ]**

Intel said it continues to invest in connectivity solutions for its customers and that the recent [acquisition of Barefoot Networks][3] is an example of Intel’s strategy of supporting end-to-end cloud networking and infrastructure. It would not say if Barefoot’s technology would be the replacement for OPA.

While Intel owns the supercomputing market, it has not been so lucky with the HPC fabric, a network that connects CPUs and memory for faster data sharing. Market leader Mellanox with its Enhanced Data Rate (HDR) InfiniBand framework rules the roost, and now [Mellanox is about to be acquired][4] by Intel’s biggest nemesis, Nvidia.

Technically, Intel was a bit behind Mellanox. OPA100 is 100 Gbits, and OPA200 was intended to be 200 Gbits, but Mellanox was already at 200 Gbits and is set to introduce 400-Gbit products later this year.

Analyst Jim McGregor isn’t surprised. “They have a history where if they don’t get high uptick on something and don’t think it’s of value, they’ll kill it. A lot of times when they go through management changes, they look at how to optimize. Paul [Otellini] did this extensively. I would expect Bob [Swan, the newly minted CEO] to do that and say these things aren’t worth our investment,” he said.

The recent [sale of the 5G unit to Apple][5] is another example of Swan cleaning house. McGregor notes Apple was hounding them to invest more in 5G and at the same time tried to hire people away.

The writing was on the wall for OPA as far back as March when Intel introduced Compute Express Link (CXL), a cache coherent accelerator interconnect that basically does what OPA does. At the time, people were wondering where this left OPA. Now they know.

The problem once again is that Intel is swimming upstream. CXL competes with Cache Coherent Interconnect for Accelerators (CCIX) and OpenCAPI, the former championed by basically all of its competition and the latter promoted by IBM.

All are built on PCI Express (PCIe) and bring features such as cache coherence to PCIe, which it does not have natively. Both CXL and CCIX can run on top of PCIe and co-exist with it. The trick is that the host and the accelerator must have matching support. A host with CCIX can only work with a CCIX device; there is no mixing them.

As I said, CCIX support is basically everybody but Intel: ARM, AMD, IBM, Marvell, Qualcomm, and Xilinx are just a few of its backers. CXL includes Intel, Hewlett Packard Enterprise, and Dell EMC. The sane thing to do would be merge the two standards, take the best of both and make one standard. But anyone who remembers the HD-DVD/Blu-ray battle of last decade knows how likely that is.

Join the Network World communities on [Facebook][6] and [LinkedIn][7] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3429614/intel-pulls-the-plug-on-omni-path-networking-fabric-architecture.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/07/digital_transformation_finger_tap_causes_waves_of_interconnected_digital_ripples_by_gerd_altmann_cc0_via_pixabay_1200x800-100765086-large.jpg
[2]: https://www.networkworld.com/article/3275385/who-s-developing-quantum-computers.html
[3]: https://www.idgconnect.com/news/1502086/intel-delves-deeper-network-barefoot-networks
[4]: https://www.networkworld.com/article/3356444/nvidia-grabs-mellanox-out-from-under-intels-nose.html
[5]: https://www.computerworld.com/article/3411922/what-you-need-to-know-about-apples-1b-intel-5g-modem-investment.html
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world
