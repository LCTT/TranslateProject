How To Install FreeBSD on Raspberry Pi 2 Model B
================================================================================
How do I install FreeBSD 10 or FreeBSD 11 (current) on Raspberry Pi 2 Model B? How do I flash the SD Card using Linux, OS X, FreeBSD or Unix-like operating system?

You can easily install FreeBSD 10 or FreeBSD 11 (current) on Raspberry Pi 2 Model B. You can build a nice and easy to use Unix server using FreeBSD operating system. FreeBSD-CURRENT has supported Raspberry Pi since November, 2012 and Raspberry Pi 2 since March, 2015. In this quick tutorial I'm going to explain how to install FreeBSD 11 current arm port on RPI2.

### 1. Download FreeBSD-current image for arm ###

You can [visit this page to grab pre built][1] images for Raspberry Pi 2. Use wget or curl command to download image:

    $ wget ftp://ftp.freebsd.org/pub/FreeBSD/snapshots/arm/armv6/ISO-IMAGES/11.0/FreeBSD-11.0-CURRENT-arm-armv6-RPI2-20151016-r289420.img.xz

OR

    $ curl -O ftp://ftp.freebsd.org/pub/FreeBSD/snapshots/arm/armv6/ISO-IMAGES/11.0/FreeBSD-11.0-CURRENT-arm-armv6-RPI2-20151016-r289420.img.xz

### 2. Decompress FreeBSD-current image ###

Type any one of the following command:

    $ unxz FreeBSD-11.0-CURRENT-arm-armv6-RPI2-20151016-r289420.img.xz

OR

    $ xz --decompress FreeBSD-11.0-CURRENT-arm-armv6-RPI2-20151016-r289420.img.xz

### 3. SD Card Setup ###

You can flash the SD card using OS X, Linux, FreeBSD, MS-Windows and Unix-like operating system.

### Flashing FreeBSD-current using Mac OS X ###

Type the following dd command:

    $ diskutil list
    $ diskutil unmountDisk /dev/diskN
    $ sudo dd if=FreeBSD-11.0-CURRENT-arm-armv6-RPI2-20151016-r289420.img of=/dev/disk2 bs=64k

Sample outputs:

    1024+0 records in
    1024+0 records out
    1073741824 bytes transferred in 661.669584 secs (1622776 bytes/sec)

#### Flashing FreeBSD-current using Linux/FreeBSD or Unix-like system ####

The syntax is:

    $ dd if=FreeBSD-11.0-CURRENT-arm-armv6-RPI2-20151016-r289420.img of=/dev/sdb bs=1M

Make sure you replace /dev/sdb with actual SD card device name.

### 4. Boot FreeBSD ###

Insert in the SD card in your Raspberry Pi 2 Model B. You need to connect keyboard, mouse and display monitor. I'm using USB to serial cable to get output on screen:

![Fig.01 RPi USB based serial connection](http://s0.cyberciti.org/uploads/faq/2015/10/Raspberry-Pi-2-Model-B.pin-out.jpg)

Fig.01 RPi USB based serial connection

In this following example, I'm connecting to my RPi using screen command:

    ## Linux version ##
    screen /dev/tty.USB0 115200
     
    ## OS X version ##
    screen /dev/cu.usbserial 115200
     
    ## Windows user use Putty.exe ##
 
Sample FreeBSD RPI boot session:

![Gif 01: Booting FreeBSD-current on RPi 2](http://s0.cyberciti.org/uploads/faq/2015/10/freebsd-current-rpi.gif)

Gif 01: Booting FreeBSD-current on RPi 2

### 5. FreeBSD username and password for RPi 2 ###

The default passwords for the images are freebsd/freebsd and root/root.

And, there you have it, FreeBSD-current installed and running on RPi 2.

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/how-to-install-freebsd-on-raspberry-pi-2-model-b/

作者：[Vivek Gite][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.cyberciti.biz/tips/about-us
[1]:ftp://ftp.freebsd.org/pub/FreeBSD/snapshots/arm/armv6/ISO-IMAGES/11.0