martin
ST Releases Free Linux IDE for 32-Bit MCUs
=================================================

![](http://www.linux.com/images/stories/66866/STM32_Nucleo_expansion_board.jpg)

The 32-bit microcontroller world is starting to open up to Linux. This week, leading ARM Cortex-M vendor STMicroelectronics (ST) [released](http://www.st.com/web/en/press/p3781) a free Linux desktop version of its development software for its line of STM32 microcontroller units (MCUs). The tools include ST’s STM32CubeMX configurator and initialization tool, as well as its [System Workbench for STM32 (SW4STM32)](http://www.st.com/web/catalog/tools/FM147/CL1794/SC961/SS1533/PF261797) , an Eclipse-based IDE created by Ac6 Tools. SW4STM32 is supported with toolchain, forums, blogs, and technical support by the [openSTM32.org](http://www.openstm32.org/tiki-index.php?page=HomePage) development community.

"The Linux community is known to attract creative free-thinkers who are adept at sharing ideas and solving challenges efficiently," stated Laurent Desseignes, Microcontroller Ecosystem Marketing Manager, Microcontroller Division, STMicroelectronics. "We are now making it ultra-easy for them to apply their skills to create imaginative new products, leveraging the features and performance of our STM32 family."

Linux is the leading platform for Internet of Things gateways and hubs, as well as higher-end IoT endpoints. Yet, much of the IoT revolution, as well as the wearables market, is based on tiny, low-power microcontrollers, increasingly Cortex-M chips. A small subset of these can run the stripped-down uCLinux (see below), but none support more comprehensive Linux distributions. Instead, they are controlled with real-time operating systems (RTOSes) or go bare-bones with no OS at all. The firmware development work is typically done on a Windows-based Integrated Development Environment (IDE).

With ST’s free tools, Linux developers can more easily tap this new realm. ST’s tools, some of which should also be available for Mac OS/X in the second quarter, work with [STM32 Nucleo](http://www.st.com/web/en/catalog/tools/FM146/CL2167/SC2003?icmp=sc2003_pron_pr-stm32f446_dec2014&sc=stm32nucleo-pr5) boards, Discovery kits, and Evaluation boards. The Nucleo boards are available in 32-, 64-, and 144-pin versions, and offer hardware add-ons such as Arduino connectors.

The STM32CubeMX configurator and SW4STM32 IDE enable Linux developers to configure microcontrollers and develop and debug code. SW4STM32 supports the ST-LINK/V2 debugging tool under Linux via an adapted version of the [OpenOCD](http://openocd.org/) community project.

The software is compatible with microcontroller firmware within the STM32Cube embedded-software packages or Standard Peripheral Library, says ST. Targets include ST’s full range of MCUs, from entry-level Cortex-M0 cores to high-performing M7 chips, including M0+, M3, and DSP-extended M4 cores.

ST is not the first 32-bit MCU vendor to offer Linux-ready IDEs for Cortex-M chips, but it appears to be one of the first major free Linux platforms. For example, NXP, whose share of the MCU market increased with its recent acquisition of Freescale (Kinetis MCUs, among others), offers an [LPCXpresso IDE](http://www.nxp.com/pages/lpcxpresso-ide:LPCXPRESSO) with Linux, Windows, and Mac support. However, LPCXpresso costs $450 per individual seat.

Microsemi, which integrates Cortex-M3 chips in its [SmartFusion FPGA SoCs](http://www.microsemi.com/products/fpga-soc/soc-processors/arm-cortex-m3) has a [Libero IDE](http://www.linux.com/news/embedded-mobile/mobile-linux/884961-st-releases-free-linux-ide-for-32-bit-mcus#device-support) available for Red Hat Enterprise Linux (RHEL) in addition to Windows. However, Libero requires a license, and the RHEL version lacks support for add-on packages such as FlashPro and SoftConsole.

## Why Learn MCU-Speak?

Even if a Linux developer has no plans to load uClinux on a Cortex-M chip, knowledge of MCUs should come in handy. This is especially true with complex, heterogeneous IoT projects that extend from MCU-based endpoints to cloud platforms.

For prototyping and hobbyist projects, an interface to an Arduino board offers fairly easy access to MCU benefits. Yet beyond prototyping, developers often replace the Arduino board and its 8-bit ATmega32u4 MCU with a faster 32-bit Cortex-M chip with additional functionality. This includes improved memory addressing, independent clock settings for the core and various buses, and in the case of some [Cortex-M7](http://www.electronicsnews.com.au/products/stm32-mcus-with-arm-cortex-m7-processors-and-graph) chips, rudimentary graphics.

Other categories where MCU development skills might come in handy include wearables, where low power, low cost, and small size give MCUs an edge, and robotics and drones where real-time processing and motor control are the main benefits. In robotics, you’re likely to see Cortex-A and Cortex-M both integrated in the same product.

There’s also a modest trend toward system-on-chips adding MCUs to Linux-driven Cortex-A cores, as with the [NXP i.MX6 SoloX](http://linuxgizmos.com/freescales-popular-i-mx6-soc-sprouts-a-cortex-m4-mcu/). While most embedded projects don’t use such hybrid SoCs or combine applications processor and MCUs on the same product, developers may increasingly find themselves working on product lines that extend from low-end MCU models to Linux- or Android-driven Cortex-A based designs.

## uClinux Stakes Linux Claim in MCUs

With the rise of IoT, we’re starting to see more SBCs and computer-on-modules that run uClinux on 32-bit MCUs. Unlike other Linux distributions, uClinux does not require a memory management unit (MMU). uClinux does, however, have higher memory requirements than most MCUs can meet. The distro requires higher end Cortex-M4 and Cortex-M4 MCUs with built-in memory controllers supporting external DRAM chips.

[Amptek’s iCon](http://www.semiconductorstore.com/Amptek/) SBCs run uClinux on NXP LPC Cortex-M3 and -M4 chips, offering familiar trappings like WiFi, Bluetooth, USB, and other interfaces. Arrow’s [SF2+](http://linuxgizmos.com/iot-dev-kit-runs-uclinux-on-a-microsemi-cortex-m3-fpga-soc/) IoT development kit runs uClinux on an Emcraft Systems SmartFusion2 COM based on Microsemi’s 166MHz, Cortex-M3/FPGA SmartFusion2 hybrid SoC.

[Emcraft](http://www.emcraft.com/), which sells uClinux-based COMs based on ST and NXP, as well as Microsemi MCUs, has been actively promoting the role of uClinux on 32-bit MCUs. Increasingly, uClinux is up against ARM’s own [Mbed OS](http://linuxgizmos.com/arm-announces-mbed-os-for-iot-devices/), at least on high-end MCU projects that require wireless communications and more sophisticated rules-based operation. Proponents of Mbed and modern, open source RTOSes like FreeRTOS say that uClinux requires too much RAM overhead to make it affordable for IoT endpoints. However, Emcraft and other uCLinux proponents claim the costs are overstated, and are worth the more extensive Linux wireless and interface support available even in a stripped down distro like uClinux.

When asked for comment on the ST release, Emcraft director of engineering Vladimir Khusainov had this to say: “ST’s decision to port its development tools to Linux is good news for Emcraft since it allows Linux users an easy way to start working with embedded STM MCUs. We expect that, having had a chance to get familiar with STM devices using the ST configurator and embedded libraries, some of those users may become interested in running embedded Linux (in its uClinux form) on the target.”

For a recent overview of uClinux on Cortex-M4, check out this [slide show](http://events.linuxfoundation.org/sites/events/files/slides/optimize-uclinux.pdf) from last year’s Embedded Linux Conference by Jim Huang and Jeff Liaw. More on Cortex-M processors in general may be found in this tidy [AnandTech overview](http://www.anandtech.com/show/8400/arms-cortex-m-even-smaller-and-lower-power-cpu-cores).

------------------------------------------------------------------------------

via: http://www.linux.com/news/embedded-mobile/mobile-linux/884961-st-releases-free-linux-ide-for-32-bit-mcus

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linux.com/community/forums/person/42808
