[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Best Single Board Computers for AI and Deep Learning Projects)
[#]: via: (https://itsfoss.com/best-sbc-for-ai/)
[#]: author: (Community https://itsfoss.com/author/itsfoss/)

Best Single Board Computers for AI and Deep Learning Projects
======

[Single-board computers][1] (SBC) are very popular with tinkerers and hobbyists alike, they offer a lot of functionality in a very small form factor. An SBC has the CPU, GPU, memory, IO ports, etc. on a small circuit board and users can add functionality by adding new devices to the [GPIO ports][2]. Some of the more popular SBCs include the [Raspberry Pi][3] and [Arduino][4] family of products.

However, there is an increasing demand for SBC’s that can be used for edge compute applications like Artificial Intelligence (AI) or Deep Learning (DL) and there are quite a few. The list below consists of some of the best SBCs that have been developed for edge computing.

The list is in no particular order of ranking. Some links here are affiliate links. Please read our [affiliate policy][5].

### 1\. Nvidia Jetson Family

Nvidia has a great lineup of SBCs that cater to AI developers and hobbyists alike. Their line of “[Jetson Developer Kits][6]” are some of the most powerful and value for money SBCs available in the market. Below is a list of their offerings.

#### Nvidia Jetson Nano Developer Kit

![][7]

Starting at **$59**, the Jetson Nano is the cheapest SBC in the list and offers a good price to performance ratio. It can run multiple neural networks alongside other applications such as object detection, segmentation, speech processing and image classification.

The Jetson Nano is aimed towards AI enthusiasts, hobbyists and developers who want to do projects by implementing AI.

The Jetson Nano is being offered in two variants: 4 GB and 2 GB. The main differences between the two are, the price, RAM capacity and IO ports being offered. The 4 GB variant has been showcased in the image above.

**Key Specifications**

  * **CPU:** Quad-core ARM A57 @ 1.43 GHz
  * **GPU:** 128-core NVIDIA Maxwell
  * **Memory:** 4 GB 64-bit LPDDR4 @ 25.6 GB/s or 2 GB 64-bit LPDDR4 @ 25.6 GB/s
  * **Storage:** microSD card support
  * **Display:** HDMI and Display Port or HDMI

Preview | Product | Price |
---|---|---|---
![NVIDIA Jetson Nano 2GB Developer Kit \(945-13541-0000-000\)][8] ![NVIDIA Jetson Nano 2GB Developer Kit \(945-13541-0000-000\)][8] | [NVIDIA Jetson Nano 2GB Developer Kit (945-13541-0000-000)][9] | $59.00[][10] | [Buy on Amazon][11]

#### Nvidia Jetson Xavier NX Developer Kit

![][12]

The Jetson Xavier NX is a step up from the Jetson Nano and is aimed more towards OEMs, start-ups and AI developers.

The Jetson Xavier NX is meant for applications that need more serious AI processing power that an entry level offering like the Jetson Nano simply can’t deliver. The Jetson Xavier NX is being offered at **$386.99**.

**Key Specifications**

  * **CPU:** 6-core NVIDIA Carmel ARM v8.2 64-bit CPU
  * **GPU:** NVIDIA Volta architecture with 384 NVIDIA CUDA cores and 48 Tensor cores
  * **DL Accelerator:** 2x NVDLA Engines
  * **Vision Accelerator:** 7-Way VLIW Vision Processor
  * **Memory:** 8 GB 128-bit LPDDR4x @ 51.2 GB/s
  * **Storage:** microSD support
  * **Display:** HDMI and Display Port

Preview | Product | Price |
---|---|---|---
![NVIDIA Jetson Xavier NX Developer Kit \(812674024318\)][13] ![NVIDIA Jetson Xavier NX Developer Kit \(812674024318\)][13] | [NVIDIA Jetson Xavier NX Developer Kit (812674024318)][14] | $386.89[][10] | [Buy on Amazon][15]

#### Nvidia Jetson AGX Xavier Developer Kit

![][16]

The Jetson AGX Xavier is the flagship product of the Jetson family, it is meant to be deployed in servers and AI robotics applications in industries such as manufacturing, retail, automobile, agriculture, etc.

Coming in at **$694.91**, the Jetson AGX Xavier is not meant for beginners, it is meant for developers who want top-tier edge compute performance at their disposal and for companies who want good scalability for their applications.

**Key Specifications**

  * **CPU:** 8-core ARM v8.2 64-bit CPU
  * **GPU:** 512-core Volta GPU with Tensor Cores
  * **DL Accelerator:** 2x NVDLA Engines
  * **Vision Accelerator:** 7-Way VLIW Vision Processor
  * **Memory:** 32 GB 256-Bit LPDDR4x @ 137 GB/s
  * **Storage:** 32 GB eMMC 5.1 and uSD/UFS Card Socket for storage expansion
  * **Display:** HDMI 2.0

Preview | Product | Price |
---|---|---|---
![NVIDIA Jetson AGX Xavier Developer Kit \(32GB\)][17] ![NVIDIA Jetson AGX Xavier Developer Kit \(32GB\)][17] | [NVIDIA Jetson AGX Xavier Developer Kit (32GB)][18] | $694.91[][10] | [Buy on Amazon][19]

### 2\. ROCK Pi N10

![][20]

The ROCK Pi N10, developed by [Radxa][21] is the second cheapest offering in this list with its base variant coming in at **$99**, its range topping variant comes in at **$169**,

The ROCK Pi N10 is equipped with a NPU (Neural Processing Unit) that helps it in processing AI/ Deep Learning workloads with ease. It offers up to 3 TOPS (Tera Operations Per Second) of performance.

It is being offered in three variants namely, ROCK Pi N10 Model A, ROCK Pi N10 Model B, ROCK Pi N10 Model C, the only differences between these variants are the price, RAM and Storage capacities.

The ROCK Pi N10 is available for purchase through [Seeed Studio][22].

**Key Specifications**

  * **CPU:** RK3399Pro with 2-core Cortex-A72 @ 1.8 GHz and 4-Core Cortex-A53 @ 1.4 GHz
  * **GPU:** Mali T860MP4
  * **NPU:** Supports 8bit/16bit computing with up to 3.0 TOPS computing power
  * **Memory:** 4 GB/6 GB/8 GB 64-bit LPDDR3 @ 1866 Mb/s
  * **Storage:** 16 GB/32 GB/64 GB eMMC
  * **Display:** HDMI 2.0



### 3\. BeagleBone AI

![][23]

The BeagleBone AI is [BeagleBoard.org][24]‘s open source SBC is meant to bridge the gap between small SBCs and more powerful industrial computers. The hardware and software of the BeagleBoard are completely open source.

It is meant for use in the automation of homes, industries and other commercial use cases. It is priced at **~$110**, the price varies across dealers, for more info check [their website][25].

**Key Specifications**

  * **CPU:** Texas Instrument AM5729 with Dual-core ARM Cortex-A15 @ 1.5GHz
  * **Co-Processor:** 2 x Dual-core ARM Cortex-M4
  * **DSP:** 2 x C66x floating-point VLIW
  * **EVE:** 4 x Embedded Vision Engines
  * **GPU:** PowerVR SGX544
  * **RAM:** 1 GB
  * **Storage:** 16 GB eMMC
  * **Display:** microHDMI

Preview | Product | Price |
---|---|---|---
![BeagleBone AI][26] ![BeagleBone AI][26] | [BeagleBone AI][27] | $127.49[][10] | [Buy on Amazon][28]

### 4\. BeagleV

![][29]

The BeagleV is the latest launch in the list, it is an SBC that runs Linux out of the box and has a [RISC-V][30] CPU.

It is capable of running edge compute applications effortlessly, to know more about the BeagleV check [our coverage][31] of the launch.

The BeagleV will be getting two variants, a 4 GB RAM variant and an 8 GB RAM variant. Pricing starts at **$119** for the base model and **$149** for the 8 GB RAM model, it is up for pre-order through [their website][32].

**Key Specifications**

  * **CPU:** RISC-V U74 2-Core @ 1.0GHz
  * **DSP:** Vision DSP Tensilica-VP6
  * **DL Accelerator:** NVDLA Engine 1-core
  * **NPU:** Neural Network Engine
  * **RAM:** 4 GB/8 GB (2 x 4 GB) LPDDR4 SDRAM
  * **Storage:** microSD slot
  * **Display:** HDMI 1.4



### 5\. HiKey970

![][33]

HiKey970 is [96 Boards][34] first SBC meant for edge compute applications and is the world’s first dedicated NPU AI platform.

The HiKey970 features an CPU, GPU and an NPU for accelerating AI performance, it can also be used for training and building DL (Deep Learning) models.

The HiKey970 is priced at **$299** and can be bought from their [official store][35].

**Key Specifications**

  * **SoC:** HiSilicon Kirin 970
  * **CPU:** ARM Cortex-A73 4-Core @ 2.36GHz and ARM Cortex-A53 4-Core @ 1.8GHz
  * **GPU:** ARM Mali-G72 MP12
  * **RAM:** 6 GB LPDDR4X @ 1866MHz
  * **Storage:** 64 GB UFS 2.1 microSD
  * **Display:** HDMI and 4 line MIPI/LCD port



### 6\. Google Coral Dev Board

![][36]

The Coral Dev Board is Google’s first attempt at an SBC dedicated for edge computing. It is capable of performing high speed ML (Machine Learning) inferencing and has support for TensorFlow Lite and AutoML Vision Edge.

The board is priced at **$129.99** and is available through [Coral’s official website][37].

**Key Specifications**

  * **CPU:** NXP i.MX 8M SoC (4-Core Cortex-A53, Cortex-M4F)
  * **ML Accelerator**: Google Edge TPU coprocessor
  * **GPU:** Integrated GC7000 Lite Graphics
  * **RAM:** 1 GB LPDDR4
  * **Storage:** 8 GB eMMC and microSD slot
  * **Display:** HDMI 2.0a, 39-pin FFC connector for MIPI-DSI display (4-lane) and 24-pin FFC connector for MIPI-CSI2 camera (4-lane)



### 7\. Google Coral Dev Board Mini

![][38]

The Coral Dev Board Mini is the successor to the Coral Dev Board, it packs in more processing power into a smaller form factor and a lower price point of **$99.99**.

The Coral Dev Board Mini can be purchased from their [official web store][39].

**Key Specifications**

  * **CPU:** MediaTek 8167s SoC (4-core Arm Cortex-A35)
  * **ML Accelerator:** Google Edge TPU coprocessor
  * **GPU:** IMG PowerVR GE8300
  * **RAM:** 2 GB LPDDR3
  * **Storage:** 8 GB eMMC
  * **Display:** micro HDMI (1.4), 24-pin FFC connector for MIPI-CSI2 camera (4-lane) and 24-pin FFC connector for MIPI-DSI display (4-lane)

Preview | Product | Price |
---|---|---|---
![Google Coral Dev Board Mini][40] ![Google Coral Dev Board Mini][40] | [Google Coral Dev Board Mini][41] | $99.99[][10] | [Buy on Amazon][42]

### Closing Thoughts

There is an SBC available in every price range for edge compute applications. Some are just basic, like the Nvidia Jetson Nano or the BeagleBone AI and some are performance oriented models like the BeagleV and Nvidia Jetson AGX Xavier.

If you are looking for something more universal you can check [our article on Raspberry Pi alternatives][1] that could help you in finding a suitable SBC for your use case.

If I missed any SBC dedicated for edge compute, feel free to let me know in the comments below.

_**Author info: Sourav Rudra is a FOSS Enthusiast with love for Gaming Rigs/Workstation building.**_

--------------------------------------------------------------------------------

via: https://itsfoss.com/best-sbc-for-ai/

作者：[Community][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/itsfoss/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/raspberry-pi-alternatives/
[2]: https://en.wikipedia.org/wiki/General-purpose_input/output
[3]: https://www.raspberrypi.org/products/
[4]: https://www.arduino.cc/en/main/products
[5]: https://itsfoss.com/affiliate-policy/
[6]: https://developer.nvidia.com/embedded/jetson-developer-kits
[7]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/01/Nvidia-Jetson-Nano.png?ssl=1
[8]: https://i1.wp.com/m.media-amazon.com/images/I/310YWrfdnTL._SL160_.jpg?ssl=1
[9]: https://www.amazon.com/dp/B08J157LHH?tag=chmod7mediate-20&linkCode=osi&th=1&psc=1 (NVIDIA Jetson Nano 2GB Developer Kit (945-13541-0000-000))
[10]: https://www.amazon.com/gp/prime/?tag=chmod7mediate-20 (Amazon Prime)
[11]: https://www.amazon.com/dp/B08J157LHH?tag=chmod7mediate-20&linkCode=osi&th=1&psc=1 (Buy on Amazon)
[12]: https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/01/Nvidia-Jetson-Xavier-NX.png?ssl=1
[13]: https://i1.wp.com/m.media-amazon.com/images/I/31B9xMmCvwL._SL160_.jpg?ssl=1
[14]: https://www.amazon.com/dp/B086874Q5R?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (NVIDIA Jetson Xavier NX Developer Kit (812674024318))
[15]: https://www.amazon.com/dp/B086874Q5R?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (Buy on Amazon)
[16]: https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/01/Nvidia-Jetson-AGX-Xavier-.png?ssl=1
[17]: https://i1.wp.com/m.media-amazon.com/images/I/41tO5hw4zHL._SL160_.jpg?ssl=1
[18]: https://www.amazon.com/dp/B083ZL3X5B?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (NVIDIA Jetson AGX Xavier Developer Kit (32GB))
[19]: https://www.amazon.com/dp/B083ZL3X5B?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (Buy on Amazon)
[20]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/01/ROCK-Pi-N10.png?ssl=1
[21]: https://wiki.radxa.com/Home
[22]: https://www.seeedstudio.com/ROCK-Pi-4-c-1323.html?cat=1343
[23]: https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/01/Beagle-AI.png?ssl=1
[24]: https://beagleboard.org/
[25]: https://beagleboard.org/ai
[26]: https://i2.wp.com/m.media-amazon.com/images/I/41K+htPCUHL._SL160_.jpg?ssl=1
[27]: https://www.amazon.com/dp/B07YR1RV64?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (BeagleBone AI)
[28]: https://www.amazon.com/dp/B07YR1RV64?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (Buy on Amazon)
[29]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/01/BeagleV.png?ssl=1
[30]: https://en.wikipedia.org/wiki/RISC-V
[31]: https://news.itsfoss.com/beaglev-announcement/
[32]: https://beaglev.seeed.cc/
[33]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/01/HiKey970.png?ssl=1
[34]: https://www.96boards.org/
[35]: https://www.96boards.org/product/hikey970/
[36]: https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/01/Google-Coral-Dev-Board.png?ssl=1
[37]: https://coral.ai/products/dev-board/
[38]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/01/Google-Coral-Dev-Board-Mini.png?ssl=1
[39]: https://coral.ai/products/dev-board-mini
[40]: https://i0.wp.com/m.media-amazon.com/images/I/41g5c6IwLmL._SL160_.jpg?ssl=1
[41]: https://www.amazon.com/dp/B08QLXKJB7?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (Google Coral Dev Board Mini)
[42]: https://www.amazon.com/dp/B08QLXKJB7?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (Buy on Amazon)
