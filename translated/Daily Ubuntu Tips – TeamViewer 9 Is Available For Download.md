每日 Ubuntu 小技巧 - TeamViewer 9 可供下载了
================================================================================
TeamViewer，是一款热门的远程支持和桌面共享工具，并且它的 Windows版， Mac OS X版 和 Linux版(包含Ubuntu) 已经更新到版本 9 了。TeamViewer 能够允许你在任何地方通过网络控制任何电脑。

如果你在谈一桩生意有或者在帮助某人解决一些与电脑相关的问题，例如杀毒，又或者与在遥远的人共享你的屏幕内容，那同样，它也是一款值得拥有的强大的工具。

以下是这个支持工具是如何使用的例子。

最近，我的妈妈打电话给我说她想弄清楚如何安装一个程序。当我在电话中花了几分钟尝试帮她弄那个程序，不过都失败后，我决定自己来。

因此我们两个人都下载了 TeamViewer 并且在数分钟之内，我连接上了她的电脑并且帮她安装了那个程序。

那是个 TeamViewer 如何帮助你把东西搞定的例子，如果你准备使用 TeamViewer 来帮助你的顾客或者是客户的话，你可能需要购买一个授权许可来遵守公司的政策。

我宁愿在所有其他远程支持工具中选择 TeamViewer 的另外一个原因是它允许你直接使用而无需安装，至少在 Windows 上是这样。如果你只需要使用它一次的话，那么你只需要运行它，而它却不会占用你的磁盘空间。

现在 TeamViewer 能够在几乎所有操作系统上运行，包括 Android 和 IOS。

Windows 用户可以 [从这里下载 TeamViewer][1]

Ubuntu 用户可以 [从这链接下载并运行 TeamViewer][2]

在 Ubuntu 轻松安装 TeamViewer，运行下面的命令来下载安装程序

    wget http://download.teamviewer.com/download/teamviewer_linux.deb

对于 **64位操作系统**, 使用下面的链接.

    wget http://download.teamviewer.com/download/teamviewer_linux_x64.deb
 
最后，运行下面的命令来安装。

    sudo dpkg -i teamviewer_linux*.deb; sudo apt-get -f install

去爽吧！

![](http://www.liberiangeek.net/wp-content/uploads/2013/12/teamviewer9ubuntu.png)

如果上述的命令不能成功运行的话，那么就去 TeamViewer [下载页面并且下载][2].

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/12/daily-ubuntu-tips-teamviewer-9-is-available-for-download/

译者：[hyaocuk](https://github.com/hyaocuk) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.teamviewer.com/en/download/windows.aspx
[2]:http://www.teamviewer.com/en/download/linux.aspx
