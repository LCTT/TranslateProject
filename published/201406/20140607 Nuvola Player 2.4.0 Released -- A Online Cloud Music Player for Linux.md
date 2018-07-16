Linux下的在线云音乐播放器 —— Nuvola Player 2.4.0发布
================================================================================
**Nuvola Player**是一个开源的播放器，可以在其web界面中运行像Amazon云播放器，Bandcamp，Deezer，8tracks，Google Play音乐，Grooveshark，Hyper Machine以及Pandora等等云音乐服务，同时它也能整合到Linux桌面中。

该应用程序以插件的形式提供了大量的功能特性，像桌面通知、系统托盘、多媒体键、媒体播放器小程序、停靠栏菜单、歌词、last.fm等等。

**2014年5月31日**，**Nuvola Player 2.4.0**的一个新版本发布了 —— 它带来了一些新的特性，包括两个新的服务“Logitech Media Server”和“This is My Jam ”，以及众多的bug修复。

### 这个发布中有什么新东西 ###

- 删除了破损的隐藏Google+按钮选项，因为Google修改代码过于频繁了。
- 加快了服务设置的启用速度，不需要再重新加载。
- 修复了暂停和播放/暂停动作开关。
- 为Chrome添加了兼容问题警告桌面通知。
- 提供了页面内导航按钮（现在用户可以在Google Play标识旁边的顶部栏中找到它）。
- 添加了“Logitech Media Server”和“This is My Jam ”服务。
- 包含了对鼠标后退/前进按钮的支持。
- 修复了对GNOME锁屏通知的支持。

要查看完整的特性列表，请访问官方发行[声明页面][1]

## 在Debian, Ubuntu和Linux Mint中安装Nuvola Player ##

官方的Nuvola Player仓库中包含了**Ubuntu 14.04, 13.10, 12.10, 12.04**以及**Linux Mint 17, 16, 15, 14.**可用的二进制包，你可以通过添加Nuvola Player仓库到你的系统中来安装二进制包‘nuvolaplayer’。

### 在Ubuntu和Linux Mint上 ###

打开终端并运行以下一系列命令：

    $ sudo add-apt-repository ppa:nuvola-player-builders/stable
    $ sudo apt-get update
    $ sudo apt-get upgrade
    $ sudo apt-get install nuvolaplayer

**注**：请不要忽略系统更新命令‘sudo apt-get upgrade’，否则你的apt-get安装Flash插件可能会失败。

如果你不需要Nuvola Player支持Flash插件，你可以忽略系统升级命令，并使用以下命令来安装不带Flash支持得nuvolaplayer。

    $ sudo apt-get --no-install-recommends install nuvolaplayer

### 在Debian上 ###

对于**Debian Wheezy**和**Debian Sid**，可以从官方仓库中获取稳定的Nuvola Player二进制包。你可以使用下面这一堆命令来安装最新的稳定版。

首先，打开终端并导入公钥，然后添加仓库到‘**sources.list**‘文件，接着像下面这样进行一次系统更新来安装nuvolaplayer。

#### Debian Wheezy ####

    $ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 706C220A
    $ sudo sh -c 'echo "deb http://ppa.fenryxo.cz/nuvola-player/ wheezy main" >> /etc/apt/sources.list'
    $ sudo sh -c 'echo "deb-src http://ppa.fenryxo.cz/nuvola-player/ wheezy main" >> /etc/apt/sources.list'
    $ sudo apt-get update
    $ sudo apt-get install nuvolaplayer

#### Debian Sid ####

    $ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 706C220A
    $ sudo sh -c 'echo "deb http://ppa.fenryxo.cz/nuvola-player/ sid main" >> /etc/apt/sources.list'
    $ sudo sh -c 'echo "deb-src http://ppa.fenryxo.cz/nuvola-player/ sid main" >> /etc/apt/sources.list'
    $ sudo apt-get update
    $ sudo apt-get install nuvolaplayer

**注**：Nuvola Player依赖于打包的Flash插件，而该插件会因为存在库文件冲突（**GTK+ 2和**GTK+ 3**）而默认不会安装。

要解决该问题，我们需要启用flash**PPA**组件来安装‘**nuvolaplayer-flashplugin**‘包，命令如下。

    $ sudo sh -c 'echo "deb http://ppa.fenryxo.cz/nuvola-player/ sid main beta flash" >> /etc/apt/sources.list'
    $ sudo sh -c 'echo "deb-src http://ppa.fenryxo.cz/nuvola-player/ sid main beta flash" >> /etc/apt/sources.list'
    $ apt-get update
    $ apt-get install nuvolaplayer-flashplugin

一旦完成安装，你可以在**菜单**中找到该应用并启动它。记住，想要听音乐，你必须连接到互联网。

### Nuvola Player美图欣赏 ###

![Nuvola Player Services](http://www.tecmint.com/wp-content/uploads/2014/06/Nuvola-Player.jpeg)
选择音乐服务

![Grooveshark Music Service](http://www.tecmint.com/wp-content/uploads/2014/06/Nuvola-Player-01.jpeg)
Grooveshark音乐服务

![Grooveshark Playing Music](http://www.tecmint.com/wp-content/uploads/2014/06/Nuvola-Player-02.jpeg)
Grooveshark播放音乐

![Nuvola Player Preferences](http://www.tecmint.com/wp-content/uploads/2014/06/Nuvola-Player-03.jpeg)
Nuvola Player首选项

![Google Play Music](http://www.tecmint.com/wp-content/uploads/2014/06/Nuvola-Player-05.jpeg)
Google Play音乐

![Rdio Music Service](http://www.tecmint.com/wp-content/uploads/2014/06/Nuvola-Player-06.jpeg)
Rdio音乐服务

![About Nuvola Player](http://www.tecmint.com/wp-content/uploads/2014/06/Nuvola-Player-04.jpeg)
关于Nuvola Player

对于其它Linux发行版，你可以从 Nuvola Player[启动板下载][2]页下载源码tarball。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-nuvola-player-in-linux/

译者：[GOLinux](https://github.com/GOLinux) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://nuvolaplayer.fenryxo.cz/releases/2.4.html
[2]:https://launchpad.net/nuvola-player/+download
