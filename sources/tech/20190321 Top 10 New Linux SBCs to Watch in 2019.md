[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Top 10 New Linux SBCs to Watch in 2019)
[#]: via: (https://www.linux.com/blog/2019/3/top-10-new-linux-sbcs-watch-2019)
[#]: author: (Eric Brown https://www.linux.com/users/ericstephenbrown)

Top 10 New Linux SBCs to Watch in 2019
======

![UP Xtreme][1]

Aaeon's Linux-ready UP Xtreme SBC.

[Used with permission][2]

A recent [Global Market Insights report][3] projects the single board computer market will grow from $600 million in 2018 to $1 billion by 2025. Yet, you don’t need to read a market research report to realize the SBC market is booming. Driven by the trends toward IoT and AI-enabled edge computing, new boards keep rolling off the assembly lines, many of them [tailored for highly specific applications][4].

Much of the action has been in Linux-compatible boards, including the insanely popular Raspberry Pi. The number of different vendors and models has exploded thanks in part to the rise of [community-backed, open-spec SBCs][5].

Here we examine 10 of the most intriguing, Linux-driven SBCs among the many products announced in the last four weeks that bookended the recent [Embedded World show][6] in Nuremberg. (There was also some [interesting Linux software news][7] at the show.) Two of the SBCs—the Intel Whiskey Lake based UP Xtreme and Nvidia Jetson Nano driven Jetson Nano Dev Kit—were announced only this week.

Our mostly open source list also includes a few commercial boards. Processors range from the modest, Cortex-A7 driven STM32MP1 to the high-powered Whiskey Lake and Snapdragon 845. Mid-range models include Google’s i.MX8M powered Coral Dev Board and a similarly AI-enhanced, TI AM5729 based BeagleBone AI. Deep learning acceleration chips—and standard RPi 40-pin or 96Boards expansion connectors—are common themes among most of these boards.

The SBCs are listed in reverse chronological order according to their announcement dates. The links in the product names go to recent LinuxGizmos reports, which link to vendor product pages.

**[UP Xtreme][8]** —The latest in Aaeon’s line of community-backed SBCs taps Intel’s 8th Gen Whiskey Lake-U CPUs, which maintain a modest 15W TDP while boosting performance with up to quad-core, dual threaded configurations. Depending on when it ships, this Linux-ready model will likely be the most powerful community-backed SBC around -- and possibly the most expensive.

The SBC supports up to 16GB DDR4 and 128GB eMMC and offers 4K displays via HDMI, DisplayPort, and eDP. Other features include SATA, 2x GbE, 4x USB 3.0, and 40-pin “HAT” and 100-pin GPIO add-on board connectors. You also get mini-PCIe and dual M.2 slots that support wireless modems and more SATA options. The slots also support Aaeon’s new AI Core X modules, which offer Intel’s latest Movidius Myriad X VPUs for 1TOPS neural processing acceleration.

**[Jetson Nano Dev Kit][9]** —Nvidia just announced a low-end Jetson Nano compute module that’s sort of like a smaller (70 x 45mm) version of the old Jetson TX1. It offers the same 4x Cortex-A57 cores but has an even lower-end 128-core Maxwell GPU. The module has half the RAM and flash (4GB/16GB) of the TX1 and TX2, and no WiFi/Bluetooth radios. Like the hexa-core Jetson TX2, however, it supports 4K video and the GPU offers similar CUDA-X deep learning libraries.

Although Nvidia has backed all its Linux-driven Jetson modules with development kits, the Jetson Nano Dev Kit is its first community-backed, maker-oriented kit. It does not appear to offer open specifications, but it costs only $99 and there’s a forum and other community resources. Many of the specs match or surpass the Raspberry Pi 3B+, including the addition of a 40-pin GPIO. Highlights include an M.2 slot, GbE with Power-over-Ethernet, HDMI 2.0 and eDP links, and 4x USB 3.0 ports.

**[Coral Dev Board][10]** —Google’s very first Linux maker board arrived earlier this month featuring an NXP i.MX8M and Google’s Edge TPU AI chip—a stripped-down version of Google’s TPU Unit is designed to run TensorFlow Lite ML models. The $150, Raspberry Pi-like Coral Dev Board was joined by a similarly Edge TPU-enabled Coral USB Accelerator USB stick. These will be followed by an Edge TPU based Coral PCIe Accelerator and a Coral SOM compute module. All these devices are backed with schematics, community resources, and other open-spec resources.

The Coral Dev Board combines the Edge TPU chip with NXP’s quad-core, 1.5GHz Cortex-A53 i.MX8M with a 3D Vivante GPU/VPU and a Cortex-M4 MCU. The SBC is even more like the Raspberry Pi 3B+ than Nvidia’s Dev Kit, mimicking the size and much of the layout and I/O, including the 40-pin GPIO connector. Highlights include 4K-ready GbE, HDMI 2.0a, 4-lane MIPI-DSI and CSI, and USB 3.0 host and Type-C ports.

**[SBC-C43][11]** —Seco’s commercial, industrial temperature SBC-C43 board is the first SBC based on NXP’s high-end, up to hexa-core i.MX8. The 3.5-inch SBC supports the i.MX8 QuadMax with 2x Cortex-A72 cores and 4x Cortex-A53 cores, the QuadPlus with a single Cortex-A72 and 4x -A53, and the Quad with no -A72 cores and 4x -A53. There are also 2x Cortex-M4F real-time cores and 2x Vivante GPU/VPU cores. Yocto Project, Wind River Linux, and Android are available.

The feature-rich SBC-C43 supports up to 8GB DDR4 and 32GB eMMC, both soldered for greater reliability. Highlights include dual GbE, HDMI 2.0a in and out ports, WiFi/Bluetooth, and a variety of industrial interfaces. Dual M.2 slots support SATA, wireless, and more.

**[Nitrogen8M_Mini][12]** —This Boundary Devices cousin to the earlier, i.MX8M based Nitrogen8M is available for $135, with shipments due this Spring. The open-spec Nitrogen8M_Mini is the first SBC to feature NXP’s new i.MX8M Mini SoC. The Mini uses a more advanced 14LPC FinFET process than the i.MX8M, resulting in lower power consumption and higher clock rates for both the 4x Cortex-A53 (1.5GHz to 2GHz) and Cortex-M4 (400MHz) cores. The drawback is that you’re limited to HD video resolution.

Supported with Linux and Android, the Nitrogen8M_Mini ships with 2GB to 4GB LPDDR4 RAM and 8GB to 128GB eMMC. MIPI-DSI and -CSI interfaces support optional touchscreens and cameras, respectively. A GbE port is standard and PoE and WiFi/BT are optional. Other features include 3x USB ports, one or two PCIe slots, and optional -40 to 85°C support. A Nitrogen8M_Mini SOM module with similar specs is also in the works.

**[Pine H64 Model B][13]** —Pine64’s latest hacker board was teased in late January as part of an [ambitious roll-out][14] of open source products, including a laptop, tablet, and phone. The Raspberry Pi semi-clone, which recently went on sale for $39 (2GB) or $49 (3GB), showcases the high-end, but low-cost Allwinner H64. The quad -A53 SoC is notable for its 4K video with HDR support.

The Pine H64 Model B offers up to 128GB eMMC storage, WiFi/BT, and a GbE port. I/O includes 2x USB 2.0 and single USB 3.0 and HDMI 2.0a ports plus SPDIF audio and an RPi-like 40-pin connector. Images include Android 7.0 and an “in progress” Armbian Debian Stretch.

**[AI-ML Board][15]** —Arrow unveiled this i.MX8X based SBC early this month along with a similarly 96Boards CE Extended format, i.MX8M based Thor96 SBC. While there are plenty of i.MX8M boards these days, we’re more intrigued with the lowest-end i.MX8X member of the i.MX8 family. The AI-ML Board is the first SBC we’ve seen to feature the low-power i.MX8X, which offers up to 4x 64-bit, 1.2GHz Cortex-A35 cores, a 4-shader, 4K-ready Vivante GPU/VPU, a Cortex-M4F chip, and a Tensilica HiFi 4 DSP.

The open-spec, Yocto Linux driven AI-ML Board is targeted at low-power, camera-equipped applications such as drones. The board has 2GB LPDDR4, Ethernet, WiFi/BT, and a pair each of MIPI-DSI and USB 3.0 ports. Cameras are controlled via the 96Boards 60-pin, high-power GPIO connector, which is joined by the usual 40-pin low-power link. The launch is expected June 1.

**[BeagleBone AI][16]** —The long-awaited successor to the Cortex-A8 AM3358 based BeagleBone family of boards advances to TIs dual-core Cortex-A15 AM5729, with similar PowerVR GPU and MCU-like PRU cores. The real story, however, is the AI firepower enabled by the SoC’s dual TI C66x DSPs and four embedded-vision-engine (EVE) neural processing cores. BeagleBoard.org claims that calculations for computer-vision models using EVE run at 8x times the performance per watt compared to the similar, but EVE-less, AM5728. The EVE and DSP chips are supported through a TIDL machine learning OpenCL API and pre-installed tools.

Due to go on sale in April for about $100, the Linux-powered BeagleBone AI is based closely on the BeagleBone Black and offers backward header, mechanical, and software compatibility. It doubles the RAM to 1GB and quadruples the eMMC storage to 16GB. You now get GbE and high-speed WiFi, as well as a USB Type-C port.

**[Robotics RB3 Platform (DragonBoard 845c)][17]** —Qualcomm and Thundercomm are initially launching their 96Boards CE form factor, Snapdragon 845-based upgrade to the Snapdragon 820-based [DragonBoard 820c][18] SBC as part of a Qualcomm Robotics RB3 Platform. Yet, 96Boards.org has already posted a [DragonBoard 845c product page][17], and we imagine the board will be available in the coming months without all the robotics bells and whistles. A compute module version is also said to be in the works.

The 10nm, octa-core, “Kryo” based Snapdragon 845 is one of the most powerful Arm SoCs around. It features an advanced Adreno 630 GPU with “eXtended Reality” (XR) VR technology and a Hexagon 685 DSP with a third-gen Neural Processing Engine (NPE) for AI applications. On the RB3 kit, the board’s expansion connectors are pre-stocked with Qualcomm cellular and robotics camera mezzanines. The $449 and up kit also includes standard 4K video and tracking cameras, and there are optional Time-of-Flight (ToF) and stereo SLM camera depth cameras. The SBC runs Linux with ROS (Robot Operating System).

**[Avenger96][19]** —Like Arrow’s AI-ML Board, the Avenger96 is a 96Boards CE Extended SBC aimed at low-power IoT applications. Yet, the SBC features an even more power-efficient (and slower) SoC: ST’s recently announced [STM32MP153][20]. The Avenger96 runs Linux on the high-end STM32MP157 model, which has dual, 650MHz Cortex-A7 cores, a Cortex-M4, and a Vivante 3D GPU.

This sandwich-style board features an Avenger96 module with the STM32MP157 SoC, 1GB of DDR3L, 2MB SPI flash, and a power management IC. It’s unclear if the 8GB eMMC and WiFi-ac/Bluetooth 4.2 module are on the module or carrier board. The Avenger96 SBC is further equipped with GbE, HDMI, micro-USB OTG, and dual USB 2.0 host ports. There’s also a microSD slot and the usual 40- and 60-pin GPIO connectors. The board is expected to go on sale in April.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2019/3/top-10-new-linux-sbcs-watch-2019

作者：[Eric Brown][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/ericstephenbrown
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/aaeon_upxtreme.jpg?itok=QnwAt3mp (UP Xtreme)
[2]: /LICENSES/CATEGORY/USED-PERMISSION
[3]: https://www.globenewswire.com/news-release/2019/02/13/1724445/0/en/Single-Board-Computer-Market-to-surpass-1bn-by-2025-Global-Market-Insights-Inc.html
[4]: https://www.linux.com/blog/2019/1/linux-hacker-board-trends-2018-and-beyond
[5]: http://linuxgizmos.com/catalog-of-122-open-spec-linux-hacker-boards/
[6]: https://www.embedded-world.de/en
[7]: https://www.linux.com/news/2019/2/embedded-linux-software-highlights-embedded-world
[8]: http://linuxgizmos.com/latest-up-board-combines-whiskey-lake-with-ai-core-x-modules/
[9]: http://linuxgizmos.com/trimmed-down-jetson-nano-modules-ships-on-99-linux-dev-kit/
[10]: http://linuxgizmos.com/google-launches-i-mx8m-dev-board-with-edge-tpu-ai-chip/
[11]: http://linuxgizmos.com/first-i-mx8-quadmax-sbc-breaks-cover/
[12]: http://linuxgizmos.com/open-spec-nitrogen8m_mini-sbc-ships-along-with-new-mini-based-som/
[13]: http://linuxgizmos.com/revised-allwiner-h64-based-pine-h64-sbc-has-rpi-size-and-gpio/
[14]: https://www.linux.com/blog/2019/2/pine64-launch-open-source-phone-laptop-tablet-and-camera
[15]: http://linuxgizmos.com/arrows-latest-96boards-sbcs-tap-i-mx8x-and-i-mx8m/
[16]: http://linuxgizmos.com/beaglebone-ai-sbc-features-dual-a15-soc-with-eve-ai-cores/
[17]: http://linuxgizmos.com/robotics-kit-runs-linux-on-new-dragonboard-845c-96boards-sbc/
[18]: http://linuxgizmos.com/debian-driven-dragonboard-expands-to-96boards-extended-spec/
[19]: http://linuxgizmos.com/sandwich-style-96boards-sbc-runs-linux-on-sts-new-cortex-a7-m4-soc/
[20]: https://www.linux.com/news/2019/2/st-spins-its-first-linux-powered-cortex-soc
