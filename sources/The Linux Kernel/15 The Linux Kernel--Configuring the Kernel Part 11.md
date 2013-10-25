15 The Linux Kernel: Configuring the Kernel Part 11
================================================================================
![](http://www.linux.org/attachments/slide-jpg.530/)

Ready to configure more drivers? There is still a lot to do.

Linux supports two different Compaq Smart Array controllers (Compaq SMART2 support) and (Compaq Smart Array 5xxx support). Array controllers are devices that present physical storage units as logical units. These controllers may also implement hardware-based RAID. The difference between hardware and software RAID is simple. Linux manages and sees software RAID. Linux sees hardware RAID as any other storage unit. This means Linux is not aware that the device is a RAID drive. The hardware (array controller) manages the RAID system independently of the kernel. This is better for system performance because the kernel does not need to configure or manage RAID. Note, not all array controllers have RAID abilities.

The above mentioned array controllers can access SCSI tapes with this driver (SCSI tape drive support for Smart Array 5xxx). SCSI tapes are magnetic-tape drives that use the SCSI protocol.

The PCI RAID controllers Mylex DAC960, AcceleRAID, and eXtremeRAID are supported by this driver (Mylex DAC960/DAC1100 PCI RAID Controller support). A PCI RAID controller is an array controller connected to a PCI card. RAID controllers are array controllers with RAID capabilities.

The MM5415 battery-backed RAM chips are supported with this driver (Micro Memory MM5415 Battery Backed RAM support). Battery-backed RAM chips allow the data to remain on the RAM device when the power is lost. This helps to protect data. Otherwise, when power is lost, the current computer session is lost.

To use a typical file (such as an ISO image) as a block device and mount it when this feature is enabled (Loopback device support). This is useful for retrieving files from image files without the need to burn the file to a disk or pull it apart. Imagine getting an ISO file from the Internet that contains many files. If only one file in the package is desired and the user does not want to burn the ISO to a disc or does not know how to open an ISO file, the user can instead mount the ISO.

The Linux kernel creates some loop devices during init time, so some loopback devices are already prepared and made (Number of loop devices to pre-create at init time). This feature saves time when a file (like an ISO) or virtual device (like a virtual hard-drive [vhd]) is mounted as a loopback device. This setting allows developers to choose how many the kernel should pre-make.

Ciphers from the CryptoAPI can be used when "Cryptoloop Support" is enabled. This can be used for hard-drive encryption. However, not all filesystems are supported.

Next, users can enable "DRBD Distributed Replicated Block Device support". This is like a network RAID1. These devices own the device files /dev/drbdx. These storage devices are usually used in clusters where each computer in the cluster has a storage unit that is mirrored from the master. This means each computer's hard-drive is a mirrored copy of the hard-drive found in the central “master” computer of the group. A cluster is a group of computers acting as one large powerful unit. However, each cluster has one controlling computer called the master node. The rest of the computers are slave nodes.

The DRBD supports fault injection for testing IO error handling (DRBD fault injection). Remember, fault injection is the process of making a device/software think an error occurred so the developer can test how the hardware/software handles errors.

If the kernel is intended to be a client for network block devices, then enable this feature (Network block device support). The first device file is /dev/nd0. A network block device is a remote storage unit that is accessed via a network.

Solid state drives (SSD) that are directly connected to PCI or PCI Express cards will need this driver (NVM Express block device).


Individual SCSI object-based storage (OSD) objects can be used as a block device with this feature (OSD object-as-blkdev support).

Next is a driver for "Promise SATA SX8 support". This is a driver for a SATA controller made by Promise Technology Inc.

Linux allows a part of the RAM to be utilized as a block device (RAM block device support). This is commonly seen on live Linux distros where the system is running entirely on the RAM. A live Linux distro loads off of a disc and then loads into RAM so the installed OS is not harmed when trying a new operating system, or repairing another.

The next setting allows users to enter in the "Default number of RAM disks".

The "Default RAM disk size" can be set in kilobytes.

The kernel can support XIP filesystems on RAM devices acting as block devices (Support XIP filesystems on RAM block device). This feature will enlarge the kernel's size. XIP (eXecute In Place) filesystems are filesystem that allow executables to store data on the same filesystem instead of utilizing RAM like other applications. Such filesystems are needed when running an executable on a live Linux system which resides on the RAM.

Next, the kernel can be given support for "Packet writing on CD/DVD media".

The kernel developer can set the max amount of active concurrent packets (Free buffers for data gathering). A large number will speed up write performance at the cost of memory. One packet will consume about sixty-four kilobytes.

The Linux kernel can use a rewritable compact-disc as cache space (Enable write caching). This feature is still experimental.

The next feature allows the ATA specification to be used over Ethernet cables (ATA over Ethernet support).

This following driver allows virtual block devices to be created for virtio (Virtio block driver). Virtio is a platform for I/O virtualization.

Old hard-drives will need a special driver (Very old hard disk (MFM/RLL/IDE) driver).

Here is a driver for the previously mentioned Rados device (Rados block device (RBD)).

Next, a device specific driver is available (IBM FlashSystem 70/80 PCIe SSD Device Driver).

Now, we will move on to miscellaneous devices. The first setting is for enabling/disabling potentiometers (Analog Devices Digital Potentiometers ).

If the potentiometer(s) is on a I2C bus, then this should be enabled (support I2C bus connection).

If the potentiometer is attached to a SPI bus, then this driver will be needed (support SPI bus connection).

NOTE: The Linux kernel supports many sensors because the Linux kernel is often used in weather devices and robots.

This driver is for the IBM RSA (Condor) service processor (Device driver for IBM RSA service processor).

The kernel also has a driver for the PCI Sensable PHANToM devices (Sensable PHANToM (PCI)).

This driver is for directing trace data from various devices via Parallel Trace Interface (PTI) out to Intel Penwell PTI ports (Parallel Trace Interface for MIPI P1149.7 cJTAG standard). This directed data is for debugging purposes.

Some SGI IO controllers have an IOC4 chip that needs this driver (SGI IOC4 Base IO support). SGI IO controllers are devices made by SGI that manage input/output. The IOC4 chip controls a lot of the tasks performed by such devices. This is a basic driver. Other drivers for such devices will rely on this driver.

There are few Texas Instruments Flash Media adapter drivers for the Linux kernel (TI Flash Media interface support) and (TI Flash Media PCI74xx/PCI76xx host adapter support).

This "Integrated Circuits ICS932S401" driver for ICS932S401 clock control chips.

The Atmel Synchronized Serial Communication peripheral (SSC) has a driver in the kernel (Device driver for Atmel SSC peripheral).
Such a device provides point-to-point serial connections between devices.

The "Enclosure Services" feature supports hard-drive bays.

This is a timer driver for CS5535/CS5536 chips (CS5535/CS5536 Geode Multi-Function General Purpose Timer (MFGPT) support).

This driver gives applications the ability to communicate with iLO management processors in HP ProLiant servers (Channel interface driver for the HP iLO processor). “iLO” stands for Integrity Integrated Lights-Out. iLO allows remote server management.

The Linux kernel supports the ALS APDS9802 light sensor (Medfield Avago APDS9802 ALS Sensor module). Some other supported sensor include
Intersil ISL29003 ambient light sensor
Intersil ISL29020 ambient light sensor
Taos TSL2550 ambient light sensor
ROHM BH1780GLI ambient light sensor
BH1770GLC / SFH7770 combined ALS - Proximity sensor
APDS990X combined als and proximity sensors

NOTE: Most of these drivers should be included as modules if the kernel being made is intended for a broad range of computers.

Linux can even use a "Honeywell HMC6352 compass".

The kernel also supports the "Dallas DS1682 Total Elapsed Time Recorder with Alarm".

The 16-bit digital-to-analog converter is supported with this driver (Texas Instruments DAC7512).

The "VMware Balloon Driver" manages physical memory by taking physical pages from guest operating systems that do not need it and giving pages to those that do.

There are also two different pressure sensors (BMP085 digital pressure sensor on I2C) and (BMP085 digital pressure sensor on SPI).

An Intel Input/Output Hub (IOH) is also supported by the kernel (Intel EG20T PCH/LAPIS Semicon IOH(ML7213/ML7223/ML7831) PHUB). Specifically, this is the PCH PHUB (Platform Controller Hub Packet Hub) Intel Topcliff.

The "FSA9480 USB Switch" is a detector that detects when devices are plugged in.

The next option permits bitstream configuration (Lattice ECP3 FPGA bitstream configuration via SPI).

The Silicon microcontroller uses the Silicon Labs C2 Port which needs a special driver (Silicon Labs C2 port support).

Again, keep watching for the next articles because there is still a lot more to do. 

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-11.4640/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出