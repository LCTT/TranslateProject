[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A Raspberry Pi Based Open Source Tablet is in Making and it’s Called CutiePi)
[#]: via: (https://itsfoss.com/cutiepi-open-source-tab/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

A Raspberry Pi Based Open Source Tablet is in Making and it’s Called CutiePi
======

CutiePie is an 8-inch open-source tablet built on top of Raspberry Pi. For now, it is just a working prototype which they announced on [Raspberry Pi forums][1].

In this article, you’ll get to know more details on the specifications, price, and availability of CutiePi.

They have made the Tablet using a custom-designed Compute Model (CM3) carrier board. The [official website][2] mentions the purpose of a custom CM3 carrier board as:

> A custom CM3/CM3+ carrier board designed for portable use, with enhanced power management and Li-Po battery level monitoring features; works with selected HDMI or MIPI DSI displays.

So, this is what makes the Tablet thin enough while being portable.

### CutiePi Specifications

![CutiePi Board][3]

I was surprised to know that it rocks an 8-inch IPS LCD display – which is a good thing for starters. However, you won’t be getting a true HD screen because the resolution is 1280×800 – as mentioned officially.

It is also planned to come packed with Li-Po 4800 mAh battery (the prototype had a 5000 mAh battery). Well, for a Tablet, that isn’t bad at all.

Connectivity options include the support for Wi-Fi and Bluetooth 4.0. In addition to this, a USB Type-A, 6x GPIO pins, and a microSD card slot is present.

![CutiePi Specifications][4]

The hardware is officially compatible with [Raspbian OS][5] and the user interface is built with [Qt][6] for a fast and intuitive user experience. Also, along with the in-built apps, it is expected to support Raspbian PIXEL apps via XWayland.

### CutiePi Source Code

You can second-guess the pricing of this tablet by analyzing the bill for the materials used. CutiePi follows a 100% open-source hardware design for this project. So, if you are curious, you can check out their GitHub page for more information on the hardware design and stuff.

[CutiePi on GitHub][7]

### CutiePi Pricing, Release Date &amp; Availability

CutiePi plans to work on [DVT][8] batch PCBs in August (this month). And, they target to launch the final product by the end of 2019.

Officially, they expect it to launch it at around $150-$250. This is just an approximate for the range and should be taken with a pinch of salt.

Obviously, the price will be a major factor in order to make it a success – even though the product itself sounds promising.

**Wrapping Up**

CutiePi is not the first project to use a [single board computer like Raspberry Pi][9] to make a tablet. We have the upcoming [PineTab][10] which is based on Pine64 single board computer. Pine also has a laptop called [Pinebook][11] based on the same.

Judging by the prototype – it is indeed a product that we can expect to work. However, the pre-installed apps and the apps that it will support may turn the tide. Also, considering the price estimate – it sounds promising.

What do you think about it? Let us know your thoughts in the comments below or just play this interactive poll.

--------------------------------------------------------------------------------

via: https://itsfoss.com/cutiepi-open-source-tab/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://www.raspberrypi.org/forums/viewtopic.php?t=247380
[2]: https://cutiepi.io/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/08/cutiepi-board.png?ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/cutiepi-specifications.jpg?ssl=1
[5]: https://itsfoss.com/raspberry-pi-os-desktop/
[6]: https://en.wikipedia.org/wiki/Qt_%28software%29
[7]: https://github.com/cutiepi-io/cutiepi-board
[8]: https://en.wikipedia.org/wiki/Engineering_validation_test#Design_verification_test
[9]: https://itsfoss.com/raspberry-pi-alternatives/
[10]: https://www.pine64.org/pinetab/
[11]: https://itsfoss.com/pinebook-pro/
