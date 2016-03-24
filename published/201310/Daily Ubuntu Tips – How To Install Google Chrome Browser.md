每日Ubuntu小技巧——怎样安装谷歌Chrome浏览器
=======================================

对于刚刚开始使用Ubuntu并想安装谷歌Chrome浏览器的新用户来说，本文所介绍的方法是最快捷的。在Ubuntu上安装谷歌Chrome的方法有很多。一些用户喜欢直接在[谷歌Chrome下载页面][1]获得 **deb** 进行安装。

另一些用户喜欢通过来自Chromium的PPA进行安装。我更喜欢通过 **wget** 命令下载安装。通过命令行的方式是最快的，也是这篇文章想要告诉你的。

可能你已经知道，谷歌Chrome已经完成屌丝的逆袭，成为最流行的网络浏览器之一。实际上，这也是我最喜欢的浏览器。我最开始使用的是Internet Explorer，然后换成Firefox，最后又换成了谷歌Chrome。

我并不是想让你换浏览器，但是如果你想要在Ubuntu下使用Chrome，那么就去安装它吧。

要开始安装Chrome，你有一些选择。首先你可以使用浏览器去访问[谷歌Chrome下载页面][1]然后下载一个拷贝。如果你不喜欢使用命令行，你可以使用这个方法。

而对于喜欢使用终端命令行的用户来说，可以使用以下命令来下载。

    cd /tmp

对于谷歌Chrome**32位**版本，使用如下链接：

    wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb

对于64位版本可以使用如下链接下载：

    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

下载完后，运行如下命令安装。

    sudo dpkg -i google-chrome*; sudo apt-get -f install

然后就搞定了！安装完成后，到Unity Dash搜索Chrome就可以启动它了。

使用愉快!

--------------------------------------------------------------------------------

来自: http://www.liberiangeek.net/2013/10/daily-ubuntu-tips-install-google-chrome-browser/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[SCUSJS](https://github.com/scusjs) 校对：[Caroline](https://github.com/carolinewuyan)

[1]:https://www.google.com/intl/en/chrome/browser/#eula
