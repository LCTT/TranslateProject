[#]: collector: (lujun9972)
[#]: translator: (amwps290)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install Linux on Intel NUC)
[#]: via: (https://itsfoss.com/install-linux-on-intel-nuc/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Install Linux on Intel NUC
======

The previous week, I got myself an [Intel NUC][1]. Though it is a tiny device, it is equivalent to a full-fledged desktop CPU. Most of the [Linux-based mini PCs][2] are actually built on top of the Intel NUC devices.

I got the ‘barebone’ NUC with 8th generation Core i3 processor. Barebone means that the device has no RAM, no hard disk and obviously, no operating system. I added an [8GB RAM from Crucial][3] (around $33) and a [240 GB Western Digital SSD][4] (around $45).

Altogether, I had a desktop PC ready in under $400. I already have a screen and keyboard-mouse pair so I am not counting them in the expense.

![A brand new Intel NUC NUC8i3BEH at my desk with Raspberry Pi 4 lurking behind][5]

The main reason why I got Intel NUC is that I want to test and review various Linux distributions on real hardware. I have a [Raspberry Pi 4][6] which works as an entry-level desktop but it’s an [ARM][7] device and thus there are only a handful of Linux distributions available for Raspberry Pi.

_The Amazon links in the article are affiliate links. Please read our [affiliate policy][8]._

### Installing Linux on Intel NUC

I started with Ubuntu 18.04 LTS version because that’s what I had available at the moment. You can follow this tutorial for other distributions as well. The steps should remain the same at least till the partition step which is the most important one in the entire procedure.

#### Step 1: Create a live Linux USB

Download Ubuntu 18.04 from its website. Use another computer to [create a live Ubuntu USB][9]. You can use a tool like [Rufus][10] or [Etcher][11]. On Ubuntu, you can use the default Startup Disk Creator tool.

#### Step 2: Make sure the boot order is correct

Insert your USB and power on the NUC. As soon as you see the Intel NUC written on the screen, press F2 to go to BIOS settings.

![BIOS Settings in Intel NUC][12]

In here, just make sure that boot order is set to boot from USB first. If not, change the boot order.

If you had to make any changes, press F10 to save and exit. Else, use Esc to exit the BIOS.

#### Step 3: Making the correct partition to install Linux

Now when it boots again, you’ll see the familiar Grub screen that allows you to try Ubuntu live or install it. Choose to install it.

[][13]

Suggested read  3 Ways to Check Linux Kernel Version in Command Line

First few installation steps are simple. You choose the keyboard layout, and the network connection (if any) and other simple steps.

![Choose the keyboard layout while installing Ubuntu Linux][14]

You may go with the normal installation that has a handful of useful applications installed by default.

![][15]

The interesting screen comes next. You have two options:

  * **Erase disk and install Ubuntu**: Simplest option that will install Ubuntu on the entire disk. If you want to use only one operating system on the Intel NUC, choose this option and Ubuntu will take care of the rest.
  * **Something Else**: This is the advanced option if you want to take control of things. In my case, I want to install multiple Linux distribution on the same SSD. So I am opting for this advanced option.



![][16]

_**If you opt for “Erase disk and install Ubuntu”, click continue and go to the step 4.**_

If you are going with the advanced option, follow the rest of the step 3.

Select the SSD disk and click on New Partition Table.

![][17]

It will show you a warning. Just hit Continue.

![][18]

Now you’ll see a free space of the size of your SSD disk. My idea is to create an EFI System Partition for the EFI boot loader, a root partition and a home partition. I am not creating a [swap partition][19]. Ubuntu creates a swap file on its own and if the need be, I can extend the swap by creating additional swap files.

I’ll leave almost 200 GB of free space on the disk so that I could install other Linux distributions here. You can utilize all of it for your home partitions. Keeping separate root and home partitions help you when you want to save reinstall the system

Select the free space and click on the plus sign to add a partition.

![][20]

Usually 100 MB is sufficient for the EFI but some distributions may need more space so I am going with 500 MB of EFI partition.

![][21]

Next, I am using 20 GB of root space. If you are going to use only one distributions, you can increase it to 40 GB easily.

Root is where the system files are kept. Your program cache and installed applications keep some files under the root directory. I recommend [reading about the Linux filesystem hierarchy][22] to get more knowledge on this topic.

[][23]

Suggested read  Share Folders On Local Network Between Ubuntu And Windows

Provide the size, choose Ext4 file system and use / as the mount point.

![][24]

The next is to create a home partition. Again, if you want to use only one Linux distribution, go for the remaining free space. Else, choose a suitable disk space for the Home partition.

Home is where your personal documents, pictures, music, download and other files are stored.

![][25]

Now that you have created EFI, root and home partitions, you are ready to install Ubuntu Linux. Hit the Install Now button.

![][26]

It will give you a warning about the new changes being written to the disk. Hit continue.

![][27]

#### Step 4: Installing Ubuntu Linux

Things are pretty straightforward from here onward. Choose your time zone right now or change it later.

![][28]

On the next screen, choose a username, hostname and the password.

![][29]

It’s a wait an watch game for next 7-8 minutes.

![][30]

Once the installation is over, you’ll be prompted for a restart.

![][31]

When you restart, you should remove the live USB otherwise you’ll boot into the installation media again.

That’s all you need to do to install Linux on an Intel NUC device. Quite frankly, you can use the same procedure on any other system.

**Intel NUC and Linux: how do you use it?**

I am loving the Intel NUC. It doesn’t take space on the desk and yet it is powerful enough to replace the regular bulky desktop CPU. You can easily upgrade it to 32GB of RAM. You can install two SSD on it. Altogether, it provides some scope of configuration and upgrade.

If you are looking to buy a desktop computer, I highly recommend [Intel NUC][1] mini PC. If you are not comfortable installing the OS on your own, you can [buy one of the Linux-based mini PCs][2].

Do you own an Intel NUC? How’s your experience with it? Do you have any tips to share it with us? Do leave a comment below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-linux-on-intel-nuc/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.amazon.com/Intel-NUC-Mainstream-Kit-NUC8i3BEH/dp/B07GX4X4PW?psc=1&SubscriptionId=AKIAJ3N3QBK3ZHDGU54Q&tag=chmod7mediate-20&linkCode=xm2&camp=2025&creative=165953&creativeASIN=B07GX4X4PW (Intel NUC)
[2]: https://itsfoss.com/linux-based-mini-pc/
[3]: https://www.amazon.com/Crucial-Single-PC4-19200-SODIMM-260-Pin/dp/B01BIWKP58?psc=1&SubscriptionId=AKIAJ3N3QBK3ZHDGU54Q&tag=chmod7mediate-20&linkCode=xm2&camp=2025&creative=165953&creativeASIN=B01BIWKP58 (8GB RAM from Crucial)
[4]: https://www.amazon.com/Western-Digital-240GB-Internal-WDS240G1G0B/dp/B01M9B2VB7?SubscriptionId=AKIAJ3N3QBK3ZHDGU54Q&tag=chmod7mediate-20&linkCode=xm2&camp=2025&creative=165953&creativeASIN=B01M9B2VB7 (240 GB Western Digital SSD)
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/08/intel-nuc.jpg?resize=800%2C600&ssl=1
[6]: https://itsfoss.com/raspberry-pi-4/
[7]: https://en.wikipedia.org/wiki/ARM_architecture
[8]: https://itsfoss.com/affiliate-policy/
[9]: https://itsfoss.com/create-live-usb-of-ubuntu-in-windows/
[10]: https://rufus.ie/
[11]: https://www.balena.io/etcher/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/08/boot-screen-nuc.jpg?ssl=1
[13]: https://itsfoss.com/find-which-kernel-version-is-running-in-ubuntu/
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-1_tutorial.jpg?ssl=1
[15]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-2_tutorial.jpg?ssl=1
[16]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-3_tutorial.jpg?ssl=1
[17]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-4_tutorial.jpg?ssl=1
[18]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-5_tutorial.jpg?ssl=1
[19]: https://itsfoss.com/swap-size/
[20]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-6_tutorial.jpg?ssl=1
[21]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-7_tutorial.jpg?ssl=1
[22]: https://linuxhandbook.com/linux-directory-structure/
[23]: https://itsfoss.com/share-folders-local-network-ubuntu-windows/
[24]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-8_tutorial.jpg?ssl=1
[25]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-9_tutorial.jpg?ssl=1
[26]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-10_tutorial.jpg?ssl=1
[27]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-11_tutorial.jpg?ssl=1
[28]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-12_tutorial.jpg?ssl=1
[29]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-13_tutorial.jpg?ssl=1
[30]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-14_tutorial.jpg?ssl=1
[31]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-15_tutorial.jpg?ssl=1
