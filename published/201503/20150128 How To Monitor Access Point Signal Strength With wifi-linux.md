如何用wifi-linux检测AP信号强度
================================================================================
作为一名python极客，我喜欢在github上挖掘新的用于linux用户的python工具。今天我发现了一款用python写成的用于检测AP信号强度的工具：wifi-linux。

我已经在**wifi-linux**上实验了大约两个小时，并且它工作的很好但是我希望在不久的将来在作者那里看到一些单元测试，因为命令**plot**无法在我的电脑上工作，并且会导致一些问题。

### 什么是wifi-linux ###

根据github上作者账号的官方的 readme.md文件， wifi-linux是一个简单的收集你周围AP的RSSI信息的python脚本，它还会画出RSSI活动图形。

作者说可以在该程序中可以使用plot命令绘制RSSI 活动图形，但是不幸的是，这对我不可行。wifi-linux也支持其他的命令，比如**bp** 来加入一个断点，**print**会打印一些统计和**启动开关**。

wifi-linux程序有下面这些依赖：

- dbus-python
- gnuplot-py

首先我们需要安装所有的包依赖以使它可以运行在我们的linux机器上。

### 安装wifi-linux需要的包 ###

我尝试使用python包管理工具pip安装python-dbus但是失败了，因为pip会查找setup.py，但是python-dbus中没有。因此下面的命令不工作。

    pip install dbus-python

你可以试一下但是很有可能会在终端中出现下面的错误。

    IOError: [Errno 2] No such file or directory: '/tmp/pip_build_oltjano/dbus-python/setup.py'

我该怎么解决这个问题呢？很简单，用下面命令中的系统包管理工具来安装Python DBUS。

    sudo apt-get install python-dbus

上面的命令只有在有apt-get包管理器的机器中才可以使用，比如Debian和Ubuntu。

我们要安装的第二个依赖是gnuplot-py。下载并用tar解压，接着运行setup.py来安装包。

第一步是下载gnuplot-py。

    wget http://prdownloads.sourceforge.net/gnuplot-py/gnuplot-py-1.8.tar.gz

接着使用tar工具解压。

    tar xvf gnuplot-py-1.8.tar.gz

接着使用cd命令改变目录。

    cd gnuplot-py-1.8

接着运行下面的命令在你的系统中安装gnuplot-py。

    sudo setup.py install

安装完成后，你就可以在你的系统中运行wifi-linux了。只需下载并用下面的命令运行脚本。

用下面的命令下载wifi-linux到你的机器中。

    wget https://github.com/dixel/wifi-linux/archive/master.zip

解压master.zip接着使用下面的命令运行list_rsssi.py脚本。

    python list_rssi.py

下面的截图说明wifi-linux在工作了。

![wifi-linux to monitor wifi signal strength](http://blog.linoxide.com/wp-content/uploads/2015/01/wifi-linux.png)

命令**bp**用于像下面那样添加一个断点。

![the bp command in wifi-linux](http://blog.linoxide.com/wp-content/uploads/2015/01/wifi-linux2.png)

命令**print**可以用于在终端上显示你机器的状态。下面就是一个例子。

![the print command](http://blog.linoxide.com/wp-content/uploads/2015/01/wifi-linux3.png)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/monitor-access-point-signal-strength-wifi-linux/

作者：[Oltjano Terpollari][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/oltjano/
