Ubuntu14.04或Mint17如何安装Kodi14（XBMC）
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/Kodi_Xmas.jpg)

[Kodi][1]，原名就是大名鼎鼎的XBMC，发布[最新版本14][2]，命名为Helix。感谢官方XMBC提供的PPA，现在可以很简单地在Ubuntu14.04中安装了。

Kodi是一个优秀的自由和开源的（GPL）媒体中心软件，支持所有平台，如Windows, Linux, Mac, Android等。此软件拥有全屏幕的媒体中心，可以管理所有音乐和视频，不单支持本地文件还支持网络播放，如Tube，[Netflix][3], Hulu, Amazon Prime和其他串流服务商。

### Ubuntu 14.04, 14.10 和 Linux Mint 17 中安装XBMC 14 Kodi Helix ###

再次感谢官方的PPA，让我们可以轻松安装Kodi 14。
支持Ubuntu 14.04, Ubuntu 12.04, Linux Mint 17, Pinguy OS 14.04, Deepin 2014, LXLE 14.04, Linux Lite 2.0, Elementary OS and 其他基于Ubuntu的Linux 发行版。
打开终端（Ctrl+Alt+T）然后使用下列命令。

    sudo add-apt-repository ppa:team-xbmc/ppa
    sudo apt-get update
    sudo apt-get install kodi

需要下载大约100MB，在我的观点这不是很大。若需安装解码插件，使用下列命令：

    sudo apt-get install kodi-audioencoder-* kodi-pvr-*

#### 从Ubuntu中移除Kodi 14 ####

从系统中移除Kodi 14 ，使用下列命令：

    sudo apt-get remove kodi

同样也应该移除PPA软件源：

    sudo add-apt-repository --remove ppa:team-xbmc/ppa

我希望这个简单的文章可以帮助到你，在Ubuntu, Linux Mint 和其他 Linux版本中轻松安装Kodi 14。
你怎么发现Kodi 14 Helix?
你有没有使用其他的什么媒体中心？
可以在下面的评论区分享你的观点。

--------------------------------------------------------------------------------

via: http://itsfoss.com/install-kodi-14-xbmc-in-ubuntu-14-04-linux-mint-17/

作者：[Abhishek][a]
译者：[Vic020/VicYu](http://www.vicyu.net)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://kodi.tv/
[2]:http://kodi.tv/kodi-14-0-helix-unwinds/
[3]:http://itsfoss.com/watch-netflix-in-ubuntu-14-04/
