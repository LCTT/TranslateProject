[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A handy utility for creating Raspberry Pi SD card images)
[#]: via: (https://opensource.com/article/20/4/raspberry-pi-imager-mac)
[#]: author: (James Farrell https://opensource.com/users/jamesf)

A handy utility for creating Raspberry Pi SD card images
======
Getting started with Raspberry Pi Imager on a Mac.
![Raspberries with pi symbol overlay][1]

There are many ways to buy a Raspberry Pi, and depending on who you buy it from, it may or may not come with an operating system already installed on it. Getting an OS onto a Raspberry Pi is a matter of "flashing" an SD card with an OS image. To make this as easy as possible, the [Raspberry Pi Foundation][2] has introduced a Raspberry Pi Imager application, and you can download it for all major platforms. Here's a quick intro to this helpful new utility.

### Install the Imager

You can find the Raspberry Pi Imager over at the usual [Raspberry Pi Downloads][3] page. Versions exist for Mac, Ubuntu, and Windows. I will download and demonstrate the Mac version.

Installation on Mac consists of the usual DMG image that mounts to your desktop, and then a typical installer window appears:

![Raspberry Pi Imager installer][4]

Simply drag the cute raspberry icon to the Application folder, and you are done. Invoke that from Launchpad, and you are presented with a series of simple buttons and menus to choose from. It really cannot be simpler than this:

![Raspberry Pi Imager home screen][5]

### Images and options available

The default options contain a variety of images for various Raspberry Pi models. Raspbian is the top choice with two available options for smaller "Lite" and fatter "Full" versions available. The LibreELEC Kodi entertainment system is available in various model-specific builds. Ubuntu 18 and 19 have 32-bit and 64-bit builds available for different Pi models. There is an RPi 4 EEPROM recovery utility and a function to format your card using FAT32. Finally, a generic image installer option is available that I will try out a little later. Pretty handy for a simple and compact utility.

### Install some images

I had a 16g micro SD card that I decided to play with. I selected the default Raspbian image, chose my attached USB/SD device, and pressed WRITE. Here is a brief demo:

![Raspberry Pi Imager demo][6]

I didn't post the entire sequence there. I believe it downloaded the image as it was writing and took a few minutes on my wireless connection to finish. The process goes through a write and then a verify cycle before it is finished. When it was done, I ejected the device, popped the card into my RPi 3, and was treated to the usual graphical Raspbian setup wizard and desktop environment.

That wasn't quite enough for me; I get plenty of Linux on a daily basis and was looking for a little more today. I went back to the [Raspberry Pi Downloads][3] page and pulled down the RISC OS image. This process was nearly as easy. Download the RISCOSPi.5.24.zip file, extract it, and find the ro524-1875M.img file. From the Operating System button, I selected the Use Custom option and selected the desired image file. The process was pretty much the same; the only real difference being I had to hunt around my Downloads directory and select an image. Once the file was finished writing, back into the Pi 3, and RISC OS was ready to go.

### Gripes on USB C

This is just a silly aside, but how many of you are a bit frustrated with the total inconvenience of USB C these days? I'm using a MacBook Pro, which only has USB C ports, and I am subject to a never-ending swap of adapters to get things done. Take a look at this:

![USB C adapter][7]

Yes, that is a USB C to USB A adapter, then a USB to SD card reader, and an SD to micro SD adapter inside. I probably could have found something online to simplify this, but these are the parts I had on hand to support my family's myriad Mac, Windows, and Linux hosts. Enough about that, but I hope you got a chuckle from that insanity.

### Summary

The new Raspberry Pi Imager is a simple and effective tool for getting off the ground quickly with Raspberry Pi images. [BalenaEtcher][8] is a similar tool for imaging your removable devices, but this new Raspberry Pi Imager makes the process of common RPi OS installations (like Raspbian) a bit easier by eliminating the steps to fetch those common images.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/4/raspberry-pi-imager-mac

作者：[James Farrell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jamesf
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life-raspberrypi_0.png?itok=Kczz87J2 (Raspberries with pi symbol overlay)
[2]: https://www.raspberrypi.org/
[3]: https://www.raspberrypi.org/downloads/
[4]: https://opensource.com/sites/default/files/uploads/install_1.png (Raspberry Pi Imager installer)
[5]: https://opensource.com/sites/default/files/uploads/screen_2_0.png (Raspberry Pi Imager home screen)
[6]: https://opensource.com/sites/default/files/uploads/demo_3.gif (Raspberry Pi Imager demo)
[7]: https://opensource.com/sites/default/files/uploads/adapter_4.png (USB C adapter)
[8]: https://www.balena.io/etcher/
