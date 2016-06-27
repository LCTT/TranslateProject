Industrial SBC builds on Raspberry Pi Compute Module
=====================================================

![](http://hackerboards.com/files/embeddedmicro_mypi-thm.jpg)

On Kickstarter, a “MyPi” industrial SBC using the RPi Compute Module offers a mini-PCIe slot, serial port, wide-range power, and modular expansion.

You might wonder why in 2016 someone would introduce a sandwich-style single board computer built around the aging, ARM11 based COM version of the original Raspberry Pi, the [Raspberry Pi Compute Module][1]. First off, there are still plenty of industrial applications that don’t need much CPU horsepower, and second, the Compute Module is still the only COM based on Raspberry Pi hardware, although the cheaper, somewhat COM-like [Raspberry Pi Zero][2], which has the same 700MHz processor, comes close.

![](http://hackerboards.com/files/embeddedmicro_mypi-sm.jpg)

![](http://hackerboards.com/files/embeddedmicro_mypi_encl-sm.jpg)

>MyPi with COM and I/O add-ons (left), and in its optional industrial enclosure

In addition, Embedded Micro Technology says its SBC is also designed to support a swap-in for a promised Raspberry Pi Compute Module upgrade built around the Raspberry Pi 3’s quad-core, Cortex-A53 Broadcom BCM2837 SoC. Since this product could arrive any week now, it’s unclear how that all sorts out for Kickstarter backers. Still, it’s nice to know you’re somewhat futureproof, even if you have to pay for the upgrade.

The MyPi is not the only new commercial embedded device based on the Raspberry Pi Compute Module. Pigeon Computers launched a [Pigeon RB100][3] industrial automation controller based on the COM in May. Most such devices arrived in 2014, however, shortly after the COM arrived, including the [Techbase Modberry][4].

The MyPi is over a third of the way toward its $21,696 funding goal with 30 days to go. An early bird package starts at $119, with shipments in September. Other kit options include a $187 version that includes the $30 Raspberry Pi Compute Module, as well as various cables. Kits are also available with add-on boards and an industrial enclosure.

![](http://hackerboards.com/files/embeddedmicro_mypi_baseboard-sm.jpg)

![](http://hackerboards.com/files/embeddedmicro_mypi_detail-sm.jpg)

>MyPi baseboard without COM or add-ons (left) and its port details

The Raspberry Pi Compute Module starts the MyPi off with the Broadcom BCM2835 SoC, 512MB RAM, and 4GB eMMC flash. The MyPi adds to this with a microSD card slot, an HDMI port, two USB 2.0 ports, a 10/100 Ethernet port, and a similarly coastline RS232 port (via USB).

![](http://hackerboards.com/files/embeddedmicro_mypi_angle1-sm.jpg)

![](http://hackerboards.com/files/embeddedmicro_mypi_angle2.jpg)

>Two views of the MyPi board with RPi and mini-PCIe modules installed

The MyPi is further equipped with a mini-PCIe socket, which is said to be “USB only and intended for use of modems available in the mPCIe form factor.” A SIM card slot is also available. Dual standard Raspberry Pi camera connectors are onboard along with an audio out interface, a battery-backed RTC, and LEDs. The SBC has a wide-range, 9-23V DC input.

The MyPi is designed for Raspberry Pi hackers who have stacked so many HAT add-on boards, they can no longer work with them effectively or stuff them inside and industrial enclosure, says Embedded Micro. The MyPi supports HATs, but also offers the company’s own “ASIO” (Application Specific I/O) add-on modules, which route their I/O back to the carrier board, which, in turn, connects it to the 8-pin, green, Phoenix-style, industrial I/O connector (labeled “ASIO Out”) on the board’s edge, as illustrated in the diagram below.

![](http://hackerboards.com/files/embeddedmicro_mypi_io-sm.jpg)
>MyPi’s modular expansion interface

As the Kickstarter page explains it: “Rather than have a plug in HAT card with IO signal connectors poking out on all sides, instead we take these same IO signals back down a second output connector which is directly connected to the green industrial connector.” Additionally, “by simply using extended length interface pins on the card (raising it up) you can expand the IO set further — all without using any cable assemblies!” says Embedded Micro.

![](http://hackerboards.com/files/embeddedmicro_mypi_with_iocards-sm.jpg)
>MyPi and its optional I/O add-on cards

The company offers a line of hardened ASIO plug-in cards for the MyPi, as shown above. These initially include CAN-Bus, 4-20mA transducer signals, RS485, Narrow Band RF, and more.
 
### Further information

The MyPi is available on Kickstarter starting at a 79-Pound ($119) early bird package (without the Raspberry Pi Compute Module) through July 23, with shipments due in September. More information may be found on the [MyPi Kickstarter page][5] and the [Embedded Micro Technology website][6].


--------------------------------------------------------------------------------

via: http://hackerboards.com/industrial-sbc-builds-on-rpi-compute-module/

作者：[Eric Brown][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://hackerboards.com/industrial-sbc-builds-on-rpi-compute-module/
[1]: http://hackerboards.com/raspberry-pi-morphs-into-30-dollar-com/
[2]: http://hackerboards.com/pi-zero-tweak-adds-camera-connector-keeps-5-price/
[3]: http://hackerboards.com/automation-controller-runs-linux-on-raspberry-pi-com/
[4]: http://hackerboards.com/automation-controller-taps-raspberry-pi-compute-module/
[5]: https://www.kickstarter.com/projects/410598173/mypi-industrial-strength-raspberry-pi-for-iot-proj
[6]: http://www.embeddedpi.com/
