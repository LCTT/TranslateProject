每日Ubuntu小技巧 - 在Ubuntu中使用Spotify(声破天，音乐软件)
================================================================================

Spotify（译者注：下面用"声破天"代替）云音乐服务刚为所有用户及平台（web端/桌面端/手机端）解除时间限制，现在用户可以在任何平台、任何时间无限制的听免费音乐。

起初，声破天有个第一次注册的帐号只能免费听音乐6个月的限制，但是这个限制取决于你所在的国家，不过现在任何免费的帐号都可以无限制的听音乐。

任何使用Ubuntu桌面客户端听音乐的用户也是没有之前对免费账户听音乐的限制，Ubuntu用户可以使用他们最喜欢的桌面操作系统来享受免费音乐。

如果你现在已经有点激动了，但还没有安装声破天，那么这里有一个快捷方法来告诉你如何在Ubuntu上面安装最新版本的声破天。

对于一些处于声破天不支持注册的国家地区的用户来说，他们必须得想点别的办法了（译者注：需要使用代理），这是因为声破天并不是支持所有国家。下面图片显示的是目前声破天支持的国家列表：

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/spotifycountrylist.jpg)

### 在Ubuntu安装上声破天 ###

为了能在Ubuntu上面安装声破天，需要打开终端然后输入下面的命令，将声破天的软件仓库添加到Ubuntu

    sudo apt-add-repository -y "deb http://repository.spotify.com stable non-free"

下一步，将声破天的仓库密钥添加到Ubuntu，运行下面命令：

    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59

最后，更新系统的软件包仓库并且安装声破天，运行下面命令：

    sudo apt-get update && sudo apt-get install spotify-client

就是这样简单，我们完成了声破天的安装！

在安装完声破天后，你需要打开Ubuntu的面板，在里面找到这个软件。打开后，你就可以尽情享受你的免费音乐吧！

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/spotifyclientubuntu.png)

尽情享受吧! 

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/01/daily-ubuntu-tips-use-spotify-in-ubuntu-linux/

译者：[liuaiping](https://github.com/liuaiping) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
