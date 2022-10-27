[#]: subject: (My review of the Raspberry Pi 400)
[#]: via: (https://opensource.com/article/21/3/raspberry-pi-400-review)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

My review of the Raspberry Pi 400
======
Raspberry Pi 400's support for videoconferencing is a benefit for
homeschoolers seeking inexpensive computers.
![Raspberries with pi symbol overlay][1]

The [Raspberry Pi 400][2] promises to be a boon to the homeschool market. In addition to providing an easy-to-assemble workstation that comes loaded with free software, the Pi 400 also serves as a surprisingly effective videoconferencing platform. I ordered a Pi 400 from CanaKit late last year and was eager to explore this capability.

### Easy setup

After unboxing my Pi 400, which came in this lovely package, the setup was quick and easy.

![Raspberry Pi 400 box][3]

(Don Watkins, [CC BY-SA 4.0][4])

The Pi 400 reminds me of the old Commodore 64. The keyboard and CPU are in one form factor.

![Raspberry Pi 400 keyboard][5]

(Don Watkins, [CC BY-SA 4.0][4])

The matching keyboard and mouse make this little unit both aesthetically and ergonomically appealing.

Unlike earlier versions of the Raspberry Pi, there are not many parts to assemble. I connected the mouse, power supply, and micro HDMI cable to the back of the unit.

The ports on the back of the keyboard are where things get interesting.

![Raspberry Pi 400 ports][6]

(Don Watkins, [CC BY-SA 4.0][4])

From left to right, the ports are:

  * 40-pin GPIO
  * MicroSD: a microSD card is the main hard drive, and it comes with a microSD card in the slot, ready for startup
  * Two micro HDMI ports
  * USB-C port for power
  * Two USB 3.0 ports and one USB 2.0 port for the mouse
  * Gigabit Ethernet port



The CPU is a Broadcom 1.8GHz 64-bit quad-core ARMv8 CPU, overclocked to make it even faster than the Raspberry Pi 4's processor.

My unit came with 4GB RAM and a stock 16GB microSD card with Raspberry Pi OS installed and ready to boot up for the first time.

### Evaluating the software and user experience

The Raspberry Pi Foundation continually improves its software. Raspberry Pi OS has various wizards to make setup easier, including ones for keyboard layout, WiFi settings, and so on.

The software included on the microSD card was the August 2020 Raspberry Pi OS release. After initial startup and setup, I connected a Logitech C270 webcam (which I regularly use with my other Linux computers) to one of the USB 3.0 ports.

The operating system recognized the Logitech webcam, but I could not get the microphone to work with [Jitsi][7]. I solved this problem by updating to the latest [Raspberry Pi OS][8] release with Linux Kernel version 5.4. This OS version includes many important features that I love, like an updated Chromium browser and Pulse Audio, which solved my webcam audio woes. I can use open source videoconferencing sites, like Jitsi, and common proprietary ones, like Google Hangouts, for video calls, but Zoom was entirely unsuccessful.

### Learning computing with the Pi

The icing on the cake is the Official Raspberry Pi Beginners Guide, a 245-page book introducing you to your new computer. Packed with informative tutorials, this book hearkens back to the days when technology _provided documentation_! For the curious mind, this book is a vitally important key to the Pi, which is best when it serves as a gateway to open source computing.

And after you become enchanted with Linux and all that it offers by using the Pi, you'll have months of exploration ahead, thanks to Opensource.com's [many Raspberry Pi articles][9].

I paid US$ 135 for my Raspberry Pi 400 because I added an optional inline power switch and an extra 32GB microSD card. Without those additional components, the unit is US$ 100. It's a steal either way and sure to provide years of fun, fast, and educational computing.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/raspberry-pi-400-review

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life-raspberrypi_0.png?itok=Kczz87J2 (Raspberries with pi symbol overlay)
[2]: https://opensource.com/article/20/11/raspberry-pi-400
[3]: https://opensource.com/sites/default/files/uploads/pi400box.jpg (Raspberry Pi 400 box)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/uploads/pi400-keyboard.jpg (Raspberry Pi 400 keyboard)
[6]: https://opensource.com/sites/default/files/uploads/pi400-ports.jpg (Raspberry Pi 400 ports)
[7]: https://opensource.com/article/20/5/open-source-video-conferencing
[8]: https://www.raspberrypi.org/software/
[9]: https://opensource.com/tags/raspberry-pi
