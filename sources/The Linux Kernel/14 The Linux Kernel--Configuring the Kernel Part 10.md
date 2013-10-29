14 The Linux Kernel: Configuring the Kernel Part 10
================================================================================
![](http://www.linux.org/attachments/slide-jpg.514/)

Wireless broadband devices that use the WiMAX protocol can be enabled (WiMAX Wireless Broadband support). This type of wireless connection usually works only if the connection service is provided by a service provider (this is the same concept as with 3G/4G). WiMAX stands for Worldwide Interoperability for Microwave Access. WiMAX is intended to be a replacement for DSL. Broadband refers to the wide bandwidth and transportation of numerous signals.

RF switches are used in many Wifi and Bluetooth cards (RF switch subsystem support). The “RF” stands for Radio Frequency. RF switches route high-frequency signals.

Input support for RF switches also exists in the kernel (RF switch input support).

The kernel can control and query radio transmitters (Generic rfkill regulator driver). Enabling this will make a device file (/dev/rfkill). This device file acts as an interface to such radio devices.

The Linux kernel supports the 9P2000 protocol (Plan 9 Resource Sharing Support (9P2000)). This network protocol is sometimes called Styx. Plan 9's windowing system (Rio) uses Styx the same way Linux's X11 uses Unix Network Sockets. Linux systems may use Styx on Styx networks. Plan 9 and Linux can use Styx on a network.

The "9P Virtio Transport" system provides transports to and from guest and host partitions on virtual systems.

RDMA transport is also supported by the kernel (9P RDMA Transport (Experimental)). RDMA stands for Remote Direct Memory Access. This is Plan 9's protocol for accessing memory from a remote computer.

The 9P system has debugging support like many of the other kernel components (Debug information).

"CAIF support" support can also be enabled in the kernel. CAIF stands for Communication CPU to Application CPU Interface. This is a MUX protocol that uses packets and is used with ST-Ericsson's modems. ST-Ericsson is the company that developed this protocol. Android and MeeGo phones use this protocol. (Yes, MeeGo and Android are Linux systems, and yes, I am talking about the popular Android by Google.) A MUX protocol is a multiplexing protocol. Multiplexing was mentioned in a previous article.

Next, cephlib can be added to the kernel which is used in the rados block devices (rbd) and the Ceph filesystem (Ceph core library). cephlib is the complete core library for Ceph. Ceph is a storage platform. CephFS (the Ceph filesystem) is a filesystem that runs on top of another. Usually, CephFS runs on top of EXT2, ZFS, XFS, or BTRFS. Rados devices are block storage units that use CephFS.

This debugging feature for ceph harms the kernels performance, so only use it if needed (Include file:line in ceph debug output).

The CONFIG_DNS_RESOLVER facility will perform DNS lookups when this feature is enabled (Use in-kernel support for DNS lookup).

Near Field Communication (NFC) devices are also supported by the Linux kernel (NFC subsystem support).

The NFC Controller Interface (NCI) should be enabled if the above feature is enabled (NCI protocol support). This allows the host and the NFC controller to communicate.

NFC devices that process HCI frames will need this next feature to be enabled (NFC HCI implementation).

Some HCI drivers need a SHDLC link layer (SHDLC link layer for HCI based NFC drivers). SHDLC is a protocol that checks integrity and manages the order of the HCI frames.

"NFC LLCP support" is usually enabled if NFC features (like the above) are enabled.

Next, there are some drivers for specific NFC devices. The first one is a "NXP PN533 USB driver".

The next NFC driver supports Texas Instrument's BT/FM/GPS/NFC devices (Texas Instruments NFC WiLink driver).

Next is the "NXP PN544 NFC driver".

The driver for Inside Secure microread NFC chips is also provided by the kernel (Inside Secure microread NFC driver).

Now, we will be moving on to various drivers that are not network related. First, we can allow a path to the uevent helper (path to uevent helper). Many computers today should not have this feature because one uevent helper is executed for every one fork a process possess. This can quickly consume resources.

On boot-up, the kernel will make a tmpfs/ramfs filesystem (Maintain a devtmpfs filesystem to mount at /dev). This offers the complete /dev/ directory system. Of the two filesystems (tmpfs and ramfs), ramfs is the most simple of the two. “tmpfs” stands for temporary filesystem and “ramfs” stands for ram filesystem.

The next setting is the code for the devtmpfs filesystem which is also mounted at /dev/ (Automount devtmpfs at /dev, after the kernel mounted the rootfs).

The following feature allows modules to be loaded into user space (Userspace firmware loading support).

To "Include in-kernel firmware blobs in kernel binary" (which will add proprietary firmware to the kernel) enable this feature.

Some binary proprietary drivers need to be used on boot-up. This feature allows such software to do so (External firmware blobs to build into the kernel binary). Some computers have boot devices that require special firmware that may only be proprietary binaries. Without this feature enabled, the system will not boot.

Enabling "Fallback user-helper invocation for firmware loading" allows user-helper (udev) to load firmware drivers as a fallback for the kernel fails to load firmware drivers. udev can load firmware that resides in a non-standard path for firmware.

The part of the kernel that manages drivers can produce debugging messages if permitted (Driver Core verbose debug messages).

Next, the devres.log file will be used if this feature is enabled (Managed device resources verbose debug messages). This is a debugging system for device resources.

This next feature makes a connection between the userspace and kernelspace via a netlink socket (Connector - unified userspace <-> kernelspace linker). This socket uses the netlink protocol. This is another example of a Linux system needing networking abilities even if the computer will never be on a physical network.

The userspace can be informed on process events via a socket (Report process events to userspace). Some reported events include ID changes, forks, and exit status. Some previously enabled kernel features may need this. It is best to follow what the configuration tool recommends.

Systems that use solid state drives will need MTD support (Memory Technology Device (MTD) support). MTD devices are solid state storage devices. Typical storage drivers are different than Solid State Drives (SSD). The standard routines used on magnetic storage units do not work on SSDs (read, write, and erase).

Most desktop computers have parallel ports (a connector with 25 holes), so they need this feature (Parallel port support). Parallel ports are used for printers and ZIP drives among many other less known uses. Parallel ports are the ports with twenty-five pins.

Enable this feature for IBM compatible computers (PC-style hardware). There are different types of computers. Besides IBM computers (which commonly run Windows), there are Apple computers. Linux runs on nearly every type of computer.

Linux also supports multi-IO PCI cards (Multi-IO cards (parallel and serial)). Multi-IO PCI cards have both parallel and serial ports. Serial ports send or receive one bit at a time.

This next feature allows the kernel to "Use FIFO/DMA if available". This is used on certain parallel port cards to speed up printing. FIFO stands for “First In, First Out”. DMA is Direct Memory Access as mentioned before.

The next feature is for probing Super-IO cards (SuperIO chipset support). These probes find the IRQ numbers, DMA channels, and other types of addresses/numbers of such devices. Super-IO is a type of integrated IO controller.

PCMCIA support for parallel ports can be enabled (Support for PCMCIA management for PC-style ports).

NOTE: For many of these features, it may be best to do what the configuration tool recommends unless you have a specific reason for not doing so. Usually, if you are cross-compiling or making a kernel for a broad range of computers, then you should be familiar with what you are wanting to support and make the choices accordingly.

Parallel ports on AX88796 network controllers need this support (AX88796 Parallel Port).

"IEEE 1284 transfer modes" allows Enhanced Parallel Port (EPP) and Enhanced Capability Port (ECP) on parallel ports and status readback for printers. Status readback is the retrieval of the printer's status.

"Plug and Play support" (PnP) should be enabled. This allows users to plugin devices while the system is still on and then immediately utilize them. Without this feature, users could not plugin a USB device, printer, or some other device without performing any special tasks. The system will manage the rest automatically.

Next, users can enable block devices (Block devices). This is a feature that should be enabled because block devices are very common.

Floppy disks are block devices that can be enabled (Normal floppy disk support).

IDE devices that connect to parallel ports are also supported (Parallel port IDE device support). Some external CD-ROM devices can connect via parallel ports.

External IDE storage units can also be connected to parallel ports (Parallel port IDE disks).

ATA Packet Interface (ATAPI) CD-ROM drives that connect to parallel ports will need this driver (Parallel port ATAPI CD-ROMs). ATAPI is an extension of the ATA protocol used in Parallel ATA (PATA) devices.

Other ATAPI disk devices can be plugged into the parallel ports (Parallel port ATAPI disks). This driver will support other disk types besides CD-ROMs.

The kernel also supports ATAPI tape devices that connect via the parallel ports (Parallel port ATAPI tapes).

There are many other ATAPI devices that can connect to the parallel ports. As a result, a generic driver was made to manage the other devices not supported by the previously mentioned drivers (Parallel port generic ATAPI devices).

IDE devices attached to the parallel ports need a special protocol for communication purposes. There are many such protocols, one of them being the "ATEN EH-100 protocol".

An alternate protocol for parallel IDE devices is the "MicroSolutions backpack (Series 5) protocol".

There is yet again another parallel IDE device protocol (DataStor Commuter protocol) and another (DataStor EP-2000 protocol) and another (FIT TD-2000 protocol).

Once again, there is another protocol, but this one is highly recommended for the newer CD-ROM and PD/CD devices that plug into parallel ports (FIT TD-3000 protocol).

This next protocol is mainly for parallel port devices made by SyQuest, Avatar, Imation, and HP (Shuttle EPAT/EPEZ protocol).

Imation SuperDisks need support for the Shuttle EP1284 chip (Support c7/c8 chips).

Some other parallel IDE protocols that can be enabled next include
Shuttle EPIA protocol
Freecom IQ ASIC-2 protocol - used by Maxell Superdisks
FreeCom power protocol
KingByte KBIC-951A/971A protocols
KT PHd protocol - used in by 2.5 inch external parallel port hard-drives.
OnSpec 90c20 protocol
OnSpec 90c26 protocol

NOTE: These protocols and support for plugging devices into the parallel port is meant to be like hotplugging devices just like USB devices are put in USB ports. USB and Firewire are still the most popular ports to use because of their size and speed. A parallel storage unit is larger than a USB flash drive because parallel ports are larger than USB ports.

Next, we have a driver for Micron PCIe Solid State Drives (Block Device Driver for Micron PCIe SSDs).

You may have guessed it – in the next article there is still more to configure. 

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-10.4613/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出