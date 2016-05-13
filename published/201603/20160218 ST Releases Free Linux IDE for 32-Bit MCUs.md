意法半导体为 32 位微控制器发布了一款自由的 Linux 集成开发环境
=================================================

![](http://www.linux.com/images/stories/66866/STM32_Nucleo_expansion_board.jpg)

32 位微控制器世界向 Linux 敞开大门。前一段时间，领先的 ARM Cortex-M 供应商意法半导体（ST）[发布了](http://www.st.com/web/en/press/p3781) 一款自由的 Linux 桌面版开发程序，该软件面向其旗下的 STM32 微控制单元（MCU）。包含了 ST 的 STM32CubeMX 配置器和初始化工具，以及其 STM32 [系统工作台（SW4STM32）](http://www.st.com/web/catalog/tools/FM147/CL1794/SC961/SS1533/PF261797) ，这个基于 Eclipse 的 IDE 由工具 Ac6 创建。支撑 SW4STM32 的工具链，论坛，博客以及技术会由 [openSTM32.org](http://www.openstm32.org/tiki-index.php?page=HomePage) 开发社区提供。

“Linux 社区以吸引富有创意的自由思想者而闻名，他们善于交流心得、高效地克服挑战。” Laurent Desseignes，意法半导体微控制器产品部，微控制器生态系统市场经理这么说道：“我们正着手做的是让他们能极端简单的借力 STM32 系列的特性和性能施展自己的才能，运用到富有想象力的新产品的创造中去。

Linux 是物联网（IoT）网关和枢纽，及高端 IoT 终端的领先平台。但是，大部分 IoT 革命，以及可穿戴设备市场基于小型的低功耗微控制器，对 Cortex-M 芯片的运用越来越多。虽然其中的一小部分可以运行精简的 uCLinux （见下文），却没能支持更全面的 Linux 发行版。取而代之的是实时操作系统（RTOS）们或者有时干脆不用 OS 来控制。固件的开发工作一般会在基于 Windows 的集成开发环境（IDE）上完成。

通过 ST 的自由工具，Linux 开发者们可以更容易的开疆拓土。ST 工具中的一些技术在第二季度应该会登录 Mac OS/X 平台，与 [STM32 Nucleo](http://www.st.com/web/en/catalog/tools/FM146/CL2167/SC2003?icmp=sc2003_pron_pr-stm32f446_dec2014&sc=stm32nucleo-pr5) 、开发套件、以及评估板同时面世。Nucleo 支持 32 针、64 针、和 144 针的版本，并且提供类似 Arduino 连接器这样的插件。

STM32CubeMX 配置器和 IDE SW4STM32 使 Linux 开发者能够配置微控制器并开发调试代码。SW4STM32 支持在 Linux 下通过社区更改版的 [OpenOCD](http://openocd.org/) 使用调试工具 ST-LINK/V2。

据 ST 称，软件兼容 STM32Cube 软件包及标准外设库中的微控制器固件。目标是囊括 ST 的全系列 MCU，从入门级的 Cortex-M0 内核到高性能的 M7 芯片，包括 M0+，M3 和 DSP 扩展的 M4 内核。

ST 并非首个为 Linux 准备 Cortex-M 芯片 IDE 的 32 位 MCU 供应商，但似乎是第一大自由的 Linux 平台。例如 NXP，MCU 的市场份额随着近期收购了 Freescale （Kinetis 系列 MCU，等）而增加，提供了一款 IDE [LPCXpresso IDE](http://www.nxp.com/pages/lpcxpresso-ide:LPCXPRESSO)，支持 Linux 、Windows 和 Mac。然而，LPCXpresso 每份售价 $450。

在其 [SmartFusion FPGA 系统级芯片（SoC）](http://www.microsemi.com/products/fpga-soc/soc-processors/arm-cortex-m3)上集成了 Cortex-M3 芯片的 Microsemi，拥有一款 IDE [Libero IDE](http://www.linux.com/news/embedded-mobile/mobile-linux/884961-st-releases-free-linux-ide-for-32-bit-mcus#device-support)，适用于 RHEL 和 Windows。然而，Libero 需要许可证才行，并且 RHEL 版缺乏如 FlashPro 和 SoftConsole 的插件。

### 为什么要学习 MCU?

即便 Linux 开发者并没有计划在 Cortex-M 上使用 uClinux，但是 MCU 的知识总会派上用场。特别是牵扯到复杂的 IoT 工程，需要扩展 MCU 终端至云端。

对于原型和业余爱好者的项目，Arduino 板为其访问 MCU 提供了非常便利的接口。然而原型之外，开发者常常就会用更快的 32 位 Cortex-M 芯片以及所带来的附加功能来替代 Arduino 板和板上的那块 8 位 MCU ATmega32u4。这些附加功能包括改进的存储器寻址，用于芯片和各种总线的独立时钟设置，以及芯片 [Cortex-M7](http://www.electronicsnews.com.au/products/stm32-mcus-with-arm-cortex-m7-processors-and-graph) 自带的入门级显示芯片。

还有些可能需求 MCU 开发技术的地方包括可穿戴设备，低功耗、低成本和小尺寸给了 MCU 一席之地，还有机器人和无人机这些使用实时处理和电机控制的地方更为受用。在机器人上，你更是有可能看看 Cortex-A 与 Cortex-M 集成在同一个产品中的样子。

对于 SoC 芯片还有这样的一种温和的局势，即将 MCU 加入到 Linux 驱动的 Cortex-A 核心中，就如同 [NXP i.MX6 SoloX](http://linuxgizmos.com/freescales-popular-i-mx6-soc-sprouts-a-cortex-m4-mcu/)。虽然大多数的嵌入式项目并不使用这种混合型 SoC 或者说将应用处理器和 MCU 结合在同一产品中，但开发者会渐渐地发现自己工作的生产线、设计所基于的芯片正渐渐的从低端的 MCU 模块发展到 Linux 或安卓驱动的 Cortex-A。

### uClinux 是 Linux 在 MCU 领域的筹码

随着物联网的兴起，我们见到越来越多的 SBC 和模块计算机，它们在 32 位的 MCU 上运行着 uClinux。不同于其他的 Linux 发行版，uClinux 并不需要内存管理单元（MMU）。然而，uClinux 对市面上可见 MCU 有更高的内存需求。需求更高端的 Cortex-M4 和 Cortex-M4 微控制器内置内存控制器来支持外部 DRAM 芯片。

[Amptek](http://www.semiconductorstore.com/Amptek/) SBC 在 NXP LPC Cortex-M3 和 -M4 芯片上运行 uClinux，以提供常用的功能类似 WiFi、蓝牙、USB 等众多接口。Arrow 的 [SF2+](http://linuxgizmos.com/iot-dev-kit-runs-uclinux-on-a-microsemi-cortex-m3-fpga-soc/) 物联网开发套件将 uClinux 运行于 SmartFusion2 模块计算机的 Emcraft 系统上，该模块计算机是 Microsemi 的 166MHz Cortex-M3/FPGA SmartFusion2 混合 SoC。

[Emcraft](http://www.emcraft.com/) 销售基于 uClinux 的模块计算机，有 ST 和 NXP 的，也有 Microsemi 的 MCU，是 32 位 MCU 上积极推进 uClinux 的重要角色。日益频繁的 uClinux 开始了与 ARM 本身 [Mbed OS](http://linuxgizmos.com/arm-announces-mbed-os-for-iot-devices/)的对抗，至少在高端的 MCU 工程中需要无线通信和更为复杂的操作规则。Mbed 和 modern 的支持者，开源的 RTOS 们，类似 FreeRTOS 认为 uClinux 需要对 RAM 的需求太高以至于难以压低 IoT 终端的价格，然而 Emcraft 与其他 uCLinux 拥趸表示价格并没有如此夸张，而且扩展 Linux 的无线和接口也是相当值得的，即使只是在像 uClinux 这样的精简版上。

当被问及对于这次 ST 发布的看法，Emcraft 的主任工程师 Vladimir Khusainov 表示：“ST决定将这款开发工具 移植至 Linux 对于 Emcraft 是个好消息，它使得 Linux 用户能轻易的在嵌入式 STM MCU 上展开工作。我们希望那些有机会熟悉 STM 设备，使用 ST 配置器和嵌入式库的用户可能对在目标机上使用嵌入式 Linux （以 uClinux 的形式）感兴趣。”

最近关于 Cortex-M4 上运行 uClinux 的概述，可以查看去年 Jim Huang 与 Jeff Liaws 在嵌入式 Linux 大会上使用的[幻灯片](http://events.linuxfoundation.org/sites/events/files/slides/optimize-uclinux.pdf)。更多关于 Cortex-M 处理器可以查看这里过的 [AnandTech 总结](http://www.anandtech.com/show/8400/arms-cortex-m-even-smaller-and-lower-power-cpu-cores)。

------------------------------------------------------------------------------

via: http://www.linux.com/news/embedded-mobile/mobile-linux/884961-st-releases-free-linux-ide-for-32-bit-mcus

作者：[Arun Pyasi][a]
译者：[martin2011qi](https://github.com/martin2011qi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linux.com/community/forums/person/42808
