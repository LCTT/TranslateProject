如何在电话上实现Ubuntu和Android 4.4.2 双启动
================================================================================
![](http://i1-news.softpedia-static.com/images/news2/Hot-to-Dual-Boot-Android-4-4-2-and-Ubuntu-for-Phones-438840-2.jpg)

**现在在电话上测试Ubuntu变得更加简单，可以从Canonical上获得一个程序，它可以安装新的操作系统而不必删除Andorid。能够双启动的系统获取可以将用户的注意力转移到新的手机和平板的开源平台上。**

Canonical在它的网站上有一个有一个流程解释了如何在电话上安装Ubuntu，但是这暗示了需要删除Android系统来获得新的操作系统。Ubuntu的开发者已经做了大量的工作来使这个新的系统看上去不错，但是如果你决定返回Android，你需要删除Ubuntu并安装Google的系统。这意味这你不得不重复设置你的电话，这可能会比较麻烦。

幸运的是，现在有一个称为[MultiROM Manager][1]的解决方案，它由Vojtech Bocek开发，现在已经在Google Play上并且只可工作在Nexus 7 (2012 & 2013)、 Nexus 4 和 Nexus 5上。

另一方面，Ubuntu Touch只可工作在Nexus 4 (mako) 、Nexus 7 (2013) 平板 (flo)和 Nexus 10 平板 (manta)，因此除非你有这些设备，否则你可能不能安全地执行这些步骤(它可能可以工作，但是不保证会让你的设备变砖同时/或者失去所有的数据。)

首先，你需要一台未解锁的设备，既然你有一台Nexus的设备这不应该是一个问题。你同样需要已经root了你的Andorid设备，这样你才能在应用内部安装操作系统。

有很多工具可以完成这个工作。首先，你需要安装ADB(Android Debug Bridge), 它有Canonical随着它的工具一起提供。你需要在终端下运行下面的命令：

    sudo add-apt-repository ppa:phablet-team/tools
    sudo apt-get update
    sudo apt-get install ubuntu-device-flash

现在，你需要下载两个二进制包，[TWRP 2.7.0.0][2] 和 [SuperSU][3]，它们可以确保你已经root。复制SuperSU的二进制zip包到你的电话内存中，运行下面的命令进入bootloader:

    sudo reboot bootloader

在你的电脑上解压TWRP文件，并用下面的命令安装镜像(用你下载的文件名代替recovery.img)

    fastboot flash recovery recovery.img

从bootloader菜单进入recovery，你就会看到TWRP 2.7.0.0在那里。运行TWRP并安装SuperSU二进制包，接着重启。

现在你已经有root访问权限了。安装Multi Manager，应用补丁，并为电话下载Ubuntu。应用会要求root权限，接着安装会顺利进行。当你重启的时候你会看到一个小窗口提示你选择你要运行的系统。选择Ubuntu后你就可以运行了。

享受吧！

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/Hot-to-Dual-Boot-Android-4-4-2-and-Ubuntu-for-Phones-438840.shtml

译者：[geekpi](https://github.com/geekpi) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://play.google.com/store/apps/details?id=com.tassadar.multirommgr
[2]:http://teamw.in/project/twrp2
[3]:http://androidsu.com/superuser/
