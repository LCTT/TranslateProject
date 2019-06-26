[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Raspberry Pi 4 is here!)
[#]: via: (https://opensource.com/article/19/6/raspberry-pi-4)
[#]: author: (Ben Nuttall https://opensource.com/users/bennuttall)

Raspberry Pi 4 is here!
======
A new version of the $35 computer features a 1.5GHz Arm chip and support
for dual-HDMI 4K displays, Gigabit Ethernet, and much more.
![Raspberry Pi 4 board][1]

The latest version of the Raspberry Pi—Raspberry Pi 4—was released today, earlier than anticipated, featuring a new 1.5GHz Arm chip and VideoCore GPU with some brand new additions: dual-HDMI 4K display output; USB3 ports; Gigabit Ethernet; and multiple RAM options up to 4GB.

![Raspberry Pi 4 case][2]

The Raspberry Pi 4 is a very powerful single-board computer and starts at the usual price of $35. That gets you the standard 1GB RAM, or you can pay $45 for the 2GB model or $55 for the 4GB model—premium-priced models are a first for Raspberry Pi.

The specs at-a-glance:

  * 64-bit BCM2711 quad-core A72 CPU @ 1.5GHz
  * VideoCore VI GPU
  * Gigabit Ethernet port
  * 1GB, 2GB, or 4GB LPDDR4 RAM
  * Two Micro-HDMI ports
  * Two USB3 ports
  * Two USB2 ports
  * Dual-band (2.4GHz and 5GHz) WiFi
  * Bluetooth 5.0
  * USB Type C power port
  * CSI camera interface
  * DSI display interface
  * MicroSD card slot
  * Power-over-Ethernet pins
  * Full compatibility with all previous Raspberry Pi models



### USB and networking

The Raspberry Pi 4 has the benefit of having USB3; it's powered by a USB Type C cable and provides two USB3 ports and two USB2 ports. You can now connect USB3 hard drives and other peripherals and get faster connectivity.

![Raspberry Pi 4 USBs][3]

The BCM2835-based chip in Raspberry Pi 1 to 3 provided just one native USB port and no Ethernet, so a USB hub on the board provided more USB ports and an Ethernet port. The 3B+ added a dedicated LAN chip, which gave it Gigabit Ethernet, but this was limited to USB2 speeds. The Pi 4 has dedicated Gigabit Ethernet, and because it's no longer throttled over USB, its networking speeds are much faster.

The Pi 4 takes advantage of the technology built into the 3B+ that made it the first single-board computer with dual-band WiFi. This means you can connect to both 2.4GHz and 5GHz networks.

### Displays

When the first Raspberry Pi launched, the balance of its CPU and GPU performance was tipped heavily in favor of the GPU. The VideoCore IV was a very powerful graphics processor, capable of full-HD 1080p multimedia, which is why the Pi has always been popular as a home media center. The Pi 2 rebalanced things somewhat and brought the CPU in line, taking the Pi from a single-core to a quad-core Arm chip. The Pi 4 takes both factors a big step forward. The new VideoCore VI GPU gives the Pi 4K video and allows two displays via the board's two Micro-HDMI ports (selected to keep the board the same size), so you'll need an adapter or a Micro-to-full HDMI cable to use an HDMI monitor.

Dual displays are a godsend when you need more screen real estate to keep eye contact with multiple windows—if you're programming you might have your code on one screen and the website or app you're building; your database; your web browser; your emails, or anything else on the other. For the first time, development on Raspberry Pi won't be limited to a single monitor. It's also handy if you want to build a Pi-based project with different things on different screens.

The Pi also has a Display Serial Interface (DSI) port to drive another special display—not another monitor per se, but the official Raspberry Pi touch screen display connected via a flex cable.

### Raspbian Buster

This Raspberry Pi 4's launch coincides with a major Debian release, and the fact the new Pi supports OpenGL ES 3 means it makes sense for any software developed for the Pi 4 to target Raspbian Buster. Buster brings a few user interface tweaks and a whole host of software upgrades, including Python 3.7.

![Raspbian Buster][4]

### Open source graphics drivers

Over the last five years, Eric Anholt has been working to write open source graphics drivers for the Raspberry Pi. Now, Raspbian can use this driver to deliver accelerated web browsing, desktop graphics, and 3D applications on the Pi. This replaces a large chunk of closed-source code that was previously required. Huge thanks to Eric and Broadcom for this effort.

Previously, the Raspberry Pi 4 was expected to be yet another year away, but the chip design turned out to be ready for production much earlier than anticipated, so here it is!

* * *

_The Raspberry Pi 4 is on sale now. Which model will you opt for? Let us know your plans in the comments!_

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/raspberry-pi-4

作者：[Ben Nuttall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bennuttall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/raspberry-pi-4_lead.jpg?itok=2bkk43om (Raspberry Pi 4 board)
[2]: https://opensource.com/sites/default/files/uploads/raspberry-pi-4-case.jpg (Raspberry Pi 4 case)
[3]: https://opensource.com/sites/default/files/uploads/raspberry-pi-4-usb.jpg (Raspberry Pi 4 USBs)
[4]: https://opensource.com/sites/default/files/uploads/raspbian-buster.png (Raspbian Buster)
