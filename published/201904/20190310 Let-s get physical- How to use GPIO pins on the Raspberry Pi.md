[#]: collector: (lujun9972)
[#]: translator: (qhwdw)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10687-1.html)
[#]: subject: (Let's get physical: How to use GPIO pins on the Raspberry Pi)
[#]: via: (https://opensource.com/article/19/3/gpio-pins-raspberry-pi)
[#]: author: (Anderson Silva https://opensource.com/users/ansilva)

树莓派使用入门：进入物理世界 —— 如何使用树莓派的 GPIO 针脚
======

> 在树莓派使用入门的第十篇文章中，我们将学习如何使用 GPIO。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/raspbery_pi_zero_wireless_hardware.jpg?itok=9YFzdxFQ)

到目前为止，本系列文章主要专注于树莓派的软件方面，而今天我们将学习硬件。在树莓派最初发布时，最让我感兴趣的主要特性之一就是它的 [通用输入输出][1]（GPIO）针脚。GPIO 可以让你的树莓派程序与连接到它上面的传感器、继电器、和其它类型的电子元件与物理世界来交互。

![](https://opensource.com/sites/default/files/uploads/raspberrypi_10_gpio-pins-pi2.jpg)

树莓派上的每个 GPIO 针脚要么有一个预定义的功能，要么被设计为通用的。另外，不同的树莓派型号要么 26 个，要么有 40 个 GPIO 针脚，你可以根据情况使用的。在维基百科上有一个 [关于每个针脚的非常详细的说明][2] 以及它的功能介绍。

你可以使用树莓派的 GPIO 针脚做更多的事情。关于它的 GPIO 的使用我写过一些文章，包括使用树莓派来控制节日彩灯的三篇文章（[第一篇][3]、 [第二篇][4]、和 [第三篇][5]），在这些文章中我通过使用开源程序让灯光随着音乐起舞。

树莓派社区在用不同编程语言创建不同的库方面做了非常好的一些工作，因此，你能够使用 [C][6]、[Python][7]、 [Scratch][8] 和其它语言与 GPIO 进行交互。

另外，如果你想在树莓派与物理世界交互方面获得更好的体验，你可以选用 [Raspberry Pi Sense Hat][9]，它是插入树莓派 GPIO 针脚上的一个很便宜的电路板，借助它你可以通过程序与 LED、驾驶杆、气压计、温度计、温度计、 陀螺仪、加速度计以及磁力仪来交互。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/gpio-pins-raspberry-pi

作者：[Anderson Silva][a]
选题：[lujun9972][b]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

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
