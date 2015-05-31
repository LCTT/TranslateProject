Translating----geekpi

How To Check Laptop CPU Temperature In Ubuntu
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/05/Monitor_temperature_Ubuntu.png)

Overheating of laptops is a common issue one faces these days. Monitoring hardware temperature may help you to diagnose why laptop is getting overheated. In this article, we’ll see **how to check CPU temperature in Ubuntu**.

We are going to use a GUI tool [Psensor][1] that allows you to monitor hardware temperature in Linux. With Psensor you can:

- monitor the temperature of the motherboard and CPU sensors
- monitor the temperature of the NVidia GPUs
- monitor the temperature of the Hard Disk Drives
- monitor the rotation speed of the fans
- monitor the CPU usage

Latest version of Psensor also provides applet indicator for Ubuntu and thus it makes the monitoring of hardware temperature even easier in Ubuntu. You can choose to display the temperature right in the top panel itself. It even sends a desktop notification when the temperature exceeds the limit.

### How to install Psensor in Ubuntu 15.04 and 14.04 ###

Before you install Psensor, you need to install and configure [lm-sensors][2], a command line utility for hardware monitoring. If you want to measure hard disk temperature, you need to install [hddtemp][3] as well. To install these tools, run the following command in a terminal:

    sudo apt-get install lm-sensors hddtemp

Then start the detection of your hardware sensors:

    sudo sensors-detect

To make sure that it works, run the command below:

    sensors

It will give you an output like:

    acpitz-virtual-0
    Adapter: Virtual device
    temp1: +43.0°C (crit = +98.0°C)

    coretemp-isa-0000
    Adapter: ISA adapter
    Physical id 0: +44.0°C (high = +100.0°C, crit = +100.0°C)
    Core 0: +41.0°C (high = +100.0°C, crit = +100.0°C)
    Core 1: +40.0°C (high = +100.0°C, crit = +100.0°C)

If everything seems alright, proceed with the installation of Psensor by using the command below:

    sudo apt-get install psensor

Once installed, run the application by looking for it in Unity Dash. At first run, you should configure on what stats do you want to collect in Psensor.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/05/Psensor_Ubuntu.jpeg)

### Display temperature in the panel ###

If you want to show the temperature in the top panel, go to **Sensor Preferences**:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/05/Psensor_Ubuntu_1.jpeg)

Then under the **Application Indicator** menu, select the component for which you want to display the temperature and then check the **Display sensor in the label** option.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/05/Psensor_Ubuntu_2.jpeg)

### Start Psensor at each start up ###

Go to **Preferences->Startup** and the check **Launch on session startup** to start Psensor at each boot.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/05/Psensor_Ubuntu_3.jpeg)

That’s it. All you need to monitor the CPU temperature is here. You can keep an eye on it and it may help you find out which process is overheating your computer.

--------------------------------------------------------------------------------

via: http://itsfoss.com/check-laptop-cpu-temperature-ubuntu/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://wpitchoune.net/blog/psensor/
[2]:http://www.lm-sensors.org/
[3]:https://wiki.archlinux.org/index.php/Hddtemp
