[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Mellanox, Inphi boost network feeds with new hardware)
[#]: via: (https://www.networkworld.com/article/3531973/mellanox-inphi-boost-network-feeds-with-new-hardware.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Mellanox, Inphi boost network feeds with new hardware
======
Mellanox delivers fast new switches, while Inphi focuses on high-speed interconnects for massive data movement.
AlphaSpirit / Getty Images

A growing number of vendors are looking to boost network throughput with smarter network controllers. Last week I wrote about Xilinx [jumping on the SmartNIC bandwagon][1]. This week, both Mellanox and Inphi announced new products.

Mellanox has begun shipping its SN4000 Ethernet switches. The new switches are powered by the vendor's Spectrum-3 12.8 Tbps Ethernet switch ASIC, which is optimized for cloud, Ethernet storage fabric, and AI interconnect applications. SN4000 platforms come in flexible form-factors that support a combination of up to 32 ports of 400GbE, 64 ports of 200GbE and 128 ports of 100/50/25/10GbE.

Spectrum-3 is designed for building massive, high performance layer-2 and layer-3 fabrics, for both virtualized and non-virtualized use cases. Dave Iles, senior director for Ethernet switching products at Mellanox, says people are moving from Fiber Channel to Ethernet and the SN4000 is optimized for ethernet storage fabric (ESF).

**More about SD-WAN**: [How to buy SD-WAN technology: Key questions to consider when selecting a supplier][2] • [How to pick an off-site data-backup method][3] •  [SD-Branch: What it is and why you’ll need it][4] • [What are the options for security SD-WAN?][5]

"We find ESF is a door opener for us. They might be a Cisco shop and get a storage solution. That will be a great way for us to get into a data center that was previously closed to us," he tells me. "A lot of people start small with Nutanix and will migrate workloads over time and incremently add nodes and capacity, but then want to deploy something with an NVMe fabric." That's where the SN4000 comes in, because it supports ESF in a hyperconverged infrastructure (HCI).

Additional highlights of the SN4000 include: a fully shared packet buffer to maximize burst absorption and deliver fair bandwidth sharing; RoCE-ready, one-click configuration capabilities with hardware-accelerated, end-to-end congestion management; Mellanox's FlexFlow programmable pipeline for network processing; and advanced network telemetry features to determine packet loss and correct it.

### Inphi focuses on interconnects

Inphi plays on a different level, making high performance interconnects for digital signal processors (DSP) that move data between processors, network gear, and storage or memory. It offers a PAM4-based DSP called Porrima that moves data anywhere from 100 meters to 10 kilometers.

Now Inphi is introducing a new generation of its DSP – Porrima Gen3 – as well as a higher performance DSP called Spica. Porrima Gen3 is for today's 12.8 Tb switches with 400Gb, achieved through eight 50Gb lines. Spica is for future 25.6Tb switches, which should start to hit the market later this year, according to Eric Hayes, Inphi's senior vice president for networking interconnect. 

[][6]

Spica is essentially the same PAM4 DSP but with greater throughput; Spica doubles throughput thanks to 8x100Gbps optical transceiver modules.

One of the things driving the need for faster data movement is an increase in the processing capabilities and networking devices, Hayes said. In short, processors need to be fed.

"We're much more driven by an AI-learning world, where learning is driven by very large data sets that go across many processors in a cluster and you are cranking out a lot of data across every cycle," Hayes said. "AI chips are getting clustered and driving more data. To get more data, you need to move faster."

Porrima Gen3 is API and software compatible with Porrima Gen1 and Gen2 to ensure smooth transition in deployment, and backward pin-to-pin compatibility allows minimum hardware changes on module design. Both Porrima Gen3 and Spica use a 7nm process design for very low power draw.

Inphi is now sampling both the Porrima Gen3 and Spica platform solutions to qualified customers. Availability will be later this year.

Join the Network World communities on [Facebook][7] and [LinkedIn][8] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3531973/mellanox-inphi-boost-network-feeds-with-new-hardware.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3530364/xilinx-jumps-on-the-smartnic-bandwagon.html
[2]: https://www.networkworld.com/article/3323407/sd-wan/how-to-buy-sd-wan-technology-key-questions-to-consider-when-selecting-a-supplier.html
[3]: https://www.networkworld.com/article/3328488/backup-systems-and-services/how-to-pick-an-off-site-data-backup-method.html
[4]: https://www.networkworld.com/article/3250664/lan-wan/sd-branch-what-it-is-and-why-youll-need-it.html
[5]: https://www.networkworld.com/article/3285728/sd-wan/what-are-the-options-for-securing-sd-wan.html
[6]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[7]: https://www.facebook.com/NetworkWorld/
[8]: https://www.linkedin.com/company/network-world
