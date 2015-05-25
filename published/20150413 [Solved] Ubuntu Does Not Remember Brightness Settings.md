如何解决 Ubuntu 下不能记住亮度设置的问题
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/04/Fix_Ubuntu_Brightness_Issue.jpg)

在[解决亮度控制在Ubuntu和Linux Mint下不工作的问题][1]这篇教程里，一些用户提到虽然问题已经得到解决，但是**Ubuntu无法记住亮度设置**，同样的情况在Linux Mint下也会发生。每次开机或从睡眠状态下唤醒，亮度会恢复至最大值或最小值。我知道这种情况很烦。不过幸好我们有很简单的方法来解决**Ubuntu和Linux Mint下的亮度问题**。

### 解决Ubuntu和Linux下不能记住亮度设置 ###

[Norbert][2]写了一个脚本，能让Ubuntu和Linux Mint记住亮度设置，不论是开机还是唤醒之后。为了能让你使用这个脚本更简单方便，他把这个适用于Ubuntu 12.04、14.04和14.10的PPA挂在了网上。你需要做的就是输入以下命令：

    sudo add-apt-repository ppa:nrbrtx/sysvinit-backlight
    sudo apt-get update
    sudo apt-get install sysvinit-backlight

安装好之后，重启你的系统。现在就来看看亮度设置有没有被保存下来吧。

希望这篇小贴士能帮助到你。如果你有任何问题，就[来这儿][3]提bug吧。

--------------------------------------------------------------------------------

via: http://itsfoss.com/ubuntu-mint-brightness-settings/

作者：[Abhishek][a]
译者：[ZTinoZ](https://github.com/ZTinoZ)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://itsfoss.com/fix-brightness-ubuntu-1310/
[2]:https://launchpad.net/~nrbrtx/+archive/ubuntu/sysvinit-backlight/+packages
[3]:https://launchpad.net/~nrbrtx/+archive/ubuntu/sysvinit-backlight/+packages
