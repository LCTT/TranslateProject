WinUSB: Create A Bootable Windows USB In Linux
WinUSB: 在linux上建立一个可引导的Windows USB
==========
大家好,

我不是来这里促进微软windows使用的,如你所见这是关于如何建立一个可引导启动的usb,当然在windows上也有一个工作的很好的工具,Power IOS.

你可能还记得在学校或者家里有时需要从DVD或者.iso文件建立一个可引导启动的windows USB,但你是不是在微软的Windows上使用Power IOS等等来做的.

在linux上逆可以用Unetbootin,但是新版的Unetbootin不长时间支持版,你可以使用旧版本,在这之前还有你需要将USB格式化位NTFS格式.这对一个新手是很复杂的办法.

现在,我来介绍一**winusb**工具,如果逆从来没有听过它,不要紧继续读下去.

**[WinUSB](http://congelli.eu/prog_info_winusb.html)** 是一个在linux上用来建立Windows安装或者可引导usb的简单的命令行工具.

首先我们安装 **winusb** 之后我们来看如何使用它.

安装**winusb** via PPA:

$ sudo add-apt-repository ppa:colingille/freshlight $ sudo apt-get update $ sudo apt-get install winusb - See more at: http://www.unixmen.com/winusb-create-bootable-windows-usb-linux/#sthash.ZPxLBx2c.dpuf

    $ sudo add-apt-repository ppa:colingille/freshlight
    $ sudo apt-get update
    $ sudo apt-get install winusb

WinUSB也可以在命令行工作(终端),我们可以在终端中使用下面命令(需要root权限)建立一个Windows 7或者windows Vista USB安装器:

    $ sudo winusb --format <iso path> <device>

**Example :**

    $ sudo winusb --format Desktop/SETHO/Win7.iso /dev/sdc1

**Desktop/SETHO/Win7.iso** 是.iso文件路径,**/dev/sdc1**是设备路径.(**NOTE**:用**df**命令获得设备路径)

安装一个Windows ISO 在**NTFS**分区,用下面命令编辑主引导记录(MBR):

    $ sudo winusb --install <iso path> <partition>

**Example :**

    $ sudo winusb --format Desktop/SETHO/Win7.iso /dev/sdd1

**/dev/sdd1**是分区路径

如果你不喜欢命令行,你应该试着学习它爱上它,**WinUSB**也有很容易理解的图形界面(GUI)

可以从dash启动:

**Dash > WinUSB**

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/WinUSB_dash.png)

启动之后,选择.iso文件和设备,点击安装.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/WinUSB.png)



via:http://www.unixmen.com/winusb-create-bootable-windows-usb-linux/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://www.unixmen.com/winusb-create-bootable-windows-usb-linux/
[2]:http://congelli.eu/prog_info_winusb.html
