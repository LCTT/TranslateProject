[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (PiShrink – Make Raspberry Pi Images Smaller)
[#]: via: (https://www.ostechnix.com/pishrink-make-raspberry-pi-images-smaller/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

PiShrink – Make Raspberry Pi Images Smaller
======

![Make Raspberry Pi Images Smaller With PiShrink In Linux][1]

**Raspberry Pi** requires no introduction. It is a small, affordable and credit-card sized computer that can be connected to a Monitor or TV. We can attach a standard keyboard and mouse and use it as a full-blown desktop computer to do everyday tasks, such Internet browsing, playing videos/games, word processing and spreadsheet making and a lot more. It has been mainly developed for teaching Computer science in schools. Nowadays, Raspberry Pi is widely being used in colleges, small-medium organizations and institutes to teach coding. If you own a Raspberry Pi device, you might want to check out a bash script named **“PiShrink”** , which is used to make Raspberry Pi Images smaller. PiShrink will automatically shrink a pi image that will then resize to the max size of the SD card on boot. This will make putting the image back onto the SD card faster and the shrunk images will compress better. This can be useful to fit the large size images in your SD card. In this brief guide, we are going to learn to shrink Raspberry images to smaller size in Unix-like systems.

### Installing PiShrink

To install PiShrink on your Linux box, first download the latest version using command:

```
$ wget https://raw.githubusercontent.com/Drewsif/PiShrink/master/pishrink.sh
```

Next, make the downloaded PiShrink binary as executable:

```
$ chmod +x pishrink.sh
```

Finally, move it your path:

```
$ sudo mv pishrink.sh /usr/local/bin/
```

### Make Raspberry Pi Images Smaller

As you may already know, **Raspbian** is the official operating system for all models of Raspberry Pi. The Raspberry foundation has developed **Raspberry Pi Desktop** version for PC and Mac. You can create a live cd, run it in virtual machine and even install it in your desktop as well. There are also few unofficial OS images available for Raspberry Pi. For the purpose of testing, I’ve downloaded the official Raspbian OS from the [**official download page**][2].

Unzip the downloaded OS image:

```
$ unzip 2019-04-08-raspbian-stretch-lite.zip
```

The above command will extract contents of **2019-04-08-raspbian-stretch-lite.zip** file in the current working directory.

Let check the actual size of the extracted file:

```
$ du -h 2019-04-08-raspbian-stretch-lite.img
1.7G 2019-04-08-raspbian-stretch-lite.img
```

As you can see, the size of the extracted Raspberry OS img file is **1.7G**.

Now, shrink this file’s size using PiShrink like below:

```
$ sudo pishrink.sh 2019-04-08-raspbian-stretch-lite.img
```

Sample output:

```
Creating new /etc/rc.local
rootfs: 39795/107072 files (0.1% non-contiguous), 239386/428032 blocks
resize2fs 1.45.0 (6-Mar-2019)
resize2fs 1.45.0 (6-Mar-2019)
Resizing the filesystem on /dev/loop1 to 280763 (4k) blocks.
Begin pass 3 (max = 14)
Scanning inode table XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
Begin pass 4 (max = 3728)
Updating inode references XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
The filesystem on /dev/loop1 is now 280763 (4k) blocks long.

Shrunk 2019-04-08-raspbian-stretch-lite.img from 1.7G to 1.2G
```

[![Make Raspberry Pi Images Smaller Using PiShrink][1]][3]

Make Raspberry Pi Images Smaller Using PiShrink

As you see in the above output, the size of the Rasberry Pi image has been reduced to **1.2G**.

You can also use **-s** flag to skip the autoexpanding part of the process.

```
$ sudo pishrink.sh -s 2019-04-08-raspbian-stretch-lite.img newpi.img
```

This will create a copy of source img file (i.e 2019-04-08-raspbian-stretch-lite.img) into a new img file (newpi.img) and work on it. For more details, check the official GitHub page given at the end.

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned!

And, that’s all for now.

**Resource:**

  * [**PiShrink GitHub Repository**][4]
  * [**Raspberry Pi website**][5]



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/pishrink-make-raspberry-pi-images-smaller/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/05/pishrink-720x340.png
[2]: https://www.raspberrypi.org/downloads/
[3]: http://www.ostechnix.com/wp-content/uploads/2019/05/pishrink-1.png
[4]: https://github.com/Drewsif/PiShrink
[5]: https://www.raspberrypi.org/
