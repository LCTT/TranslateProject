在linux中如何通过nload来监控网络使用情况
================================================================================
nload 是一个 linux 自由软件工具，通过提供两个简单的图形来帮助linux用户和系统管理员来实时监控网络流量以及宽带使用情况：一个是进入流量，一个是流出流量。

我真的很喜欢用**nload**来在屏幕上显示当前的下载速度、总的流入量和平均下载速度等信息。nload工具的报告图非常容易理解，最重要的是这些信息真的非常有用。

在其使用手册上说到，在默认情况下它会监控所有网络设备。但是你可以轻松地指定你想要监控的设备，而且可以通过方向键在不同的网络设备之间进行转换。另外还有很多的选项可用，例如 ‘-t’选项以毫秒来设定刷新显示时间间隔（默认时间间隔值是500毫秒），‘-m’选项用来同时显示多个设备（在使用该选项时不会显示流量图），‘-u’选项用来设置显示流量数字的单位，另外还有许多其他的选项将会在本教程中探索和练习。

### 如何将 nload安装到你的linux机器上 ###

**Ubuntu** 和 **Fedora** 用户可以从默认的软件仓库中容易地安装。

在Ubuntu上使用以下命令进行安装。

    sudo apt-get install nload

在Fedora上使用以下命令进行安装。

    sudo yum install nload

**CentOS**用户该怎么办呢？ 只需要在你的机器上输入以下命令就可以安装成功。

    sudo yum install nload

以下的命令会帮助你在OpenBSD系统中安装nload。

    sudo pkg_add -i nload

在 linux 机器上的另外一个非常有效的安装软件的方式就是编译源代码，下载并安装最新的版本意味着能够获得更好地性能、更酷的特性以及更少的bug。

### 如何通过源代码安装nload ###

在从源代码安装nload之前，你需要首先下载源代码。 我通常使用wget工具来进行下载--该工具在许多linux机器上默认可用。该免费工具帮助用户以非交互式的方式从网络上下载文件，并支持以下协议：

- HTTP
- HTTPS
- FTP

通过以下命令来进入到**/tmp**目录中。

    cd /tmp

然后在你的终端中输入以下命令就可以将最新版本的nload下载到你的linux机器上了。

    wget http://www.roland-riegel.de/nload/nload-0.7.4.tar.gz

如果你不喜欢使用wget工具，也可以通过简单的一个鼠标点击轻松地从[官网][1]上下载其源代码。

由于该软件非常轻巧，其下载过程几乎在瞬间就会完成。接下来的步骤就是通过**tar**工具来将下载的源代码包进行解压。

tar归档工具可以用来从磁带或硬盘文档中存储或解压文件，该工具有许多可用的选项，但是我们只需要下面的几个选项来执行我们的操作。

1. **-x** 从归档中解压文件
1. **-v** 使用繁琐模式运行--用来显示详细信息
1. **-f** 用来指定归档文件

例如（LCTT 译注：tar 命令的参数前的“-”可以省略）：

    tar xvf example.tar

现在你学会了如何使用tar工具，我可以非常肯定你知道了如何从命令行中解压这个.tar文档。

    tar xvf nload-0.7.4.tar.gz

之后使用cd命令来进入到nload*目录中：

    cd nload*

在我的系统上看起来是这样的：

    oltjano@baby:/tmp/nload-0.7.4$

然后运行下面这个命令来为你的系统配置该软件包：

    ./configure

此时会有“一大波僵尸”会在你的屏幕上显示出来，下面的一个屏幕截图描述了它的样子。

![configuring packages for nload](http://blog.linoxide.com/wp-content/uploads/2015/01/nload1.png)

在上述命令完成之后，通过下面的命令来编译nload。

    make

![compiling nload](http://blog.linoxide.com/wp-content/uploads/2015/01/nload2.png)

好了，终于....，通过以下命令可以将nload安装在你的机器上了。

    sudo make install

![installing nload from source](http://blog.linoxide.com/wp-content/uploads/2015/01/nload3.png)

安装好nload之后就是让你学习如何使用它的时间了。

###如何使用nload###

我喜欢探索，所以在你的终端输入以下命令.

    nload

看到了什么？

我得到了下面的结果。

![running nload](http://blog.linoxide.com/wp-content/uploads/2015/01/nload4.png)

如上述截图可以看到,我得到了以下信息:

#### 流入量####

**当前下载速度**

![nload running on linux](http://blog.linoxide.com/wp-content/uploads/2015/01/nload4.1.png)

**平均下载速度**

![nload running on linux](http://blog.linoxide.com/wp-content/uploads/2015/01/nload4.2.png)

**最小下载速度**

![nload running on linux](http://blog.linoxide.com/wp-content/uploads/2015/01/nload4.3.png)

**最大下载速度**

![nload running on linux](http://blog.linoxide.com/wp-content/uploads/2015/01/nload4.4.png)

**总的流入量按字节进行显示**

![](http://blog.linoxide.com/wp-content/uploads/2015/01/nload4.5.png)

#### 流出量 ####

类似的同样适用于流出量

#### 一些nload有用的选项####

使用选项

       -u

用来设置显示流量单位。

下面的命令会帮助你使用MBit/s显示单元

    nload -u m

下面的屏幕截图显示了上述命令的结果。

![nload running on linux](http://blog.linoxide.com/wp-content/uploads/2015/01/nload5.png)

尝试以下命令然后看看有什么结果。

    nload -u g

![nload running on linux](http://blog.linoxide.com/wp-content/uploads/2015/01/nload6.png)

同时还有一个**-U**选项。根据手册描述，该选项基本上与-u选项类似，只是用在合计数据。 我测试了这个命令，老实说，当你需要检查总的流入与流出量时非常有用。

    nload -U G

![nload running on linux](http://blog.linoxide.com/wp-content/uploads/2015/01/nload7.png)

从上面的截图中可以看到，**nload -U G** 使用Gbyte来显示数据总量。

另外一个我喜欢使用的有用选项是 **-t**。 该选项用来设置刷新显示事件间隔，单位为毫秒，默认值为500毫秒。

我会通过下面的命令做一些小的实验。

    nload -t 130

那么上述命令做了什么呢？它将刷新显示时间间隔设置为130毫秒。 通常推荐不要将该时间间隔值设置为小于100毫秒，因为nload在生成报告时计算错误。

另外的一个选项为 **-a**， 在你想要设置计算平均值的时间窗口的秒数时使用，默认该值为300秒。

那么当你想要监控指定的网络设备该如何呢？ 非常容易， 像下面这样简单地指定设备或者列出想要监控的设备列表即可。

    nload wlan0

![nload monitoring wlan0 on linux](http://blog.linoxide.com/wp-content/uploads/2015/01/nload8.png)

下面的语法可帮助你监控指定的多个设备。

    nload [options] device1 device2 devicen

例如，使用下面的命令来监控eth0和eth1。

    nload wlan0 eth0

如果不带选项来运行nload，那么它会监控所有自动检测到的设备，你可以通过左右方向键来显示其中的任何一个设备的信息。

--------------------------------------------------------------------------------

via: http://linoxide.com/monitoring-2/monitor-network-usage-nload/

作者：[Oltjano Terpollari][a]
译者：[theo-l](https://github.com/theo-l)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/oltjano/
[1]:http://www.roland-riegel.de/nload/nload-0.7.4.tar.gz
