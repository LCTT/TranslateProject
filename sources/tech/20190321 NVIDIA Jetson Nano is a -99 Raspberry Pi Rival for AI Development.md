[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (NVIDIA Jetson Nano is a $99 Raspberry Pi Rival for AI Development)
[#]: via: (https://itsfoss.com/nvidia-jetson-nano/)
[#]: author: (Atharva Lele https://itsfoss.com/author/atharva/)

NVIDIA Jetson Nano is a $99 Raspberry Pi Rival for AI Development
======

At the [GPU Technology Conference][1] NVIDIA announced the [Jetson Nano Module][2] and the [Jetson Nano Developer Kit][3]. Compared to other Jetson boards which cost between $299 and $1099, the Jetson Nano bears a low cost of $99. This puts it within the reach of many developers, educators, and researchers who could not spend hundreds of dollars to get such a product.

![The Jetson Nano Development Kit \(left\) and the Jetson Nano Module \(right\)][4]

### Bringing back AI development from ‘cloud’

In the last few years, we have seen a lot of [advances in AI research][5]. Traditionally AI computing was always done in the cloud, where there was plenty of processing power available.

Recently, there’s been a trend in shifting this computation away from the cloud and do it locally. This is called [Edge Computing][6]. Now at the embedded level, products which could do such complex calculations required for AI and Machine Learning were sparse, but we’re seeing a great explosion these days in this product segment.

Products like the [SparkFun Edge][7] and [OpenMV Board][8] are good examples. The Jetson Nano, is NVIDIA’s latest offering in this market. When connected to your system, it will be able to supply the processing power needed for Machine Learning and AI tasks without having to rely on the cloud.

This is great for privacy as well as saving on internet bandwidth. It is also more secure since your data always stays on the device itself.

### Jetson Nano focuses on smaller AI projects

![Jetson Nano powered JetBot][9]

Previously released Jetson Boards like the [TX2][10] and [AGX Xavier][11] were used in products like drones and cars, the Jetson Nano is targeting smaller projects, projects where you need to have the processing power which boards like the [Raspberry Pi][12] cannot provide.

Did you know?

NVIDIA’s JetPack SDK provides a ‘complete desktop Linux environment based on Ubuntu 18.04 LTS’. In other words, the Jetson Nano is powered by Ubuntu Linux.

### NVIDIA Jetson Nano Specifications

For $99, you get 472 GFLOPS of processing power due to 128 NVIDIA Maxwell Architecture CUDA Cores, a quad-core ARM A57 processor, 4GB of LP-DDR4 RAM, 16GB of on-board storage, and 4k video encode/decode capabilities. The port selection is also pretty decent with the Nano having Gigabit Ethernet, MIPI Camera, Display outputs, and a couple of USB ports (1×3.0, 3×2.0). Full range of specifications can be found [here][13].

CPU | Quad-core ARM® Cortex®-A57 MPCore processor
---|---
GPU | NVIDIA Maxwell™ architecture with 128 NVIDIA CUDA® cores
RAM | 4 GB 64-bit LPDDR4
Storage | 16 GB eMMC 5.1 Flash
Camera | 12 lanes (3×4 or 4×2) MIPI CSI-2 DPHY 1.1 (1.5 Gbps)
Connectivity | Gigabit Ethernet
Display Ports | HDMI 2.0 and DP 1.2
USB Ports | 1 USB 3.0 and 3 USB 2.0
Other | 1 x1/2/4 PCIE, 1x SDIO / 2x SPI / 6x I2C / 2x I2S / GPIOs
Size | 69.6 mm x 45 mm

Along with good hardware, you get support for the majority of popular AI frameworks like TensorFlow, PyTorch, Keras, etc. It also has support for NVIDIA’s [JetPack][14] and [DeepStream][15] SDKs, same as the more expensive TX2 and AGX Boards.

“Jetson Nano makes AI more accessible to everyone — and is supported by the same underlying architecture and software that powers our nation’s supercomputer. Bringing AI to the maker movement opens up a whole new world of innovation, inspiring people to create the next big thing.” said Deepu Talla, VP and GM of Autonomous Machines at NVIDIA.

[Subscribe to It’s FOSS YouTube Channel][16]

**What do you think of Jetson Nano?**

The availability of Jetson Nano differs from country to country.

The [Intel Neural Stick][17], is also one such accelerator which is competitively prices at $79. It’s good to see competition stirring up at these lower price points from the big manufacturers.

I’m looking forward to getting my hands on the product if possible.

What do you guys think about a product like this? Let us know in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/nvidia-jetson-nano/

作者：[Atharva Lele][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/atharva/
[b]: https://github.com/lujun9972
[1]: https://www.nvidia.com/en-us/gtc/
[2]: https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/jetson-nano/
[3]: https://developer.nvidia.com/embedded/buy/jetson-nano-devkit
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/03/jetson-nano-family-press-image-hd.jpg?ssl=1
[5]: https://itsfoss.com/nanotechnology-open-science-ai/
[6]: https://en.wikipedia.org/wiki/Edge_computing
[7]: https://www.sparkfun.com/news/2886
[8]: https://openmv.io/
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/03/nvidia_jetson_bot.jpg?ssl=1
[10]: https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/jetson-tx2/
[11]: https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/jetson-agx-xavier/
[12]: https://itsfoss.com/things-you-need-to-get-your-raspberry-pi-working/
[13]: https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/jetson-nano/#specifications
[14]: https://developer.nvidia.com/embedded/jetpack
[15]: https://developer.nvidia.com/deepstream-sdk
[16]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[17]: https://software.intel.com/en-us/movidius-ncs-get-started
