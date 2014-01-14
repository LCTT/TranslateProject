How to Dual Boot Ubuntu and Windows Properly
================================================================================
**Despite what Microsoft would have you believe, a Linux and a Windows operating system can coexist peacefully on the same PC. This is a tutorial that will teach you how to get an Ubuntu system to run in parallel with a Windows OS.**

![](http://i1-news.softpedia-static.com/images/news2/How-to-Dual-Boot-Ubuntu-and-Windows-Properly-415377-2.jpg)

There are two situations that you must consider, and you have to decide which one applies to you. This has to do with the order of the installation. Installing Windows after you already have an Ubuntu system is a little bit problematic, because Microsoft doesn't really care about other users.

If you install Ubuntu after you already have Windows installed, things are a lot simpler and virtually no work or preparation is required.

Let’s get on with the more difficult problem. If you have an Ubuntu system and you want to install Windows, you will lose GRUB, which is the default bootloader. Windows doesn’t really care and will erase it.

If you made this mistake and you didn't overwrite the Linux partition, don't despair. The data is still there and all you need is a bootable live CD with Ubuntu (up until 13.10). You will need to install an application called Boot-Repair. This is done with a PPA.

Remember, if you use a USB stick, it's quite easy to install applications because Ubuntu is a hybrid image. Boot the live Ubuntu session, open a terminal, and enter the following commands:

    sudo add-apt-repository ppa:yannubuntu/boot-repair && sudo apt-get update
    sudo apt-get install -y boot-repair && (boot-repair &)

Open the application, click recommended repair, and wait. When it's finished, reboot, and you will get GRUB back and dual boot.

On the other hand, if you already have Windows and you want to install Ubuntu, things are a lot easier. Start the Ubuntu installation, choose to install on a partition that's not Windows, format to EXT4, choose the location of the bootloader, and it's done.

If you choose to place the bootloader on the same hard drive as the Windows installation, it will erase the Microsoft's bootloader. This is ok because GRUB recognizes the Windows OS and you won't miss it. If you place it somewhere else, on another hard-drive for example, you will get both of them when you choose to boot from different hard drives.

Enjoy your Ubuntu and Windows dual boot system.

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/How-to-Dual-Boot-Ubuntu-and-Windows-Properly-415377.shtml

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出