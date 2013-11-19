如何在Linux下监控系统温度

================================================================================

在大多数情况下,你无需担心你电脑的温度.除非制造缺陷,设计硬件一般都不会超过最大的工作温度.但即使没有任何硬件故障,各样的软件问题也会导致硬件过热,例如,显卡驱动的大量bug,错误风扇控制程序配置,CPU频率调节守护进程的故障,等.

过热可能会严重到对你硬件造成永久性的伤害.所以小心你系统上的任何过热问题.如果有适当的温度监控系统,那再好不过了,这样在系统温度突然急速上升时可以第一时间收到警告.

在这个教程,我将描述**如何在Linux下监控系统温度**.

在Linux下有几个允许你检查和监控各种系统组件的用户级工具.

[lm-sensors][1] 是一款从硬件嵌入式传感器获取信息,以达到监测温度,电压,湿度和风扇

在下文中,我将会描述如何设置psensor来监控CPUs和硬盘的温度.

### 在Linux 桌面版上安装 psensor###

psensor可以可视化系统温度,但其中信息的获取是基于其他类似lm-sensors和hddtemp的工具.因此你需要在安装psensor的同时,一并安装所需工具.

在Debian或Ubuntu下安装psensor:

    $ sudo apt-get install lm-sensors hddtemp psensor

在Fedora下安装psensor

    $ sudo yum install lm_sensors hddtemp

    $ sudo yum install gcc gtk3-devel GConf2-devel lm_sensors-devel cppcheck libatasmart-devel libcurl-devel json-c-devel libmicrohttpd-devel help2man libnotify-devel libgtop2-devel make

    $ wget http://wpitchoune.net/psensor/files/psensor-0.8.0.3.tar.gz

    $ tar xvfvz psensor-0.8.0.3.tar.gz

    $ cd psensor-0.8.0.3

    $ ./configure

    $ make

    $ sudo make install 

由于必需要有GTK3库,psensor不能跟搭载GNOME2桌面的CentOs或RHEL 6兼容.

### 在Linux中配置 psensor ###

在启动 psensor之前,你需要先配置lm_sensors和hddtemp.

#### lm_sensors 配置 ####

允许以下命令,配置lm_sensors,每一项都选择YES.

    $ sudo sensors-detect 

这个命令将会探查和检测你硬件中嵌入式的传感器(包括CPUs,储存控制器,I/O芯片),然后在你的系统上自动决定那个驱动模块需要被载入检查温度.

一旦传感器检测完成,你将被要求把检测到的驱动模块添加到/etc配置中,这样它们才可以在开机时自动加载.

在Debian或Ubuntu下,检测到的驱动模块将会被添加到/et/modules.在Fedora下,驱动信息会添加到/etc/sysconfig/lm_sersors.

接下来,继续加载必要的模块,如下:

Ubuntu:

    $ sudo service module-init-tools start 

Debian:

    $ sudo /etc/init.d/kmod start

Fedora

    $ sudo service lm_sensors start 

#### hddtemp 配置 ####

你还需要启动hddtemp,让它监控硬盘驱动器的温度.

运行下列命令,作为一个守护进程启动hddtemp.替代 “/dev/sda” 来监控你系统上的硬盘驱动器.

    $ sudo hddtemp -d /dev/sda 

### 用 psensor 监控系统温度 ###

开始用psensor监测温度:

    $ psensor 

psensor的窗口将显示一个可用传感器的列表,并可视化从这些传感器中读出的温度.你可以选择性地启用或禁用每个传感器.

[![](http://farm8.staticflickr.com/7448/10719475225_f89b6f7191_z.jpg)][5]

另外,你可以为每个传感器设置警报级别,这样当传感器温度超过某一阈值将会通知你.

--------------------------------------------------------------------------------

via: http://xmodulo.com/2013/11/monitor-system-temperature-linux.html

译者：[Luoxcat](https://github.com/Luoxcat) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://lm-sensors.org/
[2]:http://www.guzu.net/linux/hddtemp.php
[3]:http://en.wikipedia.org/wiki/S.M.A.R.T.
[4]:http://wpitchoune.net/blog/psensor/
[5]:http://www.flickr.com/photos/xmodulo/10719475225/
