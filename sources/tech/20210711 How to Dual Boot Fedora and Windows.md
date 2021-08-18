[#]: subject: (How to Dual Boot Fedora and Windows)
[#]: via: (https://itsfoss.com/dual-boot-fedora-windows/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to Dual Boot Fedora and Windows
======

_**Brief:** This detailed tutorial shows you **how to dual boot Fedora Linux with Windows 10**, step-by-step, accompanied by proper screenshots._

Dual booting Linux and Windows is one of the popular ways to enjoy the full potential of the two operating systems. You have both Linux and Windows installed on the same system and you can choose which one to use after starting your system.

![On the grub screen, you can select the operating system][1]

If you have a system with Windows installed already, you’ll learn how to install Fedora alongside Windows in this tutorial.

### Installing Fedora alongside Windows

![][2]

The tutorial has been performed on a system with Windows already installed, GPT partitioning and UEFI boot. It should be applicable to other systems with MBR partitioning and legacy BIOS system as well, but I cannot confirm that.

Note: If your Windows system uses BitLocker encryption, it will be a good idea to disable it first before you go on installing Fedora.

#### Requirements

Here’s what you’ll need to follow this tutorial:

  * A system preinstalled with Windows
  * Good speed internet connection
  * A USB key (pen drive) with at least 4 GB in size
  * Optional: External USB disk for making back up of your existing data on Windows.
  * Optional: Windows recovery or bootable disk (if you encounter any major boot issues, you can fix with it).



Let’s see the steps.

#### Step 1: Make a backup of data on your Windows system [optional]

Backup is always a good idea. You will be dealing with the disk partitions. In the rare unfortunate case, if you make a mistake and delete the wrong partition, you’ll lose your data.

The simplest way would to be to copy the data in Documents, Videos, Music, Pictures and other folders to an external USB disk. You can use an external HDD (slower but cheaper) or SSD (faster but expensive) and copy the important files and folders on it.

Preview | Product | Price |
---|---|---|---
![SanDisk 500GB Extreme Portable SSD - Up to 1050MB/s - USB-C, USB 3.2 Gen 2 - External Solid State Drive - SDSSDE61-500G-G25][3] ![SanDisk 500GB Extreme Portable SSD - Up to 1050MB/s - USB-C, USB 3.2 Gen 2 - External Solid State Drive - SDSSDE61-500G-G25][3] | [SanDisk 500GB Extreme Portable SSD - Up to 1050MB/s - USB-C, USB 3.2 Gen 2 - External Solid State...][4] | $89.99[][5] | [Buy on Amazon][6]
Preview | Product | Price |
---|---|---|---
![Toshiba Canvio Advance 1TB Portable External Hard Drive USB 3.0, Black - HDTCA10XK3AA][7] ![Toshiba Canvio Advance 1TB Portable External Hard Drive USB 3.0, Black - HDTCA10XK3AA][7] | [Toshiba Canvio Advance 1TB Portable External Hard Drive USB 3.0, Black - HDTCA10XK3AA][8] | $51.99[][5] | [Buy on Amazon][9]

#### Step 2: Make some free space for Fedora installation

You need to create a partition where you’ll be installing Fedora. If you just have C drive, shrink it. If you have D, E or F drive, see if you can move their data to some other partition and delete or shrink one of them. Anything above 40 GB should be comfortable enough space for Fedora.

In the Windows menu, search for ‘disk partitions’ and go to ‘Create and format hard disk partitions’.

![][10]

In the Disk Management tool, right-click on the drive which you want to partition and select **shrink volume**.

If you have just one partition like this, you need to make some free space out of it for Linux. If you have several partitions of considerable size, use any of them except C drive because it may erase the data.

![][11]

#### Step 3: Making a live USB of Fedora in Windows

Now, this can be done in different ways. You can download the ISO and [use Etcher][12] or Rufus or some other tool to write the ISO image to the USB disk.

However, Fedora provides a dedicated tool for downloading and making live USB. I am going to use that in this tutorial. The Fedora team put some effort in creating this tool, so why not use it.

But first, **plug in the USB key**. Now, go to the download page of Fedora:

[Fedora Download][13]

You’ll see the option to download the Fedora Media Writer tool for Windows.

![][14]

It will download an exe file. Once downloaded, go to your downloads folder and double-click the FedoraMediaWriter exe file to install the Fedora Media Writer tool. Just keep on hitting next.

![][15]

Once installed, run the Fedora Media Writer tool. But before that, **make sure that you have plugged in the USB**.

It will give you the option to install various editions of Fedora. For desktops, go with Workstation.

![][16]

On the next screen, you’ll get the option to create live USB. When you hit that button, it starts downloading the ISO. It will also recognize your inserted USB key.

You need to have a good speed internet connection to download the 2 GB of ISO in a comfortable time span.

![][17]

After downloading the ISO, it checks the download automatically and then gives you the option to write the ISO image to the USB disk, i.e. create the live USB. Hit the “Write to Disk” button.

![][18]

It will take a couple of minutes to complete the process. It displays “Finished” message and you can close the Fedora Media Writer tool now.

![][19]

Good! So now you have the Fedora live USB ready with you. Time to use it for installing Fedora with Windows.

#### Step 4: Boot from live USB and install Fedora

Some systems do not allow you to boot from live USB with secure boot. If that’s the case with you, please [disable secure boot][20].

At the screen that shows the logo of your system manufacturer, press the **F2 or F10 or F12** key. You may try pressing all of them one by one if you are not sure of the key. But **be quick** when you do that otherwise it will boot into the operating system.

This key is different for different brand of computers. Some may even use **Esc** or **Del** keys for this purpose.

![Quickly press F2, F10 or F12 keys at the screen showing your system manufacturer’s logo][21]

In some rare cases, you may have to [access the UEFI boot settings from within Windows][22].

In the BIOS settings, normally, you should see a screen like this. Here, you use the arrow keys to move down to USB option and press enter to boot from the USB. Please note that the screen may look different in different systems.

![][23]

If things go right, you should see a screen like below. **Go with the first option “Start Fedora Workstation”:**

![][24]

After some seconds, you should boot into the live Fedora session and see the option to try or install it. Go with “Install to Hard Drive”.

![][25]

It will ask to choose the language of choice for the installation process.

![][26]

The next screen is important. If you had created the free space in the step 2, you should be able to hit on the “Begin Installation”. If you see an exclamation mark on the disk icon under System, click on it and see what kind of disk configuration you can use here.

If you have more than one disk, you can choose which disk to use for Fedora.

![][27]

Select the disk and click on Done. You may see a warning message now. In my case, I did not create free space in the step 2 and hence it complained that there is not enough free space to install Fedora.

![][28]

I clicked on reclaim space and shrank the Windows partition here.

![][29]

After this, the “Begin Installation” option appeared to start the installation.

![][30]

Now it’s just a waiting game. It will take a few minutes to extract files and install them.

![][31]

When the process completes, you’ll see the “Finish Installation” button. Hit it.

![][32]

You’ll be back to Fedora live session. Click the top right corner to bring down the menu and select Restart.

![][33]

When the system starts now, you should see the [Grub bootloader][34] screen with option to boot into Fedora and Windows.

![][1]

#### Step 5: Complete Fedora setup

You are almost there. Did you notice that Fedora didn’t ask you to enter username and password? Many distributions like Ubuntu ask you to create an admin user during the installation itself. On the other hand, Fedora gives you this option when you log in to the installed system for the first time.

When you first log in, it runs a setup and creation of user and password is part of this initial setup.

![][35]

![][36]

![][37]

Once you do that, you are ready to enjoy Fedora Linux.

![][38]

That’s it. You can enjoy Fedora Linux and Windows in dual boot mode on the same system.

If you have any questions or if you are facing any issues while following this tutorial, please let me know in the comment system.

--------------------------------------------------------------------------------

via: https://itsfoss.com/dual-boot-fedora-windows/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/dual-boot-grub-screen-fedora-windows.jpg?resize=800%2C350&ssl=1
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/07/fedora-windows-dual-boot.jpg?resize=800%2C450&ssl=1
[3]: https://i1.wp.com/m.media-amazon.com/images/I/41zwkV8VfPL._SL160_.jpg?ssl=1
[4]: https://www.amazon.com/dp/B08GTXVG9P?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (SanDisk 500GB Extreme Portable SSD - Up to 1050MB/s - USB-C, USB 3.2 Gen 2 - External Solid State Drive - SDSSDE61-500G-G25)
[5]: https://www.amazon.com/gp/prime/?tag=chmod7mediate-20 (Amazon Prime)
[6]: https://www.amazon.com/dp/B08GTXVG9P?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (Buy on Amazon)
[7]: https://i0.wp.com/m.media-amazon.com/images/I/31-nRLIONWL._SL160_.jpg?ssl=1
[8]: https://www.amazon.com/dp/B08JKFY8FH?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (Toshiba Canvio Advance 1TB Portable External Hard Drive USB 3.0, Black - HDTCA10XK3AA)
[9]: https://www.amazon.com/dp/B08JKFY8FH?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (Buy on Amazon)
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/03/disc-management-windows.png?resize=800%2C561&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/04/making-free-space-for-dual-boot.jpg?resize=1226%2C728&ssl=1
[12]: https://itsfoss.com/install-etcher-linux/
[13]: https://getfedora.org/en/workstation/download/
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/download-fedora-media-writer-tool.png?resize=800%2C373&ssl=1
[15]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/installing-Fedora-Media-Writer-tool-Windows.png?resize=745%2C581&ssl=1
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/07/fedora-media-writer-1.png?resize=800%2C425&ssl=1
[17]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/07/fedora-media-writer-2.jpg?resize=800%2C422&ssl=1
[18]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/writing-fedora-iso-to-usb-with-Fedora-Media-Writer-Tool.png?resize=800%2C285&ssl=1
[19]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/07/fedoa-live-usb-with-fedora-media-writer.png?resize=800%2C300&ssl=1
[20]: https://itsfoss.com/disable-secure-boot-windows/
[21]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/acer-predator-boot.jpg?resize=800%2C600&ssl=1
[22]: https://itsfoss.com/access-uefi-settings-windows-10/
[23]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/06/select-boot-from-live-usb.jpg?resize=800%2C330&ssl=1
[24]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/07/fedora-live-screen.jpg?resize=800%2C350&ssl=1
[25]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/Fedora-install-screen.jpg?resize=800%2C450&ssl=1
[26]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/07/installing-fedora-1.png?resize=800%2C450&ssl=1
[27]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/07/installing-fedora-2.png?resize=800%2C450&ssl=1
[28]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/installing-fedora-3.png?resize=800%2C450&ssl=1
[29]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/07/installing-fedora-4.png?resize=800%2C450&ssl=1
[30]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/installing-fedora-5.png?resize=800%2C450&ssl=1
[31]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/07/installing-fedora-6.png?resize=800%2C450&ssl=1
[32]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/07/installing-fedora-7.png?resize=800%2C450&ssl=1
[33]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/restart-gnome-fedora.jpg?resize=799%2C439&ssl=1
[34]: https://itsfoss.com/what-is-grub/
[35]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/fedora-setup-1.png?resize=800%2C575&ssl=1
[36]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/07/fedora-setup-2.png?resize=800%2C593&ssl=1
[37]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/fedora-setup-3.png?resize=800%2C591&ssl=1
[38]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/fedora-setup-completed.jpg?resize=800%2C500&ssl=1
