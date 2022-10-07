[#]: subject: "How to Install Ubuntu Linux in VMWare"
[#]: via: "https://itsfoss.com/install-ubuntu-in-vmware/"
[#]: author: "sreenath https://itsfoss.com/author/sreenath/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install Ubuntu Linux in VMWare
======
Brief: Software like VMWare gives an easy option to try and use Linux inside Windows. This article covers a step-by-step guide on installing Ubuntu inside VMWare in Windows.

Virtualization is a good way to try Linux from the comfort of Windows. WSL and WSL2 might be easier but not everyone has access to them. And for a relatively better desktop experience, a VM is better.

You may have to use Linux as part of the course curriculum, for some development tools (like Docker) or just for experimenting with Linux desktop before making the switch. VMWare and similar virtualization software can be of great help.

You don’t have to make actual changes to the disk partition, no changes in the boot and Linux runs like any other application inside Windows.

In this tutorial, I will show how to install Ubuntu inside Windows using VMWare.

### Installing Linux inside Windows using VMWare

Your actual operating system is called host OS and the operating system you install in the virtual machine is called guest OS. I’ll use this terminology in the tutorial here.

The virtual machines use your host OS’s system resources. Ubuntu GNOME requires 4 GB of RAM to function properly, your system should have 8 GB to allocate 4 GB to the guest OS (Ubuntu) and keep 4 GB for the host OS (Windows).

Let’s see all the requirements.

#### Requirements

* Good internet connection to download software and Linux ISO. (You can also use some other computer with an internet connection to download these files.)
* Windows system with at least 20 GB of free space. A 25GB+ Free space is good for installing the latest version of Ubuntu.
* Windows system with 8 GB of RAM. (It can work with less RAM as well, but your system will start to lag while using Linux in the virtual machine.)
* Make sure to enable virtualization in the BIOS

I am installing Ubuntu 22.04 in this tutorial, but the same steps apply to any other Linux distribution. If you prefer videos, you can watch the one below from [our YouTube channel][1].

#### Step 1: Download and install VMWare Player

Go to VMWare website and download the .exe file of VMWare Player. At the time of writing this article, VMWare player 16 is the latest version.

[Download VMWare][2]

Once downloaded, double-click the exe file and follow the on-screen instructions to install VMWare.

#### Step 2: Download the Linux ISO

Next, you need to download the ISO file of the Linux distribution. You can get this image from the official website of the Linux distribution you are trying to use.

I am using Ubuntu in this example, and you can download ISO images for Ubuntu from the link below:

[Download Ubuntu][3]

#### Step 3: Install Linux using VMWare

You have installed VMWare and you have downloaded the ISO for Linux. You are now set to install Linux in VMware.

Now, start VMWare and click on **Create New Virtual Machine**.

![Create new virtual machine in VMWare][4]

Select “I will install operating system later” option and press next.

![Select install operating system later button][5]

On the next screen, set the Operating system to Linux and the version to Ubuntu 64bit.

![Select Linux type and ubuntu 64 type][6]

Give the virtual machine a name and press Next.

![Name the virtual machine][7]

In the next screen, set the disk size to a minimum of 20 GB and also select “Store Virtual Disk as a single file” option.

![Select disk size and store as single file][8]

From the next screen, you can either press Finish and set ISO file later by right-clicking and Settings. Or you can select the ISO file on the go. For this, press “Customize Hardware” button.

![Press Customise Hardware button][9]

On this screen, you can tweak memory, processors, etc. But you need to select “New CD/DVD” button and add the Ubuntu ISO as shown in the screenshot:

![Set ISO image file from customize hardware dialog box][10]

Now, you can close this and press the finish button. Once done, you can now start the VMWare virtual machine and start the installation of Ubuntu.

![Select the virtual machine to start install][11]

Now, you can use it after installation by opening the virtual machine by name from VMWare home screen.

### Quick note about VMWare Easy install

This is another mode of installation in VMWare. Here, instead of pressing “ISO file later,” you can select the downloaded ISO file and start the process.

![Select disc install option for easy install][12]

But I found both the process almost the same because the installer asked for the same steps in the previous method here also.

### Installing Ubuntu in VMWare

Once the created machine is opened, you will get the Ubuntu boot screen.

![Ubuntu boot screen in VMWare][13]

You need to press enter on **Try or Install Ubuntu**. This will take you to a live environment. Here, you can either test the system before install or install it directly. Since it’s a VM, you can install it directly by pressing the **Install Ubuntu** button.

![Select install ubuntu to start installation process][14]

Next, you need to set your Keyboard Layout, which by default is set to English US.

![Select keyboard layout][15]

Ubuntu provides Normal and Minimal install options, with the former containing all of the essential software like office, media players, etc. In contrast, the latter will contain only essential utilities and a web browser. Also, there are several other choices, you can install third-party codecs, download updates while installing etc.

![Updates and other software preferences][16]

Once set, press **continue**. The next step is setting the installation. Several options are there, like erase and install, custom partition etc.

For the purpose of VM, you can accept the default (Erase and install) and proceed.

Don’t worry.**It won’t erase your disk on the host OS** (Windows). You created a virtual disk for it and that’s the disk it is taking about.

![Select installation type][17]

Once done with your settings, you can press the Install Now button. This will ask you to provide a time zone. Normally, it detects your time zone automatically. Otherwise, you can click on the region in the associated map to set your time zone.

![Set time zone][18]

Pressing Continue will ask you to provide user credentials like name, password etc. Provide them all and press Continue.

![Provide user credentials][19]

Now the installation will be started and once completed, you can start using Ubuntu by restarting the system.

![Press the restart button once the installation is completed][20]

This will prompt a message **Remove Installation Media and Press Enter**. The installation media that is the attached ISO is automatically removed once the installation is completed in VMWare. So, you can press enter here.

![Prompt to remove the installation disk][21]

If the iso is not removed automatically, you can remove the ISO by going to **Player > Removable Devices > CD/DVD**.

![VMWare player menu button][22]

Once done, you will have Ubuntu 22.04 installed inside VMWare.

![Ubuntu running inside VMWare in Windows][23]

### Wrapping Up

That’s all you need to do to install Linux in VMWare on Windows. If you have any doubts or if you encounter any issues, please feel free to ask your questions in the comment box below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-ubuntu-in-vmware/

作者：[sreenath][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sreenath/
[b]: https://github.com/lkxed
[1]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[2]: https://www.vmware.com/content/vmware/vmware-published-sites/us/products/workstation-player/workstation-player-evaluation.html.html
[3]: https://ubuntu.com/#download
[4]: https://itsfoss.com/wp-content/uploads/2022/10/create-new-virtual-machine-in-vm-ware.png
[5]: https://itsfoss.com/wp-content/uploads/2022/10/select-install-operating-system-later-button-1.png
[6]: https://itsfoss.com/wp-content/uploads/2022/10/select-linux-type-and-ubuntu-64-type.png
[7]: https://itsfoss.com/wp-content/uploads/2022/10/name-the-virtual-machine.png
[8]: https://itsfoss.com/wp-content/uploads/2022/10/select-disk-size-and-store-as-single-file.png
[9]: https://itsfoss.com/wp-content/uploads/2022/10/press-customise-hardware-button.png
[10]: https://itsfoss.com/wp-content/uploads/2022/10/set-iso-image-file-from-customize-hardware-dialog-box.png
[11]: https://itsfoss.com/wp-content/uploads/2022/10/select-the-virtual-machine-to-start-install.png
[12]: https://itsfoss.com/wp-content/uploads/2022/10/select-disc-install-option-for-easy-install.png
[13]: https://itsfoss.com/wp-content/uploads/2022/10/ubuntu-boot-screen-in-vmware.png
[14]: https://itsfoss.com/wp-content/uploads/2022/10/select-install-ubuntu-to-start-installation-process.png
[15]: https://itsfoss.com/wp-content/uploads/2022/10/select-keyboard-layout.png
[16]: https://itsfoss.com/wp-content/uploads/2022/10/updates-and-other-software-preferences.png
[17]: https://itsfoss.com/wp-content/uploads/2022/10/select-installation-type.png
[18]: https://itsfoss.com/wp-content/uploads/2022/10/set-time-zone.png
[19]: https://itsfoss.com/wp-content/uploads/2022/10/provide-user-credentials.png
[20]: https://itsfoss.com/wp-content/uploads/2022/10/press-restart-button-once-installation-is-completed.png
[21]: https://itsfoss.com/wp-content/uploads/2022/10/prompt-to-remove-the-installation-disk.png
[22]: https://itsfoss.com/wp-content/uploads/2022/10/vmware-player-menu-button.png
[23]: https://itsfoss.com/wp-content/uploads/2022/10/ubuntu-running-inside-vmware-in-windows.webp
