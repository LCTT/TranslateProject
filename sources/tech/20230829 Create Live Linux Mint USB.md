[#]: subject: "Create Live Linux Mint USB"
[#]: via: "https://itsfoss.com/linux-mint-live-usb/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Create Live Linux Mint USB
======

Linux Mint is one of the [best Linux distribution choices for beginners][1]. It is based on Ubuntu and yet some people find [Mint better than Ubuntu][2].

If you want to try it, you can [install Linux Mint inside VirtualBox][3]. That's one way.

Another way is to create a live USB of Linux Mint. This way, you can boot from the USB and experience Linux Mint in a live session. It won't disturb your current operating system, be it Windows or Linux.

If you like it and choose to install it, you can use the same live USB. The creation of live USB is the first step towards Linux Mint installation.

Before you proceed to make a live USB, you need to take care of a few things first.

### What do you need?

To get started, you need the following:

  * A **USB drive** (also known as a flash drive or pen drive) with at least 8 GB of space.
  * An active internet connection to download the Linux Mint ISO.
  * A tool to help you create the live USB.



💡

You can create the live USB on one system and use it on any other computer.

### Step 1: Download Linux Mint ISO

The ISO is an image file consisting of Linux Mint. This file will be flashed to the USB.

Linux Mint offers three ISOs for different [desktop environments][4]. The flagship **Cinnamon** edition, a **MATE** variant, and **XFCE**.

![][5]

The ISOs include some of the [best desktop environments][6] that you can find. The **popular recommendation is to get the Cinnamon edition** for the best Linux Mint experience, but you can try others.

No matter the edition, the ISOs are approximately **2.7 GB** in file size.

Head to the [official download page][7] and get it. You can choose among the mirrors available for direct download or use the torrent file.

[Linux Mint Download][7]

Once you have the ISO, you'll need a dedicated tool to flash the ISO image to the USB. I recommend Etcher.

📋

Some people prefer to [perform an integrity checksum][8] on the downloaded ISO file. It's a way to ensure that the ISO file is not corrupted during download (may happen due to an inconsistent internet connection).

### Step 2: Install Etcher to create the live USB

Rufus is an excellent tool for Windows users. Alas! it is not available for Linux users.

To keep this tutorial simple, I'll [use Etcher][9]. It's a [Rufus alternative available on Linux][10] and Windows both.

This way, you can use the same steps for creating live Linux Mint USB on both Windows and Linux platforms. The only step different here is the Etcher installation.

#### If you are using Windows

Download Etcher from its [official website][11]. It is recommended to download the full installer unless you have a reason to get the portable file.

![][12]

You will find an **.exe** file. Just **double-click** on the installer and follow the on-screen instructions to agree to the terms, and complete the installation.

Next, you can search for it from the search menu and launch the program.

![][13]

#### If you are using Linux

For Linux, download Etcher's AppImage file from its [official website][11].

You can refer to our [AppImage guide][14] to know how to run the file as an executable.

![][15]

With AppImage files, you are not [installing Etcher][9], you are directly running it.

### Step 3: Flashing Linux Mint ISO to USB with Etcher

**Plug in the USB** drive and run the Etcher tool you installed in the previous step.

Now, considering that you already downloaded the Linux Mint ISO, click on the " **Flash from file** " option as shown below.

![][16]

And select the ISO file downloaded using your file explorer.

![][17]

Once you select the ISO, you need to pick the USB device to flash it on. Etcher should automatically pick it if there is just one. Still ensure that the correct USB drive is selected in Etcher.

![][18]

Now, all you have to do is hit " **Flash** " and wait for the process to complete.

![][19]

You will get a prompt to accept a command-line process and proceed with a " **Yes** " to start the flashing process.

![][20]

Once done, it will validate that the process was successful, and you should be good to go!

### Step 4: Booting from live USB

The live USB you created should work with any computer with UEFI boot.

You can [access the UEFI boot settings][21] easily by pressing the F2 or F10 or F12 key when your system is booting up and shows the manufacturer's logo.

Once you have access to the boot settings, change the boot order to boot from USB first.

Different computers have different BIOS settings, so I cannot share a definite screenshot for this step.

💡

In some rare cases, the secure boot may not allow booting. You can disable secure boot then.

### What comes next?

If you like Linux Mint in live setting, you can use the live USB to install Mint by deleting Windows.

![][22]

Alternatively, you may also [dual boot Mint and Windows][23], keeping both operating systems in the same computer.

![][22]

Another useful tip. Later on, if you want to use USB for some other purpose but it only shows 4 MB, you can use this troubleshooting article to fix it.

![][22]

💬 _I hope you find this tutorial helpful in creating live Mint USB. Let me know your questions and suggestions in the comment section._

--------------------------------------------------------------------------------

via: https://itsfoss.com/linux-mint-live-usb/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-linux-beginners/
[2]: https://itsfoss.com/linux-mint-vs-ubuntu/
[3]: https://itsfoss.com/install-linux-mint-in-virtualbox/
[4]: https://itsfoss.com/what-is-desktop-environment/
[5]: https://itsfoss.com/content/images/2023/08/linux-mint-download-page.jpg
[6]: https://itsfoss.com/best-linux-desktop-environments/
[7]: https://www.linuxmint.com/download.php
[8]: https://itsfoss.com/checksum-tools-guide-linux/
[9]: https://itsfoss.com/install-etcher-linux/
[10]: https://itsfoss.com/live-usb-creator-linux/
[11]: https://etcher.balena.io/#download-etcher
[12]: https://itsfoss.com/content/images/2023/08/balena-etcher-windows-download.jpg
[13]: https://itsfoss.com/content/images/2023/08/balena-etcher-launch.jpg
[14]: https://itsfoss.com/use-appimage-linux/
[15]: https://itsfoss.com/content/images/2023/08/balena-etcher-appimage.png
[16]: https://itsfoss.com/content/images/2023/08/etcher-flash-from-file.jpg
[17]: https://itsfoss.com/content/images/2023/08/balena-iso-selection-windows.jpg
[18]: https://itsfoss.com/content/images/2023/08/balena-etcher-device-select.jpg
[19]: https://itsfoss.com/content/images/2023/08/balenaEtcher-flash-windows.png
[20]: https://itsfoss.com/content/images/2023/08/balenaEtcher-flashing.png
[21]: https://itsfoss.com/access-uefi-settings-windows-10/
[22]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[23]: https://itsfoss.com/guide-install-linux-mint-16-dual-boot-windows/
