22 The Linux Kernel: Configuring the Kernel Part 18
================================================================================
![](http://www.linux.org/attachments/slide-jpg.616/)

Aloha! Ready for the next article? In this article, we will discuss the auxiliary-screen. The auxiliary displays are small LCD screens; most are equal to or less than 128x64. Then, we will discuss Userspace IO drivers, some virtual drivers, Hyper-V, staging drivers, IOMMU, and other kernel features.

The first driver to configure for the auxiliary display is the "KS0108 LCD Controller" driver. The KS0108 LCD Controller is a graphics controller made by Samsung.

Next, the parallel port address for the LCD can be set (Parallel port where the LCD is connected). The first port address is 0x378, the next is 0x278 and the third is 0x3BC. These are not the only choices of addresses. The majority of people will not need to change this. The shell command "cat /proc/ioports" will list the available parallel ports and the addresses.

The kernel developer can set the writing delay of the KS0108 LCD Controller to the parallel port (Delay between each control writing (microseconds)). The default value is almost always correct, so this typically does not need to be changed.

The "CFAG12864B LCD" screen is a 128x64, two-color LCD screen. This screen relies on the KS0108 LCD Controller.

The refresh rate of these LCD screens can be changed (Refresh rate (hertz)). Generally, a higher refresh rate causes more CPU activity. This means slower systems will need a smaller refresh rate.

After the auxiliary displays are configured, the "Userspace I/O drivers" are then set. The userspace system allows the user's applications and processes to access kernel interrupts and memory addresses. With this enabled, some drivers will be placed in the userspace.

The "generic Hilscher CIF Card driver" is a userspace driver for Profibus cards and Hilscher CIF Cards.

The "Userspace I/O platform driver" creates a general system for drivers to be in the userspace.

The next driver is the same as above, but adds IRQ handling (Userspace I/O platform driver with generic IRQ handling).

The following driver is again like the one before, but with dynamic memory abilities added (Userspace platform driver with generic irq and dynamic memory).

Next, some vendor/device specific drivers are available.

Then, there is a generic PCI/PCIe card driver (Generic driver for PCI 2.3 and PCI Express cards).

The following driver is for "VFIO support for PCI devices". VFIO stands for Virtual Function Input/Output. VFIO allows devices to directly access userspace in a secure fashion.

The "VFIO PCI support for VGA devices" allows VGA to be supported by PCI through VFIO.

Next, are virtio drivers. Virtio is a IO virtualization platform. This virtual software is for operating system virtualization. This is required for running an operating system in a virtual machine on the Linux system.

The first virtio driver we can configure is the "PCI driver for virtio devices". This allows virtual access to PCI.

The "Virtio balloon driver" allows the memory owned by a virtual system to be expanded or decreased as needed. Generally, no one wants a virtual system to reserve memory it may never use when the host operating system needs the memory.

The following driver supports memory mapped virtio devices (Platform bus driver for memory mapped virtio devices).

If the Linux kernel being configured is intended to run on a Microsoft Hyper-V system, then enable this driver (Microsoft Hyper-V client drivers). This would allow Linux to be the guest/client system on Hyper-V.

![](http://www.linux.org/attachments/kernel_18-png.617/)

Next, we have the staging drivers. These are drivers that are under development, may change soon, or are not up to the standard quality for the Linux kernel. The only group of drivers in this category (in this kernel version 3.9.4) are the Android drivers. Yes, Android uses the Linux kernel which would make Android a Linux system. However, this is still debated. If the kernel is intended for Android, then it may be wise to enable all of the drivers.

The "Android Binder IPC Driver" provides support for Binder which is a system that allows processes to communicate with each other on Android systems.

The ashmem driver can be enabled next (Enable the Anonymous Shared Memory Subsystem). Ashmem stands for "Anonymous SHared MEMory" or "Android SHared MEMory". This supports a file-based memory system for userspace.

The "Android log driver" offers the complete Android logging system.

The "Timed output class driver" and "Android timed gpio driver" allow the Android system to manipulate GPIO pins and undo the manipulations after the timeout.

The "Android Low Memory Killer" closes processes when more memory is needed. This feature kills the tasks that are not used or inactive.

The "Android alarm driver" makes the kernel wakeup at set intervals.

After the staging drivers are configured, the next set of drivers are for the X86 platform. These drivers are vendor/device specific for X86 (32-bit) hardware.

The next driver is for "Mailbox Hardware Support". This framework controls mailbox queues and interrupt signals for hardware mailbox systems.

"IOMMU Hardware Support" links the memory to devices that are able to use DMA. IOMMU enhances DMA. The IOMMU maps addresses and blocks faulty devices from accessing the memory. IOMMU also allows hardware to access more memory than it could without IOMMU.

The "AMD IOMMU support" driver offers better IOMMU support for AMD devices.

Debugging abilities exist for the AMD IOMMU support (Export AMD IOMMU statistics to debugfs).

A newer version of the IOMMU driver exists for AMD hardware (AMD IOMMU Version 2 driver).

The Linux kernel also provides an IOMMU driver specifically for Intel devices (Support for Intel IOMMU using DMA Remapping Devices).

Some devices may be able to accept a variety of voltages and clock frequencies. This driver allows the operating system to control the device's voltage output and clock rate (Generic Dynamic Voltage and Frequency Scaling (DVFS) support). With this driver enabled, other kernel features can be enabled for power/performance management as seen below.

"Simple Ondemand" is like above, but specifically changes the clock rate based on the device's activity. Generally, more activity means the device needs a faster clock speed to accommodate for the larger resource demand.


"Performance" allows the system to set the clock speed to the maximum supported amount for best performance. This increases power consumption.

"Powersave" sets the clock rate to the lowest value to save power.

"Userspace" allows the userspace to set the clock speed.

"External Connector Class (extcon) support" provides the userspace with a way to watch external connectors like USB and AC ports. This allows applications to know if a cable was plugged into a port. Users will almost always want this enabled. If anyone has purposely disabled this for a legitimate reason, please share with us why that would be needed.

The "GPIO extcon support" driver is just like the above driver, but is made specifically for GPIO pins.

Next, there is a list of various vendor/device specific controllers for memory (Memory Controller drivers). Memory chip controllers may be separate devices or built inside the memory chips. These controllers manage the incoming and outgoing data flow.

The "Industrial I/O support" driver provides a standard interface for sensors despite the bus type they are on (that is, PCIe, spi, GPIO, etc.). IIO is a common abbreviation for Industrial Input/Output.

The Linux kernel offers support for a large variety of accelerometers, amplifiers, analog to digital converters, inertial measurement units, light sensors, magnetometer sensors, and many other sensors and converters.

The "Intel Non-Transparent Bridge support" driver supports PCIe hardware bridges which connect to systems. All writes to mapped memory will be mirrored on both systems.

"VME bridge support" is the same as above except the bridge uses VME which is a different bus standard.

"Pulse-Width Modulation (PWM) Support" controls the back-light and fan speed by regulating the average power received by such devices.

"IndustryPack bus support" offers drivers for the IndustryPack bus standards.

In the next article, we will configure the firmware drivers. Mahalo! 

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-18.4896/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:
[2]:
[3]:
[4]:
[5]:
[6]:
[7]:
[8]:
[9]:
[10]:
[11]:
[12]: