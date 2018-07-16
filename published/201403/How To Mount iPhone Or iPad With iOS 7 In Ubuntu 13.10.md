在Ubuntu 上怎么连接装有iOS 7的iPhone或iPad
================================================================================
在几个月前我买了一个安装了iOS 7系统的iPhone 5手机。当我试着把iPhone或者iPad连接到Linux电脑（Ubuntu和Linux Mint）上时，它能够被识别，会提示我：“是否信任这台电脑”？

![](http://itsfoss.com/wp-content/uploads/2014/01/ios7-trust_this_computer1.jpeg)

然后我心中默念“我会的”，选择了“信任”，在等待了几秒后，它又重新提示我“是否信任这台电脑”？我继续点了“信任”。然后又提示同样的问题。我感觉我的手机陷入了一个while(true)的死循环。在Ubuntu而在我的Ubuntu电脑上，它只是提示我的iPhone被锁定了，所以我不能访问上面的文件。

![](http://itsfoss.com/wp-content/uploads/2014/02/iPhone_issue_with_Ubuntu.png)

在网络上搜索了一会，我才知道这个**iOS 7在Linux系统上是否信任这台电脑的死循环**是一个已知的[问题][1]。

这实际上是[iOS 7系统的一个新安全特性][2]，针对解决假冒的iPhone充电器问题。既然这样，那这篇文章在说什么？有没有办法**解决iOS 7在Linux系统中的“信任这台电脑”的问题**？[libimobiledevice][1]库希望在1.1.6版本中去解决这个问题，只不过稳定版本却一直遥遥无期。
不过别灰心，你仍然可以使用libimobiledevice的非稳定版本，然后轻松地连接你的iPhone和Ubuntu。让我来告诉你，怎么把iPhone手机连接到Ubuntu 13.10或者Linux Mint 16上，而不会有“信任这台电脑”的麻烦。

### 在Ubuntu 12.04上解决iOS 7的“信任这台电脑”问题: ###

如果你安装的是Ubuntu 12.04 LTS（32位或64位）或者Linux Mint 13 Maya，你可以添加下面[Ingo Haschler][4]的PPA源：

    sudo apt-add-repository ppa:ingo/ios7support
    sudo apt-get update
    sudo apt-get upgrade

之后，libimobiledevice库（已经安装过）会升级到不稳定的1.6版本，然后重启你的电脑，再重新连接iPhone。现在，它应该可以正常使用了。

#### 说明: ####

如果你碰到“锁定错误”，那么再试试下面的命令：

    sudo mkdir /var/lib/lockdown
    sudo chmod 777 /va7Lib/lockdown

### 在Ubuntu 13.10上解决iOS 7的“信任这台电脑”问题: ###

对于资深的Linux用户，你可以从[GitHub][5]上下载源码然后自己编译。对于使用**Ubuntu 13.10 64位**和**Linux Mint 16 64位**系统的用户，有个[Iuri Diniz][6]编译好的Debian包可以用，你可以下载安装这个.deb包，然后就可以很轻松地在Ubuntu 13.10 64位系统上看到你的iPhone了。

- [Ubuntu 13.10 & Linux Mint 16 64位系统可用的libimobiledevice 1.6][7]

双击下载后的.deb文件进行安装。提醒一下，因为Ubuntu和Linux Mint默认已经安装了这个库，所以你看到的会是升级库libimobiledevice，而不是安装它。

![](http://itsfoss.com/wp-content/uploads/2014/02/install_libimobiledevice_Ubuntu.jpeg)

在装好后，你的iPhone或者iPad应该可以正常连接电脑了。下面是一张我把我的iPhone连接到一台Ubuntu 13.10电脑上的截图。

![](http://itsfoss.com/wp-content/uploads/2014/02/iPhone_Ubuntu_Linux.jpeg)

我可以访问手机上的文件，还可以从Ubuntu传送文件到iPhone。它还会被Rythembox软件认到并开始同步歌曲。这不是第一次，我在把移动设备接到Ubuntu上碰到问题。上次，我写过[怎么连接Kindle Fire HD和Ubuntu][8]。

我希望这个快速教程也可以解决你可能碰到的“信任这台电脑”的死循环问题。如果这个方法管用，或者你仍然还是不能把你的饿iPhone连接到Ubuntu上，都可以联系我。Ciao ![](http://itsfoss.com/wp-includes/images/smilies/icon_smile.gif)

--------------------------------------------------------------------------------

via: http://itsfoss.com/mount-iphone-ipad-ios-7-ubuntu-13-10/

译者：[zpl1025](https://github.com/zpl1025) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1207812
[2]:http://www.macobserver.com/tmo/article/apple-fixes-threat-from-fake-iphone-chargers-in-ios-7
[3]:http://www.libimobiledevice.org/
[4]:https://launchpad.net/~ingo
[5]:https://github.com/libimobiledevice/libimobiledevice
[6]:https://launchpad.net/~iuridiniz
[7]:https://bugs.launchpad.net/ubuntu/+source/libimobiledevice/+bug/1207812/+attachment/3941542/+files/libimobiledevice4_1.1.6-git20140105_amd64.deb
[8]:http://itsfoss.com/how-to-connect-kindle-fire-hd-with-ubuntu-12-10/
