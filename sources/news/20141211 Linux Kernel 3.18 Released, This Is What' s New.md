Translating-----------geekpi

Linux Kernel 3.18 Released, This Is What’s New
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2011/07/Tux-psd3894.jpg)

TuxlogoA new month means a new stable release of the Linux Kernel and today Linus Torvalds has obliged, [announcing the immediate availability of Linux 3.18][1]. 

Posted on the Linux Kernel Mailing List, Torvalds explains that while a few niggling issues persist in 3.17 for a small number of users, there was ‘**absolutely no point in having everybody else twiddling their thumbs when a couple of people are actively trying to bisect an older issue**’.

### What’s New In Linux 3.18? ###

The Linux 3.18 kernel is amped up with some of the latest improvements in  hardware support, power efficiency, bug fixes and reliability.

As ever, these span the breadth of comprehension, going from bamboozling — e.g., multi buffer operations for cryptographic layers — to the air-punchingly understandable, like support for the Razer Sabertooth gamepad.

We’ve compiling some of the notable changes made in this release below. It’s far, far, far from being exhaustive, and cherry picks the more relatable.

- Nouveau (free Nvidia GPU driver) now supports basic DisplayPort audio
- Support for the Razer Sabertooth gamepad, maps it as Xbox 360 controller
- Xilinx USB2 peripherals
- Touchscreen support for Microchip AR1021 i2c, PenMount 6000 touch
- Audio codecs:  Cirrus Logic CS35L32, Everest ES8328and Freescale ES8328 
- Audio support: Generic Freescale sound cards, Analog Devices SSM4567 audio amplifier
- Various filesystem improvements, including Btrfs and F2FS
- DCTCP congestion control algorithm now supported
- JIT compilation of eBPF programs on 64-bit builds
- “Tinification” patches to help developers compile leaner, smaller kernels

#### Installing Linux 3.18 on Ubuntu ####

Although classed as stable and bringing numerous new changes to the table, don’t feel in a rush to try and upgrade your own OS to it anytime soon. Unless you’re adept at handling the sort of monitor-smashing, CPU-charring, rage-inducing issues that arise from swapping out the engine in your OS motor, you shouldn’t.

If you insist, you’ll find source packages available at the kernel.org website.

- [Download the Linux Kernel Source Packages][2]

A mainline kernel archive is maintained by Canonical to provide builds of newer Linux kernels for use by Ubuntu developers. But, and you really should note this, these are not intended for end users, despite what you may read elsewhere. With no guarantee or support, use at your own risk.

- [Visit the Ubuntu Kernel Mainline Archive][3]

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/12/linux-kernel-3-18-released-whats-new

作者：[Joey-Elijah Sneddon][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:https://lkml.org/lkml/2014/12/7/202
[2]:https://www.kernel.org/pub/linux/kernel/v3.x/
[3]:http://kernel.ubuntu.com/~kernel-ppa/mainline/?C=N;O=D