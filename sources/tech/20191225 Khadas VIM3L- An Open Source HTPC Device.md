[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Khadas VIM3L: An Open Source HTPC Device)
[#]: via: (https://itsfoss.com/vim3l/)
[#]: author: (Community https://itsfoss.com/author/itsfoss/)

Khadas VIM3L: An Open Source HTPC Device
======

If you’ve read our list of [Raspberry Pi alternatives][1], you might have come across VIM by Khadas.

China-based [Khadas][2] is becoming increasingly popular for its single board computers (SCB). Apart from the generic do-it-yourself (DIY) VIM series, Khadas also has [Tone boards][3] that can be utilized for DJing and [Edge][4] boards for AI and other related projects.

As discussed in [Raspberry Pi projects][5], one of the most popular use of a single board computer is to use it as a media center. You can turn your TV in more than just a smart TV (without being monitored) and play local music, videos, pictures and even games on your TV. You can also watch streaming services through these media center.

You can always configure VIm (or any other SCB) as a media center. It’s a good DIY exercise but not everyone would like it.

This is why Khadas has introduced [VIM3L][6] which is a ready to use media center device based on VIM 3. In this article, we’ll have a look at this device and see how to set it up.

### VIM 3L specifications

One of the strong point of Khadas is its emphasis on open source. All their source code, including [U-Boot][7], mainline Linux and Android is available on [their GitHub repository][8].

VIM3L comes with [CoreELEC][9] operating system. CoreELEC is a custom Linux distribution that comes with software like [Kodi][10] and its add-ons to give you a complete HTPC (home theatre PC) experience.

![][11]

You are not restricted to CoreELEC though. You can get the barebon version of VIM 3L and use Android or install your a Linux distribution of your choice.

  * Amlogic S905D3 SoC with quad-core Cortex-A55 CPU clocked at 1.9GHz
  * 16GB eMMC
  * 2GB RAM
  * 2x WiFi antennas
  * PCIe 2.0 and M.2 NVMe SSD support
  * HDMI port
  * Dolby Audio



The HTPC version costs slightly more than the bare board but it consists of some additional hardware along with CoreELEC operating system:

  * Transparent DIY case
  * Metal DIY case
  * Heatsink
  * IR Remote



![VIM3L HTPC Kit][12]

VIM3L is capable of running 4K video at 75 fps. It also includes TrustZone based security for DRM video streaming. Both Android and CoreELEC are capable of [OTA updates][13].

[VIM3L HTPC version costs $89.99][14] and the bare board (with Android) costs $69.99. It’s FOSS readers can _**get $6 off with itsfossfuns coupon code**_ that can be used at the checkout page of Khadas shop.

[Khadas VIM3 Series][15]

You may opt for the free shipping option but it will take 2-3 weeks for the device to reach you from China. You can pay $20 extra for an express DHL shipping. The shipping options are available at checkout. I think you might have to pay custom tax depending on your country’s rules so ordering one from Amazon would be better in such a case but you won’t get the It’s FOSS special discount on Amazon.

Now that you are aware of the specifications, let me show you how to set it up and how was my experience with it.

_The amazon links in this article are affiliate links. Please read our [affiliate policy][16]._

### Setting up VIM3L and using it as home theatre PC

Initially, when you start VIM3L, a window appears on the screen which consists of a series of questions and options. Everything you choose determines the initial state of its operation. In each case, however, you can modify your options from the settings menu. Better not to rush through the settings, since the multitude of options you have at startup seem to turn the VIM3L into a superpower device.

![Setting up proxy network][17]

The addition of the proxy connectivity in the internet settings is a welcome option. As a enthusiast of user privacy, I enabled it to connect through the [Tor network][18]. The choice is of course yours.

![Peripheral devices][19]

You can modify how many and which peripheral devices you have on that device. For example, in addition to the handheld control, you can mount a keyboard or even a console controller. Correct! A console controller that will allow you to play games.

![Option to save logs][20]

An important addition is the log storage option. With this, the users can consult the logs in case of an event of an error or malfunction. This could help in troubleshooting the issue.

![Plenty of add-ons][21]

On the left, a user can see options such as music, videos, radio, photos, games and many other options that we would like to take some time to cover.

Add-ons further extends the capabilities of your HTPC. Here, you can find music libraries, documentaries, games, open-source software and more. The software includes various graphics, audio, and video editors, simulators etc.

You have the freedom to choose whether you want to download them through 3rd party repositories, or from the environment of the accessory. Also, if you try to install software, you will most likely notice that along with the program, appropriate libraries and software are also installed. As you can see, this is not an accessory from scratch, but an accessory that is ready to cope with its users’ choices.

VIM3L has different configuration profile consisting of a standard, intermediate, expert profile. As you climb into difficulty, your choices are multiplied, giving you total freedom.

### Thoughts on VIM3L

![][22]

I liked VIM3L for what it offers. This is not to say that it is a perfect device.

I found that some point, the controller is not fully accurate in signal transmission. As a result, after pressing a button twice, the signal is sent later and there is a quick change of screen. Maybe the controller I received was faulty.

In conclusion, I would like to say that it’s not an expensive device and the feature it offers are good enough to provide you with entertainment, fun, productivity, and creativity. Most importantly, the software it offers are free and open source.

If you like what you see here, you can either order it from [its own shop that ships from China][6] or get it from [Amazon][23].

Preview | Product | Price |
---|---|---|---
![Khadas Amlogic S905D3 VIM3L HTPC Kit][24] ![Khadas Amlogic S905D3 VIM3L HTPC Kit][24] | [Khadas Amlogic S905D3 VIM3L HTPC Kit][25] | $89.99[][26] | [Buy on Amazon][27]

Have you used VIM3L or any other pre-built media center device? Or do you prefer making your own HTPC? Do share your views.

--------------------------------------------------------------------------------

via: https://itsfoss.com/vim3l/

作者：[Community][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/itsfoss/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/raspberry-pi-alternatives/
[2]: https://www.khadas.com/
[3]: https://www.amazon.com/dp/B07K6GQNH3?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (Tone boards)
[4]: https://www.khadas.com/edge
[5]: https://itsfoss.com/raspberry-pi-projects/
[6]: https://www.khadas.com/vim3l
[7]: https://www.denx.de/wiki/U-Boot
[8]: https://github.com/khadas
[9]: https://coreelec.org/
[10]: https://itsfoss.com/install-kodi-ubuntu/
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/VIM3L_OS_Freedom_graphic.jpg?ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/VIM3L-Htpc-Kit.jpg?ssl=1
[13]: https://source.android.com/devices/tech/ota
[14]: https://www.amazon.com/dp/B081H66D7Q?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (VIM3L HTPC version costs $89.99)
[15]: https://www.khadas.com/shop-vim3
[16]: https://itsfoss.com/affiliate-policy/
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/khadas_vim3l_3.jpg?ssl=1
[18]: https://itsfoss.com/tor-guide/
[19]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/khadas_vim3l_2.jpg?ssl=1
[20]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/khadas_vim3l_4.jpg?ssl=1
[21]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/khadas_vim3l_1.jpg?ssl=1
[22]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/VIM3L.jpg?ssl=1
[23]: https://www.amazon.com/dp/B081H66D7Q?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (Amazon)
[24]: https://i0.wp.com/m.media-amazon.com/images/I/41YC-mlA2PL._SL160_.jpg?ssl=1
[25]: https://www.amazon.com/dp/B081H66D7Q?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (Khadas Amlogic S905D3 VIM3L HTPC Kit)
[26]: https://www.amazon.com/gp/prime/?tag=chmod7mediate-20 (Amazon Prime)
[27]: https://www.amazon.com/dp/B081H66D7Q?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (Buy on Amazon)
