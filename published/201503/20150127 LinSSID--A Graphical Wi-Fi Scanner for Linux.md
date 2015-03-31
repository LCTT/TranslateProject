LinSSID：一款Linux下的图形化Wi-Fi扫描器
================================================================================
### 介绍 ###

你可能知道，**LinSSID** 是一款可以用于寻找可用无线网络的图形化软件。它完全开源，用C++写成，使用了Linux wireless tools、Qt5、Qwt6.1，它在外观和功能上与**Inssider** （MS Windows 下的）相近。

### 安装 ###

你可以使用源码安装，如果你使用的是基于DEB的系统比如Ubuntu和LinuxMint等等，你也可以使用PPA安装。

你可用从[这个][1]下载并安装LinSSID。

这里我门将使用PPA来安装并测试这个软件。

添加LinSSID的PPA并输入下面的命令安装。

    sudo add-apt-repository ppa:wseverin/ppa
    sudo apt-get update
    sudo apt-get install linssid

### 用法 ###

安装完成之后，你可以从菜单或者unity中启动。

你需要输入管理员密码。

![Password required for iwlist scan_001](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/Password-required-for-iwlist-scan_001.png)

这就是LinSSID的界面。

![LinSSID_002](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/LinSSID_002.png)

现在选择你想要连接无线网络的网卡，比如这里是wlan0，点击Play按钮来搜寻wi-fi网络列表。

几秒钟之后，LinSSID就会显示wi-fi网络了。

![LinSSID_003](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/LinSSID_003.png)

如你在上面的截屏中所见，LinSSID显示SSID名、MAC ID、通道、隐私、加密方式、信号和协议等等信息。当然，你可以让LinSSID显示更多的选项，比如安全设置、带宽等等。要显示这些，进入**View**菜单并选择需要的选项。同样，它显示了不同的通道中的信号随着时间信号强度的变化。最后，它可以工作在2.4Ghz和5Ghz通道上。

就是这样。希望这个工具对你有用。

干杯！！

参考链接：

- [LinSSID 主页][2]

--------------------------------------------------------------------------------

via: http://www.unixmen.com/linssid-graphical-wi-fi-scanner-linux/

作者：[SK][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/
[1]:http://sourceforge.net/projects/linssid/files/
[2]:http://sourceforge.net/projects/linssid/
