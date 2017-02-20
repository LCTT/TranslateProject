Try Raspberry Pi's PIXEL OS on your PC
============================================================


 ![Try Raspberry Pi's PIXEL OS on your PC](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/virtualbox_pixel_raspberrypi.jpg?itok=bEdS8qpi "Try Raspberry Pi's PIXEL OS on your PC") 
Image credits : 

Raspberry Pi Foundation, CC BY-SA

Over the last four years, the Raspberry Pi Foundation has put a great deal of effort into optimizing Raspbian, its port of Debian, for Pi hardware, including creating new educational software, programming tools, and a nicer looking desktop.

In September, we released an update that introduced PIXEL (Pi Improved Xwindows Environment, Lightweight), the Pi's new desktop environment. Just before Christmas, we released a version of the OS that runs on x86 PCs, so now you can install it on your PC, Mac, or laptop.

 ![Installing PIXEL](https://opensource.com/sites/default/files/pixel_0.jpg "Installing PIXEL") 

Of course, like many well-supported Linux distros, the OS runs really well on old hardware. Raspbian is a great way to breathe new life into that old Windows machine that you gave up on years ago.

The [PIXEL ISO][13] is available for download from the Raspberry Pi website, and a bootable live DVD was given away on the front of "[The MagPi][14]" magazine.

 ![Welcome to PIXEL](https://opensource.com/sites/default/files/welcome-to-pixel.jpg "Welcome to PIXEL") 

We released Raspberry Pi's OS for PCs to remove the barrier to entry for people looking to learn computing.This release is even cheaper than buying a Raspberry Pi because it is free and you can use it on your existing computer. PIXEL is the Linux desktop we've always wanted, and we want it to be available to everyone.

### Powered by Debian

Raspbian, or the x86 PIXEL distro, wouldn't be possible without its construction on top of Debian. Debian has a huge bank of amazing free and open source software, programs, games, and other tools from an apt repository. On the Raspberry Pi, you're limited to packages that are compiled to run on [ARM][15] chips. However, on the PC image, you have a much wider scope for which packages will run on your machine, because Intel chips found in PCs have much greater support.

 ![Debian Advanced Packaging Tool (APT) repository](https://opensource.com/sites/default/files/apt.png "Debian Advanced Packaging Tool (APT) repository") 

### What PIXEL contains

Both Raspbian with PIXEL and Debian with PIXEL come bundled with a whole host of software. Raspbian comes with:

*   Programming environments for Python, Java, Scratch, Sonic Pi, Mathematica*, Node-RED, and the Sense HAT emulator
*   The LibreOffice office suite
*   Chromium (including Flash) and Epiphany web browsers
*   Minecraft: Pi edition (including a Python API)*
*   Various tools and utilities

*The only programs from this list not included in the x86 version are Mathematica and Minecraft, due to licensing limitations.

 ![PIXEL menu](https://opensource.com/sites/default/files/pixel-menu.png "PIXEL menu") 

### Create a PIXEL live disk

You can download the PIXEL ISO and write it to a blank DVD or a USB stick. Then you can boot your PC from the disk, and you'll see the PIXEL desktop in no time. You can browse the web, open a programming environment, or use the office suite, all without installing anything on your computer. When you're done, just take out the DVD or USB drive, shut down your computer, and when you power up your computer again, it'll boot back up into your usual OS as before.

### Run PIXEL in a virtual machine

One way of trying out PIXEL is to install it in a virtual machine using a tool like VirtualBox.

 ![PIXEL Virtualbox](https://opensource.com/sites/default/files/pixel-virtualbox.png "PIXEL Virtualbox") 

This allows you to try out the image without installing it, or you can just run it in a window alongside your main OS, and get access to the software and tools in PIXEL. It also means your session will persist, rather than starting from scratch every time you reboot, as you would with a live disk.

### Install PIXEL on your PC

If you're really ready to commit, you can wipe your old operating system and install PIXEL on your hard drive. This might be a good idea if you're wanting to make use of an old unused laptop.

### PIXEL in education

Many schools use Windows on all their PCs, and have strict controls over what software can be installed on them. This makes it difficult for teachers to use the software tools and IDE (integrated development environment) necessary to teach programming skills. Even online-based programming initiatives like Scratch 2 can be blocked by overcautious network filters. In some cases, installing something like Python is simply not possible. The Raspberry Pi hardware addresses this by providing a small, cheap computer that boots from an SD card packed with educational software, which students can connect up to the monitor, mouse, and keyboard of an existing PC.

However, a PIXEL live disc allows teachers to boot into a system loaded with ready-to-use programming languages and tools, all of which do not require installation permissions. At the end of the lesson, they can shut down safely, bringing the computers back to their original state. This is also a handy solution for Code Clubs, CoderDojos, youth clubs, Raspberry Jams, and more.

### Remote GPIO

One of the features that sets the Raspberry Pi apart from traditional desktop PCs is the presence of GPIO pins (General Purpose Input/Output) pins, which allow you to connect electronic components and add-on boards to devices in the real world, opening up new worlds, such as hobby projects, home automation, connected devices, and the Internet of Things.

One wonderful feature of the [GPIO Zero][16] Python library is the ability to control the GPIO pins of a Raspberry Pi over the network with some simple code written on your PC.

<twitterwidget class="twitter-tweet twitter-tweet-rendered" id="twitter-widget-0" data-tweet-id="811511740907261952" style="position: static; visibility: visible; display: block; transform: rotate(0deg); max-width: 100%; width: 500px; min-width: 220px; margin-top: 10px; margin-bottom: 10px;">

<article class="MediaCard
           MediaCard--mediaForward

           customisable-border" data-scribe="component:card" dir="ltr">[][11][
 ![View image on Twitter](https://pbs.twimg.com/media/C0MRi_lWgAAvUOp.jpg:small "View image on Twitter") 
][8][
 ![View image on Twitter](https://pbs.twimg.com/media/C0MRkoCWgAAbxxi.jpg:small "View image on Twitter") 
][9][
 ![View image on Twitter](https://pbs.twimg.com/media/C0MRmmsXEAAPpNU.jpg:small "View image on Twitter") 
][10]</article>

> [ Follow][1][
>  ![](https://pbs.twimg.com/profile_images/528155792013160448/cobxlRc8_normal.jpeg) 
> Ben Nuttall @ben_nuttall][5]
> 
> PC running x86 PIXEL controlling Pi's GPIO over the network using gpiozero
> 
> [<time class="dt-updated" datetime="2016-12-21T10:00:50+0000" pubdate="" title="Time posted: 21 Dec 2016, 10:00:50 (UTC)">6:00 PM - 21 Dec 2016</time>][6] · [East, England][7]
> 
> *   [][2]
> 
> *   [ 3636 Retweets][3]
> 
> *   [ 109109 likes][4]

</twitterwidget>

Remote GPIO is possible from one Raspberry Pi to another or from any PC running any OS, but, of course, with PIXEL x86 you have everything you need pre-installed and it works out of the box. See Josh's [blog post][17] and refer to my [gist][18] for more information.

### Further guidance

[Issue #53 of The MagPi][19] features some great guides for trying out and installing PIXEL, including using the live disc with a persistence drive to maintain your files and applications. You can buy a copy, or download the PDF for free. Check it out to read more.

--------------------------------------------------------------------------------

译者简介：

Ben Nuttall - Ben Nuttall is the Raspberry Pi Community Manager. In addition to his work for the Raspberry Pi Foundation, he's into free software, maths, kayaking, GitHub, Adventure Time, and Futurama. Follow Ben on Twitter @ben_nuttall.

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/try-raspberry-pis-pixel-os-your-pc

作者：[Ben Nuttall][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/bennuttall
[1]:https://twitter.com/ben_nuttall
[2]:https://twitter.com/intent/tweet?in_reply_to=811511740907261952
[3]:https://twitter.com/intent/retweet?tweet_id=811511740907261952
[4]:https://twitter.com/intent/like?tweet_id=811511740907261952
[5]:https://twitter.com/ben_nuttall
[6]:https://twitter.com/ben_nuttall/status/811511740907261952
[7]:https://twitter.com/search?q=place%3A3bc1b6cfd27ef7f6
[8]:https://twitter.com/ben_nuttall/status/811511740907261952/photo/1
[9]:https://twitter.com/ben_nuttall/status/811511740907261952/photo/1
[10]:https://twitter.com/ben_nuttall/status/811511740907261952/photo/1
[11]:https://twitter.com/ben_nuttall/status/811511740907261952/photo/1
[12]:https://opensource.com/article/17/1/try-raspberry-pis-pixel-os-your-pc?rate=iqVrGV3EhwRuqh68sf6Zye6Y7VSpXRCUQoZV3sg-QJM
[13]:http://downloads.raspberrypi.org/pixel_x86/images/pixel_x86-2016-12-13/
[14]:https://www.raspberrypi.org/magpi/issues/53/
[15]:https://en.wikipedia.org/wiki/ARM_Holdings
[16]:http://gpiozero.readthedocs.io/
[17]:http://www.allaboutcode.co.uk/single-post/2016/12/21/GPIOZero-Remote-GPIO-with-PIXEL-x86
[18]:https://gist.github.com/bennuttall/572789b0aa5fc2e7c05c7ada1bdc813e
[19]:https://www.raspberrypi.org/magpi/issues/53/
[20]:https://opensource.com/user/26767/feed
[21]:https://opensource.com/article/17/1/try-raspberry-pis-pixel-os-your-pc#comments
[22]:https://opensource.com/users/bennuttall
