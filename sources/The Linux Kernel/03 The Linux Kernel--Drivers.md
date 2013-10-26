03 The Linux Kernel: Drivers
================================================================================
Drivers are small programs that enable the kernel to communicate and handle hardware or protocols (rules and standards). Without a driver, the kernel does not know how to communicate with the hardware or handle protocols (the kernel actually hands the commands to the BIOS and the BIOS passes them on the the hardware). The Linux Kernel source code contains many drivers (in the form of source code) in the drivers folder. Each folder within the drivers folder will be explained. When configuring and compiling the kernel, it helps to understand the drivers. Otherwise, a user may add drivers to the kernel that they do not need or leave out important drivers. The driver source code usually includes a commented line that states the purpose of the driver. For example, the source code for the tc driver has a single commented line that says the driver is for TURBOchannel buses. Because of the documentation, users should be able to look at the first few commented lines of future drivers to learn their purpose.

There are different terms that should be understood so that the information below is understandable. An I/O device is an Input/Output device. A modem and network card are examples of this; they send and receive data. A monitor is an output device - information only comes out. A keyboard, mouse, and joystick are input only - data goes into the system. Storage devices store data. Examples of these include SD cards, Hard-drives, CD-roms, memory cards, etc. The CPU (also called a processor) is the "brain" or "heart" of the computer. Without this single processing chip, the computer cannot function. A motherboard (mainboard) is a small board with printed circuits that connect to the components that are on the board. The board and the components are essential to the functionality of a computer. Many computer users say that the motherboard is the heart of the computer (the motherboard holds the CPU). The motherboard contains ports for peripherals. Peripherals include the input, output, and storage devices. A bus is the circuitry of the motherboard and connection to peripherals. Network devices deal with the connection of two or more computers. Ports are devices that users can plug another device or cable into. For example, users would plug a FireWire memory stick into a FireWire port; an Ethernet cable would go into an Ethernet port. Optical discs are read using lasers that read off of reflective surfaces that will either scatter or reflect the laser light. A common optical disk is the DVD. Many systems are 32-bit or 64-bit systems; this refers to the number of bits of registers, address buses, or data buses. For instance, on a 64-bit motherboard, the data buses (the silver lines going between components) have sixty-four lines running parallel to the same destination. Memory addresses are addresses to the memory in the form of bits (ones and zeros). So, a 32-bit memory address contains thirty-two ones and zeros that give the location of a spot on the memory.

Many of the drivers are generic driver meaning that a generic keyboard driver will allow the kernel to handle nearly every keyboard. However, some drivers are specialized. Apple and Commodore, for instance, have made specialized hardware for their Apple computer and Amiga system, respectively. The Linux kernel contains drivers for many devices like Smartphones, Apples, Amiga systems, Sony's Playstation3, Android tablets, and many others.

Notice that some drivers overlap categories. For instance, radio drivers exist in the net folder and the media directory.

**accessibility** - These drivers offer support for accessibility devices. In Linux kernel 3.9.4, only one driver is in this folder, and that is the braille device driver.

**acpi** - The Advanced Configuration and Power Interface (ACPI) drivers manage power usage.

**amba** - Advanced Microcontroller Bus Architecture (AMBA) is a protocol for the management and interconnection in a System-on-Chip (SoC). A SoC is a single chip that contains many or all essential components of a computer in one chip. The AMBA drivers in this folder allow the kernel to run on these chips.

**ata** - This directory contains drivers for PATA and SATA devices. Serial ATA (SATA) is a computer bus interface that connects host bus adapters to storage devices like hard-drives. Parallel ATA (PATA) is a standard for connecting storage devices like hard-drives, floppy drives, and optical disc drives. PATA is commonly known as IDE.

**atm** - Asynchronous Transfer Mode (ATM) is a standard for telecommunications. There are a variety of drivers in here from PCI bridges (they connect to PCI buses) and Ethernet controllers (integrated circuit chip that controls Ethernet communications).

**auxdisplay** - This folder provides three drivers - LCD framebuffer driver, LCD Controller driver, and a LCD driver. These drivers manage Liquid Crystal Display monitors. LCD monitors are the screens that ripple when pressed. NOTE: The screen can be damaged when pressed, so do not poke of push on LCD screens.

**base** - This is an important directory that contains essential base drivers for firmware, the system bus, hypervisor abilities, etc.

**bcma** - These are drivers for buses that use a protocol that are based on the AMBA protocol. These new buses are made by Broadcom.

**block** - These drivers provide the kernel with support for block devices like floppy-disk readers, SCSI tapes, block devices over TCP, etc.

**bluetooth** - Bluetooth is a secure wireless standard for Personal Area Networks (PANs). The bluetooth drivers are in this folder and allow the system to use the different bluetooth devices. For example, a bluetooth mouse lacks a cable, and the computer has a dongle (small USB receiver). The Linux system must be able to understand the mouse signals that are coming in through the dongle. Otherwise, the bluetooth device would not work.

**bus** - This directory contains three drivers. One converts the ocp interface protocol to scp protocol. The other is a driver for interconnection between devices and the third driver is error handling for interconnection.

**cdrom** - Two drivers exist in this directory. One is for cd-roms - this includes reading and writing DVDs and CDs. The driver second is for gd-roms (Gigabyte Disc Read-Only Memory). A GD is an optical disc with a 1.2GB storage capacity. This is like a large CD or small DVD. GDs are commonly used in Dreamcast game consoles.

**char** - Character device drivers are stored here. Character devices transmit data one character at a time. Some included drivers in the folder are printers, PS3 flash ROM storage driver, Toshiba SMM drivers, and random number generator driver.

**clk** - These drivers are for the system clock.

**clocksource** - These drivers use the clock as a timer.

**connector** - These drivers supply the kernel with the ability to know when processes fork and execute as well as changing the UID (User ID), GID (Group ID), and SID (session ID) using what is called a proc connector. The kernel needs to know when process fork (run multiple tasks in the CPU) and execute. Otherwise, the kernel may have inefficiencies in managing resources.

**cpufreq** - These drivers control the CPU by changing power consumption.

**cpuidle** - These drivers manage the idleness of the CPU/s. If the system uses multiple CPUs, then one of the drivers will try to keep the idleness the same.

**crypto** - These drivers provide cryptographic features like encryption.

**dca** - Direct Cache Access drivers allow the kernel to access the CPU cache. The CPU cache is like a RAM storage built into the CPU chip. The CPU cache is faster than the RAM chip. However, the CPU cache has a much lower space capacity than the RAM. The CPU stores the most important and executed code on this cache system.

**devfreq** - This driver provides a Generic Dynamic Voltage and Frequency Scaling (DVFS) Framework which changes the CPU frequency as needed to conserve energy. This is known as CPU throttling.

**dio** - The Digital Input/Output bus drivers allow the kernel to use DIO buses.

**dma** - The Direct memory access (DMA) driver allows devices to access without needing the CPU. This reduces the load on the CPU.

**edac** - The Error Detection And Correction drives help reduce and correct errors.

**eisa** - The Extended Industry Standard Architecture drivers provide EISA bus support to the kernel.

**extcon** - The EXTernal CONnectors driver detects changes in the ports when a device is plugged in. For instance, extcon will detect if a user plugs in a USB drive.

**firewire** - These drivers control FireWire devices which are USB-like devices made by Apple.

**firmware** - These drivers communicate with the firmware of the device like the BIOS (the Basic Input Output System firmware of a computer). The BIOS is used to boot up the operating system and control the hardware and firmware of the device. Some BIOS systems allow user's to overclock the CPU. Overclocking is making the CPU operate at a faster speed. The CPU speed is measured in MHz (Mega-Hertz) or GHz. A CPU with a clock speed of 3.7GHz is significantly faster than a 700MHz processor.

**gpio** - General Purpose Input/Output (GPIO) is a generic pin on a chip whose behavior can be controlled by the user. The drivers here control GPIO.

**gpu** - The drivers in this folder control the Video Graphics Array (VGA), Graphics Processing Unit (GPU), and Direct Rendering Manager (DRM). VGA is the 640×480 resolution analog computer displays or simply the resolution standard. A GPU is a processor for graphics. DRM is a rendering system for Unix systems.

**hid** - These drivers provide support for USB Human Interface Devices.

**hsi** - This driver offers the kernel the ability to access the cellular modem on the Nokia N900.

**hv** - These drivers provide Key Value Pair (KVP) functionality to Linux systems.

**hwmon** - The HardWare MONitoring drivers allow the kernel to get the readings from sensors in the hardware. For example, the CPU has a thermometer. The kernel can then keep track of the temperature and change the fan speed accordingly.

**hwspinlock** - The hardware spinlock drivers allow systems to use two or more processors that are different or a single processor with two or more different cores.

**i2c** - I2C drivers enable the I2C protocol which handle low-speed peripherals attached to the motherboard. The System Management Bus (SMBus) driver manages SMBuses which is a single two-wire bus for lightweight communication.

**ide** - These drivers are for PATA/IDE devices like cdroms and hard-drives.

**idle** - This driver manages the idleness of Intel processors.

**iio** - The Industrial I/O core drivers handle analog to digital or digital to analog converters.

**infiniband** - Infiniband is a high-performance port used by enterprise datacenters and some supercomputers. The drivers in this directory support Infiniband hardware.

**input** - This directory contains many drivers. All of the drivers deal with input and some include drivers for joysticks, mice, keyboards, gameport (old joystick connectors), remotes, haptic controllers, headphone buttons, and many others. Joysticks today use USB ports, but in the 1980s and 1990s, joysticks plugged into gameports.

**iommu** - Input/Output Memory Management Unit (IOMMU) drivers manage the IOMMU which is a form of Memory Management Unit (MMU). The IOMMU connects a DMA-capable I/O bus to the RAM. The IOMMU is the bridge between devices and access to the RAM without help from the CPU. This helps to reduce the processors load.

**ipack** - Ipack stands for IndustryPack. This driver is for a virtual bus that allows operations between carrier and mezzanine boards.

**irqchip** - These drivers allow interrupt requests (IRQ) which are hardware signals sent to the processor that temporarily stop a running program for a special program(called an interrupt handler) to run instead.

**isdn** - These drivers support Integrated Services Digital Network (ISDN) which is a set of communication standards for simultaneous digital transmission of voice, video, data, and other network services using traditional circuits of the telephone network.

**leds** - These drivers support LEDS.

**lguest** - The lguest drivers manage interrupts that are used with guest operating system. Interrupts are hardware or software signals that interrupt the CPU for important tasks. The CPU then gives the hardware or software some processing resources.

**macintosh** - Drivers for Apple devices belong in this directory.

**mailbox** - The driver in this folder (pl320-pci) manages connections for mail systems.

**md** - The Multiple Devices driver supports RAID (Redundant Array of Independent Disks) - a system of many hard-drives sharing or replicating data.

**media** - The media drivers offer support in radios, tuners, video capturers, DVB standards for digital television, etc. The drivers also support various media devices that plug in through USB or FireWire ports.

**memory** - This important driver supports the RAM.

**memstick** - This driver supports Sony memorysticks.

**message** - These drivers are to be used with LSI PCI chip/adapter(s) running LSI Fusion MPT (Message Passing Technology) firmware. LSI stands for Large-Scale Integration which are integrated circuits with tens of thousands of transistors per chip.

**mfd** - MultiFunction Device (MFD) drivers provide support for multifunction devices which are devices that provide multiple services like email, fax, copy machine, scanner, and printer. The drivers in here also add a generic MCP (Multimedia Communications Port) layer which is a protocol for MFDs.

**misc** - This directory contains miscellaneous drivers that do not fit in any other category like light sensor drivers.

**mmc** - MultiMediaCard (MMC) drivers handle the MMC standard that is used in flash memory cards.

**mtd** - Memory technology devices (MTD) are drivers used in Linux for interacting with flash memory like a Flash Translation Layer. Other block and character drivers do not map the same way flash memory devices operate. Although USB memory cards and SD cards are flash drives, they do not use this driver because they are hidden from the system behind a block device interface. This driver is a generic flash drive driver for new flash devices.

**net** - The network drivers provide network protocols like Appletalk, TCP, and others. The drivers also support modems, USB 2.0 Ethernet Devices, and radio devices.

**nfc** - This driver is the interface between Texas Instrument's Shared Transport Layer and NCI core.

**ntb** - The Non-Transparent Bridging driver provides non-transparent bridging in PCI express (PCIe) systems. PCIe is a high-speed expansion bus standard.

**nubus** - NuBus is a 32-bit parallel computer bus. The driver supports this Apple device.

**of** - This driver provides OF helpers which are procedures for creating, accessing and interpreting the device tree. The Device Tree is a data structure for describing hardware.

**oprofile** - This driver profiles the whole system from drivers to user-space processes (applications running under the user's name). This helps developers find performance problems.

**parisc** - These drivers are for PA-RISC devices which are made by HP. PA-RISC is a specific instruction set for processors.

**parport** - The Parport drivers provides parallel-port support under Linux.

**pci** - These drivers offer PCI bus services.

**pcmcia** - These are laptop motherboard drivers.

**pinctrl** - These drivers handle pin control devices. Pin controllers can disable and enable I/O devices.

**platform** - This directory contains drivers for the different computer platforms like Acer, Dell, Toshiba, IBM, Intel, ChromeBooks, etc.

**pnp** - The Plug-aNd-Play drivers allow users to plug in a device, like a USB device, and use it immediately without the need to manually configure the device.

**power** - The power drivers allow the kernel to measure the battery power, detect chargers, and power management.

**pps** - Pulse-Per-Second drivers control an electrical pulse rate that is used for time keeping.

**ps3** - These are the drivers for Sony's game console - Playstation3.

**ptp** - Picture Transfer Protocol (PTP) drivers support a protocol for transferring images from digital cameras.

**pwm** - Pulse-width modulation (PWM) drivers control the pulse of the electricity to devices, mainly motors like the CPU fan.

**rapidio** - RapidIO drivers manage the RapidIO architecture which is a high-performance packet-switched, interconnect technology for interconnecting chips on a circuit board, and also circuit boards to each other using a backplane.

**regulator** - The regulator drivers regulate the electricity, temperature, and any other regulator hardware that may exist on a system.

**remoteproc** - These drivers manage remote processors.

**rpmsg** - These drivers control Remote Processor MeSsaginG buses which can support a number of drivers. These buses supply the messaging infrastructure, facilitating client drivers to write their own wire-protocol messages.

**rtc** - The Real Time Clock (RTC) drivers allow the kernel to read the clock.

**s390** - The drivers are for the 31/32-bit mainframe architecture.

**sbus** - The SPARC-based buses are managed by these drivers.

**scsi** - SCSI drivers allow the kernel to use the SCSI standard with peripheral devices. For instance, Linux would be using a SCSI driver when it transmits data with a SCSI hard-drive.

**sfi** -The Simple Firmware Interface (SFI) drivers allow firmware to send tables of information to the operating system. These tables of data are called SFI tables.

**sh** - These drivers are for SuperHyway buses.

**sn** - These drivers add support for IOC3 serial ports.

**spi** - These drivers handle the Serial Peripheral Interface Bus (SPI bus) which is a synchronous serial data link standard that operates in full duplex mode. Full duplex mode is seen when two devices can both send and receive information at the same time. Duplex refers to two-way communication. Devices communicate in master/slave mode (device configuration).

**ssb** - Sonics Silicon Backplane drivers provide support for a mini-bus used on various Broadcom chips and embedded devices.

**staging** - This directory contains numerous subdirectories with many drivers. All of the contained drivers are drivers that need more development before being added to the mainstream kernel.

**target** - These are drivers for SCSI targets.

**tc** - These are drivers for TURBOchannel. TURBOchannel is a 32-bit open bus developed by the Digital Equipment Corporation. These buses are commonly used in DECstations.

**thermal** - The thermal drivers make sure that the CPU stays cool.

**tty** - The tty drivers manage the connection to a physical terminal.

**uio** - This driver allows the user to make drivers that run in the user space instead of the kernel space. This keeps the user's driver from causing the kernel to crash.

**usb** - The USB drivers allow the kernel to use USB ports. Flash drivers and memory cards already contain firmware and a controller, so these drivers allow the kernel to use the USB ports and talk to the USB device.

**uwb** - The Ultra-WideBand driver manages very low energy level radio devices for short-range, high-bandwidth communications.

**vfio** - The VFIO driver allows devices to access the userspace.

**vhost** - This driver is for a virtio server in the host kernel. This is used for virtualization.

**video** - Video drivers are needed to manage the graphics card and monitor.

**virt** - These drivers are for virtualization.

**virtio** - This driver allows virtio devices to be used over a virtual PCI device. This is used for virtualization.

**vlynq** - This driver controls a proprietary interface developed by Texas Instruments. These are broadband products, like WLAN and modems, VOIP processors, and audio and digital media processor chips.

**vme** - VMEbus is a bus standard originally developed for the Motorola 68000 line of processors.

**w1** - These drivers control one-wire buses.

**watchdog** - This driver manages the watchdog timer which is a timer that is used to detect and recover from malfunctions.

**xen** - This driver is for the Xen hypervisor system. A hypervisor is software or hardware that allows users to run multiple operating systems on a single computer. This means that the xen code would allow users to have two or more Linux system running on one computer at the same time. Users could also run Windows, Solaris, FreeBSD, or some other operating system on the Linux system.

**zorro** - This driver offers support for the Zorro Amiga buses.



--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-drivers.4205/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出