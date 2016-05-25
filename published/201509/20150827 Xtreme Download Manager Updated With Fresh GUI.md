Xtreme 下载管理器升级带来全新用户界面
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/08/Xtreme-Download-Manager-Linux.jpg)

[Xtreme 下载管理器][1], 毫无疑问是[Linux界最好的下载管理器][2]之一 , 它的新版本名叫 XDM 2015 ，这次的新版本给我们带来了全新的外观体验！

Xtreme 下载管理器，也被称作 XDM 或 XDMAN，它是一个跨平台的下载管理器，可以用于 Linux、Windows 和 Mac OS X  系统之上。同时它兼容于主流的浏览器，如 Chrome, Firefox, Safari 等，因此当你从浏览器下载东西的时候可以直接使用 XDM 下载。

当你的网络连接超慢并且需要管理下载文件的时候，像 XDM 这种软件可以帮到你大忙。例如说你在一个慢的要死的网络速度下下载一个超大文件，或者你想要暂停和恢复下载的话， XDM 可以帮助你。

XDM 的主要功能：

- 暂停和恢复下载
- [从 YouTube 下载视频][3]，其他视频网站同样适用
- 强制聚合
- 下载加速
- 计划下载
- 下载限速
- 与浏览器整合
- 支持代理服务器

下面你可以看到 XDM 新旧版本之间的差别。

![Old XDM](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/08/Xtreme-Download-Manager-700x400_c.jpg)

*老版本XDM*

![New XDM](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/08/Xtreme_Download_Manager.png)

*新版本XDM*

### 在基于 Ubuntu 的 Linux 发行版上安装 Xtreme下载管理器 ###

感谢 Noobslab 提供的 PPA，你可以使用以下命令来安装 Xtreme 下载管理器。虽然 XDM 依赖 Java，但是托 PPA 的福，你不需要对其进行单独的安装。

    sudo add-apt-repository ppa:noobslab/apps
    sudo apt-get update
    sudo apt-get install xdman

以上的 PPA 可以在 Ubuntu 或者其他基于 Ubuntu 的发行版上使用，如 Linux Mint, elementary OS, Linux Lite 等。

#### 删除 XDM ####

如果你是使用 PPA 安装的 XDM ，可以通过以下命令将其删除：

    sudo apt-get remove xdman
    sudo add-apt-repository --remove ppa:noobslab/apps

对于其他Linux发行版，可以通过以下连接下载：

- [下载 Xtreme 下载管理器][4]

--------------------------------------------------------------------------------

via: http://itsfoss.com/xtreme-download-manager-install/

作者：[Abhishek][a]
译者：[mr-ping](https://github.com/mr-ping)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://xdman.sourceforge.net/
[2]:http://itsfoss.com/4-best-download-managers-for-linux/
[3]:http://itsfoss.com/download-youtube-videos-ubuntu/
[4]:http://xdman.sourceforge.net/download.html

