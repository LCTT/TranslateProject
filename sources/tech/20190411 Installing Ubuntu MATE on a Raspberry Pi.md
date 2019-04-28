[#]: collector: (lujun9972)
[#]: translator: (warmfrog)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Installing Ubuntu MATE on a Raspberry Pi)
[#]: via: (https://itsfoss.com/ubuntu-mate-raspberry-pi/)
[#]: author: (Chinmay https://itsfoss.com/author/chinmay/)

Installing Ubuntu MATE on a Raspberry Pi
======

_**Brief: This quick tutorial shows you how to install Ubuntu MATE on Raspberry Pi devices.**_

[Raspberry Pi][1] is by far the most popular SBC (Single Board Computer) and the go-to board for makers. [Raspbian][2] which is based on Debian is the official operating system for the Pi. It is lightweight, comes bundled with educational tools and gets the job done for most scenarios.

[Installing Raspbian][3] is easy as well but the problem with [Debian][4] is its slow upgrade cycles and older packages.

Running Ubuntu on the Raspberry Pi gives you a richer experience and up to date software. We have a few options when it comes to running Ubuntu on your Pi.

  1. [Ubuntu MATE][5] : Ubuntu MATE is the only distribution which natively supports the Raspberry Pi with a complete desktop environment.
  2. [Ubuntu Server 18.04][6] \+ Installing a desktop environment manually.
  3. Using Images built by the [Ubuntu Pi Flavor Maker][7] community, _these images only support the Raspberry Pi 2B and 3B variants_ and are **not** updated to the latest LTS release.



The first option is the easiest and the quickest to set up while the second option gives you the freedom to install the desktop environment of your choice. I recommend going with either of the first two options.

Here are the links to download the Disc Images. In this article I’ll be covering Ubuntu MATE installation only.

### Installing Ubuntu MATE on Raspberry Pi

Go to the download page of Ubuntu MATE and get the recommended images.

![][8]

The experimental ARM64 version should only be used if you need to run 64-bit only applications like MongoDB on a Raspberry Pi server.

[Download Ubuntu MATE for Raspberry Pi][9]

#### Step 1: Setting Up the SD Card

The image file needs to be decompressed once downloaded. You can simply right click on it to extract it.

Alternatively, the following command will do the job.

```
xz -d ubuntu-mate***.img.xz
```

Alternatively you can use [7-zip][10] if you are on Windows.

Install **[Balena Etcher][11]** , we’ll use this tool to write the image to the SD card. Make sure that your SD card is at least 8 GB capacity.

Launch Etcher and select the image file and your SD card.

![][12]

Once the flashing process is complete the SD card is ready.

#### Step 2: Setting Up the Raspberry Pi

You probably already know that you need a few things to get started with Raspberry Pi such as a mouse, keyboard, HDMI cable etc. You can also [install Raspberry Pi headlessly without keyboard and mouse][13] but this tutorial is not about that.

  * Plug in a mouse and a keyboard.
  * Connect the HDMI cable.
  * Insert the SD card into the SD card slot.



Power it on by plugging in the power cable. Make sure you have a good power supply (5V, 3A minimum). A bad power supply can reduce the performance.

#### Ubuntu MATE installation

Once you power on the Raspberry Pi, you’ll be greeted with a very familiar Ubuntu installation process. The process is pretty much straight forward from here.

![Select your keyboard layout][14]

![Select Your Timezone][15]

Select your WiFi network and enter the password in the network connection screen.

![Add Username and Password][16]

After setting the keyboard layout, timezone and user credentials you’ll be taken to the login screen after a few minutes. And voila! you are almost done.

![][17]

Once logged in, the first thing you should do is to [update Ubuntu][18]. You can use the command line for that.

```
sudo apt update
sudo apt upgrade
```

You can also use the Software Updater.

![][19]

Once the updates are finished installing you are good to go. You can also go ahead and install Raspberry Pi specific packages for GPIO and other I/O depending on your needs.

What made you think about installing Ubuntu on the Raspberry and how has your experience been with Raspbian? Let me know in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-mate-raspberry-pi/

作者：[Chinmay][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/chinmay/
[b]: https://github.com/lujun9972
[1]: https://www.raspberrypi.org/
[2]: https://www.raspberrypi.org/downloads/
[3]: https://itsfoss.com/tutorial-how-to-install-raspberry-pi-os-raspbian-wheezy/
[4]: https://www.debian.org/
[5]: https://ubuntu-mate.org/
[6]: https://wiki.ubuntu.com/ARM/RaspberryPi#Recovering_a_system_using_the_generic_kernel
[7]: https://ubuntu-pi-flavour-maker.org/download/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/04/ubuntu-mate-raspberry-pi-download.jpg?ssl=1
[9]: https://ubuntu-mate.org/download/
[10]: https://www.7-zip.org/download.html
[11]: https://www.balena.io/etcher/
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/04/Screenshot-from-2019-04-08-01-36-16.png?ssl=1
[13]: https://linuxhandbook.com/raspberry-pi-headless-setup/
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/Keyboard-layout-ubuntu.jpg?fit=800%2C467&ssl=1
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/select-time-zone-ubuntu.jpg?fit=800%2C468&ssl=1
[16]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/Credentials-ubuntu.jpg?fit=800%2C469&ssl=1
[17]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/04/Desktop-ubuntu.jpg?fit=800%2C600&ssl=1
[18]: https://itsfoss.com/update-ubuntu/
[19]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/update-software.png?ssl=1
