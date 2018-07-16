如何在Linux下监控系统温度
================================================================================

大多数情况下，你无需担心你的电脑温度。除非制造上的缺陷，否则硬件设计一般不会使其超过最高工作温度。但即使没有任何硬件故障，各种各样的软件问题也会导致硬件过热，例如，显卡驱动的严重bug，风扇控制程序的错误配置，CPU调频守护进程的故障，等等。

严重的过热可能会对硬件造成永久性的伤害，所以应当时刻小心系统上的任何过热问题。因此，如果有合适的温度监控系统，能在系统温度突然急速上升时，第一时间向用户发出警报，岂不美哉？

本教程，我将描述**如何在Linux下监控系统温度**。

在Linux下有许多用户级工具可以检查和监控各种系统组件的温度。

例如[lm-sensors][1]，它可以从硬件嵌入式传感器获取信息,以达到监测温度、电压、湿度和风扇的作用；还有[hddtemp][2],它可以通过读取[S.M.A.R.T.][3]参数来测量温度；今天我们要介绍的是[psensor][4]，这是一款前端图形化界面温度监测工具，能够可视化显示CPU、Nvidia/ATI/AMD各家显卡以及硬盘等多个硬件设备的温度。

接下来，我将描述如何设置psensor来监控CPUs和硬盘的温度。

### 在Linux 桌面系统中安装 psensor###

使用psensor可视化显示系统温度，需要基于其他工具诸如lm-sensors和hddtemp等获得的数据。因此你需要在安装psensor的同时，一并安装这两款工具。

在Debian或Ubuntu下安装psensor:

    $ sudo apt-get install lm-sensors hddtemp psensor

在Ubuntu下还可以通过PPA仓库安装最新版本的psensor：

    $ sudo add-apt-repository ppa:jfi/ppa
    $ sudo apt-get update
    $ sudo apt-get install lm-sensors hddtemp psensor

在Fedora下安装psensor：

    $ sudo yum install lm_sensors hddtemp
    $ sudo yum install gcc gtk3-devel GConf2-devel lm_sensors-devel cppcheck libatasmart-devel libcurl-devel json-c-devel libmicrohttpd-devel help2man libnotify-devel libgtop2-devel make
    $ wget http://wpitchoune.net/psensor/files/psensor-0.8.0.3.tar.gz
    $ tar xvfvz psensor-0.8.0.3.tar.gz
    $ cd psensor-0.8.0.3
    $ ./configure
    $ make
    $ sudo make install 

这里注意，由于需要GTK3库的支持，psensor无法与搭载GNOME2桌面的CentOs或RHEL 6兼容。

### 在Linux中配置 psensor ###

在启动 psensor之前，你需要先配置lm_sensors和hddtemp。

#### lm_sensors 配置 ####

运行以下命令，配置lm_sensors，每一项都选择YES。

    $ sudo sensors-detect 

这个命令将会探查和检测你硬件中嵌入的传感器(包括CPUs、储存控制器、I/O芯片)，然后自动决定系统中哪个驱动模块需要载入并监测其温度。

一旦传感器检测完成，你需要把检测到的驱动模块添加到/etc配置中，这样它们才可以在开机时自动加载。

![img](http://farm6.staticflickr.com/5476/10719567256_029533a588_z.jpg)

在Debian或Ubuntu下，检测到的驱动模块将会被添加到/etc/modules。在Fedora下，驱动信息会添加到/etc/sysconfig/lm_sersors。

接下来，继续加载必要的模块，如下:

Ubuntu:

    $ sudo service module-init-tools start 

Debian:

    $ sudo /etc/init.d/kmod start

Fedora

    $ sudo service lm_sensors start 

#### hddtemp 配置 ####

你还需要启动hddtemp，监控硬盘驱动器的温度。

运行下列命令，作为一个守护进程启动hddtemp。记得把“/dev/sda”替换成你系统上的硬盘驱动器。

    $ sudo hddtemp -d /dev/sda 

### 用 psensor 监控系统温度 ###

要启动psensor监测温度，只需简单运行:

    $ psensor 

psensor窗口将显示一个可用的传感器列表，并将传感器中读出的温度可视化显示出来。你可以选择性地启用或禁用任意一个传感器。

[![](http://farm8.staticflickr.com/7448/10719475225_f89b6f7191_z.jpg)][5]

另外，你可以为每个传感器设置警报级别，这样当传感器温度超过某一阈值时，你就能得到通知了。

![img](http://farm6.staticflickr.com/5534/10719755343_ba143454af_z.jpg)

psensor默认使用的温度单位是“摄氏度”，最新的版本（0.7-0.8）支持在摄氏与华氏之间转换温度单位，如果你用的版本比较旧（例如0.6.x）并且不支持温度单位转换，Ubuntu用户可以通过PPA仓库来安装最新版的psensor，Debian用户则可以通过源代码来安装。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2013/11/monitor-system-temperature-linux.html

译者：[Luoxcat](https://github.com/Luoxcat) 校对：[Mr小眼儿](http://blog.csdn.net/tinyeyeser)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://lm-sensors.org/
[2]:http://www.guzu.net/linux/hddtemp.php
[3]:http://en.wikipedia.org/wiki/S.M.A.R.T.
[4]:http://wpitchoune.net/blog/psensor/
[5]:http://www.flickr.com/photos/xmodulo/10719475225/
