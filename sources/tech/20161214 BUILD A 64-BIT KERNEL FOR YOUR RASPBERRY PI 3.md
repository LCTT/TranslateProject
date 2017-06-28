BUILD A 64-BIT KERNEL FOR YOUR RASPBERRY PI 3
============================================================


> EDIT : After writing this blog post I’ve started a 64-bit OS for the Raspberry Pi 3, based on Debian. You can [find it here][3].

The **Raspberry Pi 3** ships with a Broadcom BCM2837 64bit ARMv8 quad core Cortex A53 processor, which is a **64-bit CPU**. If you own one of these, running the following command might surprise you :

> > uname -a
> Linux raspberrypi 4.4.34-v7+ #930 SMP Wed Nov 23 15:20:41 GMT 2016 armv7l GNU/Linux

Yes, this is a **32-bit kernel**. The reason for this is that the Raspberry Pi foundation doesn’t yet provides a 64-bit version of Raspbian, the official OS for Raspberry Pi. It is however possible to build one, thanks to the various patches sent by [Electron752][9].

# Build the Kernel

The Raspberry Pi foundation maintains [their own fork ][10]of the Linux Kernel which is especially tailored for their devices, while upstream gets merged regularly.

We’re going to adapt instructions from [that page][11] to **build a 64-bit Kernel**.

We cannot use the “Local building” method as it’d require a 64-bit Raspberry Pi, which we obviously don’t have yet. So we have to **cross-compile** it, **Ubuntu**is the recommended OS for this. I personally don’t have Ubuntu so I’ll make my build on a 2 CPUs Ubuntu 16.04 Digital Ocean droplet, which should cost me $0.03\. If you also want to proceed like this, you can get $10 free credits through [this link][12]. Alternatively, you could use a Ubuntu VM through Virtualbox for instance.

First, we’d need a few **build tools** and the **aarch64 cross-compiler** :

> > apt-get update
> > apt-get install -y bc build-essential gcc-aarch64-linux-gnu git unzip

Then we can download the **Linux Kernel sources** :

> > git clone –depth=1 -b rpi-4.8.y https://github.com/raspberrypi/linux.git

Enter now inside the created git directory. Optionally, you can add an extra version tag for your kernel. This is done by editing the beginning of the Makefile :

> VERSION = 4
> PATCHLEVEL = 8
> SUBLEVEL = 13
> EXTRAVERSION = +bilal

In order to **build it**, run the following commands :

> > make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- bcmrpi3_defconfig
> > make -j 3 ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-

The first one should be pretty fast. For the second one it’s a whole different story, I haven’t timed it exactly but it was around 30 minutes for me. Make sure to adapt the -j flag depending on your number of CPUs (nproc * 1.5).

# Choose a Linux distribution

While the Kernel is being built, we can start preparing a Linux distribution for it. I’ll be using **Raspbian** for simplicity in this tutorial, even though this is a 32-bit only distribution.

 _If you want to go 64-bit all the way you should pick up a distribution available in aarch64, Debian has a robust [ARM64Port][4]. To grab it there are basically 3 options :_ 
 _– download a pre-built root filesystem, this would most likely give you an outdated one as mentioned in that page_ 
 _– build your own with debootstrap if you’re familiar with it (otherwise it can be tricky as it requires some manual tweaks, the original purpose of it is to chroot from an already running host, not build a root filesystem for another machine)._ 
 _– the one I’d recommend, using multistrap, there seems to be a nice tutorial on this page : http://free-electrons.com/blog/embdebian-with-multistrap/_ 

Back to Raspbian, we can now download the official OS and start preparing it.

Open a new shell session and run the following commands :

> > wget -O raspbian.zip https://downloads.raspberrypi.org/raspbian_lite_latest
> > unzip raspbian.zip

We can inspect it with the following command :

> > fdisk -l 2016-11-25-raspbian-jessie-lite.img
> Disk 2016-11-25-raspbian-jessie-lite.img: 1.3 GiB, 1390411776 bytes, 2715648 sectors
> Units: sectors of 1 * 512 = 512 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> Disklabel type: dos
> Disk identifier: 0x244b8248
> 
> Device Boot Start End Sectors Size Id Type
> 2016-11-25-raspbian-jessie-lite.img1 8192 137215 129024 63M c W95 FAT32 (LBA)
> 2016-11-25-raspbian-jessie-lite.img2 137216 2715647 2578432 1.2G 83 Linux

We can see it has **two partitions**. The first one is the **boot partition**, it mainly contains the bootloader, the Linux Kernel and a few config files. The second one is the** root partition**.

We can **mount those partitions** on our filesystem, starting with the **root partition** :

> > mount -o loop,offset=70254592 2016-11-25-raspbian-jessie-lite.img /mnt

The offset depends on the sector size, which is 512 : 70254592 = 512 * 137216

Then the **boot partition** :

> > mount -o loop,offset=4194304,sizelimit=66060288 2016-11-25-raspbian-jessie-lite.img /mnt/boot

 _(offset : 4194304 = 512 * 8192, sizelimit: _  _66060288 = 512 * 129024)_ 

The Raspbian OS can now be seen under /mnt. We’re almost there.

# Wrapping it up

Once the Kernel build is finished, the last steps involve **copying the Linux Kernel** and the **device tree** to the boot partition :

> > cp arch/arm64/boot/Image /mnt/boot/kernel8.img
> > cp arch/arm64/boot/dts/broadcom/bcm2710-rpi-3-b.dtb /mnt/boot/

Tweaking **config.txt** :

> > echo “kernel=kernel8.img” >> /mnt/boot/config.txt

Installing **Kernel modules** :

> > make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu INSTALL_MOD_PATH=/mnt modules_install
> > umount /mnt/boot
> > umount /mnt

And… that’s it, a freshly baked **ARM64 Linux Kernel** for our Raspberry Pi 3!

You can now compress the image, download it through scp for instance and follow the standard instructions to put it on your SD card.

Eventually you’ll get :

> > uname -a
> Linux raspberrypi 4.8.13+bilal-v8+ #1 SMP Wed Dec 14 14:09:38 UTC 2016 aarch64 GNU/Linux

[Twitter][5][LinkedIn][6][Google+][7][Share][8]

--------------------------------------------------------------------------------

via: https://devsidestory.com/build-a-64-bit-kernel-for-your-raspberry-pi-3/

作者：[Bilal Amarni][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://devsidestory.com/about-me
[1]:https://devsidestory.com/author/bamarni/
[2]:https://devsidestory.com/build-a-64-bit-kernel-for-your-raspberry-pi-3/
[3]:https://github.com/bamarni/pi64
[4]:https://wiki.debian.org/Arm64Port
[5]:https://devsidestory.com/#twitter
[6]:https://devsidestory.com/#linkedin
[7]:https://devsidestory.com/#google_plus
[8]:https://www.addtoany.com/share#url=https%3A%2F%2Fdevsidestory.com%2Fbuild-a-64-bit-kernel-for-your-raspberry-pi-3%2F&title=Build%20a%2064-bit%20Kernel%20for%20your%20Raspberry%20Pi%203
[9]:https://github.com/Electron752
[10]:https://github.com/raspberrypi/linux
[11]:https://www.raspberrypi.org/documentation/linux/kernel/building.md
[12]:https://m.do.co/c/8ef9c5832a9c
