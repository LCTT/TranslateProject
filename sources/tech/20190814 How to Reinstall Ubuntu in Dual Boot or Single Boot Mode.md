[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Reinstall Ubuntu in Dual Boot or Single Boot Mode)
[#]: via: (https://itsfoss.com/reinstall-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Reinstall Ubuntu in Dual Boot or Single Boot Mode
======

If you have messed up your Ubuntu system and after trying numerous ways to fix it, you finally give up and take the easy way out: you reinstall Ubuntu.

We have all been in a situation when reinstalling Linux seems a better idea than try to troubleshoot and fix the issue for good. Troubleshooting a Linux system teaches you a lot but you cannot always afford to spend more time fixing a broken system.

There is no Windows like recovery drive system in Ubuntu as far as I know. So, the question then arises: how to reinstall Ubuntu? Let me show you how can you reinstall Ubuntu.

Warning!

Playing with disk partitions is always a risky task. I strongly recommend to make a backup of your data on an external disk.

### How to reinstall Ubuntu Linux

![][1]

Here are the steps to follow for reinstalling Ubuntu.

#### Step 1: Create a live USB

First, download Ubuntu from its website. You can download [whichever Ubuntu version][2] you want to use.

[Download Ubuntu][3]

Once you have got the ISO image, it’s time to create a live USB from it. If your Ubuntu system is still accessible, you can create a live disk using the startup disk creator tool provided by Ubuntu.

If you cannot access your Ubuntu system, you’ll have to use another system. You can refer to this article to learn [how to create live USB of Ubuntu in Windows][4].

#### Step 2: Reinstall Ubuntu

Once you have got the live USB of Ubuntu, plugin the USB. Reboot your system. At boot time, press F2/10/F12 key to go into the BIOS settings and make sure that you have set Boot from Removable Devices/USB option at the top. Save and exit BIOS. This will allow you to boot into live USB.

Once you are in the live USB, choose to install Ubuntu. You’ll get the usual option for choosing your language and keyboard layout. You’ll also get the option to download updates etc.

![Go ahead with regular installation option][5]

The important steps comes now. You should see an “Installation Type” screen. What you see on your screen here depends heavily on how Ubuntu sees the disk partitioning and installed operating systems on your system.

[][6]

Suggested read  How to Update Ubuntu Linux [Beginner's Tip]

Be very careful in reading the options and its details at this step. Pay attention to what each options says. The screen options may look different in different systems.

![Reinstall Ubuntu option in dual boot mode][7]

In my case, it finds that I have Ubuntu 18.04.2 and Windows installed on my system and it gives me a few options.

The first option here is to erase Ubuntu 18.04.2 and reinstall it. It tells me that it will delete my personal data but it says nothing about deleting all the operating systems (i.e. Windows).

If you are super lucky or in single boot mode, you may see an option where you can see a “Reinstall Ubuntu”. This option will keep your existing data and even tries to keep the installed software. If you see this option, you should go for it it.

Attention for Dual Boot System

If you are dual booting Ubuntu and Windows and during reinstall, your Ubuntu system doesn’t see Windows, you must go for Something else option and install Ubuntu from there. I have described the [process of reinstalling Linux in dual boot in this tutorial][8].

For me, there was no reinstall and keep the data option so I went for “Erase Ubuntu and reinstall”option. This will install Ubuntu afresh even if it is in dual boot mode with Windows.

The reinstalling part is why I recommend using separate partitions for root and home. With that, you can keep your data in home partition safe even if you reinstall Linux. I have already demonstrated it in this video:

Once you have chosen the reinstall Ubuntu option, the rest of the process is just clicking next. Select your location and when asked, create your user account.

![Just go on with the installation options][9]

Once the procedure finishes, you’ll have your Ubuntu reinstalled afresh.

In this tutorial, I have assumed that you know things because you already has Ubuntu installed before. If you need clarification at any step, please feel free to ask in the comment section.

[][10]

Suggested read  How To Fix No Wireless Network In Ubuntu

--------------------------------------------------------------------------------

via: https://itsfoss.com/reinstall-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/08/Reinstall-Ubuntu.png?resize=800%2C450&ssl=1
[2]: https://itsfoss.com/which-ubuntu-install/
[3]: https://ubuntu.com/download/desktop
[4]: https://itsfoss.com/create-live-usb-of-ubuntu-in-windows/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/08/reinstall-ubuntu-1.jpg?resize=800%2C473&ssl=1
[6]: https://itsfoss.com/update-ubuntu/
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/reinstall-ubuntu-dual-boot.jpg?ssl=1
[8]: https://itsfoss.com/replace-linux-from-dual-boot/
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/reinstall-ubuntu-3.jpg?ssl=1
[10]: https://itsfoss.com/fix-no-wireless-network-ubuntu/
