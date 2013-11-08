How to monitor system temperature on Linux
================================================================================
In most cases, you are not supposed to be worried about the temperature of your computer. Barring manufacturing defects, hardware is designed so that its temperature does not exceed maximum operating temperature. But even without any hardware fault, overheating can occur due to various software issues, e.g., buggy graphics card driver, misconfigured fan control program, malfunctioning CPU frequency scaling daemon, etc.

Overheating may become serious enough to cause permanent damage on your hardware. So watch out for any overheating issue in your system. Even better, have temperature monitoring system in place, so that you will be alerted if system temperature suddenly goes up.

In this tutorial, I will describe **how to monitor system temperature on Linux**.

There are several user space tools on Linux, which allow you to check and monitor temperature of various system components.

[lm-sensors][1] is a software tool that draws from hardware embedded sensors to monitor temperatures, voltage, humidity and fans. [hddtemp][2] is a tool that can measure the temperature of hard drives from [S.M.A.R.T.][3] readings. [psensor][4] is a graphical front-end for temperature monitoring, which visualizes temperature readings from CPUs, NVidia/ATI/AMD GPUs, hard disks, etc.

In the following, I will describe how to set up psensor to monitor the temperature of CPUs and hard drives.

### Install psensor on Linux Desktop ###

psensor can visualize system temperature based on the information obtained from other tools such as lm-sensors and hddtemp. Thus you need to install psensor along with those prerequisites.

To install psensor on Debian or Ubuntu:

    $ sudo apt-get install lm-sensors hddtemp psensor

To install psensor on Fedora:

    $ sudo yum install lm_sensors hddtemp
    $ sudo yum install gcc gtk3-devel GConf2-devel lm_sensors-devel cppcheck libatasmart-devel libcurl-devel json-c-devel libmicrohttpd-devel help2man libnotify-devel libgtop2-devel make
    $ wget http://wpitchoune.net/psensor/files/psensor-0.8.0.3.tar.gz
    $ tar xvfvz psensor-0.8.0.3.tar.gz
    $ cd psensor-0.8.0.3
    $ ./configure
    $ make
    $ sudo make install 

Due to the requirement for GTK3 libraries, psensor is not compatible with the GNOME 2 desktop of CentOS or RHEL 6.

### Configure psensor on Linux ###

Before launching psensor, you need to configure lm_sensors and hddtemp first.

#### lm_sensors configuration ####

To configure lm_sensors, run the following command. Choose YES to every question.

    $ sudo sensors-detect 

This command will probe for and detect embedded sensors in your hardware (including CPUs, memory controllers, I/O chips), and automatically determine which driver modules need to be loaded to check temperature on your system.

Once sensor probing is completed, you will be asked to add detected driver module(s) to /etc configuration, so they can be loaded automatically upon boot.

On Debian or Ubuntu, detected driver modules will be added to /etc/modules. On Fedora, the driver information will be added to /etc/sysconfig/lm_sensors.

Next, proceed to load necessary modules as follows.

On Ubuntu:

    $ sudo service module-init-tools start 

On Debian:

    $ sudo /etc/init.d/kmod start

On Fedora:

    $ sudo service lm_sensors start 

#### hddtemp configuration ####

You also need to launch hddtemp which monitors the temperature of hard drives.

Run the following command to launch hddtemp as a daemon. Replace “/dev/sda” with the disk drive to monitor on your system.

    $ sudo hddtemp -d /dev/sda 

### Monitor System Temperature with psensor ###

To start monitoring temperature with psensor, simply run:

    $ psensor 

The psensor window will show a list of available sensors, and visualize temperature readings from these sensors. You can selectively enable or disable each sensor.

[![](http://farm8.staticflickr.com/7448/10719475225_f89b6f7191_z.jpg)][5]

Optionally, you can set an alarm level for each sensor, so that you can be notified when the temperature from a sensor exceeds a threshold.

--------------------------------------------------------------------------------

via: http://xmodulo.com/2013/11/monitor-system-temperature-linux.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://lm-sensors.org/
[2]:http://www.guzu.net/linux/hddtemp.php
[3]:http://en.wikipedia.org/wiki/S.M.A.R.T.
[4]:http://wpitchoune.net/blog/psensor/
[5]:http://www.flickr.com/photos/xmodulo/10719475225/