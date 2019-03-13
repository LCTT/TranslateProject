[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Let's get physical: How to use GPIO pins on the Raspberry Pi)
[#]: via: (https://opensource.com/article/19/3/gpio-pins-raspberry-pi)
[#]: author: (Anderson Silva https://opensource.com/users/ansilva)

Let's get physical: How to use GPIO pins on the Raspberry Pi
======
The 10th article in our series on getting started with Raspberry Pi explains how the GPIO pins work.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/raspbery_pi_zero_wireless_hardware.jpg?itok=9YFzdxFQ)

Until now, this series has focused on the Raspberry Pi's software side, but today we'll get into the hardware. The availability of [general-purpose input/output][1] (GPIO) pins was one of the main features that interested me in the Pi when it first came out. GPIO allows you to programmatically interact with the physical world by attaching sensors, relays, and other types of circuitry to the Raspberry Pi.

![](https://opensource.com/sites/default/files/uploads/raspberrypi_10_gpio-pins-pi2.jpg)

Each pin on the board either has a predefined function or is designated as general purpose. Also, different Raspberry Pi models have either 26 or 40 pins for you to use at your discretion. Wikipedia has a [good overview of each pin][2] and its functionality.

You can do many things with the Pi's GPIO pins. I've written some other articles about using the GPIOs, including a trio of articles ([Part I][3], [Part II][4], and [Part III][5]) about controlling holiday lights with the Raspberry Pi while using open source software to pair the lights with music.

The Raspberry Pi community has done a great job in creating libraries in different programming languages, so you should be able to interact with the pins using [C][6], [Python][7], [Scratch][8], and other languages.

Also, if you want the ultimate experience to interact with the physical world, pick up a [Raspberry Pi Sense Hat][9]. It is an affordable expansion board for the Pi that plugs into the GPIO pins so you can programmatically interact with LEDs, joysticks, and barometric pressure, temperature, humidity, gyroscope, accelerometer, and magnetometer sensors.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/gpio-pins-raspberry-pi

作者：[Anderson Silva][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ansilva
[b]: https://github.com/lujun9972
[1]: https://www.raspberrypi.org/documentation/usage/gpio/
[2]: https://en.wikipedia.org/wiki/Raspberry_Pi#General_purpose_input-output_(GPIO)_connector
[3]: https://opensource.com/life/15/2/music-light-show-with-raspberry-pi
[4]: https://opensource.com/life/15/12/ssh-your-christmas-tree-raspberry-pi
[5]: https://opensource.com/article/18/12/lightshowpi-raspberry-pi
[6]: https://www.bigmessowires.com/2018/05/26/raspberry-pi-gpio-programming-in-c/
[7]: https://www.raspberrypi.org/documentation/usage/gpio/python/README.md
[8]: https://www.raspberrypi.org/documentation/usage/gpio/scratch2/README.md
[9]: https://opensource.com/life/16/4/experimenting-raspberry-pi-sense-hat
