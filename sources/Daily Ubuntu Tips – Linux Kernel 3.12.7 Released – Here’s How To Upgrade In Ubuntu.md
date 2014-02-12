    Vic020的坑
Daily Ubuntu Tips – Linux Kernel 3.12.7 Released – Here’s How To Upgrade In Ubuntu
================================================================================
Linux Kernel version 3.12.7 mainline has just been released and this brief tutorial is going to show you how to easily upgrade in Ubuntu. If you’re running Ubuntu 13.10 and below, chances are your system doesn’t have this latest kernel installed.

The Linux Kernel is the core of the Linux Operating System that includes Ubuntu. The kernel makes it possible for Ubuntu to communicate with your system hardware (Memory, CPU, Drives, etc). The kernel manages resources and handles all essential the parts of your machine.

Without the Linux Kernel, Ubuntu is only bunch of fancy applications without access to the hardware or essential parts of your machine. That’s why the Linux Kernel is so important.

### Why Upgrade Your Ubuntu Kernel? ###

The first thing to understand before upgrading your system’s kernel is that it could break your system and make it unusable. In fact, it’s not recommended to upgrade the kernel on your own. Canonical, the parent company of Ubuntu does a great job updating the kernel in Ubuntu.

They test and make sure the kernel installed is compatible with that edition of Ubuntu before releasing it. So, if your machine is working fine without issues, you should keep the current installed kernel.

On the other hand, if Ubuntu isn’t able to recognize all your system’s components or your machines isn’t functioning correctly, upgrading the Linux Kernel might just help.

That’s because newer kernels add newer drivers and features for newer machines.. If the current installed kernel doesn’t support some features on your machine, you should upgrade.

For more about kernel 2.12.7, [read the ChangeLog here][1].

### Upgrading The Linux Kernel. ###

To upgrade your kernel, run the commands below to update all packages and existing kernels. 

    sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get autoremove

After updating your machine, restart your machine. It’s always good to restart after upgrading your system packages and kernel. Doing so allows for newer kernels to be applied.

Next, run the commands below to download Linux Kernel 3.12.7. 

#### For 32-bit Machines, run the commands below. ####

    cd /tmp && wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12.7-trusty/linux-headers-3.12.7-031207-generic_3.12.7-031207.201401091657_i386.deb http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12.7-trusty/linux-headers-3.12.7-031207_3.12.7-031207.201401091657_all.deb http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12.7-trusty/linux-image-3.12.7-031207-generic_3.12.7-031207.201401091657_i386.deb

#### For 64-bit System, run the commands below ####

    cd /tmp && wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12.7-trusty/linux-headers-3.12.7-031207-generic_3.12.7-031207.201401091657_amd64.deb http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12.7-trusty/linux-headers-3.12.7-031207_3.12.7-031207.201401091657_all.deb http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12.7-trusty/linux-image-3.12.7-031207-generic_3.12.7-031207.201401091657_amd64.deb

After downloading the version for your system, run the commands below to install it.

    sudo dpkg -i *.deb

After installing, restart your machine and if everything went as described above, your system should have the latest stable kernel version installed.

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/linuxkernel3127.jpg)

To uninstall kernel version 3.12.7, run the commands below.

    sudo apt-get remove linux-headers-3.12.7-* linux-image-3.13.7-*

Enjoy!
--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/01/daily-ubuntu-tips-linux-kernel-3-12-7-released-heres-how-to-upgrade-in-ubuntu/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://www.kernel.org/pub/linux/kernel/v3.x/ChangeLog-3.12.7
