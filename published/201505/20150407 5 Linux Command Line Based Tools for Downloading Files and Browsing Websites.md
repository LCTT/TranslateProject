5 个基于Linux命令行的文件下载和网站浏览工具
================================================================================

Linux命令行是GNU/Linux中最神奇迷人的部分，它是非常强大的工具。命令行本身功能多样，多种内建或者第三方的命令行应用使得Linux变得更加健壮和强大。Linux Shell支持多种不同类型的网络应用，无论是BT下载软件，专用下载器或者互联网冲浪。

![命令行互联网工具](http://www.tecmint.com/wp-content/uploads/2014/02/Command-Line-Internet-Tools.jpg)

*5个命令行互联网工具*

这里我们介绍了5个很好的命令行互联网工具，它们非常有用，也很容易上手。

### 1. rTorrent ###

rTorrent是基于文本，用C++编写，追求高性能的Torrent客户端。支持大部分标准的Linux发行版，包括FreeBSD和Mac OS X。

#### 安装rTorrent ####

    # apt­-get install rtorrent    (基于 APT 的系统)

----------

    # yum install rtorrent        (基于 YUM 的系统)

在终端中用下面的命令检查rtorrent是否正确安装

    # rtorrent

![命令行torrent下载器](http://www.tecmint.com/wp-content/uploads/2014/02/rTorrent.jpeg)

*rTorrent命令行工具*

#### rTorrent的功能 ####

一些有用的快捷键和使用方法

- CTRL+ q – 退出rTorrent应用程序
- CTRL+ s – 开始下载
- CTRL+ d – 停止运行中的下载或者移除已完成的下载
- CTRL+ k – 停止并关闭运行中的下载
- CTRL+ r – 在上传/下载种子之前进行Hash检查
- CTRL+ q – 执行两次这个命令，rTorrent会直接退出而不发送“停止”信号
- Left Arrow Key – 跳到上一屏幕
- Right Arrow Key – 跳到下一屏幕

### 2. Wget ###

Wget是GNU项目的一部分，名字由World Wide Web (WWW)衍生而来。Wget是用来递归下载、离线查看本地服务器HTML文件一个很好的工具，它可用于Windows， Mac，以及Linux等大部分平台。Wget能通过HTTP，HTTPS和FTP下载文件。另外，能镜像整个网站，支持代理浏览以及暂停/回复下载使得它更为有用。

#### 安装Wget ####

由于是GNU项目的一部分，Wget捆绑在大部分标准Linux发行版中，不再需要独立下载安装。如果默认没有安装，你也可以使用apt或者yum安装。

    # apt­-get install wget        (基于 APT 的系统)

----------

    # yum install wget        (基于 YUM 的系统)

#### Wget的一些基本用法 ####

使用wget下载一个单独的文件.

    # wget http://www.website-name.com/file

递归下载整个网站.

    # wget -r http://www.website-name.com

从一个网站下载指定类型的文件(例如 pdf 和 png).

    # wget -r -A png,pdf http://www.website-name.com

Wget是一个很棒的工具，它允许在资源有限的机器上自定义或者过滤下载。这是镜像一个网站(Yahoo.com)的wget下载截图。

![Wget 下载文件](http://www.tecmint.com/wp-content/uploads/2014/02/Wget.jpeg)

*Wget 命令行文件下载*

要获取更多wget下载的例子，可以阅读我们的文章[Wget下载命令例子][1]。

### 3. cURL ###

cURL是在多种协议上传输数据的命令行工具。cURL是支持FTP, HTTP, FTPS, TFTP, TELNET, IMAP, POP3等协议的客户端应用。cURL是一个不同于wget 的简单下载器，和其它的相比，它支持LDAP，POP3。cURL也很好的支持代理下载，暂停下载以及恢复下载。

#### 安装cURL ####

在软件仓库或者已安装软件中，cURL在大部分发行版中默认是可用的。如果没有安装，运行apt或者yum从软件仓库中获取需要的安装包。

    # apt­-get install curl        (基于 APT 的系统)

----------

    # yum install curl        (基于 YUM 的系统)

cURL的基本使用方法

    # curl www.tecmint.com

![Curl 下载](http://www.tecmint.com/wp-content/uploads/2014/02/Curl.jpeg)

*Curl 下载*

![Curl 下载数据](http://www.tecmint.com/wp-content/uploads/2014/02/Curl-2.jpeg)

*Curl 下载*

### 4. w3m ###

W3m是GPL协议下发布的基于文本的web浏览器。W3m支持表格，帧，颜色，SSL连接以及内联图像。W3m以快速浏览而出名。

#### 安装w3m ####

W3m在大部分Linux发行版中也是默认可用的。如果不可用的话可以用apt或者yum获取需要的安装包。

    # apt­-get install w3m        (基于 APT 的系统)

----------

    # yum install w3m        (基于 YUM 的系统)

#### w3m的基本使用方法 ####

    # w3m www.tecmint.com

![命令行浏览器](http://www.tecmint.com/wp-content/uploads/2014/02/w3m.jpeg)

*基于文本的web浏览器w3m*

### 5. Elinks ###

Elinks是基于文本的免费浏览器，用于Unix及基于Unix的系统。Elinks支持 HTTP，HTTP Cookies以及支持浏览Perl和Ruby脚本（LCTT 译注：应该是指 CGI）。也很好的支持选项卡浏览。最棒的是它支持鼠标、彩色以及支持一系列的协议，例如HTTP, FTP, SMB, Ipv4 和 Ipv6。

#### 安装Elinks ####

Elinks在大部分Linux发行版上是默认可用的。如果不是的话，可以通过apt或者yum安装。

    # apt­-get install elinks    (基于 APT 的系统)

----------

    # yum install elinks        (基于 YUM 的系统)

Elinks的基本使用方法

    # elinks www.tecmint.com

![命令行互联网浏览](http://www.tecmint.com/wp-content/uploads/2014/02/Elinks.jpeg)

*Elinks命令行浏览互联网*

就是这些了。有你们喜欢读的有趣的文章，我会再次来到这里。到那时尽请关注并保持和Tecmint的联系，别忘了在评论部分给我们你的宝贵的反馈。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-command-line-tools-for-downloading-files/

作者：[Avishek Kumar][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:https://linux.cn/article-4129-1.html