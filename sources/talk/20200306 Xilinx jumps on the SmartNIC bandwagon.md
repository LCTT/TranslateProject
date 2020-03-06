[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Xilinx jumps on the SmartNIC bandwagon)
[#]: via: (https://www.networkworld.com/article/3530364/xilinx-jumps-on-the-smartnic-bandwagon.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Xilinx jumps on the SmartNIC bandwagon
======
Alveo U25 SmartNIC is designed to offload network processing tasks such as SDN, AI and NVMe over Fabrics, leaving the CPU to focus on processing data.
Network

If there's a trend I should have seen coming it's the advent of the SmartNIC. The days where a server CPU could do the packet processing and a plain Ethernet port could handle the traffic are over. In an era of big data and artificial intelligence (AI), more data than ever has to be moved around, and the old way isn't cutting it anymore.

Last year, Mellanox introduced its SmartNIC, [ConnectX-6][1]. Intel has a programmable adapter called the Ethernet 800 series, although it falls just shy of a SmartNIC because it's not as flexible in terms of what it can be programmed to do.

Now Xilinx is in the fray with the Alveo U25 SmartNIC, which is built on Xilinx technology as well as IP it gained from the [acquisition of Solarflare][2] last year. It pairs an ARM-based CPU with Xilinx's flagship field-programmable gate array (FPGA) processor, which is capable of performing 520,000 lookup tables per second, and two ports capable of up to 25 Gb/sec throughput.

Xilinx says the U25 is designed to offload workloads like [SDN][3], virtualized switching, NFV, [NVMe over Fabrics][4] (NVME-oF), electronic trading, AI inference, and other network processing tasks from the CPU, leaving the CPU to focus on processing data.

Which is exactly what Mellanox said its ConnectX-6 would do.

In addition to the hardware, Xilinx Solarflare Onload software allows applications to bypass the OS kernel and talk directly to the network. The result, Xilinx claims, is a reduction in latency of up to 80% and an increase in application performance of up to 400%.

"Today’s cloud infrastructures suffer from critical data bottlenecks caused by server I/O," said Donna Yasay, vice president of marketing, data center group, at Xilinx in a statement. "With up to 30 percent of data center compute resources allocated for networking I/O processing, overhead continues to grow along with CPU cores. Xilinx is addressing the challenges resulting from the increased demands on networking by providing an easier-to-deploy SmartNIC with turnkey accelerated applications and out-of-the-box capabilities that go far beyond fundamental networking."

[][5]

Xilinx will also be providing support for the U25 in its Vitis software development kit, with accelerated open-source libraries for various major applications, as well as support for OpenStack, TensorFlow, FFmpeg and other domain-specific development environments.

The Xilinx Alveo U25 SmartNIC is expected to be generally available expected in Q3 2020.

Join the Network World communities on [Facebook][6] and [LinkedIn][7] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3530364/xilinx-jumps-on-the-smartnic-bandwagon.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3433924/mellanox-introduces-smartnics-to-eliminate-network-load-on-cpus.html
[2]: https://www.networkworld.com/article/3429577/xilinx-closes-solarflare-purchase-promises-high-performance-networking.html
[3]: https://www.networkworld.com/article/3209131/what-sdn-is-and-where-its-going.html
[4]: https://www.networkworld.com/article/3394296/nvme-over-fabrics-creates-data-center-storage-disruption.html
[5]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world
