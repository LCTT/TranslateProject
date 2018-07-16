如何在手机上安装Ubuntu Touch 13.10
================================================================================
**Ubuntu Touch 13.10是Canonical公司针对手机新推出的一款操作系统，但是相对于桌面而言，它安装到手机并不是那么容易。**

![](http://i1-news.softpedia-static.com/images/news2/How-to-Install-Ubuntu-Touch-13-10-On-Your-Phone-392828-2.jpg)

Canonical提供了安装Ubuntu Touch 13.10所有必要的工具。这真是个好消息，因为手动安装操作系统可是相当麻烦的。

首先提醒，此操作系统并非任何手机都能使用。因开发原因，Canonical限制其只能使用在Nexus 4设备上（代号金枪鱼和灰鲭鲨） ，而且手机必须已被解锁。

要安装工具，你将需要在终端输入几个简单的命令：

    sudo add-apt-repository ppa:phablet-team/tools
    sudo apt-get update
    sudo apt-get install phablet-tools android-tools-adb android-tools-fastboot

用户还必须确保他们的手机已被设置成开发使用。进入“设置项/关于手机”，点击“软件版本”7次。如果你操作正确，将会收到一条提示消息。

你必须从新菜单——“开发者选项”中启用USB调试，该菜单通过前面的方法已被解锁。在手机上勾选该选项时，会出现一条消息，通知用户正在配对。同意，那么你准备得差不多了。

在开始安装前的最后一步是备份你的Android系统。同样使用adb工具。只要打开终端，输入以下命令：

    adb backup -apk -shared -all

如果你要重新安装原来的Android系统，打开一个终端，运行以下命令：

    adb restore backup.ab

最后的命令至关重要，你应该使用sudo运行，以确保正确执行该命令。打开一个终端，输入以下命令：

    sudo phablet-flash ubuntu-system --no-backup

运行过程中应该没有任何问题，设备将最终引导到Ubuntu Touch。不要停止终端也不要中断此过程。

以上就是你需要遵照的简单步骤，这样，在所支持的设备上运作应该没有任何问题了。

--------------------------------------------------------------------------------

来源于: http://news.softpedia.com/news/How-to-Install-Ubuntu-Touch-13-10-On-Your-Phone-392828.shtml

译者：[coolpigs](https://github.com/coolpigs) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出 
