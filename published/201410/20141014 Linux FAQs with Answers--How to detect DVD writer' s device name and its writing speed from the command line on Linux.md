Linux有问必答：如何使用Linux命令行检测DVD刻录机的名字和读写速度
================================================================================
> **提问**：我想要知道我的DVD刻录机的名字和在烧录时的速度。该使用什么Linux命令行工具来连测DVD刻录机的设备名和速度？

如今大多数消费PC和笔记本电脑都配备了DVD刻录机。在Linux中，光盘驱动器，如CD/DVD驱动器的名字是在引导时内核基于udev规则来命名的。有几种方法来检测刻录机的设备名称和它的写入速度。

### 方法一 ###

找出与DVD刻录机相关的设备名称最简单的方法是使用dmesg命令行工具，它打印出内核的消息缓冲区。在dmesg的输出中，寻找一个安装好的DVD刻录机：

	$ dmesg | egrep -i --color 'dvd|cd/rw|writer' 

![](https://farm6.staticflickr.com/5603/15505432622_0bfec51a8f_z.jpg)

上述命令的输出会告诉你你的Linux系统上是否检测到了DVD刻录机以及它被分配的名字。本例中，DVD刻录机的设备名称为“/dev/sr0”。虽然此方法不会告诉你的写入速度

### 方法二 ###

第二个获得你DVD刻录机的信息是使用lsscsi命令，它只是列出了所有可用的SCSI设备。

在基于Debian Linux上安装 **lsscsi**:

    $ sudo apt-get install lsscsi

在基于Red Hat Linux上安装:

    $ sudo yum install lsscsi

如果成功检测到，lsscsi命令的输出会告诉你DVD刻录机的名称：

    $ lsscsi 

![](https://farm4.staticflickr.com/3937/15319078780_e650d751d6.jpg)

这也不会告诉你刻录机更多的细节，比如写入速度。

### 方法三 ###

第三种获取有关你DVD刻录机的信息是参考/proc/sys/dev/cdrom/info。

    $ cat /proc/sys/dev/cdrom/info 

----------

    CD-ROM information, Id: cdrom.c 3.20 2003/12/17
    
    drive name:		sr0
    drive speed:		24
    drive # of slots:	1
    Can close tray:		1
    Can open tray:		1
    Can lock tray:		1
    Can change speed:	1
    Can select disk:	0
    Can read multisession:	1
    Can read MCN:		1
    Reports media changed:	1
    Can play audio:		1
    Can write CD-R:		1
    Can write CD-RW:	1
    Can read DVD:		1
    Can write DVD-R:	1
    Can write DVD-RAM:	1
    Can read MRW:		1
    Can write MRW:		1
    Can write RAM:		1

本例中，输出会告诉你DVD刻录机（/dev/sr0）与x24的CD刻录速度（即24x153.6 Kbps）兼容，且相当于x3的DVD写入速度（即3x1385 KBps的）兼容。这里的写入速度是最大可能的速度，而实际的写入速度当然取决于使用的介质（例如：DVD-RW、DVD + RW、DVD-RAM等）。

### 方法四 ###

另一种方法是使用一种称为wodim命令行程序。在大多数的Linux发行版，这个工具以及它的软链接cdrecord都是默认安装的。

    # wodim -prcap
    (or cdrecord -prcap) 

![](https://farm6.staticflickr.com/5614/15505433532_4d7e47fc51_o.png)

如果不带任何参数调用时，wodim命令会自动检测到DVD刻录机，并显示出详细的功能以及它的最大读取/写入速度。例如，你可以找出刻录机支持哪些媒体（如CD-R、CD-RW、DVD-RW、DVD-ROM、DVD-R、DVD-RAM、音频CD），以及有哪些如何读/写速度。上面的例子中输出显示，DVD刻录机对于CD拥有X24最大写入速度，对于DVD有X3的最大写入速度。

需要注意的是wodim命令报告的写入速度会随您插入到DVD刻录机的CD/DVD介质的改变而改变，这反映了媒体规范。

### 方法五 ###

还有一个方法来检查DVD刻录机的写入速度的是一个名为dvd+rw-mediainfo的工具，这是dvd+rw工具包（DVD+-RW/R媒体工具链）的一部分。

在基于Debian 发行版上安装 **dvd+rw-tools** 

    $ sudo apt-get install dvd+rw-tools

在基于Red Hat 发行版上安装 dvd+rw-tools:

    $ sudo yum install dvd+rw-tools 

不像其他工具， dvd+rw-mediainfo命令不会产生任何输出，除非你插入DVD光盘到刻录机中。所以，当你插入DVD光盘后，运行以下的命令。用你自己的设备名称替换“/dev/sr0”。

    $ sudo dvd+rw-mediainfo /dev/sr0 

![](https://farm6.staticflickr.com/5597/15324137650_91dbf458ef_z.jpg)

**dvd+rw-mediainfo**工具会探测插入的媒体（本例中是“DVD-R”），以找出对媒体的实际写入速度。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/detect-dvd-writer-device-name-writing-speed-command-line-linux.html

译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出