New OpenSUSE Raspberry Pi Image
===============================

Hello guys! I want some attention, all openSUSE fans should read this very important article. Do you have a Raspberry Pi? Do you like to test openSUSE? Are you crazy about Raspberry Pi and openSUSE? Do you want to see them together? That’s great because the ARM edition of the openSUSE Linux operating system has new ARMv6-based images for the Raspberry Pi platform. This new image of openSUSE comes with kernel-3.6, minimal X11/icewm and is only 82MB compressed.

Don’t thank me for this, thank Bernhard Wiedeman. The cool thing about this image of openSUSE is that he created it using an alternative image building automatism from scratch. And, do you know the funny part of it? Bernhard Wiedeman created in three hours in the morning. Great and very skilled guy!

If you are interested in the automation script written by Bernhard for the purpose of creating the new armv6 based image for the Raspberry Pi, you can find it [here][1]. This script gives everyone the chance to now easily build his own images and share them with the rest of openSUSE geeks all over the world. Bernhard Wiedeman writes for us in his blog that this script an build an image from scatch in three minutes. Yes three minutes, and everything works in the perfect possible way. Bernhard Wideman’s Raspberry Pi booted successfully with it within 55 seconds. What about your Pi? How much time did it take to boot? Can you share with us in the comment section? We will be very happy to hear from other user experiences.

Of course, nothing is perfect so there are remaining open issues with this automatism process. These remaining issues are listed below.

- the repo key is initially untrusted
- build scripts have no error handling

What are some advantages of this new iso image compared  the old image?

- It is easier to resize because the root partition is the last one
- Compressed image is much smaller
- Reproducible image build, so easy to customize
- It is armv6 with floating point support, so could be faster
- We have over 5200 successfully built packages from openSUSE:Factory:ARM
- so for example you can install a minimalistic graphical environment with zypper install xauth twm xorg-x11-server xinit and start it with startx

Ok guys, not it is time for some PiSUSE fun, i mean go and try openSUSE on your Raspberry Pi and don’t drink much beer. Happy openSUSE party guys!

Source: [openSUSE Lizards][2]

via: http://www.unixmen.com/new-opensuse-raspberry-pi-image/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://www.linux.cn/
[译者ID]:http://www.linux.cn/space/译者ID
[校对者ID]:http://www.linux.cn/space/校对者ID

[1]:https://build.opensuse.org/package/show/devel:ARM:Factory:Contrib:RaspberryPi/altimagebuild
[2]:https://lizards.opensuse.org/2013/09/07/new-raspberry-pi-image/

