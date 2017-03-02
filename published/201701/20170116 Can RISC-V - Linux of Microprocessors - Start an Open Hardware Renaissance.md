RISC-V，微处理器中的 Linux ：它会开启一个开源硬件的文艺复兴么？
============================================================

![](https://irp-cdn.multiscreensite.com/58a25abc/dms3rep/multi/desktop/riscv2-1122x812.png) 


我与许多人分享过一个愿景，我们很快就能使用由开源硬件（[OSH][1]）和开源软件所驱动的现代而强大的设备。

开放硬件是那种有完整的文档，并且可以根据你的需求自由使用、研究、修改和复制的设备。它从原理图到 PCB 布局的所有内容全都是公开的，包括驱动硬件的软件。近年来有所进步，有更多的硬件被开放了，但是我们的 PC 和其它设备中的微处理器却被限制在了桌面端的以 x86 为主导的、封闭的指令集架构（[ISA][2]），或者智能手机/平板设备上的 ARM 变体。这两个指令集架构都是闭源的，并且不能用于开放设备。此外，许多广泛使用的 ARM 实现，比如 A9 或 Snapdragon 在这些已经专有的指令集架构上添加了进一步的专有层。

[RISC-V][3] 是不同的。在加州大学伯克利分校的研究人员于 2010 年推出的 RISC-V（发音 risk-five）是根据同样的初始 [RISC][4]（精简指令集计算（Reduced Instruction Set Computing）） CPU 设计构建的，其基础是其它熟悉的指令集架构，如 ARM、MIPS、PowerPC 和 SPARC，但目的是开放且不受专利保护（注意：目前，RISC-V 规范仅供私人或教育用途使用，计划在将来完全开放）。RISC 设计策略与 x86 系列的复杂指令集计算（CISC）设计相反。

虽然 RISC-V 不是现有唯一的开放指令集架构，但它是唯一一个极速推进的。指导指令集架构的开发和采用的 RISC-V 基金会有一些相当大的捐赠者，如 Oracle、Western Digital、HP、Google、IBM 和 Nvidia。我可以看到名单上缺少的几个著名的芯片制造商。似乎大的玩家们已经意识到，与软件一样，硬件会在开放下发展得更快更好。而且，任何人使用它你都不必付费。因为开发中的困难和成本，像这样的项目并没有被更快取得成功。现在，一个公开的结果是大的公司正在跟进，开发资金正在源源而来。

RISC-V 在学术界也有很多支持。从在伯克利的孵化到在世界范围内超过 35 个大学项目协助其发展，在那里不缺乏聪明的头脑为这个项目工作。

在其背后也有进展。在软件方面，人们正在将程序移植到 RISC-V 上，让它启动起来。Fedora 已经移植了成千上万的程序 - 下面是 [Fedora/RISC-V][5] 在 QEMU 中启动：

 ![](https://irp-cdn.multiscreensite.com/58a25abc/dms3rep/multi/desktop/booting-500x664.gif) 

*向 Richard WM Jones 做出这么棒的动画致敬*

在硬件方面，人们正在制造开发板。HiFive1 是一个成功众筹的项目，它是来自 SiFive 的一块 Arduino 板，由他们的 FE310 SoC 驱动，这是一块 32 位的 RISC-V 芯片，运行频率为 320+ MHz。 它会在 2 月发货，你可以[在这里][6]预订一个，价格为 $59。

![](https://irp-cdn.multiscreensite.com/58a25abc/dms3rep/multi/desktop/si5-640x457.jpg) 

这一切听起来很棒 - 我希望他们能够交付，因为我们都将从中受益非浅。如果可以，请支持这个项目。告诉人们这个东西。购买一块 HiFive1，看看它上面运行了什么。我在你的未来看到了这些芯片。

--------------------------------------------------------------------------------

via: https://www.darrentoback.com/can-risc-v-linux-of-microprocessors-start-an-open-hardware-renaissance

作者：[dmt][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.darrentoback.com/about-me
[1]:https://en.wikipedia.org/wiki/Open-source_hardware
[2]:https://en.wikipedia.org/wiki/Comparison_of_instruction_set_architectures
[3]:https://en.wikipedia.org/wiki/RISC-V
[4]:https://en.wikipedia.org/wiki/Reduced_instruction_set_computing
[5]:https://fedoraproject.org/wiki/Architectures/RISC-V
[6]:https://www.crowdsupply.com/sifive/hifive1/
