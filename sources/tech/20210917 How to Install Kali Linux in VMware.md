[#]: subject: "How to Install Kali Linux in VMware"
[#]: via: "https://itsfoss.com/install-kali-linux-vmware/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install Kali Linux in VMware
======

Kali Linux is the de facto standard of [Linux distributions used for learning and practicin][1][g][1] [hacking and penetration testing][1].

And, if you’ve been tinkering around with Linux distros long enough, you might have tried it out just out of curiosity.

However, no matter what you use it for, it is not a replacement for a regular full-fledged desktop Linux operating system. Hence, it is recommended (at least for beginners) to install Kali Linux using a virtual machine program like VMware.

With a virtual machine, you can use Kali Linux as a regular application in your Windows or Linux system. It’s almost the same as running VLC or Skype in your system.

There are a few free virtualization tools available for you. You can [install Kali Linux on Oracle VirtualBox][2] or use VMWare Workstation.

This tutorial focuses on VMWare.

### Installing Kali Linux on VMware on Windows and Linux

Non-FOSS alert!

VM Ware is not open source software.

For this tutorial, I presume that you are using Windows, considering most VMware users prefer using Windows 10/11.

However, the _**tutorial is also valid for Linux except the VMWare installation on Windows part**_. You can [easily install VMWare on Ubuntu][3] and other Linux distributions.

#### Step 1: Install VMWare Workstation Player (on Windows)

If you already have VMware installed on your system, you can skip the steps to install Kali Linux.

Head to [VMWare’s official workstation player webpage][4] and then click on the “**Download Free**” button.

![][5]

Next, you get to choose the version (if you want something specific or encountering bugs in the latest version) and then click on “**Go to Downloads.**“

![][6]

And then you get the download buttons for both Windows and Linux versions. You will have to click on the button for Windows 64-bit because that is what we need here.

![][7]

There is no support for 32-bit systems, in case you were wondering.

Finally, when you get the .exe file downloaded, launch it to start the installation process. You need to hit “Next” to get started installing VMware.

![][8]

Next, you will have to agree to the policies and conditions to continue.

![][9]

Now, you get to choose the path of your installation. Ideally, keep it at the default settings. But, if you need better keyboard response / in-screen keyboard performance in the virtual machine, you may want to enable the “**Enhanced Keyboard Driver**.”

![][10]

Proceeding to the next step, you can choose to disable checking for updates every time you start the program (can be annoying) and disable sending data to VMware as part of its user experience improvement program.

![][11]

If you want quick access using desktop and start menu shortcuts, you can check those settings or toggle them off, which I prefer.

![][12]

Now, you have to continue to start the installation.

![][13]

This may take a while, and when completed, you get greeted with another window that lets you finish the process and gives you the option to enter a license key. If you want to get the commercial license for your use-case, you need the VMware Workstation Pro edition, or else, the player is free for personal use.

![][14]

Attention!

Please make sure that virtualization is enabled in your system. Recent Windows versions require that you enable the virtualization explicitly to use virtual machines.

#### Step 2: Install Kali Linux on VMware

To get started, you need to download the image file of Kali Linux. And, when it comes to Kali Linux, they offer a separate ISO file if you plan to use it on a virtual machine.

![][15]

Head to its [official download page][16] and download the prebuilt VMware image available.

![][17]

You can download the **.7z** file directly or utilize Torrent (which is generally faster). In either case, you can also check the file integrity with the SHA256 value provided.

Once downloaded, you need to extract the file to any path of your choice.

![][18]

Open VMware Workstation Player and then click on “**Open a Virtual Machine**.” Now, look for the folder you extracted. And navigate through it till you find a file with the “**.vmx**” extension.

For instance: **Kali-Linux-2021.3-vmware-amd64.vmx**

![][19]

Select the .vmx file to open the virtual machine. And, it should appear right in your VMware player.

You can choose to launch the virtual machine with the default settings. Or, if you want to tweak the hardware allocated to the virtual machine, feel free to change the settings before you launch it.

![][20]

Depending on your computer hardware, you should allocate more memory and at least half of your processor cores to get a smooth performance.

In this case, I have 16 Gigs of RAM and a quad-core processor. Hence, it is safe to allocate nearly 7 GB of RAM and two cores for this virtual machine.

![][21]

While you can assign more resources, but it might affect the performance of your host operating system when working on a task. So, it is recommended to keep a balance between the two.

Now, save the settings and hit “**Play virtual machine**” to start Kali Linux on VMware.

When it starts loading up, you may be prompted with some tips to improve performance by tweaking some virtual machine settings.

You do not have to do that, but if you notice performance issues, you can disable side-channel mitigations (needed for enhanced security) to uplift the performance of the VM.

Also, you may be prompted to download and [install VMware tools for Linux][22]; you need to do this to get a good VM experience.

Once you do that, you will be greeted with Kali Linux’s login screen.

![][23]

Considering that you launched a prebuilt VMware folder, you need to enter the default login and password to proceed.

**Username**: kali
**Password:** kali

![][24]

That’s it! You’re done installing Kali Linux on VMware. Now, all you have to do is start exploring!

### Where to go from here?

Here are a few tips you can utilize:

  * If clipboard sharing and file sharing is not working, [install VMWare tools][22] on the guest system (Kali Linux).
  * If you are new to it, check out this [list of Kali Linux tools][25].



Feel free to share your thoughts if you find this tutorial helpful. Do you prefer to install Kali Linux without using a VMware image ready to go? Let me know in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-kali-linux-vmware/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linux-hacking-penetration-testing/
[2]: https://itsfoss.com/install-kali-linux-virtualbox/
[3]: https://itsfoss.com/install-vmware-player-ubuntu-1310/
[4]: https://www.vmware.com/products/workstation-player.html
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/vmware-player-download.png?resize=732%2C486&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/vmware-player-download-1.png?resize=800%2C292&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/vmware-player-download-final.png?resize=800%2C212&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/vmware-setup-1.png?resize=692%2C465&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/vmware-setup-license.png?resize=629%2C443&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/vmware-setup-2.png?resize=638%2C440&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/vmware-workstation-tracking.png?resize=618%2C473&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/vmware-workstation-shortcuts.png?resize=595%2C445&ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/vmware-player-install.png?resize=620%2C474&ssl=1
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/vmware-player-installed.png?resize=589%2C441&ssl=1
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/vmware-image-kali.png?resize=800%2C488&ssl=1
[16]: https://www.kali.org/get-kali/
[17]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/vmware-kali-linux-image-download.png?resize=800%2C764&ssl=1
[18]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/extract-vmware-image.png?resize=617%2C359&ssl=1
[19]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/vmware-kali-linux-image-folder.png?resize=800%2C498&ssl=1
[20]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/virtual-machine-settings-kali.png?resize=800%2C652&ssl=1
[21]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/kali-vm-settings.png?resize=800%2C329&ssl=1
[22]: https://itsfoss.com/install-vmware-tools-linux/
[23]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/kali-linux-vm-login.png?resize=800%2C540&ssl=1
[24]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/vmware-kali-linux.png?resize=800%2C537&ssl=1
[25]: https://itsfoss.com/best-kali-linux-tools/
