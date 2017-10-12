translating---geekpi

How to Install Multiple Linux Distributions on One USB
============================================================


 _Brief: This tutorial shows you how to install multiple Linux distributions on one USB. This way, you can enjoy more than one live Linux distros on a single USB key._ 

I enjoy trying out different Linux distributions via live USB. It gives me the option to test the OS on a real hardware, not in a virtualized environment. Also, I can plug in the USB to any system (read Windows), do whatever I want and enjoy the same Linux experience. And yes, in case something goes wrong with my system I can use the USB drive to recover!

Creating a single [bootable live USB of Linux][8] is easy, you just download an ISO file and burn it to a USB drive. But, what if you want to try more than one Linux distribution? You can either use more than one USB or you can overwrite the same USB to try other Linux distributions. Neither of these methods is very convenient.

So, how about installing more than one Linux distributions on a single USB? We are going to see how to do it in this tutorial.

### How to create a bootable USB with multiple Linux distributions on it

![How to install multiple linux distributions on a single USB](https://itsfoss.com/wp-content/uploads/2017/10/multiple-linux-on-one-usb-800x450.jpg)

Well, we have a tool which does exactly the same by keeping  _more than one Linux distribution on a single USB drive_ . All you have to do is select the distributions you want to install. In this tutorial, we will cover  _how to install multiple Linux distribution on a USB stick_  for live sessions.

Just to make sure, you should have a USB drive big enough to have several Linux distributions on it, so an 8 GB USB key should be enough for three or four Linux distributions.

### Step 1

[MultiBootUSB][9] is a free and open source cross-platform application which allows you to create a USB drive with multiple Linux distributions. It also supports uninstalling any distribution at any point in time, so you can reclaim space on your drive for another one.

Download the .deb package and install it by double-clicking on it.

[Download MultiBootUSB][10]

### Step 2

The recommended filesystem is FAT32, so make sure to format your USB drive before creating a multi-boot USB stick.

### Step 3

Download the ISO images of Linux distributions you want to install.

### Step 4

Once you have everything, start MultiBootUSB.

![MultiBootUSB](https://itsfoss.com/wp-content/uploads/2017/09/1.png)

The home screen asks you to select the USB disk and the image file for the Linux distribution which you want to put on your USB.

MultiBootUSB supports persistence for Ubuntu, Fedora and Debian distros, which means that changes made to the live version of the Linux distributions are saved to the USB disk.

You can select the persistence size by dragging the slider under MultiBootUSB tab. Persistence gives you an option to save changes to the USB drive in runtime.

![MultiBootUSB persistence storage](https://itsfoss.com/wp-content/uploads/2017/09/2-1.png)

### Step 5

Click on Install distro option and proceed with the installation. It will take some time to complete before showing a successful installation message.

You can now see the distribution in the installed section. For another OS, repeat the process. This is what it looks like when I installed a copy of Ubuntu 16.10 and Fedora 24.

![MultiBootSystem with Ubuntu and Fedora](https://itsfoss.com/wp-content/uploads/2017/09/3.png)

### Step 6

Next time I boot through the USB, I get the option of choosing either of the distributions.

![Boot Menu](https://itsfoss.com/wp-content/uploads/2017/09/VirtualBox_Ubuntu1610_23_09_2017_14_16_05-1.png)

You can add as many distros as you want and your USB storage allows. For removing a distro, select it from the list and click on Uninstall Distro.

### Final Words

MultiBootUSB really looks handy for installing multiple Linux distribution on a USB stick. With just a few clicks, I have a working drive with two of my favorite OS and I can boot into them on any system.

Let us know in the comments if you face any issue while installing or using MultiBootUSB.

--------------------------------------------------------------------------------

via: https://itsfoss.com/multiple-linux-one-usb/

作者：[Ambarish Kumar ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/ambarish/
[1]:https://itsfoss.com/author/ambarish/
[2]:https://itsfoss.com/multiple-linux-one-usb/#comments
[3]:https://www.facebook.com/share.php?u=https%3A%2F%2Fitsfoss.com%2Fmultiple-linux-one-usb%2F%3Futm_source%3Dfacebook%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[4]:https://twitter.com/share?original_referer=/&text=How+to+Install+Multiple+Linux+Distributions+on+One+USB&url=https://itsfoss.com/multiple-linux-one-usb/%3Futm_source%3Dtwitter%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare&via=itsfoss2
[5]:https://plus.google.com/share?url=https%3A%2F%2Fitsfoss.com%2Fmultiple-linux-one-usb%2F%3Futm_source%3DgooglePlus%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[6]:https://www.linkedin.com/cws/share?url=https%3A%2F%2Fitsfoss.com%2Fmultiple-linux-one-usb%2F%3Futm_source%3DlinkedIn%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[7]:https://www.reddit.com/submit?url=https://itsfoss.com/multiple-linux-one-usb/&title=How+to+Install+Multiple+Linux+Distributions+on+One+USB
[8]:https://itsfoss.com/create-live-usb-of-ubuntu-in-windows/
[9]:http://multibootusb.org/
[10]:https://github.com/mbusb/multibootusb/releases/download/v8.8.0/python3-multibootusb_8.8.0-1_all.deb
