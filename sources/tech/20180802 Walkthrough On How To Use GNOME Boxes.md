Walkthrough On How To Use GNOME Boxes
======

![](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/how-to-use-gnome-boxes_orig.jpg)

Boxes or GNOME Boxes is a virtualization software for GNOME Desktop Environment. It is similar to Oracle VirtualBox but features a simple user interface. Boxes also pose some challenge for newbies and VirtualBox users, for instance, on VirtualBox, it is easy to install guest addition image through menu bar but the same is not true for Boxes. Rather, users are encouraged to install additional guest tools from the terminal program within the guest session.

This article will provide a walkthrough on how to use GNOME Boxes by installing the software and actually setting a guest session on the machine. It will also take you through the steps for installing the guest tools and provide some additional tips for Boxes configuration.

### Purpose of virtualization

If you are wondering what is the purpose of virtualization and why most computer experts and developers use them a lot. There is usually a common reason for this: **TESTING**.

Developers who use Linux and writes software for Windows has to test his program on an actual Windows environment before deploying it to the end users. Virtualization makes it possible for him to install and set up a Windows guest session on his Linux computer.

Virtualization is also used by ordinary users who wish to get hands-on with their favorite Linux distro that is still in beta release, without installing it on their physical computer. So in the event the virtual machine crashes, the host is not affected and the important files & documents stored on the physical disk remain intact.

​Virtualization allows you to test a software built for another platform/architecture which may include ARM, MIPS, SPARC, etc on your computer equipped with another architecture such as Intel or AMD.

### Installing GNOME Boxes

Launch Ubuntu Software and key in " gnome boxes ". Click the application name to load its installer page and then select the Install button. [![install gnome boxes](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-gnome-boxes_orig.jpg)][1] 

### Extra setup for Ubuntu 18.04

There's a bug in GNOME Boxes on Ubuntu 18.04; it fails to start the Virtual Machine (VM). To remedy that, perform the below two steps on a terminal program:

1.  Add the line "group=kvm" to the qemu config file sudo gedit /etc/modprobe.d/qemu-system-x86.conf

2.  Add your user account to kvm group sudo usermod -a -G kvm ﻿​

 [![gnome boxes extras for ubuntu 18.04](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/gnome-boxes-extras-for-ubuntu-18-04_orig.jpg)][2] 
 
 After that, logout and re-login again for the changes to take effect.

#### Downloading an image file

You can download an image file/Operating System (OS) from the Internet or within the GNOME Boxes setup itself. However, for this article we'll proceed with the realistic method ie., downloading an image file from the Internet. We'll be configuring Lubuntu on Boxes so head over to this website to download the Linux distro.

[Download][3]

#### To burn or not to burn

If you have no intention to distribute Lubuntu to your friends or install it on a physical machine then it's best not to burn the image file to a blank disc or portable USB drive. Instead just leave it as it is, we'll use it for creating a VM afterward.

#### Starting GNOME Boxes

Below is the interface of GNOME Boxes on Ubuntu - [![create gnome boxes](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/create-gnome-boxes_orig.jpg)][4] 

The interface is simple and intuitive for newbies to get familiar right away without much effort. Boxes don't feature a menu bar or toolbar, unlike Oracle VirtualBox. On the top left is the New button to create a VM and on the right houses buttons for VM options; delete list or grid view, and configuration (they'll become available when a VM is created).

### Installing an Operating System

Click the New button and choose "Select a file". Select the downloaded Lubuntu image file on the Downloads library and then click Create button.

 [![install os on ubuntu guest box](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-os-on-ubuntu-guest-box_orig.jpg)][5] 

In case this is your first time installing an OS on a VM, do not panic when the installer pops up a window asking you to erase the disk partition. It's safe, your physical computer hard drive won't be erased, only that the storage space would be allocated for your VM. So on a 1TB hard drive, if you allocate 30 GB for your VM, performing erase partition operation on Boxes would only erase that virtual 30 GB storage drive and not the physical storage.

 _Usually, computer students find virtualization a useful tool for practicing advanced partitioning using UNIX based OS. You can too since there is no risk that would tamper the main OS files._  

After installing Lubuntu, you'll be prompted to reboot the computer (VM) to finish the installation process and actually boot from the hard drive. Confirm the operation.

​

Sometimes, certain Linux distros hang in the reboot process after installation. The trick is to force shutdown the VM from the options button found on the top right side of the tile bar and then power it on again.

#### Set up Guest tools

By now you might have noticed Lubuntu's screen resolution is small with extra black spaces on the left and right side, and folder sharing is not enabled too. This brings up the need to install guest tools on Lubuntu.

​

Launch terminal program from the guest session (not your host terminal program) and install the guest tools using the below command:

sudo apt install spice-vdagent spice-webdavd﻿

After that, reboot Lubuntu and the next boot will set the VM to its appropriate screen resolution; no more extra black spaces on the left and right side. You can resize Boxes window and the guest screen resolution will automatically resize itself.

 [![lubuntu on gnome boxes](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/lubuntu-on-gnome-boxes_orig.jpg)][6] 

To share a folder between the host and guest, open Boxes options while the guest is still running and choose Properties. On the Devices & Shares category, click the + button and set up the name. By default, Public folder from the host will be shared with the guest OS. You can configure the directory of your choice. After that is done, launch Lubuntu's file manager program (it's called PCManFM) and click Go menu on the menu bar. Select Network and choose Spice Client Folder. The first time you try to open it a dialog box will pop up asking you which program should handle the network, select PCManFM under Accessories category and the network will be mounted on the desktop. Launch it and there you'll see your shared folder name.

​Now you can share files and folders between host and guest computer. Subsequent launch of the network will directly open the shared folder so you don't have to open the folder manually the next time.

 [![gnome boxes guest addition](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/gnome-boxes-guest-addition_orig.jpg)][7] 

#### Where's the OS installed?

Lubuntu is installed as a VM using **GNOME Boxes** but where does it store the disk image?

This question is of particular interest for those who wish to move the huge image file to another partition where there is sufficient storage. The trick is using symlinks which is efficient as it saves more space for Linux root partition and or home partition, depending on how the user set it up during installation. Boxes stores the disk image files to ~/.local/share/gnome-boxes/images folder

### Conclusion

We've successfully set up Lubuntu as a guest OS on our Ubuntu. You can try other variants of Ubuntu such as Kubuntu, Ubuntu MATE, Xubuntu, etc or some random Linux distros which in my opinion would be quite challenging due to varying package management. But there's no harm in wanting to :) You can also try installing other platforms like Microsoft Windows, OpenBSD, etc on your computer as a VM. And by the way, don't forget to leave your opinions in the comment section below.


--------------------------------------------------------------------------------

via: http://www.linuxandubuntu.com/home/walkthrough-on-how-to-use-gnome-boxes

作者：[linuxandubuntu][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxandubuntu.com
[1]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-gnome-boxes_orig.jpg
[2]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/gnome-boxes-extras-for-ubuntu-18-04_orig.jpg
[3]:https://lubuntu.net/
[4]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/create-gnome-boxes_orig.jpg
[5]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-os-on-ubuntu-guest-box_orig.jpg
[6]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/lubuntu-on-gnome-boxes_orig.jpg
[7]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/gnome-boxes-guest-addition_orig.jpg
