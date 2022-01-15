[#]: subject: "Beginner’s Guide to Installing Pop!_OS Linux"
[#]: via: "https://itsfoss.com/install-pop-os/"
[#]: author: "Pratham Patel https://itsfoss.com/author/pratham/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Beginner’s Guide to Installing Pop!_OS Linux
======

_**Brief: Learn to install Pop OS Linux distribution by replacing all other operating systems on your computer.**_

[Pop!_OS][1] is the Linux distribution created by System76 and is based on Ubuntu. Since System76 sells [Linux-first laptops and desktops][2], their Linux distribution, even though is based on Ubuntu, provides support for bleeding edge hardware (only if the newer Linux kernel does not create a conflict for currently supported hardware).

Out of all the new Linux distributions out there, the user-base of Pop!_OS just “popped” out of nowhere. Considering it is a _relatively_ new distro among a plethora of other “well established distros” like Ubuntu, Manjaro, Mint etc; this is a big achievement!

This isn’t an opinion article on why you should [use Pop OS over Ubuntu][3], but a guide, for you to get started with Linux on your PC by installing Pop!_OS on it.

### Choosing the instllation method for Pop OS

There are multiple ways to install Pop!_OS (and all other Linux distros) on your computer.

  1. Install Pop!_OS as a Virtual Machine [using VirtualBox][4] on your PC **without affecting your current Windows install**.
  2. Install Pop!_OS alongside Windows; AKA [dual boot][5] (even though the linked guide is for Ubuntu, it should work for Pop!_OS; **make sure to turn off “Secure Boot”**).
  3. Replace Windows 10/11 with Pop!_OS.



I highly recommend that you [try out Pop!_OS in VirtualBox][4] before installing it on your computer, specially if you are new to Linux.

_**This tutorial covers installation of Pop!_OS replacing Windows**_, and below are the hardware requirements for Pop!_OS.

  * A 4 GB USB drive to create a Live USB drive
  * Any 64-bit x86 CPU (any 64-bit Intel or AMD CPU)
  * At least 4 GB of RAM is recommended
  * A minimum of 20 GB of storage (to store the OS)



_**WARNING: This guide assumes you want to replace Windows on your PC with a Linux distro of your choice (Pop!_OS in this case) and it results in wiping your drive clean. Please make sure you have backed up all of your important data before proceeding further.**_

### Choose the version of Pop!_OS to install

![][6]

Just like Ubuntu, Pop!_OS comes in two variants. All LTS releases are supported for 5 years from release date. Canonical releases a LTS version of Ubuntu in April of every even numbered year.

A new Non-LTS version is released every 6 months (in April and September, every year) and that particular version is supported only for 9 months from release date.

As of writing this article, Pop!_OS is available in two (technically four, but we will get to that later) versions. Current LTS release is “Pop!_OS 20.04 LTS” and “Pop!_OS 21.04”. And soon enough, version 21.10 will be released.

Because Nvidia does not have open source drivers, installing Nvidia GPU Drivers ends up causing problems to your Linux installation if not done correctly. Therefore, System76 offers two variants for each version of Pop!_OS.

Pop!_OS 20.04 LTS is [available in two variants][7] (more details in next section).

  * For users with a Nvidia GPU in their computer
  * For users with an AMD (and/or an Intel for iGPU and for the [upcoming dGPU][8]) users.



If you are not sure, [check the graphics card][9] on your system and choose the appropriate version while downloading.

### Installing Pop!_OS

In this guide, I’ll be using the non-Nvidia version of Pop!_OS 20.04 LTS (but the installer steps will be the same for every variant of the same version).

#### Step 1: Create a live USB

Visit System76’s website to download a copy of Pop!_OS.

[Download Pop!_OS][1]

![Pop!_OS ISO selection menu][10]

Select “Pop!_OS 20.04 LTS” (#1) and then click on either the normal ISO (#2) or the Nvidia-specific ISO (#3) to start downloading it.

After you have downloaded a copy of ISO that is suitable for your use case and machine, your next step will be to create a live installer for Pop!_OS. A live installer is a full copy of the OS for you to tinker with, before you feel that the OS of your liking and also compatible with your hardware.

Sometimes the distribution of your choice might not have good support for the proprietary components like WiFi, GPU etc included in your laptop/desktop. Now is the time to test your hardware compatibility.

_**NOTE: Any data stored on your USB stick will be erased at this step, make sure you do not have anything important on the flash drive.**_

You have access to numerous tools to create a live USB stick. Some of them are:

  * [balenaEtcher][11] (available on Mac, Windows and Linux)
  * [UNetbootin][12] (available on Mac, Windows and Linux)
  * [Rufus][13] (available only on Windows)
  * [Ventoy][14] (available on Windows and Linux)



On Windows, you can use Rufus to [create a live USB from Windows][15]. You may also use Etcher for Windows, Linux and macOS. It is really simple. Just start the application, browse the downloaded ISO and hit the flash button.

![A generic example of creating live Linux USB with Etcher][16]

#### Step 2: Booting from the live Pop OS USB

Once you have created the live USB, you need to tell our computer to boot from the USB stick instead of the disk on which Windows is installed.

To do that, restart your computer. And once you see your computer vendor’s logo (HP, Dell, Asus, Gigabyte, ASRock etc) press either the F2 or F10 or F12 or Delete key to enter your computer’s BIOS/UEFI. This key will differ based on your computer vendor, for most desktops it is usually the Delete key, and for most laptops it is the F2 key. If still in doubt, a quick web search should tell you which key to press for your system.

![BIOS/UEFI boot menu keys][17]

On modern computers with UEFI, you don’t even need to go in UEFI. You can directly hit a specific key like F12 (my computer vendor has F12) and you’ll see a boot menu. From there directly select your USB stick.

![UEFI boot menu][18]

For people who have an older BIOS/UEFI, go under the section where it says Boot (do note, the steps will vary from vendor to vendor) and select your USB drive instead of your SSD/HDD. And reboot.

![UEFI/BIOS boot drive selection][19]

Your computer should now boot from the live USB you just created.

#### Step 4: Start installing Pop!_OS

You should be in the Pop!_OS live environment now. On your computer screen, you will see an installer asking you for setup details like your preferred Language, Country and Keyboard Layout.

![Pop!_OS Installation screen][20]

Once you have selected your Language, Country and Keyboard Layout, you will see this screen. You technically have 3 options.

![Pop!_OS Installation types, plus Demo Mode][21]

  * Clean Install (#1): This option will erase your entire disk and install Pop!_OS on it.
  * Custom (Advanced) (#2): This option will allow you to specify things like root partition, if you want a different home partition, use another file system for your root partition, resize partitions, use a different sized swap partition etc.
  * Try Demo Mode (#3): An option in the bottom left of the installer that allows you to test drive Pop!_OS as if it was actually installed on your computer without actually touching your drive contents.



**For the scope of this tutorial, proceed by selecting Clean Install.**

Next up, specify a drive where you want to install Pop!_OS on. In case your computer has multiple drives, you will see each drive labelled along with it’s size so you can be assured if the drive you have selected is the one you have decided to install Pop!_OS on.

![Pop!_OS Drive selection options][22]

You will be prompted to provide your name and a username for your user. Your username will be the name of your home folder.

![Pop!_OS User’s Name and username input][23]

Up next, set a password for your user.

![Pop!_OS User password input][24]

The final step includes setting up Drive Encryption. If someone has physical access to your computer, your data on the disk can be accessed using a live operating system (like the live USB you created).

The disk encryption prevents that. However, you must never forget the password or you’ll never be able to use the disk again.

It is up to you if you want to encrypt the disk.

![Pop!_OS Drive Encryption options][25]

The installer will give you three options for encryption.

  * Don’t Encrypt (#1): Does not encrypt your drive. Not recommended for security conscious users
  * Use user password for drive encryption (#2): This will tell the installer to use the same password for your user and for drive encryption. If you use this option, make sure your user has a strong password.
  * Set Password (#3): Use a different password for encrypting drive.



Whichever you choose, the installation should start now. Below is a screenshot showing the installer screen.

![Pop!_OS Installation screen, plus log button][26]

Just in case you encounter any error(s) during this step, click on the button placed at the bottom right edge of installer with “$_” (annotated as “Log” in the screenshot above) in it. It is the installer log. Posting a few lines from the bottom of this log should help others from [our community forum][27] or any other forums help you diagnose the issue causing installation errors.

Please wait for a few minutes for the installer to finish installing and it will provide you with two options, Reboot or Shut Down. Power off your computer and remove the USB drive.

Congratulations! You just installed Pop!_OS on your computer! Let me know if you face any issues.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-pop-os/

作者：[Pratham Patel][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pratham/
[b]: https://github.com/lujun9972
[1]: https://pop.system76.com/
[2]: https://itsfoss.com/get-linux-laptops/
[3]: https://itsfoss.com/pop-os-vs-ubuntu/
[4]: https://itsfoss.com/install-linux-in-virtualbox/
[5]: https://itsfoss.com/install-ubuntu-1404-dual-boot-mode-windows-8-81-uefi/
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/POP_OS-Installation.png?resize=800%2C450&ssl=1
[7]: https://pop.system76.com
[8]: https://www.phoronix.com/scan.php?page=news_item&px=Intel-DG1-Status-XDC2021
[9]: https://itsfoss.com/check-graphics-card-linux/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/pop-os-download-options.webp?resize=800%2C740&ssl=1
[11]: https://www.balena.io/etcher/
[12]: https://unetbootin.github.io
[13]: https://rufus.ie/en/
[14]: https://www.ventoy.net/en/index.html
[15]: https://itsfoss.com/create-live-usb-of-ubuntu-in-windows/%5D
[16]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/balena-etcher-create-linux-live-usb.png?resize=800%2C450&ssl=1
[17]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/03-01-bios-uefi-boot-menu-keys.webp?resize=732%2C366&ssl=1
[18]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/03-02-boot-menu.webp?resize=731%2C364&ssl=1
[19]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/03-03-select-boot-drive-3.webp?resize=800%2C399&ssl=1
[20]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/04-01-installer-init.webp?resize=800%2C595&ssl=1
[21]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/04-02-installation-options.webp?resize=800%2C595&ssl=1
[22]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/04-03-drive-selection.webp?resize=800%2C595&ssl=1
[23]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/04-04-name-and-username-selection.webp?resize=800%2C595&ssl=1
[24]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/04-05-password-setup-screen.webp?resize=800%2C595&ssl=1
[25]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/04-06-drive-encryption-options.webp?resize=800%2C595&ssl=1
[26]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/04-08-installation.webp?resize=800%2C595&ssl=1
[27]: https://itsfoss.community/
