[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Intel's Agilex FPGA family targets data-intensive workloads)
[#]: via: (https://www.networkworld.com/article/3386158/intels-agilex-fpga-family-targets-data-intensive-workloads.html#tk.rss_all)
[#]: author: (Marc Ferranti https://www.networkworld.com)

Intel's Agilex FPGA family targets data-intensive workloads
======
Agilex processors are the first Intel FPGAs to use 10nm manufacturing, achieving a performance boost for AI, financial and IoT workloads
![Intel][1]

After teasing out details about the technology for a year and half under the code name Falcon Mesa, Intel has unveiled the Agilex family of FPGAs, aimed at data-center and network applications that are processing increasing amounts of data for AI, financial, database and IoT workloads.

The Agilex family, expected to start appearing in devices in the third quarter, is part of a new wave of more easily programmable FPGAs that is beginning to take an increasingly central place in computing as data centers are called on to handle an explosion of data.

**Learn about edge networking**

  * [How edge networking and IoT will reshape data centers][2]
  * [Edge computing best practices][3]
  * [How edge computing can help secure the IoT][4]



FPGAs, or field programmable gate arrays, are built around around a matrix of configurable logic blocks (CLBs) linked via programmable interconnects that can be programmed after manufacturing – and even reprogrammed after being deployed in devices – to run algorithms written for specific workloads. They can thus be more efficient on a performance-per-watt basis than general-purpose CPUs, even while driving higher performance.

### Accelerated computing takes center stage

CPUs can be packaged with FPGAs, offloading specific tasks to them and enhancing overall data-center and network efficiency. The concept, known as accelerated computing, is increasingly viewed by data-center and network managers as a cost-efficient way to handle increasing data and network traffic.

"This data is creating what I call an innovation race across from the edge to the network to the cloud," said Dan McNamara, general manager of the Programmable Solutions Group (PSG) at Intel. "We believe that we’re in the largest adoption phase for FPGAs in our history."

The Agilex family is the first line of FPGAs developed from the ground up in the wake of [Intel’s $16.7 billion 2015 acquisition of Altera.][5] It's the first FPGA line to be made with Intel's 10nm manufacturing process, which adds billions of transistors to the FPGAs compared to earlier generations. Along with Intel's second-generation HyperFlex architecture, it helps give Agilex 40 percent higher performance than the company's current high-end FPGA family, the Stratix 10 line, Intel says.

HyperFlex architecture includes additional registers – places on a processor that temporarily hold data – called Hyper-Registers, located everywhere throughout the core fabric to enhance bandwidth as well as area and power efficiency.

**[[Take this mobile device management course from PluralSight and learn how to secure devices in your company without degrading the user experience.][6] ]**

### Memory coherency is key

Agilex FPGAs are also the first processors to support [Compute Express Link (CXL), a high-speed interconnect][7] designed to maintain memory coherency among CPUs like Intel's second-generation Xeon Scalable processors and purpose-built accelerators like FPGAs and GPUs. It ensures that different processors don't clash when trying to write to the same memory space, essentially allowing CPUs and accelerators to share memory.

"By having this CXL bus you can actually write applications that will use all the real memory so what that does is it simplifies the programming model in large memory workloads," said Patrick Moorhead, founder and principal at Moor Insights & Strategy.

The ability to integrate FPGAs, other accelerators and CPUs is key to Intel's accelerated computing strategy for the data center. Intel calls it "any to any" integration.

### 'Any-to-any' integration is crucial for the data center

The Agilex family uses embedded multi-die interconnect bridge (EMIB) packaging technology to integrate, for example, Xeon Scalable CPUs or ASICs – special-function processors that are not reprogammable – alongside FPGA fabric. Intel last year bought eASIC, a maker of structured ASICs, which the company describes as an intermediary technology between FPGAs and ASICs. The idea is to deliver products that offer a mix of functionality to achieve optimal cost and performance efficiency for data-intensive workloads.

Intel underscored the importance of processor integration for the data center by unveiling Agilex on Tuesday at its Data Centric Innovation Day in San Francisco, when it also discussed plans for its second generation Xeon Scalable line.

Traditionally, FPGAs were mainly used in embedded devices, communications equipment and in hyperscale data centers, and not sold directly to enterprises. But several products based on Intel Stratix 10 and Arria 10 FPGAs are now being sold to enterprises, including in Dell EMC and Fujitsu off-the-shelf servers.

Making FPGAs easier to program is key to making them more mainstream. "What's really, really important is the software story," said Intel's McNamara. "None of this really matters if we can't generate more users and make it easier to program FPGA's."

Intel's Quartus Prime design tool will be available for Agilex hardware developers but the real breakthrough for FPGA software development will be Intel's OneAPI concept, announced in December.

"OneAPI is is an effort by Intel to be able to have programmers write to OneAPI and OneAPI determines the best piece of silicon to run it on," Moorhead said. "I lovingly refer to it as the magic API; this is the big play I always thought Intel was gonna be working on ever since it bought Altera. The first thing I expect to happen are the big enterprise developers like SAP and Oracle to write to Agilex, then smaller ISVs, then custom enterprise applications."

![][8]

Intel plans three different product lines in the Agilex family – from low to high end, the F-, I- and M-series – aimed at different applications and processing requirements. The Agilex family, depending on the series, supports PCIe (peripheral component interconnect express) Gen 5, and different types of memory including DDR5 RAM, HBM (high-bandwidth memory) and Optane DC persistent memory. It will offer up to 112G bps transceiver data rates and a greater mix of arithmetic precision for AI, including bfloat16 number format.

In addition to accelerating server-based workloads like AI, genomics, financial and database applications, FPGAs play an important part in networking. Their cost-per-watt efficiency makes them suitable for edge networks, IoT devices as well as deep packet inspection. In addition, they can be used in 5G base stations; as 5G standards evolve, they can be reprogrammed. Once 5G standards are hardened, the "any to any" integration will allow processing to be offloaded to special-purpose ASICs for ultimate cost efficiency.

### Agilex will compete with Xylinx's ACAPs

Agilex will likely vie with Xylinx's upcoming [Versal product family][9], due out in devices in the second half of the year. Xylinx competed for years with Altera in the FPGA market, and with Versal has introduced what it says is [a new product category, the Adaptive Compute Acceleration Platform (ACAP)][10]. Versal ACAPs will be made using TSMC's 7nm manufacturing process technology, though because Intel achieves high transistor density, the number of transistors offered by Agilex and Versal chips will likely be equivalent, noted Moorhead.

Though Agilex and Versal differ in details, the essential pitch is similar: the programmable processors offer a wider variety of programming options than prior generations of FPGA, work with CPUs to accelerate data-intensive workloads, and offer memory coherence. Rather than CXL, though, the Versal family uses the cache coherent interconnect for accelerators (CCIX) interconnect fabric.

Neither Intel or Xylinx for the moment have announced OEM support for Agilex or Versal products that will be sold to the enterprise, but that should change as the year progresses.

Join the Network World communities on [Facebook][11] and [LinkedIn][12] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3386158/intels-agilex-fpga-family-targets-data-intensive-workloads.html#tk.rss_all

作者：[Marc Ferranti][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/04/agilex-100792596-large.jpg
[2]: https://www.networkworld.com/article/3291790/data-center/how-edge-networking-and-iot-will-reshape-data-centers.html
[3]: https://www.networkworld.com/article/3331978/lan-wan/edge-computing-best-practices.html
[4]: https://www.networkworld.com/article/3331905/internet-of-things/how-edge-computing-can-help-secure-the-iot.html
[5]: https://www.networkworld.com/article/2903454/intel-could-strengthen-its-server-product-stack-with-altera.html
[6]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fcourses%2Fmobile-device-management-big-picture
[7]: https://www.networkworld.com/article/3359254/data-center-giants-announce-new-high-speed-interconnect.html
[8]: https://images.idgesg.net/images/article/2019/04/agilex-family-100792597-large.jpg
[9]: https://www.xilinx.com/news/press/2018/xilinx-unveils-versal-the-first-in-a-new-category-of-platforms-delivering-rapid-innovation-with-software-programmability-and-scalable-ai-inference.html
[10]: https://www.networkworld.com/article/3263436/fpga-maker-xilinx-aims-range-of-software-programmable-chips-at-data-centers.html
[11]: https://www.facebook.com/NetworkWorld/
[12]: https://www.linkedin.com/company/network-world
