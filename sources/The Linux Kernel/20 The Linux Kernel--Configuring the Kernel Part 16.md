20 The Linux Kernel: Configuring the Kernel Part 16
================================================================================
![](http://www.linux.org/attachments/slide-jpg.587/)

Welcome to the next Linux kernel article. In this article, we will discuss the input/output ports.

First, the "i8042 PC Keyboard controller" driver is needed for PS/2 mice and AT keyboards. Before USB, mice and keyboards used PS/2 ports which are circular ports. The AT keyboard is an 84-key IBM keyboard that uses the AT port. The AT port has five pins while the PS/2 port has six pins.

Input devices that use the COM port (sometime called RS232 serial port) will need this diver (Serial port line discipline). The COM port is a serial port meaning that one bit at a time is transferred.

The TravelMate notebooks need this special driver to use a mouse attached to the QuickPort (ct82c710 Aux port controller).

Parallel port adapters for PS/2 mice, AT keyboards, and XT keyboards use this driver (Parallel port keyboard adapter).

The "PS/2 driver library" is for PS/2 mice and AT keyboards.

"Raw access to serio ports" can be enabled to allow device files to be used as character devices.

Next, there is a driver for the "Altera UP PS/2 controller".

The PS/2 multiplexer also needs a driver (TQC PS/2 multiplexer).

The ARC FPGA platform needs special driver for PS/2 controllers (ARC PS/2 support).

NOTE: I want to make it clear that the PS/2 controllers that are discussed in this article are not Sony's game controllers for their PlayStation. This article is discussing the 6-pin mouse/keyboard ports. The controller is the card that holds the PS/2 ports.

The "Gameport support" driver offers support for the 15-pin gameport. Gameport was the 15-pin port used by many input gaming devices until the invention of the USB port.

The next driver is for gameports on ISA and PnP bus cards (Classic ISA and PnP gameport support). ISA stands for Industry Standard Architecture and was a parallel bus standard before PCI. PnP stands for Plug-and-Play and was a common standard before ISA.

"PDPI Lightning 4 gamecard support" provides a driver for a proprietary gamecard with gameports.

The SoundBlaster Audigy card is a proprietary gameport card (SB Live and Audigy gameport support).


The ForteMedia FM801 PCI audio controller has a gameport on the card (ForteMedia FM801 gameport support). This driver only supports the gameport.

Next, we can move on to "Character devices". Character devices transfer data character by character.

First, TTY can be enabled or disabled (Enable TTY). Removing TTY will save a lot of space, but TTY is needed for terminals and such. Unless you know what you are doing, do not disabled TTY.

NOTE TO MY FANS: If you know of a reason for disabling TTY, could you post the answer below and share with us. Mahalo!

Next, support for "Virtual terminals" can be enabled/disabled. Again, a lot of space can be saved, but virtual terminals are very important.

This next driver supports font mapping and Unicode translation (Enable character translations in console). This can be used to convert ASCII to Unicode.

Virtual terminals can be used as system consoles with this driver (Support for console on virtual terminal). A system console manages the logins and kernel messages/warnings.

Virtual terminals must channel through a console driver to interact with the physical terminal (Support for binding and unbinding console drivers). Before the virtual terminal can do so, the console driver must be loaded. When the virtual terminal is closed, the console terminal must be unloaded.

The next driver provides support for Unix98 PTY (Unix98 PTY support). This is Unix98 pseudo terminal.

FUN FACT: The Linux kernel allows a filesystem to be mount many times in many places at once.

Next, "Support multiple instances of devpts" can be supported. The devpts filesystem is for pseudo-terminal slaves.

Legacy support for PTY can also be enabled (Legacy (BSD) PTY support).

The max amount of legacy PTYs in use can be set (Maximum number of legacy PTY in use).

The next driver can be used to offer support to serial boards that the other drivers fail to support (Non-standard serial port support).

Next, there are some drivers for specific boards and cards.

The GSM MUX protocol is supported with this driver (GSM MUX line discipline support (EXPERIMENTAL)).

The next driver enables the kmem device file (/dev/kmem virtual device support). kmem is usually used for kernel debugging. kmem can be used to read certain kernel variables and states.

The Stallion cards have many serial ports on them (Stallion multiport serial support). This driver specifically supports this card.

Next, we can move on to drivers for serial devices. As stated before, serial devices transfer one bit at a time.

The first driver is for standard serial port support (8250/16550 and compatible serial support).

Plug-and-Play also exists for serial ports with this driver (8250/16550 PNP device support).

The following driver allows the serial ports to be used for connecting a terminal to be used as a console (Console on 8250/16550 and compatible serial port).

Some UART controllers support Direct Memory Access (DMA support for 16550 compatible UART controllers). UART stands for Universal Asynchronous Receiver/Transmitter. UART controllers convert serial to parallel and vice versa.

Next, this driver offers support for standard PCI serial devices (8250/16550 PCI device support).

16-bit PCMCIA serial devices are supported by this driver (8250/16550 PCMCIA device support). Remember, PCMCIA is a PC-card that is usually used in laptops.

The maximum number of supported serial ports can be set (Maximum number of 8250/16550 serial ports) and then the maximum that are registered during boot-up (Number of 8250/16550 serial ports to register at runtime).

For extended serial abilities like HUB6 support, enable this driver (Extended 8250/16550 serial driver options).

A special driver is needed to support more than four legacy serial ports (Support more than 4 legacy serial ports).

Serial interrupts can be shared when this driver is used (Support for sharing serial interrupts).

Serial port IRQs can be autodetected using this driver (Autodetect IRQ on standard ports).

RSA serial ports are also supported by the Linux kernel (Support RSA serial ports). RSA stands for Remote Supervisor Adapter. RSA is an IBM-specific hardware.

Next, there are various vendor/device specific divers.

This is a TTY driver that uses printk to output user messages (TTY driver to output user messages via printk). Printk (print kernel) is a special piece of software that usually prints the boot-up messages. Any string that is displayed by printk is usually put in the /var/log/messages file. The shell command "dmesg" displays all strings that were used by printk.

Next, we can enable/disable support for parallel printers (Parallel printer support).

The next driver allows a printer to be used as a console (Support for console on line printer). This means kernel messages will be literally printed at the printer. Normally when the word "print" was used in this article series, it meant putting data on the screen. This time, this literally means putting the data on paper.

The following driver makes the device files at /dev/parport/ (Support for user-space parallel port device drivers). This allows some processes to access.

Again, the Linux kernel has many features and drivers, so we will discuss more drivers in the next article. Mahalo!

NOTE TO FANS: We are getting close to the end of the configuration process. I still have a list of all of the suggested Linux kernel topics that many of you wanted to know about. Some of the topics include installing the kernel, managing modules, adding 3rd-party drivers, and all of the other very interesting suggestions and requests. 

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-16.4835/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出