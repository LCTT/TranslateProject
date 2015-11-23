translation by  strugglingyouth

How to Install NVIDIA 358.16 Driver in Ubuntu 15.10, 14.04
================================================================================
![nvidia-logo-1](http://ubuntuhandbook.org/wp-content/uploads/2015/06/nvidia-logo-1.png)

[NVIDIA 358.16][1], the first stable release in NVIDIA 358 series, has been announced with some fixes to 358.09 (Beta) and other small features.

NVIDIA 358 added a new **nvidia-modeset.ko** kernel module that works in conjunction with the nvidia.ko kernel module to program the display engine of the GPU. In a later driver release, the **nvidia-modeset.ko** kernel driver will be used as a basis for the mode-setting interface provided by the kernel’s direct rendering manager (DRM).

Thew new driver also has new GLX protocol extensions and a new system memory allocation mechanism for large allocations in the OpenGL driver. New GPUs **GeForce 805A** and **GeForce GTX 960A** are supported. NVIDIA 358.16 also supports X.Org Server 1.18 and OpenGL 4.3

### How to Install NVIDIA 358.16 in Ubuntu: ###

> Please don’t do it on production machines unless you know what you’re doing and how to undo it.

For the official binaries, please go to [nvidia.com/object/unix.html][1].

For those who prefer an Ubuntu PPA, I’d recommend the [Graphics Drivers PPA][2]. So far, Ubuntu 16.04, Ubuntu 15.10, Ubuntu 15.04, Ubuntu 14.04 are supported.

**1. Add PPA.**

Open terminal from Unity Dash, App Launcher, or via Ctrl+Alt+T shortcut key. When it opens, paste below command and hit enter:

    sudo add-apt-repository ppa:graphics-drivers/ppa

![nvidia-ppa](http://ubuntuhandbook.org/wp-content/uploads/2015/08/nvidia-ppa.jpg)

Type your password when it asks. No visual feedback, just type in mind and hit Enter to continue.

**2. Refresh and install new driver.**

After adding PPA, run below commands one by one to refresh repository cache and install new driver packages:

    sudo apt-get update
    
    sudo apt-get install nvidia-358 nvidia-settings

### (Optional) Uninstall: ###

Boot into the recovery mode from the grub menu, and drop into root console. Then run below commands one by one:

Remount the file system as writable:

    mount -o remount,rw /

Remove all nvidia packages:

    apt-get purge nvidia*

Finally back to menu and reboot:

    reboot

To disable/remove the graphics driver PPA, launch **Software & Updates** and navigate to **Other Software** tab.

--------------------------------------------------------------------------------

via: http://ubuntuhandbook.org/index.php/2015/11/install-nvidia-358-16-driver-ubuntu-15-10/

作者：[Ji m][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ubuntuhandbook.org/index.php/about/
[1]:http://www.nvidia.com/Download/driverResults.aspx/95921/en-us
[2]:http://www.nvidia.com/object/unix.html
[3]:https://launchpad.net/~graphics-drivers/+archive/ubuntu/ppa
