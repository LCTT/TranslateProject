[小技巧]修复Moka图标主题丢失的扬声器图标
================================================================================

[Moka][1]是一个漂亮的图标主题，它在[Ubuntu可用的最佳图标主题][2]中扮演着重要的角色。但在Ubuntu 14.04中，Moka有那么点小缺憾。如果你在Ubuntu 14.04的Unity中使用摩卡，你会发现用于调节声音的扬声器图标不见了：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/07/Moka_Missing_Sound_Icon.jpeg)

### 使用Moka图标主题时修复丢失的声音图标 ###

虽然你可能已经添加的官方Moka PPA源，但为了检查起见，再次添加它吧：

    sudo add-apt-repository ppa:moka/stable
    sudo apt-get update

现在，接下来要做的是安装单色面板图标。使用下面的命令来安装：

    sudo apt-get install faba-mono-icons

一旦你安装完Faba单色图标后，将你的图标主题从Moka修改为Faba。这会给你Unity中的Moka图标主题的顶部面板配上漂亮的单色图标：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/07/Moka_With_Sound_Icons.jpeg)

我希望这会帮助你修复丢失的声音图标。享受Moka带来的点点滴滴吧。

--------------------------------------------------------------------------------

via: http://itsfoss.com/fix-missing-speaker-icon-from-moka/

原文作者：[Abhishek][a]

译者：[GOLinux](https://github.com/GOLinux) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://mokaproject.com/
[2]:http://itsfoss.com/best-icon-themes-ubuntu-1404/
