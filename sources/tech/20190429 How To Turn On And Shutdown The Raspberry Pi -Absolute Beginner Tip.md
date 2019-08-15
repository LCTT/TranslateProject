[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Turn On And Shutdown The Raspberry Pi [Absolute Beginner Tip])
[#]: via: (https://itsfoss.com/turn-on-raspberry-pi/)
[#]: author: (Chinmay https://itsfoss.com/author/chinmay/)

How To Turn On And Shutdown The Raspberry Pi [Absolute Beginner Tip]
======

_**Brief: This quick tip teaches you how to turn on Raspberry Pi and how to shut it down properly afterwards.**_

The [Raspberry Pi][1] is one of the [most popular SBC (Single-Board-Computer)][2]. If you are interested in this topic, I believe that you’ve finally got a Pi device. I also advise to get all the [additional Raspberry Pi accessories][3] to get started with your device.

You’re ready to turn it on and start to tinker around with it. It has it’s own similarities and differences compared to traditional computers like desktops and laptops.

Today, let’s go ahead and learn how to turn on and shutdown a Raspberry Pi as it doesn’t really feature a ‘power button’ of sorts.

For this article I’m using a Raspberry Pi 3B+, but it’s the same for all the Raspberry Pi variants.

Bestseller No. 1

[][4]

[CanaKit Raspberry Pi 3 B+ (B Plus) Starter Kit (32 GB EVO+ Edition, Premium Black Case)][4]

CanaKit - Personal Computers

$79.99 [][5]

Bestseller No. 2

[][6]

[CanaKit Raspberry Pi 3 B+ (B Plus) with Premium Clear Case and 2.5A Power Supply][6]

CanaKit - Personal Computers

$54.99 [][5]

### Turn on Raspberry Pi

![Micro USB port for Power][7]

The micro USB port powers the Raspberry Pi, the way you turn it on is by plugging in the power cable into the micro USB port. But, before you do that you should make sure that you have done the following things.

  * Preparing the micro SD card with Raspbian according to the official [guide][8] and inserting into the micro SD card slot.
  * Plugging in the HDMI cable, USB keyboard and a Mouse.
  * Plugging in the Ethernet Cable(Optional).



Once you have done the above, plug in the power cable. This turns on the Raspberry Pi and the display will light up and load the Operating System.

Bestseller No. 1

[][4]

[CanaKit Raspberry Pi 3 B+ (B Plus) Starter Kit (32 GB EVO+ Edition, Premium Black Case)][4]

CanaKit - Personal Computers

$79.99 [][5]

### Shutting Down the Pi

Shutting down the Pi is pretty straight forward, click the menu button and choose shutdown.

![Turn off Raspberry Pi graphically][9]

Alternatively, you can use the [shutdown command][10] in the terminal:

```
sudo shutdown now
```

Once the shutdown process has started **wait** till it completely finishes and then you can cut the power to it. Once the Pi shuts down, there is no real way to turn the Pi back on without turning off and turning on the power. You could the GPIO’s to turn on the Pi from the shutdown state but it’ll require additional modding.

[][2]

Suggested read 12 Single Board Computers: Alternative to Raspberry Pi

_Note: Micro USB ports tend to be fragile, hence turn-off/on the power at source instead of frequently unplugging and plugging into the micro USB port._

Well, that’s about all you should know about turning on and shutting down the Pi, what do you plan to use it for? Let me know in the comments.

--------------------------------------------------------------------------------

via: https://itsfoss.com/turn-on-raspberry-pi/

作者：[Chinmay][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/chinmay/
[b]: https://github.com/lujun9972
[1]: https://www.raspberrypi.org/
[2]: https://itsfoss.com/raspberry-pi-alternatives/
[3]: https://itsfoss.com/things-you-need-to-get-your-raspberry-pi-working/
[4]: https://www.amazon.com/CanaKit-Raspberry-Starter-Premium-Black/dp/B07BCC8PK7?SubscriptionId=AKIAJ3N3QBK3ZHDGU54Q&tag=chmod7mediate-20&linkCode=xm2&camp=2025&creative=165953&creativeASIN=B07BCC8PK7&keywords=raspberry%20pi%20kit (CanaKit Raspberry Pi 3 B+ (B Plus) Starter Kit (32 GB EVO+ Edition, Premium Black Case))
[5]: https://www.amazon.com/gp/prime/?tag=chmod7mediate-20 (Amazon Prime)
[6]: https://www.amazon.com/CanaKit-Raspberry-Premium-Clear-Supply/dp/B07BC7BMHY?SubscriptionId=AKIAJ3N3QBK3ZHDGU54Q&tag=chmod7mediate-20&linkCode=xm2&camp=2025&creative=165953&creativeASIN=B07BC7BMHY&keywords=raspberry%20pi%20kit (CanaKit Raspberry Pi 3 B+ (B Plus) with Premium Clear Case and 2.5A Power Supply)
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/04/raspberry-pi-3-microusb.png?fit=800%2C532&ssl=1
[8]: https://www.raspberrypi.org/documentation/installation/installing-images/README.md
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/Raspbian-ui-menu.jpg?fit=800%2C492&ssl=1
[10]: https://linuxhandbook.com/linux-shutdown-command/
