CHINAANSHE翻译
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
                 如何在同一台计算机上安装Windows 8.1和Ubuntu 14.04 LTS
![](http://i1-news.softpedia-static.com/images/news2/How-to-Install-Windows-8-1-and-Ubuntu-14-04-LTS-on-the-Same-Computer-440356-2.jpg)
       **许多Windows用户，正在去尝试使用Linux操作系统，并且不用删除其它正在使用的系统。他们知道Linux操作系统，很容易更好的对待共享的同一台计算机上的其他操作系统，会很高兴的。**
       如果你是Windows用户，你想去安装Ubuntu。例如，程序实际上是相当简单的，需要一点小小的努力来自用户，他们只需要关注一下本程序。
       
       一种新的基于PC操作系统正常的安装并不复杂，Ubuntu和Linux同样也是。在大多数情况下，用户单击“下一步”对话框中，所有的都是按照这个脚本。当你想保存，也存在于相同的PC操作系统（不一定是Windows专门），更多的工作是必需的，但可以很容易。
       
        从Ubuntu Linux编写一个图像是容易的，这是可以做到的一些应用程序。在Windows你将需要Ubuntu任何一个dvd上或USB（最好是）。为了让Ubuntu正确复制到一个USB设备，你将需要下载一个小巧的工具称为Win32 Disk Imager 0.9.5。它具有一个简单的界面，它是完全自动的。
        
        现在，把Ubuntu安装重启之前，你可能要设置一些自由的空间，将用于Ubuntu，但一个分区是不够的。您将需要两个，一个Ubuntu本身的（大约10GB，如果你不想安装太多的应用的话，就足够了）和第二分区（Windows,pagefile等），这是増加你的内存。你不需要的他们，但他们都是免费的。如果你在第二HDD安装Ubuntu，那就更好了。
        
         插上USB和重新启动。你会得到一个提示试用或安装。选择安装并给你选择：安装Ubuntu和Windows 8（或任何你拥有版本），替换Windows 8与Ubuntu，或者别的什么。
         
         你可以选择安装在Windows 8，但你也许不喜欢，安装程序将为你选择。这是更好地打击其他手动安装。
         
         发现，你放置Ubuntu空闲分区（安装程序无法读取Windows卷名称），双击它，选择ext4文件系统，和“/”作为默认的安装点。
         
         现在选择较小的分区和选择交换文件。就这些了。当你点击下一步，安装程序将启动，你将要选择的名称，密码，和其他细节。
         
         下次当你启动你时将得到一个简单的操作系统，将让你选择你喜欢的操作系统列表。
        
         尽情享受！

via: http://news.softpedia.com/news/How-to-Install-Windows-8-1-and-Ubuntu-14-04-LTS-on-the-Same-Computer-440356.shtml

译者：[CHINAANSHE](https://github.com/CHINAANSHE) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.softpedia.com/get/CD-DVD-Tools/Data-CD-DVD-Burning/Win32-Disk-Imager.shtml
