translating by owen
How to Install Windows 8.1 and Ubuntu 14.04 LTS on the Same Computer
================================================================================
![](http://i1-news.softpedia-static.com/images/news2/How-to-Install-Windows-8-1-and-Ubuntu-14-04-LTS-on-the-Same-Computer-440356-2.jpg)

**Numerous Windows users are looking to also try a Linux operating system without deleting the one they are already using. They will be happy to know that this can be done quite easily and that Linux OSes are usually more friendly towards other operating systems that share the same computer.**

If you are a Windows user and you want to give Ubuntu a go, for example, the procedure is actually quite simple and involves very little effort from the user, who only has to pay a little attention to the procedures.

A normal installation of a new operating system on a PC is not complicated, not even with Linux and Ubuntu. For the most part, users only click next in the dialogs and everything is taken care of by the scripts. When you want to preserve an operating system that is also present on the same PC (it doesn't have to be a Windows one specifically), a little more work is required, but that can be handled very easily.

Writing an Ubuntu image from Linux is easy and it can be done with a number of applications. On Windows you will need to get Ubuntu either on a DVD or on a USB (which is preferable). In order to get Ubuntu properly copied to a USB device, you will need to download a handy little tool called [Win32 Disk Imager 0.9.5][1]. It features a simple interface and it's fully automated.

Now, before rebooting to get Ubuntu installed, you might want to set some free space aside that will be available for Ubuntu, but a partition will not be enough. You will need two of them, one for Ubuntu itself (10GB should suffice if you don't plan to get too many applications) and a second partition for the Swap (the pagefile equivalent for Windows), which has to be double the amount of you RAM memory. You don't need to format them, just make sure they are free. If you install Ubuntu on a second HDD, that's even better.

Plug the USB in and reboot. You will get a prompt to Try or Install. Choose Install and read the options you are given: Install Ubuntu Alongside Windows 8 (or whatever version you have), Replace Windows 8 with Ubuntu, or Something Else.

You can choose to install alongside Windows 8, but you might not like what the installer will choose for you. It's better to hit Something Else and install it manually.

Spot the free partition that you set aside for Ubuntu (the installer doesn't read volume names from Windows), double click on it, select EXT4 as the filesystem, and “/” as the default mount point.

Now select the smaller partition and choose SWAP as the filesystem. That is all. Once you hit Next, the installation will start and you will have to choose the name, password, and other such details.

The next time you boot you will get a simple list of operating systems that will allow you to choose whichever OS you prefer.

Enjoy!

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/How-to-Install-Windows-8-1-and-Ubuntu-14-04-LTS-on-the-Same-Computer-440356.shtml

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.softpedia.com/get/CD-DVD-Tools/Data-CD-DVD-Burning/Win32-Disk-Imager.shtml
