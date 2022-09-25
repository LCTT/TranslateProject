[#]: subject: "How to Install Fedora Linux in Oracle VirtualBox"
[#]: via: "https://www.debugpoint.com/install-fedora-virtualbox/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install Fedora Linux in Oracle VirtualBox
======
I will show you in this guide how easy it is to install Fedora Linux (all the latest versions) in Oracle’s VirtualBox.

VirtualBox is a popular virtual machine application that helps you try out different operating systems (such as Linux and Windows) without physically installing them into your hardware.

This tutorial primarily focuses on how you can install Fedora Linux in Oracle VirtualBox.

### Things that you need before installing

* First and foremost, you must install VirtualBox in your Linux/Windows system (also called the host system). Here’s some guide(s) for your on [how you can install VirtualBox][1].

* Second, you must download the Fedora Linux (Workstation or any other official spins) ISO image file. You can download it from the official Fedora Download (Or Torrent).

* That’s all you need to get started.

### Install Fedora Linux in Virtual Box

* Open VirtualBox from the application menu of your host system. In the main window, click NEW.

![Click on New][2]

* Click on the Expert Mode button.

![Click on Expert Mode][3]

* In the next window, follow the below instructions to fill in the items.  * Name: Give any name you want. E.g. “fedora-linux”.  * Machine Folder: This is where the VirtualBox (*.vdi) file will be created. The default path is in your home directory. However, you can select other partitions for your vdi file (such as external disk, etc.).  * Type and Version: Should be auto-selected. If not, choose “Linux” and “Fedora 64-bit”.  * Memory size: This is the RAM size your VirtualBox install of Fedora will use while running. So, the size you give here will not be available to your host machine when you are running Fedora under VirtualBox. So, enter the value accordingly. If you are unsure, give at least 2 to 4GB minimum RAM.  * Hard disk: Select the option “Create a virtual hard disk now”.
* Click create.

![Provide options for Fedora in VirtualBox][4]

* In the final screen, verify the file location.   * This is the place where VirtualBox will create the disk image with .vdi extension.  * File size should be as per your choice. For this example, I have used 20GB of disk space for Fedora installation.  * Hard disk file type – choose VDI. You may want to choose other options (if you know what they mean).  * Storage on the physical disk – choose as Dynamically allocated. Note: If you choose Fixed size, the entire 20 GB will be allocated immediately.
* Click create.

![Specify disk space for Fedora Linux in VirtualBox][5]

* After you hit Create, you should be back on the main window. You should see on the left side bar a label “powered off” virtual machine – which you just created. The next step is to select the Fedora Linux ISO file which you have just downloaded.
* To do that, Click on the “[Optical Drive]” label under Storage: Controller IDE section as shown below. And select the ISO File.

![Select the Fedora Linux ISO file][6]

* Now, click on START at the top toobar to start booting up from the selected ISO file.
* You should see the Fedora Linux installation prompt as shown below.

![Fedora Linux installation in VirtualBox][7]

* Continue with the normal Fedora Linux installation as you do.
* Once installed, you can always START, STOP the virtual machine from the tool bar. To delete, right-click on the virtual machine name and choose delete data option.

### Post-installation

* After you finish the installation, do remember to [install the Guest additions using this guide][8]. This will enable the copy/paste and additional configuration options between host and guest machine.
* Also, you can enable the bi-directional clipboard, drag and drop between host and guest using the below – `Settings > General > Advanced`.
* To make sure the resolution of your virtual machine is same as the host system, enable the option `View > Auto resize guest display`.

![Settings for bi-directional items][9]

![Auto resolution for guest][10]

### Wrapping Up

In this guide, you learned how to create a simple Virtual machine installation with Fedora Linux using Oracle VirtualBox. In addition, you also understand you how you can use the copy/paste, change resolutions and so on.

Finally, I hope this helps you to set up your Fedora system. Do let me know in the comment box if you have any questions or having issues.

Cheers.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/install-fedora-virtualbox/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/oracle-virtualbox-install-fedora/
[2]: https://www.debugpoint.com/wp-content/uploads/2022/09/Click-on-New.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2022/09/Click-on-Expert-Mode.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2022/09/Provide-options-for-Fedora-in-VirtualBox.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2022/09/Specify-disk-space-for-Fedora-Linux-in-VirtualBox.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2022/09/Select-the-Fedora-Linux-ISO-file.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2022/09/Fedora-Linux-installation-in-VirtualBox-1024x431.jpg
[8]: https://www.debugpoint.com/virtualbox-guest-additions-fedora/
[9]: https://www.debugpoint.com/wp-content/uploads/2022/09/Settings-for-bi-directional-items.jpg
[10]: https://www.debugpoint.com/wp-content/uploads/2022/09/Auto-resolution-for-guest.jpg
