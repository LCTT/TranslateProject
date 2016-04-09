WinUSB: 在linux上创建一个Windows的可引导的U盘
=========================================
hi，小伙伴们，

我不是来这里宣传使用微软的windows的，如你所见这是一篇关于如何创建一个可引导的U盘的文章。在Windows中也有一个这样的工具，它就是好用的Power ISO。

你可能还记得在学校或者家里有时需要从DVD或者.iso文件建立一个可引导启动的windows U盘，但你没有使用Windows，就没法使用Power ISO来完成.

在linux上你可以用Unetbootin，但是新版的Unetbootin不再支持。虽然你可以使用旧版本，并且在这之前需要将U盘格式化成NTFS格式，但这对新手来说确实很复杂。

现在，我来介绍一个叫**winusb**的工具，如果你从来没有听过它，没关系，请继续读下去。

**[WinUSB][1]** 是一个在linux上用来建立Windows安装U盘或者可引导U盘的简单的命令行工具。

我们先来安装**winusb**，之后我们来看如何使用它。

通过PPA来安装**winusb**:

    $ sudo add-apt-repository ppa:colingille/freshlight
    $ sudo apt-get update
    $ sudo apt-get install winusb

WinUSB可以运行在命令行下(终端)，我们可以在终端中使用如下命令(需要root权限)建立一个Windows 7或者windows Vista 的安装U盘:

    $ sudo winusb --format <iso path> <device>

**例如：**

    $ sudo winusb --format Desktop/SETHO/Win7.iso /dev/sdc1

**Desktop/SETHO/Win7.iso** 是.iso文件路径，**/dev/sdc1**是设备路径。(**注**:用**df**命令获得设备路径)

安装一个Windows ISO到**NTFS**分区，并修改主引导记录(MBR):

    $ sudo winusb --install <iso path> <partition>

**例如：**

    $ sudo winusb --install Desktop/SETHO/Win7.iso /dev/sdd1

**/dev/sdd1**是分区路径

如果你不喜欢命令行，**WinUSB**同样有GUI版，但是你应该试着学习它爱上命令行，其实它很简单易懂。

从dash中启动:

**Dash > WinUSB**

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/WinUSB_dash.png)

启动之后,选择.iso文件和设备,点击安装即可.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/09/WinUSB.png)



via:http://www.unixmen.com/winusb-create-bootable-windows-usb-linux/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[flsf01][] 校对：[Caroline][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[flsf01]:http://linux.cn/space/flsf01
[Caroline]:http://linux.cn/space/14763

[1]:http://congelli.eu/prog_info_winusb.html
