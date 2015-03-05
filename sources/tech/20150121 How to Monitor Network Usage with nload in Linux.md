theo-l translating
How to Monitor Network Usage with nload in Linux
在linux中如何通过nload来监控网络使用情况
================================================================================
nload is a free linux utility that can help the linux user or sysadmin to monitor network traffic and bandwidth usage in real time by providing two simple graphs: one per incoming traffic and one for outgoing traffic.
nload 是一个免费的linux工具,通过提供两个简单的图形化界面来帮助linux用户和系统管理员来实时监控网络流量以及宽带使用情况:一个作为进入流量,一个作为流出流量.

I really like to use **nload** to display information on my screen about the current download speed, the total incoming traffic, and the average download speed. The graphs reported by nload tool are very easy to interpret and what is the most important thing they are very helpful.
我是真的很喜欢用**nload**来在屏幕上显示当前的下载速度，总的流入量和平均下载速度等信息。nload工具的报告图非常容易理解，最重要的是这些信息真的非常有用。



According to the manual pages it monitors all network devices by default, but you can easily specify the device you want to monitor and also switch between different network devices using the arrow keys. There are many options avaliable such as -t to determine refresh interval of the display in milliseconds (the default value of interval is 500), -m to show multiple devices at the same time(traffic graphs are not shown when this option is used), -u to set the type of unit used for the display of traffic numbers and many others that we are going to explore and practise in this tutorial.
在使用手册上说到，在默认情况下会监控所有网络设备。但是你可以轻松地指定你想要监控的设备，而且可以可以通过方向键头在不同的网络设备之间进行转换。另外还有很多的选项可用，例如 ‘-r’选项确定以毫秒来刷新显示时间间隔（默认时间间隔值是500毫秒），‘-m’选项用来实时显示多个设备（流量图在使用该选项时不会显示）， ‘-u’选项用来设置显示流量数字的单元类型，另外还有许多其他的选项将会在该教程中探索和练习。

### How to install nload on your linux machine ###
### 如何将 nload安装到你的linux机器上 ###

**Ubuntu** and **Fedora** users can easily install nload from the default repositories.
**Ubuntu** 和 **Fedora** 用户可以从默认的软件仓库中容易地安装。

Install nload on Ubuntu by using the following command.
在Ubuntu上使用以下命令进行安装。

    sudo apt-get install nload

Install nload on Fedora by using the following command.
在Fedora上使用以下命令进行安装。

    sudo yum install nload

What about **CentOS** users? Just type the following command on your machine and you will get nload installed.
**CentOS**用户该怎么办呢？ 只需要在你的机器上输入以下命令，通用能够达到相同的结果--殊途同归。

    sudo yum install nload

The following command will help you to install nload on OpenBSD systems.
以下的命令会帮助你在OpenBSD系统中安装nload.

    sudo pkg_add -i nload

A very effective way to install software on linux machine is to compile by source as you can download and install the latest version which usually means better performance, cool features and less bugs.
linux机器上的另外一个非常有效的安装软件的方式就是编译源代码，通过下载并安装最新的版本意味着能够获得更好地性能，更酷的特性以及越少的bug数。

### How to install nload from source ###
### 如何通过源代码安装nload ###

The first thing you need to do before installing nload from source you need to download it and to do this I like to use the wget uility which is available by default on many linux machines. This free utility helps linux users to download files from the web in a non-interactive way and has support for the following protocols.
在从源代码安装nload之前，你需要首先下载源代码。 我通常使用wget工具来进行下载--该工具在许多linux机器上默认可用。该免费工具帮助用户以非交互式的方式从网络上下载文件，并支持以下协议：

- HTTP
- HTTPS
- FTP

Change directory to **/tmp** by using the following command.
通过以下命令来进入到**/tmp**目录中。

    cd /tmp

Now type the following command in your terminal to download the latest version of nload on your linux machine.
然后在你的终端中输入以下命令就可以将最新版本的nload下载到你的linux机器上了。

    wget http://www.roland-riegel.de/nload/nload-0.7.4.tar.gz

If you don't like to use the linux wget utility you can easily download it from the [official][1] source by just a mouse click.
如果你不喜欢使用wget工具，也可以通过简单的一个鼠标点击轻松地从[官网][1]上下载源代码。

The download will finish in no time as it is a small software. The next step is to untar the file you downloaded with the help of the **tar** utility.
由于该软件非常轻巧，其下载过程几乎在瞬间就会完成。接下来的步骤就是通过**tar**工具来将下载的源代码包进行解压。

The tar archiving utility can be used to store and extract files from a tape or disk archive. There are many options available in this tool but we need the followings to perform our operation:
tar归档工具可以用来从磁带或硬盘文档中存储或解压文件，该工具具有许多可用的选项，但是我们只需要下面的几个选项来执行我们的操作。

1. **-x** to extract files from an archive
1. **-x** 从文档中解压文件
1. **-v** to run in verbose mode
1. **-v** 使用繁琐模式运行--用来输入详细信息
1. **-f** to specify the files
1. **-f** 用来指定文件

For example:
例如：

    tar xvf example.tar

Now that you learned how to use the tar utility I am very sure you know how to untar .tar archives from the commandline.
现在你学会了如何使用tar工具，我可以非常肯定你会知道如何从命令行中解压.tar文档。

    tar xvf nload-0.7.4.tar.gz

Then use the cd command to change directory to nload*.
之后使用cd命令来进入到nload*目录中

    cd nload*

It looks like this on my system.
在我的系统上看起来是这样的

    oltjano@baby:/tmp/nload-0.7.4$

Now run the command to to configure the package for your system.
然后运行下面这个命令来为你的系统配置包

    ./configure

Alot of stuff is going to be displayed on your screen. The following screenshot demonstrates how it is going to look like.
此时会有一大波僵尸会在你的屏幕上显示出来，下面的一个屏幕截图描述了它的样子。

![configuring packages for nload](http://blog.linoxide.com/wp-content/uploads/2015/01/nload1.png)

Then compile the nload with the following command.
在上述命令完成之后，通过下面的命令来编译nload。

    make

![compiling nload](http://blog.linoxide.com/wp-content/uploads/2015/01/nload2.png)

And finally install nload on your linux machine with the following command.
好了，终于....，下载通过以下命令可以将nload安装在你的机器上了。

    sudo make install

![installing nload from source](http://blog.linoxide.com/wp-content/uploads/2015/01/nload3.png)

Now that the installation of nload is finished it is time for you to learn how to use it.
安装好nload之后就是时间来让你学习如何使用它了。

### How to use nload ###
###如何使用nload###

I like to explore so type the following command on your terminal.
我喜欢探索，所以在你的终端输入以下命令.

    nload

What do you see?
看到了什么？

I get the following.
我得到了下面的结果。

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
译者：[theo-l](https://github.com/theo-l)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/oltjano/
[1]:http://www.roland-riegel.de/nload/nload-0.7.4.tar.gz
