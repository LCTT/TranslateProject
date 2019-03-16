[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to boot up a new Raspberry Pi)
[#]: via: (https://opensource.com/article/19/3/how-boot-new-raspberry-pi)
[#]: author: (Anderson Silva https://opensource.com/users/ansilva)

How to boot up a new Raspberry Pi
======
Learn how to install a Linux operating system, in the third article in our guide to getting started with Raspberry Pi.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/programming_code_keyboard_orange_hands.png?itok=G6tJ_64Y)

If you've been following along in this series, you've [chosen][1] and [bought][2] your Raspberry Pi board and peripherals and now you're ready to start using it. Here, in the third article, let's look at what you need to do to boot it up.

Unlike your laptop, desktop, smartphone, or tablet, the Raspberry Pi doesn't come with built-in storage. Instead, it uses a Micro SD card to store the operating system and your files. The great thing about this is it gives you the flexibility to carry your files (even if you don't have your Raspberry Pi with you). The downside is it may also increase the risk of losing or damaging the card—and thus losing your files. Just protect your Micro SD card, and you should be fine.

You should also know that SD cards aren't as fast as mechanical or solid state drives, so booting, reading, and writing from your Pi will not be as speedy as you would expect from other devices.

### How to install Raspbian

The first thing you need to do when you get a new Raspberry Pi is to install its operating system on a Micro SD card. Even though there are other operating systems (both Linux- and non-Linux-based) available for the Raspberry Pi, this series focuses on [Raspbian][3] , Raspberry Pi's official Linux version.

![](https://opensource.com/sites/default/files/uploads/raspbian.png)

The easiest way to install Raspbian is with [NOOBS][4], which stands for "New Out Of Box Software." Raspberry Pi offers great [documentation for NOOBS][5], so I won't repeat the installation instructions here.

NOOBS gives you the choice of installing the following operating systems:

+ [Raspbian][6]
+ [LibreELEC][7]
+ [OSMC][8]
+ [Recalbox][9]
+ [Lakka][10]
+ [RISC OS][11]
+ [Screenly OSE][12]
+ [Windows 10 IoT Core][13]
+ [TLXOS][14]

Again, Raspbian is the operating system we'll use in this series, so go ahead, grab your Micro SD and follow the NOOBS documentation to install it. I'll meet you in the fourth article in this series, where we'll look at how to use Linux, including some of the main commands you'll need to know.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/how-boot-new-raspberry-pi

作者：[Anderson Silva][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ansilva
[b]: https://github.com/lujun9972
[1]: https://opensource.com/article/19/3/which-raspberry-pi-choose
[2]: https://opensource.com/article/19/2/how-buy-raspberry-pi
[3]: https://www.raspbian.org/RaspbianFAQ
[4]: https://www.raspberrypi.org/downloads/noobs/
[5]: https://www.raspberrypi.org/documentation/installation/noobs.md
[6]: https://www.raspbian.org/RaspbianFAQ
[7]: https://libreelec.tv/
[8]: https://osmc.tv/
[9]: https://www.recalbox.com/
[10]: http://www.lakka.tv/
[11]: https://www.riscosopen.org/wiki/documentation/show/Welcome%20to%20RISC%20OS%20Pi
[12]: https://www.screenly.io/ose/
[13]: https://developer.microsoft.com/en-us/windows/iot
[14]: https://thinlinx.com/
