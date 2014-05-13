修复Ubuntu 14.04中Chromium的Adobe Flash Player的问题
================================================================================
[安装Ubuntu 14.04之后，先要做的几件事情][1]中其中一项是安装Adobe Flash Player。一般来说，如果安装了[Ubuntu Restricted Extras][2]，Flash Player应该可以工作而且你应该能够在网上观看在线视频，比如You Tube等网站上。

这不是Chromium和Ubuntu 14.04结合使用的原因。当你用其他的网页浏览器比如火狐、Chrome时，你可以轻松地播放You Tube等网站视频，在Chromium中你将会看到Adobe Flash player缺失插件的通知：

**Adobe Flash Player is required to display some elements on this page. Install plug-in..**

![](http://itsfoss.com/wp-content/uploads/2014/04/Flash_Player_Ubuntu_1404_Chromium.jpeg)

### 只有在Chromium中出现flash player问题的原因： ###

只有在Chromium中发生这个问题的原因是，之前Chromium使用Netscape Plugin API构架来支持Flash，从Ubuntu 14.04开始，[Chromium将会停止使用Netscape Plugin API][3]。今后，你将要面对Chromium中Adobe Flash Player的问题。

现在，为什么这个问题没有发生在其他浏览器上？答案是，因为它们使用 Flash Player 11.2。

### 修复Chromium上Adobe Flash Player的问题： ###

修复这个问题，我们将使用Pepper Flash Player，一个来自Google更安全更稳定的版本的Flash Player。在Ubuntu 14.04的源里有[Adobe Flash Player Pepper 安装器][4]。这个安装器下载Google Chrome，提取出Pepper Flash Player然后建立给Chromium使用。

要在Ubuntu 14.04安装Pepper Flash Player，打开一个终端，使用下面的命令：

    sudo apt-get install pepperflashplugin-nonfree
    sudo update-pepperflashplugin-nonfree --install
    
之后重启Chromium。不用重启系统。我希望这个帖子能够帮助你解决Chromium上Adobe Flash Player的问题。欢迎提出任何问题和建议。


--------------------------------------------------------------------------------

via: http://itsfoss.com/fix-flash-player-issue-chromium-in-ubuntu-14-04/

译者：[linuhap](https://github.com/linuhap) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://itsfoss.com/things-to-do-after-installing-ubuntu-14-04/
[2]:https://help.ubuntu.com/community/RestrictedFormats
[3]:http://blog.chromium.org/2013/09/saying-goodbye-to-our-old-friend-npapi.html
[4]:https://wiki.debian.org/PepperFlashPlayer
