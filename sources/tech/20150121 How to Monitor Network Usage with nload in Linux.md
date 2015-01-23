How to Monitor Network Usage with nload in Linux
================================================================================
nload is a free linux utility that can help the linux user or sysadmin to monitor network traffic and bandwidth usage in real time by providing two simple graphs: one per incoming traffic and one for outgoing traffic.

I really like to use **nload** to display information on my screen about the current download speed, the total incoming traffic, and the average download speed. The graphs reported by nload tool are very easy to interpret and what is the most important thing they are very helpful.

According to the manual pages it monitors all network devices by default, but you can easily specify the device you want to monitor and also switch between different network devices using the arrow keys. There are many options avaliable such as -t to determine refresh interval of the display in milliseconds (the default value of interval is 500), -m to show multiple devices at the same time(traffic graphs are not shown when this option is used), -u to set the type of unit used for the display of traffic numbers and many others that we are going to explore and practise in this tutorial.

### How to install nload on your linux machine ###

**Ubuntu** and **Fedora** users can easily install nload from the default repositories.

Install nload on Ubuntu by using the following command.

    sudo apt-get install nload

Install nload on Fedora by using the following command.

    sudo yum install nload

What about **CentOS** users? Just type the following command on your machine and you will get nload installed.

    sudo yum install nload

The following command will help you to install nload on OpenBSD systems.

    sudo pkg_add -i nload

A very effective way to install software on linux machine is to compile by source as you can download and install the latest version which usually means better performance, cool features and less bugs.

### How to install nload from source ###

The first thing you need to do before installing nload from source you need to download it and to do this I like to use the wget uility which is available by default on many linux machines. This free utility helps linux users to download files from the web in a non-interactive way and has support for the following protocols.

- HTTP
- HTTPS
- FTP

Change directory to **/tmp** by using the following command.

    cd /tmp

Now type the following command in your terminal to download the latest version of nload on your linux machine.

    wget http://www.roland-riegel.de/nload/nload-0.7.4.tar.gz

If you don't like to use the linux wget utility you can easily download it from the [official][1] source by just a mouse click.

The download will finish in no time as it is a small software. The next step is to untar the file you downloaded with the help of the **tar** utility.

The tar archiving utility can be used to store and extract files from a tape or disk archive. There are many options available in this tool but we need the followings to perform our operation:

1. **-x** to extract files from an archive
1. **-v** to run in verbose mode
1. **-f** to specify the files

For example:

    tar xvf example.tar

Now that you learned how to use the tar utility I am very sure you know how to untar .tar archives from the commandline.

    tar xvf nload-0.7.4.tar.gz

Then use the cd command to change directory to nload*.

    cd nload*

It looks like this on my system.

    oltjano@baby:/tmp/nload-0.7.4$

Now run the command

    ./configure

to to configure the package for your system.

    ./configure

Alot of stuff is going to be displayed on your screen. The following screenshot demonstrates how it is going to look like.

![configuring packages for nload](http://blog.linoxide.com/wp-content/uploads/2015/01/nload1.png)

Then compile the nload with the following command.

    make

![compiling nload](http://blog.linoxide.com/wp-content/uploads/2015/01/nload2.png)

And finally install nload on your linux machine with the following command.

    sudo make install

![installing nload from source](http://blog.linoxide.com/wp-content/uploads/2015/01/nload3.png)

Now that the installation of nload is finished it is time for you to learn how to use it.

### How to use nload ###

I like to explore so type the following command on your terminal.

    nload

What do you see?

I get the following.

![running nload](http://blog.linoxide.com/wp-content/uploads/2015/01/nload4.png)

As you can see from the above screenshot I get information on:

### Incoming Traffic ###

#### Current download speed ####

![nload running on linux](http://blog.linoxide.com/wp-content/uploads/2015/01/nload4.1.png)

#### Average download speed ####

![nload running on linux](http://blog.linoxide.com/wp-content/uploads/2015/01/nload4.2.png)

#### Minimum download speed ####

![nload running on linux](http://blog.linoxide.com/wp-content/uploads/2015/01/nload4.3.png)

#### Maximum download speed ####

![nload running on linux](http://blog.linoxide.com/wp-content/uploads/2015/01/nload4.4.png)

#### Total incoming traffic in bytes by default ####

![](http://blog.linoxide.com/wp-content/uploads/2015/01/nload4.5.png)

### Outgoing Traffic ###

The same goes for outgoing traffic.

#### Some useful options of nload ####

Use the option

    -u

to set set the type of unit used for the display of traffic numbers.

The following command will help you to use the MBit/s unit.

    nload -u m

The following screenshot shows the result of the above command.

![nload running on linux](http://blog.linoxide.com/wp-content/uploads/2015/01/nload5.png)

Try the following command and see the results.

    nload -u g

![nload running on linux](http://blog.linoxide.com/wp-content/uploads/2015/01/nload6.png)

There is also the option **-U**. According to the manual pages it is same as the option -u but only for an amount of data. I tested this option and to be honest it very helpful when you want to check the total amount of traffic be it incoming or outgoing.

    nload -U G

![nload running on linux](http://blog.linoxide.com/wp-content/uploads/2015/01/nload7.png)

As you can see from the above screenshot the command **nload -U G** helps to display the total amount of data (incoming or outgoing) in Gbyte.

Another useful option I like to use with nload is the option **-t**. This option is used to refresh interval of display in milliseconds which is 500 by default.

I like to experiment a little by using the following command.

    nload -t 130

So what the above command does is that it sets the display to refresh every 130 milliseconds. It is recommended to no specify refresh intervals shorter than about 100 milliseconds as nload will generate reports with mistakes during the calculations.

Another option is **-a**. It is used when you want to set the length in seconds of the time window for average calculation which is 300 seconds by default.

What if you want to monitor a specific network device? It is very easy to do that, just specify the device or the list of devices you want to monitor like shown below.

    nload wlan0

![nload monitoring wlan0 on linux](http://blog.linoxide.com/wp-content/uploads/2015/01/nload8.png)

The following syntax can help to monitor specific multiple devices.

    nload [options] device1 device2 devicen

For example use the following command to monitor eth0 and wlan0.

    nload wlan0 eth0

And if you run the command nload without any option it will monitor all auto-detected devices, you can display graphs for each one of them by using the right and left arrow keys.

--------------------------------------------------------------------------------

via: http://linoxide.com/monitoring-2/monitor-network-usage-nload/

作者：[Oltjano Terpollari][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/oltjano/
[1]:http://www.roland-riegel.de/nload/nload-0.7.4.tar.gz