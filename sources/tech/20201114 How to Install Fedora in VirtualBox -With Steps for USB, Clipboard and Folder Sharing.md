[#]: collector: (lujun9972)
[#]: translator: (frogOAO)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install Fedora in VirtualBox [With Steps for USB, Clipboard and Folder Sharing])
[#]: via: (https://itsfoss.com/install-fedora-in-virtualbox/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

How to Install Fedora in VirtualBox [With Steps for USB, Clipboard and Folder Sharing]
======

If you are curious about Fedora Linux, there are several ways to try it.

The easiest way that won’t affect your current operating system is to [create a live USB of Fedora.][1]

An alternative way to try Fedora, is to get advantage of virtualization technology through an installation in VirtualBox. This way, you use Fedora like an application on your current operating system.

This way, you can perform more thorough testing without messing up your current operating system.

You can even copy your virtual setup and re-install it on some other system. Sounds handy? Let me show you how to do it.

### Installing Fedora in VirtualBox

![][2]

Let’s see the steps for installing Fedora Linux in Oracle VirtualBox.

#### Step 1: Install VirtualBox

If you haven’t already installed VirtualBox on your system, you can download it from the official website. You can find instructions for Windows, Mac OS and Linux. [Ubuntu users can refer to this detailed tutorial on installing VirtualBox][3].

![][4]

[Download VirtualBox][5]

#### **Step 2: Download the Fedora ISO**

If you are not familiar with fedora, there are a few images to be aware of.

[Fedora IoT][6] is to be used for scalable infrastructure, [Fedora workstation][7] is an image with a set of tools oriented for a desktop in a vanilla GNOME desktop environment and [Fedora server][8] as its name reveals, is tailored for a server or data center.

If GNOME isn’t your first choice, you can download a [spin][9] of Fedora desktop with an alternative desktop environment. For this tutorial, I chose [Fedora 33][10] with the GNOME desktop environment.

[Download Fedora][11]

#### Step 3: Create an empty virtual machine and configure it

Fedora requires a minimum of 20GB disk space &amp; 2GB RAM, to install and run successfully. Although double those amounts is recommended for a smoother user experience. Based on that I will create and configure the virtual machine.

Start Virtual Box and click on New.

![Create a new virtual machine][12]

The most important option to pay attention, is the **type to be set to Linux and the version to Fedora (64-bit)**. If you start typing Fedora at the name prompt, VirtualBox will automatically pick the correct settings for you. Although the name doesn’t have to be Fedora, it can be anything you like.

_If you have access to 32-bit version only, you need to enable virtualization technology on BIOS, if you have an AMD CPU it is called SVM. Worst-case scenario is that your CPU doesn’t support virtualization technology. If you are not sure, check this first._

Once you have similar settings with me, click on the create button.

![Name your VM and assign it at least 3 GB RAM][13]

As mentioned before, you need at least 20 GB of disk space to be able to install Fedora. I have 32 GB of RAM on my system so I assigned 8 GB here. You should be fine with 3 GB of RAM.

A word about RAM consumption, the RAM will only be consumed by the virtual machine when you are running it. Otherwise, it will be available for regular usage.

Make sure that the rest of the settings match the example and click Create.

![Assign 15-20 GB of disk space in VDI format][14]

Before you click the start button of your virtual machine, you need to load the ISO as shown below [Optical Drive].

![Add the Fedora ISO to optical drive storage][15]

As your virtual hard drive is empty, the virtual machine will boot from this ISO. Think of it as using a live USB or disk for installing Linux.

![Go to Settings and add ISO as optical drive][16]

Then, if you have a multi-core CPU it is recommended to assign 2 or more cores for your virtual machine. You may find the CPU cores under the system tab. When you configure your system click ok and start the virtual machine.

![Optional step: Assign number of CPU cores][17]

Once you have configured everything, click on the start button to begin the installation.

#### Step 4: Install Fedora in VirtualBox

If you have followed the process correctly, when you start the virtual machine you will boot directly from the ISO file. When you see a similar to below screen select Start Fedora, and press the enter key.

![Fedora running in live environment in virtual machine][18]

To start the installation dialog box, click on Install to Hard Drive.

![Click on “install to hard drive”][19]

Before you proceed to the installation, it is essential to define your keyboard layout, your timezone and finally where the operating system will be installed.

![Choose keyboard, time and date and then go to Installation Destination][20]

The partitioning process is straight forward. You made some free space as VDI earlier. It should be automatically recognized.

Select your disk and set the storage configuration to automatic. Click on Done to go to the previous dialog box.

![Disk should be automatically recognized][21]

Once you have configured the above, click on “Begin Installation”.

![Begin installation of Fedora][22]

Now you just need to wait for five-six minutes for installation completion. Click on the “Finish installation” button when installation is finished.

As a last step, you need to power off your system. If you are unfamiliar with the GNOME desktop environment you can do it like so.

![Turn off Fedora live environment after installation][23]

You have to manually unload the ISO file that you loaded at the initial steps.

![Remove Fedora ISO From Optical Drive][24]

The next time you start the virtual machine with Fedora, you will be prompted to create a user account and set your password for Fedora Linux.

### Use VirtualBox guest additions for additional features like clipboard sharing, folder sharing and more

[Guest Additions][25] are designed to be installed inside a virtual machine post installation of the guest operating system. They contain device drivers and system applications that optimize the guest operating system for better performance and usability.

The Guest Additions ISO file is mounted as a virtual CD-ROM in order to be installed.

This is a straightforward process. Simply click on the devices tab and then click on “Insert Guest Additions CD image”

![][26]

You will be prompted to download the guest additions image, when prompt click on Download.

![Install VirtualBox Guest Additions][27]

#### **Shared clipboard**

At some point you’ll need to move some content between your virtual machine and the host operating system. The shared clipboard/drag and drop support will allow you to copy items on one platform and paste them on the other.

To enable this feature, choose **Settings** on the VirtualBox home page and follow the instructions as below. I find the **Bidirectional** option the most convenient.

![Enable clipboard sharing between guest and host systems][28]

#### **Shared folders**

There are two types of shares:

  * Permanent shares, that are saved with the Virtual Machine settings.
  * Transient shares, that are disappear when the Virtual Machine is powered off. These can be created using a checkbox in the VirtualBox Manager.



In this tutorial, I will make a permanent shared folder. In the VM settings add the host system folder you want to share and choose the name that you want to appear at your VM.

![][29]

The next time you start the virtual machine, the folder should appear as a network drive.

![][30]

#### **Better video support**

While the virtual graphics card which Oracle VirtualBox provides all the basic features, the custom video drivers that are installed with the Guest Additions provide you with extra high and non-standard video modes, as well as accelerated video performance.

Using Guest Additions, the guest OS’s resolution will dynamically resize as you adjust the VirtualBox window on your computer.

Finally, Guest Additions can take advantage of your computer’s graphics card. If you’re a gamer or using productivity software in a WM, this makes a huge difference.

#### USB and Network Devices sharing

With VirtualBox, users have the ability to use a fully-functional operating system, without having to do the setup on different hardware. However, sharing USB and network devices between the host and guest machine is not as straightforward as it should be.

To access USB devices, you will need to install [the VirtualBox extension pack][31].

![Install VirtualBox Extensions pack][32]

_**This is for Linux only**_ because I am using all this in Linux.

In order for VirtualBox to have access to the USB subsystem, the user (on host system) running VirtualBox must belong to the vboxuser group. To do this, open up a terminal and issue the following command:

```
sudo usermod -aG vboxusers 'your username'
```

Once you run the command, you should either log out and log back in, or restart your host machine.

At this step, plug in your USB stick and through your VM settings you should be able to find and add the medium as shown at the example.

![][33]

Your USB will be accessible the next time you start your virtual machine.

![][34]

### Bonus Tip: Save and export the Virtual Machine so that you can use it later on any system

You may want to use your virtual machine to another computer or it is time to build a new machine and you need to keep your virtual machine as it is. You can easily export your current setup and import it to another machine at a few easy steps.

At the VirtualBox home panel, click on file and the export appliance. If you prefer keyboard shortcuts, you can simply click **Ctrl+E**.

![][35]

Choose the virtual machine you want to export and click on next.

![][36]

The Format option needs some attention. There are three different options of Open Virtualization Format 0.9, 1.0 and 2.0, which can be either ovf or ova extensions.

With ovf extension, several files will be written separately, compared to ova extension, which combines all the files into one Open Virtualization Format archive.

The default format, Open Virtualization Format 1.0, should be fine.

![][37]

To finish the process, click next and at the next dialog box click export.

#### Conclusion

By using a virtual machine you can’t just test an operating system but deploy a fully functioning system, equally comparable to a physical machine. Nowadays, hardware has become so powerful and affordable that most of its power is not being utilized.

Through virtualization technology, you can use those wasted resources. The need for physical machines is reduced, and consequently the energy consumption is less. You can save money both from hardware and reduced running costs.

On a larger scale, server virtualization is more of a basic requirement than an advanced concept.

I hope you found this tutorial helpful in installing Fedora Linux in VirtualBox. If you face any issues, please let me know in the comments.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-fedora-in-virtualbox/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/create-fedora-live-usb-ubuntu/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/install-fedora-in-virtualbox.png?resize=800%2C450&ssl=1
[3]: https://itsfoss.com/install-virtualbox-ubuntu/
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/download-virtulabox.jpg?resize=799%2C294&ssl=1
[5]: https://www.virtualbox.org/
[6]: https://getfedora.org/en/iot/
[7]: https://getfedora.org/en/workstation/
[8]: https://getfedora.org/en/server/
[9]: https://spins.fedoraproject.org/
[10]: https://itsfoss.com/fedora-33/
[11]: https://getfedora.org/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/0.-create-a-new-vm.png?resize=800%2C550&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/1-create-vm-fedora.png?resize=800%2C533&ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/10/2-fedora-vm-disk.png?resize=800%2C533&ssl=1
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/fedora-vm-settings-iso.png?resize=800%2C640&ssl=1
[16]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/3-fedora-vm-settings2.png?resize=800%2C600&ssl=1
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/10/4-fedora-vm-cpu.png?resize=800%2C533&ssl=1
[18]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/6-fedora-vm-boot.png?resize=800%2C600&ssl=1
[19]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/7-fedora-vm-install-1.png?resize=800%2C622&ssl=1
[20]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/9-fedora-vm-partitioning-2.png?resize=800%2C706&ssl=1
[21]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/10-fedora-vm-hdd.png?resize=732%2C645&ssl=1
[22]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/12-fedora-vm-installation-1.png?resize=800%2C706&ssl=1
[23]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/15-power-off-fedora-gnome.png?resize=800%2C706&ssl=1
[24]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/remove-fedora-iso-from-optical-drive.png?resize=800%2C589&ssl=1
[25]: https://www.virtualbox.org/manual/ch04.html
[26]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/16-Fedora-vm-guest-additions.png?resize=800%2C706&ssl=1
[27]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/17-Fedora-vm-guest-additions.png?resize=800%2C686&ssl=1
[28]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/19-fedora-vm-shared-clipboard-2.png?resize=800%2C650&ssl=1
[29]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/20-fedora-vm-shared-folders-1.png?resize=800%2C650&ssl=1
[30]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/22-fedora-vm-shared-folders2-1.png?resize=800%2C547&ssl=1
[31]: https://download.virtualbox.org/virtualbox/6.1.16/Oracle_VM_VirtualBox_Extension_Pack-6.1.16.vbox-extpack
[32]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/21.-fedora-vm-extension-pack.png?resize=800%2C600&ssl=1
[33]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/25.-fedora-vm-usb-1.png?resize=800%2C527&ssl=1
[34]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/26.-fedora-vm-usb-1.png?resize=800%2C578&ssl=1
[35]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/23.-fedora-vm-export.png?resize=800%2C600&ssl=1
[36]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/24.-fedora-vm-export-1.png?resize=800%2C545&ssl=1
[37]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/25.-fedora-vm-export-800x545.png?resize=800%2C545&ssl=1
