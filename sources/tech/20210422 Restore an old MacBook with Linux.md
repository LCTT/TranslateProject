[#]: subject: (Restore an old MacBook with Linux)
[#]: via: (https://opensource.com/article/21/4/restore-macbook-linux)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Restore an old MacBook with Linux
======
Don't throw your old, slow MacBook into the recycling bin; extend its
life with Linux Mint.
![Writing Hand][1]

Last year, I wrote about how you can give [new life to an old MacBook][2] with Linux, specifically Elementary OS in that instance. Recently, I returned to that circa 2015 MacBook Air and discovered I had lost my login password. I downloaded the latest Elementary OS 5.1.7 Hera release and could not get the live boot to recognize my Broadcom 4360 wireless chipset.

Lately, I have been using [Linux Mint][3] to refurbish older laptops, and I thought I would give it a try on this MacBook Air. I downloaded the Linux Mint 20.1 ISO and created a USB boot drive using the [Popsicle][4] software on my Linux desktop computer.

![Popsicle ISO burner][5]

(Don Watkins, [CC BY-SA 4.0][6])

Next, I connected the Thunderbolt Ethernet adapter to the MacBook and inserted the USB boot drive. I powered on the system and pressed the Option key on the MacBook to instruct it to start it from a USB drive.

Linux Mint started up nicely in live-boot mode, but the operating system didn't recognize a wireless connection.

### Where's my wireless?

This is because Broadcom, the company that makes WiFi cards for Apple devices, doesn't release open source drivers. This is in contrast to Intel, Atheros, and many other chip manufacturers—but it's the chipset used by Apple, so it's a common problem on MacBooks.

I had a hard-wired Ethernet connection to the internet through my Thunderbolt adapter, so I _was_ online. From prior research, I knew that to get the wireless adapter working on this MacBook, I would need to issue three separate commands in the Bash terminal. However, during the installation process, I learned that Linux Mint has a nice built-in Driver Manager that provides an easy graphical user interface to assist with installing the software.

![Linux Mint Driver Manager][7]

(Don Watkins, [CC BY-SA 4.0][6])

Once that operation completed, I rebooted and brought up my newly refurbished MacBook Air with Linux Mint 20.1 installed. The Broadcom wireless adapter was working properly, allowing me to connect to my wireless network easily.

### Installing wireless the manual way

You can accomplish the same task from a terminal. First, purge any vestige of the Broadcom kernel source:


```
`$ sudo apt-get purge bcmwl-kernel-source`
```

Then add a firmware installer:


```
`$ sudo apt install firmware-b43-installer`
```

Finally, install the new firmware for the system:


```
`$ sudo apt install linux-firmware`
```

### Using Linux as your Mac

I installed [Phoronix Test Suite][8] to get a good snapshot of the MacBook Air.

![MacBook Phoronix Test Suite output][9]

(Don Watkins, [CC BY-SA 4.0][6])

The system works very well. A recent update to kernel 5.4.0-64-generic revealed that the wireless connection survived, and I have an 866Mbps connection to my home network. The Broadcom FaceTime camera does not work, but everything else works fine.

I really like the [Linux Mint Cinnamon 20.1][10] desktop on this MacBook.

![Linux Mint Cinnamon][11]

(Don Watkins, [CC BY-SA 4.0][6])

I recommend giving Linux Mint a try if you have an older MacBook that has been rendered slow and inoperable due to macOS updates. I am very impressed with the distribution, and especially how it works on my MacBook Air. It has definitely extended the life expectancy of this powerful little laptop.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/restore-macbook-linux

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/write-hand_0.jpg?itok=Uw5RJD03 (Writing Hand)
[2]: https://opensource.com/article/20/2/macbook-linux-elementary
[3]: https://linuxmint.com/
[4]: https://github.com/pop-os/popsicle
[5]: https://opensource.com/sites/default/files/uploads/popsicle.png (Popsicle ISO burner)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/sites/default/files/uploads/mint_drivermanager.png (Linux Mint Driver Manager)
[8]: https://www.phoronix-test-suite.com/
[9]: https://opensource.com/sites/default/files/uploads/macbook_specs.png (MacBook Phoronix Test Suite output)
[10]: https://www.linuxmint.com/edition.php?id=284
[11]: https://opensource.com/sites/default/files/uploads/mintcinnamon.png (Linux Mint Cinnamon)
