Translating-------------geekpi

18 The Linux Kernel: Configuring the Kernel Part 14
================================================================================
![](http://www.linux.org/attachments/slide-jpg.566/)

Aloha! Ready for another cool article on the Linux kernel?

Next, in our long quest, we can enable/disable the "Fusion MPT logging facility". MPT stands for Message Passing Technology. The Fusion driver is made by LSI Logic Corporation. MPT is a specific messaging tactic used between process. This technique is synchronous meaning that process will wait for messages as needed.

After that, the "FireWire driver stack" should be enabled if the computer possesses FireWire ports. If not, then there is no point in enabling FireWire ports for a device that could not use such drivers. FireWire is a lot like USB. The differences lie in the protocols, speed, and the physical shape and layout of the ports. Generally, Apple devices use FireWire and USB. Some PCs have FireWire ports, but this is less common than USB ports.

Some FireWire controllers use the OHCI-1394 specification (OHCI-1394 controllers). If so, enable this driver.

To use FireWire storage devices, enable this next driver (Storage devices (SBP-2 protocol)). This driver provides a protocol that the FireWire storage units use to communicate with the FireWire bus (the card with the attached FireWire ports). Some FireWire scanners also need this driver.

IPv4 can be used on FireWire ports (IP networking over 1394). IEEE 1394 or simply "1394" is FireWire. Multicasting over FireWire using IPv4 has limitations.

Nosy is the traffic monitor for FireWire PCILynx cards (Nosy - a FireWire traffic sniffer for PCILynx cards).

Next, the I2O devices can be supported (I2O device support). Intelligent Input/Output (I2O) bus uses drivers for the hardware and operating system levels. The hardware drivers (HDM) are not specific to any operating system while the OS drivers (OSM) must be used on the intended operating system. The OSM communicates with any of the HDMs. I2O cards/buses have an IOP - Input/Output Processor. This speeds up the system since the main CPU is processing less data.

Only enable "Enable LCT notification" on systems that lack a SUN I2O controller. I2C SUN firmware does not support LCT notifications.

The Adaptec I2O controllers need this next driver if RAID is intended (Enable Adaptec extensions).

Direct memory access of 64-bits can be allowed on Adaptec I2O controllers (Enable 64-bit DMA).

I2O devices can be configured if permitted (I2O Configuration support). This feature is mainly needed for RAID setup.

The old Input/Output controls can be enabled for I2O devices (Enable ioctls (OBSOLETE)).

The OSM software for I2O bus adapters can be enabled (I2O Bus Adapter OSM). This set of OSMs are used to find new I2O devices on the other end of the adapter.

Next, the OSMs for I2O block devices can be enabled (I2O Block OSM). RAID controllers on I2O hardware will need this OSM.

The following OSM is for the SCSI or FiberChannel devices on I2O controllers (I2O SCSI OSM).

Information on I2O devices can be read from /proc/ if enabled (I2O /proc support).

After the I2O features have been enabled/disabled, we can move on to other kernel abilities. Next, we have "Macintosh device drivers". These are only useful to Apple devices. Linux kernels for PCs should not have any of these features enabled. However, as with many statements there is always an exception. Some PC users may use an Apple mouse, keyboard, and/or some other Apple device. Again, it is best to thoroughly understand the need and use of the kernel being developed.

Next, we have a driver for networking (Network device support). X11 and other Linux software do not depend on this driver, so if the kernel will not need to connect to another computer, Internet, Intranet, or network, then this can safely be disabled.

The following driver is like above, but is specific to core drivers (Network core driver support).

Etherchannels are supported by this driver (Bonding driver support). In networking, bonding is the fusion of two or more Ethernet channels. This is also known as trunking.

A dummy network can be set up in Linux with this driver (Dummy net driver support). A dummy network is a virtual network that is like the /dev/null of networking. Any data sent to this dummy network is gone forever as it would be going to /dev/null. The IP address is not set. The user can define their networking equivalent of /dev/null.

Next, EQL can be supported (EQL (serial line load balancing) support). This is needed to allow two computers to communicate via two serial connections that use the SLIP or PPP protocol.

Fiber Channel is a fast serial protocol for connecting storage devices to computers (Fibre Channel driver support).

The MII transceiver needs this driver (Generic Media Independent Interface device support). MII is an interface for Ethernet with speeds up to 100Mbit/s. These Ethernet cables are intended for connecting to a PHYceiver which is an Ethernet transceiver.

To group many Ethernet devices via virtual interfaces, the "Ethernet team driver support" is needed.

"MAC-VLAN support" permits users to have packet maps between a particular MAC address and a certain interface.

A tap character device can be made from the MAC-VLAN network interface (MAC-VLAN based tap driver). Tap devices get packets from the kernel so they can be sent elsewhere.

The next feature allows virtual vxlan interfaces that create Layer 2 networks to be placed above Layer 3 (Virtual eXtensible Local Area Network (VXLAN)). This is commonly used for tunneling to virtual systems.

Messages that the kernel sends on a network can be logged with this feature (Network console logging support). Only enable this if it is important for you to log the network messages. Disabling this feature will enhance performance.

This feature allows various parameters to be changed (Dynamic reconfiguration of logging targets). Some of these parameters include port numbers, MAC addresses, IP addresses, and some other settings.

If user space programs are expected to use TAP devices, then enable this driver that will allow such activity (Universal TUN/TAP device driver support).

This driver is for local Ethernet tunnels (Virtual ethernet pair device).

The "Virtio network driver" is used with QEMU, Xen, KVM, and other virtual machines.

Next, "ARCnet support" can be enabled. ARCnet is a Token-Ring-like Local-Area-Network (LAN) protocol. ARCnet stands for "Attached Resource Computer Network".

Now, we can move on to "ATM drivers". ATM stands for "Asynchronous Transfer Mode". ATM is used for telecommunications.

The Marvell Ethernet switch needs this driver (Marvell 88E6060 ethernet switch chip support). Also, the chip for such a switch is also needed depending on the model (Marvell 88E6085/6095/6095F/6131 ethernet switch chip support) and (Marvell 88E6123/6161/6165 ethernet switch chip support).

Now, we can learn about "Ethernet driver support".

First, we can enable/disable "3Com devices". This then allows kernel developers to choose which 3Com devices to support.

The next set of options is for various "Adaptec devices" and then later "Alteon devices".
These are just device/vendor specific drivers. Generally, these drivers are added as modules.

After those two sets of options, there is a set for "AMD devices" and again for "Atheros devices".

NOTE: Keep in mind what type of hardware the kernel will run on. For a large variety of devices, it may be best to add these devices as modules.

There are various other vendor-specific device drivers - "Cadence devices", "Broadcom devices", "Brocade devices", "Chelsio devices", "Cisco devices", and "Digital Equipment devices". Some other device/vendor specific drivers follow.

The next driver that is not vendor/device specific is "SLIP (serial line) support". This driver supports SLIP and CSLIP. SLIP (Serial Line Internet Protocol) is an Internet protocol for modems and serial ports. PPP is now used instead of SLIP. CSLIP is Compressed SLIP.

Next, "CSLIP compressed headers" can be enabled which compresses the TCP/IP headers. CSLIP is faster than SLIP, but to be able to use CSLIP, both the transmitting computer and the receiving computer must be able to understand CSLIP.

When using SLIP on bad analogue lines, then it may be a good idea to enable "Keepalive and linefill" which will help to keep the connection alive.

For running IP on poor-quality networks or are 7-bit, it may help to enable and use "Six bit SLIP encapsulation".

Now, we can move on to the popular USB system, but these are the USB drivers for networking.

The first USB network device to enable/disable is "USB CATC NetMate-based Ethernet device support". This is for 10Mbps USB Ethernet EL1210A chip devices. The USB device will act and appear to be an Ethernet device even though the hardware is USB.

Next, this driver is the same as above except this is for devices with the KLSI KL5KUSB101B chipset (USB KLSI KL5USB101-based ethernet device support).

The Pegasus USB devices are USB-to-Ethernet adapters/converters (USB Pegasus/Pegasus-II based ethernet device support).

Next, there is another USB-to-Ethernet driver (USB RTL8150 based ethernet device support).

In the next article, we will continue to configure the USB networking system.

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-14.4765/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出