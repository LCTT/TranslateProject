Translating------------------------geekpi

10 The Linux Kernel: Configuring the Kernel Part 6
================================================================================
![](http://www.linux.org/attachments/slide-jpeg.464/)

Welcome to the next article on configuring the Linux kernel! There are still numerous options to configure. This particular article will mainly discuss configuring PCI and ACPI.

Here, we can enable support for ACPI-controlled docking stations and removable drive bays (Dock). Remember, ACPI (Advanced Configuration and Power Management Interface) is a power management system. A docking station is a device that allows extra devices to be plugged in through extra ports. A docking station may contain many various ports and connectors. So, an ACPI-controlled docking station is a docking station that has its power managed by ACPI. A drive bay is a set of hardware for adding hard-drives. This too can be managed by ACPI.

Next, we can allow ACPI to be used as the idle manager for the CPU (Processor). This will cause the processor to enter the ACPI C2 and C3 states when idle. This will save power and reduce the temperature of the CPU chip. Processors only idle when they are 100% free. No application must request CPU resources for a set period of time.

There are four CPU power states – C0, C1, C2, and C3. C0 is the active operating state. C1 (Halt) is an active state that is not executing instructions, but can do so instantly. C2 (Stop-Clock) is a powered down state. C3 (Sleep) is more powered down than C2. In C3, the cache is now longer synchronized or managed until the CPU leaves this state. There is a fifth state called C1E (Enhanced Halt State) that has lower power consumption.

If the IPMI driver is enabled, then ACPI can access the BMC controller (IPMI). A Baseboard Management Controller is a microcontroller that manages the connection between the software and hardware. The Intelligent Platform Management Interface (IPMI) is a framework for managing the computer through a direct network at the hardware level rather than going through a login shell or the operating system.

The ACPI v4.0 process aggregator allows the kernel to apply a CPU configuration to all processors on the system (Processor Aggregator). As of ACPI v4.0, only idling can be configured with this method.

After that, the ACPI thermal zone can be enabled (Thermal Zone). Most hardware supports this feature. This allows the fan's power to be managed by ACPI.

A custom DSDT can be linked to the kernel if this option is enabled (Custom DSDT Table file to include). In this setting, the developer must include the full path name to the file. The Differentiated System Description Table is a file that contains the system's information for supported power events. It is not required to enter a path name. These tables exist on the firmware. The kernel will handle this for you. The main purpose for this is if a developer need to use tables that are different from ones that are built-in to a device.

Arbitrary ACPI tables can be overridden using initrd (ACPI tables override via initrd). ACPI tables are basically rules and instructions on how to control and interact with the hardware.

Like all other parts of the kernel, the ACPI system can also generate debugging messages (Debug Statements). Like other debugging features, you may want to disable this and save about fifty kilobytes.

Enabling this next feature will create files (/sys/bus/pci/slots/) for each PCI slot detected on the system (PCI slot detection driver). A PCI slot is a port on a PCI motherboard that allows users to attach other PC devices. PCI is a type of motherboard. PCI refers to the way the components communicate with one another. Some applications may need these files.

The power management timer is another power-managing system (Power Management Timer Support). This is one of many system timers for keeping track of time. This one requires less power. The processor idling, voltage/frequency scaling, and throttling do not effect this timer. Numerous systems require this feature to be enabled.

Next, ACPI module and container device drivers can be enabled (Container and Module Devices). This enables hotplug support for processors, memory, and nodes. This is needed for NUMA systems.

This following driver offers support for ACPI memory hotplugging (Memory Hotplug). Some devices will not support hotpluggable memory even with this driver enabled. If this driver is added as a module, the module will be called acpi_memhotplug.

NOTE: For the kernel to have a particular feature, the hardware, BIOS, and firmware must support the feature in question. Some systems have a BIOS that does not control the hardware much. This type of BIOS will not restrict features often. If the kernel does have a particular feature, the hardware must have the ability to complete such a task.

The Smart Battery System driver offers access to the battery's status and information (Smart Battery System).

Next, we have a driver for a "Hardware Error Device". This device reports hardware errors through SCI. Usually, most of the reports will be on corrected errors.

Here is another ACPI debugging feature (Allow ACPI methods to be inserted/replaced at run time). This permits ACPI AML methods to be managed without rebooting the system. AML stands for ACPI Machine Language. With this debugging feature, the AML code can be changed and tested with requiring a reboot.

APEI is the ACPI error interface (ACPI Platform Error Interface (APEI)). APEI reports errors from the chipset to the operating system. This error interface also offers error injection abilities.

The hardware's firmware can send messages to the operating system when "SFI (Simple Firmware Interface) Support" is enabled. The firmware communicates with the operating system through static tables in memory. SFI-only computers will require this feature for the kernel to work.

To be able to change the processor's clock speed on runtime, enable this feature (CPU Frequency scaling). CPU frequency scaling means changing the processor's clock speed. This driver can be used to lower the clock speed to conserve power.

Next, is another power management subsystem (CPU idle PM support). When the processor is not active, it is best that it idles in an efficient way to reduce power consumption and reduce wear-and-tear on the CPU. Reduced power consumption will also lower the heat production from the the internal components.

The Linux kernel offers many CPU idle drivers. On systems with multiple processors, some users may have a reason to use a different driver on each CPU (Support multiple cpuidle drivers). Enabling this driver will allow users to set a different driver to each processor.

For Intel processors, the kernel has a driver specific for managing the idleness of such CPU chips (Cpuidle Driver for Intel Processors).

When the memory chips are idle, those can also use reduced power (Intel chipset idle memory power saving driver). This driver is specific for Intel devices with IO AT support.

Different computers use different types of motherboards (PCI support). One type is PCI. This driver will allow the kernel to run on PCI motherboards.

Next, we can enable/disable "Support mmconfig PCI config space access".

After that, we have an option of enabling/disabling a driver for host bridge windows (Support mmconfig PCI config space access). WARNING: This driver is incomplete (at least in kernel version 3.9.4)

As mentioned above, there are other types of motherboards. This next option offers a driver for "PCI Express (PCIe) support". PCIe is an improved and faster version of PCI.

After that, this following driver should be enabled to allow hotplugging on PCIe motherboards (PCI Express Hotplug driver).

Next, we can enable/disable error reporting for PCIe motherboards (Root Port Advanced Error Reporting). This is the PCI Express AER driver.

This next feature can allow users to override BIOS and firmware settings for PCIe ECRC (PCI Express ECRC settings control). In the next option, there is an error injector for PCIe (PCIe AER error injector support).

The following setting offers the operating system control over PCIe active state and clock power management (PCI Express ASPM control). Normally, the firmware would control the ASPM, but this feature allows the operating system to take control.

Again, like so many components of the kernel, there is debugging support for ASPM (Debug PCI Express ASPM).

Next, in this menu, select the "Default ASPM policy".

After that choice, the next one is about allowing device drivers to enable Message Signaled Interrupts (MSI). It is usually best to allow devices to send the CPU interrupts.

To add numerous debugging messages to the system log, enable "PCI Debugging".

This next setting allows the PCI core to detect if it needs to enable PCI resource re-allocation (Enable PCI resource re-allocation detection).

When hosting a virtual operating system on Linux, it can sometimes help to reserve a PCI device for the virtual OS (PCI Stub driver). With operating system virtualization, one OS is running inside or beside another operating system. Sometimes they can compete for resources. Being able to reserve a device for the guest system (the virtual OS) can reduce competition and increase performance.

The next driver offered allows hypertransport devices to use interrupts (Interrupts on hypertransport devices). Hypertransport is a bus system/protocol for high-speed communication between processors.

This next driver for PCI virtualization allows virtual devices to be made that share their owned physical resources (PCI IOV support).

The PCI Page Request Interface (PRI) gives PCI devices that are behind an IOMMU (input/output memory management unit) to recover from page faults (PCI PRI support). A page fault is not an error; it refers to the event of software trying to access data not on physical memory.

Again, there are still more features to configure in the Linux kernel as you will see in the following articles.

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-6.4457/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出