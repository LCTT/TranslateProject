[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Running the ‘Real Debian’ on Raspberry Pi 3+ [For DIY Enthusiasts])
[#]: via: (https://itsfoss.com/debian-raspberry-pi)
[#]: author: (Shirish https://itsfoss.com/author/shirish/)

Running the ‘Real Debian’ on Raspberry Pi 3+ [For DIY Enthusiasts]
======

If you have ever used a Raspberry Pi device, you probably already know that it recommends a Linux distribution called [Raspbian][1].

Raspbian is a heavily customized form of Debian to run on low-powered ARM processors. It’s not bad. In fact, it’s an excellent OS for Raspberry Pi devices but it’s not the real Debian.

[Debian purists like me][2] would prefer to run the actual Debian over the Raspberry Pi’s customized Debian version. I trust Debian more than any other distribution to provide me a vast amount of properly vetted free software packages. Moreover, a project like this would help other ARM devices as well.

Above all, running the official Debian on Raspberry Pi is sort of challenge and I like such challenges.

![Real Debian on Raspberry Pi][3]

I am not the only one who thinks like this. There are many other Debian users who share the same feeling and this is why there exists an ongoing project to create a [Debian image for Raspberry Pi][4].

About two and a half months back, a Debian Developer (DD) named [Gunnar Wolf][5] took over that unofficial Raspberry Pi image generation project.

I’ll be quickly showing you how can you install this Raspberry Pi Debian Buster preview image on your Raspberry Pi 3 (or higher) devices.

### Getting Debian on Raspberry Pi [For Experts]

```
Warning

Be aware this Debian image is very raw and unsupported at the moment. Though it’s very new, I believe experienced Raspberry Pi and Debian users should be able to use it.
```

Now as far as [Debian][6] is concerned, here is the Debian image and instructions that you could use to put the Debian stock image on your Raspberry pi 3 Model B+.

#### Step 1: Download the Debian Raspberry Pi Buster image

You can download the preview images using wget command:

```
wget https://people.debian.org/~gwolf/raspberrypi3/20190206/20190206-raspberry-pi-3-buster-PREVIEW.img.xz
```

#### Step 2: Verify checksum (optional)

It’s optional but you should [verify the checksum][7]. You can do that by downloading the SHA256 hashfile and then comparing it with that of the downloaded Raspberry Pi Debian image.

At my end I had moved both the .sha256 file as img.xz to a directory to make it easier to check although it’s not necessary.

```
wget https://people.debian.org/~gwolf/raspberrypi3/20190206/20190206-raspberry-pi-3-buster-PREVIEW.img.xz.sha256

sha256sum -c 20190206-raspberry-pi-3-buster-PREVIEW.img.xz.sha256
```

#### Step 3: Write the image to your SD card

Once you have verified the image, take a look at it. It is around 400MB in the compressed xzip format. You can extract it to get an image of around 1.5GB in size.

Insert your SD card. **Before you carry on to the next command please change the sdX to a suitable name that corresponds to your SD card.**

The command basically extracts the img.xz archive to the SD card. The progress switch/flag enables you to see a progress line with a number as to know how much the archive has extracted.

```
xzcat 20190206-raspberry-pi-3-buster-PREVIEW.img.xz | dd of=/dev/sdX bs=64k oflag=dsync status=progress$ xzcat 20190206-raspberry-pi-3-buster-PREVIEW.img.xz | dd of=/dev/sdX bs=64k oflag=dsync status=progress
```

Once you have successfully flashed your SD card, you should be able test if the installation went ok by sshing into your Raspberry Pi. The default root password is raspberry.

```
ssh root@rpi3
```

If you are curious to know how the Raspberry Pi image was built, you can look at the [build scripts][8].

You can find more info on the project homepage.

[DEBIAN RASPBERRY PI IMAGE][15]

### How to contribute to the Raspberry Pi Buster effort

There is a mailing list called [debian-arm][9] where people could contribute their efforts and ask questions. As you can see in the list, there is already a new firmware which was released [few days back][10] which might make booting directly a reality instead of the workaround shared above.

If you want you could make a new image using the raspi3-image-spec shared above or wait for Gunnar to make a new image which might take time.

Most of the maintainers also hang out at #vmdb2 at #OFTC. You can either use your IRC client or [Riot client][11], register your name at Nickserv and connect with either Gunnar Wolf, Roman Perier or/and Lars Wirzenius, author of [vmdb2][12]. I might do a follow-up on vmdb2 as it’s a nice little tool by itself.

### The Road Ahead

If there are enough interest and contributors, for instance, the lowest-hanging fruit would be to make sure that the ARM64 port [wiki page][13] is as current as possible. The benefits are and can be enormous.

There are a huge number of projects which could benefit from either having a [Pi farm][14] to making your media server or a SiP phone or whatever you want to play/work with.

Another low-hanging fruit might be synchronization between devices, say an ARM cluster sharing reports to either a Debian desktop by way of notification or on mobile or both ways.

While I have shared about Raspberry Pi, there are loads of single-board computers on the market already and lot more coming, both from MIPS as well as OpenRISC-V so there is going to plenty of competition in the days ahead.

Also, OpenRISC-V is and would be open-sourcing lot of its IP so non-free firmware or binary blobs would not be needed. Even MIPS is rumored to be more open which may challenge ARM if MIPS and OpenRISC-V are able to get their logistics and pricing right, but that is a story for another day.

There are many more vendors, I am just sharing the ones whom I am most interested to see what they come up with.

I hope the above sheds some light why it makes sense to have Debian on the Raspberry Pi.

--------------------------------------------------------------------------------

via: https://itsfoss.com/debian-raspberry-pi

作者：[Shirish][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/shirish/
[b]: https://github.com/lujun9972
[1]: https://www.raspberrypi.org/downloads/raspbian/
[2]: https://itsfoss.com/reasons-why-i-love-debian/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/03/debian-raspberry-pi.png?resize=800%2C450&ssl=1
[4]: https://wiki.debian.org/RaspberryPi3
[5]: https://gwolf.org/node/4139
[6]: https://www.debian.org/
[7]: https://itsfoss.com/checksum-tools-guide-linux/
[8]: https://github.com/Debian/raspi3-image-spec
[9]: https://lists.debian.org/debian-arm/2019/02/threads.html
[10]: https://alioth-lists.debian.net/pipermail/pkg-raspi-maintainers/Week-of-Mon-20190225/000310.html
[11]: https://itsfoss.com/riot-desktop/
[12]: https://liw.fi/vmdb2/
[13]: https://wiki.debian.org/Arm64Port
[14]: https://raspi.farm/
[15]: https://wiki.debian.org/RaspberryPi3
