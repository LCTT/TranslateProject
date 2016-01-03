
如何在树莓派 2B 上安装 FreeBSD
================================================================================

在树莓派 2B 上如何安装 FreeBSD 10 或 FreeBSD 11（current）？怎么在 Linux，OS X，FreeBSD 或类 Unix 操作系统上烧录 SD 卡？

在树莓派 2B 上安装 FreeBSD 10 或 FreeBSD 11（current）很容易。使用 FreeBSD 操作系统可以打造一个非常易用的 Unix 服务器。FreeBSD-CURRENT 自2012年十一月以来一直支持树莓派，2015年三月份后也开始支持树莓派2了。在这个快速教程中我将介绍如何在树莓派 2B 上安装 FreeBSD 11 current arm 版。

### 1. 下载 FreeBSD-current 的 arm 镜像 ###

你可以 [访问这个页面来下载][1] 树莓派2的镜像。使用 wget 或 curl 命令来下载镜像：

    $ wget ftp://ftp.freebsd.org/pub/FreeBSD/snapshots/arm/armv6/ISO-IMAGES/11.0/FreeBSD-11.0-CURRENT-arm-armv6-RPI2-20151016-r289420.img.xz

或

    $ curl -O ftp://ftp.freebsd.org/pub/FreeBSD/snapshots/arm/armv6/ISO-IMAGES/11.0/FreeBSD-11.0-CURRENT-arm-armv6-RPI2-20151016-r289420.img.xz

### 2. 解压 FreeBSD-current 镜像 ###

执行以下命令中的任何一个：

    $ unxz FreeBSD-11.0-CURRENT-arm-armv6-RPI2-20151016-r289420.img.xz

或

    $ xz --decompress FreeBSD-11.0-CURRENT-arm-armv6-RPI2-20151016-r289420.img.xz

### 3. 设置 SD ###

你可以在 OS X，Linux，FreeBSD，MS-Windows 和类 Unix 系统来烧录 SD 卡。

### 在 Mac OS X 下烧录 FreeBSD-current ###

使用下面的 dd 命令：

    $ diskutil list
    $ diskutil unmountDisk /dev/diskN
    $ sudo dd if=FreeBSD-11.0-CURRENT-arm-armv6-RPI2-20151016-r289420.img of=/dev/disk2 bs=64k

示例输出:

    1024+0 records in
    1024+0 records out
    1073741824 bytes transferred in 661.669584 secs (1622776 bytes/sec)

#### 使用 Linux/FreeBSD 或者类 Unix 系统来烧录 FreeBSD-current ####

语法是这样:

    $ dd if=FreeBSD-11.0-CURRENT-arm-armv6-RPI2-20151016-r289420.img of=/dev/sdb bs=1M

**确保使用实际的 SD 卡的设备名称来替换 /dev/sdb**（LCTT 译注：千万注意不要写错了）。

### 4. 引导 FreeBSD ###

在树莓派 2B 上插入 SD 卡。你需要连接键盘，鼠标和显示器。我使用的是 USB 转串口线来连接显示器的：

![Fig.01 RPi USB based serial connection](http://s0.cyberciti.org/uploads/faq/2015/10/Raspberry-Pi-2-Model-B.pin-out.jpg)

*图01 基于树莓派 USB 的串行连接*

在下面的例子中，我使用 screen 命令来连接我的 RPI：

    ## Linux 上 ##
    screen /dev/tty.USB0 115200
     
    ## OS X 上 ##
    screen /dev/cu.usbserial 115200
     
    ## Windows 请使用 Putty.exe ##
 
FreeBSD RPI 启动输出样例：

![Gif 01: Booting FreeBSD-current on RPi 2](http://s0.cyberciti.org/uploads/faq/2015/10/freebsd-current-rpi.gif)

*图02: 在树莓派 2上引导 FreeBSD-current*

### 5. FreeBSD 在 RPi 2上的用户名和密码  ###

默认的密码是 freebsd/freebsd 和 root/root。

到此为止, FreeBSD-current 已经安装并运行在树莓派 2上。

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/how-to-install-freebsd-on-raspberry-pi-2-model-b/

作者：[Vivek Gite][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.cyberciti.biz/tips/about-us
[1]:ftp://ftp.freebsd.org/pub/FreeBSD/snapshots/arm/armv6/ISO-IMAGES/11.0
