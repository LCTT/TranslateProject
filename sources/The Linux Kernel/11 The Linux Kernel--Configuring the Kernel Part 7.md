11 The Linux Kernel: Configuring the Kernel Part 7
================================================================================
![](http://www.linux.org/attachments/slide-jpeg.474/)

Enjoy this next article in the Linux Kernel series. We will continue configuring the PCI features following the most important characteristic of computers - networking.

Process Address Space Identifiers (PASIDs) allow PCI devices to access multiple IO address spaces simultaneously (PCI PASID support). This feature requires an IOMMU that offers PASIDs support.

Next, we can enable/disable "PCI IO-APIC hotplug support". APIC stands for Advanced Programmable Interrupt Controllers. A programmable interrupt controller (PIC) gathers all interrupts from all of the different sources to a single or multiple CPU lines. An advanced PIC are the same as PICs, but they have better features like Advanced Interrupt Request Management and more priority models. Hotplugging is the ability to add a device while the system is still on and not required to be reset. This driver is for PCI motherboards to have the ability to handle input/output APIC hot-swapping.

After that, the following question asks about enabling "ISA-style DMA support". As mentioned in a previous article, DMA is direct memory access which is the ability for devices to access memory without help from the CPU. ISA stands for Industry Standard Architecture which is a bus standard like PCI. This feature would allow DMA support that is used with ISA motherboards.

Now, we can move on to "PCCard (PCMCIA/CardBus) support". PCMCIA stands for Personal Computer Memory Card International Association. PC-cards, PCMCIA cards, and Cardbus cards are all peripheral laptop devices that are in the shape of cards.

The next PCMCIA options deals with "16-bit PCMCIA support". Some older computers use 16-bit PCMCIA cards.

To load a Card Information Structure (CIS) from userspace to make a PCMCIA card work properly, this feature should be enabled (Load CIS updates from userspace).

CardBus is the newer 32-bit version of 16-bit PCMCIA. This driver offers support for such devices (32-bit CardBus support). To use 32-bit PC-cards, a Cardbus compatible host bridge is required.

This next driver provides support for the CardBus bridges mentioned above (CardBus yenta-compatible bridge support). This bridge is the hardware port that the PCMCIA cards plugin.

The next three options are "Special initialization for O2Micro bridges", "Special initialization for Ricoh bridges", and "Special initialization for TI and EnE bridges". These are all types of bridges for cards.

Next, the driver for "Auto-tune EnE bridges for CB cards" is offered.

"Special initialization for Toshiba ToPIC bridges" can be enabled/disabled in the next option.

The next device driver offered is "Cirrus PD6729 compatible bridge support". This is needed in some older laptops.

The next PCMCIA bridge driver is for Intel "i82092 compatible bridge support". This is also found in some older laptops. This is again another bridge driver.

After that, the following settings asks about enabling "Support for PCI Hotplug".

Next, ACPI PCI hotplugging can be enabled (ACPI PCI Hotplug driver). This driver allows the hotplugging of PCI devices with ACPI (that power management feature that was discussed previously).

For IBM systems, this next driver will need to be enabled for ACPI PCI hotplugging (ACPI PCI Hotplug driver IBM extensions). This is like the above feature but this is specific for IBM devices.

For systems with a CompactPCI system card that has CompactPCI hotswap support, enable the "CompactPCI Hotplug driver".

Next, we have an option for another type of CompactPCU system card (Ziatech ZT5550 CompactPCI Hotplug).

CompactPCI cards that use the #ENUM hotswap signal as a system register bit through the standard IO port will need this driver (Generic port I/O CompactPCI Hotplug).

Motherboards with SHPC PCI hotplug controllers need this next driver (SHPC PCI Hotplug driver). SHPC stands for Standard Hot-Plug Controller. This is a generic hotplug system for PCI motherboards.

RapidIO interconnected devices also need a special driver (RapidIO support). RapidIO chips and boards are faster than PCI and PCI-express.

The "IDT Tsi721 PCI Express SRIO Controller" is a specific type of RapidIO controller.

This next option allows the developer to enter in how long the system's discovery node should wait (in seconds) for a host to finish enumeration before giving up. It is usually best to stick to the defaults.

This feature will allow the RapidIO system to accept other traffic besides maintenance signals (Enable RapidIO Input/Output Ports).

To transfer RapidIO data to and from RIO devices using a DMA Engine framework, enable this driver (DMA Engine support for RapidIO). RIO devices are Reconfigurable Input/Output devices. RapidIO uses NREAD and NWRITE requests to transfer data between local and remote memory, so a driver is needed to allow RapidIO to use DMA to access RIO devices. A DMA controller is needed to complete this feature on a kernel with this feature.

The RapidIO can provide debugging messages if permitted (RapidIO subsystem debug messages). As mentioned before, debugging features can be disabled unless you or the person using the kernel being made needs debugging features.

The next driver offers "IDT Tsi57x SRIO switches support". This is a group of serial RapidIO switches. The next four options are for different serial RapidIO switch drivers - "IDT CPS-xx SRIO switches support", "Tsi568 SRIO switch support", "IDT CPS Gen.2 SRIO switch support", and "Tsi500 Parallel RapidIO switch support".

After managing those drivers, we can move on to other kernel options. The next option offers support for ELF (Kernel support for ELF binaries). Executable and Linkable Format (ELF) support is a format specification for executables. It is highly recommended that this be enabled.

To execute scripts and binaries that require an interpreter, this feature must be enabled (Kernel support for MISC binaries). These types of executables are often called wrapper-driven binary formats. Examples include Python2/3, .NET, Java, DOS executables, etc.

The kernel can generate core dumps when this option is enabled (Enable core dump support). This is a debugging feature. Unless this kernel is intended to be used for debugging (whether the kernel itself or software) this is not needed.

64-bit processors can execute 32-bit programs if "IA32 Emulation" is enabled. It is best that this feature is enabled unless the developer is sure that such a kernel will never need to run 32-bit code.

The old a.out binaries can also be supported (IA32 a.out support). Assembler Output, as it is called, is a file format of a type of compiled code. It is best to enabled this because some shared libraries may use this format.

The next setting can allow 32-bit processes to access the whole 64-bit register file and wide data path (x32 ABI for 64-bit mode). However, 32-bit pointers are still used. These 32-bit processes will use less memory than the same process compiled to 64-bits because they use 32-bit pointers.

Now, we will move on to network support.

Our first network setting is to enable networking in general (Networking Support). Very few developers will disable this feature. If they do, the kernel will be small and fast, but it will never be able to use Wifi, Bluetooth, Ethernet, or any type of connection dealing with network devices or protocols. Some programs on stand-alone systems require this feature even though no network devices exist with the hardware. For instance, X11 depends on networking features. Only disable networking features in the kernel if you can provide an alternate way to display graphics on the screen.

"Packet socket" allows processes to communicate with network devices without a mediator. This can enhance performance.

The ss tool needs this feature enabled for packet monitoring (Packet: sockets monitoring interface). Packet monitoring means watching the network traffic concerning the local device.

"Unix domain sockets" are used to establish and access network connections. The X Windowing system requires this feature; this is the perfect example for why networking should be enabled in the kernel even for systems that will not use networks. Unix domain sockets is a network protocol that works between process on the same running machine.

The above Unix sockets can be monitored by the ss tool, but this next feature must be enabled first (UNIX: socket monitoring interface).

The Transformation (XFRM) user configuration interface is used by many native Linux utilities, so this feature is highly recommended (Transformation user configuration). This enables Ipsec – Internet Protocol SECurity. Ipsec controls the authentication and/or encryption of the IP packets.

The next feature allows developers to give network packets a second policy (called a sub-policy) (Transformation sub policy support).

IPsec security association locators can be updated dynamically when this feature is enabled (Transformation migrate database). Devices using Mobile IPv6 need this feature. When a computer sets up a network connection with a router or any type of network device, the security protocols make sure the two do not accidentally get connected to some other device on the network. The IP packet is set to go to a particular device. However, mobile systems that will use a different network providing a 4g signal, for instance, needs to be able to make the same connection to the new network point. Even though it may be the same 4g provider, a different device would provide a 4g connection to that geographic area. When the device is in the new area, it will still use the same IP address.

Next is a feature that displays statistics on transformation errors during packet processing (Transformation statistics). This useful for developers; this is not needed, so it can be disabled.

The "PF_KEY sockets" are compatible with KAME sockets and are need when using IPsec tools ported from KAME. KAME is a free protocol stack for IPv4 IPsec, IPv6 IPsec, and IPv6.

This is another required Mobile IPv6 feature that adds a PF_KEY MIGRATE message to PF_KEYv2 sockets (PF_KEY MIGRATE).

Next is the most important and number one well known feature in networking that should be enabled - "TCP/IP networking". Most networks (including the Internet) depend on this protocol. Even the X Windowing system uses TCP/IP. This feature even permits users to ping themselves (Command: ping 127.0.0.1). To be able to use the Internet and/or X11, this must be enabled.

To address several computers on a network, "IP: multicasting" must be enabled. Multicasting is the ability to send messages to more than one computer, but not all of them. Broadcasting sends signals to all computers on the network.

If this kernel is for a Linux system that will act as a router, then enable this option (IP: advanced router).

With this following feature enabled, the IP address will be automatically configured at boot time (IP: kernel level autoconfiguration). This is useful when a user needs to connect to a network without needing to configure settings.

With the DHCP protocol support enabled, the Linux system can mount its root file system over a network using NFS and the IP address will be discovered using DHCP (IP: DHCP support). This allows the Linux system to have its root filesystem on a remote computer over the network without the user needing to manually manage the process each time the system is booted.

The next options is just like the above except the BOOTP protocol is used instead of DHCP (IP: BOOTP support). BOOTP is the bootstrap protocol; this protocol uses UDP instead of TCP and will only use IPv4 networks.

RARP is an old protocol that is now obsolete due to BOOTP and DHCP, but it can still be added to the kernel (IP: RARP support).

One network protocol can be used within another - a concept called tunneling. This feature can be used in the Linux kernel (IP: tunneling). The secure shell protocol (SSH) is an example of a tunneling protocol. This feature is needed for SSH.


The next driver can demultiplex GRE (Generic Routing Encapsulation) packets (IP: GRE demultiplexer). Demultiplexing is the process of making a single signal into many separate parts (this is not copying the message, only breaking it down). GRE (Generic Routing Encapsulation) is a tunneling protocol.

The following feature permits GRE tunnels to form in IP connections (IP: GRE tunnels over IP). This will allow GRE tunnels to form on IP networks.

A broadcast using GRE over IP can be done when this feature is enabled (IP: broadcast GRE over IP).

A Linux system intended to be a router for IP packets going to multiple places should have this enabled (IP: multicast routing).

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-7.4490/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出