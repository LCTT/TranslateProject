19 The Linux Kernel: Configuring the Kernel Part 15
================================================================================
![](http://www.linux.org/attachments/slide-jpg.578/)

Aloha! In this article of the Linux kernel series, we are still configuring drivers for USB networking. Then, we will move on to input devices.

First, we can enable/disable the "Multi-purpose USB Networking Framework" which allows connecting laptops to desktop systems.

Next, the ASIX USB-to-Ethernet adapter driver can be enabled/disabled (ASIX AX88xxx Based USB 2.0 Ethernet Adapters).

Then, there is another ASIX adaptor driver (ASIX AX88179/178A USB 3.0/2.0 to Gigabit Ethernet).

NOTE: Generally, it is best to add adapter drivers as modules.

The Communication Device Class specification is offered in the driver (CDC Ethernet support (smart devices such as cable modems)). This specification is for USB modems. The Linux system recognizes this USB networking interface as an Ethernet interface and will be designated as "ethX" where "X" is the Ethernet device number.

Next is a specification similar to the above (CDC EEM support). CDC EEM stands for Communication Device Class Ethernet Emulation Model.

The CDC Network Control Model (NCM) also has a driver that offers the specification (CDC NCM support).

The driver providing the CDC MBIM (Mobile Broadband Interface Model) specification is also available for the Linux kernel (CDC MBIM support).

Next, there are several vendor/device specific drivers for various USB networking devices and chipsets.

After those, there is a generic driver for USB network devices that do not require any special drivers (Simple USB Network Links (CDC Ethernet subset)).

Again, there are some more drivers for device/vendor specific devices.

FUN FACT: Linux was used to make the special effects for the movie "Titanic" by James Cameron.

"CDC Phonet support" is for USB Nokia modems that use Phonet.

Now, we can move on to Wireless LAN drivers which use the 802.11 specification.

Mainly, there is a list of vendor/device specific drivers.

"SoftLED Support" controls the LEDs that are associated with the Wifi cards/devices.

Some chipsets support SDIO as seen by this driver (Atheros ath6kl SDIO support). SDIO is an extension of the Secure Digital specification for wireless SD cards. SDIO stands for Secure Digital Input/Output.

Kernel developers may also notice that some wireless devices can support QoS. QoS stands for Quality of Service. This feature gives network transmissions priority. Assume two sets of data need to be sent over a network. Only one can go first. QoS will send the most important data first.

FUN FACT: Technically, Linux is not an operating system. Linux is the kernel while GNU/Linux is the operating system.

The "Generic HDLC layer" is needed for WAN cards. HDLC stands for High-Level Data Link Control. This is a data link layer protocol.

Raw HDLC can be used with the "Raw HDLC support" driver enabled.

The "Raw HDLC Ethernet device support" driver allows the HDLC layer to emulate Ethernet.


The cHDLC driver offers a HDLC extension also called Cisco HDLC (Cisco HDLC support).

The Linux kernel also has a driver for "Frame Relay support" for HDLC. Frame Relay is a Layer 2 protocol.

HDLC can also support PPP (Synchronous Point-to-Point Protocol (PPP) support) and X.25 (X.25 protocol support).

Next, this driver offers Frame Relay the ability to use DLCI (Frame Relay DLCI support).

The "LAPB over Ethernet driver" creates a device file that permits the user to make a LAPB point-to-point connection to another computer via Ethernet. The device file is usually /dev/lapb0 for the first of such device.

X.25 frames can be sent over telephone lines with this driver (X.25 async driver). Specifically, this driver allows X.25 to use asynchronous serial lines.

A special driver is needed for ISA SBNI12-xx cards (Granch SBNI12 Leased Line adapter support). These cards are inexpensive substitutes for leased line modems.

The next driver allows parallel connections to carry scheduled traffic (Multiple line feature support). This allows the Linux system to more efficiently manage parallel connection on SBNI12 adapters. Some Linux users claim this driver doubles their speed. However, I have never tested this to know for myself.

Next, "IEEE 802.15.4 drivers" can be configured. This is for slow WAN devices. This is a standard that controls the media and physical layers of the wireless network. This specification uses different frequencies in different continents. For example, in Europe, such wireless devices will use the 868.0-868.6MHz frequency.

The first setting in this category is for a fake LR-WPAN driver (Fake LR-WPAN driver with several interconnected devices). LR-WPAN stand for Low-Rate Wireless Personal Area Network.

FUN FACT: Only about 2% of the current kernel was written by Linus Torvalds.

The vmxnet3 virtual Ethernet used by VMware requires this driver (VMware VMXNET3 ethernet driver). When making a kernel for a large number of users, it is best to enable this as a module because someone may want to use the Ethernet on VMware.

The Hyper-V virtual network needs this driver (Microsoft Hyper-V virtual network driver). You may be wondering if this is the same Hyper-V virtual network by Microsoft. It is and yes, Linux supports Hyper-V.

The digital telephone service, ISDN, is supported by this driver (ISDN support). ISDN stands for Integrated Services Digital Network. In France, ISDN is known as RNIS which stands for Réseau numérique à intégration de services. With an ISDN adapter, a computer can start and accept voice calls. This allows computers to be used as answering machines or some other telephone service device. ISDN can also carry video information.

Now, we can move on to input devices (Input device support). These are devices that give the computer information. Mice and keyboards are the most commonly used and known input devices. Scanners are another example of input devices.

First, there is a driver that supports various haptic/tactile feed-back devices (Support for memoryless force-feedback devices). For instance, many game controllers vibrate which is haptic/tactile feed-back.

Some input devices check on the status of the hardware (Polled input device skeleton). Such behavior requires this driver.

Input devices that use sparse keymaps need this driver (Sparse keymap support library). A keymap is the layout information for keyboards.

Next, this is another keymap (Matrix keymap support library).

NOTE: When making a kernel for a broad user group, include most or all input devices as modules because the developer usually does not know what type of devices the users may plugin to the computer.

FUN FACT: A Vanilla Kernel is a Linux kernel in its original, unchanged state.

The "Mouse interface" makes two different device files for the mouse. The two device files are /dev/input/mouseX and /dev/input/mice.

This next driver makes a psaux device file that is an alias to /dev/input/mice (Provide legacy /dev/psaux device). The psaux device file is /dev/psaux.

If the system has a digitizer, then the horizontal resolution needs to be set (Horizontal screen resolution) and then the vertical resolution (Vertical screen resolution). A digitizer is the type of touch-screen that supports touch-pens that allow users to draw. Other touch-screens cannot support such complex input.

The next driver supports joysticks and gamepads (Joystick interface). This driver creates the /dev/input/jsX files.

The "Event interface" driver allows input devices to be accessible via /dev/input/eventX.

The "Event debugging" driver outputs all input events to the system's log. Do not enable this for any reason other than debugging systems. Obviously, for performance reasons, but the main reason I recommend this be disabled is for security purposes. All key-presses are plainly logged including passwords.

Next, a list of various keyboard drivers are listed for configuration (Keyboards) followed by mouse drivers (Mice) and then joystick/gamepad drivers (Joysticks/Gamepads).

After that, various drivers for specific tablet hardware/vendors are listed (Tablets). After that is the driver list for "Touchscreens".

The last set of input device drivers is a list of miscellaneous drivers for specific hardware and vendors (Miscellaneous devices).

The next article of this series will discuss input ports. Do not forget to read the other articles of this series and this website. Mahalo!

**NOTE TO FANS: Thank you** for all of your kind emails telling me how much you all love these articles. 

--------------------------------------------------------------------------------

via: http://www.linux.org/threads/the-linux-kernel-configuring-the-kernel-part-15.4793/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出