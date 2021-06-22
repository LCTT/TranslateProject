[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install Linux Mint in VirtualBox [Screenshot Tutorial])
[#]: via: (https://itsfoss.com/install-linux-mint-in-virtualbox/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

How to Install Linux Mint in VirtualBox [Screenshot Tutorial]
======

_**Brief: One of safest and easiest ways to try Linux Mint is inside a virtual machine. Your real system doesn’t change at all. Learn how to install Linux Mint in VirtualBox in this tutorial.**_

[Linux Mint][1] is considered one of the [best distributions for new Linux users][2]. Its flagship Cinnamon DE is one of the most popular desktop environment giving your system a look and feel of classic Window-styled desktop.

If you want to try Linux Mint and see if it fits your need, you could try installing it in a virtual machine. This way, you run Linux Mint inside your current system without changing your system’s partition or boot order. One of the safest way out there as you get to run Linux like a regular desktop application inside your current operating system.

![][3]

Oracle’s open source virtualization tool [VirtualBox][4] is available for free on all major desktop operating systems i.e. Windows, Linux and macOS.

In this beginner’s tutorial, I’ll show you the steps for installing Linux Mint in VirtualBox. I am including the screenshots for each step so that you can easily follow the tutorial.

### Installing Linux Mint in VirtualBox

You can follow the steps on any operating system be it Windows, Linux or macOS. You just need to install VirtualBox on your operating system and rest of the steps remain the same.

**Step 1:** [Download VirtualBox from its website][4] and install it by double-clicking on the downloaded file.

![][5]

Next, install the latest version of Linux Mint’s ISO file from its website.

[Download Linux Mint ISO][6]

**Step 2:** Once your virtual Box is up &amp; running we are ready to get started. Click the New button, click Next on the virtual machine wizard.

![Create a new Virtual Machine][7]

Initially you need to specify the following:

  * Name: Any preferred name for your VM like Linux Mint
  * Type: Linux
  * Version: Ubuntu (64 bit) as Linux Mint is an Ubuntu-based distribution



Before configuring any hardware resource value, please make sure that are aware of the [system requirements][8].

2 GB RAM would be okay but won’t give you a good experience. 3 GB is a comfortable amount if your system has 8 GB of RAM. I choose to set my Virtual Machine to 4096 MB (4 GB) because my system has plenty of RAM.

RAM consumption

One of the common confusion is regarding the RAM consumption. Let’s say your Windows system has 8 GB of RAM and you assign 3 GB of RAM to Linux Mint in VirtualBox.

If you are running Linux Mint inside VirtualBox, your real system (called host system) will have 5 GB of RAM available for consumption.

If you are not running Linux Mint inside VirtualBox, at that moment, the entire 8 GB will be available to the host system.

**Step 3:** Next, choose a Virtual Hard disk now option and click create.

Choose the virtual storage allocation method (Recommended Dynamically allocated). Set your storage location for virtual hard disk by browsing drive and then specify the size of virtual hard disk (it could be anything from 12-20 GB).

![Dynamic allocation can save you space if you don’t need the maximum allowance][9]

**Step (4 (optional advanced settings):** Once Virtual machine has been created, click on the settings button in menu:

![][10]

Now, go to the Display section. Specify the Video memory (128 MB) and check “Enable 3D Acceleration”.

![Don’t forget to enable the 3D Acceleration][11]

Then click on System Tab → Processor and choose how many threads would you like to allocate.

My system is a 4 core/4 thread system and I choose to assign half of the CPU capability i.e. 2 threads.

![Select CPU cores as per the distribution requirements][12]

Once you have configured everything click ok.

**Step 5:** In the System settings, go to Storage (from the left sidebar). Click on the [Optical Drive] Empty as shown in the image below.

You’ll be asked to browse to the Linux Mint ISO file you had downloaded earlier.

![][13]

Once you select your ISO, click on the start button and that’s it! Now the ISO will start running as if you are booting from a live USB.

Next, you need to press enter whilst your option is start Linux Mint as per the picture below.

![][14]

**Step 6:** Let’s start the installation procedure.

Choose the language you want for your Linux Mint virtual machine.

![Choose your native language][15]

I’m based in the UK, so I have a UK keyboard layout. You can choose the one you want.

![Choose your keyboard layout according to your hardware configuration][16]

You may check the box to download and install any third-party software during the installation.

![You may install media codecs while installing Linux Mint][17]

You can proceed to erase the disk and install Linux Mint.

Erase disk? Really?

This step may seem scary because you may think that it will harm your real system.

Let me assure you that it won’t do any damage to your actual disk. Remember you created 10-20 GB of virtual disk in step 3? Now you are inside that disk.

When it asks for erasing the disk, it is erasing the virtual disk created for it. It doesn’t impact your real system disk and its data.

![It is safe to erase your disk only at a Virtual Machine level][18]

Next, select your time zone and click continue. You may [change time zone in Linux][19] later as well.

![][20]

You will be prompted to create your user account, your host name (computer’s name) and to choose a password. Once done, click continue to finalize the installation.

![][21]

Please wait a few minutes for the process to complete.

![Wait a few minutes for the process to finish][22]

The installation has now finished. Click on “Restart now”.

![Well done! You have successfully installed Linux Mint][23]

When you reach this step, Linux Mint will be installed and ready to use!

![][24]

You don’t have an installation medium so just power off the virtual machine.

![][25]

Now to use your virtual machine, click on the start button.

![][26]

You can explore a fully functional system, and at this time if you shut down Linux Mint like it was physically installed, it will automatically power off the virtual machine.

![][27]

Enjoy Linux Mint in VirtualBox. I hope you were able to install Linux Mint in VirtualBox. If you face any issues, please let me know in the comment section. I’ll try to help you out.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-linux-mint-in-virtualbox/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://www.linuxmint.com/
[2]: https://itsfoss.com/best-linux-beginners/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/install-linux-mint-in-virtualbox.png?ssl=1
[4]: https://www.virtualbox.org/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/download-virtulabox.jpg?ssl=1
[6]: https://www.linuxmint.com/download.php
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/1.-Create-new.jpg?ssl=1
[8]: https://blog.linuxmint.com/?p=3832
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/2.-Create-virtual-hard-disk.jpg?resize=800%2C472&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/3.-settings.jpg?resize=800%2C470&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/4.-display.jpg?resize=800%2C472&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/5.-cpu.jpg?resize=800%2C468&ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/6.-choose-iso.jpg?resize=800%2C472&ssl=1
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/7.-boot.jpg?resize=800%2C459&ssl=1
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/8.-choose-language.png?resize=800%2C679&ssl=1
[16]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/9.-English-UK.png?resize=800%2C679&ssl=1
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/10.-install-third-party-software.png?resize=800%2C679&ssl=1
[18]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/11.-installation-type.png?resize=800%2C679&ssl=1
[19]: https://itsfoss.com/change-timezone-ubuntu/
[20]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/12.-timezone.png?resize=800%2C679&ssl=1
[21]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/13.-user-account.png?resize=800%2C679&ssl=1
[22]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/14.-installation-screen.png?resize=800%2C679&ssl=1
[23]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/15.-installation-finish.png?resize=800%2C679&ssl=1
[24]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/16.-remove-the-media.png?resize=800%2C679&ssl=1
[25]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/17.-power-off.png?resize=800%2C678&ssl=1
[26]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/18.-init-the-fresh-installed-mint.png?resize=800%2C476&ssl=1
[27]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/19.-Linux-mint-19.3-final.png?resize=800%2C469&ssl=1
