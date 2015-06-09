Cutegram: 一个GNU/Linux下不错的Telegram客户端
================================================================================
不需要再介绍**Telegram**了，对吧。Telegram是一款流行的免费即时通信工具，帮助你在全球与朋友聊天。不像Whatsapp，Telegram是永久免费、没有广告、没有订阅费用的。并且Telegram客户端也是开源的。Telegram在许多不同的平台中都有，包括Linux、Android、iOS、Windows Phone和Mac OS X。使用telegram发送的消息是高度加密且会自我销毁。它很安全，并且没有对你的多媒体和聊天的大小作限制。

在[先前的教程][1]中我们已经提到你可以在Ubuntu/Debian中安装Telegram。然而，有一个新的Telegram客户端叫**Cutegram**出现了，可以使你的聊天体验更加有趣和简单。

### Cutegram是什么？ ###

Cutegram是一款专注于用户友好、与Linux桌面环境兼容和易于使用的开源 telegram 的 GNU/Linux客户端。Cutegram使用Qt5、QML、libqtelegram、libappindication、AsemanQtTools技术和Faenzatu图标和Twitter emojie图片集。它在GPLv3许可证下免费发布。

### 安装 Cutegram ###

进入Cutegrm的首页病根据你的发行版版本选择最新的版本。我使用的是Ubuntu 64位版，所以我下载的是.deb文件。

    wget http://aseman.co/downloads/cutegram/cutegram_1.0.2-1-amd64.deb

现在，如下安装Cutegram：

    sudo apt-get install gdebi
    sudo gdebi cutegram_1.0.2-1-amd64.deb

对于其他发行版，运行下面的命令。

**64位:**

    wget http://aseman.co/downloads/cutegram/cutegram-1.0.2-linux-x64-installer.run

**32位:**

    wget http://aseman.co/downloads/cutegram/cutegram-1.0.2-linux-installer.run

设置执行权限：

    chmod a+x cutegram-1.0.2-linux*.run

如下进行安装。

    sudo ./cutegram-1.0.2-linux*.run

### 使用 ###

在菜单或者Unity dash中启动Cutegram。在登录界面，选择你的国家并输入电话号码，最好点击**Login**

![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/Cutegram_005.png)

一个验证码将会发送到你手机上。输入验证码并点击**Sign in**

![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/Cutegram_002.png)

你会看到

![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/Cutegram_003.png)

开始聊天吧！

![](http://1102047360.rsc.cdn77.org/wp-content/uploads/2015/01/Cutegram_004.png)

接着，你可以设置头像，开始新的聊天/群聊，或者使用左边面板的按钮开始秘密聊天。

玩得开心！干杯！！

更多细节，请关注[Cutegram 网站][2]

--------------------------------------------------------------------------------

via: http://www.unixmen.com/cutegram-better-telegram-client-gnulinux/

作者：[SK][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/
[1]:http://www.unixmen.com/install-telegram-desktop-via-ppa/
[2]:http://aseman.co/en/products/cutegram/
