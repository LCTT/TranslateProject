Minimal Linux Live
================================================================================
Minimal Linux Live is a set of Linux shell scripts which automatically build minimal Live Linux OS based on Linux [kernel][1] and [BusyBox][2]. All necessary source codes are automatically downloaded and all build operations are fully encapsulated in the scripts. 

If you want to build your own Minimal Linux Live ISO image file, all you need to do is the following: 

- Get the latest scripts from the [download][3] section.
- Extract the scripts to some folder.
- Make sure that all scripts are executable (chmod +x *.sh).
- Depending on which Linux OS you are using, there might be one or more (or none, or even more) build dependencies that you need to resolve before you start the build process. If you work with Ubuntu, the following commands should resolve all necessary build dependencies: 

----------

    sudo apt-get install wget
    sudo apt-get install make
    sudo apt-get install gcc
    sudo apt-get install bc
    sudo apt-get install syslinux
    sudo apt-get install genisoimage

- Execute the script **build_minimal_linux_live.sh** and wait. If you have resolved all build dependencies, the whole process should take less than 30 minutes on a modern computer. If the build fails for some reason, most probably there are unresolved build dependencies. Several users reported that the build-essential package resolves all unexpected build dependencies for Ubuntu. If you are using Linux Mint try to install the package g++ and if you still have troubles then try the build-essential package. On Fedora you might need the static 'glibc' package glibc-static. 

  Please have in mind that the build dependencies can vary a lot depending on the Linux OS which you use and the software which you have already installed.

  If you still have troubles then examine the failure message and google it. If you are unable to find solution, then you can ask someone more experienced Linux guru (if you know any) or as alternative you can contact me. Please, make sure that you have researched your problem in advance before you send me your question. 

- When the scripts finish their job you will find newly created **minimal_linux_live.iso** in the same folder where you executed the scripts. You can burn the ISO image file on CD/DVD, install it on USB flash drive via [Universal USB Installer][4], or run it directly via PC emulator like [VirtualBox][5]. 

The produced ISO image file contains Linux kernel compiled with default options, BusyBox compiled with default options and very simple initramfs. This means that you don't get Windows support out of the box, nor you get any fancy desktop environment. All you get is a simple shell console which supports all BusyBox applets and... well, that's all. This is why it's called "minimal".

The good news is that even though the OS is small and simple, the build scripts are also very small and very simple. You can quite easily learn from the scripts and later modify them to include more stuff (I encourage you to do so). After you learn the basics you will have all the necessary tools and skills to create your own fully functional Linux based operating system! Entirely from scratch! Isn't it great?! :)

The tutorial provides more details about the inner structure of the scripts and the overall build process. I encourage you to go through this document when you have the time.

Below you can find several screenshots which show what the environment looks like when you boot your newly generated Minimal Linux Live OS. 

![](http://minimal.linux-bg.org/images/screen1.png)

![](http://minimal.linux-bg.org/images/screen2.png)

![](http://minimal.linux-bg.org/images/screen3.png)

--------------------------------------------------------------------------------

via: http://minimal.linux-bg.org/

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://kernel.org/
[2]:http://busybox.net/
[3]:http://minimal.linux-bg.org/#
[4]:http://www.pendrivelinux.com/
[5]:http://virtualbox.org/