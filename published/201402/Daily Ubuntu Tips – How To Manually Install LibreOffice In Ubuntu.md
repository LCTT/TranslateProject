每日 Ubuntu 小贴士——如何在 Ubuntu 中手动安装 LibreOffice
================================================================================

这个简短教程将指导你如何在 Ubuntu 中手动安装 LibreOffice。正如你所知，LibreOffice 已经预装在 Ubuntu 中了。

这个版本是 Ubuntu 的定制版本，能够在 Ubuntu 中更好的工作。它也集成了 Ubuntu 的应用菜单和其它设置。

[下载页面][1]中的 LibreOffice 官方版本和你从 Ubuntu 获得的默认版本是不同的。你获得的并不是一个非标准版本，但它稍加定制再加入到 Ubunut 软件库中。

如果你想使用 LibreOffice 的官方标准版，你必须从[下载页面][1]手动下载。这意味着，完全卸载当前版本并从官方下载页面下载.deb包。

要做到这一点你必须先完全从 Ubuntu 中清除 LibreOffice。

### 从 Ubuntu 中卸载 LibreOffice ###

要在 Ubuntu 中手动安装 LibreOffice 的官方版本，必须先卸载当前版。在 Ubuntu 中要卸载 LibreOffice，运行下面的命令。

    sudo apt-get remove --purge libreoffice* && sudo apt-get autoremove

运行以上命令之后，重启你的电脑。当你再次登录以后，从[下载页面][1]下载 LibreOffice 的.deb包。

### 在 Ubuntu 中手动安装 LibreOffice ###

下载.deb包后，打开终端，在你的 home 目录进入 Downloads 文件夹。默认情况下，Firefox下载的文件保存在那里。

    cd ~/Downloads

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/libreofficemanualinstall.png)

然后运行下面的命令来提取下载文件中的.tar.gz文件。

    tar -xvf LibreOffice_*.tar.gz

解压.tar.gz文件后，你会在 Downloads 文件夹下看到一个新的 LibreOffice Deb 文件夹。要开始手动安装 LibreOffice，运行下面的命令。

    sudo dpkg -i LibreOffice_*/DEBS/*.deb

运行上面的命令后，LibreOffice 将被安装并可以使用了。
 
接下来，进入 Unity Dash 并启动 LibreOffice。以上就是指导你在 Ubuntu 中手动安装 LibreOffice 的方法。

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/libreofficemanualinstall1.png)

如果在 Ubuntu 中手动安装 LibreOffice，很有可能每次有版本更新和安全更新时你必须手动更新。

或者你仅仅希望 Canonical（Ubuntu母公司）通过它的储存库进行 LibreOffice 的安装和补丁/更新管理。

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/01/daily-ubuntu-tips-how-to-manually-install-libreoffice-in-ubuntu/

译者：[乌龙茶](https://github.com/yechunxiao19) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.libreoffice.org/download/
