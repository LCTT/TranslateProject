openSUSE ARM Gets new Raspberry Pi Images
=========================================

Over the weekend, Bernhard Wiedemann has been working on new armv6 based images for the Raspberry Pi. It is built using a set of alternative build scripts aiming to make the building of the image easier. He’s put the scripts as well as an image online, you can get it from oSC or [here (image)][1] and [here (scripts)][2]. If you’re playing around with Raspberry Pi and want to create images for your device(s), this is for you!

###The Image and Building It

As Bernhard [explains on his blog][3], the image he created is only 82mb compressed, so it is pretty minimalistic. The image also contains the scripts he created for building under /home/abuild/rpmbuild/SOURCES/.

![img](https://news.opensuse.org/wp-content/uploads/2013/09/IMG_20130907_133512-300x225.jpg)
Sadly, the sticker doesn’t fit…

If you’re interested in playing with the building itself, creating custom images, the following commands will get you going:

	osc co devel:ARM:Factory:Contrib:RaspberryPi altimagebuild
	cd devel:ARM:Factory:Contrib:RaspberryPi/altimagebuild
	bash -x main.sh

He notes: _ If you have 6GB RAM, you can speed things up with export OSC_BUILD_ROOT=/dev/shm/arm before you do. _

This package doesn’t build in OBS or with just the osc command as it requires root permissions for some steps. That is why you have to run it by hand and let it do its magic. The under-250-lines of script will go through the following steps:

1.First, osc build is used to pull in required packages and setup the armv6 rootfs.
2.Second, mkrootfs.sh modifies a copy of the rootfs under .root to contain all required configs
3.And finally, mkimage.sh takes the .root dir and creates a .img from it that can be booted

Bernhard claims that: “this can build an image from scatch in three minutes. And my Raspberry Pi booted successfully with it within 55 seconds.”

###Todo and Open Issues

He also points out some remaining open issues:

- the repo key is initially untrusted
- still uses old 3.1 kernel
- build scripts have no error handling

Compared to the old image, this one has some advantages:

- It is easier to resize as the root partition is the last one
- Compressed image is much smaller
- Reproducible image build, so easy to customize
- It is armv6 with floating point support, so could be faster
- We have 5200 successfully built packages from [openSUSE:Factory:ARM][4]

If you wanted to play with building images for the Raspberry Pi, this might well be the easiest way doing so! And as always, merge requests are very much welcome.

via: https://news.opensuse.org/2013/09/09/opensuse-arm-gets-new-raspberry-pi-images/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linu.xnc/space/校对者ID

[1]:http://www.zq1.de/~bernhard/linux/opensuse/raspberrypi-opensuse-20130907.img.xz
[2]:https://build.opensuse.org/package/show/devel:ARM:Factory:Contrib:RaspberryPi/altimagebuild
[3]:https://lizards.opensuse.org/2013/09/07/new-raspberry-pi-image/
[4]:http://download.opensuse.org/ports/armv6hl/factory/repo/oss/

