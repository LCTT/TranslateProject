Translating----------------geekpi

21 The Linux Kernel: Configuring the Kernel Part 17
================================================================================
![](http://www.linux.org/attachments/slide-jpg.605/)

Aloha! This next article will cover various drivers.

First, the "virtio console" is a virtual console that is used with hypervisors.

The "IPMI top-level message handler" is a message manager for the IPMI system. IPMI stands for Intelligent Platform Management Interface. IPMI is an interface for managing the system via network without using a shell.

"/dev/nvram support" permits the system to read and write memory in the real time clock's memory. Generally, this feature is used for saving data during a power loss.

The next driver supports the Siemens R3964 packet protocol (Siemens R3964 line discipline). This is a device-to-device protocol.

Now, we can move on to PCMCIA character devices. However, most of the drivers here are vendor/device specific.

The RAW driver allows block devices to be bound to the device files /dev/raw/rawN (RAW driver (/dev/raw/rawN)). The advantage to this is efficient zero-copy. However, most software will still prefer to access the storage through /dev/sd** or /dev/hd**.

Next, the maximum number of RAW devices can be supported is set.

The following driver makes the device file /dev/hpet (HPET - High Precision Event Timer).

NOTE: Many of you may be wondering why enabling these device file matter. Well, these device files serve as an interface between the software and hardware.

The HPET timers can be mapped with this driver (Allow mmap of HPET). Mapping is the process of making a list of address in memory of devices and files. The files can then be found faster by getting the address from the memory and then commanding the hard-drive to get the data from the address.


The "Hangcheck timer" is used to detect whether of not the system has locked-up.
This timer watches for locked-up processes. As soon as a process freezes, a timer starts. After the timer goes off, if the process has not restarted or closed, then the timer will force the process to close.

Linus Torvalds Quote: Portability is for people who cannot write new programs.

The TPM security chip that uses Trusted Computing Group's specification will need this driver (TPM Hardware Support).

Now, we can move on to I2C devices. I2C stands for Inter-Integrated Circuit and is spoken as "eye two see". However, some people say "eye squared see". I2C is a serial bus standard.

Some old software used I2C adapters as class devices, but software now does not do that (Enable compatibility bits for old user-space). So, this driver will offer backwards compatibility for older software.

Next, the I2C device files can be made (I2C device interface).

I2C can support multiplexing with this driver (I2C bus multiplexing support).

I2C can support GPIO-controlled multiplexing with this driver (GPIO-based I2C multiplexer).

Various tests can be performed on I2C and SMBus with this driver for developers (I2C/SMBus Test Stub).

The I2C system will produce debugging messages with this feature enabled (I2C Core debugging messages).

The next driver produces additional I2C debugging messages (I2C Algorithm debugging messages).

Linus Torvalds Quote: The main reason there are no raw devices [in Linux] is that I personally think that raw devices are a stupid idea.

The following driver will cause the I2C drivers to produce debugging messages (I2C Bus debugging messages).

Next, we have Serial Peripheral Interface support (SPI support). SPI is a synchronous serial protocol used on SPI buses.

After that, there is a driver for High speed synchronous Serial Interface support (HSI support). HSI is a synchronous serial protocol.

PPS can also be supported by the Linux kernel (PPS support).

The "IP-over-InfiniBand" driver allows IP packets to be transported over InfiniBand.

After that, there is a debugging driver for IP-over-InfiniBand (IP-over-InfiniBand debugging).

SCSI's RDMA protocol can also travel over InfiniBand (InfiniBand SCSI RDMA Protocol).

There is also an extension for the iSCSI protocol to transmit over InfiniBand (iSCSI Extensions for RDMA (iSER)).

Sometimes, errors occur in the core system that the whole system must know (EDAC (Error Detection And Correction) reporting). This driver sends the core errors to the system. Generally, such low-level errors are reported in the processor and then seen by this driver to let other system processes know about or handle the error.

This driver provides legacy support for EDAC to use older versions of sysfs (EDAC legacy sysfs).

EDAC can be set to send debugging information to the logging system of Linux (Debugging).

Linus Torvalds Quote: Nobody actually creates perfect code the first time around, except me.

The Machine Check Exceptions (MCEs) are converted to a readable form via this driver (Decode MCEs in human-readable form (only on AMD for now)).
MCEs are hardware errors detected by the CPU. MCEs usually trigger kernel panics.

The decoding process for MCE to a readable form can be injected to test error handling (Simple MCE injection interface over /sysfs).

The next driver allows errors to be detected in memory and then corrected (Main Memory EDAC (Error Detection And Correction) reporting).

Next, there are many drivers that detect and correct errors on specific hardware sets.

Linus Torvalds Quote: Theory and practice sometimes clash. And when that happens, theory loses. Every single time.

Now, we can move on to the "Real Time Clock". This is commonly abbreviated "RTC". The RTC keeps track of time.

![](http://www.linux.org/attachments/rtc-png.606/)

The next setting allows us to make the Linux system use the time from the RTC as the time on the "wall clock" (Set system time from RTC on startup and resume). The wall clock is the clock on the desktop or the time seen using the "date" command.

Alternately, the wall clock can get the time from an NTP server and then sync with the RTC (Set the RTC time based on NTP synchronization).

Some systems have more than one RTC, so the user must set which is the default (RTC used to set the system time).
It is best to make the first one (/dev/rtc0) the primary clock.

Debugging abilities can be set for the RTC system (RTC debug support).

The RTC can use various interfaces for giving the operating system the current time. Using sysfs will require this driver (/sys/class/rtc/rtcN (sysfs)) while using proc will require this driver (/proc/driver/rtc (procfs for rtcN)). Special RTC character devices can be made and used (/dev/rtcN (character devices)). The shell command "hwclock" uses /dev/rtc, so the RTC character devices are needed.

The next driver allows interrupts of the RTC to be emulated on the /dev/ interface (RTC UIE emulation on dev interface). This driver reads the clock time and allows the new time to be retrieved from /dev/.

The RTC system can be tested with the test driver (Test driver/device).

Next, we will discuss the Direct Memory Access system.
DMA is the process of hardware accessing the memory independently of the processor. DMA increases system performance because the processor will have less to do if the hardware is performing more tasks for itself. Otherwise, the hardware would be waiting for the processor to complete the task.

The debugging engine is for debugging the DMA system (DMA Engine debugging).

Next, there are many vendor/device specific drivers for DMA support.

Some DMA controllers support big endian reading and writing with this driver (Use big endian I/O register access).

Big endian refers to the arrangement of the binary code. The number system used in English speaking countries places the largest end of the number on the left. For example, in the number 17, the most left numbers place is the tens place which is larger than the ones place. In big endian, each byte is arranged with the largest portion on the left. A byte is eight bits. Example: 10110100. Each place has a value of 128, 64, 32, 16, 8, 4, 2, and 1 respectively. So the byte mentioned converts to the decimal number 180.

The DMA system can use the network to reduce CPU usage (Network: TCP receive copy offload).

The "DMA Test Client" is used for testing the DMA system.

In the next article, we will discuss the display/video drivers. Mahalo!

REFERENCE: The quotes from Linus Torvalds came from this site: [http://en.wikiquote.org/wiki/Linus_Torvalds][1]

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-17.4875/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://en.wikiquote.org/wiki/Linus_Torvalds