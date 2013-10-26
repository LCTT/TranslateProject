17 The Linux Kernel: Configuring the Kernel Part 13
================================================================================
![](http://www.linux.org/attachments/slide-jpg.555/)

Aloha! In this next article of the Linux kernel series, we are still configuring ATA devices and we then move on to logical volumes/storage.

"ATA SFF support (for legacy IDE and PATA)" should be enabled because this extends the abilities of ATA.

To support Pacific Digital ADMA controllers, enable "Pacific Digital ADMA support".

"Pacific Digital Serial ATA QStor support" is offered by this next driver.

Support for the Promise SATA SX4 device is supported by the Linux kernel (Promise SATA SX4 support (Experimental)).

SFF ATA controllers with BMDMA abilities will need this driver (ATA BMDMA support). BMDMA stands for Bus-Master Direct Memory Access.

Next, this driver provides support for various Intel SATA and PATA controllers (Intel ESB, ICH, PIIX3, PIIX4 PATA/SATA support).

Here is another device-specific driver (Calxeda Highbank SATA support) and another (Marvell SATA support) and another (NVIDIA SATA support) and another (Promise SATA TX2/TX4 support) and another (Silicon Image SATA support) and several more (SiS 964/965/966/180 SATA support), (ServerWorks Frodo / Apple K2 SATA support), (ULi Electronics SATA support), (VIA SATA support), . . . .. Because many of the SATA/PATA controllers are designed differently, a generic driver cannot be used on many of these devices.

Next, ATA devices on PC Cards are supported by this driver unless a device-specific driver manages the hardware (PCMCIA PATA support).

After that, here is a generic PATA driver that manages all other PATA devices not supported by previously enabled drivers (Generic platform device PATA support).

The power consumption of PATA devices are managed by this ACPI driver (ACPI firmware driver for PATA). It is highly recommended that ACPI be enabled for all hardware on the system. Although this increases the kernel's size, ACPI is better for performance.

"Generic ATA support" is offered by this driver.

Legacy support for ISA, VLB, and PCI bus PATA devices can be added via this driver (Legacy ISA PATA support (Experimental)). This legacy support uses the new ATA layer.

This set of features contains many abilities for RAID and LVM as seen in the following feature options (Multiple devices driver support (RAID and LVM)).

INTERESTING FACT: The kernel is written in C and Assembly.

This driver allows RAID and LVM to be combined (RAID support). This is used to make several LVMs use RAID. Partitions are combined into Logical Block Devices which are then used to form RAID devices.

Many users will want RAID devices to be detected during booting (Autodetect RAID arrays during kernel boot). If you do not have RAID, then do not enable this feature. Otherwise, the boot process will take a few seconds longer than what it needs to be.

NOTE: When configuring the Linux kernel, it is best to follow the "use it or lose it" principal. That is, if you will not use it, then disable the feature.

Hard-drive partitions can be added together using this driver (Linear (append) mode).

The following driver adds RAID-0 support to logical block devices (RAID-0 (striping) mode). Then, there is (RAID-1 (mirroring) mode), (RAID-10 (mirrored striping) mode), and (RAID-4/RAID-5/RAID-6 mode).

The MD framework needs multipath support (Multipath I/O support). The MD framework is a Multi Device framework which manages multiple devices as one unit. For example, combining the partitions of many storage units will make multiple devices act as one. The multipath support is for handling a virtual "single device" with many addresses. Because the single storage unit is physically more than one piece of hardware, it will have more than one hardware address.

These larger multi-disk storage units can be tested for bugs using this debugging driver (Faulty test module for MD).

The "Device mapper support" is a volume manager that is used to map logical sectors. LVM uses sector mapping.

The device mapper can have debugging features if enabled (Device mapper debugging support).

These logical devices can be set to encrypt data if desired (Crypt target support). This feature can allow users to later encrypt such storage devices.

Snapshots of these logical storage units can only be taken if this feature is enabled (Snapshot target).

Thin provisioning allows logical volumes to be setup to have more storage capacity than the physical storage units that make up the logical volume (Thin provisioning target). This feature also provides snapshot abilities of such storage. This excess virtual data space cannot immediately be used. The point of it is to allow users to add a physical storage unit in the future and save time configuring the logical block device.

Thin provisioning can be debugged with this feature (Keep stack trace of thin provisioning block lock holders).

The performance of block devices can be improved by moving the more commonly used data to the faster storage units (Cache target (EXPERIMENTAL)).

Volume managers can be made to mirror logical volumes (Mirror target).

Device-mapper (dm) targets can be made to support the mappings of RAID1, RAID10, RAID4, RAID5 and RAID6 (RAID 1/4/5/6/10 target).

The device-mapper logs can be mirrored in userspace (Mirror userspace logging).

A "Zero target" is a device that disregards writes and returns reads as zero.

Next, volume managers should have multipath support for the hardware (Multipath target).

This driver finds the most efficient path to storage devices for reads and writes (I/O Path Selector based on the number of in-flight I/Os).

The next driver is the same as above, but finds the fastest path (I/O Path Selector based on the service time).

If a physical storage unit on a logical volume is busy, this feature will allow reads/writes to go to another physical volume if possible (I/O delaying target).

udev can generate events for device-manager actions (DM uevents). udev is a device manager for /dev/.

To test how software/hardware reacts to logical devices that occasionally fail input/output tasks, enable this debugging feature (Flakey target).

A logical volume can be created that is a read-only storage unit that validates data for another logical partition (Verity target support).

NOTE: If you enjoy my articles, click "Like" on my posts if you have a Linux.org account. Also, reshare this article on Google, Twitter, and/or Facebook.

ConfigFS and the TCM storage engine can be enabled with this setting (Generic Target Core Mod (TCM) and ConfigFS Infrastructure). ConfigFS is a RAM-based filesystem.

INTERESTING FACT: The Linux kernel does not have a “main()” function. In programs, main() is called by libc which depends on the kernel. The kernel cannot have a main() function because libc would not be able to start the kernel. If the kernel did have a main() function, then we would have a “chicken-or-the-egg” problem – which would come first? Plus, the entry point of the kernel is written in Assembly which does not use the main() function.

Next, the "TCM/IBLOCK Subsystem Plugin for Linux/BLOCK" can be enabled/disabled.

Then, the "TCM/FILEIO Subsystem Plugin for Linux/VFS" can be enabled/disabled.

And again, there are two other TCM features - (TCM/pSCSI Subsystem Plugin for Linux/SCSI) and (TCM Virtual SAS target and Linux/SCSI LDD fabric loopback module).

The Linux-iSCSI.org iSCSI Target Mode Stack for ConfigFS is provided by this driver (Linux-iSCSI.org iSCSI Target Mode Stack).

Next, enable/disable the "FireWire SBP-2 fabric module". This allows a computer to connect to another computer and appear to be a hard-drive.

After that, we can configure "Fusion Message Passing Technology (MPT) device support".

The first option under that heading is a driver for SCSI support for parallel adapters (Fusion MPT ScsiHost drivers for SPI).

SCSI can also get support for fiber channel host adapters (Fusion MPT ScsiHost drivers for FC) and/or SAS adapters (Fusion MPT ScsiHost drivers for SAS).

Next, users can set the "Maximum number of scatter gather entries". A lower number leads to reduced memory consumption per controller instance.

The next driver offers system ioctl calls to manage MPT adapters (Fusion MPT misc device (ioctl) driver).

Fiber channel ports can support IP LAN traffic with this driver (Fusion MPT LAN driver).

I can read your mind – you think there is going to be another article after this. Well, you thought correctly. Keep watching for the next article in this series.

If you like this article series, please post on Linux.org and/or Google+ telling me how much you like this series and what topics you would like to see covered in future articles. Or, email me (DevynCJohnson@Gmail.com). Mahalo!

To learn more about the author, check out the links in his signature box below.

If you have read this article completely, then you should have seen the word "Facebook" three times. If not, you did not read the whole article.

The word "Facebook" is seen in this paragraph, the paragraph above, and in one of the notes. I bet you read the paragraph above without finishing this article trying to find the third instance of the word. 

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-13.4714/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出