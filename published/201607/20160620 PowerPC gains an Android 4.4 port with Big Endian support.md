Android 4.4 移植到了 PowerPC 架构，支持大端架构
===========================================================

eInfochips（一家软件厂商） 已将将 Android 4.4 系统移植到 PowerPC 架构，它将用于一家航空电子客户用来监视引擎的健康状况的人机界面（HMI:Human Machine Interface）。

eInfochips 已经开发了第一个面向 PowerPC 架构的 CPU 的 Android 移植版本，并支持大端（Big Endian）架构。此移植基于 Android 开源项目 [Android Open Source Project (AOSP)] 中 Android 4.4 (KitKat) 的代码，其功能内核的版本号为 3.12.19。

Android 开始兴起的时候，PowerPC 正在快速丢失和 ARM 架构共同角逐的市场。高端的网络客户和其它的企业级的嵌入式工具大多运行在诸如飞思卡尔（Freescale）的 PowerQUICC 和 QorIQ 这样的 PowerPC 处理器上，但是并不是 Linux 系统。不过，有几个 Android 的移植计划。在 2009 年，飞思卡尔和 Embedded Alley（一家软件厂商，当前是 Mentor Graphics 的 Linux 团队的一部分）[宣布了针对 PowerQUICC 和 QorIQ 芯片的移植版本][15]，当前由 NXP 公司构建。另一个名为 [Android-PowerPC][16] 的项目也作出了相似的工作。

这些努力来的都并不容易，然而，当航空公司找到 eInfochips，希望能够为他们那些基于 PowerPC 的引擎监控系统添加 Android 应用程序以改善人机界面。该公司找出了这些早期的移植版本，然而，它们都相距甚远。所以，他们不得不从头开始新的移植。

最主要的问题是这些移植的 Android 版本实在是太老了，和现在的 Android 差别太大了。Embedded Alley 移植的版本为 Android 1.5 (Cupcake)，它于 2009 年发布，Linux 内核版本为 2.6.28。而 Android-PowerPC 项目最后一版的移植是 Android 2.2 (Froyo)，它于 2010 年发布，内核版本为 2.6.32。此外，航空公司还有一些额外的技术诉求，例如对大端架构（Big Endian）的支持，这种老式的内存访问方式仍旧应用于网络通信和电信行业。然而那些早期的移植版本仅能够支持小端（Little Endian）的内存访问。

### 来自 eInfochips 的全新 PowerPC 架构移植

eInfochips, 它最为出名的应该是那些基于 ARM/骁龙处理器的模块计算机板卡，例如 [Eragon 600][17]。 它已经完成了基于 QorIQ 的 Android 4.4 系统移植，且发布了白皮书介绍了该项目。采用该项目的航空电子设备客户仍旧不愿透露名称，目前仍旧不清楚什么时候会公开此该移植版本。

![](http://files.linuxgizmos.com/einfochips_porting_android_on_powerpc.jpg)

*图片来自 eInfochips 的博客日志*

全新的 PowerPC Android 项目包括：

- 基于 PowerPC [e5500][1] 仿生定制
- 基于 Android KitKat 的大端支持
- 使用 GCC 5.2 工具链开发 
- Android 4.4 框架的 PowerPC 支持
- PowerPC e5500 的 Android 内核版本为 3.12.19

根据 eInfochips 的销售经理 Sooryanarayanan Balasubramanian 描述，该航空电子客户想要使用 Android 主要是因为熟悉的界面能够缩减培训的时间，并且让程序更新和增加新程序变得更加容易。他继续解释说：“这次成功的移植了 Android，使得今后的工作仅仅需要在应用层作出修修改改，而不再向以前一样需要在所有层面之间作相互的校验。”，“这是第一次在航空航天工业作出这些尝试，这需要在设计时尽量认真。”

通过白皮书，可以知道将 Android 移植到 PowerPC 上需要对框架、核心库、开发工具链、运行时链接器、对象链接器和开源编译工具作出大量的修改。在字节码生成阶段，移植团队决定使用便携模式（portable mode）而不是快速解释模式（fast interpreter mode）。这是因为还没有 PowerPC 可用的快速解释模式，而使用开源的 [libffi][18] 的便携模式能够支持 PowerPC。

同时，团队还面临着在 Android 运行时 (ART) 环境和 Dalvik 虚拟机 (DVM) 环境之间的选择。他们发现，ART 环境下的便携模式还未经测试且缺乏良好的文档支持，所以最终选择了 DVM 环境下的便携模式。

白皮书中还提及了其它的一些在移植过程中遇到的困难，包括重新开发工具链，重写脚本以解决 AOSP 对编译器标志“非标准”使用的问题。最终完成的移植版本提供了 37 个服务，以及提供了无界面的 Android 部署，在前端使用用户空间的模拟 UI。


### 目标硬件

感谢来自 [eInfochips 博客日志][2] 的图片（如下图所示），让我们能够确认此 PowerPC 的 Android 移植项目的硬件平台。这个板卡为 [X-ES Xpedite 6101][3]，它是一个加固级 XMC/PrPMC 夹层模组。

![](http://hackerboards.com/files/xes_xpedite6101-sm.jpg)

*X-ES Xpedite 6101 照片和框图*

X-ES Xpedite 6101 板卡拥有一个可选的 NXP 公司基于 QorIQ T 系列通信处理器（T2081、T1042 和 T1022），它们分别集成了 8 个、4 个和 2 个 e6500 核心，稍有不同的是，T2081 的处理器主频为 1.8GHz，T1042/22 的处理器主频为 1.4GHz。所有的核心都集成了 AltiVec SIMD 引擎，这也就意味着它能够提供 DSP 级别的浮点运算性能。所有以上 3 款 X-ES 板卡都能够支持最高 8GB 的 DDR3-1600 ECC SDRAM 内存。外加 512MB NOR 和 32GB 的 NAND 闪存。

![](http://hackerboards.com/files/nxp_qoriq_t2081_block-sm.jpg)

*NXP T2081 框图*

板卡的 I/O 包括一个 x4 PCI Express Gen2 通道，以及双工的千兆级网卡、 RS232/422/485 串口和 SATA 3.0 接口。此外，它可选 3 款 QorIQ 处理器，Xpedite 6101 提供了三种 [X-ES 加固等级][19]，分别是额定工作温度 0 ~ 55°C, -40 ~ 70°C, 或者是 -40 ~ 85°C，且包含 3 类冲击和抗振类别。

此外，我们已经介绍过的基于 X-ES QorIQ 的 XMC/PrPMC 板卡包括 [XPedite6401 和 XPedite6370][20]，它们支持已有的板卡级 Linux 、风河的 VxWorks（一种实时操作系统） 和 Green Hills 的 Integrity（也是一种操作系统）。


### 更多信息

eInfochips Android PowerPC 移植白皮书可以[在此][4]下载(需要先免费注册)。

### 相关资料

- [Commercial embedded Linux distro boosts virtualization][5]
- [Freescale unveils first ARM-based QorIQ SoCs][6]
- [High-end boards run Linux on 64-bit ARM QorIQ SoCs][7]
- [Free, Open Enea Linux taps Yocto Project and Linaro code][8]
- [LynuxWorks reverts to its LynxOS roots, changes name][9]
- [First quad- and octa-core QorIQ SoCs unveiled][10]
- [Free white paper shows how Linux won embedded][11]
- [Quad-core Snapdragon COM offers three dev kit options][12]
- [Tiny COM runs Linux on quad-core 64-bit Snapdragon 410][13]
- [PowerPC based IoT gateway COM ships with Linux BSP][14]


--------------------------------------------------------------------------------

via: http://hackerboards.com/powerpc-gains-android-4-4-port-with-big-endian-support/

作者：[Eric Brown][a]
译者：[dongfengweixiao](https://github.com/dongfengweixiao)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://hackerboards.com/powerpc-gains-android-4-4-port-with-big-endian-support/
[1]: http://linuxdevices.linuxgizmos.com/low-cost-powerquicc-chips-offer-flexible-interconnect-options/
[2]: https://www.einfochips.com/blog/k2-categories/aerospace/presenting-a-case-for-porting-android-on-powerpc-architecture.html
[3]: http://www.xes-inc.com/products/processor-mezzanines/xpedite6101/
[4]: http://biz.einfochips.com/portingandroidonpowerpc
[5]: http://hackerboards.com/commercial-embedded-linux-distro-boosts-virtualization/
[6]: http://hackerboards.com/freescale-unveils-first-arm-based-qoriq-socs/
[7]: http://hackerboards.com/high-end-boards-run-linux-on-64-bit-arm-qoriq-socs/
[8]: http://hackerboards.com/free-open-enea-linux-taps-yocto-and-linaro-code/
[9]: http://hackerboards.com/lynuxworks-reverts-to-its-lynxos-roots-changes-name/
[10]: http://hackerboards.com/first-quad-and-octa-core-qoriq-socs-unveiled/
[11]: http://hackerboards.com/free-white-paper-shows-how-linux-won-embedded/
[12]: http://hackerboards.com/quad-core-snapdragon-com-offers-three-dev-kit-options/
[13]: http://hackerboards.com/tiny-com-runs-linux-and-android-on-quad-core-64-bit-snapdragon-410/
[14]: http://hackerboards.com/powerpc-based-iot-gateway-com-ships-with-linux-bsp/
[15]: http://linuxdevices.linuxgizmos.com/android-ported-to-powerpc/
[16]: http://www.androidppc.com/
[17]: http://hackerboards.com/quad-core-snapdragon-com-offers-three-dev-kit-options/
[18]: https://sourceware.org/libffi/
[19]: http://www.xes-inc.com/capabilities/ruggedization/
[20]: http://hackerboards.com/high-end-boards-run-linux-on-64-bit-arm-qoriq-socs/
