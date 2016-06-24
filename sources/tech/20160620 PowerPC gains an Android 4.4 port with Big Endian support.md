translating（东风唯笑）这个是大坑啊
PowerPC gains an Android 4.4 port with Big Endian support
===========================================================

eInfochips has ported Android 4.4 to the PowerPC architecture on behalf of an avionics customer that will use it for an HMI that monitors engine health.

eInfochips has developed the first Android port to the PowerPC CPU architecture using a modern Android build and featuring Big Endian support. The port is based on Android Open Source Project (AOSP) code for Android 4.4 (KitKat) and features Kernel 3.12.19.

Android emerged around the same time that PowerPC was already in decline and quickly losing market share to ARM. Customers with high-end networking and other enterprise-oriented embedded gear running on PowerPC processors such as Freescale’s PowerQUICC and QorIQ, instead depended on Linux. Several Android ports have been attempted, however. In 2009, Freescale and Embedded Alley — now part of the Linux team at Mentor Graphics — [announced a port][15] for PowerQUICC and QorIQ chips, which are now built by NXP. Another project claiming the same feat emerged called [Android-PowerPC][16].

Not much came of these efforts, however, and when an avionics firm asked eInfochips to look into an Android application for adding an improved HMI to its PowerPC-based engine monitoring system, the company found that these earlier ports were not up to par. They would have to start from scratch.

The main problem with the previous ports was that they were for a much older, and very different, Android. Embedded Alley’s port was for Android 1.5 (Cupcake), released in 2009 and based on a Linux 2.6.28 kernel, and the last port from the Android-PowerPC project appears to be for Android 2.2 (Froyo), which was released in 2010 and based on Linux 2.6.32. The avionics customer also needed other technologies such as support for Big Endian, a legacy memory access scheme still used in the networking and telecom world. The other ports supported only Little Endian memory access.

 
### New PowerPC port from eInfochips

eInfochips, which is known around here mostly for its ARM/Snapdragon-based boards such as the [Eragon 600][17] computer-on-module, has now completed the Android 4.4 QorIQ port and has posted a white paper describing the project. The avionics customer using the technology remains unnamed, however, and it’s unclear to what extent the port will be publicly shared.


![](http://hackerboards.com/files/einfochips_porting_android_on_powerpc-sm.jpg)
>Image from eInfochips blog post

- The new PowerPC Android project includes:
- Bionic customization for PowerPC [e5500][1]
- Big Endian support in Android KitKat
- Tool chain development with GCC version 5.2
- PowerPC support in Android 4.4 framework
- Android Kernel 3.12.19 for PowerPC e5500

According to eInfochips marketing manager, Sooryanarayanan Balasubramanian, the avionics customer wanted Android primarily for its familiar interface, which reduces training time, as well as the ease in updating the system with new applications. “By successful Android porting they can allow more modifications at the application layer without undergoing the tedious certification process at all layers,” explained Balasubramanian. “This was the first time any such attempt has been made in the aerospace industry, which requires due diligence in designs.”

Porting Android to PowerPC required major modifications to the framework, core libraries, toolchain development, run-time linker, object linker, and open source compiler support, according to the white paper. When generating byte code, the porting team decided to use portable mode rather than fast interpreter mode. There is no fast interpreter available for Android on PowerPC, whereas portable mode uses the open source [libffi][18] for interpretation, which does support PowerPC.

The team also needed to choose between Android Run Time (ART) and Dalvik Virtual Machine (DVM). They found that portable mode for ART was untested and poorly documented, so they went with DVM in portable mode.

The white paper goes on to explain other challenges in the port, including developing a toolchain from scratch and rewriting scripts to overcome the problem of AOSP’s “non-standard” use of compiler flags. The finished port offers 37 services, and features a headless Android deployment along with an emulated UI in user space.

 
### Target hardware

Thanks to an image (shown farther above) in an [eInfochips blog post][2] about the company’s Android PowerPC port, we were able to identify the project’s target hardware. The board turns out to be the [X-ES Xpedite 6101][3], which is a rugged XMC/PrPMC mezzanine module.

Thanks to an image (shown farther above) in an eInfochips blog post about the company’s Android PowerPC port, we were able to identify the project’s target hardware. The board turns out to be the X-ES Xpedite 6101, which is a rugged XMC/PrPMC mezzanine module.

![](http://hackerboards.com/files/xes_xpedite6101-sm.jpg)
>X-ES Xpedite 6101 photo and block diagram

The X-ES Xpedite 6101 ships with a choice of NXP QorIQ-based T Series communications processors — the T2081, T1042, and T1022 — which integrate 8, 4, and 2 e6500 cores, respectively, running at up to 1.8GHz (T2081) or 1.4GHz (T1042/22). Each core integrates an AltiVec SIMD engine, said to offer DSP-level floating point performance. All three X-ES board models support up to 8GB of DDR3-1600 ECC SDRAM memory, plus up to 512MB of NOR and 32GB of NAND flash storage.

![](http://hackerboards.com/files/nxp_qoriq_t2081_block-sm.jpg)
>NXP T2081 block diagram

The board’s I/O includes a x4 PCI Express Gen2 channel, along with dual helpings of Gigabit Ethernet, RS232/422/485 serial, and SATA 3.0 ports. In addition to its choice of three QorIQ processors, the Xpedite 6101 is offered with support for three [X-ES ruggedization levels][19], rated for operation over 0 to 55°C, -40 to 70°C, or -40 to 85°C respectively, along with three categories of shock and vibration resistance.

Other X-ES QorIQ-based XMC/PrPMC boards we’ve covered include the [XPedite6401 and XPedite6370][20], which are supported with off-the-shelf BSPs for Linux, Wind River VxWorks, and Green Hills Integrity.

 
### Further information

The eInfochips Android PowerPC porting whitepaper is available for download [here][4] (requires free registration).

### Related posts:

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
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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


