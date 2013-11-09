translating---------geekpi

16 The Linux Kernel: Configuring the Kernel Part 12
================================================================================
![](http://www.linux.org/attachments/slide-jpg.539/)

Welcome and enjoy the next part of the Linux kernel configuration series. The kernel supports a large variety of hardware, protocols, and features as you have already guessed.

The next set of features we will discuss is "EEPROM support". Electrically Erasable Programmable Read-Only Memory is a form of memory that is not erased when the power is lost or purposely shut off.

The kernel supports EEPROM chips on I2C cards including FRAMs, ROMs, and SRAMs (I2C EEPROMs / RAMs / ROMs from most vendors). FRAM (also called FeRAM is a Random Access Memory chip that uses ferroelectric principles instead of dieletric materials to store data. A ROM chip is a Read Only Memory chip. SRAM is Static instead of Dynamic like DRAM. DRAM must be refreshed to retain data while SRAM does not require refreshing. However, both lose the stored data when the power is turned off or lost.

The kernel also supports EEPROMs for SPI buses (SPI EEPROMs from most vendors). The Serial Peripheral Interface Bus (SPI) is a full duplex bus system that lacks an error-checking protocol.

The older I2C EEPROM chips require a driver other than the I2C driver above (Old I2C EEPROM reader). The I2C bus is intended for embedded systems and cellphones due to the low-speed bus protocol that is used.

This feature is needed to prevent the Maxim programmable EEPROM from going into read-only mode (Maxim MAX6874/5 power supply supervisor). Specifically, this driver provides better power management to the chip.

There is also a driver for "EEPROM 93CX6 support", "Microwire EEPROM 93XX46 support", and then "ENE CB710/720 Flash memory card reader support".

Like with many other kernel features, there are debugging features for EEPROM devices (Enable driver debugging). Again, for better performance, disable debugging features.

Next, we have a Texas Instruments feature (Shared transport core driver). This driver provides transport protocols for BT/FM and GPS chips.

The following driver supports the I2C LIS3LV02Dx accelerometer (STMicroeletronics LIS3LV02Dx three-axis digital accelerometer (I2C)). The data provided by the device is stored in /sys/devices/platform/lis3lv02d.

Next, the Linux kernel supports a module for downloading firmware to Altera's FPGA (Altera FPGA firmware download module). An FGPA is a field-programmable gate array. These are programmable integrated circuits.

The "Intel Management Engine Interface" offers security and other services to Intel chips.

"ME Enabled Intel Chipsets" can have MEI support. MEI is Management Engine Interface. This driver gives supported chipsets MEI services.

The "VMware VMCI Driver" is a high-speed virtual device for relaying communications between the guest and host. VMCI stands for Virtual Machine Communication Interface.

Next, "ATA/ATAPI/MFM/RLL support" can be enabled/disabled. MFM (Modified Frequency Modulation) is a specific method for encoding floppy disk bits. However, this does not work on all floppy disks. MFM uses the RLL (Run-Length Limited) coding scheme. RLL transfers data going through communication systems that have bandwidth limits. ATAPI is the previously mentioned ATA Packet Interface and ATA is the same ATA mentioned when discussing interface standards.

Now, we will discuss SCSI support. Small Computer System Interface is another interface standard as is SATA. USB and FireWire devices use the SCSI protocol.

The first SCSI setting concerns the "RAID Transport Class". This allows RAID to use the SCSI standard.

To use SCSI targets, enable this feature (SCSI target support).

If the system will run old Linux applications, the system may need "legacy /proc/scsi/ support".This will create the SCSI files once placed in /proc/scsi/.

To support SCSI disks, enable the next feature (SCSI disk support). This is a generic driver.

To support SCSI tapes, enable this feature (SCSI tape support). This is a generic driver. A SCSI tape drive stores data on tape-like magnetic strips.


The OnStream SCSI tapes need this driver instead of the previously mentioned generic SCSI driver (SCSI OnStream SC-x0 tape support).

For "SCSI CDROM support" enable this feature. Some CD-ROMs use the SCSI protocol.

Next, the user can enable "Enable vendor-specific extensions (for SCSI CDROM)".

This is a SCSI driver that is a generic driver for a larger variety of SCSI devices (SCSI generic support). This is mainly used for SCSI scanners and other SCSI devices not supported by the previously mentioned SCSI drivers or those discussed afterwards.

Some SCSI jukeboxes need this SCSI driver (SCSI media changer support).

The Linux kernel offers "SCSI Enclosure Support". A SCSI enclosure is a device that manages the power and cooling of the SCSI device as well as offer other services not related to the data.

The Linux kernel should be set to search for all Logical Unit Numbers (LUN) for each SCSI device (Probe all LUNs on each SCSI device). A LUN is a SCSI address.

Extra error reporting is available for SCSI (Verbose SCSI error reporting (kernel size +=12K)). This will increase the size of the kernel significantly.

There is also a logger for SCSI (SCSI logging facility).

To enhance your system, enable this feature that allows SCSI to be probed while the system boots up rather than booting and then probing (Asynchronous SCSI scanning). Most systems can perform both tasks at once, so why not allow it? For hardware with many SCSI devices attached, this will increase boot time significantly.

Next, "Parallel SCSI (SPI) Transport Attributes" allows each SCSI device to send transport information to sysfs. Some systems require this feature.

This next feature is the same as above, but sends information about transport from FiberChannel devices (FiberChannel Transport Attributes). FiberChannel devices use SCSI.

Next, the user can enable/disable "SCSI target support for FiberChannel Transport Attributes".

Transport information from iSCSI devices and SAS devices can also be exported to sysfs (iSCSI Transport Attributes) and (SAS Transport Attributes). SAS stands for Serial Attached SCSI.

Next, ATA support is added to libsas (ATA support for libsas (requires libata)). Note that the configuration tools says libata is required. To satisfy this need, enable ATA support. Most likely, the configuration tool has or will do this for you, but double check anyway. libsas and libata are the libraries that provide support for SAS and ATA, respectively.

The next feature permits SAS interfaces to accept SMP frames (Support for SMP interpretation for SAS hosts). This adds a SMP interpreter to libsas. However, this does increase the kernel's size. SMP frames allow all processors on multi-CPU systems to access SAS devices.

SRP can send transport data to sysfs (SRP Transport Attributes). SRP stands for SCSI RDMA Protocol. RDMA stands for Remote Direct Memory Access. This means SRP is a protocol used to access data from remote SCSI devices attached to another computer.

Next, the user can enable "SCSI target support for SRP Transport".

Low-level SCSI drivers can be enabled (SCSI low-level drivers). This provides many basic drivers.

After that, users can enable/disable "PCMCIA SCSI adapter support". This adapter allows SCSI devices to attach to PC cards.

There are some drivers for specific adapters - (Future Domain PCMCIA support), (Qlogic PCMCIA support), and (Symbios 53c500 PCMCIA support).

Devices with multi-path setups will need this feature (SCSI Device Handlers). This is used in clusters where each node needs a direct path to a SCSI storage unit.

Next, the "OSD-Initiator library" can be enabled. This is a SCSI driver that provides patches, the OSD protocol, and the T10 protocol to SCSI devices. OSD stands for Object-based Storage Device; this is discussed more in the next paragraph.

This feature makes a SCSI upper layer for testing and managing /dev/osdx devices (OSD Upper Level driver). exofs uses this driver for mounting OSD-based filesystems. OSD devices are storage devices that do not use blocks like other storage units. Instead, OSD devices store data in containers called objects. exofs was once called OSDFS.

OSD features provide debugging tools if enabled (Compile All OSD modules with lots of DEBUG prints).

Now, we can discuss Serial ATA and Parallel ATA features and drivers. The first feature to enable/disable is for debugging (Verbose ATA error reporting).

Next, users should enable the Advanced Configuration and Power Interface feature for ATA devices (ATA ACPI Support). This will allow the kernel to manage power usage more efficiently in SATA devices.

The kernel contains a driver for "SATA Zero Power Optical Disc Drive (ZPODD) support". This powers off SATA optical disc drives (ODD) when not in use. This saves energy and reduces wear and tear.

TIP: Even when making a high-performance kernel, try to enable all power management features. This reduces power consumption, operating costs, heat production (heat reduces performance), and wear and tear.

SATA port multipliers need this driver (SATA Port Multiplier support). A port multiplier is a device that has numerous ports but only needs to plug into one port itself. For instance, if a piece of hardware has one SATA port, but more are needed, plug the port multiplier into the one port. Now the device has many SATA ports.

Next is a driver for AHCI SATA (AHCI SATA support). Advanced Host Controller Interface (AHCI) is an operation standard for SATA bus adapters.

For AHCI SATA devices to be supported on SoC hardware, this driver must be enabled (Platform AHCI SATA support). SoC stands for System-on-a-Chip.

Next are some drivers for some specific devices.
Initio 162x SATA support
ACard AHCI variant (ATP 8620)
Silicon Image 3124/3132 SATA support

Again, watch and wait for the next awesome article.

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-12.4681/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出