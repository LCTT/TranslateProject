每日Ubuntu小技巧——在Ubuntu中使用音乐软件“声破天”Spotify
================================================================================

Spotify（译者注：下面译为"声破天"）云音乐服务已经解除了对所有用户及平台（web端/桌面端/手机端）的时间限制，现在用户可以在任何平台、任何时间无限制地听免费音乐。

起初，声破天有个时间限制，新用户自注册帐号时起的前六个月可以免费听音乐，但是这个限制取决于你所在的地区，不过现在所有免费帐号都可以无限制听音乐。

任何使用 Ubuntu 桌面客户端听音乐的用户也没有了之前对免费账户听音乐的限制，Ubuntu 用户可以使用他们最喜欢的桌面操作系统来享受免费音乐。

如果你现在有点小激动，但是还没有安装声破天，那么这里有一个快捷方法来指导你如何在 Ubuntu 上安装最新版本的声破天。

一些地区还不支持声破天的注册，这些地区的用户必须得想点别的办法了（译者注：需要使用代理），这是因为声破天并不是所有国家都支持。下面图片显示的是目前声破天支持的国家列表：

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/spotifycountrylist.jpg)

### 在 Ubuntu 安装上声破天 ###

要想在 Ubuntu 上安装声破天，需要打开终端然后输入下面命令，将声破天的软件仓库添加到 Ubuntu

    sudo apt-add-repository -y "deb http://repository.spotify.com stable non-free"

下一步，将声破天的仓库密钥添加到 Ubuntu，运行下面命令：

    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59

最后，更新系统的软件包仓库并且安装声破天，运行下面命令：

    sudo apt-get update && sudo apt-get install spotify-client

就这么简单！

在安装完声破天后，你需要打开 Ubuntu 的面板，在里面找到这个软件。打开后，尽情享受你的免费音乐吧！

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/spotifyclientubuntu.png)


--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/01/daily-ubuntu-tips-use-spotify-in-ubuntu-linux/

译者：[liuaiping](https://github.com/liuaiping) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
