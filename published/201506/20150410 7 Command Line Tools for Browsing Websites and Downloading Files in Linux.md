Linux中7个用来浏览网页和下载文件的命令
================================================================================
上一篇文章中，我们提到了`rTorrent`、`wget`、`cURL`、`w3m`、`Elinks`等几个有用的工具，很多人回信说还有其它几个类似的工具也值得讨论，所以就有了这篇文章。如果错过了第一部分的讨论，可以通过下面的链接来回顾。

- [5 个基于Linux命令行的文件下载和网站浏览工具][1]

这篇文章介绍了Linux下用于浏览网页和下载文件的其它几个命令行工具。

### 1. links ###

Links是用C语言写的一个开源web浏览器，支持包括Linux、Windows、OS X和OS/2在内的所有主流平台。它提供了基于文本和图形界面两种版本。大多数标准的Linux发行版都默认包含了基于文本的版本。如果您的发行版中默认没有安装links，可以通过包管理工具进行安装。Elinks是links的一个衍生版本。

    # apt-get install links
    # yum install links

安装完成后，您可以像下图中那样使用命令浏览任意网页。

    # links www.tecmint.com

在links中，可以使用键盘上的上下箭头键进行浏览。在超链接上按下右箭头会打开它，按下左箭头会返回到上一页面，按q键退出。

下图展示了如何使用links访问Tecmint的网站。

![](http://www.tecmint.com/wp-content/uploads/2015/04/links-browse-websites-terminal.gif)

如何你想安装links的图形界面版本，可能需要从[http://links.twibright.com/download/][2]下载最新的版本（version 2.9）的源代码压缩包。

同样，也可以像下面那样使用wget下载安装。

    # wget http://links.twibright.com/download/links-2.9.tar.gz
    # tar -xvf links-2.9.tar.gz
    # cd links-2.9
    # ./configure –enable-graphics
    # make
    # make install

**注意**：links源代码的编译需要安装libpng, libjpeg, TIFF library, SVGAlib, XFree86, C Compiler 和 make这几个包。

### 2. links2 ###

Links是Twibright实验室编写的web浏览器，而Links2是基于它的一个图形化版本。Links2支持鼠标点击，设计强调速度，不支持任何CSS，在一定程度上很好地支持了HTML和JavaScript。

通过下面的命令安装Links2。

    # apt-get install links2
    # yum install links2

### 3. lynx ###

lynx是一个基于文本的web浏览器，使用GNU GPLv2协议发布，用ISO C编写。lynx是一个可高度配置的web浏览器，是许多系统管理员的救世主，有最悠久的web浏览器之称，并且至今仍然处在积极开发中。

通过下面的命令安装lynx。

    # apt-get install lynx
    # yum install lynx

安装完成后，可以像下图中那样使用这个命令浏览网页。

    # lynx www.tecmint.com

![](http://www.tecmint.com/wp-content/uploads/2015/04/lynx-commandline-web-browsing.gif)

如果你想对links和lyns了解更多，可以访问下面的链接。

- [使用Lynx和Links命令浏览网页][3]

### 4. youtube-dl ###

youtube-dl是一个跨平台的应用，可以用来下载youtube和另外几个网站上的视频。它主要使用python开发，使用GNU GPL协议发布，并且超越了法律约束。（youtube不允许用户下载视频，因此使用youtube-dl可能会导致违法。使用该工具之前请您仔细阅读相关法律。）

使用如下命令安装youtube-dl。

    # apt-get install youtube-dl
    # yum install youtube-dl

安装完成后，可以用如下命令像图中那样从youtube网站下载视频。

    # youtube-dl https://www.youtube.com/watch?v=ql4SEy_4xws

![](http://www.tecmint.com/wp-content/uploads/2015/04/download-youtube-videos-from-terminal.gif)

如果你想对youtube-dl了解更多，可以访问如下链接。

- [YouTube-DL – Linux下的youtube视频下载工具][4]

### 5. fetch ###

fetch是类unix系统下的一个检索URL的命令，支持许多选项，例如只检索ipv4或ipv6地址，无重定向，检索请求成功时退出，自动重试等。

fetch可以从通过下面的链接下载和安装。

- [http://sourceforge.net/projects/fetch/?source=typ_redirect][5]

编译安装之前，需要安装HTTP Fetcher，可以通过下面的链接下载。

- [http://sourceforge.net/projects/http-fetcher/?source=typ_redirect][6]

### 6. Axel ###

Axel是Linux下的一个基于命令行的下载加速器，可以对请求使用多线程和多个http和ftp连接加速。

使用下面的命令安装Axel。

    # apt-get install axel
    # yum install axel

Axel安装完成后，可以像下图那样使用这个命令下载任意文件。

    # axel http://mirror.cse.iitk.ac.in/archlinux/iso/2015.04.01/archlinux-2015.04.01-dual.iso

![](http://www.tecmint.com/wp-content/uploads/2015/04/download-accelarator-for-linux.gif)

### 7. aria2 ###

aria2是一个轻量级的基于命令行的下载工具，并且支持多种协议（(HTTP, HTTPS, FTP, BitTorrent以及Metalink）。它可以使用.metalinks文件从多台服务器同时下载ISO文件。

使用下面的命令安装aria2。

    # apt-get install aria2
    # yum install aria2

aria2安装完成后，可以像下图那样运行这个命令下载任意文件。

    # aria2c http://cdimage.debian.org/debian-cd/7.8.0/multi-arch/iso-cd/debian-7.8.0-amd64-i386-netinst.iso

![Aria2: Linux的命令行下载工具 ](http://www.tecmint.com/wp-content/uploads/2015/04/Download-Files-in-Terminal.gif)

*Aria2: Linux命令行下载工具*

目前就这么多了。稍后咱们讨论另一个有意思的话题。请保持联系，常来Tecmint逛逛。别忘了在评论中给我们提供您的宝贵反馈，您的喜爱和分享帮助我们不断前行。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/command-line-web-browser-download-file-in-linux/

作者：[Avishek Kumar][a]
译者：[fyh](https://github.com/fyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:https://linux.cn/article-5546-1.html
[2]:http://links.twibright.com/download/
[3]:http://www.tecmint.com/command-line-web-browsers/
[4]:http://www.tecmint.com/install-youtube-dl-command-line-video-download-tool/
[5]:http://sourceforge.net/projects/fetch/?source=typ_redirect
[6]:http://sourceforge.net/projects/http-fetcher/?source=typ_redirect
[7]:http://www.tecmint.com/install-aria2-a-multi-protocol-command-line-download-manager-in-rhel-centos-fedora/
