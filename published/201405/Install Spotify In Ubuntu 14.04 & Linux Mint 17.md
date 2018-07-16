在Ubuntu/Mint中安装 Spotify
================================================================================
Spotify 是一个现今非常流行的流媒体音乐服务。不仅可以在网页上访问其服务，而且可以在 linux 中安装其桌面客户端。这个客户端增加了额外的功能，比如听播放本地音乐和同步本地音乐到Spotify 服务器、或同步本地音乐到iPhone 、iPod等其它移动设备。

在本文将讨论如何快速 **在 Ubuntu 14.04 安装 Spotify ** 以及其它基于 Debian 的发行版，如 Linux Mint, Elementary OS, Bodhi 等等。

### 在Ubuntu 14.04 和 Linux Mint 17 中安装 Spotify ###

现在开始安装 Spotify 桌面客户端，打开一个终端(Ctrl+Alt+T) 使用如下命令：

    sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list.d/spotify.list'

这行命令将增加上述仓库到软件的源列表，然后增加 GPG Key:

    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59

下一步比较简单。更新和安装 Spotify 客户端：

    sudo apt-get update
    sudo apt-get install spotify-client

这样就安装完成了。现在可以在Unity Dash (ubuntu 中) 上通过搜索Spotify 来启动它。在 Ubuntu 环境下，Spotify 客户端整合的非常好。这是 Spotify 在 Ubuntu 14.04 下的界面：

![](http://itsfoss.com/wp-content/uploads/2014/05/Spotify_Ubuntu_Linux.jpeg)

我希望本文能帮助你在 Ubuntu 和其它 Linux OS 下安装 Spotify 客户端。 我想这可以算作在 [安装 Ubuntu 14.04 之后需要做的事情][1]。 中的第一件。如何发现它呢? 使用过其它类似 Spotify 的服务吗? 一起来分享你的观点吧。

--------------------------------------------------------------------------------

via: http://itsfoss.com/install-spotify-ubuntu-1404/

译者：[liushui312](https://github.com/liushui312) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://itsfoss.com/things-to-do-after-installing-ubuntu-14-04/
